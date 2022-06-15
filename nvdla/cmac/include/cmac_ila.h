#ifndef CMAC_ILA_H__
#define CMAC_ILA_H__

#include <ilang/ilang++.h>
#include <ilang/ila/instr_lvl_abs.h>
#include <ilang/ila/ast_hub.h>
#include <ilang/ila/ast/expr.h>
#include <ilang/ila-mngr/v_eq_check_refinement.h>

using namespace ilang;


/// \brief the class of AES ila
class NVDLA_CMAC {

public:
  // --------------- CONSTRUCTOR ------ //
  /// add state, add instructions, add child
  NVDLA_CMAC();
  // --------------- MEMBERS ----------- //
  /// the ila mode
  Ila model;



protected:
  // ------------ STATE ------------ //
  // I/O interface: this is where the commands come from.
  ExprRef producer;
  ExprRef consumer;
  ExprRef conv_mode0;
  // internal arch state.
  ExprRef conv_mode1;
  ExprRef proc_precision0;
  ExprRef proc_precision1;
  ExprRef op_en0;
  ExprRef op_en1;
}; // class CMAC

#endif // CMAC_ILA_H__
