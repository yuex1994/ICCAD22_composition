#include "memory_interface_three_ports.h"

void MEMORY_INTERFACE_THREE_PORTS::pc_port() {
  auto rd = model.NewBoolInput("rd"); //new instr
  auto pc_wr = model.NewBoolInput("pc_wr");
  auto pc_wr_sel = model.NewBvInput("pc_wr_sel", 3);
  auto idat_onchip = model.NewBvInput("idat_onchip", 32); //instr
  auto sp = model.NewBvInput("sp", 8);
  auto des2 = model.NewBvInput("des2", 8);
  auto des_acc = model.NewBvInput("des_acc", 8);
  auto ri = model.input("ri");
  auto rn = model.NewBvInput("rn", 5);
  auto ram_rd_sel = model.NewBvInput("ram_rd_sel", 3);

  auto pc = model.NewBvState("pc", 16);
  auto pc_buf = model.NewBvState("pc_buf", 16);
  auto idat_cur = model.NewBvState("idat_cur", 32);
  auto idat_old = model.NewBvState("idat_old", 32);
  auto op2_buff = model.NewBvState("op2_buff", 8);
  auto op3_buff = model.NewBvState("op3_buff", 8);
  auto op_pos = model.NewBvState("op_pos", 3);
  auto reti = model.NewBoolState("reti");
  auto pc_wr_r = model.NewBoolState("pc_wr_r");
  auto pc_wr_r2 = model.NewBoolState("pc_wr_r2");
  auto imm_out = model.NewBvState("imm_r", 8);
  auto imm2_out = model.NewBvState("imm2_r", 8);
  auto rn_out = model.NewBvState("rn_r", 5);
  auto ri_out = model.NewBvState("ri_r", 8);
  auto rd_ind_out = model.NewBoolState("rd_ind");
  auto rd_addr_r_out = model.NewBoolState("rd_addr_r"); 
  auto cdata = model.NewBvState("cdata", 8);
  auto cdone = model.NewBoolState("cdone");

  auto dack_ir = model.state("dack_ir");
  auto ddat_ir = model.state("ddat_ir");
  auto mem_wait = model.state("mem_wait");
  auto istb_t = model.state("istb_t");
  auto inc_pc = (((Extract(op_pos, 2, 2) == BvConst(1, 1)) | (Extract(op_pos, 1, 0) == BvConst(3, 2))) & rd) | pc_wr_r2;
  auto new_inst = (rd) & (Extract(op_pos, 2, 2) == BvConst(0, 1)) & (Extract(op_pos, 1, 0) != BvConst(3, 2)) & (pc_wr_r2 == BoolConst(0));
  // auto ea_rom_sel = ea & ea_int;
  // Fetch logic
  auto op_pos_000 = BvConst(0b000, 3);
  auto op_pos_001 = BvConst(0b001, 3);
  auto op_pos_010 = BvConst(0b010, 3);
  auto op_pos_011 = BvConst(0b011, 3);
  auto op_pos_100 = BvConst(0b100, 3);

  auto op1 = Ite(op_pos == op_pos_000, Extract(idat_old, 7, 0),
                Ite(op_pos == op_pos_001, Extract(idat_old, 15, 8),
                Ite(op_pos == op_pos_010, Extract(idat_old, 23, 16),
                Ite(op_pos == op_pos_011, Extract(idat_old, 31, 24),
                Ite(op_pos == op_pos_100, Extract(idat_cur, 7, 0), Extract(idat_cur, 15, 8)))))); 
  auto op2 = Ite(op_pos == op_pos_000, Extract(idat_old, 15, 8),
                Ite(op_pos == op_pos_001, Extract(idat_old, 23, 16),
                Ite(op_pos == op_pos_010, Extract(idat_old, 31, 24),
                Ite(op_pos == op_pos_011, Extract(idat_cur, 7, 0),
                Ite(op_pos == op_pos_100, Extract(idat_cur, 15, 8), Extract(idat_cur, 23, 16))))));
  auto op3 = Ite(op_pos == op_pos_000, Extract(idat_old, 23, 16),
                Ite(op_pos == op_pos_001, Extract(idat_old, 31, 24),
                Ite(op_pos == op_pos_010, Extract(idat_cur, 7, 0),
                Ite(op_pos == op_pos_011, Extract(idat_cur, 15, 8),
                Ite(op_pos == op_pos_100, Extract(idat_cur, 23, 16), Extract(idat_cur, 31, 24))))));  
  auto op1_out = Ite(dack_ir == BoolConst(1), ddat_ir, Ite(cdone, cdata, op1));
  auto op2_out = Ite(rd, op2, op2_buff);
  auto op3_out = Ite(rd, op3, op3_buff);
  auto op_acall = BvConst(0b10001, 5);
  auto op_ajmp = BvConst(0b00001, 5);
  auto op_cjne_r = BvConst(0b10111, 5);
  auto op_djnz_r = BvConst(0b11011, 5);
  auto op_mov_dr = BvConst(0b10101, 5);
  auto op_mov_cr = BvConst(0b01111, 5);
  auto op_mov_rd = BvConst(0b10001, 5);
  auto op_cjne_i = BvConst(0b1011011, 7);
  auto op_mov_id = BvConst(0b1000011, 7);
  auto op_mov_di = BvConst(0b1010011, 7);
  auto op_mov_ci = BvConst(0b0111011, 7);
  auto op_add_d = BvConst(0b00100101, 8);
  auto op_add_c = BvConst(0b00100100, 8);
  auto op_addc_d = BvConst(0b00110101, 8);
  auto op_addc_c = BvConst(0b00110100, 8);
  auto op_anl_d = BvConst(0b01010101, 8);
  auto op_anl_c = BvConst(0b01010100, 8);
  auto op_anl_dd = BvConst(0b01010010, 8);
  auto op_anl_dc = BvConst(0b01010011, 8);
  auto op_anl_b = BvConst(0b10000010, 8);
  auto op_anl_nb = BvConst(0b10110000, 8);
  auto op_cjne_d = BvConst(0b10110101, 8);
  auto op_cjne_c = BvConst(0b10110100, 8);
  auto op_clr_b = BvConst(0b11000010, 8);
  auto op_cpl_b = BvConst(0b10110010, 8);
  auto op_dec_d = BvConst(0b00010101, 8);
  auto op_djnz_d = BvConst(0b11010101, 8);
  auto op_inc_d = BvConst(0b00000101, 8);
  auto op_jb = BvConst(0b00100000, 8);
  auto op_jbc = BvConst(0b00010000, 8);
  auto op_jc = BvConst(0b01000000, 8);
  auto op_jnb = BvConst(0b00110000, 8);
  auto op_jnc = BvConst(0b01010000, 8);
  auto op_jnz = BvConst(0b01110000, 8);
  auto op_jz = BvConst(0b01100000, 8);
  auto op_lcall = BvConst(0b00010010, 8);
  auto op_ljmp = BvConst(0b00000010, 8);
  auto op_mov_d = BvConst(0b11100101, 8);
  auto op_mov_c = BvConst(0b01110100, 8);
  auto op_mov_da = BvConst(0b11110101, 8);
  auto op_mov_dd = BvConst(0b10000101, 8);
  auto op_mov_cd = BvConst(0b01110101, 8);
  auto op_mov_bc = BvConst(0b10100010, 8);
  auto op_mov_cb = BvConst(0b10010010, 8);
  auto op_mov_dp = BvConst(0b10010000, 8);
  auto op_orl_d = BvConst(0b01000101, 8);
  auto op_orl_c = BvConst(0b01000100, 8);
  auto op_orl_ad = BvConst(0b01000010, 8);
  auto op_orl_cd = BvConst(0b01000011, 8);
  auto op_orl_b = BvConst(0b01110010, 8);
  auto op_orl_nb = BvConst(0b10100000, 8);
  auto op_pop = BvConst(0b11010000, 8);
  auto op_push = BvConst(0b11000000, 8);
  auto op_reti = BvConst(0b00110010, 8);
  auto op_setb_b = BvConst(0b11010010, 8);
  auto op_sjmp = BvConst(0b10000000, 8);
  auto op_subb_d = BvConst(0b10010101, 8);
  auto op_subb_c = BvConst(0b10010100, 8);
  auto op_xch_d = BvConst(0b11000101, 8);
  auto op_xrl_d = BvConst(0b01100101, 8);
  auto op_xrl_c = BvConst(0b01100100, 8);
  auto op_xrl_ad = BvConst(0b01100010, 8);
  auto op_xrl_cd = BvConst(0b01100011, 8);

  auto op1_out_4_0 = Extract(op1_out, 4, 0);
  auto op1_out_7_3 = Extract(op1_out, 7, 3);
  auto op1_out_7_1 = Extract(op1_out, 7, 1);
  auto op1_out_is_acall = op1_out_4_0 == op_acall;
  auto op1_out_is_ajmp = op1_out_4_0 == op_ajmp;
  auto op1_out_is_cjne_r = op1_out_7_3 == op_cjne_r;
  auto op1_out_is_djnz_r = op1_out_7_3 == op_djnz_r;
  auto op1_out_is_mov_dr = op1_out_7_3 == op_mov_dr;
  auto op1_out_is_mov_cr = op1_out_7_3 == op_mov_cr;
  auto op1_out_is_mov_rd = op1_out_7_3 == op_mov_rd;
  auto op1_out_is_cjne_i = op1_out_7_1 == op_cjne_i;
  auto op1_out_is_mov_id = op1_out_7_1 == op_mov_id;
  auto op1_out_is_mov_di = op1_out_7_1 == op_mov_di;
  auto op1_out_is_mov_ci = op1_out_7_1 == op_mov_ci;
  auto op1_out_is_add_d = op1_out == op_add_d;
  auto op1_out_is_add_c = op1_out == op_add_c;
  auto op1_out_is_addc_d = op1_out == op_addc_d;
  auto op1_out_is_addc_c = op1_out == op_addc_c;
  auto op1_out_is_anl_d = op1_out == op_anl_d;
  auto op1_out_is_anl_c = op1_out == op_anl_c;
  auto op1_out_is_anl_dd = op1_out == op_anl_dd;
  auto op1_out_is_anl_dc = op1_out == op_anl_dc;
  auto op1_out_is_anl_b = op1_out == op_anl_b;
  auto op1_out_is_anl_nb = op1_out == op_anl_nb;
  auto op1_out_is_cjne_d = op1_out == op_cjne_d;
  auto op1_out_is_cjne_c = op1_out == op_cjne_c;
  auto op1_out_is_clr_b = op1_out == op_clr_b;
  auto op1_out_is_cpl_b = op1_out == op_cpl_b;
  auto op1_out_is_dec_d = op1_out == op_dec_d;
  auto op1_out_is_djnz_d = op1_out == op_djnz_d;
  auto op1_out_is_inc_d = op1_out == op_inc_d;
  auto op1_out_is_jb = op1_out == op_jb;
  auto op1_out_is_jbc = op1_out == op_jbc;
  auto op1_out_is_jc = op1_out == op_jc;
  auto op1_out_is_jnb = op1_out == op_jnb;
  auto op1_out_is_jnc = op1_out == op_jnc;
  auto op1_out_is_jnz = op1_out == op_jnz;
  auto op1_out_is_jz = op1_out == op_jz;
  auto op1_out_is_lcall = op1_out == op_lcall;
  auto op1_out_is_ljmp = op1_out == op_ljmp;
  auto op1_out_is_mov_d = op1_out == op_mov_d;
  auto op1_out_is_mov_c = op1_out == op_mov_c;
  auto op1_out_is_mov_da = op1_out == op_mov_da;
  auto op1_out_is_mov_dd = op1_out == op_mov_dd;
  auto op1_out_is_mov_cd = op1_out == op_mov_cd;
  auto op1_out_is_mov_bc = op1_out == op_mov_bc;
  auto op1_out_is_mov_cb = op1_out == op_mov_cb;
  auto op1_out_is_mov_dp = op1_out == op_mov_dp;
  auto op1_out_is_orl_d = op1_out == op_orl_d;
  auto op1_out_is_orl_c = op1_out == op_orl_c;
  auto op1_out_is_orl_ad = op1_out == op_orl_ad;
  auto op1_out_is_orl_cd = op1_out == op_orl_cd;
  auto op1_out_is_orl_b = op1_out == op_orl_b;
  auto op1_out_is_orl_nb = op1_out == op_orl_nb;
  auto op1_out_is_pop = op1_out == op_pop;
  auto op1_out_is_push = op1_out == op_push;
  auto op1_out_is_setb_b = op1_out == op_setb_b;
  auto op1_out_is_sjmp = op1_out == op_sjmp;
  auto op1_out_is_subb_d = op1_out == op_subb_d;
  auto op1_out_is_subb_c = op1_out == op_subb_c;
  auto op1_out_is_xch_d = op1_out == op_xch_d;
  auto op1_out_is_xrl_d = op1_out == op_xrl_d;
  auto op1_out_is_xrl_c = op1_out == op_xrl_c;
  auto op1_out_is_xrl_ad = op1_out == op_xrl_ad;
  auto op1_out_is_xrl_cd = op1_out == op_xrl_cd;
  auto ite_op_length_2 = (op1_out_is_acall) | (op1_out_is_ajmp) | (op1_out_is_djnz_r) | (op1_out_is_mov_dr) |
                         (op1_out_is_mov_cr) | (op1_out_is_mov_rd) | (op1_out_is_mov_id) | (op1_out_is_mov_di) |
                         (op1_out_is_mov_ci) | (op1_out_is_add_d) | (op1_out_is_add_c) | (op1_out_is_addc_d) |
                         (op1_out_is_addc_c) | (op1_out_is_anl_d) | (op1_out_is_anl_c) | (op1_out_is_anl_dd) |
                         (op1_out_is_anl_b) | (op1_out_is_anl_nb) | (op1_out_is_clr_b) | (op1_out_is_cpl_b) |
                         (op1_out_is_dec_d) | (op1_out_is_inc_d) | (op1_out_is_jc) | (op1_out_is_jnc) | (op1_out_is_jnz) |
                         (op1_out_is_jz) | (op1_out_is_mov_d) | (op1_out_is_mov_c) | (op1_out_is_mov_da) | (op1_out_is_mov_bc) |
                         (op1_out_is_mov_cb) | (op1_out_is_orl_d) | (op1_out_is_orl_c) | (op1_out_is_orl_ad) |
                         (op1_out_is_orl_b) | (op1_out_is_orl_nb) | (op1_out_is_pop) | (op1_out_is_push) | (op1_out_is_setb_b) |
                         (op1_out_is_sjmp) | (op1_out_is_subb_d) | (op1_out_is_subb_c) | (op1_out_is_xch_d) | (op1_out_is_xrl_d) |
                         (op1_out_is_xrl_c) | (op1_out_is_xrl_ad);

  auto ite_op_length_3 = (op1_out_is_cjne_r) | (op1_out_is_cjne_i) | (op1_out_is_anl_dc) | (op1_out_is_cjne_d) |
                         (op1_out_is_cjne_c) | (op1_out_is_djnz_d) | (op1_out_is_jb) | (op1_out_is_jbc) | (op1_out_is_jnb) |
                         (op1_out_is_lcall) | (op1_out_is_ljmp) | (op1_out_is_mov_dd) | (op1_out_is_mov_cd) | (op1_out_is_mov_dp) |
                         (op1_out_is_orl_cd) | (op1_out_is_xrl_cd);
  auto op_length = Ite(ite_op_length_3, BvConst(3, 2), Ite(ite_op_length_2, BvConst(2, 2), BvConst(1, 2)));

  auto pc_wr_sel_pis_al = BvConst(0b000, 3);
  auto pc_wr_sel_pis_ah = BvConst(0b001, 3);
  auto pc_wr_sel_pis_s01 = BvConst(0b010, 3);
  auto pc_wr_sel_pis_s02 = BvConst(0b011, 3);
  auto pc_wr_sel_pis_i11 = BvConst(0b100, 3);
  auto pc_wr_sel_pis_i16 = BvConst(0b101, 3);
  auto pc_wr_sel_pis_alu = BvConst(0b110, 3);
  auto pc_for_ajmp = pc + BvConst(2, 16);
  auto pcs_source = Ite(Extract(pc_wr_sel, 0, 0) == BvConst(1, 1), op3_out, op2_out);
  auto pcs_tmp = Concat(BvConst(0, 1), Extract(pc, 7, 0)) + Concat(BvConst(0, 1), pcs_source);
  auto pcs_result_1 = Concat(Extract(pc, 15, 8) - Concat(BvConst(0, 7), ~(Extract(pcs_tmp, 8, 8))), Extract(pcs_tmp, 7, 0));
  auto pcs_result_0 = pc + Concat(BvConst(0, 8), pcs_source);
  auto pcs_result = Ite(Extract(pcs_source, 7, 7) == BvConst(1, 1), pcs_result_1, pcs_result_0);
  auto pc_wr_sel_to_pc = Ite(pc_wr_sel == pc_wr_sel_pis_alu, Concat(des2, des_acc),
                         Ite(pc_wr_sel == pc_wr_sel_pis_al, Concat(Extract(pc_buf, 15, 8), des_acc),
                         Ite(pc_wr_sel == pc_wr_sel_pis_ah, Concat(des_acc, Extract(pc_buf, 7, 0)),
                         Ite(pc_wr_sel == pc_wr_sel_pis_i11, Concat(Concat(Extract(pc_for_ajmp, 15, 11), Extract(op1_out, 7, 5)), op2_out),
                         Ite(pc_wr_sel == pc_wr_sel_pis_i16, Concat(op2_out, op3_out),
                         Ite(pc_wr_sel == pc_wr_sel_pis_s01, pcs_result,
                         Ite(pc_wr_sel == pc_wr_sel_pis_s02, pcs_result, pc_buf)))))));
  // ram_rd_sel const
  auto rrs_dc = BvConst(0b000, 3);
  auto rrs_rn = BvConst(0b000, 3);
  auto rrs_i = BvConst(0b001, 3);
  auto rrs_d = BvConst(0b010, 3);
  auto rrs_sp = BvConst(0b011, 3);
  auto rrs_b = BvConst(0b100, 3);
  auto rrs_dptr = BvConst(0b101, 3);
  auto rrs_psw = BvConst(0b110, 3);
  auto rrs_acc = BvConst(0b111, 3);
  auto rd_ind_next = Ite((ram_rd_sel == rrs_i) | (ram_rd_sel == rrs_sp), BoolConst(1), BoolConst(0));
  auto rd_addr_r_next = Ite(ram_rd_sel == rrs_rn, BoolConst(0),
                        Ite(ram_rd_sel == rrs_i, BvConst(1, 1) == Extract(ri, 7, 7),
                        Ite(ram_rd_sel == rrs_d, BvConst(1, 1) == Extract(op2_out, 7, 7),
                        Ite(ram_rd_sel == rrs_sp, BvConst(1, 1) == Extract(sp, 7, 7),
                        Ite(ram_rd_sel == rrs_b, BoolConst(1),
                        Ite(ram_rd_sel == rrs_dptr, BoolConst(1),
                        Ite(ram_rd_sel == rrs_psw, BoolConst(1),
                        Ite(ram_rd_sel == rrs_acc, BoolConst(1), BoolConst(0)))))))));
  auto new_cdata = Ite(istb_t, Extract(idat_onchip, 7, 0), cdata);
  auto new_cdone = Ite(istb_t, BvConst(1, 1), BvConst(0, 1));
  {
    auto instr = model.NewInstr("load_inst");
    instr.SetDecode((inc_pc));
    instr.SetUpdate(idat_cur, idat_onchip);
    instr.SetUpdate(idat_old, idat_cur);
    instr.SetUpdate(op_pos, Ite(pc_wr_r2, BvConst(0b100, 3), Concat((op_pos == BvConst(0b101, 3)) & (op_length == BvConst(0b11, 2)), Extract(op_pos, 1, 0) + op_length)));
    instr.SetUpdate(pc, Ite(pc_wr_r2 == BoolConst(1), pc_buf, Ite((rd == BoolConst(1)), pc_buf - BvConst(8, 16) + ZExt(op_pos, 16) + ZExt(op_length, 16), pc)));
    auto pc_buf_new = Ite(pc_wr == BoolConst(1), pc_wr_sel_to_pc, pc_buf + BvConst(4, 16));
    instr.SetUpdate(pc_buf, pc_buf_new);
    instr.SetUpdate(pc_wr_r, pc_wr & (pc_wr_sel != pc_wr_sel_pis_ah));
    instr.SetUpdate(pc_wr_r2, pc_wr_r);
    instr.SetUpdate(op2_buff, Ite(rd, op2, op2_buff));
    instr.SetUpdate(op3_buff, Ite(rd, op3, op3_buff));
    instr.SetUpdate(imm_out, op2_out);
    instr.SetUpdate(imm2_out, op3_out);
    instr.SetUpdate(rn_out, rn);
    instr.SetUpdate(ri_out, ri);
    instr.SetUpdate(reti, Ite((op1 == op_reti) & (mem_wait == BoolConst(0)), BoolConst(1), BoolConst(0)));
    instr.SetUpdate(rd_ind_out, rd_ind_next);
    instr.SetUpdate(rd_addr_r_out, rd_addr_r_next);
    instr.SetUpdate(cdata, new_cdata);
    instr.SetUpdate(cdone, new_cdone);
  }

  {
    auto instr = model.NewInstr("new_inst");
    instr.SetDecode(new_inst);
    instr.SetUpdate(op_pos, op_pos + Concat(BvConst(0, 1), op_length));
    instr.SetUpdate(pc, pc_buf - BvConst(8, 16) + ZExt(op_pos, 16) + ZExt(op_length, 16));
    auto pc_buf_new = Ite(pc_wr == BoolConst(1), pc_wr_sel_to_pc, pc_buf);
    instr.SetUpdate(pc_buf, pc_buf_new);
    instr.SetUpdate(pc_wr_r, pc_wr & (pc_wr_sel != pc_wr_sel_pis_ah));
    instr.SetUpdate(pc_wr_r2, pc_wr_r);
    instr.SetUpdate(op2_buff, op2);
    instr.SetUpdate(op3_buff, op3);
    instr.SetUpdate(imm_out, op2_out);
    instr.SetUpdate(imm2_out, op3_out);
    instr.SetUpdate(rn_out, rn);
    instr.SetUpdate(ri_out, ri);
    instr.SetUpdate(reti, Ite((op1 == op_reti) & (mem_wait == BoolConst(0)), BoolConst(1), BoolConst(0)));
    instr.SetUpdate(rd_ind_out, rd_ind_next);
    instr.SetUpdate(rd_addr_r_out, rd_addr_r_next);
    instr.SetUpdate(cdata, new_cdata);
    instr.SetUpdate(cdone, new_cdone);
  }
  {
    auto instr = model.NewInstr("multi_cycle");
    instr.SetDecode((!inc_pc) & (!rd));

    instr.SetUpdate(op_pos, op_pos);
    instr.SetUpdate(pc, pc);
    instr.SetUpdate(pc_wr_r, pc_wr & (pc_wr_sel != pc_wr_sel_pis_ah));
    instr.SetUpdate(pc_wr_r2, pc_wr_r);
    instr.SetUpdate(imm_out, op2_out);
    instr.SetUpdate(imm2_out, op3_out);
    instr.SetUpdate(rn_out, rn);
    instr.SetUpdate(ri_out, ri);
    instr.SetUpdate(rd_ind_out, rd_ind_next);
    instr.SetUpdate(rd_addr_r_out, rd_addr_r_next);
    instr.SetUpdate(cdata, new_cdata);
    instr.SetUpdate(cdone, new_cdone);
  }
}


