#include "systemc.h"
#include "flex.h"
#include <nvhls_int.h>
#include <nvhls_types.h>
#include <nvhls_vector.h>
#include <nvhls_module.h>

#include <ac_int.h>
#include <ac_fixed.h>
#include <ac_math.h>
#include <ac_math/ac_sigmoid_pwl.h>
#include <ac_math/ac_tanh_pwl.h>
#include <ac_math/ac_div.h>
#include <ac_math/ac_pow_pwl.h>
#include <ac_math/ac_inverse_sqrt_pwl.h>
#include "SM6Spec.h"
#include "AdpfloatUtils.h"
#include "AdpfloatSpec.h"

#include <fstream>

static int counter = 0;

// GBAttentionLSH: left-shift function used in gb_attention
sc_biguint<32> flex::GBAttentionLSH(sc_biguint<32> arg_0, sc_biguint<32> arg_1) {
  sc_bigint<32> arg_0_s = arg_0;
  sc_bigint<32> arg_1_s = arg_1;
  NVINT32 tmp_out = arg_0_s.to_int();
  NVINT32 shift_amout = arg_1_s.to_int();
  tmp_out = tmp_out << shift_amout;
  sc_bigint<32> result_s = tmp_out.to_int();
  sc_biguint<32> result = result_s;

  return result;
}

// GBAttentionRSH: right-shift function used in gb_attention
sc_biguint<32> flex::GBAttentionRSH(sc_biguint<32> arg_0, sc_biguint<32> arg_1) {
  sc_bigint<32> arg_0_s = arg_0;
  sc_bigint<32> arg_1_s = arg_1;
  NVINT32 tmp_out = arg_0_s.to_int();
  NVINT32 shift_amout = arg_1_s.to_int();
  tmp_out = tmp_out >> shift_amout;
  sc_bigint<32> result_s = tmp_out.to_int();
  sc_biguint<32> result = result_s;

  return result;
}

// GBAttentionMax: finding the maximum values used in gb_attention
sc_biguint<32> flex::GBAttentionMax(sc_biguint<32> arg_0, sc_biguint<32> arg_1) {
  sc_bigint<32> arg_0_s = arg_0;
  sc_bigint<32> arg_1_s = arg_1;
  spec::AttentionScalarType max_val_next = arg_0_s.to_int();
  spec::AttentionScalarType accum_scalar = arg_1_s.to_int();
  spec::AttentionScalarType out_tmp = (max_val_next > accum_scalar) ? max_val_next : accum_scalar;
  sc_bigint<32> result_s = out_tmp.to_int();
  sc_biguint<32> result = result_s;

  return result;
}

// GBAttentionSUb: attention scalar sub used in gb_attention
sc_biguint<32> flex::GBAttentionSub(sc_biguint<32> arg_0, sc_biguint<32> arg_1) {
  sc_bigint<32> arg_0_s = arg_0;
  sc_bigint<32> arg_1_s = arg_1;
  spec::AttentionScalarType in_0 = arg_0_s.to_int();
  spec::AttentionScalarType in_1 = arg_1_s.to_int();
  spec::AttentionScalarType out = in_0 - in_1;
  sc_bigint<32> result_s = out.to_int();
  sc_biguint<32> result = result_s;

  return result;
}

// GBAttentionExp: attention scalar exponential used in gb_attention
sc_biguint<32> flex::GBAttentionExp(sc_biguint<32> arg_0) {
  sc_bigint<32> arg_0_s = arg_0;
  spec::AttentionScalarType in = arg_0_s.to_int();
  spec::AttentionScalarType out_tmp;

  ac_fixed<spec::kAttentionWordWidth, spec::kAttentionNumInt, true, AC_TRN, AC_WRAP> in_ac; 
  ac_fixed<spec::kAttentionWordWidth, spec::kAttentionNumInt, false, AC_TRN, AC_WRAP> out_ac;

  in_ac.set_slc(0, in);

  out_ac = ac_math::ac_exp_pwl
            <ac_fixed<spec::kAttentionWordWidth, spec::kAttentionNumInt, false, AC_TRN, AC_WRAP> >(in_ac);

  out_tmp.set_slc(0, nvhls::get_slc<spec::kAttentionWordWidth>(out_ac, 0));

  sc_bigint<32> result_s = out_tmp.to_int();
  sc_biguint<32> result = result_s;

  return result;
}

