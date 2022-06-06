

module bsg_mem_1r1w_synth_width_p32_els_p2_read_write_same_addr_p0_harden_p0
(
  w_clk_i,
  w_reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [0:0] w_addr_i;
  input [31:0] w_data_i;
  input [0:0] r_addr_i;
  output [31:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [31:0] r_data_o;
  wire N0,N1,N2,N3,N4,N5,N6,N7;
  wire [63:0] mem;
  reg mem_63_sv2v_reg,mem_62_sv2v_reg,mem_61_sv2v_reg,mem_60_sv2v_reg,mem_59_sv2v_reg,
  mem_58_sv2v_reg,mem_57_sv2v_reg,mem_56_sv2v_reg,mem_55_sv2v_reg,mem_54_sv2v_reg,
  mem_53_sv2v_reg,mem_52_sv2v_reg,mem_51_sv2v_reg,mem_50_sv2v_reg,mem_49_sv2v_reg,
  mem_48_sv2v_reg,mem_47_sv2v_reg,mem_46_sv2v_reg,mem_45_sv2v_reg,mem_44_sv2v_reg,
  mem_43_sv2v_reg,mem_42_sv2v_reg,mem_41_sv2v_reg,mem_40_sv2v_reg,mem_39_sv2v_reg,
  mem_38_sv2v_reg,mem_37_sv2v_reg,mem_36_sv2v_reg,mem_35_sv2v_reg,mem_34_sv2v_reg,
  mem_33_sv2v_reg,mem_32_sv2v_reg,mem_31_sv2v_reg,mem_30_sv2v_reg,mem_29_sv2v_reg,
  mem_28_sv2v_reg,mem_27_sv2v_reg,mem_26_sv2v_reg,mem_25_sv2v_reg,mem_24_sv2v_reg,
  mem_23_sv2v_reg,mem_22_sv2v_reg,mem_21_sv2v_reg,mem_20_sv2v_reg,mem_19_sv2v_reg,
  mem_18_sv2v_reg,mem_17_sv2v_reg,mem_16_sv2v_reg,mem_15_sv2v_reg,mem_14_sv2v_reg,
  mem_13_sv2v_reg,mem_12_sv2v_reg,mem_11_sv2v_reg,mem_10_sv2v_reg,mem_9_sv2v_reg,
  mem_8_sv2v_reg,mem_7_sv2v_reg,mem_6_sv2v_reg,mem_5_sv2v_reg,mem_4_sv2v_reg,
  mem_3_sv2v_reg,mem_2_sv2v_reg,mem_1_sv2v_reg,mem_0_sv2v_reg;
  assign mem[63] = mem_63_sv2v_reg;
  assign mem[62] = mem_62_sv2v_reg;
  assign mem[61] = mem_61_sv2v_reg;
  assign mem[60] = mem_60_sv2v_reg;
  assign mem[59] = mem_59_sv2v_reg;
  assign mem[58] = mem_58_sv2v_reg;
  assign mem[57] = mem_57_sv2v_reg;
  assign mem[56] = mem_56_sv2v_reg;
  assign mem[55] = mem_55_sv2v_reg;
  assign mem[54] = mem_54_sv2v_reg;
  assign mem[53] = mem_53_sv2v_reg;
  assign mem[52] = mem_52_sv2v_reg;
  assign mem[51] = mem_51_sv2v_reg;
  assign mem[50] = mem_50_sv2v_reg;
  assign mem[49] = mem_49_sv2v_reg;
  assign mem[48] = mem_48_sv2v_reg;
  assign mem[47] = mem_47_sv2v_reg;
  assign mem[46] = mem_46_sv2v_reg;
  assign mem[45] = mem_45_sv2v_reg;
  assign mem[44] = mem_44_sv2v_reg;
  assign mem[43] = mem_43_sv2v_reg;
  assign mem[42] = mem_42_sv2v_reg;
  assign mem[41] = mem_41_sv2v_reg;
  assign mem[40] = mem_40_sv2v_reg;
  assign mem[39] = mem_39_sv2v_reg;
  assign mem[38] = mem_38_sv2v_reg;
  assign mem[37] = mem_37_sv2v_reg;
  assign mem[36] = mem_36_sv2v_reg;
  assign mem[35] = mem_35_sv2v_reg;
  assign mem[34] = mem_34_sv2v_reg;
  assign mem[33] = mem_33_sv2v_reg;
  assign mem[32] = mem_32_sv2v_reg;
  assign mem[31] = mem_31_sv2v_reg;
  assign mem[30] = mem_30_sv2v_reg;
  assign mem[29] = mem_29_sv2v_reg;
  assign mem[28] = mem_28_sv2v_reg;
  assign mem[27] = mem_27_sv2v_reg;
  assign mem[26] = mem_26_sv2v_reg;
  assign mem[25] = mem_25_sv2v_reg;
  assign mem[24] = mem_24_sv2v_reg;
  assign mem[23] = mem_23_sv2v_reg;
  assign mem[22] = mem_22_sv2v_reg;
  assign mem[21] = mem_21_sv2v_reg;
  assign mem[20] = mem_20_sv2v_reg;
  assign mem[19] = mem_19_sv2v_reg;
  assign mem[18] = mem_18_sv2v_reg;
  assign mem[17] = mem_17_sv2v_reg;
  assign mem[16] = mem_16_sv2v_reg;
  assign mem[15] = mem_15_sv2v_reg;
  assign mem[14] = mem_14_sv2v_reg;
  assign mem[13] = mem_13_sv2v_reg;
  assign mem[12] = mem_12_sv2v_reg;
  assign mem[11] = mem_11_sv2v_reg;
  assign mem[10] = mem_10_sv2v_reg;
  assign mem[9] = mem_9_sv2v_reg;
  assign mem[8] = mem_8_sv2v_reg;
  assign mem[7] = mem_7_sv2v_reg;
  assign mem[6] = mem_6_sv2v_reg;
  assign mem[5] = mem_5_sv2v_reg;
  assign mem[4] = mem_4_sv2v_reg;
  assign mem[3] = mem_3_sv2v_reg;
  assign mem[2] = mem_2_sv2v_reg;
  assign mem[1] = mem_1_sv2v_reg;
  assign mem[0] = mem_0_sv2v_reg;
  assign r_data_o[31] = (N3)? mem[31] : 
                        (N0)? mem[63] : 1'b0;
  assign N0 = r_addr_i[0];
  assign r_data_o[30] = (N3)? mem[30] : 
                        (N0)? mem[62] : 1'b0;
  assign r_data_o[29] = (N3)? mem[29] : 
                        (N0)? mem[61] : 1'b0;
  assign r_data_o[28] = (N3)? mem[28] : 
                        (N0)? mem[60] : 1'b0;
  assign r_data_o[27] = (N3)? mem[27] : 
                        (N0)? mem[59] : 1'b0;
  assign r_data_o[26] = (N3)? mem[26] : 
                        (N0)? mem[58] : 1'b0;
  assign r_data_o[25] = (N3)? mem[25] : 
                        (N0)? mem[57] : 1'b0;
  assign r_data_o[24] = (N3)? mem[24] : 
                        (N0)? mem[56] : 1'b0;
  assign r_data_o[23] = (N3)? mem[23] : 
                        (N0)? mem[55] : 1'b0;
  assign r_data_o[22] = (N3)? mem[22] : 
                        (N0)? mem[54] : 1'b0;
  assign r_data_o[21] = (N3)? mem[21] : 
                        (N0)? mem[53] : 1'b0;
  assign r_data_o[20] = (N3)? mem[20] : 
                        (N0)? mem[52] : 1'b0;
  assign r_data_o[19] = (N3)? mem[19] : 
                        (N0)? mem[51] : 1'b0;
  assign r_data_o[18] = (N3)? mem[18] : 
                        (N0)? mem[50] : 1'b0;
  assign r_data_o[17] = (N3)? mem[17] : 
                        (N0)? mem[49] : 1'b0;
  assign r_data_o[16] = (N3)? mem[16] : 
                        (N0)? mem[48] : 1'b0;
  assign r_data_o[15] = (N3)? mem[15] : 
                        (N0)? mem[47] : 1'b0;
  assign r_data_o[14] = (N3)? mem[14] : 
                        (N0)? mem[46] : 1'b0;
  assign r_data_o[13] = (N3)? mem[13] : 
                        (N0)? mem[45] : 1'b0;
  assign r_data_o[12] = (N3)? mem[12] : 
                        (N0)? mem[44] : 1'b0;
  assign r_data_o[11] = (N3)? mem[11] : 
                        (N0)? mem[43] : 1'b0;
  assign r_data_o[10] = (N3)? mem[10] : 
                        (N0)? mem[42] : 1'b0;
  assign r_data_o[9] = (N3)? mem[9] : 
                       (N0)? mem[41] : 1'b0;
  assign r_data_o[8] = (N3)? mem[8] : 
                       (N0)? mem[40] : 1'b0;
  assign r_data_o[7] = (N3)? mem[7] : 
                       (N0)? mem[39] : 1'b0;
  assign r_data_o[6] = (N3)? mem[6] : 
                       (N0)? mem[38] : 1'b0;
  assign r_data_o[5] = (N3)? mem[5] : 
                       (N0)? mem[37] : 1'b0;
  assign r_data_o[4] = (N3)? mem[4] : 
                       (N0)? mem[36] : 1'b0;
  assign r_data_o[3] = (N3)? mem[3] : 
                       (N0)? mem[35] : 1'b0;
  assign r_data_o[2] = (N3)? mem[2] : 
                       (N0)? mem[34] : 1'b0;
  assign r_data_o[1] = (N3)? mem[1] : 
                       (N0)? mem[33] : 1'b0;
  assign r_data_o[0] = (N3)? mem[0] : 
                       (N0)? mem[32] : 1'b0;
  assign N7 = ~w_addr_i[0];
  assign { N6, N5 } = (N1)? { w_addr_i[0:0], N7 } : 
                      (N2)? { 1'b0, 1'b0 } : 1'b0;
  assign N1 = w_v_i;
  assign N2 = N4;
  assign N3 = ~r_addr_i[0];
  assign N4 = ~w_v_i;

  always @(posedge w_clk_i) begin
    if(N6) begin
      mem_63_sv2v_reg <= w_data_i[31];
      mem_62_sv2v_reg <= w_data_i[30];
      mem_61_sv2v_reg <= w_data_i[29];
      mem_60_sv2v_reg <= w_data_i[28];
      mem_59_sv2v_reg <= w_data_i[27];
      mem_58_sv2v_reg <= w_data_i[26];
      mem_57_sv2v_reg <= w_data_i[25];
      mem_56_sv2v_reg <= w_data_i[24];
      mem_55_sv2v_reg <= w_data_i[23];
      mem_54_sv2v_reg <= w_data_i[22];
      mem_53_sv2v_reg <= w_data_i[21];
      mem_52_sv2v_reg <= w_data_i[20];
      mem_51_sv2v_reg <= w_data_i[19];
      mem_50_sv2v_reg <= w_data_i[18];
      mem_49_sv2v_reg <= w_data_i[17];
      mem_48_sv2v_reg <= w_data_i[16];
      mem_47_sv2v_reg <= w_data_i[15];
      mem_46_sv2v_reg <= w_data_i[14];
      mem_45_sv2v_reg <= w_data_i[13];
      mem_44_sv2v_reg <= w_data_i[12];
      mem_43_sv2v_reg <= w_data_i[11];
      mem_42_sv2v_reg <= w_data_i[10];
      mem_41_sv2v_reg <= w_data_i[9];
      mem_40_sv2v_reg <= w_data_i[8];
      mem_39_sv2v_reg <= w_data_i[7];
      mem_38_sv2v_reg <= w_data_i[6];
      mem_37_sv2v_reg <= w_data_i[5];
      mem_36_sv2v_reg <= w_data_i[4];
      mem_35_sv2v_reg <= w_data_i[3];
      mem_34_sv2v_reg <= w_data_i[2];
      mem_33_sv2v_reg <= w_data_i[1];
      mem_32_sv2v_reg <= w_data_i[0];
    end 
    if(N5) begin
      mem_31_sv2v_reg <= w_data_i[31];
      mem_30_sv2v_reg <= w_data_i[30];
      mem_29_sv2v_reg <= w_data_i[29];
      mem_28_sv2v_reg <= w_data_i[28];
      mem_27_sv2v_reg <= w_data_i[27];
      mem_26_sv2v_reg <= w_data_i[26];
      mem_25_sv2v_reg <= w_data_i[25];
      mem_24_sv2v_reg <= w_data_i[24];
      mem_23_sv2v_reg <= w_data_i[23];
      mem_22_sv2v_reg <= w_data_i[22];
      mem_21_sv2v_reg <= w_data_i[21];
      mem_20_sv2v_reg <= w_data_i[20];
      mem_19_sv2v_reg <= w_data_i[19];
      mem_18_sv2v_reg <= w_data_i[18];
      mem_17_sv2v_reg <= w_data_i[17];
      mem_16_sv2v_reg <= w_data_i[16];
      mem_15_sv2v_reg <= w_data_i[15];
      mem_14_sv2v_reg <= w_data_i[14];
      mem_13_sv2v_reg <= w_data_i[13];
      mem_12_sv2v_reg <= w_data_i[12];
      mem_11_sv2v_reg <= w_data_i[11];
      mem_10_sv2v_reg <= w_data_i[10];
      mem_9_sv2v_reg <= w_data_i[9];
      mem_8_sv2v_reg <= w_data_i[8];
      mem_7_sv2v_reg <= w_data_i[7];
      mem_6_sv2v_reg <= w_data_i[6];
      mem_5_sv2v_reg <= w_data_i[5];
      mem_4_sv2v_reg <= w_data_i[4];
      mem_3_sv2v_reg <= w_data_i[3];
      mem_2_sv2v_reg <= w_data_i[2];
      mem_1_sv2v_reg <= w_data_i[1];
      mem_0_sv2v_reg <= w_data_i[0];
    end 
  end


endmodule



module bsg_mem_1r1w_width_p32_els_p2_read_write_same_addr_p0
(
  w_clk_i,
  w_reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [0:0] w_addr_i;
  input [31:0] w_data_i;
  input [0:0] r_addr_i;
  output [31:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [31:0] r_data_o;

  bsg_mem_1r1w_synth_width_p32_els_p2_read_write_same_addr_p0_harden_p0
  synth
  (
    .w_clk_i(w_clk_i),
    .w_reset_i(w_reset_i),
    .w_v_i(w_v_i),
    .w_addr_i(w_addr_i[0]),
    .w_data_i(w_data_i),
    .r_v_i(r_v_i),
    .r_addr_i(r_addr_i[0]),
    .r_data_o(r_data_o)
  );


endmodule



module bsg_two_fifo_width_p32
(
  clk_i,
  reset_i,
  ready_o,
  data_i,
  v_i,
  v_o,
  data_o,
  yumi_i
);

  input [31:0] data_i;
  output [31:0] data_o;
  input clk_i;
  input reset_i;
  input v_i;
  input yumi_i;
  output ready_o;
  output v_o;
  wire [31:0] data_o;
  wire ready_o,v_o,enq_i,tail_r,_0_net_,head_r,empty_r,full_r,N0,N1,N2,N3,N4,N5,N6,N7,
  N8,N9,N10,N11,N12,N13,N14;
  reg full_r_sv2v_reg,tail_r_sv2v_reg,head_r_sv2v_reg,empty_r_sv2v_reg;
  assign full_r = full_r_sv2v_reg;
  assign tail_r = tail_r_sv2v_reg;
  assign head_r = head_r_sv2v_reg;
  assign empty_r = empty_r_sv2v_reg;

  bsg_mem_1r1w_width_p32_els_p2_read_write_same_addr_p0
  mem_1r1w
  (
    .w_clk_i(clk_i),
    .w_reset_i(reset_i),
    .w_v_i(enq_i),
    .w_addr_i(tail_r),
    .w_data_i(data_i),
    .r_v_i(_0_net_),
    .r_addr_i(head_r),
    .r_data_o(data_o)
  );

  assign _0_net_ = ~empty_r;
  assign v_o = ~empty_r;
  assign ready_o = ~full_r;
  assign enq_i = v_i & N5;
  assign N5 = ~full_r;
  assign N1 = enq_i;
  assign N0 = ~tail_r;
  assign N2 = ~head_r;
  assign N3 = N7 | N9;
  assign N7 = empty_r & N6;
  assign N6 = ~enq_i;
  assign N9 = N8 & N6;
  assign N8 = N5 & yumi_i;
  assign N4 = N13 | N14;
  assign N13 = N11 & N12;
  assign N11 = N10 & enq_i;
  assign N10 = ~empty_r;
  assign N12 = ~yumi_i;
  assign N14 = full_r & N12;

  always @(posedge clk_i) begin
    if(reset_i) begin
      full_r_sv2v_reg <= 1'b0;
      empty_r_sv2v_reg <= 1'b1;
    end else if(1'b1) begin
      full_r_sv2v_reg <= N4;
      empty_r_sv2v_reg <= N3;
    end 
    if(reset_i) begin
      tail_r_sv2v_reg <= 1'b0;
    end else if(N1) begin
      tail_r_sv2v_reg <= N0;
    end 
    if(reset_i) begin
      head_r_sv2v_reg <= 1'b0;
    end else if(yumi_i) begin
      head_r_sv2v_reg <= N2;
    end 
  end


endmodule



module bsg_dff_reset_width_p1
(
  clk_i,
  reset_i,
  data_i,
  data_o
);

  input [0:0] data_i;
  output [0:0] data_o;
  input clk_i;
  input reset_i;
  wire [0:0] data_o;
  reg data_o_0_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(reset_i) begin
      data_o_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bsg_dff_en_width_p32_harden_p0
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [31:0] data_i;
  output [31:0] data_o;
  input clk_i;
  input en_i;
  wire [31:0] data_o;
  reg data_o_31_sv2v_reg,data_o_30_sv2v_reg,data_o_29_sv2v_reg,data_o_28_sv2v_reg,
  data_o_27_sv2v_reg,data_o_26_sv2v_reg,data_o_25_sv2v_reg,data_o_24_sv2v_reg,
  data_o_23_sv2v_reg,data_o_22_sv2v_reg,data_o_21_sv2v_reg,data_o_20_sv2v_reg,
  data_o_19_sv2v_reg,data_o_18_sv2v_reg,data_o_17_sv2v_reg,data_o_16_sv2v_reg,
  data_o_15_sv2v_reg,data_o_14_sv2v_reg,data_o_13_sv2v_reg,data_o_12_sv2v_reg,data_o_11_sv2v_reg,
  data_o_10_sv2v_reg,data_o_9_sv2v_reg,data_o_8_sv2v_reg,data_o_7_sv2v_reg,
  data_o_6_sv2v_reg,data_o_5_sv2v_reg,data_o_4_sv2v_reg,data_o_3_sv2v_reg,
  data_o_2_sv2v_reg,data_o_1_sv2v_reg,data_o_0_sv2v_reg;
  assign data_o[31] = data_o_31_sv2v_reg;
  assign data_o[30] = data_o_30_sv2v_reg;
  assign data_o[29] = data_o_29_sv2v_reg;
  assign data_o[28] = data_o_28_sv2v_reg;
  assign data_o[27] = data_o_27_sv2v_reg;
  assign data_o[26] = data_o_26_sv2v_reg;
  assign data_o[25] = data_o_25_sv2v_reg;
  assign data_o[24] = data_o_24_sv2v_reg;
  assign data_o[23] = data_o_23_sv2v_reg;
  assign data_o[22] = data_o_22_sv2v_reg;
  assign data_o[21] = data_o_21_sv2v_reg;
  assign data_o[20] = data_o_20_sv2v_reg;
  assign data_o[19] = data_o_19_sv2v_reg;
  assign data_o[18] = data_o_18_sv2v_reg;
  assign data_o[17] = data_o_17_sv2v_reg;
  assign data_o[16] = data_o_16_sv2v_reg;
  assign data_o[15] = data_o_15_sv2v_reg;
  assign data_o[14] = data_o_14_sv2v_reg;
  assign data_o[13] = data_o_13_sv2v_reg;
  assign data_o[12] = data_o_12_sv2v_reg;
  assign data_o[11] = data_o_11_sv2v_reg;
  assign data_o[10] = data_o_10_sv2v_reg;
  assign data_o[9] = data_o_9_sv2v_reg;
  assign data_o[8] = data_o_8_sv2v_reg;
  assign data_o[7] = data_o_7_sv2v_reg;
  assign data_o[6] = data_o_6_sv2v_reg;
  assign data_o[5] = data_o_5_sv2v_reg;
  assign data_o[4] = data_o_4_sv2v_reg;
  assign data_o[3] = data_o_3_sv2v_reg;
  assign data_o[2] = data_o_2_sv2v_reg;
  assign data_o[1] = data_o_1_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(en_i) begin
      data_o_31_sv2v_reg <= data_i[31];
      data_o_30_sv2v_reg <= data_i[30];
      data_o_29_sv2v_reg <= data_i[29];
      data_o_28_sv2v_reg <= data_i[28];
      data_o_27_sv2v_reg <= data_i[27];
      data_o_26_sv2v_reg <= data_i[26];
      data_o_25_sv2v_reg <= data_i[25];
      data_o_24_sv2v_reg <= data_i[24];
      data_o_23_sv2v_reg <= data_i[23];
      data_o_22_sv2v_reg <= data_i[22];
      data_o_21_sv2v_reg <= data_i[21];
      data_o_20_sv2v_reg <= data_i[20];
      data_o_19_sv2v_reg <= data_i[19];
      data_o_18_sv2v_reg <= data_i[18];
      data_o_17_sv2v_reg <= data_i[17];
      data_o_16_sv2v_reg <= data_i[16];
      data_o_15_sv2v_reg <= data_i[15];
      data_o_14_sv2v_reg <= data_i[14];
      data_o_13_sv2v_reg <= data_i[13];
      data_o_12_sv2v_reg <= data_i[12];
      data_o_11_sv2v_reg <= data_i[11];
      data_o_10_sv2v_reg <= data_i[10];
      data_o_9_sv2v_reg <= data_i[9];
      data_o_8_sv2v_reg <= data_i[8];
      data_o_7_sv2v_reg <= data_i[7];
      data_o_6_sv2v_reg <= data_i[6];
      data_o_5_sv2v_reg <= data_i[5];
      data_o_4_sv2v_reg <= data_i[4];
      data_o_3_sv2v_reg <= data_i[3];
      data_o_2_sv2v_reg <= data_i[2];
      data_o_1_sv2v_reg <= data_i[1];
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bsg_one_fifo_width_p32
(
  clk_i,
  reset_i,
  ready_o,
  data_i,
  v_i,
  v_o,
  data_o,
  yumi_i
);

  input [31:0] data_i;
  output [31:0] data_o;
  input clk_i;
  input reset_i;
  input v_i;
  input yumi_i;
  output ready_o;
  output v_o;
  wire [31:0] data_o;
  wire ready_o,v_o,N0,N1,_0_net_,N2,N3,_1_net_;

  bsg_dff_reset_width_p1
  dff_full
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .data_i(_0_net_),
    .data_o(v_o)
  );


  bsg_dff_en_width_p32_harden_p0
  dff
  (
    .clk_i(clk_i),
    .data_i(data_i),
    .en_i(_1_net_),
    .data_o(data_o)
  );

  assign _0_net_ = (N0)? N3 : 
                   (N1)? v_i : 1'b0;
  assign N0 = v_o;
  assign N1 = N2;
  assign ready_o = ~v_o;
  assign N2 = ~v_o;
  assign N3 = ~yumi_i;
  assign _1_net_ = v_i & ready_o;

endmodule



module bsg_dff_reset_set_clear_width_p1
(
  clk_i,
  reset_i,
  set_i,
  clear_i,
  data_o
);

  input [0:0] set_i;
  input [0:0] clear_i;
  output [0:0] data_o;
  input clk_i;
  input reset_i;
  wire [0:0] data_o;
  wire N0,N1,N2;
  reg data_o_0_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;
  assign N0 = N2 | set_i[0];
  assign N2 = data_o[0] & N1;
  assign N1 = ~clear_i[0];

  always @(posedge clk_i) begin
    if(reset_i) begin
      data_o_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      data_o_0_sv2v_reg <= N0;
    end 
  end


endmodule



module bsg_counter_clear_up_1_0
(
  clk_i,
  reset_i,
  clear_i,
  up_i,
  count_o
);

  output [0:0] count_o;
  input clk_i;
  input reset_i;
  input clear_i;
  input up_i;
  wire [0:0] count_o;
  wire N0,N1,N2,N3,N4;
  reg count_o_0_sv2v_reg;
  assign count_o[0] = count_o_0_sv2v_reg;
  assign N3 = count_o[0] ^ up_i;
  assign N4 = (N0)? up_i : 
              (N1)? N3 : 1'b0;
  assign N0 = clear_i;
  assign N1 = N2;
  assign N2 = ~clear_i;

  always @(posedge clk_i) begin
    if(reset_i) begin
      count_o_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      count_o_0_sv2v_reg <= N4;
    end 
  end


endmodule



module bsg_mux_width_p32_els_p2
(
  data_i,
  sel_i,
  data_o
);

  input [63:0] data_i;
  input [0:0] sel_i;
  output [31:0] data_o;
  wire [31:0] data_o;
  wire N0,N1;
  assign data_o[31] = (N1)? data_i[31] : 
                      (N0)? data_i[63] : 1'b0;
  assign N0 = sel_i[0];
  assign data_o[30] = (N1)? data_i[30] : 
                      (N0)? data_i[62] : 1'b0;
  assign data_o[29] = (N1)? data_i[29] : 
                      (N0)? data_i[61] : 1'b0;
  assign data_o[28] = (N1)? data_i[28] : 
                      (N0)? data_i[60] : 1'b0;
  assign data_o[27] = (N1)? data_i[27] : 
                      (N0)? data_i[59] : 1'b0;
  assign data_o[26] = (N1)? data_i[26] : 
                      (N0)? data_i[58] : 1'b0;
  assign data_o[25] = (N1)? data_i[25] : 
                      (N0)? data_i[57] : 1'b0;
  assign data_o[24] = (N1)? data_i[24] : 
                      (N0)? data_i[56] : 1'b0;
  assign data_o[23] = (N1)? data_i[23] : 
                      (N0)? data_i[55] : 1'b0;
  assign data_o[22] = (N1)? data_i[22] : 
                      (N0)? data_i[54] : 1'b0;
  assign data_o[21] = (N1)? data_i[21] : 
                      (N0)? data_i[53] : 1'b0;
  assign data_o[20] = (N1)? data_i[20] : 
                      (N0)? data_i[52] : 1'b0;
  assign data_o[19] = (N1)? data_i[19] : 
                      (N0)? data_i[51] : 1'b0;
  assign data_o[18] = (N1)? data_i[18] : 
                      (N0)? data_i[50] : 1'b0;
  assign data_o[17] = (N1)? data_i[17] : 
                      (N0)? data_i[49] : 1'b0;
  assign data_o[16] = (N1)? data_i[16] : 
                      (N0)? data_i[48] : 1'b0;
  assign data_o[15] = (N1)? data_i[15] : 
                      (N0)? data_i[47] : 1'b0;
  assign data_o[14] = (N1)? data_i[14] : 
                      (N0)? data_i[46] : 1'b0;
  assign data_o[13] = (N1)? data_i[13] : 
                      (N0)? data_i[45] : 1'b0;
  assign data_o[12] = (N1)? data_i[12] : 
                      (N0)? data_i[44] : 1'b0;
  assign data_o[11] = (N1)? data_i[11] : 
                      (N0)? data_i[43] : 1'b0;
  assign data_o[10] = (N1)? data_i[10] : 
                      (N0)? data_i[42] : 1'b0;
  assign data_o[9] = (N1)? data_i[9] : 
                     (N0)? data_i[41] : 1'b0;
  assign data_o[8] = (N1)? data_i[8] : 
                     (N0)? data_i[40] : 1'b0;
  assign data_o[7] = (N1)? data_i[7] : 
                     (N0)? data_i[39] : 1'b0;
  assign data_o[6] = (N1)? data_i[6] : 
                     (N0)? data_i[38] : 1'b0;
  assign data_o[5] = (N1)? data_i[5] : 
                     (N0)? data_i[37] : 1'b0;
  assign data_o[4] = (N1)? data_i[4] : 
                     (N0)? data_i[36] : 1'b0;
  assign data_o[3] = (N1)? data_i[3] : 
                     (N0)? data_i[35] : 1'b0;
  assign data_o[2] = (N1)? data_i[2] : 
                     (N0)? data_i[34] : 1'b0;
  assign data_o[1] = (N1)? data_i[1] : 
                     (N0)? data_i[33] : 1'b0;
  assign data_o[0] = (N1)? data_i[0] : 
                     (N0)? data_i[32] : 1'b0;
  assign N1 = ~sel_i[0];

endmodule



module bsg_parallel_in_serial_out_width_p32_els_p2
(
  clk_i,
  reset_i,
  valid_i,
  data_i,
  ready_and_o,
  valid_o,
  data_o,
  yumi_i
);

  input [63:0] data_i;
  output [31:0] data_o;
  input clk_i;
  input reset_i;
  input valid_i;
  input yumi_i;
  output ready_and_o;
  output valid_o;
  wire [31:0] data_o;
  wire ready_and_o,valid_o,N0,fifo0_ready_lo,fifo0_v_li,fifo_yumi_li,
  wait_fifo1_r ,_0_net_,_1_net_,N1,_2_net_,N2,N3,N4,N5,N6,N7;
  wire [63:0] fifo_data_lo;
  wire shift_ctr_r ;

  bsg_two_fifo_width_p32
  two_fifo_fifo0 
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .ready_o(fifo0_ready_lo),
    .data_i(data_i[31:0]),
    .v_i(fifo0_v_li),
    .v_o(valid_o),
    .data_o(fifo_data_lo[31:0]),
    .yumi_i(fifo_yumi_li)
  );


  bsg_one_fifo_width_p32
  piso_fifo1 
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .ready_o(ready_and_o),
    .data_i(data_i[63:32]),
    .v_i(valid_i),
    .data_o(fifo_data_lo[63:32]),
    .yumi_i(fifo_yumi_li)
  );


  bsg_dff_reset_set_clear_width_p1
  piso_twobuf_wait_fifo1_dff 
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .set_i(_0_net_),
    .clear_i(_1_net_),
    .data_o(wait_fifo1_r )
  );

  assign N0 = shift_ctr_r ^ 1'b1;
  assign N1 = ~N0;

  bsg_counter_clear_up_1_0
  piso_shift_ctr 
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .clear_i(fifo_yumi_li),
    .up_i(_2_net_),
    .count_o(shift_ctr_r)
  );


  bsg_mux_width_p32_els_p2
  piso_data_o_mux 
  (
    .data_i(fifo_data_lo),
    .sel_i(shift_ctr_r),
    .data_o(data_o)
  );

  assign fifo0_v_li = valid_i & N2;
  assign N2 = ~wait_fifo1_r ;
  assign _1_net_ = wait_fifo1_r  & ready_and_o;
  assign _0_net_ = N3 & N4;
  assign N3 = N2 & valid_i;
  assign N4 = ~ready_and_o;
  assign fifo_yumi_li = N5 & yumi_i;
  assign N5 = valid_o & N1;
  assign _2_net_ = N7 & yumi_i;
  assign N7 = N6 & valid_o;
  assign N6 = ~fifo_yumi_li;

