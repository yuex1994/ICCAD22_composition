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

// File: pe_store.cc

#include <flex.h>

namespace ilang {

namespace flex {

void DefinePECoreStore(Ila& m, const int& pe_idx) {

  { // instruction 0 ---- PE Core Store in Weight buffer
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "CORE_STORE_WEIGHT_BUFFER"));

    auto is_write = m.input(PE_RW);
    auto addr_base = TOP_ADDR_BASE + (pe_idx + 1) * PE_PARTITION_SIZE;
    auto valid_addr =
        (m.input(PE_ADDR) >= (PE_CORE_STORE_WEIGHT_ADDR_MIN)) &
        (m.input(PE_ADDR) <= (PE_CORE_STORE_WEIGHT_ADDR_MAX));
    // ILA_INFO << "PE " << pe_idx << " base addr: " << std::hex << addr_base;

    instr.SetDecode(is_write & valid_addr);

    auto mem = m.state(PEGetVarName(pe_idx, CORE_WEIGHT_BUFFER));
    auto addr = Concat(BvConst(0,8), m.input(PE_ADDR)) - PE_CORE_STORE_WEIGHT_ADDR_MIN;

    auto mem_next = Store(mem, (addr + 0), m.input(TOP_DATA_IN_0));

    for (auto i = 1; i < 15; i++) {
      mem_next = Store(mem_next, (addr + i), m.input(VectorVarName(i, TOP_DATA_IN)));
    }

    instr.SetUpdate(mem, Store(mem_next, (addr + 15), m.input(TOP_DATA_IN_15)));
  }

  { // instruction 1 ---- PE Core Store for input buffer
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "CORE_STORE_INPUT_BUFFER"));

    auto is_write = m.input(PE_RW);
    auto addr_base = TOP_ADDR_BASE + (pe_idx + 1) * PE_PARTITION_SIZE;
    auto valid_addr =
        (m.input(PE_ADDR) >= (PE_CORE_STORE_INPUT_ADDR_MIN)) &
        (m.input(PE_ADDR) <= (PE_CORE_STORE_INPUT_ADDR_MAX));

    instr.SetDecode(is_write & valid_addr);

    auto mem = m.state(PEGetVarName(pe_idx, CORE_INPUT_BUFFER));
    auto addr = Concat(BvConst(0,8), m.input(PE_ADDR)) - PE_CORE_STORE_INPUT_ADDR_MIN;

    auto mem_next = Store(mem, (addr + 0), m.input(TOP_DATA_IN_0));

    for (auto i = 1; i < 15; i++) {
      mem_next = Store(mem_next, (addr + i), m.input(VectorVarName(i, TOP_DATA_IN)));
    }

    instr.SetUpdate(mem, Store(mem_next, (addr + 15), m.input(TOP_DATA_IN_15)));
  }
}

void DefinePEActStore(Ila& m, const int& pe_idx) {
  // update 04132020: change the function name from PECoreStore to PEStore to
  // include the store function to activation buffer, which is visible at the
  // AXI interface.
  { // instructions 2 ---- PE Act Store for Act Buffer
    auto instr = m.NewInstr(PEGetInstrName(pe_idx, "ACT_STORE_BUFFER"));

    auto is_write = m.input(PE_RW);
    auto valid_addr = (m.input(PE_ADDR) >= (PE_ACT_STORE_ADDR_MIN) ) &
                      (m.input(PE_ADDR) <= (PE_ACT_STORE_ADDR_MAX) );

    instr.SetDecode(is_write & valid_addr);

    auto mem = m.state(PEGetVarName(pe_idx, ACT_BUFFER));
    auto addr = Concat(BvConst(0,8), m.input(PE_ADDR)) - PE_ACT_STORE_ADDR_MIN;

    auto mem_next = Store(mem, (addr + 0), m.input(TOP_DATA_IN_0));

    for (auto i = 1; i < 15; i++) {
      mem_next = Store(mem_next, (addr + i), m.input(VectorVarName(i, TOP_DATA_IN)));
    }

    instr.SetUpdate(mem, Store(mem_next, (addr + 15), m.input(TOP_DATA_IN_15)));
  }
}

} // namespace flex

} // namespace ilang
