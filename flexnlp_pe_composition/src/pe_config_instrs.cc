// =============================================================================
// MIT License
//
// Copyright (c) 2019 Princeton University
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

// File: config_instr_pe_core.cc

#include <ilang/ilang++.h>

#include <flex.h>
#include <util.h>

namespace ilang {

namespace flex {

void DefinePECoreConfigInstr(Ila& m, const int& pe_idx) {
  auto is_write = m.input(PE_RW);
  auto receive = m.input("rva_in_valid") & m.state("rva_in_ready");

  // PE Core specific
  // - Core cluster table first
  // - Core cluster table second
  // - Core memory manager first
  // - Core memory manager second
  // - Core RNN layer sizing

  { // CLUSTER_TABLE_FIRST
    auto instr =
        m.NewInstr(PEGetInstrName(pe_idx, "CONFIG_CLUSTER_TABLE_FIRST"));
    SetDecodeForPECoreConfigWr(CONFIG_ADDR_PE_CLUSTER_TABLE_FIRST);

    for (auto i = 0; i < 16; i ++ ) {
        auto Entry_next = m.input(VectorVarName(i, TOP_DATA_IN));
        SetUpdateForConfigWr(
        m, instr, Entry_next, VectorVarName(i, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY));
    }

    // // add a memstate to help optimize access of these registers
    // // auto ct_0_mem = m.state(PEGetVarName(pe_idx, CLUSTER_TABLE_0_STATE_MEM));
    // // auto // ct_0_mem_next = ct_0_mem;
    //
    // // update for Entry0
    // auto Entry0_next = m.input(TOP_DATA_IN_0);
    // SetUpdateForConfigWr(
    //     m, instr, Entry0_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY0));
    // //// ct_0_mem_next = Store(// ct_0_mem_next, BvConst(0, TOP_ADDR_IN_WIDTH), Entry0_next);
    //
    // // update for Entry1
    // auto Entry1_next = m.input(TOP_DATA_IN_1);
    // SetUpdateForConfigWr(
    //     m, instr, Entry1_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY1));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(1, TOP_ADDR_IN_WIDTH), Entry1_next);
    //
    // // update for Entry2
    // auto Entry2_next = m.input(TOP_DATA_IN_2);
    // SetUpdateForConfigWr(
    //     m, instr, Entry2_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY2));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(2, TOP_ADDR_IN_WIDTH), Entry2_next);
    //
    // // update for Entry3
    // auto Entry3_next = m.input(TOP_DATA_IN_3);
    // SetUpdateForConfigWr(
    //     m, instr, Entry3_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY3));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(3, TOP_ADDR_IN_WIDTH), Entry3_next);
    //
    // // update for Entry4
    // auto Entry4_next = m.input(TOP_DATA_IN_4);
    // SetUpdateForConfigWr(
    //     m, instr, Entry4_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY4));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(4, TOP_ADDR_IN_WIDTH), Entry4_next);
    //
    // // update for Entry5
    // auto Entry5_next = m.input(TOP_DATA_IN_5);
    // SetUpdateForConfigWr(
    //     m, instr, Entry5_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY5));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(5, TOP_ADDR_IN_WIDTH), Entry5_next);
    //
    // // update for Entry6
    // auto Entry6_next = m.input(TOP_DATA_IN_6);
    // SetUpdateForConfigWr(
    //     m, instr, Entry6_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY6));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(6, TOP_ADDR_IN_WIDTH), Entry6_next);
    //
    // // update for Entry7
    // auto Entry7_next = m.input(TOP_DATA_IN_7);
    // SetUpdateForConfigWr(
    //     m, instr, Entry7_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY7));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(7, TOP_ADDR_IN_WIDTH), Entry7_next);
    //
    // // update for Entry8
    // auto Entry8_next = m.input(TOP_DATA_IN_8);
    // SetUpdateForConfigWr(
    //     m, instr, Entry8_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY8));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(8, TOP_ADDR_IN_WIDTH), Entry8_next);
    //
    // // update for Entry9
    // auto Entry9_next = m.input(TOP_DATA_IN_9);
    // SetUpdateForConfigWr(
    //     m, instr, Entry9_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY9));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(9, TOP_ADDR_IN_WIDTH), Entry9_next);
    //
    // // update for Entry10
    // auto Entry10_next = m.input(TOP_DATA_IN_10);
    // SetUpdateForConfigWr(
    //     m, instr, Entry10_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY10));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(10, TOP_ADDR_IN_WIDTH), Entry10_next);
    //
    // // update for Entry11
    // auto Entry11_next = m.input(TOP_DATA_IN_11);
    // SetUpdateForConfigWr(
    //     m, instr, Entry11_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY11));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(11, TOP_ADDR_IN_WIDTH), Entry11_next);
    //
    // // update for Entry12
    // auto Entry12_next = m.input(TOP_DATA_IN_12);
    // SetUpdateForConfigWr(
    //     m, instr, Entry12_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY12));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(12, TOP_ADDR_IN_WIDTH), Entry12_next);
    //
    // // update for Entry13
    // auto Entry13_next = m.input(TOP_DATA_IN_13);
    // SetUpdateForConfigWr(
    //     m, instr, Entry13_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY13));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(13, TOP_ADDR_IN_WIDTH), Entry13_next);
    //
    // // update for Entry14
    // auto Entry14_next = m.input(TOP_DATA_IN_14);
    // SetUpdateForConfigWr(
    //     m, instr, Entry14_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY14));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(14, TOP_ADDR_IN_WIDTH), Entry14_next);
    //
    // // update for Entry15
    // auto Entry15_next = m.input(TOP_DATA_IN_15);
    // SetUpdateForConfigWr(
    //     m, instr, Entry15_next,
    //     PEGetVarName(pe_idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY15));
    // // ct_0_mem_next = Store(// ct_0_mem_next, BvConst(15, TOP_ADDR_IN_WIDTH), Entry15_next);
    //
    // // instr.SetUpdate(ct_0_mem, // ct_0_mem_next);
  }
  
  { // CLUSTER_TABLE_SECOND
    auto instr =
        m.NewInstr(PEGetInstrName(pe_idx, "CONFIG_CLUSTER_TABLE_SECOND"));
    SetDecodeForPECoreConfigWr(CONFIG_ADDR_PE_CLUSTER_TABLE_SECOND);

    for (auto i = 0; i < 16; i ++ ) {
        auto Entry_next = m.input(VectorVarName(i, TOP_DATA_IN));
        SetUpdateForConfigWr(
        m, instr, Entry_next, VectorVarName(i, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY));
    }
    
    // //auto ct_1_mem = m.state(PEGetVarName(pe_idx, CLUSTER_TABLE_1_STATE_MEM));
        // //auto // ct_1_mem_next = ct_1_mem;
        // // update for Entry0
        // auto Entry0_next = m.input(TOP_DATA_IN_0);
        // SetUpdateForConfigWr(
        //     m, instr, Entry0_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY0));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(0, TOP_ADDR_IN_WIDTH), Entry0_next);
        //
        // // update for Entry1
        // auto Entry1_next = m.input(TOP_DATA_IN_1);
        // SetUpdateForConfigWr(
        //     m, instr, Entry1_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY1));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(1, TOP_ADDR_IN_WIDTH), Entry1_next);
        //
        // // update for Entry2
        // auto Entry2_next = m.input(TOP_DATA_IN_2);
        // SetUpdateForConfigWr(
        //     m, instr, Entry2_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY2));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(2, TOP_ADDR_IN_WIDTH), Entry2_next);
        //
        // // update for Entry3
        // auto Entry3_next = m.input(TOP_DATA_IN_3);
        // SetUpdateForConfigWr(
        //     m, instr, Entry3_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY3));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(3, TOP_ADDR_IN_WIDTH), Entry3_next);
        //
        // // update for Entry4
        // auto Entry4_next = m.input(TOP_DATA_IN_4);
        // SetUpdateForConfigWr(
        //     m, instr, Entry4_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY4));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(4, TOP_ADDR_IN_WIDTH), Entry4_next);
        //
        // // update for Entry5
        // auto Entry5_next = m.input(TOP_DATA_IN_5);
        // SetUpdateForConfigWr(
        //     m, instr, Entry5_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY5));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(5, TOP_ADDR_IN_WIDTH), Entry5_next);
        //
        // // update for Entry6
        // auto Entry6_next = m.input(TOP_DATA_IN_6);
        // SetUpdateForConfigWr(
        //     m, instr, Entry6_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY6));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(6, TOP_ADDR_IN_WIDTH), Entry6_next);
        //
        // // update for Entry7
        // auto Entry7_next = m.input(TOP_DATA_IN_7);
        // SetUpdateForConfigWr(
        //     m, instr, Entry7_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY7));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(7, TOP_ADDR_IN_WIDTH), Entry7_next);
        //
        // // update for Entry8
        // auto Entry8_next = m.input(TOP_DATA_IN_8);
        // SetUpdateForConfigWr(
        //     m, instr, Entry8_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY8));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(8, TOP_ADDR_IN_WIDTH), Entry8_next);
        //
        // // update for Entry9
        // auto Entry9_next = m.input(TOP_DATA_IN_9);
        // SetUpdateForConfigWr(
        //     m, instr, Entry9_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY9));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(9, TOP_ADDR_IN_WIDTH), Entry9_next);
        //
        // // update for Entry10
        // auto Entry10_next = m.input(TOP_DATA_IN_10);
        // SetUpdateForConfigWr(
        //     m, instr, Entry10_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY10));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(10, TOP_ADDR_IN_WIDTH), Entry10_next);
        //
        // // update for Entry11
        // auto Entry11_next = m.input(TOP_DATA_IN_11);
        // SetUpdateForConfigWr(
        //     m, instr, Entry11_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY11));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(11, TOP_ADDR_IN_WIDTH), Entry11_next);
        //
        // // update for Entry12
        // auto Entry12_next = m.input(TOP_DATA_IN_12);
        // SetUpdateForConfigWr(
        //     m, instr, Entry12_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY12));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(12, TOP_ADDR_IN_WIDTH), Entry12_next);
        //
        // // update for Entry13
        // auto Entry13_next = m.input(TOP_DATA_IN_13);
        // SetUpdateForConfigWr(
        //     m, instr, Entry13_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY13));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(13, TOP_ADDR_IN_WIDTH), Entry13_next);
        //
        // // update for Entry14
        // auto Entry14_next = m.input(TOP_DATA_IN_14);
        // SetUpdateForConfigWr(
        //     m, instr, Entry14_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY14));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(14, TOP_ADDR_IN_WIDTH), Entry14_next);
        //
        // // update for Entry15
        // auto Entry15_next = m.input(TOP_DATA_IN_15);
        // SetUpdateForConfigWr(
        //     m, instr, Entry15_next,
        //     PEGetVarName(pe_idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY15));
        // // ct_1_mem_next = Store(// ct_1_mem_next, BvConst(15, TOP_ADDR_IN_WIDTH), Entry15_next);
        //
        // // instr.SetUpdate(ct_1_mem, // ct_1_mem_next);
  }


  { // MEM_MNGR_FIRST
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "CONFIG_MEM_MNGR_FIRST"));
    SetDecodeForPECoreConfigWr(CONFIG_ADDR_PE_MEM_MNGR_FIRST);

