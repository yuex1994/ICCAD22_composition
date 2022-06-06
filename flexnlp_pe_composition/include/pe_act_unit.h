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

// File: pe_act_unit.h

#ifndef FLEX_PE_ACT_UNIT_H__
#define FLEX_PE_ACT_UNIT_H__

#include <string>

#include <ilang/util/log.h>

namespace ilang {

namespace flex {

#define ACT_SCALAR 16

//
// ActUnit buffer (LSTM cell state storage) (512B)
//
#define ACT_BUFFER "act_buffer"
#define ACT_BUFFER_NUM_BANKS 1
#define ACT_BUFFER_ENTRIES_PER_BANK 32
#define ACT_BUFFER_BUFFER_SIZE                                                 \
  (ACT_SCALAR * ACT_BUFFER_NUM_BANKS * ACT_BUFFER_ENTRIES_PER_BANK)

//
// ActUnit manager
//

// config register: is_valid
#define ACT_MNGR_CONFIG_REG_IS_VALID "act_mngr_is_valid"
#define ACT_MNGR_CONFIG_REG_IS_VALID_WIDTH 1

// config register: is_zero_first
#define ACT_MNGR_CONFIG_REG_IS_ZERO_FIRST "act_mngr_is_zero_first"
#define ACT_MNGR_CONFIG_REG_IS_ZERO_FIRST_WIDTH 1

// config register: adpfloat_bias
#define ACT_MNGR_CONFIG_REG_ADPFLOAT_BIAS "act_mngr_adpfloat_bias"
#define ACT_MNGR_CONFIG_REG_ADPFLOAT_BIAS_WIDTH 3

// config register: num_inst
#define ACT_MNGR_CONFIG_REG_NUM_INST "act_mngr_num_inst"
#define ACT_MNGR_CONFIG_REG_NUM_INST_WIDTH 6

// config register: num_output
#define ACT_MNGR_CONFIG_REG_NUM_OUTPUT "act_mngr_num_output"
#define ACT_MNGR_CONFIG_REG_NUM_OUTPUT_WIDTH 8

// config register: buffer_addr_base
#define ACT_MNGR_CONFIG_REG_BUFFER_ADDR_BASE "act_mngr_buffer_addr_base"
#define ACT_MNGR_CONFIG_REG_BUFFER_ADDR_BASE_WIDTH 5

// config register: output_addr_base
#define ACT_MNGR_CONFIG_REG_OUTPUT_ADDR_BASE "act_mngr_output_addr_base"
#define ACT_MNGR_CONFIG_REG_OUTPUT_ADDR_BASE_WIDTH 8

//
// ActUnit vector 0-15
//
#define ACT_VECTOR_0_15_CONFIG_REG_INST "act_vector_0_15_Inst"
#define ACT_VECTOR_0_15_CONFIG_REG_INST_WIDTH 8


// config register: Inst0
#define ACT_VECTOR_0_15_CONFIG_REG_INST0 "act_vector_0_15_Inst0"
#define ACT_VECTOR_0_15_CONFIG_REG_INST0_WIDTH 8

// config register: Inst1
#define ACT_VECTOR_0_15_CONFIG_REG_INST1 "act_vector_0_15_Inst1"
#define ACT_VECTOR_0_15_CONFIG_REG_INST1_WIDTH 8

// config register: Inst2
#define ACT_VECTOR_0_15_CONFIG_REG_INST2 "act_vector_0_15_Inst2"
#define ACT_VECTOR_0_15_CONFIG_REG_INST2_WIDTH 8

// config register: Inst3
#define ACT_VECTOR_0_15_CONFIG_REG_INST3 "act_vector_0_15_Inst3"
#define ACT_VECTOR_0_15_CONFIG_REG_INST3_WIDTH 8

// config register: Inst4
#define ACT_VECTOR_0_15_CONFIG_REG_INST4 "act_vector_0_15_Inst4"
#define ACT_VECTOR_0_15_CONFIG_REG_INST4_WIDTH 8

// config register: Inst5
#define ACT_VECTOR_0_15_CONFIG_REG_INST5 "act_vector_0_15_Inst5"
#define ACT_VECTOR_0_15_CONFIG_REG_INST5_WIDTH 8

// config register: Inst6
#define ACT_VECTOR_0_15_CONFIG_REG_INST6 "act_vector_0_15_Inst6"
#define ACT_VECTOR_0_15_CONFIG_REG_INST6_WIDTH 8

// config register: Inst7
#define ACT_VECTOR_0_15_CONFIG_REG_INST7 "act_vector_0_15_Inst7"
#define ACT_VECTOR_0_15_CONFIG_REG_INST7_WIDTH 8

// config register: Inst8
#define ACT_VECTOR_0_15_CONFIG_REG_INST8 "act_vector_0_15_Inst8"
#define ACT_VECTOR_0_15_CONFIG_REG_INST8_WIDTH 8

// config register: Inst9
#define ACT_VECTOR_0_15_CONFIG_REG_INST9 "act_vector_0_15_Inst9"
#define ACT_VECTOR_0_15_CONFIG_REG_INST9_WIDTH 8

// config register: Inst10
#define ACT_VECTOR_0_15_CONFIG_REG_INST10 "act_vector_0_15_Inst10"
#define ACT_VECTOR_0_15_CONFIG_REG_INST10_WIDTH 8

// config register: Inst11
#define ACT_VECTOR_0_15_CONFIG_REG_INST11 "act_vector_0_15_Inst11"
#define ACT_VECTOR_0_15_CONFIG_REG_INST11_WIDTH 8

// config register: Inst12
#define ACT_VECTOR_0_15_CONFIG_REG_INST12 "act_vector_0_15_Inst12"
#define ACT_VECTOR_0_15_CONFIG_REG_INST12_WIDTH 8

// config register: Inst13
#define ACT_VECTOR_0_15_CONFIG_REG_INST13 "act_vector_0_15_Inst13"
#define ACT_VECTOR_0_15_CONFIG_REG_INST13_WIDTH 8

// config register: Inst14
#define ACT_VECTOR_0_15_CONFIG_REG_INST14 "act_vector_0_15_Inst14"
#define ACT_VECTOR_0_15_CONFIG_REG_INST14_WIDTH 8

// config register: Inst15
#define ACT_VECTOR_0_15_CONFIG_REG_INST15 "act_vector_0_15_Inst15"
#define ACT_VECTOR_0_15_CONFIG_REG_INST15_WIDTH 8

//
// ActUnit vector 16-31
//

#define ACT_VECTOR_16_31_CONFIG_REG_INST "act_vector_16_31_Inst"
#define ACT_VECTOR_16_31_CONFIG_REG_INST_WIDTH 8

// config register: Inst0
#define ACT_VECTOR_16_31_CONFIG_REG_INST0 "act_vector_16_31_Inst0"
#define ACT_VECTOR_16_31_CONFIG_REG_INST0_WIDTH 8

// config register: Inst1
#define ACT_VECTOR_16_31_CONFIG_REG_INST1 "act_vector_16_31_Inst1"
#define ACT_VECTOR_16_31_CONFIG_REG_INST1_WIDTH 8

// config register: Inst2
#define ACT_VECTOR_16_31_CONFIG_REG_INST2 "act_vector_16_31_Inst2"
#define ACT_VECTOR_16_31_CONFIG_REG_INST2_WIDTH 8

// config register: Inst3
#define ACT_VECTOR_16_31_CONFIG_REG_INST3 "act_vector_16_31_Inst3"
#define ACT_VECTOR_16_31_CONFIG_REG_INST3_WIDTH 8

// config register: Inst4
#define ACT_VECTOR_16_31_CONFIG_REG_INST4 "act_vector_16_31_Inst4"
#define ACT_VECTOR_16_31_CONFIG_REG_INST4_WIDTH 8

// config register: Inst5
#define ACT_VECTOR_16_31_CONFIG_REG_INST5 "act_vector_16_31_Inst5"
#define ACT_VECTOR_16_31_CONFIG_REG_INST5_WIDTH 8

// config register: Inst6
#define ACT_VECTOR_16_31_CONFIG_REG_INST6 "act_vector_16_31_Inst6"
#define ACT_VECTOR_16_31_CONFIG_REG_INST6_WIDTH 8

// config register: Inst7
#define ACT_VECTOR_16_31_CONFIG_REG_INST7 "act_vector_16_31_Inst7"
#define ACT_VECTOR_16_31_CONFIG_REG_INST7_WIDTH 8

// config register: Inst8
#define ACT_VECTOR_16_31_CONFIG_REG_INST8 "act_vector_16_31_Inst8"
#define ACT_VECTOR_16_31_CONFIG_REG_INST8_WIDTH 8

// config register: Inst9
#define ACT_VECTOR_16_31_CONFIG_REG_INST9 "act_vector_16_31_Inst9"
#define ACT_VECTOR_16_31_CONFIG_REG_INST9_WIDTH 8

// config register: Inst10
#define ACT_VECTOR_16_31_CONFIG_REG_INST10 "act_vector_16_31_Inst10"
#define ACT_VECTOR_16_31_CONFIG_REG_INST10_WIDTH 8

// config register: Inst11
#define ACT_VECTOR_16_31_CONFIG_REG_INST11 "act_vector_16_31_Inst11"
#define ACT_VECTOR_16_31_CONFIG_REG_INST11_WIDTH 8

// config register: Inst12
#define ACT_VECTOR_16_31_CONFIG_REG_INST12 "act_vector_16_31_Inst12"
#define ACT_VECTOR_16_31_CONFIG_REG_INST12_WIDTH 8

// config register: Inst13
#define ACT_VECTOR_16_31_CONFIG_REG_INST13 "act_vector_16_31_Inst13"
#define ACT_VECTOR_16_31_CONFIG_REG_INST13_WIDTH 8

// config register: Inst14
#define ACT_VECTOR_16_31_CONFIG_REG_INST14 "act_vector_16_31_Inst14"
#define ACT_VECTOR_16_31_CONFIG_REG_INST14_WIDTH 8

// config register: Inst15
#define ACT_VECTOR_16_31_CONFIG_REG_INST15 "act_vector_16_31_Inst15"
#define ACT_VECTOR_16_31_CONFIG_REG_INST15_WIDTH 8

// PE Act Child instructions
// used to schedule PE sending data back to GB
#define PE_ACT_OUTGB_CNTR "pe_act_outgb_cntr"
#define PE_ACT_OUTGB_CNTR_BITWIDTH 3
// used to schedule PE sending PE_DONE back to GB
#define PE_ACT_DONE_CNTR "pe_act_done_cntr"
#define PE_ACT_DONE_CNTR_BITWIDTH 3

#define PE_ACT_VALID 1
#define PE_ACT_INVALID 0

#define ACT_IS_START_REG "act_is_start_reg"
#define PE_ACT_IS_START_REG_BITWIDTH 1

#define ACT_INSTR_COUNTER "act_instruction_counter"
#define PE_ACT_INSTR_COUNTER_BITWIDTH ACT_MNGR_CONFIG_REG_NUM_INST_WIDTH

#define ACT_OUTPUT_COUNTER "act_output_counter"
#define PE_ACT_OUTPUT_COUNTER_BITWIDTH 8

// PE Act Register
#define PE_ACT_REGS_NUM 4
#define PE_ACT_REGS_ADDR_WIDTH 4 // 16 entries per vector
#define PE_ACT_REGS_DATA_WIDTH 320
#define ACT_REGS "act_regs"

// PE Act control flag
#define ACT_IS_INIT_REG "act_is_init_reg"
#define PE_ACT_IS_INIT_REG_BITWIDTH 1

#define PE_ACT_FLAG_BITWIDTH 1
#define ACT_W_OUT "act_w_out"
#define ACT_W_LOAD "act_w_load"
#define ACT_W_DONE "act_w_done"
#define ACT_IS_INCR "act_is_incr"

// ACT FSM STATE
#define ACT_STATE "act_state"
#define PE_ACT_STATE_BITWIDTH 2
#define PE_ACT_STATE_IDLE 0
#define PE_ACT_STATE_EXEC 1
#define PE_ACT_STATE_DATA 2

// ACT opcode
#define ACT_OP "act_op"
#define PE_ACT_OP_BITWIDTH 4
#define PE_ACT_OP_HI_IDX 7
#define PE_ACT_OP_LO_IDX 4

#define PE_ACT_OP_LOAD 0x1
#define PE_ACT_OP_STORE 0x2
#define PE_ACT_OP_INPE 0x3
#define PE_ACT_OP_OUTGB 0x4
#define PE_ACT_OP_COPY 0x7
#define PE_ACT_OP_EADD 0x8
#define PE_ACT_OP_EMUL 0x9
#define PE_ACT_OP_SIGM 0xA
#define PE_ACT_OP_TANH 0xB
#define PE_ACT_OP_RELU 0xC
#define PE_ACT_OP_ONEX 0xD

// ACT instruction registers
// this value is to represent the index of the act vector registers
#define PE_ACT_REG_IDX_BITWIDTH 2

#define ACT_REG_A1 "act_reg_a1"
#define PE_ACT_REG_A1 PE_ACT_REG_IDX_BITWIDTH
#define PE_ACT_REG_A1_HI_IDX 1
#define PE_ACT_REG_A1_LO_IDX 0

#define ACT_REG_A2 "act_reg_a2"
#define PE_ACT_REG_A2 PE_ACT_REG_IDX_BITWIDTH
#define PE_ACT_REG_A2_HI_IDX 3
#define PE_ACT_REG_A2_LO_IDX 2

// Interface Signals
#define PE_ACT_START_SIGNAL "pe_act_start_signal"
#define ACT_START_SIGNAL "act_start_signal"
#define PE_START_SIGNAL_SHARED_BITWIDTH 1

// temp registers for holding intermediate results for storing into the memory
#define ACT_REG_TEMP "act_reg_temp"

} // namespace flex

} // namespace ilang

#endif // FLEX_PE_ACT_UNIT_H__