endmodule



module bsg_mem_1r1w_synth_width_p16_els_p2_read_write_same_addr_p0_harden_p0
(
  w_clk_i,
  w_reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [0:0] w_addr_i;
  input [15:0] w_data_i;
  input [0:0] r_addr_i;
  output [15:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [15:0] r_data_o;
  wire N0,N1,N2,N3,N4,N5,N6,N7;
  wire [31:0] mem;
  reg mem_31_sv2v_reg,mem_30_sv2v_reg,mem_29_sv2v_reg,mem_28_sv2v_reg,mem_27_sv2v_reg,
  mem_26_sv2v_reg,mem_25_sv2v_reg,mem_24_sv2v_reg,mem_23_sv2v_reg,mem_22_sv2v_reg,
  mem_21_sv2v_reg,mem_20_sv2v_reg,mem_19_sv2v_reg,mem_18_sv2v_reg,mem_17_sv2v_reg,
  mem_16_sv2v_reg,mem_15_sv2v_reg,mem_14_sv2v_reg,mem_13_sv2v_reg,mem_12_sv2v_reg,
  mem_11_sv2v_reg,mem_10_sv2v_reg,mem_9_sv2v_reg,mem_8_sv2v_reg,mem_7_sv2v_reg,
  mem_6_sv2v_reg,mem_5_sv2v_reg,mem_4_sv2v_reg,mem_3_sv2v_reg,mem_2_sv2v_reg,
  mem_1_sv2v_reg,mem_0_sv2v_reg;
  assign mem[31] = mem_31_sv2v_reg;
  assign mem[30] = mem_30_sv2v_reg;
  assign mem[29] = mem_29_sv2v_reg;
  assign mem[28] = mem_28_sv2v_reg;
  assign mem[27] = mem_27_sv2v_reg;
  assign mem[26] = mem_26_sv2v_reg;
  assign mem[25] = mem_25_sv2v_reg;
  assign mem[24] = mem_24_sv2v_reg;
  assign mem[23] = mem_23_sv2v_reg;
  assign mem[22] = mem_22_sv2v_reg;
  assign mem[21] = mem_21_sv2v_reg;
  assign mem[20] = mem_20_sv2v_reg;
  assign mem[19] = mem_19_sv2v_reg;
  assign mem[18] = mem_18_sv2v_reg;
  assign mem[17] = mem_17_sv2v_reg;
  assign mem[16] = mem_16_sv2v_reg;
  assign mem[15] = mem_15_sv2v_reg;
  assign mem[14] = mem_14_sv2v_reg;
  assign mem[13] = mem_13_sv2v_reg;
  assign mem[12] = mem_12_sv2v_reg;
  assign mem[11] = mem_11_sv2v_reg;
  assign mem[10] = mem_10_sv2v_reg;
  assign mem[9] = mem_9_sv2v_reg;
  assign mem[8] = mem_8_sv2v_reg;
  assign mem[7] = mem_7_sv2v_reg;
  assign mem[6] = mem_6_sv2v_reg;
  assign mem[5] = mem_5_sv2v_reg;
  assign mem[4] = mem_4_sv2v_reg;
  assign mem[3] = mem_3_sv2v_reg;
  assign mem[2] = mem_2_sv2v_reg;
  assign mem[1] = mem_1_sv2v_reg;
  assign mem[0] = mem_0_sv2v_reg;
  assign r_data_o[15] = (N3)? mem[15] : 
                        (N0)? mem[31] : 1'b0;
  assign N0 = r_addr_i[0];
  assign r_data_o[14] = (N3)? mem[14] : 
                        (N0)? mem[30] : 1'b0;
  assign r_data_o[13] = (N3)? mem[13] : 
                        (N0)? mem[29] : 1'b0;
  assign r_data_o[12] = (N3)? mem[12] : 
                        (N0)? mem[28] : 1'b0;
  assign r_data_o[11] = (N3)? mem[11] : 
                        (N0)? mem[27] : 1'b0;
  assign r_data_o[10] = (N3)? mem[10] : 
                        (N0)? mem[26] : 1'b0;
  assign r_data_o[9] = (N3)? mem[9] : 
                       (N0)? mem[25] : 1'b0;
  assign r_data_o[8] = (N3)? mem[8] : 
                       (N0)? mem[24] : 1'b0;
  assign r_data_o[7] = (N3)? mem[7] : 
                       (N0)? mem[23] : 1'b0;
  assign r_data_o[6] = (N3)? mem[6] : 
                       (N0)? mem[22] : 1'b0;
  assign r_data_o[5] = (N3)? mem[5] : 
                       (N0)? mem[21] : 1'b0;
  assign r_data_o[4] = (N3)? mem[4] : 
                       (N0)? mem[20] : 1'b0;
  assign r_data_o[3] = (N3)? mem[3] : 
                       (N0)? mem[19] : 1'b0;
  assign r_data_o[2] = (N3)? mem[2] : 
                       (N0)? mem[18] : 1'b0;
  assign r_data_o[1] = (N3)? mem[1] : 
                       (N0)? mem[17] : 1'b0;
  assign r_data_o[0] = (N3)? mem[0] : 
                       (N0)? mem[16] : 1'b0;
  assign N7 = ~w_addr_i[0];
  assign { N6, N5 } = (N1)? { w_addr_i[0:0], N7 } : 
                      (N2)? { 1'b0, 1'b0 } : 1'b0;
  assign N1 = w_v_i;
  assign N2 = N4;
  assign N3 = ~r_addr_i[0];
  assign N4 = ~w_v_i;

  always @(posedge w_clk_i) begin
    if(N6) begin
      mem_31_sv2v_reg <= w_data_i[15];
      mem_30_sv2v_reg <= w_data_i[14];
      mem_29_sv2v_reg <= w_data_i[13];
      mem_28_sv2v_reg <= w_data_i[12];
      mem_27_sv2v_reg <= w_data_i[11];
      mem_26_sv2v_reg <= w_data_i[10];
      mem_25_sv2v_reg <= w_data_i[9];
      mem_24_sv2v_reg <= w_data_i[8];
      mem_23_sv2v_reg <= w_data_i[7];
      mem_22_sv2v_reg <= w_data_i[6];
      mem_21_sv2v_reg <= w_data_i[5];
      mem_20_sv2v_reg <= w_data_i[4];
      mem_19_sv2v_reg <= w_data_i[3];
      mem_18_sv2v_reg <= w_data_i[2];
      mem_17_sv2v_reg <= w_data_i[1];
      mem_16_sv2v_reg <= w_data_i[0];
    end 
    if(N5) begin
      mem_15_sv2v_reg <= w_data_i[15];
      mem_14_sv2v_reg <= w_data_i[14];
      mem_13_sv2v_reg <= w_data_i[13];
      mem_12_sv2v_reg <= w_data_i[12];
      mem_11_sv2v_reg <= w_data_i[11];
      mem_10_sv2v_reg <= w_data_i[10];
      mem_9_sv2v_reg <= w_data_i[9];
      mem_8_sv2v_reg <= w_data_i[8];
      mem_7_sv2v_reg <= w_data_i[7];
      mem_6_sv2v_reg <= w_data_i[6];
      mem_5_sv2v_reg <= w_data_i[5];
      mem_4_sv2v_reg <= w_data_i[4];
      mem_3_sv2v_reg <= w_data_i[3];
      mem_2_sv2v_reg <= w_data_i[2];
      mem_1_sv2v_reg <= w_data_i[1];
      mem_0_sv2v_reg <= w_data_i[0];
    end 
  end


endmodule



module bsg_mem_1r1w_width_p16_els_p2_read_write_same_addr_p0
(
  w_clk_i,
  w_reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [0:0] w_addr_i;
  input [15:0] w_data_i;
  input [0:0] r_addr_i;
  output [15:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [15:0] r_data_o;

  bsg_mem_1r1w_synth_width_p16_els_p2_read_write_same_addr_p0_harden_p0
  synth
  (
    .w_clk_i(w_clk_i),
    .w_reset_i(w_reset_i),
    .w_v_i(w_v_i),
    .w_addr_i(w_addr_i[0]),
    .w_data_i(w_data_i),
    .r_v_i(r_v_i),
    .r_addr_i(r_addr_i[0]),
    .r_data_o(r_data_o)
  );


endmodule



module bsg_two_fifo_width_p16
(
  clk_i,
  reset_i,
  ready_o,
  data_i,
  v_i,
  v_o,
  data_o,
  yumi_i
);

  input [15:0] data_i;
  output [15:0] data_o;
  input clk_i;
  input reset_i;
  input v_i;
  input yumi_i;
  output ready_o;
  output v_o;
  wire [15:0] data_o;
  wire ready_o,v_o,enq_i,tail_r,_0_net_,head_r,empty_r,full_r,N0,N1,N2,N3,N4,N5,N6,N7,
  N8,N9,N10,N11,N12,N13,N14;
  reg full_r_sv2v_reg,tail_r_sv2v_reg,head_r_sv2v_reg,empty_r_sv2v_reg;
  assign full_r = full_r_sv2v_reg;
  assign tail_r = tail_r_sv2v_reg;
  assign head_r = head_r_sv2v_reg;
  assign empty_r = empty_r_sv2v_reg;

  bsg_mem_1r1w_width_p16_els_p2_read_write_same_addr_p0
  mem_1r1w
  (
    .w_clk_i(clk_i),
    .w_reset_i(reset_i),
    .w_v_i(enq_i),
    .w_addr_i(tail_r),
    .w_data_i(data_i),
    .r_v_i(_0_net_),
    .r_addr_i(head_r),
    .r_data_o(data_o)
  );

  assign _0_net_ = ~empty_r;
  assign v_o = ~empty_r;
  assign ready_o = ~full_r;
  assign enq_i = v_i & N5;
  assign N5 = ~full_r;
  assign N1 = enq_i;
  assign N0 = ~tail_r;
  assign N2 = ~head_r;
  assign N3 = N7 | N9;
  assign N7 = empty_r & N6;
  assign N6 = ~enq_i;
  assign N9 = N8 & N6;
  assign N8 = N5 & yumi_i;
  assign N4 = N13 | N14;
  assign N13 = N11 & N12;
  assign N11 = N10 & enq_i;
  assign N10 = ~empty_r;
  assign N12 = ~yumi_i;
  assign N14 = full_r & N12;

  always @(posedge clk_i) begin
    if(reset_i) begin
      full_r_sv2v_reg <= 1'b0;
      empty_r_sv2v_reg <= 1'b1;
    end else if(1'b1) begin
      full_r_sv2v_reg <= N4;
      empty_r_sv2v_reg <= N3;
    end 
    if(reset_i) begin
      tail_r_sv2v_reg <= 1'b0;
    end else if(N1) begin
      tail_r_sv2v_reg <= N0;
    end 
    if(reset_i) begin
      head_r_sv2v_reg <= 1'b0;
    end else if(yumi_i) begin
      head_r_sv2v_reg <= N2;
    end 
  end


endmodule



module bsg_mem_1r1w_synth_width_p16_els_p8_read_write_same_addr_p0_harden_p0
(
  w_clk_i,
  w_reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [2:0] w_addr_i;
  input [15:0] w_data_i;
  input [2:0] r_addr_i;
  output [15:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [15:0] r_data_o;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,N21,
  N22,N23,N24,N25,N26,N27,N28,N29,N30,N31,N32,N33,N34,N35,N36,N37,N38,N39,N40,N41,
  N42,N43,N44,N45;
  wire [127:0] mem;
  reg mem_127_sv2v_reg,mem_126_sv2v_reg,mem_125_sv2v_reg,mem_124_sv2v_reg,
  mem_123_sv2v_reg,mem_122_sv2v_reg,mem_121_sv2v_reg,mem_120_sv2v_reg,mem_119_sv2v_reg,
  mem_118_sv2v_reg,mem_117_sv2v_reg,mem_116_sv2v_reg,mem_115_sv2v_reg,mem_114_sv2v_reg,
  mem_113_sv2v_reg,mem_112_sv2v_reg,mem_111_sv2v_reg,mem_110_sv2v_reg,
  mem_109_sv2v_reg,mem_108_sv2v_reg,mem_107_sv2v_reg,mem_106_sv2v_reg,mem_105_sv2v_reg,
  mem_104_sv2v_reg,mem_103_sv2v_reg,mem_102_sv2v_reg,mem_101_sv2v_reg,mem_100_sv2v_reg,
  mem_99_sv2v_reg,mem_98_sv2v_reg,mem_97_sv2v_reg,mem_96_sv2v_reg,mem_95_sv2v_reg,
  mem_94_sv2v_reg,mem_93_sv2v_reg,mem_92_sv2v_reg,mem_91_sv2v_reg,mem_90_sv2v_reg,
  mem_89_sv2v_reg,mem_88_sv2v_reg,mem_87_sv2v_reg,mem_86_sv2v_reg,mem_85_sv2v_reg,
  mem_84_sv2v_reg,mem_83_sv2v_reg,mem_82_sv2v_reg,mem_81_sv2v_reg,mem_80_sv2v_reg,
  mem_79_sv2v_reg,mem_78_sv2v_reg,mem_77_sv2v_reg,mem_76_sv2v_reg,mem_75_sv2v_reg,
  mem_74_sv2v_reg,mem_73_sv2v_reg,mem_72_sv2v_reg,mem_71_sv2v_reg,mem_70_sv2v_reg,
  mem_69_sv2v_reg,mem_68_sv2v_reg,mem_67_sv2v_reg,mem_66_sv2v_reg,mem_65_sv2v_reg,
  mem_64_sv2v_reg,mem_63_sv2v_reg,mem_62_sv2v_reg,mem_61_sv2v_reg,mem_60_sv2v_reg,
  mem_59_sv2v_reg,mem_58_sv2v_reg,mem_57_sv2v_reg,mem_56_sv2v_reg,mem_55_sv2v_reg,
  mem_54_sv2v_reg,mem_53_sv2v_reg,mem_52_sv2v_reg,mem_51_sv2v_reg,mem_50_sv2v_reg,
  mem_49_sv2v_reg,mem_48_sv2v_reg,mem_47_sv2v_reg,mem_46_sv2v_reg,mem_45_sv2v_reg,
  mem_44_sv2v_reg,mem_43_sv2v_reg,mem_42_sv2v_reg,mem_41_sv2v_reg,mem_40_sv2v_reg,
  mem_39_sv2v_reg,mem_38_sv2v_reg,mem_37_sv2v_reg,mem_36_sv2v_reg,mem_35_sv2v_reg,
  mem_34_sv2v_reg,mem_33_sv2v_reg,mem_32_sv2v_reg,mem_31_sv2v_reg,mem_30_sv2v_reg,
  mem_29_sv2v_reg,mem_28_sv2v_reg,mem_27_sv2v_reg,mem_26_sv2v_reg,mem_25_sv2v_reg,
  mem_24_sv2v_reg,mem_23_sv2v_reg,mem_22_sv2v_reg,mem_21_sv2v_reg,mem_20_sv2v_reg,
  mem_19_sv2v_reg,mem_18_sv2v_reg,mem_17_sv2v_reg,mem_16_sv2v_reg,mem_15_sv2v_reg,
  mem_14_sv2v_reg,mem_13_sv2v_reg,mem_12_sv2v_reg,mem_11_sv2v_reg,mem_10_sv2v_reg,
  mem_9_sv2v_reg,mem_8_sv2v_reg,mem_7_sv2v_reg,mem_6_sv2v_reg,mem_5_sv2v_reg,
  mem_4_sv2v_reg,mem_3_sv2v_reg,mem_2_sv2v_reg,mem_1_sv2v_reg,mem_0_sv2v_reg;
  assign mem[127] = mem_127_sv2v_reg;
  assign mem[126] = mem_126_sv2v_reg;
  assign mem[125] = mem_125_sv2v_reg;
  assign mem[124] = mem_124_sv2v_reg;
  assign mem[123] = mem_123_sv2v_reg;
  assign mem[122] = mem_122_sv2v_reg;
  assign mem[121] = mem_121_sv2v_reg;
  assign mem[120] = mem_120_sv2v_reg;
  assign mem[119] = mem_119_sv2v_reg;
  assign mem[118] = mem_118_sv2v_reg;
  assign mem[117] = mem_117_sv2v_reg;
  assign mem[116] = mem_116_sv2v_reg;
  assign mem[115] = mem_115_sv2v_reg;
  assign mem[114] = mem_114_sv2v_reg;
  assign mem[113] = mem_113_sv2v_reg;
  assign mem[112] = mem_112_sv2v_reg;
  assign mem[111] = mem_111_sv2v_reg;
  assign mem[110] = mem_110_sv2v_reg;
  assign mem[109] = mem_109_sv2v_reg;
  assign mem[108] = mem_108_sv2v_reg;
  assign mem[107] = mem_107_sv2v_reg;
  assign mem[106] = mem_106_sv2v_reg;
  assign mem[105] = mem_105_sv2v_reg;
  assign mem[104] = mem_104_sv2v_reg;
  assign mem[103] = mem_103_sv2v_reg;
  assign mem[102] = mem_102_sv2v_reg;
  assign mem[101] = mem_101_sv2v_reg;
  assign mem[100] = mem_100_sv2v_reg;
  assign mem[99] = mem_99_sv2v_reg;
  assign mem[98] = mem_98_sv2v_reg;
  assign mem[97] = mem_97_sv2v_reg;
  assign mem[96] = mem_96_sv2v_reg;
  assign mem[95] = mem_95_sv2v_reg;
  assign mem[94] = mem_94_sv2v_reg;
  assign mem[93] = mem_93_sv2v_reg;
  assign mem[92] = mem_92_sv2v_reg;
  assign mem[91] = mem_91_sv2v_reg;
  assign mem[90] = mem_90_sv2v_reg;
  assign mem[89] = mem_89_sv2v_reg;
  assign mem[88] = mem_88_sv2v_reg;
  assign mem[87] = mem_87_sv2v_reg;
  assign mem[86] = mem_86_sv2v_reg;
  assign mem[85] = mem_85_sv2v_reg;
  assign mem[84] = mem_84_sv2v_reg;
  assign mem[83] = mem_83_sv2v_reg;
  assign mem[82] = mem_82_sv2v_reg;
  assign mem[81] = mem_81_sv2v_reg;
  assign mem[80] = mem_80_sv2v_reg;
  assign mem[79] = mem_79_sv2v_reg;
  assign mem[78] = mem_78_sv2v_reg;
  assign mem[77] = mem_77_sv2v_reg;
  assign mem[76] = mem_76_sv2v_reg;
  assign mem[75] = mem_75_sv2v_reg;
  assign mem[74] = mem_74_sv2v_reg;
  assign mem[73] = mem_73_sv2v_reg;
  assign mem[72] = mem_72_sv2v_reg;
  assign mem[71] = mem_71_sv2v_reg;
  assign mem[70] = mem_70_sv2v_reg;
  assign mem[69] = mem_69_sv2v_reg;
  assign mem[68] = mem_68_sv2v_reg;
  assign mem[67] = mem_67_sv2v_reg;
  assign mem[66] = mem_66_sv2v_reg;
  assign mem[65] = mem_65_sv2v_reg;
  assign mem[64] = mem_64_sv2v_reg;
  assign mem[63] = mem_63_sv2v_reg;
  assign mem[62] = mem_62_sv2v_reg;
  assign mem[61] = mem_61_sv2v_reg;
  assign mem[60] = mem_60_sv2v_reg;
  assign mem[59] = mem_59_sv2v_reg;
  assign mem[58] = mem_58_sv2v_reg;
  assign mem[57] = mem_57_sv2v_reg;
  assign mem[56] = mem_56_sv2v_reg;
  assign mem[55] = mem_55_sv2v_reg;
  assign mem[54] = mem_54_sv2v_reg;
  assign mem[53] = mem_53_sv2v_reg;
  assign mem[52] = mem_52_sv2v_reg;
  assign mem[51] = mem_51_sv2v_reg;
  assign mem[50] = mem_50_sv2v_reg;
  assign mem[49] = mem_49_sv2v_reg;
  assign mem[48] = mem_48_sv2v_reg;
  assign mem[47] = mem_47_sv2v_reg;
  assign mem[46] = mem_46_sv2v_reg;
  assign mem[45] = mem_45_sv2v_reg;
  assign mem[44] = mem_44_sv2v_reg;
  assign mem[43] = mem_43_sv2v_reg;
  assign mem[42] = mem_42_sv2v_reg;
  assign mem[41] = mem_41_sv2v_reg;
  assign mem[40] = mem_40_sv2v_reg;
  assign mem[39] = mem_39_sv2v_reg;
  assign mem[38] = mem_38_sv2v_reg;
  assign mem[37] = mem_37_sv2v_reg;
  assign mem[36] = mem_36_sv2v_reg;
  assign mem[35] = mem_35_sv2v_reg;
  assign mem[34] = mem_34_sv2v_reg;
  assign mem[33] = mem_33_sv2v_reg;
  assign mem[32] = mem_32_sv2v_reg;
  assign mem[31] = mem_31_sv2v_reg;
  assign mem[30] = mem_30_sv2v_reg;
  assign mem[29] = mem_29_sv2v_reg;
  assign mem[28] = mem_28_sv2v_reg;
  assign mem[27] = mem_27_sv2v_reg;
  assign mem[26] = mem_26_sv2v_reg;
  assign mem[25] = mem_25_sv2v_reg;
  assign mem[24] = mem_24_sv2v_reg;
  assign mem[23] = mem_23_sv2v_reg;
  assign mem[22] = mem_22_sv2v_reg;
  assign mem[21] = mem_21_sv2v_reg;
  assign mem[20] = mem_20_sv2v_reg;
  assign mem[19] = mem_19_sv2v_reg;
  assign mem[18] = mem_18_sv2v_reg;
  assign mem[17] = mem_17_sv2v_reg;
  assign mem[16] = mem_16_sv2v_reg;
  assign mem[15] = mem_15_sv2v_reg;
  assign mem[14] = mem_14_sv2v_reg;
  assign mem[13] = mem_13_sv2v_reg;
  assign mem[12] = mem_12_sv2v_reg;
  assign mem[11] = mem_11_sv2v_reg;
  assign mem[10] = mem_10_sv2v_reg;
  assign mem[9] = mem_9_sv2v_reg;
  assign mem[8] = mem_8_sv2v_reg;
  assign mem[7] = mem_7_sv2v_reg;
  assign mem[6] = mem_6_sv2v_reg;
  assign mem[5] = mem_5_sv2v_reg;
  assign mem[4] = mem_4_sv2v_reg;
  assign mem[3] = mem_3_sv2v_reg;
  assign mem[2] = mem_2_sv2v_reg;
  assign mem[1] = mem_1_sv2v_reg;
  assign mem[0] = mem_0_sv2v_reg;
  assign r_data_o[15] = (N17)? mem[15] : 
                        (N19)? mem[31] : 
                        (N21)? mem[47] : 
                        (N23)? mem[63] : 
                        (N18)? mem[79] : 
                        (N20)? mem[95] : 
                        (N22)? mem[111] : 
                        (N24)? mem[127] : 1'b0;
  assign r_data_o[14] = (N17)? mem[14] : 
                        (N19)? mem[30] : 
                        (N21)? mem[46] : 
                        (N23)? mem[62] : 
                        (N18)? mem[78] : 
                        (N20)? mem[94] : 
                        (N22)? mem[110] : 
                        (N24)? mem[126] : 1'b0;
  assign r_data_o[13] = (N17)? mem[13] : 
                        (N19)? mem[29] : 
                        (N21)? mem[45] : 
                        (N23)? mem[61] : 
                        (N18)? mem[77] : 
                        (N20)? mem[93] : 
                        (N22)? mem[109] : 
                        (N24)? mem[125] : 1'b0;
  assign r_data_o[12] = (N17)? mem[12] : 
                        (N19)? mem[28] : 
                        (N21)? mem[44] : 
                        (N23)? mem[60] : 
                        (N18)? mem[76] : 
                        (N20)? mem[92] : 
                        (N22)? mem[108] : 
                        (N24)? mem[124] : 1'b0;
  assign r_data_o[11] = (N17)? mem[11] : 
                        (N19)? mem[27] : 
                        (N21)? mem[43] : 
                        (N23)? mem[59] : 
                        (N18)? mem[75] : 
                        (N20)? mem[91] : 
                        (N22)? mem[107] : 
                        (N24)? mem[123] : 1'b0;
  assign r_data_o[10] = (N17)? mem[10] : 
                        (N19)? mem[26] : 
                        (N21)? mem[42] : 
                        (N23)? mem[58] : 
                        (N18)? mem[74] : 
                        (N20)? mem[90] : 
                        (N22)? mem[106] : 
                        (N24)? mem[122] : 1'b0;
  assign r_data_o[9] = (N17)? mem[9] : 
                       (N19)? mem[25] : 
                       (N21)? mem[41] : 
                       (N23)? mem[57] : 
                       (N18)? mem[73] : 
                       (N20)? mem[89] : 
                       (N22)? mem[105] : 
                       (N24)? mem[121] : 1'b0;
  assign r_data_o[8] = (N17)? mem[8] : 
                       (N19)? mem[24] : 
                       (N21)? mem[40] : 
                       (N23)? mem[56] : 
                       (N18)? mem[72] : 
                       (N20)? mem[88] : 
                       (N22)? mem[104] : 
                       (N24)? mem[120] : 1'b0;
  assign r_data_o[7] = (N17)? mem[7] : 
                       (N19)? mem[23] : 
                       (N21)? mem[39] : 
                       (N23)? mem[55] : 
                       (N18)? mem[71] : 
                       (N20)? mem[87] : 
                       (N22)? mem[103] : 
                       (N24)? mem[119] : 1'b0;
  assign r_data_o[6] = (N17)? mem[6] : 
                       (N19)? mem[22] : 
                       (N21)? mem[38] : 
                       (N23)? mem[54] : 
                       (N18)? mem[70] : 
                       (N20)? mem[86] : 
                       (N22)? mem[102] : 
                       (N24)? mem[118] : 1'b0;
  assign r_data_o[5] = (N17)? mem[5] : 
                       (N19)? mem[21] : 
                       (N21)? mem[37] : 
                       (N23)? mem[53] : 
                       (N18)? mem[69] : 
                       (N20)? mem[85] : 
                       (N22)? mem[101] : 
                       (N24)? mem[117] : 1'b0;
  assign r_data_o[4] = (N17)? mem[4] : 
                       (N19)? mem[20] : 
                       (N21)? mem[36] : 
                       (N23)? mem[52] : 
                       (N18)? mem[68] : 
                       (N20)? mem[84] : 
                       (N22)? mem[100] : 
                       (N24)? mem[116] : 1'b0;
  assign r_data_o[3] = (N17)? mem[3] : 
                       (N19)? mem[19] : 
                       (N21)? mem[35] : 
                       (N23)? mem[51] : 
                       (N18)? mem[67] : 
                       (N20)? mem[83] : 
                       (N22)? mem[99] : 
                       (N24)? mem[115] : 1'b0;
  assign r_data_o[2] = (N17)? mem[2] : 
                       (N19)? mem[18] : 
                       (N21)? mem[34] : 
                       (N23)? mem[50] : 
                       (N18)? mem[66] : 
                       (N20)? mem[82] : 
                       (N22)? mem[98] : 
                       (N24)? mem[114] : 1'b0;
  assign r_data_o[1] = (N17)? mem[1] : 
                       (N19)? mem[17] : 
                       (N21)? mem[33] : 
                       (N23)? mem[49] : 
                       (N18)? mem[65] : 
                       (N20)? mem[81] : 
                       (N22)? mem[97] : 
                       (N24)? mem[113] : 1'b0;
  assign r_data_o[0] = (N17)? mem[0] : 
                       (N19)? mem[16] : 
                       (N21)? mem[32] : 
                       (N23)? mem[48] : 
                       (N18)? mem[64] : 
                       (N20)? mem[80] : 
                       (N22)? mem[96] : 
                       (N24)? mem[112] : 1'b0;
  assign N34 = w_addr_i[0] & w_addr_i[1];
  assign N35 = N34 & w_addr_i[2];
  assign N36 = N0 & w_addr_i[1];
  assign N0 = ~w_addr_i[0];
  assign N37 = N36 & w_addr_i[2];
  assign N38 = w_addr_i[0] & N1;
  assign N1 = ~w_addr_i[1];
  assign N39 = N38 & w_addr_i[2];
  assign N40 = N2 & N3;
  assign N2 = ~w_addr_i[0];
  assign N3 = ~w_addr_i[1];
  assign N41 = N40 & w_addr_i[2];
  assign N42 = N34 & N4;
  assign N4 = ~w_addr_i[2];
  assign N43 = N36 & N5;
  assign N5 = ~w_addr_i[2];
  assign N44 = N38 & N6;
  assign N6 = ~w_addr_i[2];
  assign N45 = N40 & N7;
  assign N7 = ~w_addr_i[2];
  assign { N33, N32, N31, N30, N29, N28, N27, N26 } = (N8)? { N35, N37, N39, N41, N42, N43, N44, N45 } : 
                                                      (N9)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 1'b0;
  assign N8 = w_v_i;
  assign N9 = N25;
  assign N10 = ~r_addr_i[0];
  assign N11 = ~r_addr_i[1];
  assign N12 = N10 & N11;
  assign N13 = N10 & r_addr_i[1];
  assign N14 = r_addr_i[0] & N11;
  assign N15 = r_addr_i[0] & r_addr_i[1];
  assign N16 = ~r_addr_i[2];
  assign N17 = N12 & N16;
  assign N18 = N12 & r_addr_i[2];
  assign N19 = N14 & N16;
  assign N20 = N14 & r_addr_i[2];
  assign N21 = N13 & N16;
  assign N22 = N13 & r_addr_i[2];
  assign N23 = N15 & N16;
  assign N24 = N15 & r_addr_i[2];
  assign N25 = ~w_v_i;

  always @(posedge w_clk_i) begin
    if(N33) begin
      mem_127_sv2v_reg <= w_data_i[15];
      mem_126_sv2v_reg <= w_data_i[14];
      mem_125_sv2v_reg <= w_data_i[13];
      mem_124_sv2v_reg <= w_data_i[12];
      mem_123_sv2v_reg <= w_data_i[11];
      mem_122_sv2v_reg <= w_data_i[10];
      mem_121_sv2v_reg <= w_data_i[9];
      mem_120_sv2v_reg <= w_data_i[8];
      mem_119_sv2v_reg <= w_data_i[7];
      mem_118_sv2v_reg <= w_data_i[6];
      mem_117_sv2v_reg <= w_data_i[5];
      mem_116_sv2v_reg <= w_data_i[4];
      mem_115_sv2v_reg <= w_data_i[3];
      mem_114_sv2v_reg <= w_data_i[2];
      mem_113_sv2v_reg <= w_data_i[1];
      mem_112_sv2v_reg <= w_data_i[0];
    end 
    if(N32) begin
      mem_111_sv2v_reg <= w_data_i[15];
      mem_110_sv2v_reg <= w_data_i[14];
      mem_109_sv2v_reg <= w_data_i[13];
      mem_108_sv2v_reg <= w_data_i[12];
      mem_107_sv2v_reg <= w_data_i[11];
      mem_106_sv2v_reg <= w_data_i[10];
      mem_105_sv2v_reg <= w_data_i[9];
      mem_104_sv2v_reg <= w_data_i[8];
      mem_103_sv2v_reg <= w_data_i[7];
      mem_102_sv2v_reg <= w_data_i[6];
      mem_101_sv2v_reg <= w_data_i[5];
      mem_100_sv2v_reg <= w_data_i[4];
      mem_99_sv2v_reg <= w_data_i[3];
      mem_98_sv2v_reg <= w_data_i[2];
      mem_97_sv2v_reg <= w_data_i[1];
      mem_96_sv2v_reg <= w_data_i[0];
    end 
    if(N31) begin
      mem_95_sv2v_reg <= w_data_i[15];
      mem_94_sv2v_reg <= w_data_i[14];
      mem_93_sv2v_reg <= w_data_i[13];
      mem_92_sv2v_reg <= w_data_i[12];
      mem_91_sv2v_reg <= w_data_i[11];
      mem_90_sv2v_reg <= w_data_i[10];
      mem_89_sv2v_reg <= w_data_i[9];
      mem_88_sv2v_reg <= w_data_i[8];
      mem_87_sv2v_reg <= w_data_i[7];
      mem_86_sv2v_reg <= w_data_i[6];
      mem_85_sv2v_reg <= w_data_i[5];
      mem_84_sv2v_reg <= w_data_i[4];
      mem_83_sv2v_reg <= w_data_i[3];
      mem_82_sv2v_reg <= w_data_i[2];
      mem_81_sv2v_reg <= w_data_i[1];
      mem_80_sv2v_reg <= w_data_i[0];
    end 
    if(N30) begin
      mem_79_sv2v_reg <= w_data_i[15];
      mem_78_sv2v_reg <= w_data_i[14];
      mem_77_sv2v_reg <= w_data_i[13];
      mem_76_sv2v_reg <= w_data_i[12];
      mem_75_sv2v_reg <= w_data_i[11];
      mem_74_sv2v_reg <= w_data_i[10];
      mem_73_sv2v_reg <= w_data_i[9];
      mem_72_sv2v_reg <= w_data_i[8];
      mem_71_sv2v_reg <= w_data_i[7];
      mem_70_sv2v_reg <= w_data_i[6];
      mem_69_sv2v_reg <= w_data_i[5];
      mem_68_sv2v_reg <= w_data_i[4];
      mem_67_sv2v_reg <= w_data_i[3];
      mem_66_sv2v_reg <= w_data_i[2];
      mem_65_sv2v_reg <= w_data_i[1];
      mem_64_sv2v_reg <= w_data_i[0];
    end 
    if(N29) begin
      mem_63_sv2v_reg <= w_data_i[15];
      mem_62_sv2v_reg <= w_data_i[14];
      mem_61_sv2v_reg <= w_data_i[13];
      mem_60_sv2v_reg <= w_data_i[12];
      mem_59_sv2v_reg <= w_data_i[11];
      mem_58_sv2v_reg <= w_data_i[10];
      mem_57_sv2v_reg <= w_data_i[9];
      mem_56_sv2v_reg <= w_data_i[8];
      mem_55_sv2v_reg <= w_data_i[7];
      mem_54_sv2v_reg <= w_data_i[6];
      mem_53_sv2v_reg <= w_data_i[5];
      mem_52_sv2v_reg <= w_data_i[4];
      mem_51_sv2v_reg <= w_data_i[3];
      mem_50_sv2v_reg <= w_data_i[2];
      mem_49_sv2v_reg <= w_data_i[1];
      mem_48_sv2v_reg <= w_data_i[0];
    end 
    if(N28) begin
      mem_47_sv2v_reg <= w_data_i[15];
      mem_46_sv2v_reg <= w_data_i[14];
      mem_45_sv2v_reg <= w_data_i[13];
      mem_44_sv2v_reg <= w_data_i[12];
      mem_43_sv2v_reg <= w_data_i[11];
      mem_42_sv2v_reg <= w_data_i[10];
      mem_41_sv2v_reg <= w_data_i[9];
      mem_40_sv2v_reg <= w_data_i[8];
      mem_39_sv2v_reg <= w_data_i[7];
      mem_38_sv2v_reg <= w_data_i[6];
      mem_37_sv2v_reg <= w_data_i[5];
      mem_36_sv2v_reg <= w_data_i[4];
      mem_35_sv2v_reg <= w_data_i[3];
      mem_34_sv2v_reg <= w_data_i[2];
      mem_33_sv2v_reg <= w_data_i[1];
      mem_32_sv2v_reg <= w_data_i[0];
    end 
    if(N27) begin
      mem_31_sv2v_reg <= w_data_i[15];
      mem_30_sv2v_reg <= w_data_i[14];
      mem_29_sv2v_reg <= w_data_i[13];
      mem_28_sv2v_reg <= w_data_i[12];
      mem_27_sv2v_reg <= w_data_i[11];
      mem_26_sv2v_reg <= w_data_i[10];
      mem_25_sv2v_reg <= w_data_i[9];
      mem_24_sv2v_reg <= w_data_i[8];
      mem_23_sv2v_reg <= w_data_i[7];
      mem_22_sv2v_reg <= w_data_i[6];
      mem_21_sv2v_reg <= w_data_i[5];
      mem_20_sv2v_reg <= w_data_i[4];
      mem_19_sv2v_reg <= w_data_i[3];
      mem_18_sv2v_reg <= w_data_i[2];
      mem_17_sv2v_reg <= w_data_i[1];
      mem_16_sv2v_reg <= w_data_i[0];
    end 
    if(N26) begin
      mem_15_sv2v_reg <= w_data_i[15];
      mem_14_sv2v_reg <= w_data_i[14];
      mem_13_sv2v_reg <= w_data_i[13];
      mem_12_sv2v_reg <= w_data_i[12];
      mem_11_sv2v_reg <= w_data_i[11];
      mem_10_sv2v_reg <= w_data_i[10];
      mem_9_sv2v_reg <= w_data_i[9];
      mem_8_sv2v_reg <= w_data_i[8];
      mem_7_sv2v_reg <= w_data_i[7];
      mem_6_sv2v_reg <= w_data_i[6];
      mem_5_sv2v_reg <= w_data_i[5];
      mem_4_sv2v_reg <= w_data_i[4];
      mem_3_sv2v_reg <= w_data_i[3];
      mem_2_sv2v_reg <= w_data_i[2];
      mem_1_sv2v_reg <= w_data_i[1];
      mem_0_sv2v_reg <= w_data_i[0];
    end 
  end


endmodule



module bsg_mem_1r1w_width_p16_els_p8_read_write_same_addr_p0
(
  w_clk_i,
  w_reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [2:0] w_addr_i;
  input [15:0] w_data_i;
  input [2:0] r_addr_i;
  output [15:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [15:0] r_data_o;

  bsg_mem_1r1w_synth_width_p16_els_p8_read_write_same_addr_p0_harden_p0
  synth
  (
    .w_clk_i(w_clk_i),
    .w_reset_i(w_reset_i),
    .w_v_i(w_v_i),
    .w_addr_i(w_addr_i),
    .w_data_i(w_data_i),
    .r_v_i(r_v_i),
    .r_addr_i(r_addr_i),
    .r_data_o(r_data_o)
  );


endmodule



module bsg_launch_sync_sync_posedge_4_unit
(
  iclk_i,
  iclk_reset_i,
  oclk_i,
  iclk_data_i,
  iclk_data_o,
  oclk_data_o
);

  input [3:0] iclk_data_i;
  output [3:0] iclk_data_o;
  output [3:0] oclk_data_o;
  input iclk_i;
  input iclk_reset_i;
  input oclk_i;
  wire [3:0] iclk_data_o,oclk_data_o,bsg_SYNC_1_r;
  reg iclk_data_o_3_sv2v_reg,iclk_data_o_2_sv2v_reg,iclk_data_o_1_sv2v_reg,
  iclk_data_o_0_sv2v_reg,bsg_SYNC_1_r_3_sv2v_reg,bsg_SYNC_1_r_2_sv2v_reg,
  bsg_SYNC_1_r_1_sv2v_reg,bsg_SYNC_1_r_0_sv2v_reg,oclk_data_o_3_sv2v_reg,oclk_data_o_2_sv2v_reg,
  oclk_data_o_1_sv2v_reg,oclk_data_o_0_sv2v_reg;
  assign iclk_data_o[3] = iclk_data_o_3_sv2v_reg;
  assign iclk_data_o[2] = iclk_data_o_2_sv2v_reg;
  assign iclk_data_o[1] = iclk_data_o_1_sv2v_reg;
  assign iclk_data_o[0] = iclk_data_o_0_sv2v_reg;
  assign bsg_SYNC_1_r[3] = bsg_SYNC_1_r_3_sv2v_reg;
  assign bsg_SYNC_1_r[2] = bsg_SYNC_1_r_2_sv2v_reg;
  assign bsg_SYNC_1_r[1] = bsg_SYNC_1_r_1_sv2v_reg;
  assign bsg_SYNC_1_r[0] = bsg_SYNC_1_r_0_sv2v_reg;
  assign oclk_data_o[3] = oclk_data_o_3_sv2v_reg;
  assign oclk_data_o[2] = oclk_data_o_2_sv2v_reg;
  assign oclk_data_o[1] = oclk_data_o_1_sv2v_reg;
  assign oclk_data_o[0] = oclk_data_o_0_sv2v_reg;

  always @(posedge iclk_i) begin
    if(iclk_reset_i) begin
      iclk_data_o_3_sv2v_reg <= 1'b0;
      iclk_data_o_2_sv2v_reg <= 1'b0;
      iclk_data_o_1_sv2v_reg <= 1'b0;
      iclk_data_o_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      iclk_data_o_3_sv2v_reg <= iclk_data_i[3];
      iclk_data_o_2_sv2v_reg <= iclk_data_i[2];
      iclk_data_o_1_sv2v_reg <= iclk_data_i[1];
      iclk_data_o_0_sv2v_reg <= iclk_data_i[0];
    end 
  end


  always @(posedge oclk_i) begin
    if(1'b1) begin
      bsg_SYNC_1_r_3_sv2v_reg <= iclk_data_o[3];
      bsg_SYNC_1_r_2_sv2v_reg <= iclk_data_o[2];
      bsg_SYNC_1_r_1_sv2v_reg <= iclk_data_o[1];
      bsg_SYNC_1_r_0_sv2v_reg <= iclk_data_o[0];
      oclk_data_o_3_sv2v_reg <= bsg_SYNC_1_r[3];
      oclk_data_o_2_sv2v_reg <= bsg_SYNC_1_r[2];
      oclk_data_o_1_sv2v_reg <= bsg_SYNC_1_r[1];
      oclk_data_o_0_sv2v_reg <= bsg_SYNC_1_r[0];
    end 
  end


endmodule



module bsg_launch_sync_sync_width_p4_use_negedge_for_launch_p0_use_async_reset_p0
(
  iclk_i,
  iclk_reset_i,
  oclk_i,
  iclk_data_i,
  iclk_data_o,
  oclk_data_o
);

  input [3:0] iclk_data_i;
  output [3:0] iclk_data_o;
  output [3:0] oclk_data_o;
  input iclk_i;
  input iclk_reset_i;
  input oclk_i;
  wire [3:0] iclk_data_o,oclk_data_o;

  bsg_launch_sync_sync_posedge_4_unit
  sync_p_z_blss 
  (
    .iclk_i(iclk_i),
    .iclk_reset_i(iclk_reset_i),
    .oclk_i(oclk_i),
    .iclk_data_i(iclk_data_i),
    .iclk_data_o(iclk_data_o),
    .oclk_data_o(oclk_data_o)
  );


endmodule



module bsg_async_ptr_gray_lg_size_p4
(
  w_clk_i,
  w_reset_i,
  w_inc_i,
  r_clk_i,
  w_ptr_binary_r_o,
  w_ptr_gray_r_o,
  w_ptr_gray_r_rsync_o
);

  output [3:0] w_ptr_binary_r_o;
  output [3:0] w_ptr_gray_r_o;
  output [3:0] w_ptr_gray_r_rsync_o;
  input w_clk_i;
  input w_reset_i;
  input w_inc_i;
  input r_clk_i;
  wire [3:0] w_ptr_binary_r_o,w_ptr_gray_r_o,w_ptr_gray_r_rsync_o,w_ptr_p1_r,w_ptr_p2,
  w_ptr_n,w_ptr_p1_n,w_ptr_gray_n;
  wire N0,N1,N2,N3,N4,N5;
  reg w_ptr_p1_r_3_sv2v_reg,w_ptr_p1_r_2_sv2v_reg,w_ptr_p1_r_1_sv2v_reg,
  w_ptr_p1_r_0_sv2v_reg,w_ptr_binary_r_o_3_sv2v_reg,w_ptr_binary_r_o_2_sv2v_reg,
  w_ptr_binary_r_o_1_sv2v_reg,w_ptr_binary_r_o_0_sv2v_reg;
  assign w_ptr_p1_r[3] = w_ptr_p1_r_3_sv2v_reg;
  assign w_ptr_p1_r[2] = w_ptr_p1_r_2_sv2v_reg;
  assign w_ptr_p1_r[1] = w_ptr_p1_r_1_sv2v_reg;
  assign w_ptr_p1_r[0] = w_ptr_p1_r_0_sv2v_reg;
  assign w_ptr_binary_r_o[3] = w_ptr_binary_r_o_3_sv2v_reg;
  assign w_ptr_binary_r_o[2] = w_ptr_binary_r_o_2_sv2v_reg;
  assign w_ptr_binary_r_o[1] = w_ptr_binary_r_o_1_sv2v_reg;
  assign w_ptr_binary_r_o[0] = w_ptr_binary_r_o_0_sv2v_reg;

  bsg_launch_sync_sync_width_p4_use_negedge_for_launch_p0_use_async_reset_p0
  ptr_sync
  (
    .iclk_i(w_clk_i),
    .iclk_reset_i(w_reset_i),
    .oclk_i(r_clk_i),
    .iclk_data_i(w_ptr_gray_n),
    .iclk_data_o(w_ptr_gray_r_o),
    .oclk_data_o(w_ptr_gray_r_rsync_o)
  );

  assign w_ptr_p2 = w_ptr_p1_r + 1'b1;
  assign w_ptr_n = (N0)? w_ptr_p1_r : 
                   (N1)? w_ptr_binary_r_o : 1'b0;
  assign N0 = w_inc_i;
  assign N1 = N2;
  assign w_ptr_p1_n = (N0)? w_ptr_p2 : 
                      (N1)? w_ptr_p1_r : 1'b0;
  assign w_ptr_gray_n = (N0)? { w_ptr_p1_r[3:3], N3, N4, N5 } : 
                        (N1)? w_ptr_gray_r_o : 1'b0;
  assign N2 = ~w_inc_i;
  assign N3 = w_ptr_p1_r[3] ^ w_ptr_p1_r[2];
  assign N4 = w_ptr_p1_r[2] ^ w_ptr_p1_r[1];
  assign N5 = w_ptr_p1_r[1] ^ w_ptr_p1_r[0];

  always @(posedge w_clk_i) begin
    if(w_reset_i) begin
      w_ptr_p1_r_3_sv2v_reg <= 1'b0;
      w_ptr_p1_r_2_sv2v_reg <= 1'b0;
      w_ptr_p1_r_1_sv2v_reg <= 1'b0;
      w_ptr_p1_r_0_sv2v_reg <= 1'b1;
      w_ptr_binary_r_o_3_sv2v_reg <= 1'b0;
      w_ptr_binary_r_o_2_sv2v_reg <= 1'b0;
      w_ptr_binary_r_o_1_sv2v_reg <= 1'b0;
      w_ptr_binary_r_o_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      w_ptr_p1_r_3_sv2v_reg <= w_ptr_p1_n[3];
      w_ptr_p1_r_2_sv2v_reg <= w_ptr_p1_n[2];
      w_ptr_p1_r_1_sv2v_reg <= w_ptr_p1_n[1];
      w_ptr_p1_r_0_sv2v_reg <= w_ptr_p1_n[0];
      w_ptr_binary_r_o_3_sv2v_reg <= w_ptr_n[3];
      w_ptr_binary_r_o_2_sv2v_reg <= w_ptr_n[2];
      w_ptr_binary_r_o_1_sv2v_reg <= w_ptr_n[1];
      w_ptr_binary_r_o_0_sv2v_reg <= w_ptr_n[0];
    end 
  end


endmodule



module bsg_async_fifo_lg_size_p3_width_p16
(
  w_clk_i,
  w_reset_i,
  w_enq_i,
  w_data_i,
  w_full_o,
  r_clk_i,
  r_reset_i,
  r_deq_i,
  r_data_o,
  r_valid_o
);

  input [15:0] w_data_i;
  output [15:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_enq_i;
  input r_clk_i;
  input r_reset_i;
  input r_deq_i;
  output w_full_o;
  output r_valid_o;
  wire [15:0] r_data_o;
  wire w_full_o,r_valid_o,N0,N1;
  wire [3:0] w_ptr_binary_r,r_ptr_binary_r,w_ptr_gray_r,w_ptr_gray_r_rsync,r_ptr_gray_r,
  r_ptr_gray_r_wsync;

  bsg_mem_1r1w_width_p16_els_p8_read_write_same_addr_p0
  MSYNC_1r1w
  (
    .w_clk_i(w_clk_i),
    .w_reset_i(w_reset_i),
    .w_v_i(w_enq_i),
    .w_addr_i(w_ptr_binary_r[2:0]),
    .w_data_i(w_data_i),
    .r_v_i(r_valid_o),
    .r_addr_i(r_ptr_binary_r[2:0]),
    .r_data_o(r_data_o)
  );


  bsg_async_ptr_gray_lg_size_p4
  bapg_wr
  (
    .w_clk_i(w_clk_i),
    .w_reset_i(w_reset_i),
    .w_inc_i(w_enq_i),
    .r_clk_i(r_clk_i),
    .w_ptr_binary_r_o(w_ptr_binary_r),
    .w_ptr_gray_r_o(w_ptr_gray_r),
    .w_ptr_gray_r_rsync_o(w_ptr_gray_r_rsync)
  );


  bsg_async_ptr_gray_lg_size_p4
  bapg_rd
  (
    .w_clk_i(r_clk_i),
    .w_reset_i(r_reset_i),
    .w_inc_i(r_deq_i),
    .r_clk_i(w_clk_i),
    .w_ptr_binary_r_o(r_ptr_binary_r),
    .w_ptr_gray_r_o(r_ptr_gray_r),
    .w_ptr_gray_r_rsync_o(r_ptr_gray_r_wsync)
  );

  assign r_valid_o = r_ptr_gray_r != w_ptr_gray_r_rsync;
  assign w_full_o = w_ptr_gray_r == { N0, N1, r_ptr_gray_r_wsync[1:0] };
  assign N0 = ~r_ptr_gray_r_wsync[3];
  assign N1 = ~r_ptr_gray_r_wsync[2];

endmodule



module bsg_counter_clear_up_f_0_1
(
  clk_i,
  reset_i,
  clear_i,
  up_i,
  count_o
);

  output [3:0] count_o;
  input clk_i;
  input reset_i;
  input clear_i;
  input up_i;
  wire [3:0] count_o;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10;
  reg count_o_3_sv2v_reg,count_o_2_sv2v_reg,count_o_1_sv2v_reg,count_o_0_sv2v_reg;
  assign count_o[3] = count_o_3_sv2v_reg;
  assign count_o[2] = count_o_2_sv2v_reg;
  assign count_o[1] = count_o_1_sv2v_reg;
  assign count_o[0] = count_o_0_sv2v_reg;
  assign N10 = reset_i | clear_i;
  assign { N8, N7, N6, N5 } = count_o + up_i;
  assign N9 = (N0)? up_i : 
              (N1)? N5 : 1'b0;
  assign N0 = clear_i;
  assign N1 = N4;
  assign N2 = ~reset_i;
  assign N3 = N2;
  assign N4 = ~clear_i;

  always @(posedge clk_i) begin
    if(N10) begin
      count_o_3_sv2v_reg <= 1'b0;
      count_o_2_sv2v_reg <= 1'b0;
      count_o_1_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      count_o_3_sv2v_reg <= N8;
      count_o_2_sv2v_reg <= N7;
      count_o_1_sv2v_reg <= N6;
    end 
    if(reset_i) begin
      count_o_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      count_o_0_sv2v_reg <= N9;
    end 
  end


endmodule



module bsg_launch_sync_sync_async_reset_posedge_5_unit
(
  iclk_i,
  iclk_reset_i,
  oclk_i,
  iclk_data_i,
  iclk_data_o,
  oclk_data_o
);

  input [4:0] iclk_data_i;
  output [4:0] iclk_data_o;
  output [4:0] oclk_data_o;
  input iclk_i;
  input iclk_reset_i;
  input oclk_i;
  wire [4:0] iclk_data_o,oclk_data_o,bsg_SYNC_1_r;
  reg iclk_data_o_4_sv2v_reg,iclk_data_o_3_sv2v_reg,iclk_data_o_2_sv2v_reg,
  iclk_data_o_1_sv2v_reg,iclk_data_o_0_sv2v_reg,bsg_SYNC_1_r_4_sv2v_reg,
  bsg_SYNC_1_r_3_sv2v_reg,bsg_SYNC_1_r_2_sv2v_reg,bsg_SYNC_1_r_1_sv2v_reg,bsg_SYNC_1_r_0_sv2v_reg,
  oclk_data_o_4_sv2v_reg,oclk_data_o_3_sv2v_reg,oclk_data_o_2_sv2v_reg,
  oclk_data_o_1_sv2v_reg,oclk_data_o_0_sv2v_reg;
  assign iclk_data_o[4] = iclk_data_o_4_sv2v_reg;
  assign iclk_data_o[3] = iclk_data_o_3_sv2v_reg;
  assign iclk_data_o[2] = iclk_data_o_2_sv2v_reg;
  assign iclk_data_o[1] = iclk_data_o_1_sv2v_reg;
  assign iclk_data_o[0] = iclk_data_o_0_sv2v_reg;
  assign bsg_SYNC_1_r[4] = bsg_SYNC_1_r_4_sv2v_reg;
  assign bsg_SYNC_1_r[3] = bsg_SYNC_1_r_3_sv2v_reg;
  assign bsg_SYNC_1_r[2] = bsg_SYNC_1_r_2_sv2v_reg;
  assign bsg_SYNC_1_r[1] = bsg_SYNC_1_r_1_sv2v_reg;
  assign bsg_SYNC_1_r[0] = bsg_SYNC_1_r_0_sv2v_reg;
  assign oclk_data_o[4] = oclk_data_o_4_sv2v_reg;
  assign oclk_data_o[3] = oclk_data_o_3_sv2v_reg;
  assign oclk_data_o[2] = oclk_data_o_2_sv2v_reg;
  assign oclk_data_o[1] = oclk_data_o_1_sv2v_reg;
  assign oclk_data_o[0] = oclk_data_o_0_sv2v_reg;

  always @(posedge iclk_i or posedge iclk_reset_i) begin
    if(iclk_reset_i) begin
      iclk_data_o_4_sv2v_reg <= 1'b0;
      iclk_data_o_3_sv2v_reg <= 1'b0;
      iclk_data_o_2_sv2v_reg <= 1'b0;
      iclk_data_o_1_sv2v_reg <= 1'b0;
      iclk_data_o_0_sv2v_reg <= 1'b0;
    end else begin
      iclk_data_o_4_sv2v_reg <= iclk_data_i[4];
      iclk_data_o_3_sv2v_reg <= iclk_data_i[3];
      iclk_data_o_2_sv2v_reg <= iclk_data_i[2];
      iclk_data_o_1_sv2v_reg <= iclk_data_i[1];
      iclk_data_o_0_sv2v_reg <= iclk_data_i[0];
    end
  end


  always @(posedge oclk_i or posedge iclk_reset_i) begin
    if(iclk_reset_i) begin
      bsg_SYNC_1_r_4_sv2v_reg <= 1'b0;
      bsg_SYNC_1_r_3_sv2v_reg <= 1'b0;
      bsg_SYNC_1_r_2_sv2v_reg <= 1'b0;
      bsg_SYNC_1_r_1_sv2v_reg <= 1'b0;
      bsg_SYNC_1_r_0_sv2v_reg <= 1'b0;
      oclk_data_o_4_sv2v_reg <= 1'b0;
      oclk_data_o_3_sv2v_reg <= 1'b0;
      oclk_data_o_2_sv2v_reg <= 1'b0;
      oclk_data_o_1_sv2v_reg <= 1'b0;
      oclk_data_o_0_sv2v_reg <= 1'b0;
    end else begin
      bsg_SYNC_1_r_4_sv2v_reg <= iclk_data_o[4];
      bsg_SYNC_1_r_3_sv2v_reg <= iclk_data_o[3];
      bsg_SYNC_1_r_2_sv2v_reg <= iclk_data_o[2];
      bsg_SYNC_1_r_1_sv2v_reg <= iclk_data_o[1];
      bsg_SYNC_1_r_0_sv2v_reg <= iclk_data_o[0];
      oclk_data_o_4_sv2v_reg <= bsg_SYNC_1_r[4];
      oclk_data_o_3_sv2v_reg <= bsg_SYNC_1_r[3];
      oclk_data_o_2_sv2v_reg <= bsg_SYNC_1_r[2];
      oclk_data_o_1_sv2v_reg <= bsg_SYNC_1_r[1];
      oclk_data_o_0_sv2v_reg <= bsg_SYNC_1_r[0];
    end
  end


endmodule



module bsg_launch_sync_sync_5_0_1
(
  iclk_i,
  iclk_reset_i,
  oclk_i,
  iclk_data_i,
  iclk_data_o,
  oclk_data_o
);

  input [4:0] iclk_data_i;
  output [4:0] iclk_data_o;
  output [4:0] oclk_data_o;
  input iclk_i;
  input iclk_reset_i;
  input oclk_i;
  wire [4:0] iclk_data_o,oclk_data_o;

  bsg_launch_sync_sync_async_reset_posedge_5_unit
  async_p_z_blss 
  (
    .iclk_i(iclk_i),
    .iclk_reset_i(iclk_reset_i),
    .oclk_i(oclk_i),
    .iclk_data_i(iclk_data_i),
    .iclk_data_o(iclk_data_o),
    .oclk_data_o(oclk_data_o)
  );


endmodule



module bsg_async_ptr_gray_5_0_1
(
  w_clk_i,
  w_reset_i,
  w_inc_i,
  r_clk_i,
  w_ptr_binary_r_o,
  w_ptr_gray_r_o,
  w_ptr_gray_r_rsync_o
);

  output [4:0] w_ptr_binary_r_o;
  output [4:0] w_ptr_gray_r_o;
  output [4:0] w_ptr_gray_r_rsync_o;
  input w_clk_i;
  input w_reset_i;
  input w_inc_i;
  input r_clk_i;
  wire [4:0] w_ptr_binary_r_o,w_ptr_gray_r_o,w_ptr_gray_r_rsync_o,w_ptr_p1_r,w_ptr_p2,
  w_ptr_gray_n;
  wire N0,N1,N2,N3,N4,N5,N6;
  reg w_ptr_p1_r_4_sv2v_reg,w_ptr_p1_r_3_sv2v_reg,w_ptr_p1_r_2_sv2v_reg,
  w_ptr_p1_r_1_sv2v_reg,w_ptr_p1_r_0_sv2v_reg,w_ptr_binary_r_o_4_sv2v_reg,
  w_ptr_binary_r_o_3_sv2v_reg,w_ptr_binary_r_o_2_sv2v_reg,w_ptr_binary_r_o_1_sv2v_reg,
  w_ptr_binary_r_o_0_sv2v_reg;
  assign w_ptr_p1_r[4] = w_ptr_p1_r_4_sv2v_reg;
  assign w_ptr_p1_r[3] = w_ptr_p1_r_3_sv2v_reg;
  assign w_ptr_p1_r[2] = w_ptr_p1_r_2_sv2v_reg;
  assign w_ptr_p1_r[1] = w_ptr_p1_r_1_sv2v_reg;
  assign w_ptr_p1_r[0] = w_ptr_p1_r_0_sv2v_reg;
  assign w_ptr_binary_r_o[4] = w_ptr_binary_r_o_4_sv2v_reg;
  assign w_ptr_binary_r_o[3] = w_ptr_binary_r_o_3_sv2v_reg;
  assign w_ptr_binary_r_o[2] = w_ptr_binary_r_o_2_sv2v_reg;
  assign w_ptr_binary_r_o[1] = w_ptr_binary_r_o_1_sv2v_reg;
  assign w_ptr_binary_r_o[0] = w_ptr_binary_r_o_0_sv2v_reg;

  bsg_launch_sync_sync_5_0_1
  ptr_sync
  (
    .iclk_i(w_clk_i),
    .iclk_reset_i(w_reset_i),
    .oclk_i(r_clk_i),
    .iclk_data_i(w_ptr_gray_n),
    .iclk_data_o(w_ptr_gray_r_o),
    .oclk_data_o(w_ptr_gray_r_rsync_o)
  );

  assign w_ptr_p2 = w_ptr_p1_r + 1'b1;
  assign w_ptr_gray_n = (N0)? { w_ptr_p1_r[4:4], N3, N4, N5, N6 } : 
                        (N1)? w_ptr_gray_r_o : 1'b0;
  assign N0 = w_inc_i;
  assign N1 = N2;
  assign N2 = ~w_inc_i;
  assign N3 = w_ptr_p1_r[4] ^ w_ptr_p1_r[3];
  assign N4 = w_ptr_p1_r[3] ^ w_ptr_p1_r[2];
  assign N5 = w_ptr_p1_r[2] ^ w_ptr_p1_r[1];
  assign N6 = w_ptr_p1_r[1] ^ w_ptr_p1_r[0];

  always @(posedge w_clk_i or posedge w_reset_i) begin
    if(w_reset_i) begin
      w_ptr_p1_r_4_sv2v_reg <= 1'b0;
      w_ptr_p1_r_3_sv2v_reg <= 1'b0;
      w_ptr_p1_r_2_sv2v_reg <= 1'b0;
      w_ptr_p1_r_1_sv2v_reg <= 1'b0;
      w_ptr_p1_r_0_sv2v_reg <= 1'b1;
      w_ptr_binary_r_o_4_sv2v_reg <= 1'b0;
      w_ptr_binary_r_o_3_sv2v_reg <= 1'b0;
      w_ptr_binary_r_o_2_sv2v_reg <= 1'b0;
      w_ptr_binary_r_o_1_sv2v_reg <= 1'b0;
      w_ptr_binary_r_o_0_sv2v_reg <= 1'b0;
    end else if(w_inc_i) begin
      w_ptr_p1_r_4_sv2v_reg <= w_ptr_p2[4];
      w_ptr_p1_r_3_sv2v_reg <= w_ptr_p2[3];
      w_ptr_p1_r_2_sv2v_reg <= w_ptr_p2[2];
      w_ptr_p1_r_1_sv2v_reg <= w_ptr_p2[1];
      w_ptr_p1_r_0_sv2v_reg <= w_ptr_p2[0];
      w_ptr_binary_r_o_4_sv2v_reg <= w_ptr_p1_r[4];
      w_ptr_binary_r_o_3_sv2v_reg <= w_ptr_p1_r[3];
      w_ptr_binary_r_o_2_sv2v_reg <= w_ptr_p1_r[2];
      w_ptr_binary_r_o_1_sv2v_reg <= w_ptr_p1_r[1];
      w_ptr_binary_r_o_0_sv2v_reg <= w_ptr_p1_r[0];
    end 
  end


endmodule



module bsg_scan_width_p5_xor_p1
(
  i,
  o
);

  input [4:0] i;
  output [4:0] o;
  wire [4:0] o;
  wire t_2__4_,t_2__3_,t_2__2_,t_2__1_,t_2__0_,t_1__4_,t_1__3_,t_1__2_,t_1__1_,t_1__0_;
  assign t_1__4_ = i[4] ^ 1'b0;
  assign t_1__3_ = i[3] ^ i[4];
  assign t_1__2_ = i[2] ^ i[3];
  assign t_1__1_ = i[1] ^ i[2];
  assign t_1__0_ = i[0] ^ i[1];
  assign t_2__4_ = t_1__4_ ^ 1'b0;
  assign t_2__3_ = t_1__3_ ^ 1'b0;
  assign t_2__2_ = t_1__2_ ^ t_1__4_;
  assign t_2__1_ = t_1__1_ ^ t_1__3_;
  assign t_2__0_ = t_1__0_ ^ t_1__2_;
  assign o[4] = t_2__4_ ^ 1'b0;
  assign o[3] = t_2__3_ ^ 1'b0;
  assign o[2] = t_2__2_ ^ 1'b0;
  assign o[1] = t_2__1_ ^ 1'b0;
  assign o[0] = t_2__0_ ^ t_2__4_;

endmodule



module bsg_gray_to_binary_width_p5
(
  gray_i,
  binary_o
);

  input [4:0] gray_i;
  output [4:0] binary_o;
  wire [4:0] binary_o;

  bsg_scan_width_p5_xor_p1
  scan_xor
  (
    .i(gray_i),
    .o(binary_o)
  );


endmodule



module bsg_async_credit_counter_4_3_0_2_1_1
(
  w_clk_i,
  w_inc_token_i,
  w_reset_i,
  r_clk_i,
  r_reset_i,
  r_dec_credit_i,
  r_infinite_credits_i,
  r_credits_avail_o
);

  input w_clk_i;
  input w_inc_token_i;
  input w_reset_i;
  input r_clk_i;
  input r_reset_i;
  input r_dec_credit_i;
  input r_infinite_credits_i;
  output r_credits_avail_o;
  wire r_credits_avail_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,r_counter_r_lo_bits_nonzero,N9,N10,
  N11,sv2v_dc_1,sv2v_dc_2,sv2v_dc_3,sv2v_dc_4,sv2v_dc_5;
  wire [7:0] r_counter_r;
  wire [4:0] w_counter_gray_r,w_counter_gray_r_rsync,w_counter_binary_r_rsync;
  wire [3:0] r_counter_r_hi_bits_gray;
  reg r_counter_r_7_sv2v_reg,r_counter_r_6_sv2v_reg,r_counter_r_5_sv2v_reg,
  r_counter_r_4_sv2v_reg,r_counter_r_3_sv2v_reg,r_counter_r_2_sv2v_reg,
  r_counter_r_1_sv2v_reg,r_counter_r_0_sv2v_reg;
  assign r_counter_r[7] = r_counter_r_7_sv2v_reg;
  assign r_counter_r[6] = r_counter_r_6_sv2v_reg;
  assign r_counter_r[5] = r_counter_r_5_sv2v_reg;
  assign r_counter_r[4] = r_counter_r_4_sv2v_reg;
  assign r_counter_r[3] = r_counter_r_3_sv2v_reg;
  assign r_counter_r[2] = r_counter_r_2_sv2v_reg;
  assign r_counter_r[1] = r_counter_r_1_sv2v_reg;
  assign r_counter_r[0] = r_counter_r_0_sv2v_reg;

  bsg_async_ptr_gray_5_0_1
  bapg
  (
    .w_clk_i(w_clk_i),
    .w_reset_i(w_reset_i),
    .w_inc_i(w_inc_token_i),
    .r_clk_i(r_clk_i),
    .w_ptr_binary_r_o({ sv2v_dc_1, sv2v_dc_2, sv2v_dc_3, sv2v_dc_4, sv2v_dc_5 }),
    .w_ptr_gray_r_o(w_counter_gray_r),
    .w_ptr_gray_r_rsync_o(w_counter_gray_r_rsync)
  );

  assign N9 = { r_counter_r[7:7], r_counter_r_hi_bits_gray } != w_counter_gray_r_rsync;

  bsg_gray_to_binary_width_p5
  bsg_g2b
  (
    .gray_i(w_counter_gray_r_rsync),
    .binary_o(w_counter_binary_r_rsync)
  );

  assign { N8, N7, N6, N5, N4, N3, N2, N1 } = r_counter_r + r_dec_credit_i;
  assign N0 = ~r_reset_i;
  assign r_counter_r_lo_bits_nonzero = N10 | r_counter_r[0];
  assign N10 = r_counter_r[2] | r_counter_r[1];
  assign r_counter_r_hi_bits_gray[3] = r_counter_r[7] ^ r_counter_r[6];
  assign r_counter_r_hi_bits_gray[2] = r_counter_r[6] ^ r_counter_r[5];
  assign r_counter_r_hi_bits_gray[1] = r_counter_r[5] ^ r_counter_r[4];
  assign r_counter_r_hi_bits_gray[0] = r_counter_r[4] ^ r_counter_r[3];
  assign r_credits_avail_o = N11 | N9;
  assign N11 = r_infinite_credits_i | r_counter_r_lo_bits_nonzero;

  always @(posedge r_clk_i) begin
    if(r_reset_i) begin
      r_counter_r_7_sv2v_reg <= 1'b1;
      r_counter_r_6_sv2v_reg <= 1'b1;
      r_counter_r_5_sv2v_reg <= 1'b1;
      r_counter_r_4_sv2v_reg <= 1'b0;
      r_counter_r_3_sv2v_reg <= 1'b0;
      r_counter_r_2_sv2v_reg <= 1'b0;
      r_counter_r_1_sv2v_reg <= 1'b0;
      r_counter_r_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      r_counter_r_7_sv2v_reg <= N8;
      r_counter_r_6_sv2v_reg <= N7;
      r_counter_r_5_sv2v_reg <= N6;
      r_counter_r_4_sv2v_reg <= N5;
      r_counter_r_3_sv2v_reg <= N4;
      r_counter_r_2_sv2v_reg <= N3;
      r_counter_r_1_sv2v_reg <= N2;
      r_counter_r_0_sv2v_reg <= N1;
    end 
  end


endmodule



module bsg_launch_sync_sync_async_reset_negedge_5_unit
(
  iclk_i,
  iclk_reset_i,
  oclk_i,
  iclk_data_i,
  iclk_data_o,
  oclk_data_o
);

  input [4:0] iclk_data_i;
  output [4:0] iclk_data_o;
  output [4:0] oclk_data_o;
  input iclk_i;
  input iclk_reset_i;
  input oclk_i;
  wire [4:0] iclk_data_o,oclk_data_o,bsg_SYNC_1_r;
  wire N0;
  reg iclk_data_o_4_sv2v_reg,iclk_data_o_3_sv2v_reg,iclk_data_o_2_sv2v_reg,
  iclk_data_o_1_sv2v_reg,iclk_data_o_0_sv2v_reg,bsg_SYNC_1_r_4_sv2v_reg,
  bsg_SYNC_1_r_3_sv2v_reg,bsg_SYNC_1_r_2_sv2v_reg,bsg_SYNC_1_r_1_sv2v_reg,bsg_SYNC_1_r_0_sv2v_reg,
  oclk_data_o_4_sv2v_reg,oclk_data_o_3_sv2v_reg,oclk_data_o_2_sv2v_reg,
  oclk_data_o_1_sv2v_reg,oclk_data_o_0_sv2v_reg;
  assign iclk_data_o[4] = iclk_data_o_4_sv2v_reg;
  assign iclk_data_o[3] = iclk_data_o_3_sv2v_reg;
  assign iclk_data_o[2] = iclk_data_o_2_sv2v_reg;
  assign iclk_data_o[1] = iclk_data_o_1_sv2v_reg;
  assign iclk_data_o[0] = iclk_data_o_0_sv2v_reg;
  assign bsg_SYNC_1_r[4] = bsg_SYNC_1_r_4_sv2v_reg;
  assign bsg_SYNC_1_r[3] = bsg_SYNC_1_r_3_sv2v_reg;
  assign bsg_SYNC_1_r[2] = bsg_SYNC_1_r_2_sv2v_reg;
  assign bsg_SYNC_1_r[1] = bsg_SYNC_1_r_1_sv2v_reg;
  assign bsg_SYNC_1_r[0] = bsg_SYNC_1_r_0_sv2v_reg;
  assign oclk_data_o[4] = oclk_data_o_4_sv2v_reg;
  assign oclk_data_o[3] = oclk_data_o_3_sv2v_reg;
  assign oclk_data_o[2] = oclk_data_o_2_sv2v_reg;
  assign oclk_data_o[1] = oclk_data_o_1_sv2v_reg;
  assign oclk_data_o[0] = oclk_data_o_0_sv2v_reg;
  assign N0 = ~iclk_i;

  always @(posedge N0 or posedge iclk_reset_i) begin
    if(iclk_reset_i) begin
      iclk_data_o_4_sv2v_reg <= 1'b0;
      iclk_data_o_3_sv2v_reg <= 1'b0;
      iclk_data_o_2_sv2v_reg <= 1'b0;
      iclk_data_o_1_sv2v_reg <= 1'b0;
      iclk_data_o_0_sv2v_reg <= 1'b0;
    end else begin
      iclk_data_o_4_sv2v_reg <= iclk_data_i[4];
      iclk_data_o_3_sv2v_reg <= iclk_data_i[3];
      iclk_data_o_2_sv2v_reg <= iclk_data_i[2];
      iclk_data_o_1_sv2v_reg <= iclk_data_i[1];
      iclk_data_o_0_sv2v_reg <= iclk_data_i[0];
    end
  end


  always @(posedge oclk_i or posedge iclk_reset_i) begin
    if(iclk_reset_i) begin
      bsg_SYNC_1_r_4_sv2v_reg <= 1'b0;
      bsg_SYNC_1_r_3_sv2v_reg <= 1'b0;
      bsg_SYNC_1_r_2_sv2v_reg <= 1'b0;
      bsg_SYNC_1_r_1_sv2v_reg <= 1'b0;
      bsg_SYNC_1_r_0_sv2v_reg <= 1'b0;
      oclk_data_o_4_sv2v_reg <= 1'b0;
      oclk_data_o_3_sv2v_reg <= 1'b0;
      oclk_data_o_2_sv2v_reg <= 1'b0;
      oclk_data_o_1_sv2v_reg <= 1'b0;
      oclk_data_o_0_sv2v_reg <= 1'b0;
    end else begin
      bsg_SYNC_1_r_4_sv2v_reg <= iclk_data_o[4];
      bsg_SYNC_1_r_3_sv2v_reg <= iclk_data_o[3];
      bsg_SYNC_1_r_2_sv2v_reg <= iclk_data_o[2];
      bsg_SYNC_1_r_1_sv2v_reg <= iclk_data_o[1];
      bsg_SYNC_1_r_0_sv2v_reg <= iclk_data_o[0];
      oclk_data_o_4_sv2v_reg <= bsg_SYNC_1_r[4];
      oclk_data_o_3_sv2v_reg <= bsg_SYNC_1_r[3];
      oclk_data_o_2_sv2v_reg <= bsg_SYNC_1_r[2];
      oclk_data_o_1_sv2v_reg <= bsg_SYNC_1_r[1];
      oclk_data_o_0_sv2v_reg <= bsg_SYNC_1_r[0];
    end
  end


endmodule



module bsg_launch_sync_sync_5_1_1
(
  iclk_i,
  iclk_reset_i,
  oclk_i,
  iclk_data_i,
  iclk_data_o,
  oclk_data_o
);

  input [4:0] iclk_data_i;
  output [4:0] iclk_data_o;
  output [4:0] oclk_data_o;
  input iclk_i;
  input iclk_reset_i;
  input oclk_i;
  wire [4:0] iclk_data_o,oclk_data_o;

  bsg_launch_sync_sync_async_reset_negedge_5_unit
  async_n_z_blss 
  (
    .iclk_i(iclk_i),
    .iclk_reset_i(iclk_reset_i),
    .oclk_i(oclk_i),
    .iclk_data_i(iclk_data_i),
    .iclk_data_o(iclk_data_o),
    .oclk_data_o(oclk_data_o)
  );


endmodule



module bsg_async_ptr_gray_5_1_1
(
  w_clk_i,
  w_reset_i,
  w_inc_i,
  r_clk_i,
  w_ptr_binary_r_o,
  w_ptr_gray_r_o,
  w_ptr_gray_r_rsync_o
);

  output [4:0] w_ptr_binary_r_o;
  output [4:0] w_ptr_gray_r_o;
  output [4:0] w_ptr_gray_r_rsync_o;
  input w_clk_i;
  input w_reset_i;
  input w_inc_i;
  input r_clk_i;
  wire [4:0] w_ptr_binary_r_o,w_ptr_gray_r_o,w_ptr_gray_r_rsync_o,w_ptr_p1_r,w_ptr_p2,
  w_ptr_gray_n;
  wire N0,N1,N2,N3,N4,N5,N6,N7;
  reg w_ptr_p1_r_4_sv2v_reg,w_ptr_p1_r_3_sv2v_reg,w_ptr_p1_r_2_sv2v_reg,
  w_ptr_p1_r_1_sv2v_reg,w_ptr_p1_r_0_sv2v_reg,w_ptr_binary_r_o_4_sv2v_reg,
  w_ptr_binary_r_o_3_sv2v_reg,w_ptr_binary_r_o_2_sv2v_reg,w_ptr_binary_r_o_1_sv2v_reg,
  w_ptr_binary_r_o_0_sv2v_reg;
  assign w_ptr_p1_r[4] = w_ptr_p1_r_4_sv2v_reg;
  assign w_ptr_p1_r[3] = w_ptr_p1_r_3_sv2v_reg;
  assign w_ptr_p1_r[2] = w_ptr_p1_r_2_sv2v_reg;
  assign w_ptr_p1_r[1] = w_ptr_p1_r_1_sv2v_reg;
  assign w_ptr_p1_r[0] = w_ptr_p1_r_0_sv2v_reg;
  assign w_ptr_binary_r_o[4] = w_ptr_binary_r_o_4_sv2v_reg;
  assign w_ptr_binary_r_o[3] = w_ptr_binary_r_o_3_sv2v_reg;
  assign w_ptr_binary_r_o[2] = w_ptr_binary_r_o_2_sv2v_reg;
  assign w_ptr_binary_r_o[1] = w_ptr_binary_r_o_1_sv2v_reg;
  assign w_ptr_binary_r_o[0] = w_ptr_binary_r_o_0_sv2v_reg;

  bsg_launch_sync_sync_5_1_1
  ptr_sync
  (
    .iclk_i(w_clk_i),
    .iclk_reset_i(w_reset_i),
    .oclk_i(r_clk_i),
    .iclk_data_i(w_ptr_gray_n),
    .iclk_data_o(w_ptr_gray_r_o),
    .oclk_data_o(w_ptr_gray_r_rsync_o)
  );

  assign w_ptr_p2 = w_ptr_p1_r + 1'b1;
  assign w_ptr_gray_n = (N0)? { w_ptr_p1_r[4:4], N3, N4, N5, N6 } : 
                        (N1)? w_ptr_gray_r_o : 1'b0;
  assign N0 = w_inc_i;
  assign N1 = N2;
  assign N2 = ~w_inc_i;
  assign N3 = w_ptr_p1_r[4] ^ w_ptr_p1_r[3];
  assign N4 = w_ptr_p1_r[3] ^ w_ptr_p1_r[2];
  assign N5 = w_ptr_p1_r[2] ^ w_ptr_p1_r[1];
  assign N6 = w_ptr_p1_r[1] ^ w_ptr_p1_r[0];
  assign N7 = ~w_clk_i;

  always @(posedge N7 or posedge w_reset_i) begin
    if(w_reset_i) begin
      w_ptr_p1_r_4_sv2v_reg <= 1'b0;
      w_ptr_p1_r_3_sv2v_reg <= 1'b0;
      w_ptr_p1_r_2_sv2v_reg <= 1'b0;
      w_ptr_p1_r_1_sv2v_reg <= 1'b0;
      w_ptr_p1_r_0_sv2v_reg <= 1'b1;
      w_ptr_binary_r_o_4_sv2v_reg <= 1'b0;
      w_ptr_binary_r_o_3_sv2v_reg <= 1'b0;
      w_ptr_binary_r_o_2_sv2v_reg <= 1'b0;
      w_ptr_binary_r_o_1_sv2v_reg <= 1'b0;
      w_ptr_binary_r_o_0_sv2v_reg <= 1'b0;
    end else if(w_inc_i) begin
      w_ptr_p1_r_4_sv2v_reg <= w_ptr_p2[4];
      w_ptr_p1_r_3_sv2v_reg <= w_ptr_p2[3];
      w_ptr_p1_r_2_sv2v_reg <= w_ptr_p2[2];
      w_ptr_p1_r_1_sv2v_reg <= w_ptr_p2[1];
      w_ptr_p1_r_0_sv2v_reg <= w_ptr_p2[0];
      w_ptr_binary_r_o_4_sv2v_reg <= w_ptr_p1_r[4];
      w_ptr_binary_r_o_3_sv2v_reg <= w_ptr_p1_r[3];
      w_ptr_binary_r_o_2_sv2v_reg <= w_ptr_p1_r[2];
      w_ptr_binary_r_o_1_sv2v_reg <= w_ptr_p1_r[1];
      w_ptr_binary_r_o_0_sv2v_reg <= w_ptr_p1_r[0];
    end 
  end


endmodule



module bsg_async_credit_counter_4_3_1_2_1_1
(
  w_clk_i,
  w_inc_token_i,
  w_reset_i,
  r_clk_i,
  r_reset_i,
  r_dec_credit_i,
  r_infinite_credits_i,
  r_credits_avail_o
);

  input w_clk_i;
  input w_inc_token_i;
  input w_reset_i;
  input r_clk_i;
  input r_reset_i;
  input r_dec_credit_i;
  input r_infinite_credits_i;
  output r_credits_avail_o;
  wire r_credits_avail_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,r_counter_r_lo_bits_nonzero,N9,N10,
  N11,sv2v_dc_1,sv2v_dc_2,sv2v_dc_3,sv2v_dc_4,sv2v_dc_5;
  wire [7:0] r_counter_r;
  wire [4:0] w_counter_gray_r,w_counter_gray_r_rsync,w_counter_binary_r_rsync;
  wire [3:0] r_counter_r_hi_bits_gray;
  reg r_counter_r_7_sv2v_reg,r_counter_r_6_sv2v_reg,r_counter_r_5_sv2v_reg,
  r_counter_r_4_sv2v_reg,r_counter_r_3_sv2v_reg,r_counter_r_2_sv2v_reg,
  r_counter_r_1_sv2v_reg,r_counter_r_0_sv2v_reg;
  assign r_counter_r[7] = r_counter_r_7_sv2v_reg;
  assign r_counter_r[6] = r_counter_r_6_sv2v_reg;
  assign r_counter_r[5] = r_counter_r_5_sv2v_reg;
  assign r_counter_r[4] = r_counter_r_4_sv2v_reg;
  assign r_counter_r[3] = r_counter_r_3_sv2v_reg;
  assign r_counter_r[2] = r_counter_r_2_sv2v_reg;
  assign r_counter_r[1] = r_counter_r_1_sv2v_reg;
  assign r_counter_r[0] = r_counter_r_0_sv2v_reg;

  bsg_async_ptr_gray_5_1_1
  bapg
  (
    .w_clk_i(w_clk_i),
    .w_reset_i(w_reset_i),
    .w_inc_i(w_inc_token_i),
    .r_clk_i(r_clk_i),
    .w_ptr_binary_r_o({ sv2v_dc_1, sv2v_dc_2, sv2v_dc_3, sv2v_dc_4, sv2v_dc_5 }),
    .w_ptr_gray_r_o(w_counter_gray_r),
    .w_ptr_gray_r_rsync_o(w_counter_gray_r_rsync)
  );

  assign N9 = { r_counter_r[7:7], r_counter_r_hi_bits_gray } != w_counter_gray_r_rsync;

  bsg_gray_to_binary_width_p5
  bsg_g2b
  (
    .gray_i(w_counter_gray_r_rsync),
    .binary_o(w_counter_binary_r_rsync)
  );

  assign { N8, N7, N6, N5, N4, N3, N2, N1 } = r_counter_r + r_dec_credit_i;
  assign N0 = ~r_reset_i;
  assign r_counter_r_lo_bits_nonzero = N10 | r_counter_r[0];
  assign N10 = r_counter_r[2] | r_counter_r[1];
  assign r_counter_r_hi_bits_gray[3] = r_counter_r[7] ^ r_counter_r[6];
  assign r_counter_r_hi_bits_gray[2] = r_counter_r[6] ^ r_counter_r[5];
  assign r_counter_r_hi_bits_gray[1] = r_counter_r[5] ^ r_counter_r[4];
  assign r_counter_r_hi_bits_gray[0] = r_counter_r[4] ^ r_counter_r[3];
  assign r_credits_avail_o = N11 | N9;
  assign N11 = r_infinite_credits_i | r_counter_r_lo_bits_nonzero;

  always @(posedge r_clk_i) begin
    if(r_reset_i) begin
      r_counter_r_7_sv2v_reg <= 1'b1;
      r_counter_r_6_sv2v_reg <= 1'b1;
      r_counter_r_5_sv2v_reg <= 1'b1;
      r_counter_r_4_sv2v_reg <= 1'b0;
      r_counter_r_3_sv2v_reg <= 1'b0;
      r_counter_r_2_sv2v_reg <= 1'b0;
      r_counter_r_1_sv2v_reg <= 1'b0;
      r_counter_r_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      r_counter_r_7_sv2v_reg <= N8;
      r_counter_r_6_sv2v_reg <= N7;
      r_counter_r_5_sv2v_reg <= N6;
      r_counter_r_4_sv2v_reg <= N5;
      r_counter_r_3_sv2v_reg <= N4;
      r_counter_r_2_sv2v_reg <= N3;
      r_counter_r_1_sv2v_reg <= N2;
      r_counter_r_0_sv2v_reg <= N1;
    end 
  end


endmodule



module bsg_link_source_sync_upstream_channel_width_p16_lg_fifo_depth_p6_lg_credit_to_token_decimation_p3
(
  core_clk_i,
  core_link_reset_i,
  io_clk_i,
  io_link_reset_i,
  async_token_reset_i,
  core_data_i,
  core_valid_i,
  core_ready_o,
  io_data_o,
  io_valid_o,
  io_ready_i,
  token_clk_i
);

  input [15:0] core_data_i;
  output [15:0] io_data_o;
  input core_clk_i;
  input core_link_reset_i;
  input io_clk_i;
  input io_link_reset_i;
  input async_token_reset_i;
  input core_valid_i;
  input io_ready_i;
  input token_clk_i;
  output core_ready_o;
  output io_valid_o;
  wire [15:0] io_data_o,core_fifo_data,io_async_fifo_data;
  wire core_ready_o,io_valid_o,N0,N1,N2,N3,N4,N5,core_fifo_valid,core_fifo_yumi,
  core_async_fifo_full,io_async_fifo_yumi,io_async_fifo_valid,N6,N7,io_valid_n,N8,N9,N10,
  N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,N21,N22,N23,N24,N25,io_credit_avail,
  io_negedge_credits_avail,io_posedge_credits_avail,io_negedge_credits_deque,
  io_posedge_credits_deque,N26;
  wire [3:0] io_token_alternator_r;

  bsg_two_fifo_width_p16
  core_fifo
  (
    .clk_i(core_clk_i),
    .reset_i(core_link_reset_i),
    .ready_o(core_ready_o),
    .data_i(core_data_i),
    .v_i(core_valid_i),
    .v_o(core_fifo_valid),
    .data_o(core_fifo_data),
    .yumi_i(core_fifo_yumi)
  );


  bsg_async_fifo_lg_size_p3_width_p16
  async_fifo
  (
    .w_clk_i(core_clk_i),
    .w_reset_i(core_link_reset_i),
    .w_enq_i(core_fifo_yumi),
    .w_data_i(core_fifo_data),
    .w_full_o(core_async_fifo_full),
    .r_clk_i(io_clk_i),
    .r_reset_i(io_link_reset_i),
    .r_deq_i(io_async_fifo_yumi),
    .r_data_o(io_async_fifo_data),
    .r_valid_o(io_async_fifo_valid)
  );


  bsg_counter_clear_up_f_0_1
  token_alt
  (
    .clk_i(io_clk_i),
    .reset_i(io_link_reset_i),
    .clear_i(1'b0),
    .up_i(io_async_fifo_yumi),
    .count_o(io_token_alternator_r)
  );


  bsg_async_credit_counter_4_3_0_2_1_1
  pos_credit_ctr
  (
    .w_clk_i(token_clk_i),
    .w_inc_token_i(1'b1),
    .w_reset_i(async_token_reset_i),
    .r_clk_i(io_clk_i),
    .r_reset_i(io_link_reset_i),
    .r_dec_credit_i(io_posedge_credits_deque),
    .r_infinite_credits_i(1'b0),
    .r_credits_avail_o(io_posedge_credits_avail)
  );


  bsg_async_credit_counter_4_3_1_2_1_1
  neg_credit_ctr
  (
    .w_clk_i(token_clk_i),
    .w_inc_token_i(1'b1),
    .w_reset_i(async_token_reset_i),
    .r_clk_i(io_clk_i),
    .r_reset_i(io_link_reset_i),
    .r_dec_credit_i(io_negedge_credits_deque),
    .r_infinite_credits_i(1'b0),
    .r_credits_avail_o(io_negedge_credits_avail)
  );

  assign { N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N9 } = (N0)? io_async_fifo_data : 
                                                                                             (N1)? { 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0 } : 1'b0;
  assign N0 = io_valid_n;
  assign N1 = N8;
  assign io_valid_o = (N2)? 1'b0 : 
                      (N3)? io_valid_n : 1'b0;
  assign N2 = N7;
  assign N3 = N6;
  assign io_data_o = (N2)? { 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0 } : 
                     (N3)? { N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N9 } : 1'b0;
  assign io_credit_avail = (N4)? io_negedge_credits_avail : 
                           (N5)? io_posedge_credits_avail : 1'b0;
  assign N4 = io_token_alternator_r[3];
  assign N5 = N25;
  assign core_fifo_yumi = core_fifo_valid & N26;
  assign N26 = ~core_async_fifo_full;
  assign N6 = ~io_link_reset_i;
  assign N7 = io_link_reset_i;
  assign N8 = ~io_valid_n;
  assign N25 = ~io_token_alternator_r[3];
  assign io_valid_n = io_credit_avail & io_async_fifo_valid;
  assign io_async_fifo_yumi = io_valid_n & io_ready_i;
  assign io_negedge_credits_deque = io_async_fifo_yumi & io_token_alternator_r[3];
  assign io_posedge_credits_deque = io_async_fifo_yumi & N25;

endmodule



module bsg_link_oddr_phy_width_p9
(
  reset_i,
  clk_i,
  data_i,
  ready_o,
  data_r_o,
  clk_r_o
);

  input [17:0] data_i;
  output [8:0] data_r_o;
  input reset_i;
  input clk_i;
  output ready_o;
  output clk_r_o;
  wire [8:0] data_r_o;
  wire ready_o,clk_r_o,N0,N1,N2,N3,odd_r,N4,reset_i_r,N5,N6,clk_r,N7,N8,N9,N10,N11,N12,
  N13,N14,N15,N16,N17;
  wire [17:0] data_i_r;
  reg data_i_r_17_sv2v_reg,data_i_r_16_sv2v_reg,data_i_r_15_sv2v_reg,
  data_i_r_14_sv2v_reg,data_i_r_13_sv2v_reg,data_i_r_12_sv2v_reg,data_i_r_11_sv2v_reg,
  data_i_r_10_sv2v_reg,data_i_r_9_sv2v_reg,data_i_r_8_sv2v_reg,data_i_r_7_sv2v_reg,
  data_i_r_6_sv2v_reg,data_i_r_5_sv2v_reg,data_i_r_4_sv2v_reg,data_i_r_3_sv2v_reg,
  data_i_r_2_sv2v_reg,data_i_r_1_sv2v_reg,data_i_r_0_sv2v_reg,odd_r_sv2v_reg,
  reset_i_r_sv2v_reg,clk_r_sv2v_reg,clk_r_o_sv2v_reg,data_r_o_8_sv2v_reg,data_r_o_7_sv2v_reg,
  data_r_o_6_sv2v_reg,data_r_o_5_sv2v_reg,data_r_o_4_sv2v_reg,data_r_o_3_sv2v_reg,
  data_r_o_2_sv2v_reg,data_r_o_1_sv2v_reg,data_r_o_0_sv2v_reg;
  assign data_i_r[17] = data_i_r_17_sv2v_reg;
  assign data_i_r[16] = data_i_r_16_sv2v_reg;
  assign data_i_r[15] = data_i_r_15_sv2v_reg;
  assign data_i_r[14] = data_i_r_14_sv2v_reg;
  assign data_i_r[13] = data_i_r_13_sv2v_reg;
  assign data_i_r[12] = data_i_r_12_sv2v_reg;
  assign data_i_r[11] = data_i_r_11_sv2v_reg;
  assign data_i_r[10] = data_i_r_10_sv2v_reg;
  assign data_i_r[9] = data_i_r_9_sv2v_reg;
  assign data_i_r[8] = data_i_r_8_sv2v_reg;
  assign data_i_r[7] = data_i_r_7_sv2v_reg;
  assign data_i_r[6] = data_i_r_6_sv2v_reg;
  assign data_i_r[5] = data_i_r_5_sv2v_reg;
  assign data_i_r[4] = data_i_r_4_sv2v_reg;
  assign data_i_r[3] = data_i_r_3_sv2v_reg;
  assign data_i_r[2] = data_i_r_2_sv2v_reg;
  assign data_i_r[1] = data_i_r_1_sv2v_reg;
  assign data_i_r[0] = data_i_r_0_sv2v_reg;
  assign odd_r = odd_r_sv2v_reg;
  assign reset_i_r = reset_i_r_sv2v_reg;
  assign clk_r = clk_r_sv2v_reg;
  assign clk_r_o = clk_r_o_sv2v_reg;
  assign data_r_o[8] = data_r_o_8_sv2v_reg;
  assign data_r_o[7] = data_r_o_7_sv2v_reg;
  assign data_r_o[6] = data_r_o_6_sv2v_reg;
  assign data_r_o[5] = data_r_o_5_sv2v_reg;
  assign data_r_o[4] = data_r_o_4_sv2v_reg;
  assign data_r_o[3] = data_r_o_3_sv2v_reg;
  assign data_r_o[2] = data_r_o_2_sv2v_reg;
  assign data_r_o[1] = data_r_o_1_sv2v_reg;
  assign data_r_o[0] = data_r_o_0_sv2v_reg;
  assign N8 = (N0)? 1'b0 : 
              (N1)? N7 : 1'b0;
  assign N0 = reset_i_r;
  assign N1 = N6;
  assign { N17, N16, N15, N14, N13, N12, N11, N10, N9 } = (N2)? data_i_r[8:0] : 
                                                          (N3)? data_i_r[17:9] : 1'b0;
  assign N2 = odd_r;
  assign N3 = N4;
  assign ready_o = ~odd_r;
  assign N4 = ~odd_r;
  assign N5 = ~clk_i;
  assign N6 = ~reset_i_r;
  assign N7 = ~clk_r;

  always @(posedge clk_i) begin
    if(N4) begin
      data_i_r_17_sv2v_reg <= data_i[17];
      data_i_r_16_sv2v_reg <= data_i[16];
      data_i_r_15_sv2v_reg <= data_i[15];
      data_i_r_14_sv2v_reg <= data_i[14];
      data_i_r_13_sv2v_reg <= data_i[13];
      data_i_r_12_sv2v_reg <= data_i[12];
      data_i_r_11_sv2v_reg <= data_i[11];
      data_i_r_10_sv2v_reg <= data_i[10];
      data_i_r_9_sv2v_reg <= data_i[9];
      data_i_r_8_sv2v_reg <= data_i[8];
      data_i_r_7_sv2v_reg <= data_i[7];
      data_i_r_6_sv2v_reg <= data_i[6];
      data_i_r_5_sv2v_reg <= data_i[5];
      data_i_r_4_sv2v_reg <= data_i[4];
      data_i_r_3_sv2v_reg <= data_i[3];
      data_i_r_2_sv2v_reg <= data_i[2];
      data_i_r_1_sv2v_reg <= data_i[1];
      data_i_r_0_sv2v_reg <= data_i[0];
    end 
    if(reset_i) begin
      odd_r_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      odd_r_sv2v_reg <= N4;
    end 
    if(1'b1) begin
      reset_i_r_sv2v_reg <= reset_i;
      data_r_o_8_sv2v_reg <= N17;
      data_r_o_7_sv2v_reg <= N16;
      data_r_o_6_sv2v_reg <= N15;
      data_r_o_5_sv2v_reg <= N14;
      data_r_o_4_sv2v_reg <= N13;
      data_r_o_3_sv2v_reg <= N12;
      data_r_o_2_sv2v_reg <= N11;
      data_r_o_1_sv2v_reg <= N10;
      data_r_o_0_sv2v_reg <= N9;
    end 
  end


  always @(posedge N5) begin
    if(1'b1) begin
      clk_r_sv2v_reg <= N8;
      clk_r_o_sv2v_reg <= clk_r;
    end 
  end


endmodule



module bsg_link_ddr_upstream
(
  core_clk_i,
  core_link_reset_i,
  core_data_i,
  core_valid_i,
  core_ready_o,
  io_clk_i,
  io_link_reset_i,
  async_token_reset_i,
  io_clk_r_o,
  io_data_r_o,
  io_valid_r_o,
  token_clk_i
);

  input [63:0] core_data_i;
  output [1:0] io_clk_r_o;
  output [15:0] io_data_r_o;
  output [1:0] io_valid_r_o;
  input [1:0] token_clk_i;
  input core_clk_i;
  input core_link_reset_i;
  input core_valid_i;
  input io_clk_i;
  input io_link_reset_i;
  input async_token_reset_i;
  output core_ready_o;
  wire [1:0] io_clk_r_o,io_valid_r_o,core_piso_ready_li;
  wire [15:0] io_data_r_o;
  wire core_ready_o,core_piso_valid_lo,core_piso_yumi_li,\ch_0_.io_oddr_valid_li ,
  \ch_0_.io_oddr_ready_lo ,\ch_1_.io_oddr_valid_li ,\ch_1_.io_oddr_ready_lo ,N0;
  wire [31:0] core_piso_data_lo;
  wire [15:8] \ch_0_.io_oddr_data_top ,\ch_1_.io_oddr_data_top ;
  wire [7:0] \ch_0_.io_oddr_data_bottom ,\ch_1_.io_oddr_data_bottom ;

  bsg_parallel_in_serial_out_width_p32_els_p2
  out_piso
  (
    .clk_i(core_clk_i),
    .reset_i(core_link_reset_i),
    .valid_i(core_valid_i),
    .data_i(core_data_i),
    .ready_and_o(core_ready_o),
    .valid_o(core_piso_valid_lo),
    .data_o(core_piso_data_lo),
    .yumi_i(core_piso_yumi_li)
  );


  bsg_link_source_sync_upstream_channel_width_p16_lg_fifo_depth_p6_lg_credit_to_token_decimation_p3
  ch_0_sso 
  (
    .core_clk_i(core_clk_i),
    .core_link_reset_i(core_link_reset_i),
    .io_clk_i(io_clk_i),
    .io_link_reset_i(io_link_reset_i),
    .async_token_reset_i(async_token_reset_i),
    .core_data_i(core_piso_data_lo[15:0]),
    .core_valid_i(core_piso_yumi_li),
    .core_ready_o(core_piso_ready_li[0]),
    .io_data_o({ \ch_0_.io_oddr_data_top , \ch_0_.io_oddr_data_bottom  }),
    .io_valid_o(\ch_0_.io_oddr_valid_li ),
    .io_ready_i(\ch_0_.io_oddr_ready_lo ),
    .token_clk_i(token_clk_i[0])
  );


  bsg_link_oddr_phy_width_p9
  ch_0_oddr_phy 
  (
    .reset_i(io_link_reset_i),
    .clk_i(io_clk_i),
    .data_i({ 1'b0, \ch_0_.io_oddr_data_top , \ch_0_.io_oddr_valid_li , \ch_0_.io_oddr_data_bottom  }),
    .ready_o(\ch_0_.io_oddr_ready_lo ),
    .data_r_o({ io_valid_r_o[0:0], io_data_r_o[7:0] }),
    .clk_r_o(io_clk_r_o[0])
  );


  bsg_link_source_sync_upstream_channel_width_p16_lg_fifo_depth_p6_lg_credit_to_token_decimation_p3
  ch_1_sso 
  (
    .core_clk_i(core_clk_i),
    .core_link_reset_i(core_link_reset_i),
    .io_clk_i(io_clk_i),
    .io_link_reset_i(io_link_reset_i),
    .async_token_reset_i(async_token_reset_i),
    .core_data_i(core_piso_data_lo[31:16]),
    .core_valid_i(core_piso_yumi_li),
    .core_ready_o(core_piso_ready_li[1]),
    .io_data_o({ \ch_1_.io_oddr_data_top , \ch_1_.io_oddr_data_bottom  }),
    .io_valid_o(\ch_1_.io_oddr_valid_li ),
    .io_ready_i(\ch_1_.io_oddr_ready_lo ),
    .token_clk_i(token_clk_i[1])
  );


  bsg_link_oddr_phy_width_p9
  ch_1_oddr_phy 
  (
    .reset_i(io_link_reset_i),
    .clk_i(io_clk_i),
    .data_i({ 1'b0, \ch_1_.io_oddr_data_top , \ch_1_.io_oddr_valid_li , \ch_1_.io_oddr_data_bottom  }),
    .ready_o(\ch_1_.io_oddr_ready_lo ),
    .data_r_o({ io_valid_r_o[1:1], io_data_r_o[15:8] }),
    .clk_r_o(io_clk_r_o[1])
  );

  assign core_piso_yumi_li = N0 & core_piso_valid_lo;
  assign N0 = core_piso_ready_li[1] & core_piso_ready_li[0];

endmodule

