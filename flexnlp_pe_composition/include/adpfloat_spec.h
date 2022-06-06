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

// File: adpflow_spec.h

#ifndef FLEX_ADPFLOAT_SPEC__
#define FLEX_ADPFLOAT_SPEC__

#include <ilang/ilang++.h>

namespace ilang {

namespace flex {

// define the adaptive flow related specs here
#define ADPTFLOW_WIDTH 8
#define ADPTFLOW_EXP_WIDTH 3
#define ADPTFLOW_MAN_WIDTH (ADPTFLOW_WIDTH - ADPTFLOW_EXP_WIDTH - 1)
#define ADPTFLOW_SIGN_BIT_IDX (ADPTFLOW_WIDTH - 1)
#define ADPTFLOW_OFFSET -10
#define ADPTFLOW_OFFSET_NEG 10

#define ACT_WORD_WIDTH 20
#define ACCUM_WORD_WIDTH 32
#define ACT_NUM_FRAC 14
#define ACT_WORD_MAX 0x7FFFF

#define ATTENTION_WORD_WIDTH 32
#define ATTENTION_NUM_FRAC 20
#define ATTENTION_NUM_INT (ATTENTION_WORD_WIDTH - ATTENTION_NUM_FRAC)
#define ATTENTION_WORD_MIN 0xC0000000
#define ATTENTION_HIGH_NEG 0xFC000000

} // namespace flex

} // namespace ilang
#endif
