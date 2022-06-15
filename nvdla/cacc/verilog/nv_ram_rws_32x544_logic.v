// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: nv_ram_rws_32x512_logic.v

`timescale 1ns / 10ps
module nv_ram_rws_32x544 (
   clk
  ,ra
  ,re
  ,dout
  ,wa
  ,we
  ,di
  ,pwrbus_ram_pd
        );

input         clk, 
              we, 
              re;
input [4:0] ra, wa;
input [543:0] di;
output [543:0] dout;
input [31:0] pwrbus_ram_pd;

wire	      rd_en,
	      wr_en;
assign wr_en = we;
assign rd_en = re;

wire  [543:0]  wr_data;
assign wr_data = di;
wire  [4:0]  rd_addr,
              wr_addr;
assign rd_addr = ra;
assign wr_addr = wa;
assign dout = rd_data;

      reg    [543:0]  rd_data;
      //
      // buffer
      reg    [543:0]  buff [0:32];
      
      
      //
      // writing to ram
      integer i;
      always @(posedge clk)
      begin
       if (wr_en)
          buff[wr_addr] <= #1 wr_data;
      end
      //
      // reading from ram
      always @(posedge clk) // or posedge rst)
      begin
        if ((wa==ra) & we & re)
          rd_data <= #1 wr_data;
        else if (rd_en)
          rd_data <= #1 buff[rd_addr];
      end


endmodule