// GBAttentionDiv: attention scalar div used in gb_attention
sc_biguint<32> flex::GBAttentionDiv(sc_biguint<32> arg_0, sc_biguint<32> arg_1) {
  sc_bigint<32> arg_0_s = arg_0;
  sc_bigint<32> arg_1_s = arg_1;
  spec::AttentionScalarType in_0 = arg_0_s.to_int();
  spec::AttentionScalarType in_1 = arg_1_s.to_int();
  spec::AttentionScalarType out_tmp;

  ac_fixed<spec::kAttentionWordWidth, spec::kAttentionNumInt, true, AC_TRN, AC_WRAP> in_1_ac, in_2_ac; 
  ac_fixed<spec::kAttentionWordWidth, spec::kAttentionNumInt, true, AC_TRN, AC_WRAP> out_ac;  
  
  ac_fixed<6, 2, false, AC_TRN, AC_WRAP> in_1_reduce, in_2_reduce;
  ac_fixed<10, 2, false, AC_TRN, AC_WRAP> out_reduce;
  

  in_1_ac.set_slc(0, in_0);
  in_2_ac.set_slc(0, in_1);
  
  in_1_reduce = in_1_ac;
  in_2_reduce = in_2_ac;
  
  ac_math::ac_div(in_1_reduce, in_2_reduce, out_reduce);

  out_ac = out_reduce;
  out_tmp.set_slc(0, nvhls::get_slc<spec::kAttentionWordWidth>(out_ac, 0));

  sc_bigint<32> result_s = out_tmp.to_int();
  sc_biguint<32> result = result_s;

  return result;
}

// GBAttentionCompress: attention scalar compress used in gb_attention
sc_biguint<8> flex::GBAttentionCompress(sc_biguint<32> arg_0, sc_biguint<3> arg_1) {
  sc_bigint<32> arg_0_s = arg_0;

  AdpfloatType<spec::kAdpfloatWordWidth,spec::kAdpfloatExpWidth> tmp;
  NVINTW(26) reduce = arg_0_s.to_int();
  spec::AdpfloatBiasType adpbias = arg_1.to_uint();
  tmp.set_value_fixed<26, spec::kAttentionNumFrac>(reduce, adpbias);

  spec::ScalarType out_tmp = tmp.to_rawbits();
  
  sc_biguint<32> result = out_tmp.to_uint();

  return result;
}


// GBNormAdd used in LayerNorm
sc_biguint<24> flex::GBNormAdd_24_20(sc_biguint<24> arg_0, sc_biguint<20> arg_1) {
  sc_bigint<24> arg_0_s = arg_0;
  sc_bigint<20> arg_1_s = arg_1;
  spec::LayerNormSumType in_0 = arg_0_s.to_int();
  spec::ActScalarType in_1 = arg_1_s.to_int();
  spec::LayerNormSumType out = in_0 + in_1;
  sc_bigint<24> result_s = out.to_int();
  sc_biguint<24> result = result_s;

  return result;
}

// GBNormDivide
sc_biguint<20> flex::GBNormDivide_24(sc_biguint<24> arg_0, sc_biguint<24> arg_1) {
  sc_bigint<24> arg_0_s = arg_0;
  sc_bigint<24> arg_1_s = arg_1;
  spec::LayerNormSumType in_0 = arg_0_s.to_int();
  spec::LayerNormSumType in_1 = arg_1_s.to_int();
  spec::ActScalarType out = in_0 / in_1;
  sc_bigint<20> result_s = out.to_int();
  sc_biguint<20> result = result_s;

  return result;
}

