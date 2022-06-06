/// \file the header for ILA models for bsg off-chip link
///
#ifndef BSG_LINK_ILA_H__
#define BSG_LINK_ILA_H__

#include <ilang/ilang++.h>
#include <vector>

using namespace ilang;

#define CORE_WIDTH      64
#define CHANNEL_NUM     2
#define CHANNEL_WIDTH   8
#define DATA_TEMP_WIDTH 16 // 2*8
#define STEP_BITS 2

#define BUFFER_SIZE     64
#define BUFFER_BIT      6

#define b0 BoolConst(false)
#define b1 BoolConst(true)

/// \brief the class of BSG_LINK
// Upstream: Core -> I/O
// PISO -> Sync -> ODDR
class BSG_UPSTREAM {

public:
  // ------------- the ila model ------------//
  Ila model;
  // --------------- CONSTRUCTOR ----------- //
  BSG_UPSTREAM();

private:
  void AddChild(InstrRef& inst);

protected:
  ExprRef core_data_in;
  ExprRef core_valid_in;
  ExprRef io_token;

  // ---------- Output --------- //
  ExprRef child_valid;
  std::vector<ExprRef> io_data_out;
  ExprRef io_valid_out;

  // --------- Internal --------//
  ExprRef data_cycle_0;
  ExprRef data_cycle_1;
  ExprRef sent_cnt;
  ExprRef finish_cnt;
  
}; // class BSG_UPSTREAM

/// \brief the class of BSG_LINK
// DownStream: I/O -> Core
// IDDR -> Sync -> SIPO
class BSG_DOWNSTREAM {

public:
  // ------------- the ila model ------------//
  Ila model;
  // --------------- CONSTRUCTOR ----------- //
  BSG_DOWNSTREAM();
  
protected:
  // -------- Input ------- //
  ExprRef io_valid_in;
  ExprRef io_data_in;
  ExprRef core_ready;

  // -------- Output -------- //
  ExprRef core_data_out;
  ExprRef core_valid_out;
  ExprRef io_token_out;

  // ------- Internal Buffer-------- //
  ExprRef buffer;
  ExprRef rptr;
  ExprRef wptr;
  ExprRef wptr_t;
  ExprRef full;

  // ----- Internal States ------//
  ExprRef io_valid;
  ExprRef io_data;
  ExprRef core_data0;
  
}; // class BSG_DOWNSTREAM

#endif // BSG_LINK_ILA_H__
