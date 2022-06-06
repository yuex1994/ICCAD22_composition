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

// File: util.h

#ifndef FLEX_UTIL_H__
#define FLEX_UTIL_H__

#include <ilang/ilang++.h>

namespace ilang {

namespace flex {

#define SetDecodeForConfigWr(addr)                                             \
  instr.SetDecode(is_write&(m.input(TOP_ADDR_IN) == (TOP_GB_ADDR_MIN + addr)));

#define SetDecodeForPECoreConfigWr(addr)                                             \
  instr.SetDecode(is_write&(m.input(PE_ADDR) == addr & receive));

#define SetDecodeForPEActConfigWr(addr)                                             \
  instr.SetDecode(is_write&(m.input(PE_ADDR) == addr & receive));

void SetUpdateForConfigWr(Ila& m, InstrRef& instr, const ExprRef& next,
                          const std::string& state_name);

ExprRef FetchClusterLUT_First(Ila& m, const int& pe_idx, const ExprRef& index);
ExprRef FetchClusterLUT_Second(Ila& m, const int& pe_idx, const ExprRef& index);

ExprRef GetGBLargeBaseAddr(const ExprRef& timestep_idx, const ExprRef& num_vector);
// helper functions in PEActUnit
ExprRef PEActInstrFetch(Ila& m, const int& pe_idx, const ExprRef& instr_cntr);

// helper function in PEAttention
ExprRef GBGetSmallBufBase(Ila& m, const ExprRef& mem_small_index);

std::string VectorVarName(const int& v_idx, const std::string& var_name);


} // namespace flex

} // namespace ilang

#endif // FLEX_UTIL_H__
