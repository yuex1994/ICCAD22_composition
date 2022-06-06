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

// File: pe_addr_map.h

#ifndef FLEX_PE_ADDR_MAP_H__
#define FLEX_PE_ADDR_MAP_H__

namespace ilang {

namespace flex {

// XXX all address is based on the host PE* base address

// PE start signals
#define START_ADDR_PE_RNN_LAYER_SIZING 0x00000000

//
// PECore specific
//

// PECore store instruction
#define PE_CORE_STORE_WEIGHT_ADDR_MIN 0x00500000
#define PE_CORE_STORE_WEIGHT_ADDR_MAX 0x005FFFF0

#define PE_CORE_STORE_INPUT_ADDR_MIN 0x00600000
#define PE_CORE_STORE_INPUT_ADDR_MAX 0x00600FF0

// PECore cluster table instruction
#define CONFIG_ADDR_PE_CLUSTER_TABLE_FIRST (0x00400000 + 0x30)
#define CONFIG_ADDR_PE_CLUSTER_TABLE_SECOND (0x00400000 + 0x50)

// PECore memory manaager instruction
#define CONFIG_ADDR_PE_MEM_MNGR_FIRST (0x00400000 + 0x20)
#define CONFIG_ADDR_PE_MEM_MNGR_SECOND (0x00400000 + 0x40)

// PECore RNN layer sizing instruction
#define CONFIG_ADDR_PE_RNN_LAYER_SIZING_PHY_SRAM 0x00300000
#define CONFIG_ADDR_PE_RNN_LAYER_SIZING (0x00400000 + 0x10)

//
// ActUnit specific
//

// ActUnit store instrucction
#define PE_ACT_STORE_ADDR_MIN 0x00900000
#define PE_ACT_STORE_ADDR_MAX 0x009001F0

// ActUnit activation manager instruction
#define CONFIG_ADDR_PE_ACT_MNGR (0x00800000 + 0x10)

// ActUnit activation vector instruction
#define CONFIG_ADDR_PE_ACT_VECTOR_0_15 (0x00800000 + 0x20)
#define CONFIG_ADDR_PE_ACT_VECTOR_16_31 (0x00800000 + 0x30)

//
// Define PE Partition Size
//
#define PE_PARTITION_SIZE 0x01000000

} // namespace flex

} // namespace ilang

#endif // FLEX_PE_ADDR_MAP_H__
