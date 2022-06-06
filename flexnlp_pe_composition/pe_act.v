module ActUnit_rtl (
  clk, rst, start_msg, start_val, start_rdy, act_port_msg, act_port_val, act_port_rdy,
      rva_in_msg, rva_in_val, rva_in_rdy, rva_out_msg, rva_out_val, rva_out_rdy,
      output_port_msg, output_port_val, output_port_rdy, done_msg, done_val, done_rdy
  , //PowerPro-CG
  o
);
  input clk;
  input rst;
  input start_msg;
  input start_val;
  output start_rdy;
  input [319:0] act_port_msg;
  input act_port_val;
  output act_port_rdy;
  input [168:0] rva_in_msg;
  input rva_in_val;
  output rva_in_rdy;
  output [127:0] rva_out_msg;
  output rva_out_val;
  input rva_out_rdy;
  output [137:0] output_port_msg;
  output output_port_val;
  input output_port_rdy;
  output done_msg;
  output done_val;
  input done_rdy;
 input wire		[0:0]		o; // PowerPro-CG


  // Interconnect Declarations
  wire [127:0] Adpfloat2Fixed_1_cmp_in_data;
  wire [319:0] Adpfloat2Fixed_1_cmp_out_data;
  wire [2:0] Adpfloat2Fixed_1_cmp_adpfloat_bias;
  wire [319:0] OneX_cmp_in_data;
  wire [319:0] OneX_cmp_out_data;
  wire [319:0] Tanh_cmp_in_data;
  wire [319:0] Tanh_cmp_out_data;
  wire [319:0] EMul_cmp_in_1_data;
  wire [319:0] EMul_cmp_in_2_data;
  wire [319:0] EMul_cmp_out_data;


  // Interconnect Declarations for Component Instantiations
  Top_PEPartition_PEModule_ActUnit_Adpfloat2Fixed  Adpfloat2Fixed_1_cmp (
      .in_data(Adpfloat2Fixed_1_cmp_in_data),
      .out_data(Adpfloat2Fixed_1_cmp_out_data),
      .adpfloat_bias(Adpfloat2Fixed_1_cmp_adpfloat_bias)
    );
  Top_PEPartition_PEModule_ActUnit_OneX  OneX_cmp (
      .in_data(OneX_cmp_in_data),
      .out_data(OneX_cmp_out_data)
    );
  Top_PEPartition_PEModule_ActUnit_Tanh  Tanh_cmp (
      .in_data(Tanh_cmp_in_data),
      .out_data(Tanh_cmp_out_data)
    );
  Top_PEPartition_PEModule_ActUnit_EMul  EMul_cmp (
      .in_1_data(EMul_cmp_in_1_data),
      .in_2_data(EMul_cmp_in_2_data),
      .out_data(EMul_cmp_out_data)
    );
  Top_PEPartition_PEModule_ActUnit_ActUnit_ActUnitRun ActUnit_ActUnitRun_inst (
      .clk(clk),
      .rst(rst),
      .start_msg(start_msg),
      .start_val(start_val),
      .start_rdy(start_rdy),
      .act_port_msg(act_port_msg),
      .act_port_val(act_port_val),
      .act_port_rdy(act_port_rdy),
      .rva_in_msg(rva_in_msg),
      .rva_in_val(rva_in_val),
      .rva_in_rdy(rva_in_rdy),
      .rva_out_msg(rva_out_msg),
      .rva_out_val(rva_out_val),
      .rva_out_rdy(rva_out_rdy),
      .output_port_msg(output_port_msg),
      .output_port_val(output_port_val),
      .output_port_rdy(output_port_rdy),
      .done_msg(done_msg),
      .done_val(done_val),
      .done_rdy(done_rdy),
      .Adpfloat2Fixed_1_cmp_in_data(Adpfloat2Fixed_1_cmp_in_data),
      .Adpfloat2Fixed_1_cmp_out_data(Adpfloat2Fixed_1_cmp_out_data),
      .Adpfloat2Fixed_1_cmp_adpfloat_bias(Adpfloat2Fixed_1_cmp_adpfloat_bias),
      .OneX_cmp_in_data(OneX_cmp_in_data),
      .OneX_cmp_out_data(OneX_cmp_out_data),
      .Tanh_cmp_in_data(Tanh_cmp_in_data),
      .Tanh_cmp_out_data(Tanh_cmp_out_data),
      .EMul_cmp_in_1_data(EMul_cmp_in_1_data),
      .EMul_cmp_in_2_data(EMul_cmp_in_2_data),
      .EMul_cmp_out_data(EMul_cmp_out_data)
      , //PowerPro-CG
       .o( o )
    );
endmodule