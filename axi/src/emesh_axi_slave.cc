/// \file the ila example of EMESH-AXI-Bridge
///

#include "emesh_axi_slave.h"


EmeshAxiSlaveBridge::EmeshAxiSlaveBridge()
    : // construct the model
  wmodel("ILA_Slave_write"),
  // global reset
  s_axi_aresetn_w (wmodel.NewBvInput("s_axi_aresetn",1)),

  // AXI -- Write address
  s_axi_awid   (wmodel.NewBvInput("s_axi_awid",   S_IDW)),   
  s_axi_awaddr (wmodel.NewBvInput("s_axi_awaddr", 32)),
  s_axi_awlen  (wmodel.NewBvInput("s_axi_awlen",  8)),
  s_axi_awsize (wmodel.NewBvInput("s_axi_awsize", 3)),
  s_axi_awburst(wmodel.NewBvInput("s_axi_awburst",2)),
  s_axi_awlock (wmodel.NewBvInput("s_axi_awlock", 1)),
  s_axi_awcache(wmodel.NewBvInput("s_axi_awcache",4)),
  s_axi_awprot (wmodel.NewBvInput("s_axi_awprot", 3)),
  s_axi_awqos  (wmodel.NewBvInput("s_axi_awqos",  4)),
  s_axi_awvalid(wmodel.NewBvInput("s_axi_awvalid",1)),
  s_axi_awready(wmodel.NewBvState("s_axi_awready",1)), //output

  // AXI -- Write data
  s_axi_wid   (wmodel.NewBvInput("s_axi_wid",     S_IDW)),  
  s_axi_wdata (wmodel.NewBvInput("s_axi_wdata",   32)), 
  s_axi_wstrb (wmodel.NewBvInput("s_axi_wstrb",   4)), 
  s_axi_wlast (wmodel.NewBvInput("s_axi_wlast",   1)), 
  s_axi_wvalid(wmodel.NewBvInput("s_axi_wvalid",  1)),
  s_axi_wready(wmodel.NewBvState("s_axi_wready",  1)), //output

  // AXI -- Write response
  s_axi_bid   (wmodel.NewBvState("s_axi_bid",    S_IDW)), // output    
  s_axi_bresp (wmodel.NewBvState("s_axi_bresp",  2)),     // output 
  s_axi_bvalid(wmodel.NewBvState("s_axi_bvalid", 1)),     // output
  s_axi_bready(wmodel.NewBvInput("s_axi_bready", 1)), 
  write_ready (wmodel.NewBvInput("write_ready", 1)), // Input

  rmodel("EmeshAxiSlaveBridge_read"),
  
  s_axi_aresetn_r (rmodel.NewBvInput("s_axi_aresetn",1)),
  // AXI -- Read address
  s_axi_arid   (rmodel.NewBvInput("s_axi_arid",    S_IDW)),
  s_axi_araddr (rmodel.NewBvInput("s_axi_araddr",  32)), 
  s_axi_arlen  (rmodel.NewBvInput("s_axi_arlen",   8)),
  s_axi_arsize (rmodel.NewBvInput("s_axi_arsize",  3)), 
  s_axi_arburst(rmodel.NewBvInput("s_axi_arburst", 2)), 
  s_axi_arlock (rmodel.NewBvInput("s_axi_arlock",  1)),  
  s_axi_arcache(rmodel.NewBvInput("s_axi_arcache", 4)), 
  s_axi_arprot (rmodel.NewBvInput("s_axi_arprot",  3)), 
  s_axi_arqos  (rmodel.NewBvInput("s_axi_arqos",   4)), 
  s_axi_arvalid(rmodel.NewBvInput("s_axi_arvalid", 1)),
  s_axi_arready(rmodel.NewBvState("s_axi_arready", 1)), //output

  // AXI -- Read data
  s_axi_rid   (rmodel.NewBvState("s_axi_rid",    S_IDW)), //output     
  s_axi_rdata (rmodel.NewBvState("s_axi_rdata",  32)),   //output
  s_axi_rresp (rmodel.NewBvState("s_axi_rresp",  2)),   //output
  s_axi_rlast (rmodel.NewBvState("s_axi_rlast",  1)),   //output
  s_axi_rvalid(rmodel.NewBvState("s_axi_rvalid", 1)),   //output
  s_axi_rready(rmodel.NewBvInput("s_axi_rready", 1)),

  // AXI -- Read Data Input
  read_valid    (rmodel.NewBvInput("read_valid",     1)),
  read_data_7_0 (rmodel.NewBvInput("read_data_7_0",  8)),
  read_data_15_0(rmodel.NewBvInput("read_data_15_0", 16)),
  read_data_31_0(rmodel.NewBvInput("read_data_31_0", 32)),
  read_resp     (rmodel.NewBvInput("read_resp",      2)),

  // internal states -- may not have matches with the Verilog state
  // but necessary for modeling
  tx_wactive(wmodel.NewBvState("tx_wactive", 1)), // write_wactive
  tx_bwait(wmodel.NewBvState("tx_bwait", 1)), // b_wait
  tx_awlen (wmodel.NewBvState("tx_awlen", 8)), // axi_awlen
  tx_awsize(wmodel.NewBvState("tx_awsize", 3)),
  tx_awaddr(wmodel.NewBvState("tx_awaddr", 32)),
  tx_awburst(wmodel.NewBvState("tx_awburst", 2)),

  tx_ractive(rmodel.NewBvState("tx_ractive", 1)), // read_wactive
  tx_arlen (rmodel.NewBvState("tx_arlen", 8)), // axi_arlen
  tx_arsize(rmodel.NewBvState("tx_arsize", 3)),
  tx_araddr(rmodel.NewBvState("tx_araddr", 32)),
  tx_arburst(rmodel.NewBvState("tx_arburst", 2))

  // ------------------------------------------------------------------
{
  // -------------------------------------------------------------------------------------------------- //
  // -------------------------------------------------------------------------------------------------- //
  /*
    W_Slave_Reset / AW_Slave_Wait -> AW_Slave_Commit -> W_Slave_Wait -> W_Slave_Busy -> B_Slave_Commit
                            ^                                                                 |
                            |_________________________________________________________________|
  */
  // -------------------------------------------------------------------------------------------------- //
  // -------------------------------------------------------------------------------------------------- //
  

  // Write channel interface -- what corresponds to instruction
  wmodel.SetFetch( lConcat({s_axi_aresetn_w, s_axi_awvalid, s_axi_wvalid}) );
  // Valid instruction: what means to have valid command (valid = 1)
  wmodel.SetValid( /*always true*/ BoolConst(true) );

  { // reset instruction
    auto instr = wmodel.NewInstr("W_Slave_Reset");
    instr.SetDecode(s_axi_aresetn_w == 0 );
    
    // Write addr
    instr.SetUpdate(s_axi_awready, BvConst(1,1)); // default state recommends to be high
    instr.SetUpdate(tx_wactive, BvConst(0,1));
    instr.SetUpdate(s_axi_bid, BvConst(0,S_IDW));
    instr.SetUpdate(tx_awlen, BvConst(0,8));
    instr.SetUpdate(tx_awsize, BvConst(0,3));
    instr.SetUpdate(tx_awaddr, BvConst(0,32));
    instr.SetUpdate(tx_awburst, BvConst(0,2));
    
    // Write data
    instr.SetUpdate(s_axi_bvalid, BvConst(0,1)); // a slave interface must drive RVALID and BVALID low
    instr.SetUpdate(s_axi_bresp, BvConst(0,2));
    instr.SetUpdate(tx_bwait, BvConst(0,1));

  }

  // ------ AW Channel ------  //

  { // AW_Slave_Wait
    auto instr = wmodel.NewInstr("AW_Slave_Wait"); 
    instr.SetDecode( (s_axi_awready == 0) & ( s_axi_aresetn_w == 1 ) );
    instr.SetUpdate(s_axi_awready, Ite( ((tx_wactive == 0) & (tx_bwait == 0)), BvConst(1,1), BvConst(0,1)));
  }

  { // AW_Slave_Commit
    auto instr = wmodel.NewInstr("AW_Slave_Commit");
    instr.SetDecode( (s_axi_awready == 1) & (s_axi_awvalid == 1) & (s_axi_aresetn_w == 1) );

    // we're always ready for an address cycle if we're not doing something else; 
    // but when a transaction happens, awready will change to 0
    instr.SetUpdate(s_axi_awready, BvConst(0,1));
    instr.SetUpdate(tx_wactive, BvConst(1,1));

    // update the info of the write transaction(burst_based transaction)
    instr.SetUpdate(s_axi_bid, s_axi_awid);
    instr.SetUpdate(tx_awlen, s_axi_awlen);
    instr.SetUpdate(tx_awsize, s_axi_awsize);
    instr.SetUpdate(tx_awaddr, s_axi_awaddr);
    instr.SetUpdate(tx_awburst, s_axi_awburst);
  }

  // ------ W Channel ------  //

  { // W_Slave_Wait
    auto instr = wmodel.NewInstr("W_Slave_Wait"); 
    instr.SetDecode( ( (s_axi_wvalid == 0) | ( (s_axi_wvalid == 1) & (s_axi_wready == 0) ) ) & ( s_axi_aresetn_w == 1 ) );
    instr.SetUpdate(s_axi_wready, Ite( tx_wactive == 1, write_ready, s_axi_wready) );
  }

  { // W_Slave_Busy
    auto instr = wmodel.NewInstr("W_Slave_Busy"); 
    instr.SetDecode( (s_axi_wready == 1) & (s_axi_wvalid == 1) & ( s_axi_aresetn_w == 1 ));
    // tx_wactive ----- last_wr_beat : two important points
    instr.SetUpdate(s_axi_wready, Ite(s_axi_wlast == 1, BvConst(0,1), write_ready)); // unkownVal == ~wr_wait
    instr.SetUpdate(tx_wactive, Ite(s_axi_wlast  == 1, BvConst(0,1), tx_wactive));
    instr.SetUpdate(tx_bwait, Ite(s_axi_wlast == 1, BvConst(1,1), tx_bwait));
    instr.SetUpdate(s_axi_bvalid, Ite(s_axi_wlast == 1, BvConst(1,1), s_axi_bvalid));
    // ok resp
    instr.SetUpdate(s_axi_bresp, Ite(s_axi_wlast == 1, BvConst(0,2), s_axi_bresp));
    // info update
    instr.SetUpdate(tx_awlen, tx_awlen - BvConst(1,8));
    instr.SetUpdate(tx_awaddr, Ite(tx_awburst == BURST_INCR, Concat(Extract(tx_awaddr,31,2) + BvConst(1,30) , BvConst(0,2)), tx_awaddr));
  }

  // ------ B Channel ----- //

  { // B_Slave_Commit
    auto instr = wmodel.NewInstr("B_Slave_Commit");
    instr.SetDecode( ( s_axi_bvalid == 1 ) & ( s_axi_bready == 1 ) & ( s_axi_aresetn_w == 1 ) );
    instr.SetUpdate(s_axi_bvalid, BvConst(0,1));
    instr.SetUpdate(tx_bwait, BvConst(0,1));
  }

  // ------------------------------------------------------------------------------------ //
  // ------------------------------------------------------------------------------------ //
  /*
    R_Slave_Reset / AR_Slave_Wait -> AR_Slave_Commit -> R_Slave_Prepare -> R_Slave_Asserted -> R_Slave_Busy
                        ^                                                                          |
                        |__________________________________________________________________________|
  */
  // ------------------------------------------------------------------------------------ //
  // ------------------------------------------------------------------------------------ //

  // Read channel interface -- what corresponds to instruction
  rmodel.SetFetch( lConcat( {s_axi_aresetn_r, s_axi_arvalid, s_axi_arready, s_axi_rready,s_axi_rvalid} ) );
  // Valid instruction: what means to have valid command (valid = 1)
  rmodel.SetValid( /*always true*/ BoolConst(true) );

  {// reset instruction
    auto instr = rmodel.NewInstr("R_Slave_Reset");
    instr.SetDecode( s_axi_aresetn_r == 0 );
    
    // AR
    instr.SetUpdate(s_axi_arready, BvConst(1,1)); // !! recommends to be high
    instr.SetUpdate(tx_ractive, BvConst(0,1));
    instr.SetUpdate(tx_arlen, BvConst(0,8));
    instr.SetUpdate(tx_arsize, BvConst(0,3));
    instr.SetUpdate(tx_araddr, BvConst(0,32));
    instr.SetUpdate(tx_arburst, BvConst(0,2));
    // R
    instr.SetUpdate(s_axi_rvalid,  BvConst(0,1)); // a slave interface must drive RVALID low
    instr.SetUpdate(s_axi_rdata, BvConst(0,32));
    instr.SetUpdate(s_axi_rresp, BvConst(0,2));    
    instr.SetUpdate(s_axi_rlast, BvConst(0,1));
    instr.SetUpdate(s_axi_rid, BvConst(0,S_IDW));
  }

  //-------- AR Channel ---------//

  { // AR_Slave_Wait
    auto instr = rmodel.NewInstr("AR_Slave_Wait");
    instr.SetDecode( (s_axi_aresetn_r == 1) & (s_axi_arready == 0) );
    instr.SetUpdate(s_axi_arready, Ite( (tx_ractive == 0), BvConst(1,1), s_axi_arready ) );
  }

  { // AR_Slave_Commit
    auto instr = rmodel.NewInstr("AR_Slave_Commit");
    instr.SetDecode( (s_axi_arvalid == 1) & (s_axi_arready == 1) & (s_axi_aresetn_r == 1) );

    instr.SetUpdate(s_axi_arready, BvConst(0,1));
    instr.SetUpdate(tx_ractive, BvConst(1,1));
    // update info of read transaction: in AR channel, get the input info; in R channel, calculate itself 
    instr.SetUpdate(s_axi_rid, s_axi_arid);
    instr.SetUpdate(tx_arlen, s_axi_arlen);
    instr.SetUpdate(tx_arsize, s_axi_arsize);
    instr.SetUpdate(tx_araddr, s_axi_araddr);
    instr.SetUpdate(tx_arburst, s_axi_arburst);
    // identify read_last, assert it when last bit is read
    instr.SetUpdate(s_axi_rlast, Ite(s_axi_arlen == 0, BvConst(1,1), BvConst(0,1)) );
  }

  //------- R Channel -------//

  { // R_Slave_Prepare
    auto instr = rmodel.NewInstr("R_Slave_Prepare");
    instr.SetDecode((s_axi_aresetn_r == 1) & (s_axi_rvalid == 0) );
    // Data Valid
    instr.SetUpdate(s_axi_rvalid, Ite(tx_ractive == BvConst(1,1), Ite(read_valid == 1, BvConst(1,1), s_axi_rvalid), s_axi_rvalid) );
    auto data = Ite(Extract(tx_arsize,1,0) == 0, Concat(Concat(read_data_7_0, read_data_7_0), Concat(read_data_7_0, read_data_7_0)),
                Ite(Extract(tx_arsize,1,0) == 1, Concat(read_data_15_0, read_data_15_0), read_data_31_0));
    instr.SetUpdate(s_axi_rdata, Ite(tx_ractive == BvConst(1,1), Ite(read_valid == 1, data, s_axi_rdata), s_axi_rdata));

  }

  { // R_Slave_Asserted
    auto instr = rmodel.NewInstr("R_Slave_Asserted");
    instr.SetDecode((s_axi_aresetn_r == 1) & (s_axi_rready == 0) & (s_axi_rvalid == 1));
    instr.SetUpdate(s_axi_rvalid, s_axi_rvalid);
    instr.SetUpdate(s_axi_rdata, s_axi_rdata);
  }

  { // R_Slave_Busy
    auto instr = rmodel.NewInstr("R_Slave_Busy");
    instr.SetDecode( (s_axi_aresetn_r == 1) & (s_axi_rready == 1) & (s_axi_rvalid == 1));
    // Compute when to finish reading
    instr.SetUpdate(tx_arlen, tx_arlen - BvConst(1,8));
    instr.SetUpdate(tx_araddr, Ite(tx_arburst == BURST_INCR, Concat(Extract(tx_araddr,31,2) + BvConst(1,30) , BvConst(0,2)), tx_araddr));

    instr.SetUpdate(s_axi_rlast, Ite(tx_arlen == BvConst(1,8), BvConst(1,1), s_axi_rlast));
    instr.SetUpdate(tx_ractive, Ite(s_axi_rlast == BvConst(1,1), BvConst(0,1), tx_ractive));
    instr.SetUpdate(s_axi_rvalid, Ite(s_axi_rlast == BvConst(1,1), BvConst(0,1), Ite(read_valid == 1, BvConst(1,1), BvConst(0,1))) );
    instr.SetUpdate(s_axi_rresp, Ite(read_valid == 1, read_resp, s_axi_rresp));
  }

}
