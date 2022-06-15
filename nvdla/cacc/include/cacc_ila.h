#ifndef CACC_ILA_H__
#define CACC_ILA_H__

#include <ilang/ilang++.h>
#include <ilang/ila/instr_lvl_abs.h>
#include <ilang/ila/ast_hub.h>
#include <ilang/ila/ast/expr.h>
#include <ilang/ila-mngr/v_eq_check_refinement.h>

using namespace ilang;


class NVDLA_CACC {

public:
  // --------------- CONSTRUCTOR ------ //
  NVDLA_CACC();
  // --------------- MEMBERS ----------- //
  /// the ila mode
  Ila model;

protected:
  // ------------ STATE ------------ //
  ExprRef producer;
  ExprRef conv_mode0;
  ExprRef conv_mode1;
  ExprRef proc_precision0;
  ExprRef proc_precision1;
  ExprRef op_en0;
  ExprRef op_en1;
  ExprRef dataout_width_0;
  ExprRef dataout_width_1;
  ExprRef dataout_height_0;
  ExprRef dataout_height_1;
  ExprRef dataout_channel_0;
  ExprRef dataout_channel_1;
  ExprRef dataout_addr_0;
  ExprRef dataout_addr_1;
  ExprRef batch_number_0;
  ExprRef batch_number_1;
  ExprRef line_stride_0;
  ExprRef line_stride_1;
  ExprRef surf_stride_0;
  ExprRef surf_stride_1;
  ExprRef line_packed_0;
  ExprRef line_packed_1;
  ExprRef surf_packed_0;
  ExprRef surf_packed_1;
  ExprRef clip_cfg_0;
  ExprRef clip_cfg_1;
}; // class CACC

#endif // CACC_ILA_H__
