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

// File: pe_core_interface.cc

#include <flex.h>

namespace ilang {

namespace flex {
//
// PE Core Interface
// 
void DefinePECoreInput(Ila& m) {
  // rva_in -- 169 bit
  m.NewBvInput("rva_in_valid", 1);
  m.NewBvInput(PE_RW,    PE_RW_WIDTH);
  m.NewBvInput(PE_ADDR,  PE_ADDR_WIDTH);
  m.NewBvInput(PE_WSTRB, PE_WSTRB_WIDTH);
  
  for (auto i = 0; i < 16; i++) {
    m.NewBvInput(VectorVarName(i, TOP_DATA_IN), TOP_DATA_IN_WIDTH);
  }

  // pe_start -- 1 bit
  m.NewBvInput("pe_start_valid", 1);
  m.NewBvInput("pe_start", 1);

  // input_port -- 138 bits
  m.NewBvInput("input_port_valid", 1);
  m.NewBvInput("input_port_data", 128);
  m.NewBvInput("input_port_index", 2);
  m.NewBvInput("input_port_addr", 8);

  // act_port 
  m.NewBvInput("act_port_ready", 1);
}

// add ports for reading data
void DefinePECoreOutput(Ila& m) {
  // rva_in 
  m.NewBvState("rva_in_ready", 1);
  // pe_start
  m.NewBvState("pe_start_ready", 1);
  // input_port
  m.NewBvState("input_port_ready", 1);

  // act_port
  // core activation vector
  // act register needs to be defined at the top level, which are accessed by
  // act child model.
  for (auto i = 0; i < PE_CORE_ACT_VECTOR_LANES; i++) {
    m.NewBvState(PEGetVarNameVector(0, i, CORE_ACT_VECTOR),
                 PE_CORE_ACT_VECTOR_BITWIDTH);
  }
  // valid bit for core act register, which are accessed by both pe_core and
  // pe_act use it to immitate push function
  m.NewBvState(PEGetVarName(0, CORE_ACT_REG_PORT_VALID),
               PE_CORE_ACT_REG_PORT_VALID_BITWIDTH);
  
  // rva_out
}

//
// PE ActUnit Interface
//
void DefinePEActInput(Ila& m) {
  // rva_in -- 169 bit
  m.NewBvInput("rva_in_valid", 1);
  m.NewBvInput(PE_RW,    PE_RW_WIDTH);
  m.NewBvInput(PE_ADDR,  PE_ADDR_WIDTH);
  m.NewBvInput(PE_WSTRB, PE_WSTRB_WIDTH);

  for (auto i = 0; i < 16; i++) {
    m.NewBvInput(VectorVarName(i, TOP_DATA_IN), TOP_DATA_IN_WIDTH);
  }
  // act_start -- 1 bit
  m.NewBvInput("act_start_valid", 1);
  m.NewBvInput("act_start", 1);

  // act_port -- 320 bits
  for (auto i = 0; i < PE_CORE_ACT_VECTOR_LANES; i++) {
    m.NewBvInput(PEGetVarNameVector(0, i, CORE_ACT_VECTOR),
                 PE_CORE_ACT_VECTOR_BITWIDTH);
  }
  m.NewBvInput(PEGetVarName(0, CORE_ACT_REG_PORT_VALID),
               PE_CORE_ACT_REG_PORT_VALID_BITWIDTH);

  // output_port
  m.NewBvInput("output_port_ready", 1);
  
  // done
  m.NewBvInput("done_ready", 1);
}

// add ports for reading data
void DefinePEActOutput(Ila& m) {
  // rva_in 
  m.NewBvState("rva_in_ready", 1);
  // act_start
  m.NewBvState("act_start_ready", 1);
  // act_port
  m.NewBvState("act_port_ready", 1);

  // output_port
  m.NewBvState("output_port_data", 128);
  m.NewBvState("output_port_addr", 8);
  m.NewBvState("output_port_valid", 1);

  // done
  m.NewBvState("done", 1);
  m.NewBvState("done_valid", 1);
  
}

}// namespace flex

} // namespace ilang