    // update for zero_active
    auto zero_active_next = m.input(TOP_DATA_IN_0);
    SetUpdateForConfigWr(
        m, instr, zero_active_next,
        PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_ZERO_ACTIVE));

    // update for adpfloat_bias_w
    auto adpfloat_bias_w_next = m.input(TOP_DATA_IN_1);
    SetUpdateForConfigWr(
        m, instr, adpfloat_bias_w_next,
        PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_ADPFLOAT_BIAS_W));

    // update for adpfloat_bias_b
    auto adpfloat_bias_b_next = m.input(TOP_DATA_IN_2);
    SetUpdateForConfigWr(
        m, instr, adpfloat_bias_b_next,
        PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_ADPFLOAT_BIAS_B));

    // update for adpfloat_bias_i
    auto adpfloat_bias_i_next = m.input(TOP_DATA_IN_3);
    SetUpdateForConfigWr(
        m, instr, adpfloat_bias_i_next,
        PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_ADPFLOAT_BIAS_I));

    // update for num_input
    auto num_input_next =
        Concat(m.input(TOP_DATA_IN_5), m.input(TOP_DATA_IN_4));
    SetUpdateForConfigWr(
        m, instr, num_input_next,
        PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_NUM_INPUT));

    // update for base_weight
    auto base_weight_next =
        Concat(m.input(TOP_DATA_IN_7), m.input(TOP_DATA_IN_6));
    SetUpdateForConfigWr(
        m, instr, base_weight_next,
        PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_BASE_WEIGHT));

    // update for base_bias
    auto base_bias_next =
        Concat(m.input(TOP_DATA_IN_9), m.input(TOP_DATA_IN_8));
    SetUpdateForConfigWr(
        m, instr, base_bias_next,
        PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_BASE_BIAS));

    // update for base_input
    auto base_input_next =
        Concat(m.input(TOP_DATA_IN_11), m.input(TOP_DATA_IN_10));
    SetUpdateForConfigWr(
        m, instr, base_input_next,
        PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_BASE_INPUT));
  }

  { // MEM_MNGR_SECOND
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "CONFIG_MEM_MNGR_SECOND"));
    SetDecodeForPECoreConfigWr(CONFIG_ADDR_PE_MEM_MNGR_SECOND);

    // update for zero_active
    auto zero_active_next = m.input(TOP_DATA_IN_0);
    SetUpdateForConfigWr(
        m, instr, zero_active_next,
        PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_ZERO_ACTIVE));

    // update for adpfloat_bias_w
    auto adpfloat_bias_w_next = m.input(TOP_DATA_IN_1);
    SetUpdateForConfigWr(
        m, instr, adpfloat_bias_w_next,
        PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_ADPFLOAT_BIAS_W));

    // update for adpfloat_bias_b
    auto adpfloat_bias_b_next = m.input(TOP_DATA_IN_2);
    SetUpdateForConfigWr(
        m, instr, adpfloat_bias_b_next,
        PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_ADPFLOAT_BIAS_B));

    // update for adpfloat_bias_i
    auto adpfloat_bias_i_next = m.input(TOP_DATA_IN_3);
    SetUpdateForConfigWr(
        m, instr, adpfloat_bias_i_next,
        PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_ADPFLOAT_BIAS_I));

    // update for num_input
    auto num_input_next =
        Concat(m.input(TOP_DATA_IN_5), m.input(TOP_DATA_IN_4));
    SetUpdateForConfigWr(
        m, instr, num_input_next,
        PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_NUM_INPUT));

    // update for base_weight
    auto base_weight_next =
        Concat(m.input(TOP_DATA_IN_7), m.input(TOP_DATA_IN_6));
    SetUpdateForConfigWr(
        m, instr, base_weight_next,
        PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_BASE_WEIGHT));

    // update for base_bias
    auto base_bias_next =
        Concat(m.input(TOP_DATA_IN_9), m.input(TOP_DATA_IN_8));
    SetUpdateForConfigWr(
        m, instr, base_bias_next,
        PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_BASE_BIAS));

    // update for base_input
    auto base_input_next =
        Concat(m.input(TOP_DATA_IN_11), m.input(TOP_DATA_IN_10));
    SetUpdateForConfigWr(
        m, instr, base_input_next,
        PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_BASE_INPUT));
  }

  { // RNN_LAYER_SIZING
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "CONFIG_RNN_LAYER_SIZING"));
    SetDecodeForPECoreConfigWr(CONFIG_ADDR_PE_RNN_LAYER_SIZING);

    // update for is_valid
    auto is_valid_next = m.input(TOP_DATA_IN_0);
    SetUpdateForConfigWr(
        m, instr, is_valid_next,
        PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_IS_VALID));

    // update for is_zero_first
    auto is_zero_first_next = m.input(TOP_DATA_IN_1);
    SetUpdateForConfigWr(
        m, instr, is_zero_first_next,
        PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_IS_ZERO_FIRST));

    // update for is_cluster
    auto is_cluster_next = m.input(TOP_DATA_IN_2);
    SetUpdateForConfigWr(
        m, instr, is_cluster_next,
        PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_IS_CLUSTER));

    // update for is_bias
    auto is_bias_next = m.input(TOP_DATA_IN_3);
    SetUpdateForConfigWr(
        m, instr, is_bias_next,
        PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_IS_BIAS));

    // update for num_manager
    auto num_manager_next = m.input(TOP_DATA_IN_4);
    SetUpdateForConfigWr(
        m, instr, num_manager_next,
        PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_NUM_MANAGER));

    // update for num_output
    auto num_output_next = m.input(TOP_DATA_IN_5);
    SetUpdateForConfigWr(
        m, instr, num_output_next,
        PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_NUM_OUTPUT));
  }
}

