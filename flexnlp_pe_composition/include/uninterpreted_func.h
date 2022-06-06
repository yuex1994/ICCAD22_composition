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

// File: uninterpreted_func.h

// This file declares the uninterpreted functions used in the model

#ifndef FLEX_UNINTERPRETED_FUNC_H__
#define FLEX_UNINTERPRETED_FUNC_H__

#include <vector>

#include <ilang/ilang++.h>

#include <flex.h>

namespace ilang {

namespace flex {

// uninterpreted functions
static auto uf_out = SortRef::BV(TOP_DATA_IN_WIDTH);
static auto uf_in1 = SortRef::BV(TOP_DATA_IN_WIDTH);
static auto uf_in2 = SortRef::BV(TOP_DATA_IN_WIDTH);

// uninterpreted functions used in LayerReduce
static FuncRef GBAdpfloat_max("GBAdpfloat_max", uf_out, uf_in1, uf_in2);
static FuncRef GBAdpfloat_mean("GBAdpfloat_mean", uf_out, uf_in1, uf_in2);
static FuncRef GBAdpfloat_add("GBAdpfloat_add", uf_out, uf_in1, uf_in2);

// uninterpreted functions used in pe_core
static auto uf_accum_scalar = SortRef::BV(PE_CORE_ACCUMSCALAR_BITWIDTH);
static auto uf_accum_bias = SortRef::BV(PE_CORE_ADPFLOAT_BIAS_BITWIDTH);
static std::vector<SortRef> right_shift_input = {uf_accum_scalar, uf_accum_bias,
                                                 uf_accum_bias};
static FuncRef PECoreAccumRightShift("PECoreAccumRightShift", uf_accum_scalar,
                                     right_shift_input);

static auto uf_accum_bias_input = SortRef::BV(PE_CORE_SCALAR_BITWIDTH);
static auto uf_accum_bias_bias = SortRef::BV(PE_CORE_ADPFLOAT_BIAS_B_BITWIDTH);
static std::vector<SortRef> get_bias_input = {
    uf_accum_scalar, uf_accum_bias_input, uf_accum_bias_bias};
static FuncRef PECoreAccumGetBiasOut("PECoreAccumGetBiasOut", uf_accum_scalar,
                                     get_bias_input);

static FuncRef PECoreAccumOverflowCheck("PECoreAccumOverflowCheck",
                                        uf_accum_scalar, uf_accum_scalar);

static auto uf_act_reg_scalar = SortRef::BV(PE_CORE_ACTSCALAR_BITWIDTH);
static FuncRef PECoreAccum2ActReg("PECoreAccum2ActReg", uf_act_reg_scalar,
                                  uf_accum_scalar);

// uninterpreted functions in pe_core_run_mac
static auto uf_product_sum_in_1 = SortRef::BV(PE_CORE_SCALAR_BITWIDTH);
static auto uf_product_sum_in_2 = SortRef::BV(PE_CORE_SCALAR_BITWIDTH);
static auto uf_product_sum_out = SortRef::BV(PE_CORE_ACCUMSCALAR_BITWIDTH);

static FuncRef ProductSum("ProductSum", uf_product_sum_out, uf_product_sum_in_1,
                          uf_product_sum_in_2);

static auto uf_accum_add_in_1 = SortRef::BV(PE_CORE_ACCUMSCALAR_BITWIDTH);
static auto uf_accum_add_in_2 = SortRef::BV(PE_CORE_ACCUMSCALAR_BITWIDTH);
static auto uf_accum_add_out = SortRef::BV(PE_CORE_ACCUMSCALAR_BITWIDTH);

static FuncRef AccumAdd("AccumAdd", uf_accum_add_out, uf_accum_add_in_1,
                        uf_accum_add_in_2);
static FuncRef AccumAdd2("AccumAdd2", uf_accum_add_out, uf_accum_add_in_1,
                         uf_accum_add_in_2);

// uninterpreted functions in pe_act.cc
static auto uf_act_in1 = SortRef::BV(PE_CORE_ACT_VECTOR_BITWIDTH);
static auto uf_act_in2 = SortRef::BV(PE_CORE_ACT_VECTOR_BITWIDTH);
static auto uf_act_out = SortRef::BV(PE_CORE_ACT_VECTOR_BITWIDTH);

static auto uf_scalar_type = SortRef::BV(TOP_DATA_IN_WIDTH);
static auto uf_act_type = SortRef::BV(PE_CORE_ACT_VECTOR_BITWIDTH);
static auto uf_adpbias_type =
    SortRef::BV(ACT_MNGR_CONFIG_REG_ADPFLOAT_BIAS_WIDTH);

static FuncRef Adptfloat2Fixed("Adptfloat2Fixed", uf_act_type, uf_scalar_type,
                               uf_adpbias_type);
static FuncRef Fixed2Adptfloat("Fixed2Adaptfloat", uf_scalar_type, uf_act_type,
                               uf_adpbias_type);

static FuncRef PEActEadd("PEActEadd", uf_act_out, uf_act_in1, uf_act_in2);
static FuncRef PEActEmul("PEActEmul", uf_act_out, uf_act_in1, uf_act_in2);
static FuncRef PEActSigmoid("PEActSigmoid", uf_act_out, uf_act_in1);
static FuncRef PEActTanh("PEActTanh", uf_act_out, uf_act_in1);
static FuncRef PEActRelu("PEActRelu", uf_act_out, uf_act_in1);
static FuncRef PEActOnex("PEActOnex", uf_act_out, uf_act_in1);

} // namespace flex

} // namespace ilang

#endif // FLEX_UNINTERPRETED_FUNC_H__