// ActSignedMinus
sc_biguint<20> flex::ActSignedMinus(sc_biguint<20> arg_0, sc_biguint<20> arg_1) {
  sc_bigint<20> arg_0_s = arg_0;
  sc_bigint<20> arg_1_s = arg_1;
  spec::ActScalarType in_0 = arg_0_s.to_int();
  spec::ActScalarType in_1 = arg_1_s.to_int();
  spec::ActScalarType out = in_0 - in_1;
  sc_bigint<20> result_s = out.to_int();
  sc_biguint<20> result = result_s;

  return result;
}

// SInvSqrt
sc_biguint<20> flex::SInvSqrt(sc_biguint<20> arg_0) {
  
  sc_bigint<20> arg_0_s = arg_0;
  spec::ActScalarType in = arg_0_s.to_int();

  spec::ActScalarType out_tmp;
  
  ac_fixed<spec::kActWordWidth, spec::kActNumInt, false, AC_TRN, AC_WRAP> in_ac; 
  ac_fixed<spec::kActWordWidth, spec::kActNumInt, false, AC_TRN, AC_WRAP> out_ac;  
  in_ac.set_slc(0, in);
  ac_math::ac_inverse_sqrt_pwl(in_ac, out_ac);
  out_tmp.set_slc(0, nvhls::get_slc<spec::kActWordWidth>(out_ac, 0));
  
  sc_bigint<20> result_s = out_tmp.to_int();
  sc_biguint<20> result = result_s;

  return result;
}

// adpfloat_max used in Maxpooling of LayerReduce
sc_biguint<8> flex::GBAdpfloat_max(sc_biguint<8> arg_0, sc_biguint<8> arg_1) {

  ac_int<8,false> arg_0_ac = arg_0.to_uint();
  ac_int<8,false> arg_1_ac = arg_1.to_uint();
  AdpfloatType<spec::kAdpfloatWordWidth,spec::kAdpfloatExpWidth> in_a = arg_0_ac;
  AdpfloatType<spec::kAdpfloatWordWidth,spec::kAdpfloatExpWidth> in_b = arg_1_ac;
  AdpfloatType<spec::kAdpfloatWordWidth,spec::kAdpfloatExpWidth> out_tmp;
  adpfloat_max(in_a, in_b, out_tmp);

  ac_int<8,false> result_ac = out_tmp.to_rawbits();
  sc_biguint<8> result = result_ac.to_uint();

  return result;
}

// adpfloat_mean used in LayerReduce
sc_biguint<8> flex::GBAdpfloat_mean(sc_biguint<8> arg_0, sc_biguint<8> arg_1) {
  ac_int<8,false> arg_0_ac = arg_0.to_uint();
  ac_int<8,false> arg_1_ac = arg_1.to_uint();
  AdpfloatType<spec::kAdpfloatWordWidth,spec::kAdpfloatExpWidth> in_a = arg_0_ac;
  AdpfloatType<spec::kAdpfloatWordWidth,spec::kAdpfloatExpWidth> in_b = arg_1_ac;
  AdpfloatType<spec::kAdpfloatWordWidth,spec::kAdpfloatExpWidth> out_tmp;
  adpfloat_mean(in_a, in_b, out_tmp);

  ac_int<8,false> result_ac = out_tmp.to_rawbits();
  sc_biguint<8> result = result_ac.to_uint();

  return result;
}

// adpfloat_add used in LayerReduce
sc_biguint<8> flex::GBAdpfloat_add(sc_biguint<8> arg_0, sc_biguint<8> arg_1) {
  ac_int<8,false> arg_0_ac = arg_0.to_uint();
  ac_int<8,false> arg_1_ac = arg_1.to_uint();
  AdpfloatType<spec::kAdpfloatWordWidth,spec::kAdpfloatExpWidth> in_a = arg_0_ac;
  AdpfloatType<spec::kAdpfloatWordWidth,spec::kAdpfloatExpWidth> in_b = arg_1_ac;
  AdpfloatType<spec::kAdpfloatWordWidth,spec::kAdpfloatExpWidth> out_tmp;
  adpfloat_add(in_a, in_b, out_tmp);

  ac_int<8,false> result_ac = out_tmp.to_rawbits();
  sc_biguint<8> result = result_ac.to_uint();

  return result;
}

