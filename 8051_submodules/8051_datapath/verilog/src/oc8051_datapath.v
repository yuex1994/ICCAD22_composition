`include "oc8051_defines.v"

module oc8051_datapath(
wb_rst_i,
wb_clk_i,
alu_op,
rd_addr,
wr_addr,
bit_addr_o,
wr_o,
wr_ind,
src_sel1,
src_sel2,
src_sel3,
rd,
pc,
op1_n,
op2_n,
op3_n,
comp_sel,
eq,
cy_sel,
op1_cur,
ram_rd_sel,
ram_wr_sel,
wr_sfr,
psw_set,
rmw,
p0_i, p1_i, p2_i, p3_i,
reti
);
input wb_rst_i, wb_clk_i;
input [3:0] alu_op;
input [7:0] rd_addr, wr_addr;
input bit_addr_o;
input wr_o, wr_ind;
input [1:0] comp_sel, cy_sel, psw_set;
input eq;
input rmw;
input [7:0] op1_cur;
input [2:0] ram_rd_sel, ram_wr_sel;
input [1:0] wr_sfr;

input [2:0] src_sel1;
input [1:0] src_sel2;
input src_sel3, rd;
input [15:0] pc;
input [7:0] op1_n, op2_n, op3_n;
input [7:0] p0_i, p1_i, p2_i, p3_i;
input reti;

wire first_time;
reg first_timed;
assign first_time = ((alu_op == 1) && !first_timed) ? 1 : 0; 
always @(posedge wb_clk_i) begin
  if (wb_rst_i) begin first_timed <= 0; end
  else if (alu_op != 0) begin 
    first_timed <= 1;
  end
end

reg [7:0] ram_out;
reg bit_out;
wire comp_wait, wait_data;
wire [7:0] acc, dptr_hi, dptr_lo, ie, sp_w; 
wire [7:0] p0_o, p1_o, p2_o, p3_o;
wire int_ack, intr, int0, int1;
wire [7:0] int_src;


wire [2047 :0] iram;
wire bit_data;
wire [7:0] wr_data_m, rd_addr_m, wr_addr_m;


wire [7:0] ram_data;
wire [7:0] src1, src2, src3;
wire alu_cy, srcAc, bit_in;
wire desCy, desAc, desOv;
wire [7:0] des1, des2, des_acc, sub_result, wr_dat;
wire cy;

wire [7:0] ri;

wire [7:0] sfr_out;
wire sfr_bit;
assign wr_dat = des1;

wire [7:0] iram_0, iram_1, iram_2, iram_3, iram_4, iram_5, iram_6, iram_7, iram_8, iram_9, iram_10, iram_11, iram_12, iram_13, iram_14, iram_15;
assign iram_0 = iram[7:0];
assign iram_1 = iram[15:8];
assign iram_2 = iram[23:16];
assign iram_3 = iram[31:24];
assign iram_4 = iram[39:32];
assign iram_5 = iram[47:40];
assign iram_6 = iram[55:48];
assign iram_7 = iram[63:56];
assign iram_8 = iram[71:64];
assign iram_9 = iram[79:72];
assign iram_10 = iram[87:80];
assign iram_11 = iram[95:88];
assign iram_12 = iram[103:96];
assign iram_13 = iram[111:104];
assign iram_14 = iram[119:112];
assign iram_15 = iram[127:120];
wire [7:0] iram_16, iram_17, iram_18, iram_19, iram_20, iram_21, iram_22, iram_23, iram_24, iram_25, iram_26, iram_27, iram_28, iram_29, iram_30, iram_31, iram_32, iram_33, iram_34, iram_35, iram_36, iram_37, iram_38, iram_39, iram_40, iram_41, iram_42, iram_43, iram_44, iram_45, iram_46, iram_47, iram_48, iram_49, iram_50, iram_51, iram_52, iram_53, iram_54, iram_55, iram_56, iram_57, iram_58, iram_59, iram_60, iram_61, iram_62, iram_63, iram_64, iram_65, iram_66, iram_67, iram_68, iram_69, iram_70, iram_71, iram_72, iram_73, iram_74, iram_75, iram_76, iram_77, iram_78, iram_79, iram_80, iram_81, iram_82, iram_83, iram_84, iram_85, iram_86, iram_87, iram_88, iram_89, iram_90, iram_91, iram_92, iram_93, iram_94, iram_95, iram_96, iram_97, iram_98, iram_99, iram_100, iram_101, iram_102, iram_103, iram_104, iram_105, iram_106, iram_107, iram_108, iram_109, iram_110, iram_111, iram_112, iram_113, iram_114, iram_115, iram_116, iram_117, iram_118, iram_119, iram_120, iram_121, iram_122, iram_123, iram_124, iram_125, iram_126, iram_127, iram_128, iram_129, iram_130, iram_131, iram_132, iram_133, iram_134, iram_135, iram_136, iram_137, iram_138, iram_139, iram_140, iram_141, iram_142, iram_143, iram_144, iram_145, iram_146, iram_147, iram_148, iram_149, iram_150, iram_151, iram_152, iram_153, iram_154, iram_155, iram_156, iram_157, iram_158, iram_159, iram_160, iram_161, iram_162, iram_163, iram_164, iram_165, iram_166, iram_167, iram_168, iram_169, iram_170, iram_171, iram_172, iram_173, iram_174, iram_175, iram_176, iram_177, iram_178, iram_179, iram_180, iram_181, iram_182, iram_183, iram_184, iram_185, iram_186, iram_187, iram_188, iram_189, iram_190, iram_191, iram_192, iram_193, iram_194, iram_195, iram_196, iram_197, iram_198, iram_199, iram_200, iram_201, iram_202, iram_203, iram_204, iram_205, iram_206, iram_207, iram_208, iram_209, iram_210, iram_211, iram_212, iram_213, iram_214, iram_215, iram_216, iram_217, iram_218, iram_219, iram_220, iram_221, iram_222, iram_223, iram_224, iram_225, iram_226, iram_227, iram_228, iram_229, iram_230, iram_231, iram_232, iram_233, iram_234, iram_235, iram_236, iram_237, iram_238, iram_239, iram_240, iram_241, iram_242, iram_243, iram_244, iram_245, iram_246, iram_247, iram_248, iram_249, iram_250, iram_251, iram_252, iram_253, iram_254, iram_255;
assign iram_16 = iram[135:128];
assign iram_17 = iram[143:136];
assign iram_18 = iram[151:144];
assign iram_19 = iram[159:152];
assign iram_20 = iram[167:160];
assign iram_21 = iram[175:168];
assign iram_22 = iram[183:176];
assign iram_23 = iram[191:184];
assign iram_24 = iram[199:192];
assign iram_25 = iram[207:200];
assign iram_26 = iram[215:208];
assign iram_27 = iram[223:216];
assign iram_28 = iram[231:224];
assign iram_29 = iram[239:232];
assign iram_30 = iram[247:240];
assign iram_31 = iram[255:248];
assign iram_32 = iram[263:256];
assign iram_33 = iram[271:264];
assign iram_34 = iram[279:272];
assign iram_35 = iram[287:280];
assign iram_36 = iram[295:288];
assign iram_37 = iram[303:296];
assign iram_38 = iram[311:304];
assign iram_39 = iram[319:312];
assign iram_40 = iram[327:320];
assign iram_41 = iram[335:328];
assign iram_42 = iram[343:336];
assign iram_43 = iram[351:344];
assign iram_44 = iram[359:352];
assign iram_45 = iram[367:360];
assign iram_46 = iram[375:368];
assign iram_47 = iram[383:376];
assign iram_48 = iram[391:384];
assign iram_49 = iram[399:392];
assign iram_50 = iram[407:400];
assign iram_51 = iram[415:408];
assign iram_52 = iram[423:416];
assign iram_53 = iram[431:424];
assign iram_54 = iram[439:432];
assign iram_55 = iram[447:440];
assign iram_56 = iram[455:448];
assign iram_57 = iram[463:456];
assign iram_58 = iram[471:464];
assign iram_59 = iram[479:472];
assign iram_60 = iram[487:480];
assign iram_61 = iram[495:488];
assign iram_62 = iram[503:496];
assign iram_63 = iram[511:504];
assign iram_64 = iram[519:512];
assign iram_65 = iram[527:520];
assign iram_66 = iram[535:528];
assign iram_67 = iram[543:536];
assign iram_68 = iram[551:544];
assign iram_69 = iram[559:552];
assign iram_70 = iram[567:560];
assign iram_71 = iram[575:568];
assign iram_72 = iram[583:576];
assign iram_73 = iram[591:584];
assign iram_74 = iram[599:592];
assign iram_75 = iram[607:600];
assign iram_76 = iram[615:608];
assign iram_77 = iram[623:616];
assign iram_78 = iram[631:624];
assign iram_79 = iram[639:632];
assign iram_80 = iram[647:640];
assign iram_81 = iram[655:648];
assign iram_82 = iram[663:656];
assign iram_83 = iram[671:664];
assign iram_84 = iram[679:672];
assign iram_85 = iram[687:680];
assign iram_86 = iram[695:688];
assign iram_87 = iram[703:696];
assign iram_88 = iram[711:704];
assign iram_89 = iram[719:712];
assign iram_90 = iram[727:720];
assign iram_91 = iram[735:728];
assign iram_92 = iram[743:736];
assign iram_93 = iram[751:744];
assign iram_94 = iram[759:752];
assign iram_95 = iram[767:760];
assign iram_96 = iram[775:768];
assign iram_97 = iram[783:776];
assign iram_98 = iram[791:784];
assign iram_99 = iram[799:792];
assign iram_100 = iram[807:800];
assign iram_101 = iram[815:808];
assign iram_102 = iram[823:816];
assign iram_103 = iram[831:824];
assign iram_104 = iram[839:832];
assign iram_105 = iram[847:840];
assign iram_106 = iram[855:848];
assign iram_107 = iram[863:856];
assign iram_108 = iram[871:864];
assign iram_109 = iram[879:872];
assign iram_110 = iram[887:880];
assign iram_111 = iram[895:888];
assign iram_112 = iram[903:896];
assign iram_113 = iram[911:904];
assign iram_114 = iram[919:912];
assign iram_115 = iram[927:920];
assign iram_116 = iram[935:928];
assign iram_117 = iram[943:936];
assign iram_118 = iram[951:944];
assign iram_119 = iram[959:952];
assign iram_120 = iram[967:960];
assign iram_121 = iram[975:968];
assign iram_122 = iram[983:976];
assign iram_123 = iram[991:984];
assign iram_124 = iram[999:992];
assign iram_125 = iram[1007:1000];
assign iram_126 = iram[1015:1008];
assign iram_127 = iram[1023:1016];
assign iram_128 = iram[1031:1024];
assign iram_129 = iram[1039:1032];
assign iram_130 = iram[1047:1040];
assign iram_131 = iram[1055:1048];
assign iram_132 = iram[1063:1056];
assign iram_133 = iram[1071:1064];
assign iram_134 = iram[1079:1072];
assign iram_135 = iram[1087:1080];
assign iram_136 = iram[1095:1088];
assign iram_137 = iram[1103:1096];
assign iram_138 = iram[1111:1104];
assign iram_139 = iram[1119:1112];
assign iram_140 = iram[1127:1120];
assign iram_141 = iram[1135:1128];
assign iram_142 = iram[1143:1136];
assign iram_143 = iram[1151:1144];
assign iram_144 = iram[1159:1152];
assign iram_145 = iram[1167:1160];
assign iram_146 = iram[1175:1168];
assign iram_147 = iram[1183:1176];
assign iram_148 = iram[1191:1184];
assign iram_149 = iram[1199:1192];
assign iram_150 = iram[1207:1200];
assign iram_151 = iram[1215:1208];
assign iram_152 = iram[1223:1216];
assign iram_153 = iram[1231:1224];
assign iram_154 = iram[1239:1232];
assign iram_155 = iram[1247:1240];
assign iram_156 = iram[1255:1248];
assign iram_157 = iram[1263:1256];
assign iram_158 = iram[1271:1264];
assign iram_159 = iram[1279:1272];
assign iram_160 = iram[1287:1280];
assign iram_161 = iram[1295:1288];
assign iram_162 = iram[1303:1296];
assign iram_163 = iram[1311:1304];
assign iram_164 = iram[1319:1312];
assign iram_165 = iram[1327:1320];
assign iram_166 = iram[1335:1328];
assign iram_167 = iram[1343:1336];
assign iram_168 = iram[1351:1344];
assign iram_169 = iram[1359:1352];
assign iram_170 = iram[1367:1360];
assign iram_171 = iram[1375:1368];
assign iram_172 = iram[1383:1376];
assign iram_173 = iram[1391:1384];
assign iram_174 = iram[1399:1392];
assign iram_175 = iram[1407:1400];
assign iram_176 = iram[1415:1408];
assign iram_177 = iram[1423:1416];
assign iram_178 = iram[1431:1424];
assign iram_179 = iram[1439:1432];
assign iram_180 = iram[1447:1440];
assign iram_181 = iram[1455:1448];
assign iram_182 = iram[1463:1456];
assign iram_183 = iram[1471:1464];
assign iram_184 = iram[1479:1472];
assign iram_185 = iram[1487:1480];
assign iram_186 = iram[1495:1488];
assign iram_187 = iram[1503:1496];
assign iram_188 = iram[1511:1504];
assign iram_189 = iram[1519:1512];
assign iram_190 = iram[1527:1520];
assign iram_191 = iram[1535:1528];
assign iram_192 = iram[1543:1536];
assign iram_193 = iram[1551:1544];
assign iram_194 = iram[1559:1552];
assign iram_195 = iram[1567:1560];
assign iram_196 = iram[1575:1568];
assign iram_197 = iram[1583:1576];
assign iram_198 = iram[1591:1584];
assign iram_199 = iram[1599:1592];
assign iram_200 = iram[1607:1600];
assign iram_201 = iram[1615:1608];
assign iram_202 = iram[1623:1616];
assign iram_203 = iram[1631:1624];
assign iram_204 = iram[1639:1632];
assign iram_205 = iram[1647:1640];
assign iram_206 = iram[1655:1648];
assign iram_207 = iram[1663:1656];
assign iram_208 = iram[1671:1664];
assign iram_209 = iram[1679:1672];
assign iram_210 = iram[1687:1680];
assign iram_211 = iram[1695:1688];
assign iram_212 = iram[1703:1696];
assign iram_213 = iram[1711:1704];
assign iram_214 = iram[1719:1712];
assign iram_215 = iram[1727:1720];
assign iram_216 = iram[1735:1728];
assign iram_217 = iram[1743:1736];
assign iram_218 = iram[1751:1744];
assign iram_219 = iram[1759:1752];
assign iram_220 = iram[1767:1760];
assign iram_221 = iram[1775:1768];
assign iram_222 = iram[1783:1776];
assign iram_223 = iram[1791:1784];
assign iram_224 = iram[1799:1792];
assign iram_225 = iram[1807:1800];
assign iram_226 = iram[1815:1808];
assign iram_227 = iram[1823:1816];
assign iram_228 = iram[1831:1824];
assign iram_229 = iram[1839:1832];
assign iram_230 = iram[1847:1840];
assign iram_231 = iram[1855:1848];
assign iram_232 = iram[1863:1856];
assign iram_233 = iram[1871:1864];
assign iram_234 = iram[1879:1872];
assign iram_235 = iram[1887:1880];
assign iram_236 = iram[1895:1888];
assign iram_237 = iram[1903:1896];
assign iram_238 = iram[1911:1904];
assign iram_239 = iram[1919:1912];
assign iram_240 = iram[1927:1920];
assign iram_241 = iram[1935:1928];
assign iram_242 = iram[1943:1936];
assign iram_243 = iram[1951:1944];
assign iram_244 = iram[1959:1952];
assign iram_245 = iram[1967:1960];
assign iram_246 = iram[1975:1968];
assign iram_247 = iram[1983:1976];
assign iram_248 = iram[1991:1984];
assign iram_249 = iram[1999:1992];
assign iram_250 = iram[2007:2000];
assign iram_251 = iram[2015:2008];
assign iram_252 = iram[2023:2016];
assign iram_253 = iram[2031:2024];
assign iram_254 = iram[2039:2032];
assign iram_255 = iram[2047:2040];
wire [7:0] iram0, iram1, iram8, iram9;
assign iram0 = iram_0;
assign iram1 = iram_1;
assign iram8 = iram_8;
assign iram9 = iram_9;

oc8051_alu oc8051_alu1(.rst(wb_rst_i),
                       .clk(clk),
                       .op_code(alu_op),
                       .src1(src1),
                       .src2(src2),
                       .src3(src3),
                       .srcCy(alu_cy),
                       .srcAc(srcAc),
                       .des_acc(des_acc),
                       .sub_result(sub_result),
                       .des1(des1),
                       .des2(des2),
                       .desCy(desCy),
                       .desAc(desAc),
                       .desOv(desOv),
                       .bit_in(bit_out));

oc8051_ram_top oc8051_ram_top1(.clk(wb_clk_i),
                               .rst(wb_rst_i),
                              //  .rd_addr(rd_addr[3:0]),
                               .rd_addr(rd_addr),
                               .rd_data(ram_data),
                               .wr_addr(wr_addr),
                              //  .wr_addr(wr_addr[3:0]),
                               .bit_addr(bit_addr_o),
                               .wr_data(wr_dat),
                               .wr(wr_o && (!wr_addr[7] || wr_ind)),
                               .iram(iram),
                               .bit_data_in(desCy),
                               .bit_data_out(bit_data));

oc8051_alu_src_sel oc8051_alu_src_sel1(.clk(wb_clk_i),
                                       .rst(wb_rst_i),
                                       .rd(rd),

                                       .sel1(src_sel1),
                                       .sel2(src_sel2),
                                       .sel3(src_sel3),

                                       .acc(acc),
                                       .ram(ram_out),
                                       .pc(pc),
                                       .dptr({dptr_hi, dptr_lo}),
                                       .op1(op1_n),
                                       .op2(op2_n),
                                       .op3(op3_n),

                                       .src1(src1),
                                       .src2(src2),
                                       .src3(src3));

oc8051_comp oc8051_comp1(.sel(comp_sel),
                         .eq(eq),
                         .b_in(bit_out),
                         .cy(cy),
                         .acc(acc),
                         .des(sub_result)
                         );


oc8051_cy_select oc8051_cy_select1(.cy_sel(cy_sel),
                                   .cy_in(cy),
                                   .data_in(bit_out),
                                   .data_out(alu_cy));

oc8051_indi_addr oc8051_indi_addr1 (.clk(wb_clk_i),
                                    .rst(wb_rst_i),
                                    .wr_addr(wr_addr),
                                    .data_in(wr_dat),
                                    .wr(wr_o && (!wr_addr[7] || wr_ind)),
                                    .wr_bit(bit_addr_o),
                                    .ri_out(ri),
                                    .sel(op1_cur[0]),
                                    .bank(bank_sel),
                                    .iram0(iram0),
                                    .iram1(iram1),
                                    .iram8(iram8),
                                    .iram9(iram9));

oc8051_sfr oc8051_sfr1(.rst(wb_rst_i),
                       .clk(wb_clk_i),
                       .adr0(rd_addr[7:0]),
                       .adr1(wr_addr[7:0]),
                       .dat0(sfr_out),
                       .dat1(wr_dat),
                       .dat2(des2),
                       .des_acc(des_acc),
                       .we(wr_o && !wr_ind),
                       .bit_in(desCy),
                       .bit_out(sfr_bit),
                       .wr_bit(bit_addr_o),
                       .ram_rd_sel(ram_rd_sel),
                       .ram_wr_sel(ram_wr_sel),
                       .wr_sfr(wr_sfr),
                       .comp_sel(comp_sel),
                       .comp_wait(comp_wait),
                       .ie(ie),
// acc
                       .acc(acc),
                       .b_reg(b_reg),
// sp
                       .sp(sp),
                       .sp_w(sp_w),
// psw
                       .bank_sel(bank_sel),
                       .desAc(desAc),
                       .desOv(desOv),
                       .psw_set(0),
                       .srcAc(srcAc),
                       .cy(cy),
                       .psw(psw),
                       .p(p),
// ports
                       .rmw(rmw),
                       .p0_out(p0_o),
                       .p0_in(p0_i),
                       .p1_out(p1_o),
                       .p1_in(p1_i),
                       .p2_out(p2_o),
                       .p2_in(p2_i),
                       .p3_out(p3_o),
                       .p3_in(p3_i),

// uart
        `ifdef OC8051_UART
                       .rxd(rxd_i), .txd(txd_o),
        `endif

// int
                       .int_ack(int_ack),
                       .intr(intr),
                       .int0(int0_i),
                       .int1(int1_i),
                       .reti(reti),
                       .int_src(int_src),

// t/c 0,1
        `ifdef OC8051_TC01
                       .t0(t0_i),
                       .t1(t1_i),
        `endif

// t/c 2
        `ifdef OC8051_TC2
                       .t2(t2_i),
                       .t2ex(t2ex_i),
        `endif
                       .dptr_hi(dptr_hi),
                       .dptr_lo(dptr_lo),
                       .wait_data(wait_data)
                       );

reg rd_addr_r, rd_ind;
always @(posedge wb_clk_i) begin
  if (wb_rst_i) begin
    rd_addr_r <= #1 1'b0;
  end else begin
    rd_addr_r <= #1 rd_addr[7];
  end
end 

always @(posedge wb_clk_i)
  if (wb_rst_i)
    rd_ind <= #1 1'b0;
  else if ((ram_rd_sel==`OC8051_RRS_I) || (ram_rd_sel==`OC8051_RRS_SP))
    rd_ind <= #1 1'b1;
  else
    rd_ind <= #1 1'b0;


always @(rd_addr_r or ram_data or sfr_out or bit_data or sfr_bit or rd_ind)
begin
  if (rd_addr_r && !rd_ind) begin
    ram_out = sfr_out;
    bit_out = sfr_bit;
  end else begin
    ram_out = ram_data;
    bit_out = bit_data;
  end
end


endmodule

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_sfr (rst, clk,
       adr0, adr1, dat0, 
       dat1, dat2, bit_in,
       des_acc,
       we, wr_bit,
       bit_out,
       wr_sfr, acc, b_reg,
       ram_wr_sel, ram_rd_sel, 
       sp, sp_w, 
       bank_sel, 
       desAc, desOv,
       srcAc, cy,
       psw_set, rmw,
       comp_sel,
       comp_wait,
       psw,
       p,

       p0_out,
       p0_in,
       p1_out,
       p1_in,
       p2_out,
       p2_in,
       p3_out,
       p3_in,



  `ifdef OC8051_UART
       rxd, txd,
  `endif

       int_ack, intr,
       int0, int1,
       int_src,
       reti,

  `ifdef OC8051_TC01
       t0, t1,
  `endif

  `ifdef OC8051_TC2
       t2, t2ex,
  `endif
        ie,

       dptr_hi, dptr_lo,
       wait_data);


input       rst,	// reset - pin
	    clk,	// clock - pin
            we,		// write enable
	    bit_in,
	    desAc,
	    desOv,
	    rmw;
input       int_ack,
            int0,
	    int1,
            reti,
	    wr_bit;
input [1:0] psw_set,
            wr_sfr,
	    comp_sel;
input [2:0] ram_rd_sel,
            ram_wr_sel;
input [7:0] adr0, 	//address 0 input
            adr1, 	//address 1 input
	    des_acc,
	    dat1,	//data 1 input (des1)
            dat2;	//data 2 input (des2)

output       bit_out,
             intr,
             srcAc,
	     cy,
	     wait_data,
	     comp_wait;
output [1:0] bank_sel;
output [7:0] dat0,	//data output
	     int_src,
	     dptr_hi,
	     dptr_lo,
	     acc,
             b_reg,
             psw; 
output       p;
output [7:0] sp,
             sp_w;

// ports
input  [7:0] p0_in;
output [7:0] p0_out;
wire   [7:0] p0_data;
input  [7:0] p1_in;
output [7:0] p1_out;
wire   [7:0] p1_data;
input  [7:0] p2_in;
output [7:0] p2_out;
wire   [7:0] p2_data;
input  [7:0] p3_in;
output [7:0] p3_out;
wire   [7:0] p3_data;


output [7:0] ie;

// serial interface
`ifdef OC8051_UART
input        rxd;
output       txd;
`endif

// timer/counter 0,1
`ifdef OC8051_TC01
input	     t0, t1;
`endif

// timer/counter 2
`ifdef OC8051_TC2
input	     t2, t2ex;
`endif

reg        bit_out, 
           wait_data;
reg [7:0]  dat0,
           adr0_r;

reg        wr_bit_r;
reg [2:0]  ram_wr_sel_r;


wire       p,
           uart_int,
	   tf0,
	   tf1,
	   tr0,
	   tr1,
           rclk,
           tclk,
	   brate2,
	   tc2_int;


wire [7:0] b_reg, 
           psw,

`ifdef OC8051_TC2
  // t/c 2
	   t2con, 
	   tl2, 
	   th2, 
	   rcap2l, 
	   rcap2h,
`endif

`ifdef OC8051_TC01
  // t/c 0,1
	   tmod, 
	   tl0, 
	   th0, 
	   tl1,
	   th1,
`endif

  // serial interface
`ifdef OC8051_UART
           scon, 
	   pcon, 
	   sbuf,
`endif

  //interrupt control
	   ie, 
	   tcon, 
	   ip;


reg        pres_ow;
reg [3:0]  prescaler;


assign cy = psw[7];
assign srcAc = psw [6];

wire [7:0] acc_cur, psw_next;

//
// accumulator
// ACC
oc8051_acc oc8051_acc1(.clk(clk), 
                       .rst(rst), 
		       .bit_in(bit_in), 
		       .data_in(des_acc),
		       .data2_in(dat2),
		       .wr(we),
		       .wr_bit(wr_bit_r),
		       .wr_sfr(wr_sfr),
		       .wr_addr(adr1),
		       .data_out(acc),
               .data_out_cur(acc_cur),
		       .p(p));


//
// b register
// B
oc8051_b_register oc8051_b_register (.clk(clk),
                                     .rst(rst),
				     .bit_in(bit_in),
				     .data_in(des_acc),
				     .wr(we), 
				     .wr_bit(wr_bit_r), 
				     .wr_addr(adr1),
				     .data_out(b_reg));

//
//stack pointer
// SP
oc8051_sp oc8051_sp1(.clk(clk), 
                     .rst(rst), 
		     .ram_rd_sel(ram_rd_sel), 
		     .ram_wr_sel(ram_wr_sel), 
		     .wr_addr(adr1), 
		     .wr(we), 
		     .wr_bit(wr_bit_r), 
		     .data_in(dat1), 
		     .sp_out(sp), 
		     .sp_w(sp_w));

//
//data pointer
// DPTR, DPH, DPL
oc8051_dptr oc8051_dptr1(.clk(clk), 
                         .rst(rst), 
			 .addr(adr1), 
			 .data_in(des_acc),
			 .data2_in(dat2), 
			 .wr(we), 
			 .wr_bit(wr_bit_r),
			 .data_hi(dptr_hi),
			 .data_lo(dptr_lo), 
			 .wr_sfr(wr_sfr));


//
//program status word
// PSW
oc8051_psw oc8051_psw1 (.clk(clk), 
                        .rst(rst), 
			.wr_addr(adr1), 
			.data_in(dat1),
			.wr(we), 
			.wr_bit(wr_bit_r), 
			.data_out(psw), 
			.p(p), 
			.cy_in(bit_in),
			.ac_in(desAc), 
			.ov_in(desOv), 
			.set(psw_set), 
                        .psw_next(psw_next),
			.bank_sel(bank_sel));

//
// ports
// P0, P1, P2, P3
  oc8051_ports oc8051_ports1(.clk(clk),
                           .rst(rst),
			   .bit_in(bit_in),
			   .data_in(dat1),
			   .wr(we),
			   .wr_bit(wr_bit_r),
			   .wr_addr(adr1),
			   .p0_out(p0_out),
			   .p0_in(p0_in),
			   .p0_data(p0_data),
			   .p1_out(p1_out),
			   .p1_in(p1_in),
			   .p1_data(p1_data),
			   .p2_out(p2_out),
			   .p2_in(p2_in),
			   .p2_data(p2_data),
			   .p3_out(p3_out),
			   .p3_in(p3_in),
			   .p3_data(p3_data),
			   .rmw(rmw));

//
// serial interface
// SCON, SBUF
`ifdef OC8051_UART
  oc8051_uart oc8051_uatr1 (.clk(clk), 
                            .rst(rst), 
			    .bit_in(bit_in),
			    .data_in(dat1), 
			    .wr(we), 
			    .wr_bit(wr_bit_r), 
			    .wr_addr(adr1),
			    .rxd(rxd), 
			    .txd(txd), 
		// interrupt
			    .intr(uart_int),
		// baud rate sources
			    .brate2(brate2),
			    .t1_ow(tf1),
			    .pres_ow(pres_ow),
			    .rclk(rclk),
			    .tclk(tclk),
		//registers
			    .scon(scon),
			    .pcon(pcon),
			    .sbuf(sbuf));
`else
  assign uart_int = 1'b0;
`endif

//
// interrupt control
// IP, IE, TCON
oc8051_int oc8051_int1 (.clk(clk), 
                        .rst(rst), 
			.wr_addr(adr1), 
			.bit_in(bit_in),
			.ack(int_ack), 
			.data_in(dat1),
			.wr(we), 
			.wr_bit(wr_bit_r),
			.tf0(tf0), 
			.tf1(tf1), 
			.t2_int(tc2_int), 
			.tr0(tr0), 
			.tr1(tr1),
			.ie0(int0), 
			.ie1(int1),
			.uart_int(uart_int),
			.reti(reti),
			.intr(intr),
			.int_vec(int_src),
			.ie(ie),
			.tcon(tcon), 
			.ip(ip));


//
// timer/counter control
// TH0, TH1, TL0, TH1, TMOD
`ifdef OC8051_TC01
  oc8051_tc oc8051_tc1(.clk(clk), 
                       .rst(rst), 
		       .wr_addr(adr1),
		       .data_in(dat1), 
		       .wr(we), 
		       .wr_bit(wr_bit_r), 
		       .ie0(int0), 
		       .ie1(int1), 
		       .tr0(tr0),
		       .tr1(tr1), 
		       .t0(t0), 
		       .t1(t1), 
		       .tf0(tf0), 
		       .tf1(tf1), 
		       .pres_ow(pres_ow),
		       .tmod(tmod), 
		       .tl0(tl0), 
		       .th0(th0), 
		       .tl1(tl1), 
		       .th1(th1));
`else
  assign tf0 = 1'b0;
  assign tf1 = 1'b0;
`endif

//
// timer/counter 2
// TH2, TL2, RCAPL2L, RCAPL2H, T2CON
`ifdef OC8051_TC2
  oc8051_tc2 oc8051_tc21(.clk(clk), 
                         .rst(rst), 
			 .wr_addr(adr1),
			 .data_in(dat1), 
			 .wr(we),
			 .wr_bit(wr_bit_r), 
			 .bit_in(bit_in), 
			 .t2(t2), 
			 .t2ex(t2ex),
			 .rclk(rclk), 
			 .tclk(tclk), 
			 .brate2(brate2), 
			 .tc2_int(tc2_int), 
			 .pres_ow(pres_ow),
			 .t2con(t2con), 
			 .tl2(tl2), 
			 .th2(th2), 
			 .rcap2l(rcap2l), 
			 .rcap2h(rcap2h));
`else
  assign tc2_int = 1'b0;
  assign rclk    = 1'b0;
  assign tclk    = 1'b0;
  assign brate2  = 1'b0;
`endif



always @(posedge clk )
  if (rst) begin
    adr0_r <= #1 8'h00;
    ram_wr_sel_r <= #1 3'b000;
    wr_bit_r <= #1 1'b0;
//    wait_data <= #1 1'b0;
  end else begin
    adr0_r <= #1 adr0;
    ram_wr_sel_r <= #1 ram_wr_sel;
    wr_bit_r <= #1 wr_bit;
  end

assign comp_wait = !(
                    ((comp_sel==`OC8051_CSS_AZ) &
		       ((wr_sfr==`OC8051_WRS_ACC1) |
		        (wr_sfr==`OC8051_WRS_ACC2) |
			((adr1==`OC8051_SFR_ACC) & we & !wr_bit_r) |
			((adr1[7:3]==`OC8051_SFR_B_ACC) & we & wr_bit_r))) |
		    ((comp_sel==`OC8051_CSS_CY) &
		       ((|psw_set) |
			((adr1==`OC8051_SFR_PSW) & we & !wr_bit_r) |
			((adr1[7:3]==`OC8051_SFR_B_PSW) & we & wr_bit_r))) |
		    ((comp_sel==`OC8051_CSS_BIT) &
		       ((adr1[7:3]==adr0[7:3]) & (~&adr1[2:0]) &  we & !wr_bit_r) |
		       ((adr1==adr0) & adr1[7] & we & !wr_bit_r)));



//
//set output in case of address (byte)
always @(posedge clk )
begin
  if (rst) begin
    dat0 <= #1 8'h00;
    wait_data <= #1 1'b0;
  end else if ((wr_sfr==`OC8051_WRS_DPTR) & (adr0==`OC8051_SFR_DPTR_LO)) begin				//write and read same address
    dat0 <= #1 des_acc;
    wait_data <= #1 1'b0;
  end else if (
      (
        ((wr_sfr==`OC8051_WRS_ACC1) & (adr0==`OC8051_SFR_ACC)) | 	//write to acc
//        ((wr_sfr==`OC8051_WRS_DPTR) & (adr0==`OC8051_SFR_DPTR_LO)) |	//write to dpl
        (adr1[7] & (adr1==adr0) & we & !wr_bit_r) |			//write and read same address
        (adr1[7] & (adr1[7:3]==adr0[7:3]) & (~&adr0[2:0]) &  we & wr_bit_r) //write bit addressable to read address
      ) & !wait_data) begin
    wait_data <= #1 1'b1;

  end else if ((
      ((|psw_set) & (adr0==`OC8051_SFR_PSW)) |
      ((wr_sfr==`OC8051_WRS_ACC2) & (adr0==`OC8051_SFR_ACC)) | 	//write to acc
      ((wr_sfr==`OC8051_WRS_DPTR) & (adr0==`OC8051_SFR_DPTR_HI))	//write to dph
      ) & !wait_data) begin
    wait_data <= #1 1'b1;

  end else begin
    case (adr0) 
      `OC8051_SFR_ACC: 		dat0 <= #1 acc;
      `OC8051_SFR_PSW: 		dat0 <= #1 psw;

      `OC8051_SFR_P0: 		dat0 <= #1 p0_data;
      `OC8051_SFR_P1: 		dat0 <= #1 p1_data;
      `OC8051_SFR_P2: 		dat0 <= #1 p2_data;
      `OC8051_SFR_P3: 		dat0 <= #1 p3_data;

      `OC8051_SFR_SP: 		dat0 <= #1 sp;
      `OC8051_SFR_B: 		dat0 <= #1 b_reg;
      `OC8051_SFR_DPTR_HI: 	dat0 <= #1 dptr_hi;
      `OC8051_SFR_DPTR_LO: 	dat0 <= #1 dptr_lo;

