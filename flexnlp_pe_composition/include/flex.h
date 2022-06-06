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

// File: flex.h

#ifndef FLEX_FLEX_H__
#define FLEX_FLEX_H__

#include <string>

#include <ilang/ilang++.h>

#include <adpfloat_spec.h>
#include <pe_config.h>
#include <top_config.h>
#include <util.h>

namespace ilang {

namespace flex {
// PE_Core
Ila GetPECoreIla(const std::string& model_name = "pe_core", const int& pe_idx = 0);
void DefinePECoreInput(Ila& m);
void DefinePECoreOutput(Ila& m);
void DefinePECoreConfigState(Ila& m, const int& pe_idx);
void DefinePECoreOtherState(Ila& m, const int& pe_idx);
void DefinePECoreInitConditions(Ila& m);
void DefinePECoreConfigInstr(Ila& m, const int& pe_idx);
void DefinePECoreStore(Ila& m, const int& pe_idx);
void DefinePECore(Ila& m, const int& pe_idx);
void DefinePEInternalStates(Ila& m);
void DefinePEInternalStates(Ila& m, const int& pe_idx);

// PE_Act
Ila GetPEActIla(const std::string& model_name = "pe_core", const int& pe_idx = 0);
void DefinePEActInput(Ila& m);
void DefinePEActOutput(Ila& m);
void DefinePEActConfigState(Ila& m, const int& pe_idx);
void DefinePEActOtherState(Ila& m, const int& pe_idx);
void DefinePEActInitConditions(Ila& m);
void DefinePEActConfigInstr(Ila& m, const int& pe_idx);
void DefinePEActStore(Ila& m, const int& pe_idx);
void DefinePEAct(Ila& m, const int& pe_idx);


void DefineTopInput(Ila& m);

void DefineTopOutput(Ila& m);

void DefineSharedState(Ila& m);

void DefineGBConfigState(Ila& m);
void DefineGBOtherState(Ila& m);

void DefinePEConfigState(Ila& m, const int& pe_idx);
void DefinePEOtherState(Ila& m, const int& pe_idx);

void DefineInitConditons(Ila& m);

void DefineGBConfigInstr(Ila& m);
void DefinePEConfigInstr(Ila& m, const int& pe_idx, const uint64_t& base);

void DefineGBCoreStore(Ila& m);
void DefineGBCoreLoad(Ila& m);

void DefinePEActLoad(Ila& m, const int& pe_idx, const uint64_t& base);

void DefineStartGBAttention(Ila& m);
void DefineStartGBControl(Ila& m);
void DefineStartGBLayerNorm(Ila& m);
void DefineStartGBLayerReduce(Ila& m);
void DefineStartGBZeroPadding(Ila& m);

void DefineStartPERnnLayerSizing(Ila& m, const int& pe_idx,
                                 const uint64_t& base);

void DefineGBInternalStates(Ila& m);


} // namespace flex

} // namespace ilang

#endif // FLEX_FLEX_H__
