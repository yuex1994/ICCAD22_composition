module PECore_rtl (
  clk, rst, start_msg, start_val, start_rdy, input_port_msg, input_port_val, input_port_rdy,
      rva_in_msg, rva_in_val, rva_in_rdy, rva_out_msg, rva_out_val, rva_out_rdy,
      act_port_msg, act_port_val, act_port_rdy, SC_SRAM_CONFIG
  , //PowerPro-CG
  or_dcpl_2
  , //PowerPro-CG
  m_addr_buf_lpi_1_dfm
  , //PowerPro-CG
  idat
  , //PowerPro-CG
  o_19
);
  input clk;
  input rst;
  input start_msg;
  input start_val;
  output start_rdy;
  input [137:0] input_port_msg;
  input input_port_val;
  output input_port_rdy;
  input [168:0] rva_in_msg;
  input rva_in_val;
  output rva_in_rdy;
  output [127:0] rva_out_msg;
  output rva_out_val;
  input rva_out_rdy;
  output [319:0] act_port_msg;
  output act_port_val;
  input act_port_rdy;
  input [31:0] SC_SRAM_CONFIG;
 input wire		[0:0]		or_dcpl_2; // PowerPro-CG
 input wire		[23:0]		m_addr_buf_lpi_1_dfm; // PowerPro-CG
 input wire		[23:0]		idat; // PowerPro-CG
 output	wire		[0:0]		o_19; // PowerPro-CG


  // Interconnect Declarations
  wire [11:0] weight_mem_banks_bank_array_impl_data0_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data0_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data0_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data1_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data1_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data1_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data1_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data2_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data2_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data2_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data2_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data3_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data3_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data3_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data3_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data4_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data4_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data4_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data4_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data5_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data5_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data5_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data5_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data6_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data6_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data6_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data6_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data7_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data7_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data7_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data7_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data8_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data8_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data8_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data8_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data9_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data9_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data9_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data9_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data10_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data10_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data10_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data10_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data11_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data11_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data11_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data11_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data12_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data12_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data12_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data12_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data13_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data13_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data13_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data13_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data14_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data14_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data14_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data14_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data15_rsci_a_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data15_rsci_d_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data15_rsci_q_d;
  wire weight_mem_banks_bank_array_impl_data15_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [7:0] input_mem_banks_bank_array_impl_data0_rsci_a_d;
  wire [127:0] input_mem_banks_bank_array_impl_data0_rsci_d_d;
  wire [127:0] input_mem_banks_bank_array_impl_data0_rsci_q_d;
  wire input_mem_banks_bank_array_impl_data0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d;
  wire [127:0] weight_mem_banks_bank_array_impl_data0_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data0_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data0_rsc_a;
  wire weight_mem_banks_bank_array_impl_data0_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data0_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data0_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data1_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data1_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data1_rsc_a;
  wire weight_mem_banks_bank_array_impl_data1_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data1_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data1_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data2_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data2_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data2_rsc_a;
  wire weight_mem_banks_bank_array_impl_data2_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data2_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data2_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data3_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data3_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data3_rsc_a;
  wire weight_mem_banks_bank_array_impl_data3_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data3_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data3_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data4_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data4_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data4_rsc_a;
  wire weight_mem_banks_bank_array_impl_data4_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data4_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data4_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data5_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data5_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data5_rsc_a;
  wire weight_mem_banks_bank_array_impl_data5_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data5_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data5_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data6_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data6_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data6_rsc_a;
  wire weight_mem_banks_bank_array_impl_data6_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data6_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data6_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data7_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data7_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data7_rsc_a;
  wire weight_mem_banks_bank_array_impl_data7_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data7_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data7_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data8_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data8_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data8_rsc_a;
  wire weight_mem_banks_bank_array_impl_data8_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data8_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data8_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data9_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data9_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data9_rsc_a;
  wire weight_mem_banks_bank_array_impl_data9_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data9_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data9_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data10_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data10_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data10_rsc_a;
  wire weight_mem_banks_bank_array_impl_data10_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data10_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data10_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data11_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data11_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data11_rsc_a;
  wire weight_mem_banks_bank_array_impl_data11_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data11_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data11_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data12_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data12_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data12_rsc_a;
  wire weight_mem_banks_bank_array_impl_data12_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data12_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data12_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data13_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data13_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data13_rsc_a;
  wire weight_mem_banks_bank_array_impl_data13_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data13_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data13_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data14_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data14_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data14_rsc_a;
  wire weight_mem_banks_bank_array_impl_data14_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data14_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data14_rsc_cen;
  wire [127:0] weight_mem_banks_bank_array_impl_data15_rsc_q;
  wire [127:0] weight_mem_banks_bank_array_impl_data15_rsc_d;
  wire [11:0] weight_mem_banks_bank_array_impl_data15_rsc_a;
  wire weight_mem_banks_bank_array_impl_data15_rsc_gwen;
  wire [127:0] weight_mem_banks_bank_array_impl_data15_rsc_wen;
  wire weight_mem_banks_bank_array_impl_data15_rsc_cen;
  wire [127:0] input_mem_banks_bank_array_impl_data0_rsc_q;
  wire [127:0] input_mem_banks_bank_array_impl_data0_rsc_d;
  wire [7:0] input_mem_banks_bank_array_impl_data0_rsc_a;
  wire input_mem_banks_bank_array_impl_data0_rsc_gwen;
  wire [127:0] input_mem_banks_bank_array_impl_data0_rsc_wen;
  wire input_mem_banks_bank_array_impl_data0_rsc_cen;
  wire weight_mem_banks_bank_array_impl_data0_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data1_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data2_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data3_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data4_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data5_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data6_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data7_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data8_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data9_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data10_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data11_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data12_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data13_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data14_rsci_wen_d_iff;
  wire weight_mem_banks_bank_array_impl_data15_rsci_wen_d_iff;
  wire input_mem_banks_bank_array_impl_data0_rsci_wen_d_iff;
 wire		[0:0]		o; // PowerPro-CG


  // Interconnect Declarations for Component Instantiations
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data0_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data0_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data0_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data0_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data0_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data0_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data0_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data1_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data1_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data1_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data1_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data1_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data1_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data1_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data2_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data2_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data2_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data2_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data2_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data2_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data2_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data3_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data3_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data3_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data3_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data3_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data3_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data3_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data4_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data4_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data4_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data4_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data4_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data4_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data4_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data5_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data5_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data5_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data5_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data5_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data5_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data5_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data6_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data6_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data6_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data6_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data6_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data6_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data6_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data7_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data7_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data7_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data7_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data7_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data7_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data7_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data8_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data8_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data8_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data8_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data8_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data8_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data8_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data9_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data9_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data9_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data9_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data9_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data9_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data9_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data10_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data10_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data10_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data10_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data10_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data10_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data10_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data11_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data11_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data11_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data11_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data11_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data11_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data11_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data12_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data12_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data12_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data12_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data12_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data12_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data12_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data13_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data13_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data13_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data13_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data13_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data13_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data13_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data14_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data14_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data14_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data14_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data14_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data14_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data14_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_4096x128 weight_mem_banks_bank_array_impl_data15_rsc_comp (
      .CLK(clk),
      .CEN(weight_mem_banks_bank_array_impl_data15_rsc_cen),
      .WEN(weight_mem_banks_bank_array_impl_data15_rsc_wen),
      .GWEN(weight_mem_banks_bank_array_impl_data15_rsc_gwen),
      .A(weight_mem_banks_bank_array_impl_data15_rsc_a),
      .D(weight_mem_banks_bank_array_impl_data15_rsc_d),
      .Q(weight_mem_banks_bank_array_impl_data15_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  LIB_SRAM_256x128 input_mem_banks_bank_array_impl_data0_rsc_comp (
      .CLK(clk),
      .CEN(input_mem_banks_bank_array_impl_data0_rsc_cen),
      .WEN(input_mem_banks_bank_array_impl_data0_rsc_wen),
      .GWEN(input_mem_banks_bank_array_impl_data0_rsc_gwen),
      .A(input_mem_banks_bank_array_impl_data0_rsc_a),
      .D(input_mem_banks_bank_array_impl_data0_rsc_d),
      .Q(input_mem_banks_bank_array_impl_data0_rsc_q),
      .STOV(SC_SRAM_CONFIG[0]),
      .EMA( SC_SRAM_CONFIG[3:1]),
      .EMAW(SC_SRAM_CONFIG[5:4]),
      .EMAS(SC_SRAM_CONFIG[6])   
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_101_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data0_rsci (
      .q(weight_mem_banks_bank_array_impl_data0_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data0_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data0_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data0_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data0_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data0_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data0_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data0_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data0_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data0_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data0_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_102_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data1_rsci (
      .q(weight_mem_banks_bank_array_impl_data1_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data1_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data1_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data1_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data1_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data1_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data1_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data1_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data1_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data1_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data1_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data1_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_103_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data2_rsci (
      .q(weight_mem_banks_bank_array_impl_data2_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data2_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data2_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data2_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data2_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data2_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data2_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data2_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data2_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data2_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data2_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data2_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_104_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data3_rsci (
      .q(weight_mem_banks_bank_array_impl_data3_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data3_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data3_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data3_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data3_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data3_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data3_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data3_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data3_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data3_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data3_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data3_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_105_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data4_rsci (
      .q(weight_mem_banks_bank_array_impl_data4_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data4_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data4_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data4_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data4_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data4_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data4_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data4_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data4_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data4_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data4_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data4_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_106_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data5_rsci (
      .q(weight_mem_banks_bank_array_impl_data5_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data5_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data5_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data5_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data5_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data5_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data5_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data5_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data5_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data5_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data5_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data5_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_107_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data6_rsci (
      .q(weight_mem_banks_bank_array_impl_data6_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data6_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data6_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data6_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data6_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data6_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data6_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data6_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data6_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data6_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data6_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data6_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_108_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data7_rsci (
      .q(weight_mem_banks_bank_array_impl_data7_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data7_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data7_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data7_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data7_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data7_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data7_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data7_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data7_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data7_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data7_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data7_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_109_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data8_rsci (
      .q(weight_mem_banks_bank_array_impl_data8_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data8_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data8_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data8_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data8_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data8_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data8_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data8_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data8_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data8_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data8_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data8_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_110_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data9_rsci (
      .q(weight_mem_banks_bank_array_impl_data9_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data9_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data9_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data9_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data9_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data9_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data9_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data9_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data9_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data9_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data9_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data9_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_111_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data10_rsci (
      .q(weight_mem_banks_bank_array_impl_data10_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data10_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data10_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data10_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data10_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data10_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data10_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data10_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data10_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data10_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data10_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data10_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_112_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data11_rsci (
      .q(weight_mem_banks_bank_array_impl_data11_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data11_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data11_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data11_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data11_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data11_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data11_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data11_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data11_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data11_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data11_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data11_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_113_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data12_rsci (
      .q(weight_mem_banks_bank_array_impl_data12_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data12_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data12_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data12_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data12_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data12_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data12_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data12_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data12_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data12_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data12_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data12_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_114_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data13_rsci (
      .q(weight_mem_banks_bank_array_impl_data13_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data13_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data13_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data13_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data13_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data13_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data13_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data13_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data13_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data13_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data13_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data13_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_115_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data14_rsci (
      .q(weight_mem_banks_bank_array_impl_data14_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data14_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data14_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data14_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data14_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data14_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data14_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data14_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data14_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data14_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data14_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data14_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_4096x128_sram_4096x128_rwport_116_128_4096_12_4096_128_1_gen
      weight_mem_banks_bank_array_impl_data15_rsci (
      .q(weight_mem_banks_bank_array_impl_data15_rsc_q),
      .d(weight_mem_banks_bank_array_impl_data15_rsc_d),
      .a(weight_mem_banks_bank_array_impl_data15_rsc_a),
      .gwen(weight_mem_banks_bank_array_impl_data15_rsc_gwen),
      .wen(weight_mem_banks_bank_array_impl_data15_rsc_wen),
      .cen(weight_mem_banks_bank_array_impl_data15_rsc_cen),
      .wen_d(weight_mem_banks_bank_array_impl_data15_rsci_wen_d_iff),
      .gwen_d(weight_mem_banks_bank_array_impl_data15_rsci_wen_d_iff),
      .a_d(weight_mem_banks_bank_array_impl_data15_rsci_a_d),
      .d_d(weight_mem_banks_bank_array_impl_data15_rsci_d_d),
      .q_d(weight_mem_banks_bank_array_impl_data15_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data15_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
  Top_PEPartition_PEModule_PECore_PECore_sram_256x128_sram_256x128_rwport_118_128_256_8_256_128_1_gen input_mem_banks_bank_array_impl_data0_rsci
      (
      .q(input_mem_banks_bank_array_impl_data0_rsc_q),
      .d(input_mem_banks_bank_array_impl_data0_rsc_d),
      .a(input_mem_banks_bank_array_impl_data0_rsc_a),
      .gwen(input_mem_banks_bank_array_impl_data0_rsc_gwen),
      .wen(input_mem_banks_bank_array_impl_data0_rsc_wen),
      .cen(input_mem_banks_bank_array_impl_data0_rsc_cen),
      .wen_d(input_mem_banks_bank_array_impl_data0_rsci_wen_d_iff),
      .gwen_d(input_mem_banks_bank_array_impl_data0_rsci_wen_d_iff),
      .a_d(input_mem_banks_bank_array_impl_data0_rsci_a_d),
      .d_d(input_mem_banks_bank_array_impl_data0_rsci_d_d),
      .q_d(input_mem_banks_bank_array_impl_data0_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(input_mem_banks_bank_array_impl_data0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d)
    );
 //PowerPro-CG
 assign o_19 = o;
  Top_PEPartition_PEModule_PECore_PECore_PECoreRun PECore_PECoreRun_inst (
      .clk(clk),
      .rst(rst),
      .start_msg(start_msg),
      .start_val(start_val),
      .start_rdy(start_rdy),
      .input_port_msg(input_port_msg),
      .input_port_val(input_port_val),
      .input_port_rdy(input_port_rdy),
      .rva_in_msg(rva_in_msg),
      .rva_in_val(rva_in_val),
      .rva_in_rdy(rva_in_rdy),
      .rva_out_msg(rva_out_msg),
      .rva_out_val(rva_out_val),
      .rva_out_rdy(rva_out_rdy),
      .act_port_msg(act_port_msg),
      .act_port_val(act_port_val),
      .act_port_rdy(act_port_rdy),
      .SC_SRAM_CONFIG(SC_SRAM_CONFIG),
      .weight_mem_banks_bank_array_impl_data0_rsci_a_d(weight_mem_banks_bank_array_impl_data0_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data0_rsci_d_d(weight_mem_banks_bank_array_impl_data0_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data0_rsci_q_d(weight_mem_banks_bank_array_impl_data0_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data1_rsci_a_d(weight_mem_banks_bank_array_impl_data1_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data1_rsci_d_d(weight_mem_banks_bank_array_impl_data1_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data1_rsci_q_d(weight_mem_banks_bank_array_impl_data1_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data1_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data1_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data2_rsci_a_d(weight_mem_banks_bank_array_impl_data2_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data2_rsci_d_d(weight_mem_banks_bank_array_impl_data2_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data2_rsci_q_d(weight_mem_banks_bank_array_impl_data2_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data2_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data2_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data3_rsci_a_d(weight_mem_banks_bank_array_impl_data3_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data3_rsci_d_d(weight_mem_banks_bank_array_impl_data3_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data3_rsci_q_d(weight_mem_banks_bank_array_impl_data3_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data3_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data3_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data4_rsci_a_d(weight_mem_banks_bank_array_impl_data4_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data4_rsci_d_d(weight_mem_banks_bank_array_impl_data4_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data4_rsci_q_d(weight_mem_banks_bank_array_impl_data4_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data4_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data4_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data5_rsci_a_d(weight_mem_banks_bank_array_impl_data5_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data5_rsci_d_d(weight_mem_banks_bank_array_impl_data5_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data5_rsci_q_d(weight_mem_banks_bank_array_impl_data5_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data5_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data5_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data6_rsci_a_d(weight_mem_banks_bank_array_impl_data6_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data6_rsci_d_d(weight_mem_banks_bank_array_impl_data6_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data6_rsci_q_d(weight_mem_banks_bank_array_impl_data6_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data6_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data6_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data7_rsci_a_d(weight_mem_banks_bank_array_impl_data7_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data7_rsci_d_d(weight_mem_banks_bank_array_impl_data7_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data7_rsci_q_d(weight_mem_banks_bank_array_impl_data7_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data7_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data7_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data8_rsci_a_d(weight_mem_banks_bank_array_impl_data8_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data8_rsci_d_d(weight_mem_banks_bank_array_impl_data8_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data8_rsci_q_d(weight_mem_banks_bank_array_impl_data8_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data8_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data8_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data9_rsci_a_d(weight_mem_banks_bank_array_impl_data9_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data9_rsci_d_d(weight_mem_banks_bank_array_impl_data9_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data9_rsci_q_d(weight_mem_banks_bank_array_impl_data9_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data9_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data9_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data10_rsci_a_d(weight_mem_banks_bank_array_impl_data10_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data10_rsci_d_d(weight_mem_banks_bank_array_impl_data10_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data10_rsci_q_d(weight_mem_banks_bank_array_impl_data10_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data10_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data10_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data11_rsci_a_d(weight_mem_banks_bank_array_impl_data11_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data11_rsci_d_d(weight_mem_banks_bank_array_impl_data11_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data11_rsci_q_d(weight_mem_banks_bank_array_impl_data11_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data11_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data11_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data12_rsci_a_d(weight_mem_banks_bank_array_impl_data12_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data12_rsci_d_d(weight_mem_banks_bank_array_impl_data12_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data12_rsci_q_d(weight_mem_banks_bank_array_impl_data12_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data12_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data12_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data13_rsci_a_d(weight_mem_banks_bank_array_impl_data13_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data13_rsci_d_d(weight_mem_banks_bank_array_impl_data13_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data13_rsci_q_d(weight_mem_banks_bank_array_impl_data13_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data13_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data13_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data14_rsci_a_d(weight_mem_banks_bank_array_impl_data14_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data14_rsci_d_d(weight_mem_banks_bank_array_impl_data14_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data14_rsci_q_d(weight_mem_banks_bank_array_impl_data14_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data14_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data14_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data15_rsci_a_d(weight_mem_banks_bank_array_impl_data15_rsci_a_d),
      .weight_mem_banks_bank_array_impl_data15_rsci_d_d(weight_mem_banks_bank_array_impl_data15_rsci_d_d),
      .weight_mem_banks_bank_array_impl_data15_rsci_q_d(weight_mem_banks_bank_array_impl_data15_rsci_q_d),
      .weight_mem_banks_bank_array_impl_data15_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(weight_mem_banks_bank_array_impl_data15_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .input_mem_banks_bank_array_impl_data0_rsci_a_d(input_mem_banks_bank_array_impl_data0_rsci_a_d),
      .input_mem_banks_bank_array_impl_data0_rsci_d_d(input_mem_banks_bank_array_impl_data0_rsci_d_d),
      .input_mem_banks_bank_array_impl_data0_rsci_q_d(input_mem_banks_bank_array_impl_data0_rsci_q_d),
      .input_mem_banks_bank_array_impl_data0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d(input_mem_banks_bank_array_impl_data0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d),
      .weight_mem_banks_bank_array_impl_data0_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data0_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data1_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data1_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data2_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data2_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data3_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data3_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data4_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data4_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data5_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data5_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data6_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data6_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data7_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data7_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data8_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data8_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data9_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data9_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data10_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data10_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data11_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data11_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data12_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data12_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data13_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data13_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data14_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data14_rsci_wen_d_iff),
      .weight_mem_banks_bank_array_impl_data15_rsci_wen_d_pff(weight_mem_banks_bank_array_impl_data15_rsci_wen_d_iff),
      .input_mem_banks_bank_array_impl_data0_rsci_wen_d_pff(input_mem_banks_bank_array_impl_data0_rsci_wen_d_iff)
      , //PowerPro-CG
       .or_dcpl_2( or_dcpl_2 )
      , //PowerPro-CG
       .m_addr_buf_lpi_1_dfm( m_addr_buf_lpi_1_dfm )
      , //PowerPro-CG
       .idat( idat )
      , //PowerPro-CG
       .o_18( o )
    );
endmodule