`ifdef OC8051_UART
      `OC8051_SFR_SCON: 	dat0 <= #1 scon;
      `OC8051_SFR_SBUF: 	dat0 <= #1 sbuf;
      `OC8051_SFR_PCON: 	dat0 <= #1 pcon;
`endif

`ifdef OC8051_TC01
      `OC8051_SFR_TH0: 		dat0 <= #1 th0;
      `OC8051_SFR_TH1: 		dat0 <= #1 th1;
      `OC8051_SFR_TL0: 		dat0 <= #1 tl0;
      `OC8051_SFR_TL1: 		dat0 <= #1 tl1;
      `OC8051_SFR_TMOD: 	dat0 <= #1 tmod;
`endif

      `OC8051_SFR_IP: 		dat0 <= #1 ip;
      `OC8051_SFR_IE: 		dat0 <= #1 ie;
      `OC8051_SFR_TCON: 	dat0 <= #1 tcon;

`ifdef OC8051_TC2
      `OC8051_SFR_RCAP2H: 	dat0 <= #1 rcap2h;
      `OC8051_SFR_RCAP2L: 	dat0 <= #1 rcap2l;
      `OC8051_SFR_TH2:    	dat0 <= #1 th2;
      `OC8051_SFR_TL2:    	dat0 <= #1 tl2;
      `OC8051_SFR_T2CON:  	dat0 <= #1 t2con;
`endif

      default: 			dat0 <= #1 8'h00;
    endcase
    wait_data <= #1 1'b0;
  end
