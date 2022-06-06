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

// File: pe_act.cc

#include <vector>

#include <flex.h>
#include <uninterpreted_func.h>
#include <util.h>

namespace ilang {

namespace flex {

// declare a child ILA to organize the child instructions of PE Activation unit.
void AddChildPEAct(Ila& m, const int& pe_idx, const uint64_t& base);

// helper functions
// help declare a vector of ExprRef holding the next state variables of PE
// registers std::vector<ExprRef> PEActGetRegNext(Ila& child, const int&
// pe_idx); function to load the data from the PE Act Register
ExprRef PEActRegLoad_v(Ila& child, const int& pe_idx, const ExprRef& reg_idx,
                       const ExprRef& addr);

void IncrementInst (Ila& m, InstrRef& instr, const int& pe_idx);

// Increment Operation Function

void DefinePEAct(Ila& m, const int& pe_idx) {
  
  auto config_valid =
      (m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_IS_VALID)) ==
       PE_ACT_VALID);
  
  auto pe_start = m.input("act_start");
      
  // internal states
  auto is_start_reg = m.NewBvState(PEGetVarName(pe_idx, ACT_IS_START_REG),
                                       PE_ACT_IS_START_REG_BITWIDTH);
  auto instr_cntr = m.NewBvState(PEGetVarName(pe_idx, ACT_INSTR_COUNTER),
                                     PE_ACT_INSTR_COUNTER_BITWIDTH);
  auto output_cntr = m.NewBvState(PEGetVarName(pe_idx, ACT_OUTPUT_COUNTER),
                                      PE_ACT_OUTPUT_COUNTER_BITWIDTH);
  auto state = m.NewBvState(PEGetVarName(pe_idx, ACT_STATE), PE_ACT_STATE_BITWIDTH);

