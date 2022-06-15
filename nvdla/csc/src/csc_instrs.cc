// =============================================================================
// MIT License
//
// Copyright (c) 2022 Princeton University
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
// =============================================================================

// File: csc_instrs.cc

#include <ilang/ilang++.h>

#include <csc_config.h>

namespace ilang {

void DefineCSCInstrs(Ila& m) {
    // m.AddInit(m.state(NVDLA_CSC_S_STATUS_0) == BvConst(0, 2));
    // m.AddInit(m.state(NVDLA_CSC_S_STATUS_1) == BvConst(0, 2));

    auto csb_addr = Extract(Concat(m.input("csb_addr"), BvConst(0,2)), 11, 0);
    auto csb_valid = (m.state("csb_rdy") == BvConst(1,1)) & (m.input("csb_vld") == BvConst(1,1));
    auto csb_write = m.input("csb_write") == BvConst(1,1);
    auto group0_unset = m.state(GetVarName("group0_", NVDLA_CSC_D_OP_ENABLE)) == BvConst(0,1);
    auto group1_unset = m.state(GetVarName("group1_", NVDLA_CSC_D_OP_ENABLE)) == BvConst(0,1);
    auto producer = m.state(NVDLA_CSC_S_PRODUCER);
    auto consumer = m.state(NVDLA_CSC_S_CONSUMER);
    auto csc_state = m.state("csc_state");

    // Status: 3
    // 1: IDLE
    // 2: Producer (op_enable) and Consumer
    // 3: Producer (op_enable) but not consumer

    // CSB MMIO
    { // 0004
        auto instr = m.NewInstr("Set_Producer");
        instr.SetDecode(csb_addr == 0x004 & csb_valid & csb_write);

        instr.SetUpdate(producer, Extract(m.input("csb_data"), 0, 0));
    }

    { // 005c_group0
        auto instr = m.NewInstr("Set_Bank_Group0");
        instr.SetDecode(csb_addr == 0x05c & csb_valid & csb_write & producer == BvConst(0,1) & group0_unset);

        instr.SetUpdate(m.state(GetVarName("group0_", NVDLA_CSC_D_DATA_BANK)), Extract(m.input("csb_data"), 3, 0));
        instr.SetUpdate(m.state(GetVarName("group0_", NVDLA_CSC_D_WEIGHT_BANK)), Extract(m.input("csb_data"), 19, 16));
    }

    { // 005c_group1
        auto instr = m.NewInstr("Set_Bank_Group1");
        instr.SetDecode(csb_addr == 0x05c & csb_valid & csb_write & producer == BvConst(1,1) & group1_unset);

        instr.SetUpdate(m.state(GetVarName("group1_", NVDLA_CSC_D_DATA_BANK)), Extract(m.input("csb_data"), 3, 0));
        instr.SetUpdate(m.state(GetVarName("group1_", NVDLA_CSC_D_WEIGHT_BANK)), Extract(m.input("csb_data"), 19, 16));
    }

    { // 0008_group0
        auto instr = m.NewInstr("Set_Start_Group0");
        instr.SetDecode(csb_addr == 0x008 & csb_valid & csb_write & producer == BvConst(0,1) & group0_unset);

        instr.SetUpdate(m.state(GetVarName("group0_", NVDLA_CSC_D_OP_ENABLE)), Extract(m.input("csb_data"), 0, 0));
    }
    
    { // 0008_group1
        auto instr = m.NewInstr("Set_Start_Group1");
        instr.SetDecode(csb_addr == 0x008 & csb_valid & csb_write & producer == BvConst(1,1) & group1_unset);

        instr.SetUpdate(m.state(GetVarName("group1_", NVDLA_CSC_D_OP_ENABLE)), Extract(m.input("csb_data"), 0, 0));
    }

    { // Start from IDLE
        auto instr = m.NewInstr("Start");
        auto group0_ok = consumer == BvConst(0,1) & m.state(GetVarName("group0_", NVDLA_CSC_D_OP_ENABLE)) == BvConst(1,1);
        auto group1_ok = consumer == BvConst(1,1) & m.state(GetVarName("group1_", NVDLA_CSC_D_OP_ENABLE)) == BvConst(1,1);
        instr.SetDecode(csc_state == IDLE & (group0_ok | group1_ok));

        auto pending0 = consumer == BvConst(0,1) & (m.state(GetVarName("group0_", NVDLA_CSC_D_DATA_BANK)) != m.state("last_data_bank") | 
                                                   m.state(GetVarName("group0_", NVDLA_CSC_D_WEIGHT_BANK)) != m.state("last_weight_bank") );
        auto pending1 = consumer == BvConst(1,1) & (m.state(GetVarName("group1_", NVDLA_CSC_D_DATA_BANK)) != m.state("last_data_bank") | 
                                                   m.state(GetVarName("group1_", NVDLA_CSC_D_WEIGHT_BANK)) != m.state("last_weight_bank") );
        auto need_pending = pending0 | pending1;
        instr.SetUpdate(csc_state, Ite(need_pending, PEND, BUSY));
    }

    { // Pend2Busy
        auto instr = m.NewInstr("Pend2Busy");
        instr.SetDecode(csc_state == PEND & m.input("pending_clr") == BvConst(1,1));
        instr.SetUpdate(csc_state, BUSY);
    }

    { // DataOutput 21 cycles
      // Abstract the data computation
        auto instr = m.NewInstr("Data_Output");
        instr.SetDecode(csc_state == BUSY & m.input("sg2dl_vld") == BvConst(1,1));
        instr.SetUpdate(m.state("data_valid"), BvConst(1, 1));
    }

    { // WeightOutput 21 cycles
      // Abstract the data computation
        auto instr = m.NewInstr("Weight_Output");
        instr.SetDecode(csc_state == BUSY & m.input("sg2wt_vld") == BvConst(1,1));
        instr.SetUpdate(m.state("weight_valid"), BvConst(1, 1));
    }

    { // Busy2Done
        auto instr = m.NewInstr("Busy2Done");
        instr.SetDecode(csc_state == BUSY & m.input("fifo_clr"));

        instr.SetUpdate(csc_state, DONE);
    }

    { // Done2Idle0
        auto instr = m.NewInstr("Done2Idle_0");
        instr.SetDecode(csc_state == DONE & m.input("done") & consumer == BvConst(0,1));

        instr.SetUpdate(csc_state, IDLE);
        instr.SetUpdate(consumer, BvConst(1,1));
        instr.SetUpdate(m.state("last_data_bank"), m.state(GetVarName("group0_", NVDLA_CSC_D_DATA_BANK)));
        instr.SetUpdate(m.state("last_weight_bank"), m.state(GetVarName("group0_", NVDLA_CSC_D_WEIGHT_BANK)));

        instr.SetUpdate(m.state(GetVarName("group0_", NVDLA_CSC_D_OP_ENABLE)), BvConst(0,1));
    }

    { // Done2Idle1
        auto instr = m.NewInstr("Done2Idle_1");
        instr.SetDecode(csc_state == DONE & m.input("done") & consumer == BvConst(1,1));

        instr.SetUpdate(csc_state, IDLE);
        instr.SetUpdate(consumer, BvConst(0,1));
        instr.SetUpdate(m.state("last_data_bank"), m.state(GetVarName("group1_", NVDLA_CSC_D_DATA_BANK)));
        instr.SetUpdate(m.state("last_weight_bank"), m.state(GetVarName("group1_", NVDLA_CSC_D_WEIGHT_BANK)));

        instr.SetUpdate(m.state(GetVarName("group1_", NVDLA_CSC_D_OP_ENABLE)), BvConst(0,1));
    }

}


} // namespace ilang