end


//
//set output in case of address (bit)

wire port_rd = ( adr0[7:3] == `OC8051_SFR_B_P0 ||
                 adr0[7:3] == `OC8051_SFR_B_P1 ||
                 adr0[7:3] == `OC8051_SFR_B_P2 ||
                 adr0[7:3] == `OC8051_SFR_B_P3 );

wire valid_sfr = ( adr0[7:3] == `OC8051_SFR_B_ACC   ||
                   adr0[7:3] == `OC8051_SFR_B_PSW   ||
                   adr0[7:3] == `OC8051_SFR_B_B     ||
`ifdef OC8051_ENABLE_INT
                   adr0[7:3] == `OC8051_SFR_B_IP    ||
                   adr0[7:3] == `OC8051_SFR_B_IE    ||
                   adr0[7:3] == `OC8051_SFR_B_TCON  ||
`endif
`ifdef OC8051_UART
                   adr0[7:3] == `OC8051_SFR_B_SCON  ||
`endif
                   port_rd );

always @(posedge clk )
begin
  if (rst)
    bit_out <= #1 1'h0;
  else if ((adr1[7:3]==adr0[7:3]) & (~|adr1[2:0]) &  we & !wr_bit_r & (!port_rd | rmw) & valid_sfr)
    bit_out <= #1 dat1[adr0[2:0]];
  else if ((wr_sfr==`OC8051_WRS_ACC1) & (adr0[7:3]==`OC8051_SFR_B_ACC)) 	//write to acc
    bit_out <= #1 acc_cur[adr0[2:0]];
  else if ((adr1==adr0) & we & wr_bit_r & valid_sfr)
    bit_out <= #1 bit_in;
  else
    case (adr0[7:3]) 
      `OC8051_SFR_B_ACC:   bit_out <= #1 acc[adr0[2:0]];
      `OC8051_SFR_B_PSW:   bit_out <= #1 psw_next[adr0[2:0]];

`ifdef OC8051_PORTS
  `ifdef OC8051_PORT0
      `OC8051_SFR_B_P0:    bit_out <= #1 p0_data[adr0[2:0]];
  `endif

  `ifdef OC8051_PORT1
      `OC8051_SFR_B_P1:    bit_out <= #1 p1_data[adr0[2:0]];
  `endif

  `ifdef OC8051_PORT2
      `OC8051_SFR_B_P2:    bit_out <= #1 p2_data[adr0[2:0]];
  `endif

  `ifdef OC8051_PORT3
      `OC8051_SFR_B_P3:    bit_out <= #1 p3_data[adr0[2:0]];
  `endif
`endif

      `OC8051_SFR_B_B:     bit_out <= #1 b_reg[adr0[2:0]];
      `OC8051_SFR_B_IP:    bit_out <= #1 ip[adr0[2:0]];
      `OC8051_SFR_B_IE:    bit_out <= #1 ie[adr0[2:0]];
      `OC8051_SFR_B_TCON:  bit_out <= #1 tcon[adr0[2:0]];

`ifdef OC8051_UART
      `OC8051_SFR_B_SCON:  bit_out <= #1 scon[adr0[2:0]];
`endif

`ifdef OC8051_TC2
      `OC8051_SFR_B_T2CON: bit_out <= #1 t2con[adr0[2:0]];
`endif

      default:             bit_out <= #1 1'b0;
    endcase
end

always @(posedge clk )
begin
  if (rst) begin
    prescaler <= #1 4'h0;
    pres_ow <= #1 1'b0;
  end else if (prescaler==4'b1011) begin
    prescaler <= #1 4'h0;
    pres_ow <= #1 1'b1;
  end else begin
    prescaler <= #1 prescaler + 4'h1;
    pres_ow <= #1 1'b0;
  end
end

endmodule

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_acc (clk, rst, 
                 bit_in, data_in, data2_in, 
		 data_out, data_out_cur,
		 wr, wr_bit, wr_addr,
		 p, wr_sfr);


input clk, rst, wr, wr_bit, bit_in;
input [1:0] wr_sfr;
input [7:0] wr_addr, data_in, data2_in;

output p;
output [7:0] data_out;
output [7:0] data_out_cur;

reg [7:0] data_out;
reg [7:0] acc;

wire wr_acc, wr2_acc, wr_bit_acc;
//
//calculates parity
assign p = ^acc;
assign data_out_cur = acc;

assign wr_acc     = (wr_sfr==`OC8051_WRS_ACC1) | (wr & !wr_bit & (wr_addr==`OC8051_SFR_ACC));
assign wr2_acc    = (wr_sfr==`OC8051_WRS_ACC2);
assign wr_bit_acc = (wr & wr_bit & (wr_addr[7:3]==`OC8051_SFR_B_ACC));
//
//writing to acc
always @(wr_sfr or data2_in or wr2_acc or wr_acc or wr_bit_acc or wr_addr[2:0] or data_in or bit_in or data_out)
begin
  if (wr2_acc)
    acc = data2_in;
  else if (wr_acc)
    acc = data_in;
  else if (wr_bit_acc)
    case (wr_addr[2:0]) 
      3'b000: acc = {data_out[7:1], bit_in};
      3'b001: acc = {data_out[7:2], bit_in, data_out[0]};
      3'b010: acc = {data_out[7:3], bit_in, data_out[1:0]};
      3'b011: acc = {data_out[7:4], bit_in, data_out[2:0]};
      3'b100: acc = {data_out[7:5], bit_in, data_out[3:0]};
      3'b101: acc = {data_out[7:6], bit_in, data_out[4:0]};
      3'b110: acc = {data_out[7],   bit_in, data_out[5:0]};
      3'b111: acc = {bit_in, data_out[6:0]};
    endcase
  else
    acc = data_out;
end

always @(posedge clk)
begin
  if (rst)
    data_out <= #1 `OC8051_RST_ACC;
  else
    data_out <= #1 acc;
end


`ifdef OC8051_SIMULATION

always @(data_out)
  if (data_out===8'hxx) begin
    $display("time ",$time, "   failure: invalid write to ACC (oc8051_acc)");
    #22 $finish;

end


`endif


endmodule


// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_b_register (clk, rst, bit_in, data_in, wr, wr_bit,
              wr_addr, data_out);


input clk, rst, wr, wr_bit, bit_in;
input [7:0] wr_addr, data_in;

output [7:0] data_out;

reg [7:0] data_out;

//
//writing to b
//must check if write high and correct address
always @(posedge clk)
begin
  if (rst)
    data_out <= #1 `OC8051_RST_B;
  else if (wr) begin
    if (!wr_bit) begin
      if (wr_addr==`OC8051_SFR_B)
        data_out <= #1 data_in;
    end else begin
      if (wr_addr[7:3]==`OC8051_SFR_B_B)
        data_out[wr_addr[2:0]] <= #1 bit_in;
    end
  end
end

endmodule

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_dptr(clk, rst, addr, data_in, data2_in, wr, wr_sfr, wr_bit, data_hi, data_lo);
//
// clk          (in)  clock
// rst          (in)  reset
// addr         (in)  write address input [oc8051_ram_wr_sel.out]
// data_in      (in)  destination 1 from alu [oc8051_alu.des1]
// data2_in     (in)  destination 2 from alu [oc8051_alu.des2]
// wr           (in)  write to ram [oc8051_decoder.wr -r]
// wd2          (in)  write from destination 2 [oc8051_decoder.ram_wr_sel -r]
// wr_bit       (in)  write bit addresable [oc8051_decoder.bit_addr -r]
// data_hi      (out) output (high bits) [oc8051_alu_src3_sel.dptr, oc8051_ext_addr_sel.dptr_hi, oc8051_ram_sel.dptr_hi]
// data_lo      (out) output (low bits) [oc8051_ext_addr_sel.dptr_lo]
//


input clk, rst, wr, wr_bit;
input [1:0] wr_sfr;
input [7:0] addr, data_in, data2_in;

output [7:0] data_hi, data_lo;

reg [7:0] data_hi, data_lo;

always @(posedge clk)
begin
  if (rst) begin
    data_hi <= #1 `OC8051_RST_DPH;
    data_lo <= #1 `OC8051_RST_DPL;
  end else if (wr_sfr==`OC8051_WRS_DPTR) begin
//
//write from destination 2 and 1
    data_hi <= #1 data2_in;
    data_lo <= #1 data_in;
  end else if ((addr==`OC8051_SFR_DPTR_HI) & (wr) & !(wr_bit))
//
//case of writing to dptr
    data_hi <= #1 data_in;
  else if ((addr==`OC8051_SFR_DPTR_LO) & (wr) & !(wr_bit))
    data_lo <= #1 data_in;
end

endmodule


// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"



module oc8051_sp (clk, rst, ram_rd_sel, ram_wr_sel, wr_addr, wr, wr_bit, data_in, sp_out, sp_w);


input clk, rst, wr, wr_bit;
input [2:0] ram_rd_sel, ram_wr_sel;
input [7:0] data_in, wr_addr;
output [7:0] sp_out, sp_w;

reg [7:0] sp_out, sp_w;
reg pop;
wire write;
wire [7:0] sp_t;

reg [7:0] sp;


assign write = ((wr_addr==`OC8051_SFR_SP) & (wr) & !(wr_bit));

assign sp_t= write ? data_in : sp;


always @(posedge clk)
begin
  if (rst)
    sp <= #1 `OC8051_RST_SP;
  else if (write)
    sp <= #1 data_in;
  else
    sp <= #1 sp_out;
end


always @(sp or ram_wr_sel)
begin
//
// push
  if (ram_wr_sel==`OC8051_RWS_SP) sp_w = sp + 8'h01;
  else sp_w = sp;

end


always @(sp_t or ram_wr_sel or pop or write)
begin
//
// push
  if (write) sp_out = sp_t;
  else if (ram_wr_sel==`OC8051_RWS_SP) sp_out = sp_t + 8'h01;
  else sp_out = sp_t - {7'b0, pop};

end


always @(posedge clk)
begin
  if (rst)
    pop <= #1 1'b0;
  else if (ram_rd_sel==`OC8051_RRS_SP) pop <= #1 1'b1;
  else pop <= #1 1'b0;
end

endmodule


// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_psw (clk, rst, wr_addr, data_in, wr, wr_bit, data_out, p,
                cy_in, ac_in, ov_in, set, bank_sel, psw_next);
//
// clk          (in)  clock
// rst          (in)  reset
// addr         (in)  write address [oc8051_ram_wr_sel.out]
// data_in      (in)  data input [oc8051_alu.des1]
// wr           (in)  write [oc8051_decoder.wr -r]
// wr_bit       (in)  write bit addresable [oc8051_decoder.bit_addr -r]
// p            (in)  parity [oc8051_acc.p]
// cy_in        (in)  input bit data [oc8051_alu.desCy]
// ac_in        (in)  auxiliary carry input [oc8051_alu.desAc]
// ov_in        (in)  overflov input [oc8051_alu.desOv]
// set          (in)  set psw (write to caryy, carry and overflov or carry, owerflov and ac) [oc8051_decoder.psw_set -r]
//


input clk, rst, wr, p, cy_in, ac_in, ov_in, wr_bit;
input [1:0] set;
input [7:0] wr_addr, data_in;

output [1:0] bank_sel;
output [7:0] data_out;
output [7:0] psw_next;

reg [7:1] data;
wire wr_psw;

assign wr_psw = (wr & (wr_addr==`OC8051_SFR_PSW) && !wr_bit);

assign bank_sel = wr_psw ? data_in[4:3]:data[4:3];
assign data_out = {data[7:1], p};

reg [7:1] psw_next_i;
wire [7:0] psw_next = {psw_next_i, p};

// spramod added this always block to resolve forwarding issues in the PSW.
always @(data or wr or wr_bit or wr_addr or cy_in or data_in or set or ov_in or ac_in)
begin
    psw_next_i = data;

    if (wr & (wr_bit==1'b0) & (wr_addr==`OC8051_SFR_PSW))
      psw_next_i[7:1] = data_in[7:1];
//
// write to psw (bit addressable)
    else if (wr & wr_bit & (wr_addr[7:3]==`OC8051_SFR_B_PSW))
      psw_next_i[wr_addr[2:0]] = cy_in;
    else begin
      case (set) 
        `OC8051_PS_CY: begin
//
//write carry
          psw_next_i[7] = cy_in;
        end
        `OC8051_PS_OV: begin
//
//write carry and overflov
          psw_next_i[7] = cy_in;
          psw_next_i[2] = ov_in;
        end
        `OC8051_PS_AC:begin
//
//write carry, overflov and ac
          psw_next_i[7] = cy_in;
          psw_next_i[6] = ac_in;
          psw_next_i[2] = ov_in;
        end
      endcase
    end
end

//
//case writing to psw
always @(posedge clk)
begin
  if (rst)
    data <= #1 `OC8051_RST_PSW;

//
// write to psw (byte addressable)
  else begin
    if (wr & (wr_bit==1'b0) & (wr_addr==`OC8051_SFR_PSW))
      data[7:1] <= #1 data_in[7:1];
//
// write to psw (bit addressable)
    else if (wr & wr_bit & (wr_addr[7:3]==`OC8051_SFR_B_PSW))
      data[wr_addr[2:0]] <= #1 cy_in;
    else begin
      case (set) 
        `OC8051_PS_CY: begin
//
//write carry
          data[7] <= #1 cy_in;
        end
        `OC8051_PS_OV: begin
//
//write carry and overflov
          data[7] <= #1 cy_in;
          data[2] <= #1 ov_in;
        end
        `OC8051_PS_AC:begin
//
//write carry, overflov and ac
          data[7] <= #1 cy_in;
          data[6] <= #1 ac_in;
          data[2] <= #1 ov_in;

        end
      endcase
    end
  end
end

endmodule


// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_ports (clk, 
                    rst,
                    bit_in, 
		    data_in,
		    wr, 
		    wr_bit,
		    wr_addr, 

	//`ifdef OC8051_PORT0
		    p0_out,
                    p0_in,
		    p0_data,
	//`endif

	//`ifdef OC8051_PORT1
		    p1_out,
		    p1_in,
		    p1_data,

	//`endif

	//`ifdef OC8051_PORT2
		    p2_out,
		    p2_in,
		    p2_data,
	//`endif

	//`ifdef OC8051_PORT3
		    p3_out,
		    p3_in,
		    p3_data,
	//`endif

		    rmw);

input        clk,	//clock
             rst,	//reset
	     wr,	//write [oc8051_decoder.wr -r]
	     wr_bit,	//write bit addresable [oc8051_decoder.bit_addr -r]
	     bit_in,	//bit input [oc8051_alu.desCy]
	     rmw;	//read modify write feature [oc8051_decoder.rmw]
input [7:0]  wr_addr,	//write address [oc8051_ram_wr_sel.out]
             data_in; 	//data input (from alu destiantion 1) [oc8051_alu.des1]

//`ifdef OC8051_PORT0
  input  [7:0] p0_in;
  output [7:0] p0_out,
               p0_data;
  reg    [7:0] p0_out;

  assign p0_data = rmw ? p0_out : p0_in;
////`endif


//`ifdef OC8051_PORT1
  input  [7:0] p1_in;
  output [7:0] p1_out,
               p1_data;
  reg    [7:0] p1_out;

  assign p1_data = rmw ? p1_out : p1_in;
////`endif


//`ifdef OC8051_PORT2
  input  [7:0] p2_in;
  output [7:0] p2_out,
	       p2_data;
  reg    [7:0] p2_out;

  assign p2_data = rmw ? p2_out : p2_in;
////`endif


//`ifdef OC8051_PORT3
  input  [7:0] p3_in;
  output [7:0] p3_out,
	       p3_data;
  reg    [7:0] p3_out;

  assign p3_data = rmw ? p3_out : p3_in;
////`endif

//
// case of writing to port
always @(posedge clk)
begin
  if (rst) begin
////`ifdef OC8051_PORT0
    p0_out <= #1 `OC8051_RST_P0;
//`endif

//`ifdef OC8051_PORT1
    p1_out <= #1 `OC8051_RST_P1;
//`endif

//`ifdef OC8051_PORT2
    p2_out <= #1 `OC8051_RST_P2;
//`endif

//`ifdef OC8051_PORT3
    p3_out <= #1 `OC8051_RST_P3;
//`endif
  end else if (wr) begin
    if (!wr_bit) begin
      case (wr_addr) 
//
// bytaddresable
////`ifdef OC8051_PORT0
        `OC8051_SFR_P0: p0_out <= #1 data_in;
//`endif

////`ifdef OC8051_PORT1
        `OC8051_SFR_P1: p1_out <= #1 data_in;
//`endif

////`ifdef OC8051_PORT2
        `OC8051_SFR_P2: p2_out <= #1 data_in;
//`endif

////`ifdef OC8051_PORT3
        `OC8051_SFR_P3: p3_out <= #1 data_in;
//`endif
      endcase
    end else begin
      case (wr_addr[7:3]) 

//
// bit addressable
////`ifdef OC8051_PORT0
        `OC8051_SFR_B_P0: p0_out[wr_addr[2:0]] <= #1 bit_in;
//`endif

////`ifdef OC8051_PORT1
        `OC8051_SFR_B_P1: p1_out[wr_addr[2:0]] <= #1 bit_in;
//`endif

////`ifdef OC8051_PORT2
        `OC8051_SFR_B_P2: p2_out[wr_addr[2:0]] <= #1 bit_in;
//`endif

////`ifdef OC8051_PORT3
        `OC8051_SFR_B_P3: p3_out[wr_addr[2:0]] <= #1 bit_in;
//`endif
      endcase
    end
  end
end


endmodule


`include "oc8051_defines.v"

//synopsys translate_off
`include "oc8051_timescale.v"
//synopsys translate_on



module oc8051_int (clk, rst, 
        wr_addr,  
	data_in, bit_in, 
	wr, wr_bit,
//timer interrupts
        tf0, tf1, t2_int,
	tr0, tr1,
//external interrupts
        ie0, ie1,
//uart interrupts
        uart_int,
//to cpu
        intr, reti, int_vec, ack,
//registers
	ie, tcon, ip);

input [7:0] wr_addr, data_in;
input wr, tf0, tf1, t2_int, ie0, ie1, clk, rst, reti, wr_bit, bit_in, ack, uart_int;

output tr0, tr1, intr;
output [7:0] int_vec,
             ie,
	     tcon,
	     ip;


`ifdef OC8051_ENABLE_INT

reg [7:0] ip, ie, int_vec;
reg [3:0] tcon_s;
reg tcon_tf1, tcon_tf0, tcon_ie1, tcon_ie0;

//
// isrc		processing interrupt sources
// int_dept
wire [2:0] isrc_cur;
reg [2:0] isrc [1:0];
reg [1:0] int_dept;
wire [1:0] int_dept_1;
reg int_proc;
reg [1:0] int_lev [1:0];
wire cur_lev;

assign isrc_cur = int_proc ? isrc[int_dept_1] : 2'h0;
assign int_dept_1 = int_dept - 2'b01;
assign cur_lev = int_lev[int_dept_1];

//
// contains witch level of interrupts is running
//reg [1:0] int_levl, int_levl_w;

//
// int_ln	waiting interrupts on level n
// ip_ln	interrupts on level n
// int_src	interrupt sources
wire [5:0] int_l0, int_l1;
wire [5:0] ip_l0, ip_l1;
wire [5:0] int_src;
wire il0, il1;


reg tf0_buff, tf1_buff, ie0_buff, ie1_buff;

//
//interrupt priority
assign ip_l0 = ~ip[5:0];
assign ip_l1 = ip[5:0];

assign int_src = {t2_int, uart_int, tcon_tf1, tcon_ie1, tcon_tf0, tcon_ie0};

//
// waiting interrupts
assign int_l0 = ip_l0 & {ie[5:0]} & int_src;
assign int_l1 = ip_l1 & {ie[5:0]} & int_src;
assign il0 = |int_l0;
assign il1 = |int_l1;

//
// TCON
assign tcon = {tcon_tf1, tcon_s[3], tcon_tf0, tcon_s[2], tcon_ie1, tcon_s[1], tcon_ie0, tcon_s[0]};
assign tr0 = tcon_s[2];
assign tr1 = tcon_s[3];
assign intr = |int_vec;


//
// IP
always @(posedge clk)
begin
 if (rst) begin
   ip <=#1 `OC8051_RST_IP;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_IP)) begin
   ip <= #1 data_in;
 end else if ((wr) & (wr_bit) & (wr_addr[7:3]==`OC8051_SFR_B_IP))
   ip[wr_addr[2:0]] <= #1 bit_in;
end

//
// IE
always @(posedge clk)
begin
 if (rst) begin
   ie <=#1 `OC8051_RST_IE;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_IE)) begin
   ie <= #1 data_in;
 end else if ((wr) & (wr_bit) & (wr_addr[7:3]==`OC8051_SFR_B_IE))
   ie[wr_addr[2:0]] <= #1 bit_in;
end

//
// tcon_s
//
always @(posedge clk)
begin
 if (rst) begin
   tcon_s <=#1 4'b0000;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_TCON)) begin
   tcon_s <= #1 {data_in[6], data_in[4], data_in[2], data_in[0]};
 end else if ((wr) & (wr_bit) & (wr_addr[7:3]==`OC8051_SFR_B_TCON)) begin
   case (wr_addr[2:0]) 
     3'b000: tcon_s[0] <= #1 bit_in;
     3'b010: tcon_s[1] <= #1 bit_in;
     3'b100: tcon_s[2] <= #1 bit_in;
     3'b110: tcon_s[3] <= #1 bit_in;
   endcase
 end
end

//
// tf1 (tmod.7)
//
always @(posedge clk)
begin
 if (rst) begin
   tcon_tf1 <=#1 1'b0;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_TCON)) begin
   tcon_tf1 <= #1 data_in[7];
 end else if ((wr) & (wr_bit) & (wr_addr=={`OC8051_SFR_B_TCON, 3'b111})) begin
   tcon_tf1 <= #1 bit_in;
 end else if (!(tf1_buff) & (tf1)) begin
   tcon_tf1 <= #1 1'b1;
 end else if (ack & (isrc_cur==`OC8051_ISRC_TF1)) begin
   tcon_tf1 <= #1 1'b0;
 end
end

//
// tf0 (tmod.5)
//
always @(posedge clk)
begin
 if (rst) begin
   tcon_tf0 <=#1 1'b0;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_TCON)) begin
   tcon_tf0 <= #1 data_in[5];
 end else if ((wr) & (wr_bit) & (wr_addr=={`OC8051_SFR_B_TCON, 3'b101})) begin
   tcon_tf0 <= #1 bit_in;
 end else if (!(tf0_buff) & (tf0)) begin
   tcon_tf0 <= #1 1'b1;
 end else if (ack & (isrc_cur==`OC8051_ISRC_TF0)) begin
   tcon_tf0 <= #1 1'b0;
 end
end


//
// ie0 (tmod.1)
//
always @(posedge clk)
begin
 if (rst) begin
   tcon_ie0 <=#1 1'b0;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_TCON)) begin
   tcon_ie0 <= #1 data_in[1];
 end else if ((wr) & (wr_bit) & (wr_addr=={`OC8051_SFR_B_TCON, 3'b001})) begin
   tcon_ie0 <= #1 bit_in;
 end else if (((tcon_s[0]) & (ie0_buff) & !(ie0)) | (!(tcon_s[0]) & !(ie0))) begin
   tcon_ie0 <= #1 1'b1;
 end else if (ack & (isrc_cur==`OC8051_ISRC_IE0) & (tcon_s[0])) begin
   tcon_ie0 <= #1 1'b0;
 end else if (!(tcon_s[0]) & (ie0)) begin
   tcon_ie0 <= #1 1'b0;
 end
end


//
// ie1 (tmod.3)
//
always @(posedge clk)
begin
 if (rst) begin
   tcon_ie1 <=#1 1'b0;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_TCON)) begin
   tcon_ie1 <= #1 data_in[3];
 end else if ((wr) & (wr_bit) & (wr_addr=={`OC8051_SFR_B_TCON, 3'b011})) begin
   tcon_ie1 <= #1 bit_in;
 end else if (((tcon_s[1]) & (ie1_buff) & !(ie1)) | (!(tcon_s[1]) & !(ie1))) begin
   tcon_ie1 <= #1 1'b1;
 end else if (ack & (isrc_cur==`OC8051_ISRC_IE1) & (tcon_s[1])) begin
   tcon_ie1 <= #1 1'b0;
 end else if (!(tcon_s[1]) & (ie1)) begin
   tcon_ie1 <= #1 1'b0;
 end
end

//
// interrupt processing
always @(posedge clk)
begin
  if (rst) begin
    int_vec <= #1 8'h00;
    int_dept <= #1 2'b0;
    isrc[0] <= #1 3'h0;
    isrc[1] <= #1 3'h0;
    int_proc <= #1 1'b0;
    int_lev[0] <= #1 1'b0;
    int_lev[1] <= #1 1'b0;
  end else if (reti & int_proc) begin  // return from interrupt
   if (int_dept==2'b01)
     int_proc <= #1 1'b0;
   int_dept <= #1 int_dept - 2'b01;
  end else if (((ie[7]) & (!cur_lev) || !int_proc) & il1) begin  // interrupt on level 1
   int_proc <= #1 1'b1;
   int_lev[int_dept] <= #1 `OC8051_ILEV_L1;
   int_dept <= #1 int_dept + 2'b01;
   if (int_l1[0]) begin
     int_vec <= #1 `OC8051_INT_X0;
     isrc[int_dept] <= #1 `OC8051_ISRC_IE0;
   end else if (int_l1[1]) begin
     int_vec <= #1 `OC8051_INT_T0;
     isrc[int_dept] <= #1 `OC8051_ISRC_TF0;
   end else if (int_l1[2]) begin
     int_vec <= #1 `OC8051_INT_X1;
     isrc[int_dept] <= #1 `OC8051_ISRC_IE1;
   end else if (int_l1[3]) begin
     int_vec <= #1 `OC8051_INT_T1;
     isrc[int_dept] <= #1 `OC8051_ISRC_TF1;
   end else if (int_l1[4]) begin
     int_vec <= #1 `OC8051_INT_UART;
     isrc[int_dept] <= #1 `OC8051_ISRC_UART;
   end else if (int_l1[5]) begin
     int_vec <= #1 `OC8051_INT_T2;
     isrc[int_dept] <= #1 `OC8051_ISRC_T2;
   end

 end else if ((ie[7]) & !int_proc & il0) begin  // interrupt on level 0
   int_proc <= #1 1'b1;
   int_lev[int_dept] <= #1 `OC8051_ILEV_L0;
   int_dept <= #1 2'b01;
   if (int_l0[0]) begin
     int_vec <= #1 `OC8051_INT_X0;
     isrc[int_dept] <= #1 `OC8051_ISRC_IE0;
   end else if (int_l0[1]) begin
     int_vec <= #1 `OC8051_INT_T0;
     isrc[int_dept] <= #1 `OC8051_ISRC_TF0;
   end else if (int_l0[2]) begin
     int_vec <= #1 `OC8051_INT_X1;
     isrc[int_dept] <= #1 `OC8051_ISRC_IE1;
   end else if (int_l0[3]) begin
     int_vec <= #1 `OC8051_INT_T1;
     isrc[int_dept] <= #1 `OC8051_ISRC_TF1;
   end else if (int_l0[4]) begin
     int_vec <= #1 `OC8051_INT_UART;
     isrc[int_dept] <= #1 `OC8051_ISRC_UART;
   end else if (int_l0[5]) begin
     int_vec <= #1 `OC8051_INT_T2;
     isrc[int_dept] <= #1 `OC8051_ISRC_T2;
   end
 end else begin
   int_vec <= #1 8'h00;
 end
end


always @(posedge clk)
  if (rst) begin
    tf0_buff <= #1 1'b0;
    tf1_buff <= #1 1'b0;
    ie0_buff <= #1 1'b0;
    ie1_buff <= #1 1'b0;
  end else begin
    tf0_buff <= #1 tf0;
    tf1_buff <= #1 tf1;
    ie0_buff <= #1 ie0;
    ie1_buff <= #1 ie1;
  end
`else
    wire tr0  = 1'b0;
    wire tr1  = 1'b0;
    wire intr = 1'b0;
    reg [7:0] int_vec = 8'b0;
    wire [7:0] ie = 8'b0;
    wire [7:0] ip = 8'b0;
    wire [7:0] tcon = 8'b0;
`endif
endmodule

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_ram_top (clk, 
                       rst, 
		       rd_addr, 
		       rd_data, 
		       wr_addr, 
		       bit_addr, 
		       wr_data, 
		       wr, 
		       bit_data_in, 
		       bit_data_out,
                       iram
`ifdef OC8051_BIST
         ,
         scanb_rst,
         scanb_clk,
         scanb_si,
         scanb_so,
         scanb_en
`endif
		       );

// on-chip ram-size (2**ram_aw bytes)
parameter ram_aw = 8; // default 256 bytes


//
// clk          (in)  clock
// rd_addr      (in)  read addres [oc8051_ram_rd_sel.out]
// rd_data      (out) read data [oc8051_ram_sel.in_ram]
// wr_addr      (in)  write addres [oc8051_ram_wr_sel.out]
// bit_addr     (in)  bit addresable instruction [oc8051_decoder.bit_addr -r]
// wr_data      (in)  write data [oc8051_alu.des1]
// wr           (in)  write [oc8051_decoder.wr -r]
// bit_data_in  (in)  bit data input [oc8051_alu.desCy]
// bit_data_out (out)  bit data output [oc8051_ram_sel.bit_in]
//

input clk, wr, bit_addr, bit_data_in, rst;
input [7:0] wr_data;
input [7:0] rd_addr, wr_addr;
output bit_data_out;
output [7:0] rd_data;

output [2047:0] iram;

`ifdef OC8051_BIST
input   scanb_rst;
input   scanb_clk;
input   scanb_si;
output  scanb_so;
input   scanb_en;
`endif

// rd_addr_m    read address modified
// wr_addr_m    write address modified
// wr_data_m    write data modified
reg [7:0] wr_data_m;
reg [7:0] rd_addr_m, wr_addr_m;


wire       rd_en;
reg        bit_addr_r,
           rd_en_r;
reg  [7:0] wr_data_r;
wire [7:0] rd_data_m;
reg  [2:0] bit_select;

assign bit_data_out = rd_data[bit_select];


assign rd_data = rd_en_r ? wr_data_r: rd_data_m;
assign rd_en   = (rd_addr_m == wr_addr_m) & wr;

oc8051_ram_256x8_two_bist oc8051_idata(
                           .clk     ( clk        ),
                           .rst     ( rst        ),
			   .rd_addr ( rd_addr_m  ),
			   .rd_data ( rd_data_m  ),
			   .rd_en   ( !rd_en     ),
			   .wr_addr ( wr_addr_m  ),
			   .wr_data ( wr_data_m  ),
			   .wr_en   ( 1'b1       ),
			   .wr      ( wr         ),
                           .iram    ( iram       )
`ifdef OC8051_BIST
         ,
         .scanb_rst(scanb_rst),
         .scanb_clk(scanb_clk),
         .scanb_si(scanb_si),
         .scanb_so(scanb_so),
         .scanb_en(scanb_en)
`endif
			   );

always @(posedge clk)
  if (rst) begin
    bit_addr_r <= #1 1'b0;
    bit_select <= #1 3'b0;
  end else begin
    bit_addr_r <= #1 bit_addr;
    bit_select <= #1 rd_addr[2:0];
  end


always @(posedge clk )
  if (rst) begin
    rd_en_r    <= #1 1'b0;
    wr_data_r  <= #1 8'h0;
  end else begin
    rd_en_r    <= #1 rd_en;
    wr_data_r  <= #1 wr_data_m;
  end


always @(rd_addr or bit_addr)
  casex ( {bit_addr, rd_addr[7]} ) 
      2'b0?: rd_addr_m = rd_addr;
      2'b10: rd_addr_m = {4'b0010, rd_addr[6:3]};
      2'b11: rd_addr_m = {1'b1, rd_addr[6:3], 3'b000};
  endcase


always @(wr_addr or bit_addr_r)
  casex ( {bit_addr_r, wr_addr[7]} ) 
      2'b0?: wr_addr_m = wr_addr;
      2'b10: wr_addr_m = {8'h00, 4'b0010, wr_addr[6:3]};
      2'b11: wr_addr_m = {8'h00, 1'b1, wr_addr[6:3], 3'b000};
  endcase


always @(rd_data or bit_select or bit_data_in or wr_data or bit_addr_r)
  casex ( {bit_addr_r, bit_select} ) 
      4'b0_???: wr_data_m = wr_data;
      4'b1_000: wr_data_m = {rd_data[7:1], bit_data_in};
      4'b1_001: wr_data_m = {rd_data[7:2], bit_data_in, rd_data[0]};
      4'b1_010: wr_data_m = {rd_data[7:3], bit_data_in, rd_data[1:0]};
      4'b1_011: wr_data_m = {rd_data[7:4], bit_data_in, rd_data[2:0]};
      4'b1_100: wr_data_m = {rd_data[7:5], bit_data_in, rd_data[3:0]};
      4'b1_101: wr_data_m = {rd_data[7:6], bit_data_in, rd_data[4:0]};
      4'b1_110: wr_data_m = {rd_data[7], bit_data_in, rd_data[5:0]};
      4'b1_111: wr_data_m = {bit_data_in, rd_data[6:0]};
  endcase


endmodule

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"

//
// two port ram
//
module oc8051_ram_256x8_two_bist (
                     clk,
                     rst,
		     rd_addr,
		     rd_data,
		     rd_en,
		     wr_addr,
		     wr_data,
		     wr_en,
		     wr,
                     iram
`ifdef OC8051_BIST
	 ,
         scanb_rst,
         scanb_clk,
         scanb_si,
         scanb_so,
         scanb_en
`endif
		     );


input         clk, 
              wr, 
	      rst,
	      rd_en,
	      wr_en;
input  [7:0]  wr_data;
input  [7:0]  rd_addr,
              wr_addr;
output [7:0]  rd_data;
output [2047:0] iram;

// yx_verif 16-Byte Assumption
wire [7:0] wr_addr_yx;
wire [7:0] rd_addr_yx;
assign wr_addr_yx = wr_addr;//[3:0];
assign rd_addr_yx = rd_addr;//[3:0];


`ifdef OC8051_BIST
input   scanb_rst;
input   scanb_clk;
input   scanb_si;
output  scanb_so;
input   scanb_en;
`endif


`ifdef OC8051_RAM_XILINX
  xilinx_ram_dp xilinx_ram(
  	// read port
  	.CLKA(clk),
  	.RSTA(rst),
  	.ENA(rd_en),
  	.ADDRA(rd_addr),
  	.DIA(8'h00),
  	.WEA(1'b0),
  	.DOA(rd_data),
  
  	// write port
  	.CLKB(clk),
  	.RSTB(rst),
  	.ENB(wr_en),
  	.ADDRB(wr_addr),
  	.DIB(wr_data),
  	.WEB(wr),
  	.DOB()
  );
  
  defparam
  	xilinx_ram.dwidth = 8,
  	xilinx_ram.awidth = 8;

`else

  `ifdef OC8051_RAM_VIRTUALSILICON

  `else

    `ifdef OC8051_RAM_GENERIC
    
      generic_dpram #(8, 8) oc8051_ram1(
      	.rclk  ( clk            ),
      	.rrst  ( rst            ),
      	.rce   ( rd_en          ),
      	.oe    ( 1'b1           ),
      	.raddr ( rd_addr        ),
      	.do    ( rd_data        ),
      
      	.wclk  ( clk            ),
      	.wrst  ( rst            ),
      	.wce   ( wr_en          ),
      	.we    ( wr             ),
      	.waddr ( wr_addr        ),
      	.di    ( wr_data        )
      );
    
    `else

      reg    [7:0]  rd_data;
      //
      // buffer
      reg    [7:0]  buff [0:256];
      
      
      //
      // writing to ram
      integer i;
      always @(posedge clk)
      begin
       if (wr)
           // yx_verif 16BYTE
          buff[wr_addr_yx] <= #1 wr_data;
      end
      
      wire [2047:0] iram;
      genvar j;
      // yx_verif
      generate for (j=0; j < 256; j = j+1) begin:iramout
        assign iram[j*8+7 : j*8] = buff[j];
      end endgenerate
      //
      // reading from ram
      always @(posedge clk )
      begin
        if (rst) begin
          rd_data <= #1 8'h0;
`ifdef OC8051_SIMULATION
          for(i=0;i < 256;i=i+1) begin
              buff[i] = 0;
          end
`endif
        end
	//  yx_verif 16BYTE //yx dac
        else if ((wr_addr==rd_addr) & wr & rd_en)
          rd_data <= #1 wr_data;
        else if (rd_en)
          rd_data <= #1 buff[rd_addr_yx];
      end
    `endif  //OC8051_RAM_GENERIC
  `endif    //OC8051_RAM_VIRTUALSILICON  
`endif      //OC8051_RAM_XILINX

wire [7:0] buf40 = buff[8'h40];
wire [7:0] buf00 = buff[8'h00];
wire [7:0] buf01 = buff[8'h01];

endmodule

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"



module oc8051_alu (clk, rst, op_code, src1, src2, src3, srcCy, srcAc, bit_in, 
                  des1, des2, des_acc, desCy, desAc, desOv, sub_result);
//
// op_code      (in)  operation code [oc8051_decoder.alu_op -r]
// src1         (in)  first operand [oc8051_alu_src1_sel.des]
// src2         (in)  second operand [oc8051_alu_src2_sel.des]
// src3         (in)  third operand [oc8051_alu_src3_sel.des]
// srcCy        (in)  carry input [oc8051_cy_select.data_out]
// srcAc        (in)  auxiliary carry input [oc8051_psw.data_out[6] ]
// bit_in       (in)  bit input, used for logic operatins on bits [oc8051_ram_sel.bit_out]
// des1         (out)
// des2         (out)
// desCy        (out) carry output [oc8051_ram_top.bit_data_in, oc8051_acc.bit_in, oc8051_b_register.bit_in, oc8051_psw.cy_in, oc8051_ports.bit_in]
// desAc        (out) auxiliary carry output [oc8051_psw.ac_in]
// desOv        (out) Overflow output [oc8051_psw.ov_in]
//

input        srcCy, srcAc, bit_in, clk, rst;
input  [3:0] op_code;
input  [7:0] src1, src2, src3;
output       desCy, desAc, desOv;
output [7:0] des1, des2, des_acc, sub_result;

reg desCy, desAc, desOv;
reg [7:0] des1, des2, des_acc;


//
//add
//
wire [4:0] add1, add2, add3, add4;
wire [3:0] add5, add6, add7, add8;
wire [1:0] add9, adda, addb, addc;

//
//sub
//
wire [4:0] sub1, sub2, sub3, sub4;
wire [3:0] sub5, sub6, sub7, sub8;
wire [1:0] sub9, suba, subb, subc;
wire [7:0] sub_result;

//
//mul
//
  wire [7:0] mulsrc1, mulsrc2;
  wire mulOv;
  reg enable_mul;

//
//div
//
wire [7:0] divsrc1,divsrc2;
wire divOv;
reg enable_div;

//
//da
//
reg da_tmp, da_tmp1;
//reg [8:0] da1;

//
// inc
//
wire [15:0] inc, dec;

oc8051_multiply oc8051_mul1(.clk(clk), .rst(rst), .enable(enable_mul), .src1(src1), .src2(src2), .des1(mulsrc1), .des2(mulsrc2), .desOv(mulOv));
oc8051_divide oc8051_div1(.clk(clk), .rst(rst), .enable(enable_div), .src1(src1), .src2(src2), .des1(divsrc1), .des2(divsrc2), .desOv(divOv));

/* Add */
assign add1 = {1'b0,src1[3:0]};
assign add2 = {1'b0,src2[3:0]};
assign add3 = {3'b000,srcCy};
assign add4 = add1+add2+add3;

assign add5 = {1'b0,src1[6:4]};
assign add6 = {1'b0,src2[6:4]};
assign add7 = {1'b0,1'b0,1'b0,add4[4]};
assign add8 = add5+add6+add7;

assign add9 = {1'b0,src1[7]};
assign adda = {1'b0,src2[7]};
assign addb = {1'b0,add8[3]};
assign addc = add9+adda+addb;

/* Sub */
assign sub1 = {1'b1,src1[3:0]};
assign sub2 = {1'b0,src2[3:0]};
assign sub3 = {1'b0,1'b0,1'b0,srcCy};
assign sub4 = sub1-sub2-sub3;

assign sub5 = {1'b1,src1[6:4]};
assign sub6 = {1'b0,src2[6:4]};
assign sub7 = {1'b0,1'b0,1'b0, !sub4[4]};
assign sub8 = sub5-sub6-sub7;

assign sub9 = {1'b1,src1[7]};
assign suba = {1'b0,src2[7]};
assign subb = {1'b0,!sub8[3]};
assign subc = sub9-suba-subb;

assign sub_result = {subc[0],sub8[2:0],sub4[3:0]};

/* inc */
assign inc = {src2, src1} + {15'h0, 1'b1};
assign dec = {src2, src1} - {15'h0, 1'b1};

always @(op_code or src1 or src2 or srcCy or srcAc or bit_in or src3 or mulsrc1
      or mulsrc2 or mulOv or divsrc1 or divsrc2 or divOv or addc or add8 or add4
      or sub4 or sub8 or subc or da_tmp or inc or dec or sub_result)
begin

  case (op_code) 
//operation add
    `OC8051_ALU_ADD: begin
      des_acc = {addc[0],add8[2:0],add4[3:0]};
      des1 = src1;
      des2 = src3+ {7'b0, addc[1]};
      desCy = addc[1];
      desAc = add4[4];
      desOv = addc[1] ^ add8[3];

      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation subtract
    `OC8051_ALU_SUB: begin
      des_acc = sub_result;
//      des1 = sub_result;
      des1 = 8'h00;
      des2 = 8'h00;
      desCy = !subc[1];
      desAc = !sub4[4];
      desOv = !subc[1] ^ !sub8[3];

      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation multiply
    `OC8051_ALU_MUL: begin
      des_acc = mulsrc1;
      des1 = src1;
      des2 = mulsrc2;
      desOv = mulOv;
      desCy = 1'b0;
      desAc = 1'b0;
      enable_mul = 1'b1;
      enable_div = 1'b0;
    end
//operation divide
    `OC8051_ALU_DIV: begin
      des_acc = divsrc1;
      des1 = src1;
      des2 = divsrc2;
      desOv = divOv;
      desAc = 1'b0;
      desCy = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b1;
    end
//operation decimal adjustment
    `OC8051_ALU_DA: begin

      if ((srcAc==1'b1) | (src1[3:0]>4'b1001)) {da_tmp, des_acc[3:0]} = {1'b0, src1[3:0]}+ 5'b00110;
      else {da_tmp, des_acc[3:0]} = {1'b0, src1[3:0]};

      if (srcCy | da_tmp | (src1[7:4]>4'b1001))
        {da_tmp1, des_acc[7:4]} = {srcCy, src1[7:4]}+ 5'b00110 + {4'b0, da_tmp};
      else {da_tmp1, des_acc[7:4]} = {srcCy, src1[7:4]} + {4'b0, da_tmp};

      desCy = da_tmp | da_tmp1;
      des1 = src1;
      des2 = 8'h00;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation not
// bit operation not
    `OC8051_ALU_NOT: begin
      des_acc = ~src1;
      des1 = ~src1;
      des2 = 8'h00;
      desCy = !srcCy;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation and
//bit operation and
    `OC8051_ALU_AND: begin
      des_acc = src1 & src2;
      des1 = src1 & src2;
      des2 = 8'h00;
      desCy = srcCy & bit_in;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation xor
// bit operation xor
    `OC8051_ALU_XOR: begin
      des_acc = src1 ^ src2;
      des1 = src1 ^ src2;
      des2 = 8'h00;
      desCy = srcCy ^ bit_in;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation or
// bit operation or
    `OC8051_ALU_OR: begin
      des_acc = src1 | src2;
      des1 = src1 | src2;
      des2 = 8'h00;
      desCy = srcCy | bit_in;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation rotate left
// bit operation cy= cy or (not ram)
    `OC8051_ALU_RL: begin
      des_acc = {src1[6:0], src1[7]};
      des1 = src1 ;
      des2 = 8'h00;
      desCy = srcCy | !bit_in;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation rotate left with carry and swap nibbles
    `OC8051_ALU_RLC: begin
      des_acc = {src1[6:0], srcCy};
      des1 = src1 ;
      des2 = {src1[3:0], src1[7:4]};
      desCy = src1[7];
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation rotate right
    `OC8051_ALU_RR: begin
      des_acc = {src1[0], src1[7:1]};
      des1 = src1 ;
      des2 = 8'h00;
      desCy = srcCy & !bit_in;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation rotate right with carry
    `OC8051_ALU_RRC: begin
      des_acc = {srcCy, src1[7:1]};
      des1 = src1 ;
      des2 = 8'h00;
      desCy = src1[0];
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation pcs Add
    `OC8051_ALU_INC: begin
      if (srcCy) begin
        des_acc = dec[7:0];
	des1 = dec[7:0];
        des2 = dec[15:8];
      end else begin
        des_acc = inc[7:0];
	des1 = inc[7:0];
        des2 = inc[15:8];
      end
      desCy = 1'b0;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation exchange
//if carry = 0 exchange low order digit
    `OC8051_ALU_XCH: begin
      if (srcCy)
      begin
        des_acc = src2;
        des1 = src2;
        des2 = src1;
      end else begin
        des_acc = {src1[7:4],src2[3:0]};
        des1 = {src1[7:4],src2[3:0]};
        des2 = {src2[7:4],src1[3:0]};
      end
      desCy = 1'b0;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
    `OC8051_ALU_NOP: begin
      des_acc = src1;
      des1 = src1;
      des2 = src2;
      desCy = srcCy;
      desAc = srcAc;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
  endcase
end

endmodule

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_alu_src_sel (clk, rst, rd, sel1, sel2, sel3,
                     acc, ram, pc, dptr,

                     op1, op2, op3,

                     src1, src2, src3);


input clk, rst, rd, sel3;
input [1:0] sel2;
input [2:0] sel1;
input [7:0] acc, ram;
input [15:0] dptr;
input [15:0] pc;


input [7:0] op1, op2, op3;

output [7:0] src1, src2, src3;

reg [7:0] src1, src2, src3;

reg [7:0] op1_r, op2_r, op3_r;

///////
//
// src1
//
///////
always @(sel1 or op1_r or op2_r or op3_r or pc or acc or ram)
begin
  case (sel1) 
    `OC8051_AS1_RAM: src1 = ram;
    `OC8051_AS1_ACC: src1 = acc;
    `OC8051_AS1_OP1: src1 = op1_r;
    `OC8051_AS1_OP2: src1 = op2_r;
    `OC8051_AS1_OP3: src1 = op3_r;
    `OC8051_AS1_PCH: src1 = pc[15:8];
    `OC8051_AS1_PCL: src1 = pc[7:0];
    // spramod: changed this to make this a full case statement to avoid
    // inferring the latch.
    default: src1 = 8'h00;
  endcase
end

///////
//
// src2
//
///////
always @(sel2 or op2_r or acc or ram or op1_r)
begin
  case (sel2) 
    `OC8051_AS2_ACC: src2= acc;
    `OC8051_AS2_ZERO: src2= 8'h00;
    `OC8051_AS2_RAM: src2= ram;
    `OC8051_AS2_OP2: src2= op2_r;
//    default: src2= 8'h00;
  endcase
end

///////
//
// src3
//
///////

always @(sel3 or pc[15:8] or dptr[15:8] or op1_r)
begin
  case (sel3) 
    `OC8051_AS3_DP:   src3= dptr[15:8];
    `OC8051_AS3_PC:   src3= pc[15:8];
//    default: src3= 16'h0;
  endcase
end


always @(posedge clk)
  if (rst) begin
    op1_r <= #1 8'h00;
    op2_r <= #1 8'h00;
    op3_r <= #1 8'h00;
  end else begin
    op1_r <= #1 op1;
    op2_r <= #1 op2;
    op3_r <= #1 op3;
  end

endmodule

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_comp (sel, b_in, cy, acc, des, /*comp_wait, */eq);
//
// sel          (in)  select whithc sourses to compare (look defines.v) [oc8051_decoder.comp_sel]
// b_in         (in)  bit in - output from bit addressable memory space [oc8051_ram_sel.bit_out]
// cy           (in)  carry flag [oc8051_psw.data_out[7] ]
// acc          (in)  accumulator [oc8051_acc.data_out]
// ram          (in)  input from ram [oc8051_ram_sel.out_data]
// op2          (in)  immediate data [oc8051_op_select.op2_out -r]
// des          (in)  destination from alu [oc8051_alu.des1 -r]
// eq           (out) if (src1 == src2) eq = 1  [oc8051_decoder.eq]
//


input [1:0] sel;
input b_in, cy/*, comp_wait*/;
input [7:0] acc, des;

output eq;

reg eq_r;

assign eq = eq_r;// & comp_wait;


always @(sel or b_in or cy or acc or des)
begin
  case (sel) 
    `OC8051_CSS_AZ  : eq_r = (acc == 8'h00);
    `OC8051_CSS_DES : eq_r = (des == 8'h00);
    `OC8051_CSS_CY  : eq_r = cy;
    `OC8051_CSS_BIT : eq_r = b_in;
  endcase
end

endmodule

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_cy_select (cy_sel, cy_in, data_in, data_out);
//
// cy_sel       (in)  carry select, from decoder (see defines.v) [oc8051_decoder.cy_sel -r]
// cy_in        (in)  carry input [oc8051_psw.data_out[7] ]
// data_in      (in)  ram data input [oc8051_ram_sel.bit_out]
// data_out     (out) data output [oc8051_alu.srcCy]
//

input [1:0] cy_sel;
input cy_in, data_in;

output data_out;
reg data_out;

always @(cy_sel or cy_in or data_in)
begin
  case (cy_sel) 
    `OC8051_CY_0: data_out = 1'b0;
    `OC8051_CY_PSW: data_out = cy_in;
    `OC8051_CY_RAM: data_out = data_in;
    `OC8051_CY_1: data_out = 1'b1;
  endcase
end

endmodule

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on


module oc8051_indi_addr (clk, rst, wr_addr, data_in, wr, wr_bit, ri_out, sel, bank, iram0, iram1, iram8, iram9);
//


input        clk,	// clock
             rst,	// reset
	     wr,	// write
             sel,	// select register
	     wr_bit;	// write bit addressable
input  [1:0] bank;	// select register bank
input  [7:0] data_in;	// data input
input  [7:0] wr_addr;	// write address
input  [7:0] iram0, iram1, iram8, iram9;

output [7:0] ri_out;

//reg [7:0] buff [31:0];
reg wr_bit_r;


reg [7:0] buff [0:7];

wire [7:0] buff0 = buff[0];
wire [7:0] buff1 = buff[1];
wire [7:0] buff2 = buff[2];
wire [7:0] buff3 = buff[3];
wire [7:0] buff4 = buff[4];
wire [7:0] buff5 = buff[5];
wire [7:0] buff6 = buff[6];
wire [7:0] buff7 = buff[7];

//
//write to buffer
always @(posedge clk )
begin
  if (rst) begin
    buff[3'b000] <= #1 8'h00;
    buff[3'b001] <= #1 8'h00;
    buff[3'b010] <= #1 8'h00;
    buff[3'b011] <= #1 8'h00;
    buff[3'b100] <= #1 8'h00;
    buff[3'b101] <= #1 8'h00;
    buff[3'b110] <= #1 8'h00;
    buff[3'b111] <= #1 8'h00;
  end else begin
    if ((wr) & !(wr_bit_r)) begin
      case (wr_addr) 
        8'h00: buff[3'b000] <= #1 data_in;
        8'h01: buff[3'b001] <= #1 data_in;
        8'h08: buff[3'b010] <= #1 data_in;
        8'h09: buff[3'b011] <= #1 data_in;
        8'h10: buff[3'b100] <= #1 data_in;
        8'h11: buff[3'b101] <= #1 data_in;
        8'h18: buff[3'b110] <= #1 data_in;
        8'h19: buff[3'b111] <= #1 data_in;
      endcase
    end
  end
end

//
//read from buffer

assign ri_out = (({3'b000, bank, 2'b00, sel}==wr_addr) & (wr) & !wr_bit_r) ?
                 data_in : buff[{bank, sel}];



always @(posedge clk )
  if (rst) begin
    wr_bit_r <= #1 1'b0;
  end else begin
    wr_bit_r <= #1 wr_bit;
  end

endmodule

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on


module oc8051_multiply (clk, rst, enable, src1, src2, des1, des2, desOv);
//
// this module is part of alu
// clk          (in)
// rst          (in)
// enable       (in)
// src1         (in)  first operand
// src2         (in)  second operand
// des1         (out) first result
// des2         (out) second result
// desOv        (out) Overflow output
//

input clk, rst, enable;
input [7:0] src1, src2;
output desOv;
output [7:0] des1, des2;

// wires
wire [15:0] mul_result1, mul_result, shifted;

// real registers
reg [1:0] cycle;
reg [15:0] tmp_mul;

assign mul_result1 = src1 * (cycle == 2'h0 ? src2[7:6] 
                           : cycle == 2'h1 ? src2[5:4]
                           : cycle == 2'h2 ? src2[3:2]
                           : src2[1:0]);

assign shifted = (cycle == 2'h0 ? 16'h0 : {tmp_mul[13:0], 2'b00});
assign mul_result = mul_result1 + shifted;
assign des1 = mul_result[15:8];
assign des2 = mul_result[7:0];
assign desOv = | des1;

always @(posedge clk )
begin
  if (rst) begin
    cycle <= #1 2'b0;
    tmp_mul <= #1 16'b0;
  end else begin
    if (enable) cycle <= #1 cycle + 2'b1;
    tmp_mul <= #1 mul_result;
  end
end

endmodule
// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

module oc8051_divide (clk, rst, enable, src1, src2, des1, des2, desOv);
//
// this module is part of alu
// clk          (in)
// rst          (in)
// enable       (in)  starts divison
// src1         (in)  first operand
// src2         (in)  second operand
// des1         (out) first result
// des2         (out) second result
// desOv        (out) Overflow output
//

input clk, rst, enable;
input [7:0] src1, src2;
output desOv;
output [7:0] des1, des2;

// wires
wire desOv;
wire div0, div1;
wire [7:0] rem0, rem1, rem2;
wire [8:0] sub0, sub1;
wire [15:0] cmp0, cmp1;
wire [7:0] div_out, rem_out;

// real registers
reg [1:0] cycle;
reg [5:0] tmp_div;
reg [7:0] tmp_rem;

// The main logic
assign cmp1 = src2 << ({2'h3 - cycle, 1'b0} + 3'h1);
assign cmp0 = src2 << ({2'h3 - cycle, 1'b0} + 3'h0);

assign rem2 = cycle != 0 ? tmp_rem : src1;

assign sub1 = {1'b0, rem2} - {1'b0, cmp1[7:0]};
assign div1 = |cmp1[15:8] ? 1'b0 : !sub1[8];
assign rem1 = div1 ? sub1[7:0] : rem2[7:0];

assign sub0 = {1'b0, rem1} - {1'b0, cmp0[7:0]};
assign div0 = |cmp0[15:8] ? 1'b0 : !sub0[8];
assign rem0 = div0 ? sub0[7:0] : rem1[7:0];

//
// in clock cycle 0 we first calculate two MSB bits, ...
// till finally in clock cycle 3 we calculate two LSB bits
assign div_out = {tmp_div, div1, div0};
assign rem_out = rem0;
assign desOv = src2 == 8'h0;

//
// divider works in four clock cycles -- 0, 1, 2 and 3
always @(posedge clk )
begin
  if (rst) begin
    cycle <= #1 2'b0;
    tmp_div <= #1 6'h0;
    tmp_rem <= #1 8'h0;
  end else begin
    if (enable) cycle <= #1 cycle + 2'b1;
    tmp_div <= #1 div_out[5:0];
    tmp_rem <= #1 rem_out;
  end
end

//
// assign outputs
assign des1 = rem_out;
assign des2 = div_out;

endmodule