  // configure states
  auto num_instr = m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_NUM_INST));
  auto num_output = m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_NUM_OUTPUT));
  
  // Decode of Instructions
  auto current_instr = PEActInstrFetch(m, pe_idx, instr_cntr);
  auto a1 = Extract(current_instr, PE_ACT_REG_A1_HI_IDX, PE_ACT_REG_A1_LO_IDX);
  auto a2 = Extract(current_instr, PE_ACT_REG_A2_HI_IDX, PE_ACT_REG_A2_LO_IDX);
  auto op = Extract(current_instr, PE_ACT_OP_HI_IDX, PE_ACT_OP_LO_IDX);

  // define the register array as memory here: 4x16x20
  for (auto i = 0; i < PE_ACT_REGS_NUM; i++) {
    m.NewMemState(PEGetVarNameVector(pe_idx, i, ACT_REGS),
                      PE_ACT_REGS_ADDR_WIDTH, PE_CORE_ACT_VECTOR_BITWIDTH);
  }

  // define the temp register array for holding the data to be stored in to the
  // data
  for (auto i = 0; i < ACT_SCALAR; i++) {
    m.NewBvState(PEGetVarNameVector(pe_idx, i, ACT_REG_TEMP),
                     PE_CORE_ACT_VECTOR_BITWIDTH);
  }

  // m initial conditions
  m.AddInit(is_start_reg == PE_ACT_INVALID);
  m.AddInit(state == PE_ACT_STATE_IDLE);

  { // instr0 ---- initiate the act unit when receiving pe_start, reset states
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_initiate"));

    auto not_start_cond = (is_start_reg == PE_ACT_INVALID);
    auto pe_start_active = (pe_start == PE_ACT_VALID) & (m.input("act_start_valid") == PE_ACT_VALID) & (m.state("act_start_ready") == PE_ACT_VALID);
    auto state_idle = (state == PE_ACT_STATE_IDLE);

    instr.SetDecode(config_valid & not_start_cond & pe_start_active &
                    state_idle);

    // state updates
    instr.SetUpdate(is_start_reg,
                    BvConst(PE_ACT_VALID, PE_ACT_IS_START_REG_BITWIDTH));

    // reset counter
    instr.SetUpdate(instr_cntr, BvConst(0, PE_ACT_INSTR_COUNTER_BITWIDTH));
    instr.SetUpdate(output_cntr, BvConst(0, PE_ACT_OUTPUT_COUNTER_BITWIDTH));

    // // reset the act vector register
    // reset the act vector memory
    for (auto i = 0; i < PE_ACT_REGS_NUM; i++) {
      auto reg = m.state(PEGetVarNameVector(pe_idx, i, ACT_REGS));
      auto reg_next = reg;
      for (auto j = 0; j < ACT_SCALAR; j++) {
        auto zero = BvConst(0, PE_CORE_ACT_VECTOR_BITWIDTH);
        auto addr = BvConst(j, PE_ACT_REGS_ADDR_WIDTH) +
                    BvConst(0, PE_ACT_REGS_ADDR_WIDTH);
        reg_next = Store(reg_next, addr, zero + zero);
      }
      instr.SetUpdate(reg, reg_next);
    }

    // set the FSM state to execute
    instr.SetUpdate(state, BvConst(PE_ACT_STATE_EXEC, PE_ACT_STATE_BITWIDTH));
  }

  { // instr 1 ---- op 0x1, LOAD instruction with is_zero_first == 1
    auto instr =
        m.NewInstr(PEGetInstrName(pe_idx, "act_child_op_load_zero"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto state_exec = (state == PE_ACT_STATE_EXEC);
    auto op_load = (op == PE_ACT_OP_LOAD);
    auto is_zero_first =
        (m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_IS_ZERO_FIRST)) ==
         PE_ACT_VALID);

    instr.SetDecode(is_start & state_exec & op_load & is_zero_first);

    // next state
    // 0417 update: add a MEM FSM state to deal with memory store operation
    // instr.SetUpdate(state, BvConst(PE_ACT_STATE_INCR,
    // PE_ACT_STATE_BITWIDTH));
    IncrementInst (m, instr, pe_idx);

    for (auto i = 0; i < ACT_SCALAR; i++) {
      auto zero = BvConst(0, PE_CORE_ACT_VECTOR_BITWIDTH);
      auto data = zero + zero;
      auto reg_tmp = m.state(PEGetVarNameVector(pe_idx, i, ACT_REG_TEMP));
      instr.SetUpdate(reg_tmp, data);
    }
  }

  { // instr 2 ---- op 0x1, LOAD instruction with is_zero_first == 0
    // LOAD SRAM -> A2 load address is determined by the output_counter +
    // buffer_addr_base
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_op_load"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto state_exec = (state == PE_ACT_STATE_EXEC);
    auto op_load = (op == PE_ACT_OP_LOAD);
    auto no_zero_first =
        (m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_IS_ZERO_FIRST)) ==
         PE_ACT_INVALID);

    instr.SetDecode(is_start & state_exec & op_load & no_zero_first);

    // next state updates
    // auto next_state = BvConst(PE_ACT_STATE_INCR, PE_ACT_STATE_BITWIDTH);
    // instr.SetUpdate(state, next_state);
    IncrementInst (m, instr, pe_idx);

    auto buffer_addr_base =
        m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_BUFFER_ADDR_BASE));
    // set the rd_addr to 32 bit
    // 05032020: This rd_addr is vector level address!!, need to left shift 4
    // bits to get byte addr!!!
    auto rd_addr =
        Concat(BvConst(0, TOP_ADDR_IN_WIDTH - output_cntr.bit_width()),
               output_cntr) +
        Concat(BvConst(0, TOP_ADDR_IN_WIDTH - buffer_addr_base.bit_width()),
               buffer_addr_base);
    rd_addr = rd_addr << 4;
    // act buffer
    auto buffer = m.state(PEGetVarName(pe_idx, ACT_BUFFER));
    auto adptflow_bias =
        m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_ADPFLOAT_BIAS));

    for (auto i = 0; i < ACT_SCALAR; i++) {
      auto data_buf = Load(buffer, rd_addr + i);
      auto data_fixed = Adptfloat2Fixed(data_buf, adptflow_bias);
      auto reg_tmp = m.state(PEGetVarNameVector(pe_idx, i, ACT_REG_TEMP));
      instr.SetUpdate(reg_tmp, data_fixed);
    }
  }

  { // instr 3 ---- op 0x2, STORE instruction
    // STORE SRAM <- A2 Store address is determined by the output_counter +
    // buffer_addr_base
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_op_store"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto state_exec = (state == PE_ACT_STATE_EXEC);
    auto op_store = (op == PE_ACT_OP_STORE);

    instr.SetDecode(is_start & state_exec & op_store);

    // next FSM state
    IncrementInst(m, instr, pe_idx);

    auto buffer_addr_base =
        m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_BUFFER_ADDR_BASE));

    // update 05032020: The wr_addr here is vector level addr, need to left
    // shift 4 bits to get byte level addr
    auto wr_addr =
        Concat(BvConst(0, TOP_ADDR_IN_WIDTH - output_cntr.bit_width()),
               output_cntr) +
        Concat(BvConst(0, TOP_ADDR_IN_WIDTH - buffer_addr_base.bit_width()),
               buffer_addr_base);
    wr_addr = wr_addr << 4;

    // get the ExprRef of the register
    auto buffer = m.state(PEGetVarName(pe_idx, ACT_BUFFER));
    auto buffer_next = buffer;
    auto adptflow_bias =
        m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_ADPFLOAT_BIAS));

    // don't need to use the vector method for it only reads from the registers
    for (auto i = 0; i < ACT_SCALAR; i++) {
      // TODO: implement the Fixed2Adptflow function
      auto reg_addr = BvConst(i, PE_ACT_REGS_ADDR_WIDTH) +
                      BvConst(0, PE_ACT_REGS_ADDR_WIDTH);
      auto data_reg = PEActRegLoad_v(m, pe_idx, a2, reg_addr);
      auto data_adptflow = Fixed2Adptfloat(data_reg, adptflow_bias);
      buffer_next = Store(buffer_next, wr_addr + i, data_adptflow);
    }

    instr.SetUpdate(buffer, buffer_next);
  }

  { // instr 4 ---- op 0x3, INPE instruction
    // INPE act_port -> A2 Do not increment instruction if nothing recieved
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_op_inpe"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto state_exec = (state == PE_ACT_STATE_EXEC);
    auto op_inpe_ready = (op == PE_ACT_OP_INPE);
    // halt the instruction when there is no data pushed to the port
    auto port_valid = (m.input(PEGetVarName(pe_idx, CORE_ACT_REG_PORT_VALID)) == PE_ACT_VALID & m.state("act_port_ready") == PE_ACT_VALID);

    instr.SetDecode(is_start & state_exec & op_inpe_ready & port_valid);

    // set the port from pe core to be invalid in PE_Core
    instr.SetUpdate(m.state("act_port_ready"),
        BvConst(PE_ACT_INVALID, PE_CORE_ACT_REG_PORT_VALID_BITWIDTH));

    // next state
    IncrementInst(m, instr, pe_idx);

    for (auto i = 0; i < ACT_SCALAR; i++) {
      auto data = m.input(PEGetVarNameVector(pe_idx, i, CORE_ACT_VECTOR));
      instr.SetUpdate(m.state(PEGetVarNameVector(pe_idx, i, ACT_REG_TEMP)),
                      data);
    }
  }

  { // instr 5 ---- op 0x4, OUTGB, output result to GB
    // OUTGB A2 -> Output A2 to GB
    // TODO: Need to make sequential access to the shared states
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_op_outgb"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto state_exec = (state == PE_ACT_STATE_EXEC);
    auto op_outgb = (op == PE_ACT_OP_OUTGB);
    // need to schedule the sequential access
    // need to check whether gb has popped the previous data
    auto data_out_invalid =
        (m.state("output_port_valid") == PE_ACT_INVALID);

    instr.SetDecode(is_start & state_exec & op_outgb & data_out_invalid);

    // update FSM state
    IncrementInst(m, instr, pe_idx);
    // set the gb_control_data_in to be valid
    instr.SetUpdate(m.state("output_port_valid"), BvConst(PE_ACT_VALID, 1));

    auto output_base_addr =
        m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_OUTPUT_ADDR_BASE));
    auto data_out_addr = output_cntr + output_base_addr;

    instr.SetUpdate(m.state("output_port_addr"), data_out_addr);

    auto adptflow_bias =
        m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_ADPFLOAT_BIAS));

    for (auto i = 0; i < ACT_SCALAR; i++) {
      auto reg_addr = BvConst(i, PE_ACT_REGS_ADDR_WIDTH) +
                      BvConst(0, PE_ACT_REGS_ADDR_WIDTH);
      auto result = PEActRegLoad_v(m, pe_idx, a2, reg_addr);
      // update 05012020: Need to transform the result from fixed point to
      // adaptive float when sending back to gb.
      auto result_adpfloat = Fixed2Adptfloat(result, adptflow_bias);
      instr.SetUpdate(Extract(m.state("output_port_data"), 8*(i+1) - 1, 8*i), //output_port
                      result_adpfloat);
    }
  }

  { // instr 6 ---- op 0x7, COPY
    // COPY A1 -> A2
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_op_copy"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto state_exec = (state == PE_ACT_STATE_EXEC);
    auto op_copy = (op == PE_ACT_OP_COPY);

    instr.SetDecode(is_start & state_exec & op_copy);

    // FSM Update
    // auto next_state = BvConst(PE_ACT_STATE_INCR, PE_ACT_STATE_BITWIDTH);
    // instr.SetUpdate(state, next_state);
    IncrementInst(m, instr, pe_idx);

    for (auto i = 0; i < ACT_SCALAR; i++) {
      auto reg_addr = BvConst(i, PE_ACT_REGS_ADDR_WIDTH) +
                      BvConst(0, PE_ACT_REGS_ADDR_WIDTH);
      auto data = PEActRegLoad_v(m, pe_idx, a1, reg_addr);
      instr.SetUpdate(m.state(PEGetVarNameVector(pe_idx, i, ACT_REG_TEMP)),
                      data);
    }
  }

  { // instr 7 ---- op 0x8, EADD, A2 = A2 + A1
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_op_eadd"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto state_exec = (state == PE_ACT_STATE_EXEC);
    auto op_eadd = (op == PE_ACT_OP_EADD);

    instr.SetDecode(is_start & state_exec & op_eadd);

    // Next FSM state
    // auto next_state = BvConst(PE_ACT_STATE_INCR, PE_ACT_STATE_BITWIDTH);
    // instr.SetUpdate(state, next_state);
    IncrementInst(m, instr, pe_idx);

    for (auto i = 0; i < ACT_SCALAR; i++) {
      auto reg_addr = BvConst(i, PE_ACT_REGS_ADDR_WIDTH) +
                      BvConst(0, PE_ACT_REGS_ADDR_WIDTH);
      auto data_a1 = PEActRegLoad_v(m, pe_idx, a1, reg_addr);
      auto data_a2 = PEActRegLoad_v(m, pe_idx, a2, reg_addr);

      auto result = PEActEadd(data_a1, data_a2);
      instr.SetUpdate(m.state(PEGetVarNameVector(pe_idx, i, ACT_REG_TEMP)),
                      result);
    }
  }

  { // instr 8 ---- op 0x9, EMUL, A2 = A2 * A1
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_op_emul"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto state_exec = (state == PE_ACT_STATE_EXEC);
    auto op_emul = (op == PE_ACT_OP_EMUL);

    instr.SetDecode(is_start & state_exec & op_emul);
    // Next FSM state
    // auto next_state = BvConst(PE_ACT_STATE_INCR, PE_ACT_STATE_BITWIDTH);
    // instr.SetUpdate(state, next_state);
    IncrementInst(m, instr, pe_idx);

    for (auto i = 0; i < ACT_SCALAR; i++) {
      auto reg_addr = BvConst(i, PE_ACT_REGS_ADDR_WIDTH) +
                      BvConst(0, PE_ACT_REGS_ADDR_WIDTH);
      auto data_a1 = PEActRegLoad_v(m, pe_idx, a1, reg_addr);
      auto data_a2 = PEActRegLoad_v(m, pe_idx, a2, reg_addr);

      auto result = PEActEmul(data_a1, data_a2);

      instr.SetUpdate(m.state(PEGetVarNameVector(pe_idx, i, ACT_REG_TEMP)),
                      result);
    }
  }

  { // instr 9 ---- op 0xA, SIGM, A2 = Sigmoid(A2)
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_op_sigm"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto state_exec = (state == PE_ACT_STATE_EXEC);
    auto op_sigm = (op == PE_ACT_OP_SIGM);

    instr.SetDecode(is_start & state_exec & op_sigm);

    // Next FSM state
    // auto next_state = BvConst(PE_ACT_STATE_INCR, PE_ACT_STATE_BITWIDTH);
    // instr.SetUpdate(state, next_state);
    IncrementInst(m, instr, pe_idx);

    for (auto i = 0; i < ACT_SCALAR; i++) {
      auto reg_addr = BvConst(i, PE_ACT_REGS_ADDR_WIDTH) +
                      BvConst(0, PE_ACT_REGS_ADDR_WIDTH);
      auto data = PEActRegLoad_v(m, pe_idx, a2, reg_addr);

      auto result = PEActSigmoid(data);

      instr.SetUpdate(m.state(PEGetVarNameVector(pe_idx, i, ACT_REG_TEMP)),
                      result);
    }
  }

  { // instr 10 ---- op 0xB, TANH, A2 = TANH(A2)
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_op_tanh"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto state_exec = (state == PE_ACT_STATE_EXEC);
    auto op_tanh = (op == PE_ACT_OP_TANH);

    instr.SetDecode(is_start & state_exec & op_tanh);

    // Next FSM state
    IncrementInst(m, instr, pe_idx);

    for (auto i = 0; i < ACT_SCALAR; i++) {
      auto reg_addr = BvConst(i, PE_ACT_REGS_ADDR_WIDTH) +
                      BvConst(0, PE_ACT_REGS_ADDR_WIDTH);
      auto data = PEActRegLoad_v(m, pe_idx, a2, reg_addr);

      auto result = PEActTanh(data);

      instr.SetUpdate(m.state(PEGetVarNameVector(pe_idx, i, ACT_REG_TEMP)),
                      result);
    }
  }

  { // instr 11 ---- op 0xC, RELU, A2 = RELU(A2)
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_op_relu"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto state_exec = (state == PE_ACT_STATE_EXEC);
    auto op_relu = (op == PE_ACT_OP_RELU);

    instr.SetDecode(is_start & state_exec & op_relu);

    // Next FSM state
    IncrementInst(m, instr, pe_idx);

    for (auto i = 0; i < ACT_SCALAR; i++) {
      auto reg_addr = BvConst(i, PE_ACT_REGS_ADDR_WIDTH) +
                      BvConst(0, PE_ACT_REGS_ADDR_WIDTH);
      auto data = PEActRegLoad_v(m, pe_idx, a2, reg_addr);

      auto result = PEActRelu(data);

      instr.SetUpdate(m.state(PEGetVarNameVector(pe_idx, i, ACT_REG_TEMP)),
                      result);
    }
  }

  { // instr 12 ---- op 0xD, ONEX, A2 = 1 - A2
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_op_onex"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto state_exec = (state == PE_ACT_STATE_EXEC);
    auto op_onex = (op == PE_ACT_OP_ONEX);

    instr.SetDecode(is_start & state_exec & op_onex);

    // Next FSM state
    IncrementInst(m, instr, pe_idx);

    // Onex is also element wise
    for (auto i = 0; i < ACT_SCALAR; i++) {
      auto reg_addr = BvConst(i, PE_ACT_REGS_ADDR_WIDTH) +
                      BvConst(0, PE_ACT_REGS_ADDR_WIDTH);
      auto data = PEActRegLoad_v(m, pe_idx, a2, reg_addr);

      auto result = PEActOnex(data);

      instr.SetUpdate(m.state(PEGetVarNameVector(pe_idx, i, ACT_REG_TEMP)),
                      result);
    }
  }

  // 04172020 update: add a new state for register file store, decrease the time
  // to generate systemc models
  { // instr 13 ---- store data into the register file
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_reg_store"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto output_not_val = (m.state("output_port_valid") == BvConst(0,1));
    auto not_done = (m.state("done_valid") == BvConst(0,1));
    auto state_mem = (state == PE_ACT_STATE_DATA) & output_not_val & not_done;

    instr.SetDecode(is_start & state_mem);

    instr.SetUpdate(state, BvConst(PE_ACT_STATE_EXEC, PE_ACT_STATE_BITWIDTH));
    instr.SetUpdate(is_start_reg, is_start_reg);

    // for (auto i = 0; i < PE_ACT_REGS_NUM; i++) {
    //   auto reg = m.state(PEGetVarNameVector(pe_idx, i, ACT_REGS));
    //   auto reg_next = reg;
    //   for (auto j = 0; j < ACT_SCALAR; j++) {
    //     auto data = m.state(PEGetVarNameVector(pe_idx, j, ACT_REG_TEMP));
    //     auto addr = BvConst(j, PE_ACT_REGS_ADDR_WIDTH) +
    //                 BvConst(0, PE_ACT_REGS_ADDR_WIDTH);

    //     reg_next = Ite(a2 == i, Store(reg_next, addr, data), reg_next);
    //   }
    //   instr.SetUpdate(reg, reg_next);
    // }
  }

  { //instr 14 -- Out_sent
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_out_sent"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto output_sent = (m.state("output_port_valid") == BvConst(1,1)) & (m.input("output_port_ready") == BvConst(1,1));
    auto state_mem = (state == PE_ACT_STATE_DATA) & output_sent;
    instr.SetDecode(is_start & state_mem);

    instr.SetUpdate(m.state("output_port_valid"), BvConst(0,1));
  }

  { //instr 15 -- Done_sent
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "act_child_done_sent"));
    auto is_start = (is_start_reg == PE_ACT_VALID);
    auto done_sent = (m.state("done_valid") == BvConst(1,1)) & (m.input("done_ready") == BvConst(1,1));
    auto state_mem = (state == PE_ACT_STATE_DATA) & done_sent;
    instr.SetDecode(is_start & state_mem);

    instr.SetUpdate(m.state("done_valid"), BvConst(0,1));
  }

}