// Function: PECoreAccumRightShift
// used in right shifting the accumulation results in PE_Core: RunBias()
sc_biguint<32> flex::PECoreAccumRightShift(sc_biguint<32> arg_0,
                sc_biguint<3> arg_1, sc_biguint<3> arg_2) {
  
  ac_int<3,false> arg_1_ac = arg_1.to_uint();
  ac_int<3,false> arg_2_ac = arg_2.to_uint();
  spec::AdpfloatBiasType bias_weight = arg_1_ac;
  spec::AdpfloatBiasType bias_input = arg_2_ac;

  sc_bigint<32> arg_0_s = arg_0;
  ac_int<32,true> accum_vector_ac = arg_0_s.to_int();
  spec::AccumScalarType accum_vector = accum_vector_ac;

  NVUINT5 right_shift = -2*spec::kAdpfloatOffset + 2*spec::kAdpfloatManWidth - spec::kActNumFrac
                        - bias_weight - bias_input;
  //std::cout << "right_shift: " << right_shift << '\t';
  spec::AccumScalarType result_tmp = accum_vector >> right_shift;
  //std::cout << "shifted value: " << result_tmp << std::endl;

  sc_bigint<32> result_s = result_tmp.to_int();
  sc_biguint<32> result = result_s;
  
  return result;
}

// Function: PECoreAccumGetBiasOut
// used in adding the input_bias and adaptive-float bias in PE_Core: RunBias()
sc_biguint<32> flex::PECoreAccumGetBiasOut(sc_biguint<32> arg_0, sc_biguint<8> arg_1, sc_biguint<3> arg_2) {
  
  sc_bigint<32> arg_0_s = arg_0;
  ac_int<32,true> arg_0_ac = arg_0_s.to_int();
  spec::AccumScalarType accum_vector_out = arg_0_ac;

  ac_int<8,false> arg_1_ac = arg_1.to_uint();
  spec::ScalarType bias_input = arg_1_ac;

  ac_int<3,false> arg_2_ac = arg_2.to_uint();
  spec::AdpfloatBiasType bias_bias = arg_2_ac;

  AdpfloatType<spec::kAdpfloatWordWidth, spec::kAdpfloatExpWidth> adpfloat_tmp(bias_input);
  spec::ActScalarType bias_tmp2 = 
                        adpfloat_tmp.to_fixed<spec::kActWordWidth, spec::kActNumFrac>(bias_bias);

  accum_vector_out += bias_tmp2;

  sc_bigint<32> result_s = accum_vector_out.to_int();
  sc_biguint<32> result = result_s;

  return result;
}

// Function: PECoreAccumOverflowCheck
// used in checking whether the accumulation result is overflow in PECore: RunBias()
sc_biguint<32> flex::PECoreAccumOverflowCheck(sc_biguint<32> arg_0) {
  
  sc_bigint<32> arg_0_s = arg_0;
  ac_int<32,true> arg_0_ac = arg_0_s.to_int();
  spec::AccumScalarType accum_vector_out = arg_0_ac;

  if (accum_vector_out > spec::kActWordMax)
    accum_vector_out = spec::kActWordMax;
  else if (accum_vector_out < spec::kActWordMin) 
    accum_vector_out = spec::kActWordMin;

  sc_bigint<32> result_s = accum_vector_out.to_int();
  sc_biguint<32> result = result_s;

  return result;
}

// Function: PECoreAccum2ActReg
// used to truncate the AccumScalar to ActScalar in PECore: RunBias()
sc_biguint<20> flex::PECoreAccum2ActReg(sc_biguint<32> arg_0) {
  
  sc_bigint<32> arg_0_s = arg_0;
  ac_int<32, true> arg_0_ac = arg_0_s.to_int();
  spec::AccumScalarType accum_vector = arg_0_ac;
  spec::ActScalarType act_port_reg = accum_vector;
  
  sc_bigint<20> result_s = act_port_reg.to_int();
  sc_biguint<20> result = result_s;

  return result;
}

