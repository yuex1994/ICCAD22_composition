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

// File: flex.cc

#include <flex.h>

namespace ilang {

namespace flex {

Ila GetPECoreIla(const std::string& model_name, const int& pe_idx) {
    auto m = Ila(model_name);

    SetUnsignedComparison(true);
    
    //
    // Interface Signals
    //
    DefinePECoreInput(m);
    DefinePECoreOutput(m);

    //
    // Arch States
    //
    DefinePECoreConfigState(m, pe_idx);
    DefinePECoreOtherState(m, pe_idx);

    // 
    // Initial Conditions
    //
    DefinePECoreInitConditions(m);

    //
    // Instructions
    //
    // Config Instructions
    DefinePECoreConfigInstr(m, pe_idx);
    // Store Instructions
    DefinePECoreStore(m, pe_idx);
    // Regular Instructions
    DefinePECore(m, pe_idx);

    return m;
}

Ila GetPEActIla(const std::string& model_name, const int& pe_idx) {
    auto m = Ila(model_name);

    SetUnsignedComparison(true);
    
    //
    // Interface Signals
    //
    DefinePEActInput(m);
    DefinePEActOutput(m);

    //
    // Arch States
    //
    DefinePEActConfigState(m, pe_idx);
    DefinePEActOtherState(m, pe_idx);

    // 
    // Initial Conditions
    //
    DefinePEActInitConditions(m);

    //
    // Instructions
    //
    // Config Instructions
    DefinePEActConfigInstr(m, pe_idx);
    // Store Instructions
    DefinePEActStore(m, pe_idx);
    // Regular Instructions
    DefinePEAct(m, pe_idx);

    return m;
}

}// namespace flex

} // namespace ilang
