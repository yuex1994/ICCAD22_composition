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

// File: pe_core.cc

#include <vector>

#include <flex.h>
#include <uninterpreted_func.h>

namespace ilang {

namespace flex {

void DefinePECore(Ila& m, const int& pe_idx);
void AddChild_PECoreRunMac(Ila& m, const int& pe_idx);

void DefinePECore(Ila& m, const int& pe_idx) {
  auto pe_config_valid_bit = m.state(PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_IS_VALID));
  auto pe_config_is_valid = (pe_config_valid_bit == PE_CORE_VALID);

  auto is_start_reg = m.NewBvState(PEGetVarName(pe_idx, CORE_IS_START),
                                       PE_CORE_IS_START_BITWIDTH);
  auto mngr_cntr = m.NewBvState(PEGetVarName(pe_idx, CORE_MNGR_CNTR),
                                    PE_CORE_MNGR_CNTR_BITWIDTH);
  auto input_cntr = m.NewBvState(PEGetVarName(pe_idx, CORE_INPUT_CNTR),
                                     PE_CORE_INPUT_CNTR_BITWIDTH);
  auto output_cntr = m.NewBvState(PEGetVarName(pe_idx, CORE_OUTPUT_CNTR),
                                      PE_CORE_OUTPUT_CNTR_BITWIDTH);
  // states for run mac m
//   auto run_mac_flag = m.NewBvState(PEGetVarName(pe_idx, CORE_CHILD_RUN_MAC_FLAG),
//                         PE_CORE_CHILD_RUN_MAC_FLAG_BITWIDTH);
//   auto run_mac_cntr = m.NewBvState(PEGetVarName(pe_idx, CORE_CHILD_RUN_MAC_CNTR),
//                         PE_CORE_CHILD_RUN_MAC_CNTR_BITWIDTH);
//   auto run_mac_state = m.NewBvState(PEGetVarName(pe_idx, CORE_RUN_MAC_CHILD_STATE),
//                         PE_CORE_RUN_MAC_CHILD_STATE_BITWIDTH);
//   auto weight_base_v = m.NewBvState(PEGetVarName(pe_idx, CORE_CHILD_RUN_MAC_WEIGHT_BASE_VECTOR),
//                         PE_CORE_CHILD_RUN_MAC_WEIGHT_BASE_VECTOR_BITWIDTH);
//   auto input_base_v = m.NewBvState(PEGetVarName(pe_idx, CORE_CHILD_RUN_MAC_INPUT_BASE_VECTOR),
//                         PE_CORE_CHILD_RUN_MAC_INPUT_BASE_VECTOR_BITWIDTH);
  // common states used in this m instructions
  auto state = m.state(PEGetVarName(pe_idx, CORE_STATE));

  // core accumulator registers
  for (auto i = 0; i < PE_CORE_ACCUM_VECTOR_LANES; i++) {
      m.NewBvState(PEGetVarNameVector(pe_idx, i, CORE_ACCUM_VECTOR),
                     PE_CORE_ACCUM_VECTOR_BITWIDTH);
  }

  // add initial condition
  m.AddInit(is_start_reg == PE_CORE_INVALID);
  m.AddInit(mngr_cntr == PE_CORE_MNGR_0);
  m.AddInit(input_cntr == 0);
  m.AddInit(output_cntr == 0);

  { // instructions 0 ---- read the data from GB
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "core_read_gb"));

    auto pe_not_start = (is_start_reg == PE_CORE_INVALID);
    auto gb_data_valid = (m.input("input_port_valid") == PE_CORE_VALID) & (m.state("input_port_ready") == PE_CORE_VALID);

    auto state_idle = (state == PE_CORE_STATE_IDLE);

    instr.SetDecode(pe_config_is_valid & pe_not_start & gb_data_valid & state_idle);