// Function: ProductSum
// used to calculate the product of two adpfloat scalar in PECore: RunMac()
sc_biguint<32> flex::ProductSum(sc_biguint<8> arg_0, sc_biguint<8> arg_1) {
  
  ac_int<8,false> arg_0_ac = arg_0.to_uint();
  ac_int<8,false> arg_1_ac = arg_1.to_uint();

  spec::ScalarType in_1 = arg_0_ac;
  spec::ScalarType in_2 = arg_1_ac;

  AdpfloatType<spec::kAdpfloatWordWidth,spec::kAdpfloatExpWidth> in_1_adpfloat(in_1);
  AdpfloatType<spec::kAdpfloatWordWidth,spec::kAdpfloatExpWidth> in_2_adpfloat(in_2);
  spec::AccumScalarType acc_tmp;
  adpfloat_mul(in_1_adpfloat, in_2_adpfloat, acc_tmp);

  sc_bigint<32> result_s = acc_tmp.to_int();
  sc_biguint<32> result = result_s;

  return result;
}

// Function: AccumAdd
// used to add accum_tmp to accumulate register
sc_biguint<32> flex::AccumAdd(sc_biguint<32> arg_0, sc_biguint<32> arg_1) {

  sc_bigint<32> arg_0_s = arg_0;
  sc_bigint<32> arg_1_s = arg_1;
  
  ac_int<32,true> arg_0_ac = arg_0_s.to_int();
  ac_int<32,true> arg_1_ac = arg_1_s.to_int();

  spec::AccumScalarType out_tmp = arg_0_ac;
  spec::AccumScalarType acc_tmp = arg_1_ac;

  out_tmp += acc_tmp;

  sc_bigint<32> result_s = out_tmp.to_int();
  sc_biguint<32> result = result_s;

  return result;
}

// Function: AccumAdd2
// used to update values in accumulator vector registers
sc_biguint<32> flex::AccumAdd2(sc_biguint<32> arg_0, sc_biguint<32> arg_1) {

  sc_bigint<32> arg_0_s = arg_0;
  sc_bigint<32> arg_1_s = arg_1;
  
  ac_int<32,true> arg_0_ac = arg_0_s.to_int();
  ac_int<32,true> arg_1_ac = arg_1_s.to_int();

  spec::AccumScalarType out_tmp = arg_0_ac;
  spec::AccumScalarType acc_tmp = arg_1_ac;

  out_tmp += acc_tmp;

  sc_bigint<32> result_s = out_tmp.to_int();
  sc_biguint<32> result = result_s;

  return result;
}

// Function: PEActEadd
// element-wise add, used in PE_Act
sc_biguint<20> flex::PEActEadd(sc_biguint<20> arg_0, sc_biguint<20> arg_1) {

  sc_bigint<20> arg_0_s = arg_0;
  sc_bigint<20> arg_1_s = arg_1;

  spec::ActScalarType arg_0_ac = arg_0_s.to_int();
  spec::ActScalarType arg_1_ac = arg_1_s.to_int();

  spec::ActScalarType out_tmp = arg_0_ac + arg_1_ac;

  sc_bigint<20> result_s = out_tmp.to_int();
  sc_biguint<20> result = result_s;
  
  //std::cout << dec << "No." << counter << " " << "PEActEadd: ";
 // std::cout << hex << "arg_0: " << arg_0 << '\t' << "arg_1: " << arg_1 << '\t';
  //std::cout << "result: " << result << std::endl;
  counter++;
  return result;
}