void DefinePEActConfigInstr(Ila& m, const int& pe_idx) {
  auto is_write = m.input(PE_RW);
  auto receive = m.input("rva_in_valid") & m.state("rva_in_ready");

  // PE ActUnit specific
  // - ActUnit manager
  // - ActUnit vector 0-15
  // - ActUnit vector 16-31

  { // ACT_MNGR
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "CONFIG_ACT_MNGR"));
    SetDecodeForPEActConfigWr(CONFIG_ADDR_PE_ACT_MNGR);

    // update for is_valid
    auto is_valid_next = m.input(TOP_DATA_IN_0);
    SetUpdateForConfigWr(m, instr, is_valid_next,
                         PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_IS_VALID));

    // update for is_zero_first
    auto is_zero_first_next = m.input(TOP_DATA_IN_1);
    SetUpdateForConfigWr(
        m, instr, is_zero_first_next,
        PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_IS_ZERO_FIRST));

    // update for adpfloat_bias
    auto adpfloat_bias_next = m.input(TOP_DATA_IN_2);
    SetUpdateForConfigWr(
        m, instr, adpfloat_bias_next,
        PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_ADPFLOAT_BIAS));

    // update for num_inst
    auto num_inst_next = m.input(TOP_DATA_IN_3);
    SetUpdateForConfigWr(m, instr, num_inst_next,
                         PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_NUM_INST));

    // update for num_output
    auto num_output_next = m.input(TOP_DATA_IN_4);
    SetUpdateForConfigWr(m, instr, num_output_next,
                         PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_NUM_OUTPUT));

    // update for buffer_addr_base
    auto buffer_addr_base_next =
        Concat(m.input(TOP_DATA_IN_7), m.input(TOP_DATA_IN_6));
    SetUpdateForConfigWr(
        m, instr, buffer_addr_base_next,
        PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_BUFFER_ADDR_BASE));

    // update for output_addr_base
    auto output_addr_base_next = m.input(TOP_DATA_IN_8);
    SetUpdateForConfigWr(
        m, instr, output_addr_base_next,
        PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_OUTPUT_ADDR_BASE));
  }

  { // ACT_VECTOR_0_15
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "CONFIG_ACT_VECTOR_0_15"));
    SetDecodeForPEActConfigWr(CONFIG_ADDR_PE_ACT_VECTOR_0_15);

    // auto act_v_mem = m.state(PEGetVarName(pe_idx, ACT_VECTOR_STATE_MEM));
    // auto act_v_mem_next = act_v_mem;

    // update for inst0-15
    for (auto i = 0; i < 16; i++) {
        auto Inst_next = m.input(VectorVarName(i, TOP_DATA_IN));
        SetUpdateForConfigWr(
        m, instr, Inst_next,
        VectorVarName(i, ACT_VECTOR_0_15_CONFIG_REG_INST));
    }

    // // update for Inst0
    // auto Inst0_next = m.input(TOP_DATA_IN_0);
    // SetUpdateForConfigWr(
    //     m, instr, Inst0_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST0));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(0, TOP_ADDR_IN_WIDTH), Inst0_next);

    // // update for Inst1
    // auto Inst1_next = m.input(TOP_DATA_IN_1);
    // SetUpdateForConfigWr(
    //     m, instr, Inst1_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST1));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(1, TOP_ADDR_IN_WIDTH), Inst1_next);

    // // update for Inst2
    // auto Inst2_next = m.input(TOP_DATA_IN_2);
    // SetUpdateForConfigWr(
    //     m, instr, Inst2_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST2));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(2, TOP_ADDR_IN_WIDTH), Inst2_next);

    // // update for Inst3
    // auto Inst3_next = m.input(TOP_DATA_IN_3);
    // SetUpdateForConfigWr(
    //     m, instr, Inst3_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST3));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(3, TOP_ADDR_IN_WIDTH), Inst3_next);

    // // update for Inst4
    // auto Inst4_next = m.input(TOP_DATA_IN_4);
    // SetUpdateForConfigWr(
    //     m, instr, Inst4_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST4));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(4, TOP_ADDR_IN_WIDTH), Inst4_next);

    // // update for Inst5
    // auto Inst5_next = m.input(TOP_DATA_IN_5);
    // SetUpdateForConfigWr(
    //     m, instr, Inst5_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST5));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(5, TOP_ADDR_IN_WIDTH), Inst5_next);

    // // update for Inst6
    // auto Inst6_next = m.input(TOP_DATA_IN_6);
    // SetUpdateForConfigWr(
    //     m, instr, Inst6_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST6));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(6, TOP_ADDR_IN_WIDTH), Inst6_next);

    // // update for Inst7
    // auto Inst7_next = m.input(TOP_DATA_IN_7);
    // SetUpdateForConfigWr(
    //     m, instr, Inst7_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST7));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(7, TOP_ADDR_IN_WIDTH), Inst7_next);

    // // update for Inst8
    // auto Inst8_next = m.input(TOP_DATA_IN_8);
    // SetUpdateForConfigWr(
    //     m, instr, Inst8_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST8));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(8, TOP_ADDR_IN_WIDTH), Inst8_next);

    // // update for Inst9
    // auto Inst9_next = m.input(TOP_DATA_IN_9);
    // SetUpdateForConfigWr(
    //     m, instr, Inst9_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST9));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(9, TOP_ADDR_IN_WIDTH), Inst9_next);

    // // update for Inst10
    // auto Inst10_next = m.input(TOP_DATA_IN_10);
    // SetUpdateForConfigWr(
    //     m, instr, Inst10_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST10));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(10, TOP_ADDR_IN_WIDTH), Inst10_next);

    // // update for Inst11
    // auto Inst11_next = m.input(TOP_DATA_IN_11);
    // SetUpdateForConfigWr(
    //     m, instr, Inst11_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST11));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(11, TOP_ADDR_IN_WIDTH), Inst11_next);

    // // update for Inst12
    // auto Inst12_next = m.input(TOP_DATA_IN_12);
    // SetUpdateForConfigWr(
    //     m, instr, Inst12_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST12));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(12, TOP_ADDR_IN_WIDTH), Inst12_next);

    // // update for Inst13
    // auto Inst13_next = m.input(TOP_DATA_IN_13);
    // SetUpdateForConfigWr(
    //     m, instr, Inst13_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST13));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(13, TOP_ADDR_IN_WIDTH), Inst13_next);

    // // update for Inst14
    // auto Inst14_next = m.input(TOP_DATA_IN_14);
    // SetUpdateForConfigWr(
    //     m, instr, Inst14_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST14));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(14, TOP_ADDR_IN_WIDTH), Inst14_next);

    // // update for Inst15
    // auto Inst15_next = m.input(TOP_DATA_IN_15);
    // SetUpdateForConfigWr(
    //     m, instr, Inst15_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_0_15_CONFIG_REG_INST15));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(15, TOP_ADDR_IN_WIDTH), Inst15_next);

    // instr.SetUpdate(act_v_mem, act_v_mem_next);
  }
  

  { // ACT_VECTOR_16_31
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "CONFIG_ACT_VECTOR_16_31"));
    SetDecodeForPEActConfigWr(CONFIG_ADDR_PE_ACT_VECTOR_16_31);

    // auto act_v_mem = m.state(PEGetVarName(pe_idx, ACT_VECTOR_STATE_MEM));
    // auto act_v_mem_next = act_v_mem;

    // update for inst16-31
    for (auto i = 0; i < 16; i++) {
        auto Inst_next = m.input(VectorVarName(i, TOP_DATA_IN));
        SetUpdateForConfigWr(
        m, instr, Inst_next,
        VectorVarName(i, ACT_VECTOR_16_31_CONFIG_REG_INST));
    }

    // // update for Inst0
    // auto Inst0_next = m.input(TOP_DATA_IN_0);
    // SetUpdateForConfigWr(
    //     m, instr, Inst0_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST0));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(16, TOP_ADDR_IN_WIDTH), Inst0_next);

    // // update for Inst1
    // auto Inst1_next = m.input(TOP_DATA_IN_1);
    // SetUpdateForConfigWr(
    //     m, instr, Inst1_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST1));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(17, TOP_ADDR_IN_WIDTH), Inst1_next);

    // // update for Inst2
    // auto Inst2_next = m.input(TOP_DATA_IN_2);
    // SetUpdateForConfigWr(
    //     m, instr, Inst2_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST2));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(18, TOP_ADDR_IN_WIDTH), Inst2_next);

    // // update for Inst3
    // auto Inst3_next = m.input(TOP_DATA_IN_3);
    // SetUpdateForConfigWr(
    //     m, instr, Inst3_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST3));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(19, TOP_ADDR_IN_WIDTH), Inst3_next);

    // // update for Inst4
    // auto Inst4_next = m.input(TOP_DATA_IN_4);
    // SetUpdateForConfigWr(
    //     m, instr, Inst4_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST4));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(20, TOP_ADDR_IN_WIDTH), Inst4_next);

    // // update for Inst5
    // auto Inst5_next = m.input(TOP_DATA_IN_5);
    // SetUpdateForConfigWr(
    //     m, instr, Inst5_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST5));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(21, TOP_ADDR_IN_WIDTH), Inst5_next);

    // // update for Inst6
    // auto Inst6_next = m.input(TOP_DATA_IN_6);
    // SetUpdateForConfigWr(
    //     m, instr, Inst6_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST6));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(22, TOP_ADDR_IN_WIDTH), Inst6_next);

    // // update for Inst7
    // auto Inst7_next = m.input(TOP_DATA_IN_7);
    // SetUpdateForConfigWr(
    //     m, instr, Inst7_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST7));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(23, TOP_ADDR_IN_WIDTH), Inst7_next);

    // // update for Inst8
    // auto Inst8_next = m.input(TOP_DATA_IN_8);
    // SetUpdateForConfigWr(
    //     m, instr, Inst8_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST8));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(24, TOP_ADDR_IN_WIDTH), Inst8_next);

    // // update for Inst9
    // auto Inst9_next = m.input(TOP_DATA_IN_9);
    // SetUpdateForConfigWr(
    //     m, instr, Inst9_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST9));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(25, TOP_ADDR_IN_WIDTH), Inst9_next);

    // // update for Inst10
    // auto Inst10_next = m.input(TOP_DATA_IN_10);
    // SetUpdateForConfigWr(
    //     m, instr, Inst10_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST10));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(26, TOP_ADDR_IN_WIDTH), Inst10_next);

    // // update for Inst11
    // auto Inst11_next = m.input(TOP_DATA_IN_11);
    // SetUpdateForConfigWr(
    //     m, instr, Inst11_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST11));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(27, TOP_ADDR_IN_WIDTH), Inst11_next);

    // // update for Inst12
    // auto Inst12_next = m.input(TOP_DATA_IN_12);
    // SetUpdateForConfigWr(
    //     m, instr, Inst12_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST12));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(28, TOP_ADDR_IN_WIDTH), Inst12_next);

    // // update for Inst13
    // auto Inst13_next = m.input(TOP_DATA_IN_13);
    // SetUpdateForConfigWr(
    //     m, instr, Inst13_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST13));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(29, TOP_ADDR_IN_WIDTH), Inst13_next);

    // // update for Inst14
    // auto Inst14_next = m.input(TOP_DATA_IN_14);
    // SetUpdateForConfigWr(
    //     m, instr, Inst14_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST14));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(30, TOP_ADDR_IN_WIDTH), Inst14_next);

    // // update for Inst15
    // auto Inst15_next = m.input(TOP_DATA_IN_15);
    // SetUpdateForConfigWr(
    //     m, instr, Inst15_next,
    //     PEGetVarName(pe_idx, ACT_VECTOR_16_31_CONFIG_REG_INST15));
    // act_v_mem_next = Store(act_v_mem_next, BvConst(31, TOP_ADDR_IN_WIDTH), Inst15_next);

    // instr.SetUpdate(act_v_mem, act_v_mem_next);
  }
}

} // namespace flex

} // namespace ilang