/****** helper function for PE Act m instructions **********/
ExprRef PEActRegLoad_v(Ila& m, const int& pe_idx, const ExprRef& reg_idx,
                       const ExprRef& addr) {
  auto result = BvConst(0, PE_CORE_ACT_VECTOR_BITWIDTH);
  for (auto i = 0; i < PE_ACT_REGS_NUM; i++) {
    auto reg = m.state(PEGetVarNameVector(pe_idx, i, ACT_REGS));
    result = Ite(reg_idx == i, Load(reg, addr), result);
  }
  return result;
}

void IncrementInst (Ila& m, InstrRef& instr, const int& pe_idx) {
  // state variables to update
    auto is_start_reg = m.state(PEGetVarName(pe_idx, ACT_IS_START_REG));
    auto instr_cntr = m.state(PEGetVarName(pe_idx, ACT_INSTR_COUNTER));
    auto output_cntr = m.state(PEGetVarName(pe_idx, ACT_OUTPUT_COUNTER));
    auto state = m.state(PEGetVarName(pe_idx, ACT_STATE));
  // configure states
    auto num_instr = m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_NUM_INST));
    auto num_output = m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_NUM_OUTPUT));

  // end logic
    auto is_last_instr = (instr_cntr == num_instr - 1);
    auto is_last_output = (output_cntr == num_output - 1);
    auto is_end = is_last_instr & is_last_output;

    auto instr_cntr_next = Ite(is_last_instr, BvConst(0, PE_ACT_INSTR_COUNTER_BITWIDTH),
            instr_cntr + 1);
    auto output_cntr_next = Ite(is_end, BvConst(0, PE_ACT_OUTPUT_COUNTER_BITWIDTH),
            Ite(is_last_instr & !is_last_output, output_cntr + 1, output_cntr));
    auto is_zero_next = Ite(is_end, BvConst(0, ACT_MNGR_CONFIG_REG_IS_ZERO_FIRST_WIDTH),
            m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_IS_ZERO_FIRST)));
    auto done_next = Ite(is_end, BvConst(1, PE_DONE_SIGNAL_SHARED_BITWIDTH), m.state("done"));
    auto done_val_next = Ite(is_end, BvConst(1, 1), BvConst(0,1));

  // Update the instr counters to check 
    instr.SetUpdate(instr_cntr, instr_cntr_next);
    instr.SetUpdate(output_cntr, output_cntr_next);
    instr.SetUpdate(m.state(PEGetVarName(pe_idx, ACT_MNGR_CONFIG_REG_IS_ZERO_FIRST)), is_zero_next);

    instr.SetUpdate(m.state("done"), done_next);
    instr.SetUpdate(m.state("done_valid"), done_val_next);

    instr.SetUpdate(state, BvConst(PE_ACT_STATE_DATA, PE_ACT_STATE_BITWIDTH));
    instr.SetUpdate(is_start_reg, is_start_reg);
}



} // namespace flex

} // namespace ilang
