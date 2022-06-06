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

// File: pe_core.h

#ifndef FLEX_PE_CORE_H__
#define FLEX_PE_CORE_H__

namespace ilang {

namespace flex {

// read 128-bits (16 bytes) at a time
#define CORE_SCALAR 16

// weight buffer (1 MB)
#define CORE_WEIGHT_BUFFER "core_weight_buffer"
#define CORE_WEIGHT_NUM_BANKS 16
#define CORE_WEIGHT_ENTRIES_PER_BANK 4096
#define CORE_WEIGHT_BUFFER_SIZE                                                \
  (CORE_SCALAR * CORE_WEIGHT_NUM_BANKS * CORE_WEIGHT_ENTRIES_PER_BANK)

// input buffer (4 KB)
#define CORE_INPUT_BUFFER "core_input_buffer"
#define CORE_INPUT_NUM_BANKS 16
#define CORE_INPUT_ENTRIES_PER_BANK 4096
#define CORE_INPUT_BUFFER_SIZE                                                 \
  (CORE_SCALAR * CORE_INPUT_NUM_BANKS * CORE_INPUT_ENTRIES_PER_BANK)

//
// PE core cluster table first
//
// PE Core cluster table
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY "cluster_table_first_Entry"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY_WIDTH 8

#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY "cluster_table_second_Entry"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY_WIDTH 8
// config register: Entry0
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY0 "cluster_table_first_Entry0"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY0_WIDTH 8

// config register: Entry1
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY1 "cluster_table_first_Entry1"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY1_WIDTH 8

// config register: Entry2
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY2 "cluster_table_first_Entry2"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY2_WIDTH 8

// config register: Entry3
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY3 "cluster_table_first_Entry3"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY3_WIDTH 8

// config register: Entry4
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY4 "cluster_table_first_Entry4"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY4_WIDTH 8

// config register: Entry5
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY5 "cluster_table_first_Entry5"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY5_WIDTH 8

// config register: Entry6
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY6 "cluster_table_first_Entry6"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY6_WIDTH 8

// config register: Entry7
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY7 "cluster_table_first_Entry7"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY7_WIDTH 8

// config register: Entry8
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY8 "cluster_table_first_Entry8"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY8_WIDTH 8

// config register: Entry9
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY9 "cluster_table_first_Entry9"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY9_WIDTH 8

// config register: Entry10
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY10 "cluster_table_first_Entry10"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY10_WIDTH 8

// config register: Entry11
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY11 "cluster_table_first_Entry11"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY11_WIDTH 8

// config register: Entry12
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY12 "cluster_table_first_Entry12"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY12_WIDTH 8

// config register: Entry13
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY13 "cluster_table_first_Entry13"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY13_WIDTH 8

// config register: Entry14
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY14 "cluster_table_first_Entry14"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY14_WIDTH 8

// config register: Entry15
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY15 "cluster_table_first_Entry15"
#define CLUSTER_TABLE_FIRST_CONFIG_REG_ENTRY15_WIDTH 8

//
// PE core cluster table second
//

// config register: Entry0
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY0 "cluster_table_second_Entry0"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY0_WIDTH 8

// config register: Entry1
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY1 "cluster_table_second_Entry1"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY1_WIDTH 8

// config register: Entry2
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY2 "cluster_table_second_Entry2"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY2_WIDTH 8

// config register: Entry3
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY3 "cluster_table_second_Entry3"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY3_WIDTH 8

// config register: Entry4
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY4 "cluster_table_second_Entry4"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY4_WIDTH 8

// config register: Entry5
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY5 "cluster_table_second_Entry5"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY5_WIDTH 8

// config register: Entry6
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY6 "cluster_table_second_Entry6"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY6_WIDTH 8

// config register: Entry7
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY7 "cluster_table_second_Entry7"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY7_WIDTH 8

// config register: Entry8
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY8 "cluster_table_second_Entry8"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY8_WIDTH 8

// config register: Entry9
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY9 "cluster_table_second_Entry9"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY9_WIDTH 8

// config register: Entry10
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY10 "cluster_table_second_Entry10"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY10_WIDTH 8

// config register: Entry11
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY11 "cluster_table_second_Entry11"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY11_WIDTH 8

// config register: Entry12
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY12 "cluster_table_second_Entry12"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY12_WIDTH 8

// config register: Entry13
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY13 "cluster_table_second_Entry13"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY13_WIDTH 8

// config register: Entry14
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY14 "cluster_table_second_Entry14"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY14_WIDTH 8

// config register: Entry15
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY15 "cluster_table_second_Entry15"
#define CLUSTER_TABLE_SECOND_CONFIG_REG_ENTRY15_WIDTH 8

//
// PE core memory manager first
//

// config register: zero_active
#define MEM_MNGR_FIRST_CONFIG_REG_ZERO_ACTIVE "mem_mngr_first_zero_active"
#define MEM_MNGR_FIRST_CONFIG_REG_ZERO_ACTIVE_WIDTH 1

// config register: adpfloat_bias_w
#define MEM_MNGR_FIRST_CONFIG_REG_ADPFLOAT_BIAS_W                              \
  "mem_mngr_first_adpfloat_bias_w"
#define MEM_MNGR_FIRST_CONFIG_REG_ADPFLOAT_BIAS_W_WIDTH 3

// config register: adpfloat_bias_b
#define MEM_MNGR_FIRST_CONFIG_REG_ADPFLOAT_BIAS_B                              \
  "mem_mngr_first_adpfloat_bias_b"
#define MEM_MNGR_FIRST_CONFIG_REG_ADPFLOAT_BIAS_B_WIDTH 3

// config register: adpfloat_bias_i
#define MEM_MNGR_FIRST_CONFIG_REG_ADPFLOAT_BIAS_I                              \
  "mem_mngr_first_adpfloat_bias_i"
#define MEM_MNGR_FIRST_CONFIG_REG_ADPFLOAT_BIAS_I_WIDTH 3

// config register: num_input
#define MEM_MNGR_FIRST_CONFIG_REG_NUM_INPUT "mem_mngr_first_num_input"
#define MEM_MNGR_FIRST_CONFIG_REG_NUM_INPUT_WIDTH 8

// config register: base_weight
#define MEM_MNGR_FIRST_CONFIG_REG_BASE_WEIGHT "mem_mngr_first_base_weight"
#define MEM_MNGR_FIRST_CONFIG_REG_BASE_WEIGHT_WIDTH 16

// config register: base_bias
#define MEM_MNGR_FIRST_CONFIG_REG_BASE_BIAS "mem_mngr_first_base_bias"
#define MEM_MNGR_FIRST_CONFIG_REG_BASE_BIAS_WIDTH 16

// config register: base_input
#define MEM_MNGR_FIRST_CONFIG_REG_BASE_INPUT "mem_mngr_first_base_input"
#define MEM_MNGR_FIRST_CONFIG_REG_BASE_INPUT_WIDTH 16

//
// PE core memory manager second
//

// config register: zero_active
#define MEM_MNGR_SECOND_CONFIG_REG_ZERO_ACTIVE "mem_mngr_second_zero_active"
#define MEM_MNGR_SECOND_CONFIG_REG_ZERO_ACTIVE_WIDTH 1

// config register: adpfloat_bias_w
#define MEM_MNGR_SECOND_CONFIG_REG_ADPFLOAT_BIAS_W                             \
  "mem_mngr_second_adpfloat_bias_w"
#define MEM_MNGR_SECOND_CONFIG_REG_ADPFLOAT_BIAS_W_WIDTH 3

// config register: adpfloat_bias_b
#define MEM_MNGR_SECOND_CONFIG_REG_ADPFLOAT_BIAS_B                             \
  "mem_mngr_second_adpfloat_bias_b"
#define MEM_MNGR_SECOND_CONFIG_REG_ADPFLOAT_BIAS_B_WIDTH 3

// config register: adpfloat_bias_i
#define MEM_MNGR_SECOND_CONFIG_REG_ADPFLOAT_BIAS_I                             \
  "mem_mngr_second_adpfloat_bias_i"
#define MEM_MNGR_SECOND_CONFIG_REG_ADPFLOAT_BIAS_I_WIDTH 3

// config register: num_input
#define MEM_MNGR_SECOND_CONFIG_REG_NUM_INPUT "mem_mngr_second_num_input"
#define MEM_MNGR_SECOND_CONFIG_REG_NUM_INPUT_WIDTH 8

// config register: base_weight
#define MEM_MNGR_SECOND_CONFIG_REG_BASE_WEIGHT "mem_mngr_second_base_weight"
#define MEM_MNGR_SECOND_CONFIG_REG_BASE_WEIGHT_WIDTH 16

// config register: base_bias
#define MEM_MNGR_SECOND_CONFIG_REG_BASE_BIAS "mem_mngr_second_base_bias"
#define MEM_MNGR_SECOND_CONFIG_REG_BASE_BIAS_WIDTH 16

// config register: base_input
#define MEM_MNGR_SECOND_CONFIG_REG_BASE_INPUT "mem_mngr_second_base_input"
#define MEM_MNGR_SECOND_CONFIG_REG_BASE_INPUT_WIDTH 16

//
// PE core RNN layer sizing
//

// config register: is_valid
#define RNN_LAYER_SIZING_CONFIG_REG_IS_VALID "rnn_layer_sizing_is_valid"
#define RNN_LAYER_SIZING_CONFIG_REG_IS_VALID_WIDTH 1

// config register: is_zero_first
#define RNN_LAYER_SIZING_CONFIG_REG_IS_ZERO_FIRST                              \
  "rnn_layer_sizing_is_zero_first"
#define RNN_LAYER_SIZING_CONFIG_REG_IS_ZERO_FIRST_WIDTH 1

// config register: is_cluster
#define RNN_LAYER_SIZING_CONFIG_REG_IS_CLUSTER "rnn_layer_sizing_is_cluster"
#define RNN_LAYER_SIZING_CONFIG_REG_IS_CLUSTER_WIDTH 1

// config register: is_bias
#define RNN_LAYER_SIZING_CONFIG_REG_IS_BIAS "rnn_layer_sizing_is_bias"
#define RNN_LAYER_SIZING_CONFIG_REG_IS_BIAS_WIDTH 1

// config register: num_manager
#define RNN_LAYER_SIZING_CONFIG_REG_NUM_MANAGER "rnn_layer_sizing_num_manager"
#define RNN_LAYER_SIZING_CONFIG_REG_NUM_MANAGER_WIDTH 4

// config register: num_output
#define RNN_LAYER_SIZING_CONFIG_REG_NUM_OUTPUT "rnn_layer_sizing_num_output"
#define RNN_LAYER_SIZING_CONFIG_REG_NUM_OUTPUT_WIDTH 8

//
// Define PE Core states
//
#define PE_CORE_INVALID 0
#define PE_CORE_VALID 1

#define CORE_IS_START "core_is_start"
#define PE_CORE_IS_START_BITWIDTH 1

#define PE_CORE_CNTR "pe_core_cntr"
#define PE_CORE_CNTR_BIWTDTH 3

#define PE_VALID_NUM "pe_valid_num"
#define PE_VALID_NUM_BITWIDTH 3

#define CORE_STATE "core_state"
#define PE_CORE_STATE_BITWIDTH 3

// states that defined in the specs
#define PE_CORE_STATE_IDLE 0
#define PE_CORE_STATE_PRE 1
#define PE_CORE_STATE_MAC 2
#define PE_CORE_STATE_BIAS 3
#define PE_CORE_STATE_OUT 4

// // is start register
// #define CORE_IS_START "core_is_start"
// #define PE_CORE_IS_START_BITWIDTH 1
// core manager counter
#define CORE_MNGR_CNTR "core_manager_cntr"
#define PE_CORE_MNGR_CNTR_BITWIDTH 1
#define PE_CORE_MNGR_0 0
#define PE_CORE_MNGR_1 1

// core accumulator register
#define CORE_ACCUM_VECTOR "core_accum_vector"
#define PE_CORE_ACCUM_VECTOR_BITWIDTH 32
#define PE_CORE_ACCUM_VECTOR_LANES CORE_SCALAR

#define CORE_ACT_VECTOR_REG "core_act_vector_reg"
#define PE_CORE_ACT_VECTOR_REG_BITWIDTH 32
#define PE_CORE_ACT_VECTOR_REG_LANES CORE_SCALAR

// core input counter
#define CORE_INPUT_CNTR "core_input_counter"
#define PE_CORE_INPUT_CNTR_BITWIDTH 8

// core output counter
#define CORE_OUTPUT_CNTR "core_output_counter"
#define PE_CORE_OUTPUT_CNTR_BITWIDTH 8

// core run mac child related states
#define CORE_CHILD_RUN_MAC_FLAG "core_child_run_mac_flag"
#define PE_CORE_CHILD_RUN_MAC_FLAG_BITWIDTH 1

#define CORE_CHILD_RUN_MAC_CNTR "core_child_run_mac_cntr"
#define PE_CORE_CHILD_RUN_MAC_CNTR_BITWIDTH 5

#define CORE_CHILD_RUN_MAC_WEIGHT_BASE_VECTOR                                  \
  "core_child_run_mac_weight_base_vector"
#define PE_CORE_CHILD_RUN_MAC_WEIGHT_BASE_VECTOR_BITWIDTH                      \
  MEM_MNGR_FIRST_CONFIG_REG_BASE_WEIGHT_WIDTH

#define CORE_CHILD_RUN_MAC_INPUT_BASE_VECTOR                                   \
  "core_child_run_mac_input_base_vector"
#define PE_CORE_CHILD_RUN_MAC_INPUT_BASE_VECTOR_BITWIDTH                       \
  MEM_MNGR_FIRST_CONFIG_REG_BASE_INPUT_WIDTH

#define CORE_RUN_MAC_CHILD_STATE "core_run_mac_child_state"
#define PE_CORE_RUN_MAC_CHILD_STATE_BITWIDTH 4

#define PE_CORE_RUN_MAC_STATE_FETCH_NON_CLUSTER 0
#define PE_CORE_RUN_MAC_STATE_FETCH_CLUSTER 1
#define PE_CORE_RUN_MAC_STATE_MUL 2
#define PE_CORE_RUN_MAC_STATE_OUT 3

#define CORE_RUN_MAC_CHILD_WEIGHT_BYTE "core_run_mac_child_weight_byte"
#define PE_CORE_RUN_MAC_CHILD_WEIGHT_BYTE_BITWIDTH 8
#define CORE_RUN_MAC_CHILD_INPUT_BYTE "core_run_mac_child_input_byte"
#define PE_CORE_RUN_MAC_CHILD_INPUT_BYTE_BITWIDTH 8

#define CORE_RUN_BIAS_CHILD_FLAG "core_child_run_bias_flag"
#define PE_CORE_RUN_BIAS_CHILD_FLAG_BITWIDTH 1
#define CORE_RUN_BIAS_CHILD_CNTR "core_run_bias_child_cntr"
#define PE_CORE_RUN_BIAS_CHILD_CNTR_BITWIDTH 5

// update 06022020: add temp registers for run_mac_mul to reduce overhead
#define CORE_RUN_MAC_CHILD_RESULT_TEMP "core_run_mac_child_result_temp"
#define PE_CORE_RUN_MAC_CHILD_RESULT_TEMP_BITWIDTH PE_CORE_ACCUM_VECTOR_BITWIDTH

/****** shared states between pe_core and pe_act ********/
// valid bit for pe_act_reg, immitate the push function,
#define CORE_ACT_REG_PORT_VALID "act_reg_port_valid"
#define PE_CORE_ACT_REG_PORT_VALID_BITWIDTH 1

// core activation vector type
#define CORE_ACT_VECTOR "core_act_vector"
#define PE_CORE_ACT_VECTOR_BITWIDTH 20
#define PE_CORE_ACT_VECTOR_LANES CORE_SCALAR

/****** uninterpreted function ******/
#define PE_CORE_SCALAR_BITWIDTH 8
#define PE_CORE_ACCUMSCALAR_BITWIDTH 32
#define PE_CORE_ACTSCALAR_BITWIDTH 20
#define PE_CORE_ADPFLOAT_BIAS_B_BITWIDTH 3
#define PE_CORE_ADPFLOAT_BIAS_BITWIDTH 3

/******* Interface Signals ******/
#define PE_CORE_START_SIGNAL "pe_core_start_signal"
#define PE_ACT_START_SIGNAL "pe_act_start_signal"
#define PE_START_SIGNAL_SHARED_BITWIDTH 1

#define PE_DONE_SIGNAL_SHARED "pe_done_signal_shared"
#define PE_DONE_SIGNAL_SHARED_BITWIDTH 1

} // namespace flex

} // namespace ilang

#endif // FLEX_PE_CORE_H__
