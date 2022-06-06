#include "decoder.h"

DECODER::DECODER() : model("DECODER") {
  auto eq = model.NewBoolInput("eq");
  auto mem_wait = model.NewBoolInput("mem_wait");
  auto wait_data = model.NewBoolInput("wait_data");
  auto op_in = model.NewBvInput("op_in", 8);
  auto irom_out_of_rst = model.NewBoolInput("irom_out_of_rst");

  auto state = model.NewBvState("state", 2);
  auto op = model.NewBvState("op", 8);
  auto mem_act = model.NewBvState("mem_act", 3);
  auto ram_wr_sel = model.NewBvState("ram_wr_sel", 3);
  auto ram_rd_sel_r = model.NewBvState("ram_rd_sel_r", 3);
  auto src_sel1 = model.NewBvState("src_sel1", 3);
  auto src_sel2 = model.NewBvState("src_sel2", 2);
  auto src_sel3 = model.NewBoolState("src_sel3");
  auto alu_op = model.NewBvState("alu_op", 4);
  auto cy_sel = model.NewBvState("cy_sel", 2);
  auto psw_set = model.NewBvState("psw", 2);
  auto wr = model.NewBoolState("wr");
  auto wr_sfr = model.NewBvState("wr_sfr", 2);

  auto bv_const_11_2 = BvConst(0b11, 2);
  auto bv_const_10_2 = BvConst(0b10, 2);
  auto bv_const_01_2 = BvConst(0b01, 2);
  auto bv_const_00_2 = BvConst(0b00, 2);
  auto state_11 = bv_const_11_2;
  auto state_10 = bv_const_10_2;
  auto state_01 = bv_const_01_2;
  auto state_00 = bv_const_00_2;

  // Constant opcodes
  // TODO: move the constants to a separate file
  auto op_acall = BvConst(0b10001, 5);
  auto op_add_i = BvConst(0b0010011, 7);
  auto op_add_r = BvConst(0b00101, 5);
  auto op_addc_i = BvConst(0b0011011, 7);
  auto op_addc_r = BvConst(0b00111, 5);
  auto op_anl_i = BvConst(0b0101011, 7);
  auto op_anl_r = BvConst(0b01011, 5);
  auto op_ajmp = BvConst(0b00001, 5);
  auto op_cjne_r = BvConst(0b10111, 5);
  auto op_dec_i = BvConst(0b0001011, 7);
  auto op_dec_r = BvConst(0b00011, 5);
  auto op_inc_r = BvConst(0b00001, 5);
  auto op_div = BvConst(0b10000100, 8);
  auto op_mul = BvConst(0b10100100, 8);
  auto op_djnz_r = BvConst(0b11011, 5);
  auto op_mov_ar = BvConst(0b11111, 5);
  auto op_mov_ai = BvConst(0b1111011, 7);
  auto op_mov_dr = BvConst(0b10101, 5);
  auto op_mov_cr = BvConst(0b01111, 5);
  auto op_mov_rd = BvConst(0b10001, 5);
  auto op_mov_i = BvConst(0b1110011, 7);
  auto op_movc_dp = BvConst(0b10010011, 8);
  auto op_movc_pc = BvConst(0b10000011, 8);
  auto op_movx_ia = BvConst(0b1110001, 7);
  auto op_movx_ai = BvConst(0b1111001, 7);
  auto op_movx_ap = BvConst(0b11110000, 8);
  auto op_movx_pa = BvConst(0b11100000, 8);
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
  auto op_clr_c = BvConst(0b11000011, 8);
  auto op_clr_a = BvConst(0b11100100, 8);
  auto op_cpl_a = BvConst(0b11110100, 8);
  auto op_cpl_b = BvConst(0b10110010, 8);
  auto op_cpl_c = BvConst(0b10110011, 8);
  auto op_da = BvConst(0b11010100, 8);
  auto op_dec_d = BvConst(0b00010101, 8);
  auto op_djnz_d = BvConst(0b11010101, 8);
  auto op_inc_a = BvConst(0b00000100, 8);
  auto op_inc_d = BvConst(0b00000101, 8);
  auto op_inc_dp = BvConst(0b10100011, 8);
  auto op_inc_i = BvConst(0b0000011, 7);
  auto op_jb = BvConst(0b00100000, 8);
  auto op_jbc = BvConst(0b00010000, 8);
  auto op_jc = BvConst(0b01000000, 8);
  auto op_jnb = BvConst(0b00110000, 8);
  auto op_jnc = BvConst(0b01010000, 8);
  auto op_jnz = BvConst(0b01110000, 8);
  auto op_jz = BvConst(0b01100000, 8);
  auto op_jmp_d = BvConst(0b01110011, 8);
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
  auto op_mov_r = BvConst(0b11101, 5);
  auto op_orl_d = BvConst(0b01000101, 8);
  auto op_orl_c = BvConst(0b01000100, 8);
  auto op_orl_ad = BvConst(0b01000010, 8);
  auto op_orl_cd = BvConst(0b01000011, 8);
  auto op_orl_b = BvConst(0b01110010, 8);
  auto op_orl_nb = BvConst(0b10100000, 8);
  auto op_orl_i = BvConst(0b0100011, 7);
  auto op_orl_r = BvConst(0b01001, 5);
  auto op_pop = BvConst(0b11010000, 8);
  auto op_push = BvConst(0b11000000, 8);
  auto op_ret = BvConst(0b00100010, 8);
  auto op_reti = BvConst(0b00110010, 8);
  auto op_rlc = BvConst(0b00110011, 8);
  auto op_rl = BvConst(0b00100011, 8);
  auto op_rr = BvConst(0b00000011, 8);
  auto op_rrc = BvConst(0b00010011, 8);
  auto op_setb_b = BvConst(0b11010010, 8);
  auto op_setb_c = BvConst(0b11010011, 8);
  auto op_swap = BvConst(0b11000100, 8);
  auto op_dec_a = BvConst(0b00010100, 8);
  auto op_sjmp = BvConst(0b10000000, 8);
  auto op_subb_d = BvConst(0b10010101, 8);
  auto op_subb_r = BvConst(0b10011, 5);
  auto op_subb_c = BvConst(0b10010100, 8);
  auto op_subb_i = BvConst(0b1001011, 7);
  auto op_xch_d = BvConst(0b11000101, 8);
  auto op_xch_r = BvConst(0b11001, 5);
  auto op_xch_i = BvConst(0b1100011, 7);
  auto op_xchd = BvConst(0b1101011, 7);
  auto op_xrl_c = BvConst(0b01100100, 8);
  auto op_xrl_d = BvConst(0b01100101, 8);
  auto op_xrl_i = BvConst(0b110011, 7);
  auto op_xrl_ad = BvConst(0b01100010, 8);
  auto op_xrl_cd = BvConst(0b01100011, 8);
  auto op_xrl_r = BvConst(0b01101, 5);

  // Logic to determine incoming instructions
  auto op_in_4_0 = Extract(op_in, 4, 0);
  auto op_in_7_3 = Extract(op_in, 7, 3);
  auto op_in_7_1 = Extract(op_in, 7, 1);
  auto op_in_is_acall = (op_in_4_0 == op_acall);
  auto op_in_is_ajmp = (op_in_4_0 == op_ajmp);
  auto op_in_is_anl_dd = (op_in == op_anl_dd);
  auto op_in_is_anl_dc = (op_in == op_anl_dc);

  auto op_in_is_cjne_r = (op_in_7_3 == op_cjne_r); 
  auto op_in_is_cjne_i = (op_in_7_1 == op_cjne_i); 
  auto op_in_is_cjne_d = (op_in == op_cjne_d);
  auto op_in_is_cjne_c = (op_in == op_cjne_c);
  auto op_in_is_clr_b = (op_in == op_clr_b);
  auto op_in_is_cpl_b = (op_in == op_cpl_b);

  auto op_in_is_dec_d = (op_in == op_dec_d);
  auto op_in_is_dec_i = (op_in_7_1 == op_dec_i);
  auto op_in_is_dec_r = (op_in_7_3 == op_dec_r);
  auto op_in_is_inc_d = (op_in == op_inc_d);
  auto op_in_is_inc_i = (op_in_7_1 == op_inc_i);
  auto op_in_is_inc_r = (op_in_7_3 == op_inc_r);
  auto op_in_is_mov_ar = (op_in_7_3 == op_mov_ar);
  auto op_in_is_mov_dr = (op_in_7_3 == op_mov_dr);
  auto op_in_is_mov_cr = (op_in_7_3 == op_mov_cr);
  auto op_in_is_mov_rd = (op_in_7_3 == op_mov_rd);
  auto op_in_is_mov_id = (op_in_7_1 == op_mov_id);
  auto op_in_is_mov_ai = (op_in_7_1 == op_mov_ai);
  auto op_in_is_mov_di = (op_in_7_1 == op_mov_di);
  auto op_in_is_mov_cb = (op_in == op_mov_cb);
  auto op_in_is_mov_cd = (op_in == op_mov_cd);
  auto op_in_is_mov_ci = (op_in_7_1 == op_mov_ci);
  auto op_in_is_mov_da = (op_in == op_mov_da);
  auto op_in_is_mov_dd = (op_in == op_mov_dd);
  auto op_in_is_ljmp = (op_in == op_ljmp);
  auto op_in_is_djnz_r = (op_in_7_3 == op_djnz_r);
  auto op_in_is_djnz_d = (op_in == op_djnz_d);
  auto op_in_is_lcall = (op_in == op_lcall);
  auto op_in_is_movc_dp = (op_in == op_movc_dp);
  auto op_in_is_movc_pc = (op_in == op_movc_pc);
  auto op_in_is_movx_ia = (op_in_7_1 == op_movx_ia);
  auto op_in_is_movx_ai = (op_in_7_1 == op_movx_ai);
  auto op_in_is_movx_pa = (op_in == op_movx_pa); 
  auto op_in_is_movx_ap = (op_in == op_movx_ap);
  auto op_in_is_orl_ad = (op_in == op_orl_ad);
  auto op_in_is_orl_cd = (op_in == op_orl_cd);
  auto op_in_is_pop = (op_in == op_pop);
  auto op_in_is_push = (op_in == op_push);
  auto op_in_is_ret = (op_in == op_ret); 
  auto op_in_is_reti = (op_in == op_reti);
  auto op_in_is_sjmp = (op_in == op_sjmp);
  auto op_in_is_setb_b = (op_in == op_setb_b);
  auto op_in_is_jb = (op_in == op_jb);
  auto op_in_is_jbc = (op_in == op_jbc);
  auto op_in_is_jc = (op_in == op_jc);
  auto op_in_is_jmp_d = (op_in == op_jmp_d);
  auto op_in_is_jnc = (op_in == op_jnc);
  auto op_in_is_jnb = (op_in == op_jnb);
  auto op_in_is_jnz = (op_in == op_jnz);
  auto op_in_is_jz = (op_in == op_jz);
  auto op_in_is_div = (op_in == op_div);
  auto op_in_is_mul = (op_in == op_mul);
  auto op_in_is_xch_r = (op_in_7_3 == op_xch_r);
  auto op_in_is_xch_i = (op_in_7_1 == op_xch_i);
  auto op_in_is_xchd = (op_in_7_1 == op_xchd);
  auto op_in_is_xch_d = (op_in == op_xch_d);
  auto op_in_is_xrl_ad = (op_in == op_xrl_ad);
  auto op_in_is_xrl_cd = (op_in == op_xrl_cd);

  auto ite_new_state_11 = (op_in_is_movc_dp) | (op_in_is_movc_pc) | (op_in_is_ret) | (op_in_is_reti) | (op_in_is_div) | (op_in_is_mul);
  auto ite_new_state_10 = (op_in_is_acall) | (op_in_is_ajmp) | (op_in_is_cjne_r) | (op_in_is_cjne_i) | (op_in_is_cjne_d) | (op_in_is_cjne_c) | (op_in_is_ljmp) | (op_in_is_djnz_r) | (op_in_is_djnz_d) | (op_in_is_lcall) | (op_in_is_movx_ia) | (op_in_is_movx_ai) | (op_in_is_movx_pa) | (op_in_is_movx_ap) | (op_in_is_sjmp) | (op_in_is_jb) | (op_in_is_jbc) | (op_in_is_jc) | (op_in_is_jmp_d) | (op_in_is_jnc) | (op_in_is_jnb) | (op_in_is_jnz) | (op_in_is_jz);
  auto new_state = Ite(ite_new_state_11, state_11, Ite(ite_new_state_10, state_10, state_00)); 


  // Logic to determine current instructions
  auto op_4_0 = Extract(op, 4, 0);
  auto op_7_3 = Extract(op, 7, 3);
  auto op_7_1 = Extract(op, 7, 1);
  auto op_is_acall = (op_4_0 == op_acall);
  auto op_is_ajmp = (op_4_0 == op_ajmp);
  auto op_is_anl_dd = (op == op_anl_dd);
  auto op_is_anl_dc = (op == op_anl_dc);

  auto op_is_cjne_r = (op_7_3 == op_cjne_r); 
  auto op_is_cjne_i = (op_7_1 == op_cjne_i); 
  auto op_is_cjne_d = (op == op_cjne_d);
  auto op_is_cjne_c = (op == op_cjne_c);
  auto op_is_clr_b = (op == op_clr_b);
  auto op_is_cpl_b = (op == op_cpl_b);

  auto op_is_dec_d = (op == op_dec_d);
  auto op_is_dec_i = (op_7_1 == op_dec_i);
  auto op_is_dec_r = (op_7_3 == op_dec_r);
  auto op_is_inc_d = (op == op_inc_d);
  auto op_is_inc_i = (op_7_1 == op_inc_i);
  auto op_is_inc_r = (op_7_3 == op_inc_r);
  auto op_is_mov_ar = (op_7_3 == op_mov_ar);
  auto op_is_mov_dr = (op_7_3 == op_mov_dr);
  auto op_is_mov_cr = (op_7_3 == op_mov_cr);
  auto op_is_mov_rd = (op_7_3 == op_mov_rd);
  auto op_is_mov_id = (op_7_1 == op_mov_id);
  auto op_is_mov_ai = (op_7_1 == op_mov_ai);
  auto op_is_mov_di = (op_7_1 == op_mov_di);
  auto op_is_mov_cb = (op == op_mov_cb);
  auto op_is_mov_cd = (op == op_mov_cd);
  auto op_is_mov_ci = (op_7_1 == op_mov_ci);
  auto op_is_mov_da = (op == op_mov_da);
  auto op_is_mov_dd = (op == op_mov_dd);
  auto op_is_ljmp = (op == op_ljmp);
  auto op_is_djnz_r = (op_7_3 == op_djnz_r);
  auto op_is_djnz_d = (op == op_djnz_d);
  auto op_is_lcall = (op == op_lcall);
  auto op_is_movc_dp = (op == op_movc_dp);
  auto op_is_movc_pc = (op == op_movc_pc);
  auto op_is_movx_ia = (op_7_1 == op_movx_ia);
  auto op_is_movx_ai = (op_7_1 == op_movx_ai);
  auto op_is_movx_pa = (op == op_movx_pa); 
  auto op_is_movx_ap = (op == op_movx_ap);
  auto op_is_orl_ad = (op == op_orl_ad);
  auto op_is_orl_cd = (op == op_orl_cd);
  auto op_is_pop = (op == op_pop);
  auto op_is_push = (op == op_push);
  auto op_is_ret = (op == op_ret); 
  auto op_is_reti = (op == op_reti);
  auto op_is_sjmp = (op == op_sjmp);
  auto op_is_setb_b = (op == op_setb_b);
  auto op_is_jb = (op == op_jb);
  auto op_is_jbc = (op == op_jbc);
  auto op_is_jc = (op == op_jc);
  auto op_is_jmp_d = (op == op_jmp_d);
  auto op_is_jnc = (op == op_jnc);
  auto op_is_jnb = (op == op_jnb);
  auto op_is_jnz = (op == op_jnz);
  auto op_is_jz = (op == op_jz);
  auto op_is_div = (op == op_div);
  auto op_is_mul = (op == op_mul);
  auto op_is_xch_r = (op_7_3 == op_xch_r);
  auto op_is_xch_i = (op_7_1 == op_xch_i);
  auto op_is_xchd = (op_7_1 == op_xchd);
  auto op_is_xch_d = (op == op_xch_d);
  auto op_is_xrl_ad = (op == op_xrl_ad);
  auto op_is_xrl_cd = (op == op_xrl_cd);



  // mem_act
  auto mas_dptr_r = BvConst(0b000, 3);
  auto mas_dptr_w = BvConst(0b001, 3);
  auto mas_ri_r = BvConst(0b010, 3);
  auto mas_ri_w = BvConst(0b011, 3);
  auto mas_code = BvConst(0b100, 3);
  auto default_mem_act = BvConst(0b111, 3);
  auto new_mem_act = Ite(mem_wait == BoolConst(1), default_mem_act, 
  			Ite(op_in_is_movx_ai, mas_ri_w, 
			Ite(op_in_is_movx_ap, mas_dptr_w, 
			Ite(op_in_is_movx_ia, mas_ri_r,
			Ite(op_in_is_movx_pa, mas_dptr_r,
			Ite(op_in_is_movc_dp, mas_code, 
			Ite(op_in_is_movc_pc, mas_code, default_mem_act)))))));
  
  // ram_rd_sel
  auto op_cur = Ite(mem_wait, BvConst(0, 8), Ite((state == BvConst(0, 2)) & (!wait_data), op_in, op));
  auto op_cur_4_0 = Extract(op_cur, 4, 0);
  auto op_cur_7_3 = Extract(op_cur, 7, 3);
  auto op_cur_7_1 = Extract(op_cur, 7, 1);
  auto rrs_dc = BvConst(0b000, 3);
  auto rrs_rn = BvConst(0b000, 3);
  auto rrs_i = BvConst(0b001, 3);
  auto rrs_d = BvConst(0b010, 3);
  auto rrs_sp = BvConst(0b011, 3);
  auto rrs_b = BvConst(0b100, 3);
  auto rrs_dptr = BvConst(0b101, 3);
  auto rrs_psw = BvConst(0b110, 3);
  auto rrs_acc = BvConst(0b111, 3);
  auto ram_rd_sel_state_00 = Ite((op_cur_4_0 == op_acall) | (op_cur_4_0 == op_ajmp) | (op_cur_7_1 == op_movx_ia) | (op_cur_7_1 == op_movx_ai) | (op_cur == op_anl_c) | (op_cur == op_cjne_c) | (op_cur == op_lcall) | (op_cur == op_ljmp) | (op_cur == op_movc_pc) | (op_cur == op_movx_pa) | (op_cur == op_movx_ap), rrs_dc,
                             Ite((op_cur_7_3 == op_add_r) | (op_cur_7_3 == op_addc_r) | (op_cur_7_3 == op_anl_r) | (op_cur_7_3 == op_cjne_r) | (op_cur_7_3 == op_dec_r) | (op_cur_7_3 == op_djnz_r) | (op_cur_7_3 == op_inc_r) | (op_cur_7_3 == op_mov_r) | (op_cur_7_3 == op_mov_rd) | (op_cur_7_3 == op_orl_r) | (op_cur_7_3 == op_subb_r) | (op_cur_7_3 == op_xch_r) | (op_cur_7_3 == op_xrl_r), rrs_rn,
                             Ite((op_cur_7_3 == op_mov_dr) | (op_cur_7_1 == op_mov_di) | (op_cur == op_add_d) | (op_cur == op_addc_d) | (op_cur == op_anl_d) | (op_cur == op_anl_dd) | (op_cur == op_anl_dc) | (op_cur == op_anl_b) | (op_cur == op_anl_nb) | (op_cur == op_cjne_d) | (op_cur == op_clr_b) | (op_cur == op_cpl_b) | (op_cur == op_dec_d) | (op_cur == op_djnz_d) | (op_cur == op_inc_d) | (op_cur == op_jb) | (op_cur == op_jbc) | (op_cur == op_jnb) | (op_cur == op_mov_d) | (op_cur == op_mov_dd) | (op_cur == op_mov_bc) | (op_cur == op_mov_cb) | (op_cur == op_orl_d) | (op_cur == op_orl_ad) | (op_cur == op_orl_cd) | (op_cur == op_orl_b) | (op_cur == op_orl_nb) | (op_cur == op_push) | (op_cur == op_setb_b) | (op_cur == op_subb_d) | (op_cur == op_xch_d) | (op_cur == op_xrl_d) | (op_cur == op_xrl_ad) | (op_cur == op_xrl_cd), rrs_d,
                             Ite((op_cur_7_1 == op_add_i) | (op_cur_7_1 == op_addc_i) | (op_cur_7_1 == op_anl_i) | (op_cur_7_1 == op_cjne_i) | (op_cur_7_1 == op_dec_i) | (op_cur_7_1 == op_inc_i) | (op_cur_7_1 == op_mov_i) | (op_cur_7_1 == op_mov_id) | (op_cur_7_1 == op_orl_i) | (op_cur_7_1 == op_subb_i) | (op_cur_7_1 == op_xch_i) | (op_cur_7_1 == op_xchd) | (op_cur_7_1 == op_xrl_i), rrs_i,
                             Ite((op_cur == op_div) | (op_cur == op_mul), rrs_b,
                             Ite((op_cur == op_inc_dp) | (op_cur == op_jmp_d) | (op_cur == op_movc_dp), rrs_dptr,
                             Ite((op_cur == op_pop) | (op_cur == op_ret) | (op_cur == op_reti), rrs_sp, rrs_dc)))))));
  auto ram_rd_sel_state_01 = Ite((op_cur == op_div) | (op_cur == op_mul), rrs_b, rrs_dc);
  auto ram_rd_sel_state_10 = Ite((op_cur == op_sjmp) | (op_cur == op_ret) | (op_cur == op_reti) | (op_cur_7_3 == op_cjne_r) | (op_cur_7_1 == op_cjne_i) | (op_cur == op_cjne_d) | (op_cur == op_cjne_c) | (op_cur_7_3 == op_djnz_r) | (op_cur == op_djnz_d) | (op_cur == op_jmp_d) | (op_cur == op_jnb), rrs_dc,
                             Ite((op_cur == op_jc) | (op_cur == op_jnc), rrs_psw,
                             Ite((op_cur == op_jnz) | (op_cur == op_jz), rrs_acc,
                             Ite((op_cur == op_jb) | (op_cur == op_jbc), rrs_d,
                             Ite((op_cur == op_div) | (op_cur == op_mul), rrs_b, rrs_dc)))));
  auto ram_rd_sel_state_11 = Ite((op_cur_7_3 == op_cjne_r) | (op_cur_7_1 == op_cjne_i) | (op_cur == op_cjne_d) | (op_cur == op_cjne_c) | (op_cur_7_3 == op_djnz_r) | (op_cur == op_djnz_d), rrs_dc,
                             Ite((op_cur == op_ret) | (op_cur == op_reti), rrs_sp,
                             Ite((op_cur == op_div) | (op_cur == op_mul), rrs_b, rrs_dc)));
  auto ram_rd_sel = Ite(state == BvConst(3, 2), ram_rd_sel_state_11,
                    Ite(state == BvConst(2, 2), ram_rd_sel_state_10,
                    Ite(state == BvConst(1, 2), ram_rd_sel_state_01, ram_rd_sel_state_00)));

  // cy_sel
  auto cy_0 = bv_const_00_2;
  auto cy_psw = bv_const_01_2;
  auto cy_ram = bv_const_10_2;
  auto cy_1 = bv_const_11_2;
  auto cy_dc = bv_const_00_2;
  auto cy_sel_state_01 = cy_0;
  auto cy_sel_state_10 = cy_0;
  auto cy_sel_state_11 = cy_0;
  auto cy_sel_state_00 = Ite((op_cur_7_3 == op_addc_r) | (op_cur_7_3 == op_subb_r) | (op_cur_7_1 == op_addc_i) | (op_cur_7_1 == op_subb_i) | (op_cur == op_addc_d) | (op_cur == op_addc_c) | (op_cur == op_anl_b) | (op_cur == op_anl_nb) | (op_cur == op_cpl_c) | (op_cur == op_da) | (op_cur == op_mov_cb) | (op_cur == op_orl_b) | (op_cur == op_orl_nb) | (op_cur == op_rlc) | (op_cur == op_rrc) | (op_cur == op_subb_d) | (op_cur == op_subb_c), cy_psw, Ite((op_cur == op_xch_d) | (op_cur == op_setb_c) | (op_cur == op_setb_b) | (op_cur == op_dec_a) | (op_cur == op_dec_d) | (op_cur == op_djnz_d) | (op_cur == op_inc_dp) | (op_cur_7_1 == op_xch_i) | (op_cur_7_3 == op_dec_r) | (op_cur_7_3 == op_djnz_r) | (op_cur_7_3 == op_xch_r) | (op_cur_7_1 == op_dec_i), cy_1, Ite((op_cur == op_cpl_b) | (op_cur == op_mov_bc), cy_ram, cy_0)));

  // src_sel1
  auto as1_op1 = BvConst(0b111, 3);
  auto as1_op2 = BvConst(0b001, 3);
  auto as1_op3 = BvConst(0b010, 3);
  auto as1_acc = BvConst(0b011, 3);
  auto as1_pch = BvConst(0b100, 3);
  auto as1_pcl = BvConst(0b101, 3);
  auto as1_dc = BvConst(0b000, 3);
  auto as1_ram = BvConst(0b000, 3);

  auto src_sel1_state_01 = Ite((op_cur == op_div) | (op_cur == op_mul), as1_acc, Ite((op_cur == op_movc_dp) | (op_cur == op_movc_pc) | (op_cur == op_movx_pa) | (op_cur_7_1 == op_movx_ia), as1_op1, as1_dc));
  auto src_sel1_state_10 = Ite((op_cur_4_0 == op_acall) | (op_cur == op_lcall), as1_pch, Ite((op_cur == op_div) | (op_cur == op_mul), as1_acc, Ite((op_cur == op_jbc), as1_ram, as1_dc)));
  auto src_sel1_state_11 = Ite((op_cur == op_div) | (op_cur == op_mul), as1_acc, Ite((op_cur == op_ret) | (op_cur == op_reti), as1_ram, as1_dc)); 
  auto src_sel1_state_00 = Ite((op_cur_4_0 == op_acall) | (op_cur == op_lcall) | (op_cur == op_movc_pc), as1_pcl, Ite((op_cur_7_3 == op_add_r) | (op_cur_7_3 == op_addc_r) | (op_cur_7_3 == op_anl_r) | (op_cur_7_3 == op_mov_ar) | (op_cur_7_3 == op_subb_r) | (op_cur_7_1 == op_add_i) | (op_cur_7_1 == op_addc_i) | (op_cur_7_1 == op_anl_i) | (op_cur_7_1 == op_mov_ai) | (op_cur_7_1 == op_subb_i) | (op_cur == op_add_d) | (op_cur == op_addc_d) | (op_cur == op_anl_d) | (op_cur == op_anl_dd) | (op_cur == op_cjne_d) | (op_cur == op_cjne_c) | (op_cur == op_clr_a) | (op_cur == op_cpl_a) | (op_cur == op_da) | (op_cur == op_dec_a) | (op_cur == op_div) | (op_cur == op_inc_a) | (op_cur == op_jmp_d) | (op_cur == op_mov_da) | (op_cur == op_movc_dp) | (op_cur == op_mul) | (op_cur == op_rl) | (op_cur == op_rlc) | (op_cur == op_rr) | (op_cur == op_rrc) | (op_cur == op_subb_d) | (op_cur == op_subb_c) | (op_cur == op_swap), as1_acc, Ite((op_cur_7_3 == op_cjne_r) | (op_cur_7_3 == op_dec_r) | (op_cur_7_3 == op_djnz_r) | (op_cur_7_3 == op_inc_r) | (op_cur_7_3 == op_mov_r) | (op_cur_7_3 == op_mov_dr) | (op_cur_7_3 == op_mov_rd) | (op_cur_7_3 == op_orl_r) | (op_cur_7_3 == op_xch_r) | (op_cur_7_3 == op_xrl_r) | (op_cur_7_1 == op_cjne_i) | (op_cur_7_1 == op_dec_i) | (op_cur_7_1 == op_inc_i) | (op_cur_7_1 == op_mov_i) | (op_cur_7_1 == op_mov_id) | (op_cur_7_1 == op_mov_di) | (op_cur_7_1 == op_orl_i) | (op_cur_7_1 == op_xch_i) | (op_cur_7_1 == op_xchd) | (op_cur_7_1 == op_xrl_i) | (op_cur == op_dec_d) | (op_cur == op_djnz_d) | (op_cur == op_inc_d) | (op_cur == op_inc_dp) | (op_cur == op_mov_d) | (op_cur == op_mov_dd) | (op_cur == op_orl_d) | (op_cur == op_orl_ad) | (op_cur == op_pop) | (op_cur == op_push) | (op_cur == op_ret) | (op_cur == op_reti) | (op_cur == op_xch_d) | (op_cur == op_xrl_d) | (op_cur == op_xrl_ad), as1_ram, Ite((op_cur_7_3 == op_mov_cr) | (op_cur_7_1 == op_mov_ci) | (op_cur == op_add_c) | (op_cur == op_addc_c) | (op_cur == op_anl_c) | (op_cur == op_mov_c) | (op_cur == op_orl_c) | (op_cur == op_xrl_c), as1_op2, Ite((op_cur == op_anl_dc) | (op_cur == op_mov_cd) | (op_cur == op_mov_dp) | (op_cur == op_orl_cd) | (op_cur == op_xrl_cd), as1_op3, as1_dc)))));  

  // src_sel2
  auto as2_dc = BvConst(0b00, 2);
  auto as2_op2 = BvConst(0b11, 2);
  auto as2_zero = BvConst(0b10, 2);
  auto as2_acc = BvConst(0b01, 2);
  auto as2_ram = BvConst(0b00, 2);

  auto src_sel2_state_01 = as2_dc;
  auto src_sel2_state_10 = as2_dc;
  auto src_sel2_state_11 = as2_dc;
  auto src_sel2_state_00 = Ite((op_cur_7_3 == op_cjne_r) | (op_cur_7_1 == op_cjne_i) | (op_cur == op_cjne_c) | (op_cur == op_mov_dp) | (op_cur == op_subb_c), as2_op2, Ite((op_cur_7_3 == op_orl_r) | (op_cur_7_3 == op_xch_r) | (op_cur_7_3 == op_xrl_r) | (op_cur_7_1 == op_orl_i) | (op_cur_7_1 == op_xch_i) | (op_cur_7_1 == op_xchd) | (op_cur_7_1 == op_xrl_i) | (op_cur == op_add_c) | (op_cur == op_addc_c) | (op_cur == op_anl_c) | (op_cur == op_clr_a) | (op_cur == op_movc_pc) | (op_cur == op_orl_d) | (op_cur == op_orl_c) | (op_cur == op_orl_ad) | (op_cur == op_xch_d) | (op_cur == op_xrl_d) | (op_cur == op_xrl_c) | (op_cur == op_xrl_ad), as2_acc, Ite((op_cur_7_3 == op_dec_r) | (op_cur_7_3 == op_djnz_r) | (op_cur_7_3 == op_inc_r) | (op_cur_7_1 == op_dec_i) | (op_cur_7_1 == op_inc_i) | (op_cur == op_dec_a) | (op_cur == op_dec_d) | (op_cur == op_djnz_d) | (op_cur == op_inc_a) | (op_cur == op_inc_d) | (op_cur == op_inc_dp), as2_zero, as2_ram))); 


  auto as3_dc = BoolConst(0); 
  auto as3_pc = BoolConst(1);
  auto as3_dp = BoolConst(0);

  auto src_sel3_state_01 = as3_dc;
  auto src_sel3_state_10 = as3_dc; 
  auto src_sel3_state_11 = as3_dc;
  auto src_sel3_state_00 = Ite((op_cur == op_clr_a) | (op_cur == op_clr_c) | (op_cur == op_clr_b) | (op_cur == op_jb) | (op_cur == op_jbc) | (op_cur == op_jc) | (op_cur == op_jnb) | (op_cur == op_jnc) | (op_cur == op_jnz) | (op_cur == op_jz) | (op_cur == op_movc_pc) | (op_cur == op_setb_c) | (op_cur == op_setb_b) | (op_cur == op_sjmp), as3_pc, as3_dc);

  auto alu_nop = BvConst(0b0000, 4);
  auto alu_add = BvConst(0b0001, 4);
  auto alu_sub = BvConst(0b0010, 4);
  auto alu_mul = BvConst(0b0011, 4);
  auto alu_div = BvConst(0b0100, 4);
  auto alu_da = BvConst(0b0101, 4);
  auto alu_not = BvConst(0b0110, 4);
  auto alu_and = BvConst(0b0111, 4);
  auto alu_xor = BvConst(0b1000, 4);
  auto alu_or = BvConst(0b1001, 4);
  auto alu_rl = BvConst(0b1010, 4);
  auto alu_rlc = BvConst(0b1011, 4);
  auto alu_rr = BvConst(0b1100, 4);
  auto alu_rrc = BvConst(0b1101, 4);
  auto alu_inc = BvConst(0b1110, 4);
  auto alu_xch = BvConst(0b1111, 4);
  auto alu_op_state_01 = Ite((op_cur == op_mul), alu_mul, Ite((op_cur == op_div), alu_div, alu_nop)); 
  auto alu_op_state_10 = Ite((op_cur == op_mul), alu_mul, Ite((op_cur == op_div), alu_div, alu_nop)); 
  auto alu_op_state_11 = Ite((op_cur == op_mul), alu_mul, Ite((op_cur == op_div), alu_div, alu_nop));
  auto alu_op_state_00 = Ite((op_cur_7_3 == op_cjne_r) | (op_cur_7_3 == op_subb_r) | (op_cur_7_1 == op_cjne_i) | (op_cur_7_1 == op_subb_i) | (op_cur == op_cjne_d) | (op_cur == op_cjne_c) | (op_cur == op_clr_a) | (op_cur == op_subb_d) | (op_cur == op_subb_c), alu_sub, Ite((op_cur == op_rrc), alu_rrc, Ite((op_cur == op_da), alu_da, Ite((op_cur_7_3 == op_anl_r) | (op_cur_7_1 == op_anl_i) | (op_cur == op_anl_d) | (op_cur == op_anl_c) | (op_cur == op_anl_dd) | (op_cur == op_anl_dc) | (op_cur == op_anl_b), alu_and, Ite((op_cur_7_3 == op_orl_r) | (op_cur_7_1 == op_orl_i) | (op_cur == op_orl_d) | (op_cur == op_orl_c) | (op_cur == op_orl_ad) | (op_cur == op_orl_cd) | (op_cur == op_orl_b), alu_or, Ite((op_cur == op_mul), alu_mul, Ite((op_cur == op_div), alu_div, Ite((op_cur == op_anl_nb) | (op_cur == op_rr), alu_rr, Ite((op_cur_7_3 == op_xch_r) | (op_cur_7_1 == op_xch_i) | (op_cur_7_1 == op_xchd) | (op_cur == op_xch_d), alu_xch, Ite((op_cur_7_3 == op_xrl_r) | (op_cur_7_1 == op_xrl_i) | (op_cur == op_xrl_d) | (op_cur == op_xrl_c) | (op_cur == op_xrl_ad) | (op_cur == op_xrl_cd), alu_xor, Ite((op_cur == op_cpl_a) | (op_cur == op_cpl_c) | (op_cur == op_cpl_b), alu_not, Ite((op_cur_7_3 == op_dec_r) | (op_cur_7_3 == op_djnz_r) | (op_cur_7_3 == op_inc_r) | (op_cur_7_1 == op_dec_i) | (op_cur_7_1 == op_inc_i) | (op_cur == op_dec_a) | (op_cur == op_dec_d) | (op_cur == op_djnz_d) | (op_cur == op_inc_a) | (op_cur == op_inc_d), alu_inc, Ite((op_cur_7_3 == op_add_r) | (op_cur_7_3 == op_addc_r) | (op_cur_7_1 == op_add_i) | (op_cur_7_1 == op_addc_i) | (op_cur == op_add_d) | (op_cur == op_add_c) | (op_cur == op_addc_d) | (op_cur == op_addc_c) | (op_cur == op_inc_dp) | (op_cur == op_jmp_d) | (op_cur == op_movc_dp) | (op_cur == op_movc_pc), alu_add, Ite((op_cur == op_orl_nb) | (op_cur == op_rl), alu_rl, Ite((op_cur == op_rlc) | (op_cur == op_swap), alu_rlc, alu_nop))))))))))))))); 


  auto ps_not = bv_const_00_2; 
  auto ps_cy = bv_const_01_2;
  auto ps_ov = bv_const_10_2;
  auto ps_ac = bv_const_11_2;
  
  auto psw_set_state_01 = Ite((op_cur == op_div) | (op_cur == op_mul), ps_ov, ps_not);
  auto psw_set_state_10 = Ite((op_cur == op_div) | (op_cur == op_mul), ps_ov, ps_not);
  auto psw_set_state_11 = Ite((op_cur == op_div) | (op_cur == op_mul), ps_ov, ps_not);
  auto psw_set_state_00 = Ite((op_cur_7_3 == op_cjne_r) | (op_cur_7_1 == op_cjne_i) | (op_cur == op_anl_b) | (op_cur == op_anl_nb) | (op_cur == op_cjne_d) | (op_cur == op_cjne_c) | (op_cur == op_clr_c) | (op_cur == op_cpl_c) | (op_cur == op_da) | (op_cur == op_mov_bc) | (op_cur == op_orl_b) | (op_cur == op_orl_nb) | (op_cur == op_rlc) | (op_cur == op_rrc) | (op_cur == op_setb_c), ps_cy, Ite((op_cur == op_div) | (op_cur == op_mul), ps_ov, Ite((op_cur_7_3 == op_add_r) | (op_cur_7_3 == op_addc_r) | (op_cur_7_3 == op_subb_r) | (op_cur_7_1 == op_add_i) | (op_cur_7_1 == op_addc_i) | (op_cur_7_1 == op_subb_i) | (op_cur == op_add_d) | (op_cur == op_add_c) | (op_cur == op_addc_d) | (op_cur == op_addc_c) | (op_cur == op_subb_d) | (op_cur == op_subb_c), ps_ac, ps_not ))); 

  auto wrs_n = BvConst(0b00, 2);
  auto wrs_acc1 = BvConst(0b01, 2);
  auto wrs_acc2 = BvConst(0b10, 2);
  auto wrs_dptr = BvConst(0b11, 2);
  auto wrs_state_01 = Ite((op_cur == op_movc_dp) | (op_cur == op_movc_pc) | (op_cur == op_movx_pa) | (op_cur_7_1 == op_movx_ia), wrs_acc1, Ite((op_cur == op_div) | (op_cur == op_mul), wrs_acc2, wrs_n));
  auto wrs_state_10 = wrs_n;
  auto wrs_state_11 = wrs_n;
  auto wrs_state_00 = Ite((op_cur_7_3 == op_add_r) | (op_cur_7_3 == op_addc_r) | (op_cur_7_3 == op_anl_r) | (op_cur_7_3 == op_mov_r) | (op_cur_7_3 == op_orl_r) | (op_cur_7_3 == op_subb_r) | (op_cur_7_3 == op_xrl_r) | (op_cur_7_1 == op_add_i) | (op_cur_7_1 == op_addc_i) | (op_cur_7_1 == op_anl_i) | (op_cur_7_1 == op_mov_i) | (op_cur_7_1 == op_orl_i) | (op_cur_7_1 == op_subb_i) | (op_cur_7_1 == op_xrl_i) | (op_cur == op_add_d) | (op_cur == op_add_c) | (op_cur == op_addc_d) | (op_cur == op_addc_c) | (op_cur == op_anl_d) | (op_cur == op_anl_c) | (op_cur == op_clr_a) | (op_cur == op_cpl_a) | (op_cur == op_da) | (op_cur == op_dec_a) | (op_cur == op_inc_a) | (op_cur == op_mov_d) | (op_cur == op_mov_c) | (op_cur == op_orl_d) | (op_cur == op_orl_c) | (op_cur == op_rl) | (op_cur == op_rlc) | (op_cur == op_rr) | (op_cur == op_rrc) | (op_cur == op_subb_d) | (op_cur == op_subb_c) | (op_cur == op_xrl_d) | (op_cur == op_xrl_c), wrs_acc1, Ite((op_cur_7_3 == op_xch_r) | (op_cur_7_1 == op_xch_i) | (op_cur_7_1 == op_xchd) | (op_cur == op_swap) | (op_cur == op_xch_d), wrs_acc2, Ite((op_cur == op_inc_dp) | (op_cur == op_mov_dp), wrs_dptr, wrs_n)));
 
  auto rws_dc = BvConst(0b000, 3);
  auto rws_rn = BvConst(0b000, 3);
  auto rws_d = BvConst(0b001, 3);
  auto rws_i = BvConst(0b010, 3);
  auto rws_sp = BvConst(0b011, 3);
  auto rws_d3 = BvConst(0b101, 3);
  auto rws_d1 = BvConst(0b110, 3);
  auto rws_b = BvConst(0b111, 3);

  // TODO: Use Child API for differnt state
  {
    auto instr = model.NewInstr("stall");
    instr.SetDecode((mem_wait == BoolConst(1)) | (wait_data == BoolConst(1)));
    instr.SetUpdate(state, state);
    instr.SetUpdate(op, Ite(state == state_00, op_in, op));
    instr.SetUpdate(mem_act, default_mem_act);
    instr.SetUpdate(ram_wr_sel, Ite(wait_data, ram_wr_sel, rws_dc));
    instr.SetUpdate(wr, Ite(wait_data, wr, BoolConst(0)));
    instr.SetUpdate(ram_rd_sel_r, ram_rd_sel_state_00);
    instr.SetUpdate(cy_sel, Ite(wait_data, cy_sel, cy_0)); 
    instr.SetUpdate(src_sel1, Ite(wait_data, src_sel1, as1_dc));
    instr.SetUpdate(src_sel2, Ite(wait_data, src_sel2, as2_dc));
    instr.SetUpdate(src_sel3, Ite(wait_data, src_sel3, as3_dc));
    instr.SetUpdate(alu_op, Ite(wait_data, alu_op, alu_nop));
    instr.SetUpdate(psw_set, Ite(wait_data, psw_set, ps_not));
    instr.SetUpdate(wr_sfr, Ite(wait_data, wr_sfr, wrs_n));
  }

  {
    auto instr = model.NewInstr("process");
    instr.SetDecode((mem_wait == BoolConst(0)) & (wait_data == BoolConst(0)) & (state == state_11));
    instr.SetUpdate(state, bv_const_10_2);
    instr.SetUpdate(mem_act, default_mem_act);
    instr.SetUpdate(ram_wr_sel, rws_dc); 
    instr.SetUpdate(wr, BoolConst(0));
    instr.SetUpdate(cy_sel, cy_0);
    instr.SetUpdate(ram_rd_sel_r, ram_rd_sel_state_11);
    instr.SetUpdate(src_sel1, src_sel1_state_11);
    instr.SetUpdate(src_sel2, src_sel2_state_11);
    instr.SetUpdate(src_sel3, src_sel3_state_11);
    instr.SetUpdate(alu_op, alu_op_state_11);
    instr.SetUpdate(psw_set, psw_set_state_11);
    instr.SetUpdate(wr_sfr, wrs_state_11);    
  }

  // auto sub_ila = model.NewChild("process_sub_ila");
  // sub_ila.SetValid((mem_wait == BoolConst(0)) & (wait_data == BoolConst(0)));

  {
    auto instr = model.NewInstr("step_0");
    // auto instr = sub_ila.NewInstr("step_0");
    instr.SetDecode((state == state_00) & (mem_wait == BoolConst(0)) & (wait_data == BoolConst(0)));
    instr.SetUpdate(state, new_state);
    instr.SetUpdate(op, op_in);
    instr.SetUpdate(mem_act, new_mem_act);
    instr.SetUpdate(ram_wr_sel, Ite(op_in_is_acall | op_in_is_lcall | op_in_is_push, rws_sp, Ite(op_in_is_dec_r | op_in_is_djnz_r | op_in_is_inc_r | op_in_is_mov_ar | op_in_is_mov_dr | op_in_is_mov_cr | op_in_is_xch_r, rws_rn, Ite(op_in_is_mov_rd | op_in_is_mov_id | op_in_is_anl_dd | op_in_is_anl_dc | op_in_is_clr_b | op_in_is_cpl_b | op_in_is_dec_d | op_in_is_djnz_d | op_in_is_inc_d | op_in_is_mov_da | op_in_is_mov_cd | op_in_is_mov_cb | op_in_is_orl_ad | op_in_is_orl_cd | op_in_is_pop | op_in_is_setb_b | op_in_is_xch_d | op_in_is_xrl_ad | op_in_is_xrl_cd, rws_d, Ite(op_in_is_dec_i | op_in_is_inc_i | op_in_is_mov_ai | op_in_is_mov_di | op_in_is_mov_ci | op_in_is_xch_i | op_in_is_xchd, rws_i, Ite(op_in_is_mov_dd, rws_d3, rws_dc)))))); 

    instr.SetUpdate(wr, Ite(op_in_is_acall | op_in_is_dec_r | op_in_is_djnz_r | op_in_is_inc_r | op_in_is_mov_ar | op_in_is_mov_dr | op_in_is_mov_cr | op_in_is_mov_rd | op_in_is_xch_r | op_in_is_dec_i | op_in_is_inc_i | op_in_is_mov_id | op_in_is_mov_ai | op_in_is_mov_di | op_in_is_mov_ci | op_in_is_xch_i | op_in_is_xchd | op_in_is_anl_dd | op_in_is_anl_dc | op_in_is_clr_b | op_in_is_cpl_b | op_in_is_dec_d | op_in_is_djnz_d | op_in_is_inc_d | op_in_is_lcall | op_in_is_mov_da | op_in_is_mov_dd | op_in_is_mov_cd | op_in_is_mov_cb | op_in_is_orl_ad | op_in_is_orl_cd | op_in_is_pop | op_in_is_push | op_in_is_setb_b | op_in_is_xch_d | op_in_is_xrl_ad | op_in_is_xrl_cd, BoolConst(1), BoolConst(0)));
    instr.SetUpdate(cy_sel, cy_sel_state_00);
    instr.SetUpdate(ram_rd_sel_r, ram_rd_sel_state_00);
    instr.SetUpdate(src_sel1, src_sel1_state_00);
    instr.SetUpdate(src_sel2, src_sel2_state_00);
    instr.SetUpdate(src_sel3, src_sel3_state_00);
    instr.SetUpdate(alu_op, alu_op_state_00);
    instr.SetUpdate(psw_set, psw_set_state_00);
    instr.SetUpdate(wr_sfr, wrs_state_00);
  }

  {
    auto instr = model.NewInstr("step_1");
    // auto instr = sub_ila.NewInstr("step_1");
    instr.SetDecode((state == state_01) & (mem_wait == BoolConst(0)) & (wait_data == BoolConst(0)));
    instr.SetUpdate(state, bv_const_00_2);
    instr.SetUpdate(mem_act, default_mem_act);
    instr.SetUpdate(ram_wr_sel, Ite(op_is_div | op_is_mul, rws_b, rws_dc));
    instr.SetUpdate(wr, Ite(op_is_mul | op_is_div, BoolConst(1), BoolConst(0)));
    instr.SetUpdate(cy_sel, cy_0);
    instr.SetUpdate(ram_rd_sel_r, ram_rd_sel_state_01);
    instr.SetUpdate(src_sel1, src_sel1_state_01);
    instr.SetUpdate(src_sel2, src_sel2_state_01);
    instr.SetUpdate(src_sel3, src_sel3_state_01);
    instr.SetUpdate(alu_op, alu_op_state_01);
    instr.SetUpdate(psw_set, psw_set_state_01);
    instr.SetUpdate(wr_sfr, wrs_state_01);
  }

  {
    auto instr = model.NewInstr("step_2");
    // auto instr = sub_ila.NewInstr("step_2");
    instr.SetDecode((state == state_10) & (mem_wait == BoolConst(0)) & (wait_data == BoolConst(0)));
    instr.SetUpdate(state, bv_const_01_2);
    instr.SetUpdate(mem_act, default_mem_act);
    instr.SetUpdate(ram_wr_sel, Ite(op_is_acall | op_is_lcall, rws_sp, Ite(op_is_jbc, rws_d, rws_dc)));
    instr.SetUpdate(wr, Ite(op_is_acall | op_is_lcall | op_is_jbc, BoolConst(1), BoolConst(0)));
    instr.SetUpdate(cy_sel, cy_0);
    instr.SetUpdate(ram_rd_sel_r, ram_rd_sel_state_10);
    instr.SetUpdate(src_sel1, src_sel1_state_10);
    instr.SetUpdate(src_sel2, src_sel2_state_10);
    instr.SetUpdate(src_sel3, src_sel3_state_10);
    instr.SetUpdate(alu_op, alu_op_state_10);
    instr.SetUpdate(psw_set, psw_set_state_10);
    instr.SetUpdate(wr_sfr, wrs_state_10);
  }

  // {
  //   auto instr = sub_ila.NewInstr("step_3");

  // }
    
}