// Function : PEActEmul
// element-wise multiplication, used in PE_Act
sc_biguint<20> flex::PEActEmul(sc_biguint<20> arg_0, sc_biguint<20> arg_1) {

  sc_bigint<20> arg_0_s = arg_0;
  sc_bigint<20> arg_1_s = arg_1;
  
  spec::ActScalarType arg_0_ac = arg_0_s.to_int();
  spec::ActScalarType arg_1_ac = arg_1_s.to_int();
  
  NVINTW(2*spec::kActWordWidth) tmp;
  tmp = arg_0_ac * arg_1_ac;
  tmp = nvhls::right_shift<NVINTW(2*spec::kActWordWidth)>(tmp, spec::kActNumFrac);
  spec::ActScalarType out_tmp = nvhls::get_slc<spec::kActWordWidth>(tmp, 0);

  sc_bigint<20> result_s = out_tmp.to_int();
  sc_biguint<20> result = result_s;

  //std::cout << dec << "No." << counter << " " << "PEActEmul: ";
  //std::cout << hex << "arg_0: " << arg_0 << '\t' << "arg_1: " << arg_1 << '\t';
  //std::cout << "result: " << result << std::endl;
  counter++;
  return result;
}

// Function: PEActSigmoid
// element-wise Sigmoid funtion, used in PE_Act
sc_biguint<20> flex::PEActSigmoid(sc_biguint<20> arg_0) {

  sc_bigint<20> arg_0_s = arg_0;
  //std::cout << "arg_0_s" << arg_0_s << '\t';
  
  spec::ActScalarType arg_0_ac = arg_0_s.to_int();
  spec::ActScalarType out_tmp;

  //std::cout << "arg_0_ac: " << arg_0_ac << '\t';

  ac_fixed<spec::kActWordWidth, spec::kActNumInt, true, AC_TRN, AC_WRAP> in_ac; 
  ac_fixed<spec::kActWordWidth, spec::kActNumInt, false, AC_TRN, AC_WRAP> out_ac;
  
  in_ac.set_slc(0, arg_0_ac);

  //std::cout << "in_ac: " << in_ac << '\t';

  out_ac = ac_math::ac_sigmoid_pwl
            <ac_fixed<spec::kActWordWidth, spec::kActNumInt, false, AC_TRN, AC_WRAP> >(in_ac);

  //std::cout << "out ac: " << out_ac << '\t';

  out_tmp.set_slc(0, nvhls::get_slc<spec::kActWordWidth>(out_ac, 0));

  //std::cout << "out_tmp: " << out_tmp << '\t';

  sc_bigint<20> result_s = out_tmp.to_int();
  sc_biguint<20> result = result_s;

  //std::cout << dec << "No." << counter << " " << "PEActSigmoid: ";
  //std::cout << hex << "in " << in_ac << '\t';
  //std::cout << "out_tmp: " << out_tmp << '\t';
  //std::cout << "result: " << result << std::endl;
  counter++;
  return result;
}

// Function: PEActTanh
// element-wise Tanh funtion, used in PE_Act
sc_biguint<20> flex::PEActTanh(sc_biguint<20> arg_0) {

  sc_bigint<20> arg_0_s = arg_0;
//  std::cout << "arg_0_s" << arg_0_s << '\t';

  spec::ActScalarType arg_0_ac = arg_0_s.to_int();
  spec::ActScalarType out_tmp;

//  std::cout << "arg_0_ac: " << arg_0_ac << '\t';

  ac_fixed<spec::kActWordWidth, spec::kActNumInt, true, AC_TRN, AC_WRAP> in_ac;
  ac_fixed<spec::kActWordWidth, spec::kActNumInt, false, AC_TRN, AC_WRAP> out_ac;

  in_ac.set_slc(0, arg_0_ac);

//  std::cout << "in_ac: " << in_ac << '\t';

  out_ac = ac_math::ac_tanh_pwl
             <ac_fixed<spec::kActWordWidth, spec::kActNumInt, false, AC_TRN, AC_WRAP> >(in_ac);

//  std::cout << "out ac: " << out_ac << '\t';

  out_tmp.set_slc(0, nvhls::get_slc<spec::kActWordWidth>(out_ac, 0));

//  std::cout << "out_tmp: " << out_tmp << std::endl;
  
  sc_bigint<20> result_s = out_tmp.to_int();
  sc_biguint<20> result = result_s;

  //std::cout << dec << "No." << counter << " " << "PEActTanh: ";
  //std::cout << hex << "in: " << in_ac << '\t';
  //std::cout << "out_tmp: " << out_tmp << '\t';
  //std::cout << "result: " << result << std::endl;
  counter++;
  return result;
}

