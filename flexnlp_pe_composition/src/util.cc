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

// File: util.cc

#include <ilang/ilang++.h>
#include <ilang/util/log.h>

#include <flex.h>

namespace ilang {

namespace flex {

void SetUpdateForConfigWr(Ila& m, InstrRef& instr, const ExprRef& next,
                          const std::string& state_name) {
  auto state = m.state(state_name);

  ILA_ASSERT(state.bit_width() <= next.bit_width())
      << "Bit-width error " << state;

  if (state.bit_width() == next.bit_width()) {
    instr.SetUpdate(state, next);
  } else if (state.bit_width() == 1) {
    instr.SetUpdate(state, next(0));
  } else {
    instr.SetUpdate(state, next(state.bit_width() - 1, 0));
  }
}

ExprRef FetchClusterLUT_First(Ila& m, const int& pe_idx, const ExprRef& index) {
    auto lut = m.state(PEGetVarName(pe_idx, CLUSTER_TABLE_0_STATE_MEM));
    auto addr = Concat(BvConst(0, 32-index.bit_width()), index);
    return Load(lut, addr);
}

ExprRef FetchClusterLUT_Second(Ila& m, const int& pe_idx,
                               const ExprRef& index) {
    auto lut = m.state(PEGetVarName(pe_idx, CLUSTER_TABLE_1_STATE_MEM));
    auto addr = Concat(BvConst(0, 32-index.bit_width()), index);
    return Load(lut, addr);
}


ExprRef PEActInstrFetch(Ila& m, const int& pe_idx, const ExprRef& instr_cntr) {
    auto result = m.state(VectorVarName(0, ACT_VECTOR_0_15_CONFIG_REG_INST));
    for (auto i = 0; i < 16; i++) {
      result = Ite(instr_cntr == i, m.state(VectorVarName(i, ACT_VECTOR_0_15_CONFIG_REG_INST)), result);
    }
    for (auto i = 16; i < 32; i ++) {
      result = Ite(instr_cntr == i, m.state(VectorVarName(i-16, ACT_VECTOR_16_31_CONFIG_REG_INST)), result);
    }
    return result;
}

std::string VectorVarName(const int& v_idx, const std::string& var_name) {
  auto suffix = std::to_string(v_idx);
  return var_name + "_" + suffix;
}

} // namespace flex

} // namespace ilang