    auto m_index = m.input("input_port_index");
    auto base_addr = Ite(
        (m_index == PE_CORE_MNGR_0),
        m.state(PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_BASE_INPUT)),
        m.state(PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_BASE_INPUT)));
    auto data_in_addr = m.input("input_port_addr");
    auto data_in_addr_16 = Concat(BvConst(0, 8), data_in_addr);
    auto input_wr_addr =
        base_addr + data_in_addr_16; // this address is vector level (16 byte);

    input_wr_addr = (Concat(BvConst(0, 16), input_wr_addr))
                    << 4; // change the address to byte

    // fetch the data from GB and store them into the input buffer
    auto mem = m.state(PEGetVarName(pe_idx, CORE_INPUT_BUFFER));
    auto mem_next = mem;
    for (auto i = 0; i < CORE_SCALAR; i++) {
        mem_next = Store(mem_next, input_wr_addr+i, Extract(m.input("input_port_data"), 8*(i+1) - 1, 8*i));
    }
    instr.SetUpdate(mem, mem_next);
    
  }


  { // instruction 2 ---- helper instructions for is_start condition
    // updates on the GB_Control: the pe_start valid only after all the PE have
    // read the last piece of data.
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "core_is_start"));

    auto pe_start_valid = (m.input("pe_start_valid") == PE_CORE_VALID) & (m.input("pe_start") == PE_CORE_VALID);
    auto pe_start_ready = (m.state("pe_start_ready") == PE_CORE_VALID);
    auto state_idle = (state == PE_CORE_STATE_IDLE);
    auto is_start = pe_config_is_valid & pe_start_valid;

    // only need the pe_start_valid here because the d
    instr.SetDecode(is_start & pe_start_ready & state_idle);

    auto next_state = BvConst(PE_CORE_STATE_PRE, PE_CORE_STATE_BITWIDTH);

    instr.SetUpdate(state, next_state);
    // set the is_start_reg to be valid, and set the shared start state to be
    // invalid, immitate the behavior of the pop operation NEED TO BE CAREFUL
    // ABOUT THE 4 PE CORES ACCESSES TO THE SHARED STATES!!!!!
    instr.SetUpdate(is_start_reg,
                    BvConst(PE_CORE_VALID, PE_CORE_IS_START_BITWIDTH));

    // update 04132020: initialize the shared valid flag for act_port_register
    instr.SetUpdate(
        m.state(PEGetVarName(pe_idx, CORE_ACT_REG_PORT_VALID)),
        BvConst(PE_CORE_INVALID, PE_CORE_ACT_REG_PORT_VALID_BITWIDTH));
  }

  { // instruction 3 ---- select next state
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "core_prep"));

    auto is_start = pe_config_is_valid & is_start_reg;
    auto state_pre = (state == PE_CORE_STATE_PRE);

    instr.SetDecode(is_start & state_pre);

    auto is_zero_first = m.state(
        PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_IS_ZERO_FIRST));
    auto zero_active = Ite(
        mngr_cntr == PE_CORE_MNGR_0,
        m.state(PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_ZERO_ACTIVE)),
        m.state(PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_ZERO_ACTIVE)));
    auto zero_first_cond =
        (is_zero_first == PE_CORE_VALID) & (zero_active == PE_CORE_VALID);
    auto next_state = Ite(zero_first_cond,
                          BvConst(PE_CORE_STATE_BIAS, PE_CORE_STATE_BITWIDTH),
                          BvConst(PE_CORE_STATE_MAC, PE_CORE_STATE_BITWIDTH));

    // states updates
    // reset the accumulate registers
    for (auto i = 0; i < CORE_SCALAR; i++) {
      instr.SetUpdate(
          m.state(PEGetVarNameVector(pe_idx, i, CORE_ACCUM_VECTOR)),
          BvConst(0, PE_CORE_ACCUM_VECTOR_BITWIDTH));
    }

    instr.SetUpdate(state, next_state);
  }

  { // instruction 4 ---- MAC state
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "core_mac"));

    auto is_start = pe_config_is_valid & is_start_reg;
    auto state_mac = (state == PE_CORE_STATE_MAC);

    instr.SetDecode(is_start & state_mac);

    // state transition control signal
    auto num_input = Ite(
        mngr_cntr == PE_CORE_MNGR_0,
        m.state(PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_NUM_INPUT)),
        m.state(PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_NUM_INPUT)));
    auto is_input_end = (input_cntr >= num_input - 1);
    auto next_state =
        Ite(is_input_end, BvConst(PE_CORE_STATE_BIAS, PE_CORE_STATE_BITWIDTH),
            BvConst(PE_CORE_STATE_MAC, PE_CORE_STATE_BITWIDTH));
    auto input_cntr_next = Ite(
        is_input_end, BvConst(0, PE_CORE_INPUT_CNTR_BITWIDTH), input_cntr + 1);

    instr.SetUpdate(state, next_state);
    // update input counter
    instr.SetUpdate(input_cntr, input_cntr_next);

    // // calculate the addresses
    // auto is_cluster =
    //     m.state(PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_IS_CLUSTER));

    // auto config_base_weight = Ite(
    //     mngr_cntr == PE_CORE_MNGR_0,
    //     m.state(PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_BASE_WEIGHT)),
    //     m.state(PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_BASE_WEIGHT)));
    // auto config_base_input = Ite(
    //     mngr_cntr == PE_CORE_MNGR_0,
    //     m.state(PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_BASE_INPUT)),
    //     m.state(PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_BASE_INPUT)));

    // auto num_input_16 = Concat(BvConst(0, 16 - num_input.bit_width()), num_input);
    // auto input_cntr_16 = Concat(BvConst(0, 16 - input_cntr.bit_width()), input_cntr);
    // auto output_cntr_16 = Concat(BvConst(0, 16 - output_cntr.bit_width()), output_cntr);

    // // weight & input
    // auto weight_base_v_next =
    //     Ite(is_cluster == PE_CORE_VALID,
    //         (output_cntr_16 * num_input_16 + input_cntr_16) * 8 + config_base_weight,
    //         (output_cntr_16 * num_input_16 + input_cntr_16) * 16 + config_base_weight);
    // auto weight_base_b = (Concat(BvConst(0, TOP_ADDR_IN_WIDTH - weight_base_v_next.bit_width()), weight_base_v_next)) << 4;
    // auto input_base_v_next = input_cntr_16 + config_base_input;
    // auto input_base_b = (Concat(BvConst(0, TOP_ADDR_IN_WIDTH - input_base_v_next.bit_width()), input_base_v_next)) << 4;

    // // buffer
    // auto weight_buffer = m.state(PEGetVarName(pe_idx, CORE_WEIGHT_BUFFER));
    // auto input_buffer = m.state(PEGetVarName(pe_idx, CORE_INPUT_BUFFER));

    // // Add child to do the run mac function
    // // weight: 16 x 16, input vector 16
    // // child do the MAC by 16 steps, do a weight vector and input vector
    // // multiplication each step.
    // for (auto i = 0; i < CORE_SCALAR; i++) { // row_id
    //     auto p_accum = BvConst(0, PE_CORE_ACCUM_VECTOR_BITWIDTH); // partial_accum
    //     for (auto j = 0; j < CORE_SCALAR; j++) {
    //         auto addr = weight_base_b + i * (CORE_SCALAR / 2) + j / 2;
    //         auto data = Load(weight_buffer, addr);
    //         // extract the cluster table index from the data
    //         auto idx_0 = Extract(data, 3, 0);
    //         auto idx_1 = Extract(data, 7, 4);
    //         auto mngr_cntr = m.state(PEGetVarName(pe_idx, CORE_MNGR_CNTR));
    //         auto wgt_data_0 = m.state(VectorVarName(0, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY));
    //         auto wgt_data_1 = m.state(VectorVarName(0, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY));
    //         for (int idx = 0; idx < 16; idx++) {
    //             wgt_data_0 = Ite(idx_0 == BvConst(idx, 4),
    //                                 Ite(mngr_cntr == 0, m.state(VectorVarName(idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY)),
    //                                 m.state(VectorVarName(idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY)))
    //                                 , wgt_data_0);
    //             wgt_data_1 = Ite(idx_1 == BvConst(idx, 4), 
    //                                 Ite(mngr_cntr == 0, m.state( VectorVarName(idx, CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY)),
    //                                     m.state(VectorVarName(idx, CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY)))
    //                                 , wgt_data_1);
    //         }
    //         if (j % 2 == 0) {
    //             auto wgt_byte = Ite(is_cluster == PE_CORE_VALID,
    //                         wgt_data_0, Load(weight_buffer, weight_base_b + i * CORE_SCALAR + j));
    //             auto inp_byte = Load(input_buffer, input_base_b + i);
    //             auto p_sum = ProductSum(wgt_byte, inp_byte);
    //             p_accum = AccumAdd(p_accum, p_sum);
    //         }
    //         else {
    //             auto wgt_byte = Ite(is_cluster == PE_CORE_VALID,
    //                         wgt_data_1, Load(weight_buffer, weight_base_b + i * CORE_SCALAR + j));
    //             auto inp_byte = Load(input_buffer, input_base_b + i);
    //             auto p_sum = ProductSum(wgt_byte, inp_byte);
    //             p_accum = AccumAdd(p_accum, p_sum);
    //         }
    //     }
    //     auto accum_state = m.state(PEGetVarNameVector(pe_idx, i, CORE_ACCUM_VECTOR));
    //     instr.SetUpdate(accum_state, AccumAdd2(accum_state, p_accum));
    // }

  }

  { // instruction 5 ---- BIAS state
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "core_bias"));

    auto is_start = pe_config_is_valid & is_start_reg;
    auto state_bias = (state == PE_CORE_STATE_BIAS);

    instr.SetDecode(is_start & state_bias);

    auto is_bias =
        m.state(PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_IS_BIAS));
    auto bias_w = Ite(mngr_cntr == 0,
                      m.state(PEGetVarName(
                          pe_idx, MEM_MNGR_FIRST_CONFIG_REG_ADPFLOAT_BIAS_W)),
                      m.state(PEGetVarName(
                          pe_idx, MEM_MNGR_SECOND_CONFIG_REG_ADPFLOAT_BIAS_W)));
    auto bias_i = Ite(mngr_cntr == 0,
                      m.state(PEGetVarName(
                          pe_idx, MEM_MNGR_FIRST_CONFIG_REG_ADPFLOAT_BIAS_I)),
                      m.state(PEGetVarName(
                          pe_idx, MEM_MNGR_SECOND_CONFIG_REG_ADPFLOAT_BIAS_I)));

    // Hand over to the uninterpreted function to deal with the right shrift
    // values auto bias_w_32 = Concat(BvConst(0, 32 - bias_w.bit_width()),
    // bias_w); auto bias_i_32 = Concat(BvConst(0, 32 - bias_i.bit_width()),
    // bias_i);
    // // NVUINT5 right_shift = -2*spec::kAdpfloatOffset +
    // 2*spec::kAdpfloatManWidth - spec::kActNumFrac
    // //                         - pe_manager[m_index].adplfloat_bias_weight
    // //                         - pe_manager[m_index].adplfloat_bias_input;
    // auto right_shift = BvConst(ADPTFLOW_MAN_WIDTH, 32) * 2 +
    // BvConst(ADPTFLOW_OFFSET_NEG, 32) * 2
    //                     - BvConst(ACT_NUM_FRAC, 32) - bias_w_32 - bias_i_32;

    auto base_bias = Ite(
        mngr_cntr == 0,
        m.state(PEGetVarName(pe_idx, MEM_MNGR_FIRST_CONFIG_REG_BASE_BIAS)),
        m.state(PEGetVarName(pe_idx, MEM_MNGR_SECOND_CONFIG_REG_BASE_BIAS)));
    // extend the address to 32 bits
    auto base_bias_32 =
        Concat(BvConst(0, 32 - base_bias.bit_width()), base_bias);
    auto output_cntr_32 =
        Concat(BvConst(0, 32 - output_cntr.bit_width()), output_cntr);
    auto bias_addr_base = (base_bias_32 + output_cntr_32)
                          << 4; // turn the address into byte unit

    auto input_mem = m.state(PEGetVarName(pe_idx, CORE_INPUT_BUFFER));

    auto adpfloat_bias_bias =
        Ite(mngr_cntr == 0,
            m.state(PEGetVarName(pe_idx,
                                 MEM_MNGR_FIRST_CONFIG_REG_ADPFLOAT_BIAS_B)),
            m.state(PEGetVarName(pe_idx,
                                 MEM_MNGR_SECOND_CONFIG_REG_ADPFLOAT_BIAS_B)));

    // for (auto i = 0; i < CORE_SCALAR; i++) {
    //   auto accum_vector =
    //       m.state(PEGetVarNameVector(pe_idx, i, CORE_ACCUM_VECTOR));
    //   std::vector<ExprRef> rs_input = {accum_vector, bias_w, bias_i};
    //   // TODO: Uninterpreted function: Right Shift, Get Bias
    //   auto accum_vector_shifted = PECoreAccumRightShift(rs_input);
    //   // auto accum_vector_out = PECoreAccumRightShift(accum_vector);
    //   auto bias = Load(input_mem, bias_addr_base + i);
    //   std::vector<ExprRef> get_bias_input = {accum_vector_shifted, bias,
    //                                          adpfloat_bias_bias};
    //   auto accum_vector_out_with_bias = PECoreAccumGetBiasOut(get_bias_input);

    //   auto accum_vector_out =
    //       Ite(is_bias == 1, accum_vector_out_with_bias, accum_vector_shifted);
    //   accum_vector_out = PECoreAccumOverflowCheck(accum_vector_out);

    //   auto act_reg_tmp = PECoreAccum2ActReg(accum_vector_out);

    //   // update the activation vector registers
    //   auto act_vector_output = m.state(PEGetVarNameVector(pe_idx, i, CORE_ACT_VECTOR));
    //   instr.SetUpdate(act_vector_output, act_reg_tmp);
    // }

    auto next_state = BvConst(PE_CORE_STATE_OUT, PE_CORE_STATE_BITWIDTH);
    instr.SetUpdate(state, next_state);
  }

  { // instruction 6 ---- OUT state
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "core_out"));

    auto is_start = pe_config_is_valid & is_start_reg;
    auto state_out = (state == PE_CORE_STATE_OUT);
    // update 04162020: flexnlp use blocking push on act port, thus if port
    // valid is high, it should halt this instruction
    auto act_port_invalid =
        (m.state(PEGetVarName(pe_idx, CORE_ACT_REG_PORT_VALID)) ==
         PE_CORE_INVALID);

    instr.SetDecode(is_start & state_out & act_port_invalid);

    auto num_mngr =
        m.state(PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_NUM_MANAGER));
    auto num_output =
        m.state(PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_NUM_OUTPUT));
    auto mngr_cntr_4 = Concat(BvConst(0, 4 - mngr_cntr.bit_width()), mngr_cntr);
    auto last_mngr = (mngr_cntr_4 == (num_mngr - 1));
    auto last_output = (output_cntr == (num_output - 1));
    // auto is_output_end = last_mngr & last_output;

    auto is_zero_first = m.state(
        PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_IS_ZERO_FIRST));

    auto mngr_cntr_next =
        Ite(last_mngr, BvConst(0, PE_CORE_MNGR_CNTR_BITWIDTH), mngr_cntr + 1);
    auto output_cntr_next =
        Ite(last_mngr & last_output, BvConst(0, PE_CORE_OUTPUT_CNTR_BITWIDTH),
            Ite(last_mngr & !last_output, output_cntr + 1, output_cntr));
    // when is_zero_first & zero_active is valid, the output for the first
    // timestep should all be zero.
    auto is_zero_first_next =
        Ite(last_mngr & last_output,
            BvConst(0, RNN_LAYER_SIZING_CONFIG_REG_IS_ZERO_FIRST_WIDTH),
            is_zero_first);

    // auto next_state =
    //     Ite(is_output_end, BvConst(PE_CORE_STATE_IDLE, PE_CORE_STATE_BITWIDTH),
    //         BvConst(PE_CORE_STATE_PRE, PE_CORE_STATE_BITWIDTH));
    // // use the is_start_reg to end the run mac when there is no new pe_start
    // // signal pushed into the channel
    // auto is_start_reg_next =
    //     Ite(is_output_end, BvConst(PE_CORE_INVALID, PE_CORE_STATE_BITWIDTH),
    //         BvConst(PE_CORE_VALID, PE_CORE_STATE_BITWIDTH));

    //instr.SetUpdate(is_start_reg, is_start_reg_next);

    instr.SetUpdate(mngr_cntr, mngr_cntr_next);
    instr.SetUpdate(output_cntr, output_cntr_next);
    instr.SetUpdate(is_zero_first, is_zero_first_next);
    //instr.SetUpdate(state, next_state);

    // update 04132020: set the act_port_reg valid bit at output stage
    // FlexNLP use blocking push on act_port, thus if the port valid is high, it
    // should halt this out instruction
    instr.SetUpdate(
        m.state(PEGetVarName(pe_idx, CORE_ACT_REG_PORT_VALID)),
        BvConst(PE_CORE_VALID, PE_CORE_ACT_REG_PORT_VALID_BITWIDTH));

    // update 05012020: add act_port_reg to hold the result from RunBias for
    // act_port, in accordance to the FlexNLP implementation
  }

  { // instruction 7 --- sent instruction
      auto instr = m.NewInstr(PEGetInstrName(pe_idx, "core_out_sent"));
      auto act_port_valid = m.state(PEGetVarName(pe_idx, CORE_ACT_REG_PORT_VALID)) == PE_CORE_VALID;
      auto act_port_ready = m.input("act_port_ready") == PE_CORE_VALID;
      instr.SetDecode(act_port_valid & act_port_ready);

      auto num_mngr =
        m.state(PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_NUM_MANAGER));
      auto num_output =
        m.state(PEGetVarName(pe_idx, RNN_LAYER_SIZING_CONFIG_REG_NUM_OUTPUT));
      auto mngr_cntr_4 = Concat(BvConst(0, 4 - mngr_cntr.bit_width()), mngr_cntr);
      auto last_mngr = (mngr_cntr_4 == BvConst(0, 4));
      auto last_output = (output_cntr == BvConst(0, PE_CORE_OUTPUT_CNTR_BITWIDTH));
      auto is_output_end = last_mngr & last_output;

      auto next_state =
        Ite(is_output_end, BvConst(PE_CORE_STATE_IDLE, PE_CORE_STATE_BITWIDTH),
            BvConst(PE_CORE_STATE_PRE, PE_CORE_STATE_BITWIDTH));
      // use the is_start_reg to end the run mac when there is no new pe_start
      // signal pushed into the channel
      auto is_start_reg_next =
        Ite(is_output_end, BvConst(PE_CORE_INVALID, PE_CORE_STATE_BITWIDTH),
            BvConst(PE_CORE_VALID, PE_CORE_STATE_BITWIDTH));
    
      instr.SetUpdate(is_start_reg, is_start_reg_next);
      instr.SetUpdate(state, next_state);

      instr.SetUpdate(m.state(PEGetVarName(pe_idx, CORE_ACT_REG_PORT_VALID)),
        BvConst(PE_CORE_INVALID, PE_CORE_ACT_REG_PORT_VALID_BITWIDTH));
  }

}

// *************************************************************//
// ************ child model : PECoreRunMac *********************//
// *************************************************************//


} // namespace flex

} // namespace ilang
