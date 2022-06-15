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

// File: csc.cc

#include <ilang/ilang++.h>

#include <csc_config.h>

namespace ilang {

void DefineCSCOutput(Ila& m) {
    m.NewBvState("data_valid", 1);
    m.NewBvState("weight_valid", 1);
    // Config Ready
    m.NewBvState("csb_rdy", 1);

}

void DefineCSCState(Ila& m) {
    // Config Registers
    // // 6000
    // m.NewBvState(NVDLA_CSC_S_STATUS_0, NVDLA_CSC_S_STATUS_WIDTH);
    // m.NewBvState(NVDLA_CSC_S_STATUS_1, NVDLA_CSC_S_STATUS_WIDTH);

    // 6004
    m.NewBvState(NVDLA_CSC_S_PRODUCER, NVDLA_CSC_S_PRODUCER_WIDTH);
    m.NewBvState(NVDLA_CSC_S_CONSUMER, NVDLA_CSC_S_CONSUMER_WIDTH);

    for (auto i = 0; i < 2; i++) {
        // 6008
        m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_OP_ENABLE, NVDLA_CSC_D_OP_ENABLE_WIDTH);
        // // 600c
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_MISC_CFG, NVDLA_CSC_D_MISC_CFG_WIDTH);
        // // 6010
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_DATAIN_FORMAT, NVDLA_CSC_D_DATAIN_FORMAT_WIDTH);
        // // 6014
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_DATAIN_HEIGHT_EXT, NVDLA_CSC_D_DATAIN_SIZE_EXT_WIDTH);
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_DATAIN_WIDTH_EXT, NVDLA_CSC_D_DATAIN_SIZE_EXT_WIDTH);
        // // 6018
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_DATAIN_CHANNEL_EXT, NVDLA_CSC_D_DATAIN_SIZE_EXT_WIDTH);
        // // 601c
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_BATCH_NUMBER, NVDLA_CSC_D_BATCH_NUMBER_WIDTH);
        // // 6020
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_POST_Y_EXTENSION, NVDLA_CSC_D_POST_Y_EXTENSION_WIDTH);
        // // 6024
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_ENTRY_PER_SLICE, NVDLA_CSC_D_ENTRY_PER_SLICE_WIDTH);
        // // 6028
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_WEIGHT_FORMAT, NVDLA_CSC_D_WEIGHT_FORMAT_WIDTH);
        // // 602c
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_WEIGHT_HEIGHT_EXT, NVDLA_CSC_D_WEIGHT_SIZE_EXT_0_WIDTH);
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_WEIGHT_WIDTH_EXT, NVDLA_CSC_D_WEIGHT_SIZE_EXT_0_WIDTH);
        // // 6030
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_WEIGHT_CHANNEL_EXT, NVDLA_CSC_D_WEIGHT_SIZE_EXT_1_WIDTH);
        // // 6034
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_WEIGHT_BYTES, NVDLA_CSC_D_WEIGHT_BYTES_WIDTH);
        // // 6038
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_WMB_BYTES, NVDLA_CSC_D_WMB_BYTES_WIDTH);
        // // 603c
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_DATAOUT_WIDTH, NVDLA_CSC_D_DATAOUT_SIZE_WIDTH);
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_DATAOUT_HEIGHT, NVDLA_CSC_D_DATAOUT_SIZE_WIDTH);
        // // 6040
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_DATAOUT_CHANNEL, NVDLA_CSC_D_DATAOUT_SIZE_WIDTH);
        // // 6044
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_ATOMICS, NVDLA_CSC_D_ATOMICS_WIDTH);
        // // 6048
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_RELEASE, NVDLA_CSC_D_RELEASE_WIDTH);
        // // 604c
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_CONV_X_STRIDE_EXT, NVDLA_CSC_D_CONV_STRIDE_EXT_WIDTH);
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_CONV_Y_STRIDE_EXT, NVDLA_CSC_D_CONV_STRIDE_EXT_WIDTH);
        // // 6050
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_X_DILATION_EXT, NVDLA_CSC_D_DILATION_EXT_WIDTH);
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_Y_DILATION_EXT, NVDLA_CSC_D_DILATION_EXT_WIDTH);
        // // 6054
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_ZERO_PADDING_LEFT, NVDLA_CSC_D_ZERO_PADDING_WIDTH);
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_ZERO_PADDING_TOP, NVDLA_CSC_D_ZERO_PADDING_WIDTH);
        // // 6058
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_ZERO_PADDING_VALUE, NVDLA_CSC_D_ZERO_PADDING_VALUE_WIDTH);
        // 605c
        m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_DATA_BANK, NVDLA_CSC_D_BANK_WIDTH);
        m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_WEIGHT_BANK, NVDLA_CSC_D_BANK_WIDTH);
        // // 6060
        // m.NewBvState("group" + (std::to_string(i)) + "_" + NVDLA_CSC_D_PRA_CFG, NVDLA_CSC_D_PRA_CFG_WIDTH);
    }

    // // States
    // m.NewBvState("credits", 9);

    // State
    m.NewBvState("csc_state", 2);
    m.NewBvState("last_weight_bank", NVDLA_CSC_D_BANK_WIDTH);
    m.NewBvState("last_data_bank", NVDLA_CSC_D_BANK_WIDTH);
}


} // namespace ilang