// Function: PEActRelu
// element-wise Relu, used in PE_Act
sc_biguint<20> flex::PEActRelu(sc_biguint<20> arg_0) {

  sc_bigint<20> arg_0_s = arg_0;

  spec::ActScalarType arg_0_ac = arg_0_s.to_int();
  spec::ActScalarType out_tmp;

  if (arg_0_ac < 0)
      out_tmp = 0;
  else 
      out_tmp = arg_0_ac;

  sc_bigint<20> result_s = out_tmp.to_int();
  sc_biguint<20> result = result_s;

  //std::cout << dec << "No." << counter << " " << "PEActRelu: ";
  //std::cout << hex << "arg_0: " << arg_0 << '\t';
  //std::cout << "result: " << result << std::endl;
  counter++;
  return result;
}

// Function: PEActOneX
// element-wise OneX, used in PE_Act
sc_biguint<20> flex::PEActOnex(sc_biguint<20> arg_0) {

  sc_bigint<20> arg_0_s = arg_0;

  spec::ActScalarType arg_0_ac = arg_0_s.to_int();
  spec::ActScalarType out_tmp;

  out_tmp = (1<<spec::kActNumFrac) - arg_0_ac;

  sc_bigint<20> result_s = out_tmp.to_int();
  sc_biguint<20> result = result_s;

  //std::cout << dec << "No." << counter << " " << "PEActOnex: ";
  //std::cout << hex << "arg_0: " << arg_0 << '\t';
  //std::cout << "result: " << result << std::endl;
  counter++;
  return result;
}

// Function: Adptfloat2Fixed
// transfer Adptfloat point type to fixed point type, used in PE_Act
// Will implement another version for GB_LayerNorm
sc_biguint<20> flex::Adptfloat2Fixed(sc_biguint<8> arg_0, sc_biguint<3> arg_1) {

  spec::ScalarType in = arg_0.to_uint();
  spec::AdpfloatBiasType bias = arg_1.to_uint(); 
  spec::ActScalarType out_tmp;

  AdpfloatType<spec::kAdpfloatWordWidth, spec::kAdpfloatExpWidth> input_adpfloat(in);
  out_tmp = input_adpfloat.to_fixed<spec::kActWordWidth, spec::kActNumFrac>(bias);

  sc_bigint<20> result_s = out_tmp.to_int();
  sc_biguint<20> result = result_s;

  //std::cout << dec << "No." << counter << " " << "PEAdptfloat2Fixed: ";
  //std::cout << hex << "arg_0: " << arg_0 << '\t' << "arg_1: " << arg_1 << '\t';
  //std::cout << "result: " << result << std::endl;
  counter++;

  return result;
}

// Function: Fixed2Adaptfloat
// transfer fixed point type to adaptive-float point type, used in PE_Act
// will implement another version for GB_LayerNorm
sc_biguint<8> flex::Fixed2Adaptfloat(sc_biguint<20> arg_0, sc_biguint<3> arg_1) {

  sc_bigint<20> arg_0_s = arg_0;
  spec::ActScalarType in = arg_0_s.to_int();
  spec::AdpfloatBiasType bias = arg_1.to_uint();
  spec::ScalarType out_tmp;

  AdpfloatType<spec::kAdpfloatWordWidth, spec::kAdpfloatExpWidth> out_adpfloat;
  out_adpfloat.set_value_fixed<spec::kActWordWidth, spec::kActNumFrac>(in, bias);
  out_tmp = out_adpfloat.to_rawbits();

  sc_biguint<8> result = out_tmp.to_uint();

  //std::cout << dec << "No." << counter << " " << "PEFixed2Adpfloat: ";
  //std::cout << hex << "arg_0: " << arg_0 << '\t' << "arg_1: " << arg_1 << '\t';
  //std::cout << "result: " << result << std::endl;
  counter++;
  return result;
}

