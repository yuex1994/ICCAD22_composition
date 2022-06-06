#include "datapath.h"

DATAPATH::DATAPATH() : model("DATAPATH") {

  auto op2 = model.NewBvInput("op2", 8);
  auto op3 = model.NewBvInput("op3", 8);
  auto src_sel1 = model.NewBvInput("src_sel1", 3);
  auto src_sel2 = model.NewBvInput("src_sel2", 2);
  auto src_sel3 = model.NewBoolInput("src_sel3");
  auto rd_addr = model.NewBvInput("rd_addr", 8);
  auto wr_addr = model.NewBvInput("wr_addr", 8);

  auto alu_op = model.NewBvInput("alu_op", 4);
  auto cy_sel = model.NewBvInput("cy_sel", 2);
  auto psw_set = model.NewBvInput("psw_set", 2);

  auto wr_ind = model.NewBoolInput("wr_ind");

  auto pc = model.NewBvInput("pc", 16);

  auto ram_rd_sel = model.NewBvInput("ram_rd_sel", 3);
  auto ram_wr_sel = model.NewBvInput("ram_wr_sel", 3);

  auto bit_addr = model.NewBoolInput("bit_addr");
  auto wr_sfr = model.NewBvInput("wr_sfr", 2);
  auto bit_in = model.NewBvInput("bit_in", 1);
  auto wr = model.NewBoolInput("wr");
  //auto rmw = model.NewBoolInput("rmw");
  auto p = model.NewBvInput("p", 1);


  auto bit_addr_r = model.NewBoolState("bit_addr_r");
  auto wait_data = model.NewBoolState("wait_data");
  auto bit_address = model.NewBvState("bit_address", 3);
  auto ram_rd_data = model.NewBvState("ram_rd_data", 8);
  auto sfr_rd_data = model.NewBvState("sfr_rd_data", 8);
  auto sfr_bit_rd_data = model.NewBvState("sfr_bit_rd_data", 1);
  auto ram_bit_rd_data = model.NewBvState("ram_bit_rd_data", 1);
  auto rd_addr_r = model.NewBoolState("rd_addr_r");
  auto wr_addr_r = model.NewBvState("wr_addr_r", 8);
  auto wr_bit_r = model.NewBoolState("wr_bit_r");
  auto ram_wr_sel_r = model.NewBvState("ram_wr_sel_r", 3);
  auto sfr_wr_addr_r = model.NewBvState("sfr_wr_addr_r", 8);
  auto rd_ind = model.NewBoolState("rd_ind");
  auto acc = model.NewBvState("acc", 8);
  auto b_reg = model.NewBvState("b_reg", 8);
  auto sp = model.NewBvState("sp", 8);
  auto pop = model.NewBoolState("pop");
  auto dptr_hi = model.NewBvState("dptr_hi", 8);
  auto dptr_lo = model.NewBvState("dptr_lo", 8);
  auto psw = model.NewBvState("psw", 7);
  auto p0 = model.NewBvState("p0", 8);
  auto p1 = model.NewBvState("p1", 8);
  auto p2 = model.NewBvState("p2", 8);
  auto p3 = model.NewBvState("p3", 8);
  auto tcon = model.NewBvState("tcon", 8);
  auto scon = model.NewBvState("scon", 8);
  auto ip = model.NewBvState("ip", 8);
  auto ie = model.NewBvState("ie", 8);
  auto pcon = model.NewBvState("pcon", 8);
  auto sbuf = model.NewBvState("sbuf", 8);
  auto th0 = model.NewBvState("th0", 8);
  auto th1 = model.NewBvState("th1", 8);
  auto tl0 = model.NewBvState("tl0", 8);
  auto tl1 = model.NewBvState("tl1", 8);
  auto tmod = model.NewBvState("tmod", 8);
  auto op2_reg = model.NewBvState("op2_reg", 8);
  auto op3_reg = model.NewBvState("op3_reg", 8);
  std::vector<ExprRef> sfr_array;
  sfr_array.push_back(acc);
  sfr_array.push_back(dptr_lo); 
  sfr_array.push_back(dptr_hi); 
  sfr_array.push_back(b_reg);
  // sfr_array.push_back(sp);
  sfr_array.push_back(tcon);
  sfr_array.push_back(scon);
  //sfr_array.push_back(ie);
  //sfr_array.push_back(ip);
  sfr_array.push_back(sbuf);
  sfr_array.push_back(pcon);
  sfr_array.push_back(th0);
  sfr_array.push_back(th1);
  sfr_array.push_back(tl0);
  sfr_array.push_back(tl1);
  sfr_array.push_back(tmod);
  sfr_array.push_back(p0);
  sfr_array.push_back(p1);
  sfr_array.push_back(p2);
  sfr_array.push_back(p3);
 

  std::vector<ExprRef> iram;
  for (int i = 0; i < (kRAM_MAX + 1); i++) {
    auto new_iram = model.NewBvState("iram_" + std::to_string(i), 8);
    iram.push_back(new_iram);
  }

  auto kWRS_N = BvConst(0, 2);
  auto kWRS_ACC1 = BvConst(1, 2);
  auto kWRS_ACC2 = BvConst(2, 2);
  auto kWRS_DPTR = BvConst(3, 2);


  auto kSFR_ACC = BvConst(0xe0, 8);
  auto kSFR_DPTR_LO = BvConst(0x82, 8);
  auto kSFR_DPTR_HI = BvConst(0x83, 8); 
  auto kSFR_B = BvConst(0xf0, 8);
  auto kSFR_PSW = BvConst(0xd0, 8);
  auto kSFR_SP = BvConst(0x81, 8);
  auto kSFR_TCON = BvConst(0x88, 8);
  auto kSFR_SCON = BvConst(0x98, 8);
  auto kSFR_IE = BvConst(0xa8, 8);
  auto kSFR_IP = BvConst(0xb8, 8);
  auto kSFR_SBUF = BvConst(0x99, 8);
  auto kSFR_PCON = BvConst(0x87, 8);
  auto kSFR_TH0 = BvConst(0x8c, 8);
  auto kSFR_TH1 = BvConst(0x8d, 8);
  auto kSFR_TL0 = BvConst(0x8a, 8);
  auto kSFR_TL1 = BvConst(0x8b, 8);
  auto kSFR_TMOD = BvConst(0x89, 8);
  auto kSFR_P0 = BvConst(0x80, 8);
  auto kSFR_P1 = BvConst(0x90, 8);
  auto kSFR_P2 = BvConst(0xa0, 8);
  auto kSFR_P3 = BvConst(0xb0, 8); 
  std::vector<ExprRef> kSFR_array;
  kSFR_array.push_back(kSFR_ACC);
  kSFR_array.push_back(kSFR_DPTR_LO);
  kSFR_array.push_back(kSFR_DPTR_HI); 
  kSFR_array.push_back(kSFR_B);
 // kSFR_array.push_back(kSFR_SP);
  kSFR_array.push_back(kSFR_TCON);
  kSFR_array.push_back(kSFR_SCON);
  //kSFR_array.push_back(kSFR_IE);
  //kSFR_array.push_back(kSFR_IP);
  kSFR_array.push_back(kSFR_SBUF);
  kSFR_array.push_back(kSFR_PCON);
  kSFR_array.push_back(kSFR_TH0);
  kSFR_array.push_back(kSFR_TH1);
  kSFR_array.push_back(kSFR_TL0);
  kSFR_array.push_back(kSFR_TL1);
  kSFR_array.push_back(kSFR_TMOD);
  kSFR_array.push_back(kSFR_P0);
  kSFR_array.push_back(kSFR_P1); 
  kSFR_array.push_back(kSFR_P2);
  kSFR_array.push_back(kSFR_P3);
 
  auto kSFR_B_ACC = BvConst(0b11100, 5);
  auto kSFR_B_PSW = BvConst(0b11010, 5);
  auto kSFR_B_P0 = BvConst(0b10000, 5);
  auto kSFR_B_P1 = BvConst(0b10010, 5);
  auto kSFR_B_P2 = BvConst(0b10100, 5);
  auto kSFR_B_P3 = BvConst(0b10110, 5);
  auto kSFR_B_B = BvConst(0b11110, 5);
  auto kSFR_B_IP = BvConst(0b10111, 5);
  auto kSFR_B_IE = BvConst(0b10101, 5);

  auto kRWS_SP = BvConst(0b011, 3);
  auto valid_sfr = (Extract(rd_addr, 7, 3) == kSFR_B_ACC) | 
  		   (Extract(rd_addr, 7, 3) == kSFR_B_PSW) |
                   (Extract(rd_addr, 7, 3) == kSFR_B_B) | 
  		   (Extract(rd_addr, 7, 3) == kSFR_B_P0) |
  		   (Extract(rd_addr, 7, 3) == kSFR_B_P1) |
  		   (Extract(rd_addr, 7, 3) == kSFR_B_P2) |
  		   (Extract(rd_addr, 7, 3) == kSFR_B_P3);

  //auto rd_addr_reg = Concat(Extract(psw, 2, 2), Extract(rd_addr, 2, 0));
  //auto reg_src = Ite(rd_addr_reg == kRAM_MAX, iram[kRAM_MAX-1], iram[kRAM_MAX]);
  //for (int i = kRAM_MAX-2; i >= 0; i--)
  //  reg_src = Ite(rd_addr_reg == i, iram[i], reg_src);


  // auto rd_addr_ram = Extract(rd_addr, 3, 0);

  std::cout << "alive" << std::endl;
  auto rd_addr_ram = rd_addr;
  auto ram_src = Ite(rd_addr_ram == BvConst((kRAM_MAX - 1), kIRAM_ADDR_SIZE), iram[kRAM_MAX-1], iram[kRAM_MAX]);

  for (int i = kRAM_MAX-2; i >= 0; i--)
    ram_src = Ite(rd_addr_ram == i, iram[i], ram_src);

  // auto rd_addr_ram_bit = Ite(Extract(rd_addr, 7, 7) == BvConst(1, 1), Extract(Concat(Concat(BvConst(1, 1), Extract(rd_addr, 6, 3)), BvConst(0, 3)), 3, 0), Extract(Concat(BvConst(0b0010, 4), Extract(rd_addr, 6, 3)), 3, 0));

  auto rd_addr_ram_bit = Ite(Extract(rd_addr, 7, 7) == BvConst(1, 1), Concat(Concat(BvConst(1, 1), Extract(rd_addr, 6, 3)), BvConst(0, 3)), Concat(BvConst(0b0010, 4), Extract(rd_addr, 6, 3)));
  auto ram_src_bit = Ite(rd_addr_ram_bit == (kRAM_MAX-1), iram[kRAM_MAX-1], iram[kRAM_MAX]);
  for (int i = (kRAM_MAX-2); i >= 0; i--)
    ram_src_bit = Ite(rd_addr_ram_bit == i, iram[i], ram_src_bit);

  auto rd_sfr_bit = Concat(Extract(rd_addr, 7, 3), BvConst(0, 3));

  auto sfr_src_bit = Ite(rd_sfr_bit == kSFR_ACC, acc, 
            Ite(rd_sfr_bit == kSFR_B, b_reg,
	    Ite(rd_sfr_bit == kSFR_PSW, Concat(psw, p),
	    Ite(rd_sfr_bit == kSFR_SP, sp,
	    Ite(rd_sfr_bit == kSFR_DPTR_LO, dptr_lo,
	    Ite(rd_sfr_bit == kSFR_DPTR_HI, dptr_hi,
	    Ite(rd_sfr_bit == kSFR_P0, p0,
	    Ite(rd_sfr_bit == kSFR_P1, p1,
	    Ite(rd_sfr_bit == kSFR_P2, p2,
	    Ite(rd_sfr_bit == kSFR_P3, p3,
	    Ite(rd_sfr_bit == kSFR_IP, ip,
	    Ite(rd_sfr_bit == kSFR_IE, ie,
	    Ite(rd_sfr_bit == kSFR_TCON, tcon,
	    Ite(rd_sfr_bit == kSFR_SCON, scon, BvConst(0, 8)))))))))))))));

  auto sfr_src = Ite(rd_addr == kSFR_ACC, acc, 
            Ite(rd_addr == kSFR_B, b_reg,
	    Ite(rd_addr == kSFR_PSW, Concat(psw, p),
	    Ite(rd_addr == kSFR_SP, sp,
	    Ite(rd_addr == kSFR_DPTR_LO, dptr_lo,
	    Ite(rd_addr == kSFR_DPTR_HI, dptr_hi,
	    Ite(rd_addr == kSFR_P0, p0,
	    Ite(rd_addr == kSFR_P1, p1,
	    Ite(rd_addr == kSFR_P2, p2,
	    Ite(rd_addr == kSFR_P3, p3, 
	    Ite(rd_addr == kSFR_IP, ip, 
	    Ite(rd_addr == kSFR_IE, ie, BvConst(0, 8)))))))))))));
//	    Ite(rd_addr == kSFR_TCON, tcon,
//	    Ite(rd_addr == kSFR_SCON, scon,
//	    Ite(rd_addr == kSFR_SBUF, sbuf,
//	    Ite(rd_addr == kSFR_PCON, pcon, 
//	    Ite(rd_addr == kSFR_TH0, th0,
//	    Ite(rd_addr == kSFR_TH1, th1, 
//	    Ite(rd_addr == kSFR_TL0, tl0,
//	    Ite(rd_addr == kSFR_TL1, tl1,
//	    Ite(rd_addr == kSFR_TMOD, tmod, BvConst(0, 8))))))))))))))))))))));

  {
    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi);
    auto instr = model.NewInstr("alu_and");
    instr.SetDecode(alu_op == BvConst(0b0111, 4));
    auto des_acc = src1 & src2;
    auto des1 = des_acc;
    auto des2 = BvConst(0, 8);
    auto desCy = srcCy & bit_in;    
    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi)));  
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 

    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
      // instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (Extract(wr_addr, 3, 0) == BvConst(i, kIRAM_ADDR_SIZE - 4)) & (wr), des1, iram[i]));      
    }
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set > BvConst(0, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 6, 6))));
    instr.SetUpdate(Extract(psw, 5, 0), Ite(wr_sfr == BvConst(0, 2) & (wr_addr == kSFR_PSW) & (wr), Extract(des_acc, 5, 0), Extract(psw, 5, 0)));

  }

  {
    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
 
    auto instr = model.NewInstr("alu_inc");
    instr.SetDecode(alu_op == BvConst(0b1110, 4));
    auto dec = Concat(src2, src1) - BvConst(1, 16);
    auto inc = Concat(src2, src1) + BvConst(1, 16);

    auto des_acc = Ite(srcCy == BvConst(1, 1), Extract(dec, 7, 0), Extract(inc, 7, 0));
    auto des1 = des_acc;
    auto des2 = Ite(srcCy == BvConst(1, 1), Extract(dec,15, 8), Extract(inc, 15, 8));
    auto desCy = BvConst(1, 1);
    auto desAc = BvConst(1, 1);
    auto desOv = BvConst(1, 1);
    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi)));  
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 

    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
    }
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set > BvConst(0, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 6, 6))));
    instr.SetUpdate(Extract(psw, 5, 0), Ite(wr_sfr == BvConst(0, 2) & (wr_addr == kSFR_PSW) & (wr), Extract(des_acc, 5, 0), Extract(psw, 5, 0)));

  }

  {
    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi); 
    auto instr = model.NewInstr("alu_not");
    instr.SetDecode(alu_op == BvConst(0b0110, 4));

    auto des_acc = ~src1;
    auto des1 = ~src1;
    auto des2 = BvConst(0, 8);
    auto desCy = ~srcCy;
    auto desAc = BoolConst(0);
    auto desOv = BoolConst(0);



    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi))); 
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 

    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
    }
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set > BvConst(0, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 6, 6))));
    instr.SetUpdate(Extract(psw, 5, 0), Ite(wr_sfr == BvConst(0, 2) & (wr_addr == kSFR_PSW) & (wr), Extract(des_acc, 5, 0), Extract(psw, 5, 0)));
 }

  {
    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi); 

    auto srcAc = Extract(psw, 5, 5);
    auto instr = model.NewInstr("alu_da");
    instr.SetDecode(alu_op == BvConst(0b0101, 4));

    auto da_tmp_des_acc_3_0 = Ite((srcAc == BvConst(1, 1)) | (Extract(src1, 3, 0) > BvConst(0b1001, 4)), Concat(BvConst(0, 1), Extract(src1, 3, 0)) + BvConst(0b00110, 5), Concat(BvConst(0, 1), Extract(src1, 3, 0))); 

    auto da_tmp1_des_acc_7_4 = Ite((srcCy == BvConst(1, 1)) | (Extract(da_tmp_des_acc_3_0, 4, 4) == BvConst(1, 1)) | (Extract(src1, 7, 4) > BvConst(0b1001, 4)), Concat(srcCy, Extract(src1, 7, 4)) + BvConst(0b00110, 5) + Concat(BvConst(0, 4), Extract(da_tmp_des_acc_3_0, 4, 4)), Concat(srcCy, Extract(src1, 7, 4)) + Concat(BvConst(0, 4), Extract(da_tmp_des_acc_3_0, 4, 4)));

    auto desCy = Extract(da_tmp_des_acc_3_0, 4, 4) | Extract(da_tmp1_des_acc_7_4, 4, 4);
    auto des1 = src1;
    auto des2 = BvConst(0, 8);
    auto desAc = BoolConst(0);
    auto desOv = BoolConst(0);
    auto des_acc = Concat(Extract(da_tmp1_des_acc_7_4, 3, 0), Extract(da_tmp_des_acc_3_0, 3, 0));
    
    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi)));  
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 
    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
    }
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set == BvConst(1, 2), desCy, Extract(psw, 6, 6)));
    instr.SetUpdate(Extract(psw, 5, 5), Extract(psw, 5, 5));
    instr.SetUpdate(Extract(psw, 1, 1), Extract(psw, 1, 1));
  }


  {
    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi); 

    auto srcAc = Extract(psw, 5, 5);
    auto mul_des1 = FuncRef("mul_des1", SortRef::BV(8));
    auto mul_des2 = FuncRef("mul_des2", SortRef::BV(8));
    auto mul_ov = FuncRef("mul_ov", SortRef::BOOL());
    auto instr = model.NewInstr("alu_mul");
    instr.SetDecode(alu_op == BvConst(0b0011, 4));

    auto des_acc = mul_des1();
    auto des1 = src1;
    auto des2 = mul_des2();
    auto desOv = mul_ov(); 
    auto desCy = BvConst(0, 1);
    auto desAc = BvConst(0, 1);
    
    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi)));  
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 
    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
    }
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set == BvConst(1, 2), desCy, Extract(psw, 6, 6)));
    instr.SetUpdate(Extract(psw, 5, 5), Extract(psw, 5, 5));
    instr.SetUpdate(Extract(psw, 1, 1), Extract(psw, 1, 1));
  }

{
    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi); 

    auto srcAc = Extract(psw, 5, 5);
    auto div_des1 = FuncRef("div_des1", SortRef::BV(8));
    auto div_des2 = FuncRef("div_des2", SortRef::BV(8));
    auto div_ov = FuncRef("div_ov", SortRef::BOOL());
    auto instr = model.NewInstr("alu_div");
    instr.SetDecode(alu_op == BvConst(0b0100, 4));

    auto des_acc = div_des1();
    auto des1 = src1;
    auto des2 = div_des2();
    auto desOv = div_ov(); 
    auto desCy = BvConst(0, 1);
    auto desAc = BvConst(0, 1);
    
    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi)));  
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 
    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
    }
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set == BvConst(1, 2), desCy, Extract(psw, 6, 6)));
    instr.SetUpdate(Extract(psw, 5, 5), Extract(psw, 5, 5));
    instr.SetUpdate(Extract(psw, 1, 1), Extract(psw, 1, 1));
  }

  /*{
    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), BvConst(1, 1))); 
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, acc);
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi);
    auto instr = model.NewInstr("alu_rr");
    instr.SetDecode(alu_op == BvConst(0b1100, 4));
    auto des_acc = Concat(Extract(src1, 0, 0), Extract(src1, 7, 1));
    auto des1 = src1;
    auto des2 = BvConst(0, 8);
    auto desCy = srcCy & ~bit_in;

    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_ACC) & (wr), des_acc, acc)))); 
    for (int i = 1; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = 0; i < 16; i++) {
      instr.SetUpdate(iram[i], Ite(wr_sfr == BvConst(0, 2) & (Extract(wr_addr_r, 7, 7) == BvConst(0, 1)) & (Extract(wr_addr_r, 3, 0) == BvConst(i, 4)) & (wr), des_acc, iram[i]));
    }
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set == BvConst(1, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 6, 6))));
    instr.SetUpdate(Extract(psw, 5, 0), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 5, 0), Extract(psw, 5, 0)));

  }*/

  {
    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi);
    auto instr = model.NewInstr("alu_sub");
    instr.SetDecode(alu_op == BvConst(0b0010, 4));
    auto sub1 = Concat(BvConst(1, 1), Extract(src1, 3, 0));
    auto sub2 = Concat(BvConst(0, 1), Extract(src2, 3, 0));
    auto sub3 = Concat(BvConst(0, 4), srcCy);
    auto sub4 = sub1 - sub2 - sub3;
    
    auto sub5 = Concat(BvConst(1, 1), Extract(src1, 6, 4));
    auto sub6 = Concat(BvConst(0, 1), Extract(src2, 6, 4));
    auto sub7 = Concat(BvConst(0, 3), ~Extract(sub4, 4, 4));
    auto sub8 = sub5 - sub6 - sub7;

    auto sub9 = Concat(BvConst(1, 1), Extract(src1, 7, 7));
    auto suba = Concat(BvConst(0, 1), Extract(src2, 7, 7));
    auto subb = Concat(BvConst(0, 1), ~Extract(sub8, 3, 3));
    auto subc = sub9 - suba - subb;

    auto sub_result = Concat(Concat(Extract(subc, 0, 0), Extract(sub8, 2, 0)), Extract(sub4, 3, 0));
    auto des_acc = sub_result;
    auto des1 = BvConst(0, 8);
    auto des2 = BvConst(0, 8);
    auto desCy = ~Extract(subc, 1, 1);
    auto desAc = ~Extract(sub4, 4, 4);
    auto desOv = (~Extract(subc, 1, 1)) & (~Extract(sub8, 3, 3));
    

    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi))); 
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 

    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
    }
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set > BvConst(0, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 6, 6))));
    instr.SetUpdate(Extract(psw, 5, 0), Ite(wr_sfr == BvConst(0, 2) & (wr_addr == kSFR_PSW) & (wr), Extract(des_acc, 5, 0), Extract(psw, 5, 0)));
 
  }

  {
    auto instr = model.NewInstr("alu_or");
    instr.SetDecode(alu_op == BvConst(9, 4));
//    instr.SetUpdate(bit_address, Ite((rd_sfr_bit == kSFR_ACC) | (rd_sfr_bit == kSFR_B) |
//    				     (rd_sfr_bit == kSFR_PSW) | (rd_sfr_bit == kSFR_SP) |
//				     (rd_sfr_bit == kSFR_DPTR_LO) | (rd_sfr_bit == kSFR_DPTR_HI) |
//				     (rd_sfr_bit == kSFR_P0) | (rd_sfr_bit == kSFR_P1) |
//				     (rd_sfr_bit == kSFR_P2) | (rd_sfr_bit == kSFR_P3) |
//				     (rd_sfr_bit == kSFR_IP) | (rd_sfr_bit == kSFR_IE) |
//				     (rd_sfr_bit == kSFR_TCON) | (rd_sfr_bit == kSFR_SCON), BvConst(0, 3), Extract(rd_addr, 2, 0)));
    instr.SetUpdate(op2_reg, op2);
    instr.SetUpdate(op3_reg, op3);


    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi); 
    auto des_acc = src1 | src2;
    auto des1 = des_acc;
    auto des2 = BvConst(0, 8);
    auto desCy = srcCy | bit_in;
    auto desAc = BvConst(0, 1);
    auto desOv = BvConst(0, 1);


    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi))); 
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
 
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 
    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
    }

 
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set > BvConst(0, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 7, 7), Extract(psw, 6, 6))));
    instr.SetUpdate(Extract(psw, 5, 5), Ite(psw_set > BvConst(1, 2), desAc, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 5, 5))));
    instr.SetUpdate(Extract(psw, 1, 1), Ite(psw_set > BvConst(2, 2), desOv, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 2, 2), Extract(psw, 1, 1))));
    instr.SetUpdate(Extract(psw, 4, 2), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 5, 3), Extract(psw, 4, 2)));
    instr.SetUpdate(Extract(psw, 1, 1), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 1, 1), Extract(psw, 0, 0)));
  }

  {
    auto instr = model.NewInstr("alu_rl");
    instr.SetDecode(alu_op == BvConst(10, 4));
//    instr.SetUpdate(bit_address, Ite((rd_sfr_bit == kSFR_ACC) | (rd_sfr_bit == kSFR_B) |
//    				     (rd_sfr_bit == kSFR_PSW) | (rd_sfr_bit == kSFR_SP) |
//				     (rd_sfr_bit == kSFR_DPTR_LO) | (rd_sfr_bit == kSFR_DPTR_HI) |
//				     (rd_sfr_bit == kSFR_P0) | (rd_sfr_bit == kSFR_P1) |
//				     (rd_sfr_bit == kSFR_P2) | (rd_sfr_bit == kSFR_P3) |
//				     (rd_sfr_bit == kSFR_IP) | (rd_sfr_bit == kSFR_IE) |
//				     (rd_sfr_bit == kSFR_TCON) | (rd_sfr_bit == kSFR_SCON), BvConst(0, 3), Extract(rd_addr, 2, 0)));
    instr.SetUpdate(op2_reg, op2);
    instr.SetUpdate(op3_reg, op3);

    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi);  
    auto des_acc = Concat(Extract(src1, 6, 0), Extract(src1, 7, 7));
    auto des1 = src1;
    auto des2 = BvConst(0, 8);
    auto desCy = srcCy | (~bit_in);
    auto desAc = BvConst(0, 1);
    auto desOv = BvConst(0, 1);
 
    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi))); 
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
 
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 
    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
    } 
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set > BvConst(0, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 7, 7), Extract(psw, 6, 6))));
    instr.SetUpdate(Extract(psw, 5, 5), Ite(psw_set > BvConst(1, 2), desAc, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 5, 5))));
    instr.SetUpdate(Extract(psw, 1, 1), Ite(psw_set > BvConst(2, 2), desOv, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 2, 2), Extract(psw, 1, 1))));
    instr.SetUpdate(Extract(psw, 4, 2), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 5, 3), Extract(psw, 4, 2)));
    instr.SetUpdate(Extract(psw, 0, 0), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 1, 1), Extract(psw, 0, 0)));
  }

  {
    auto instr = model.NewInstr("alu_rlc");
    instr.SetDecode(alu_op == BvConst(11, 4));
//    instr.SetUpdate(bit_address, Ite((rd_sfr_bit == kSFR_ACC) | (rd_sfr_bit == kSFR_B) |
//    				     (rd_sfr_bit == kSFR_PSW) | (rd_sfr_bit == kSFR_SP) |
//				     (rd_sfr_bit == kSFR_DPTR_LO) | (rd_sfr_bit == kSFR_DPTR_HI) |
//				     (rd_sfr_bit == kSFR_P0) | (rd_sfr_bit == kSFR_P1) |
//				     (rd_sfr_bit == kSFR_P2) | (rd_sfr_bit == kSFR_P3) |
//				     (rd_sfr_bit == kSFR_IP) | (rd_sfr_bit == kSFR_IE) |
//				     (rd_sfr_bit == kSFR_TCON) | (rd_sfr_bit == kSFR_SCON), BvConst(0, 3), Extract(rd_addr, 2, 0)));
    instr.SetUpdate(op2_reg, op2);
    instr.SetUpdate(op3_reg, op3);

    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi);  
    auto des_acc = Concat(Extract(src1, 6, 0), srcCy);
    auto des1 = src1;
    auto des2 = Concat(Extract(src1, 3, 0), Extract(src1, 7, 4));
    auto desCy = Extract(src1, 7, 7);
    auto desAc = BvConst(0, 1);
    auto desOv = BvConst(0, 1);

    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi))); 
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
 
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 
    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
    }

    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set > BvConst(0, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 7, 7), Extract(psw, 6, 6))));
    instr.SetUpdate(Extract(psw, 5, 5), Ite(psw_set > BvConst(1, 2), desAc, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 5, 5))));
    instr.SetUpdate(Extract(psw, 1, 1), Ite(psw_set > BvConst(2, 2), desOv, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 2, 2), Extract(psw, 1, 1))));
    instr.SetUpdate(Extract(psw, 4, 2), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 5, 3), Extract(psw, 4, 2)));
    instr.SetUpdate(Extract(psw, 0, 0), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 1, 1), Extract(psw, 0, 0)));

  }


  {
    auto instr = model.NewInstr("alu_rr");
    instr.SetDecode(alu_op == BvConst(12, 4));
//    instr.SetUpdate(bit_address, Ite((rd_sfr_bit == kSFR_ACC) | (rd_sfr_bit == kSFR_B) |
//    				     (rd_sfr_bit == kSFR_PSW) | (rd_sfr_bit == kSFR_SP) |
//				     (rd_sfr_bit == kSFR_DPTR_LO) | (rd_sfr_bit == kSFR_DPTR_HI) |
//				     (rd_sfr_bit == kSFR_P0) | (rd_sfr_bit == kSFR_P1) |
//				     (rd_sfr_bit == kSFR_P2) | (rd_sfr_bit == kSFR_P3) |
//				     (rd_sfr_bit == kSFR_IP) | (rd_sfr_bit == kSFR_IE) |
//				     (rd_sfr_bit == kSFR_TCON) | (rd_sfr_bit == kSFR_SCON), BvConst(0, 3), Extract(rd_addr, 2, 0)));
    instr.SetUpdate(op2_reg, op2);
    instr.SetUpdate(op3_reg, op3);

    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi);   
    auto des_acc = Concat(Extract(src1, 0, 0), Extract(src1, 7, 1));
    auto des1 = src1;
    auto des2 = BvConst(0, 8);
    auto desCy = srcCy | (~bit_in);
    auto desAc = BvConst(0, 1);
    auto desOv = BvConst(0, 1);
    
    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi))); 
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
 
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 
    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
    }
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set > BvConst(0, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 7, 7), Extract(psw, 6, 6))));
    instr.SetUpdate(Extract(psw, 5, 5), Ite(psw_set > BvConst(1, 2), desAc, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 5, 5))));
    instr.SetUpdate(Extract(psw, 1, 1), Ite(psw_set > BvConst(2, 2), desOv, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 2, 2), Extract(psw, 1, 1))));
    instr.SetUpdate(Extract(psw, 4, 2), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 5, 3), Extract(psw, 4, 2)));
    instr.SetUpdate(Extract(psw, 0, 0), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 1, 1), Extract(psw, 0, 0)));

  }

  {
    auto instr = model.NewInstr("alu_rrc");
    instr.SetDecode(alu_op == BvConst(13, 4));
//    instr.SetUpdate(bit_address, Ite((rd_sfr_bit == kSFR_ACC) | (rd_sfr_bit == kSFR_B) |
//    				     (rd_sfr_bit == kSFR_PSW) | (rd_sfr_bit == kSFR_SP) |
//				     (rd_sfr_bit == kSFR_DPTR_LO) | (rd_sfr_bit == kSFR_DPTR_HI) |
//				     (rd_sfr_bit == kSFR_P0) | (rd_sfr_bit == kSFR_P1) |
//				     (rd_sfr_bit == kSFR_P2) | (rd_sfr_bit == kSFR_P3) |
//				     (rd_sfr_bit == kSFR_IP) | (rd_sfr_bit == kSFR_IE) |
//				     (rd_sfr_bit == kSFR_TCON) | (rd_sfr_bit == kSFR_SCON), BvConst(0, 3), Extract(rd_addr, 2, 0)));
    instr.SetUpdate(op2_reg, op2);
    instr.SetUpdate(op3_reg, op3);


    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi); 
    auto des_acc = Concat(srcCy, Extract(src1, 7, 1));
    auto des1 = src1;
    auto des2 = BvConst(0, 8);
    auto desCy = Extract(src1, 0, 0);
    auto desAc = BvConst(0, 1);
    auto desOv = BvConst(0, 1);

    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi))); 
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
 
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 
    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
    }
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set > BvConst(0, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 7, 7), Extract(psw, 6, 6))));
    instr.SetUpdate(Extract(psw, 5, 5), Ite(psw_set > BvConst(1, 2), desAc, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 5, 5))));
    instr.SetUpdate(Extract(psw, 1, 1), Ite(psw_set > BvConst(2, 2), desOv, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 2, 2), Extract(psw, 1, 1))));
    instr.SetUpdate(Extract(psw, 4, 2), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 5, 3), Extract(psw, 4, 2)));
    instr.SetUpdate(Extract(psw, 0, 0), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 1, 1), Extract(psw, 0, 0)));

  }

  {
    auto instr = model.NewInstr("alu_xch");
    instr.SetDecode(alu_op == BvConst(15, 4));
//    instr.SetUpdate(bit_address, Ite((rd_sfr_bit == kSFR_ACC) | (rd_sfr_bit == kSFR_B) |
//    				     (rd_sfr_bit == kSFR_PSW) | (rd_sfr_bit == kSFR_SP) |
//				     (rd_sfr_bit == kSFR_DPTR_LO) | (rd_sfr_bit == kSFR_DPTR_HI) |
//				     (rd_sfr_bit == kSFR_P0) | (rd_sfr_bit == kSFR_P1) |
//				     (rd_sfr_bit == kSFR_P2) | (rd_sfr_bit == kSFR_P3) |
//				     (rd_sfr_bit == kSFR_IP) | (rd_sfr_bit == kSFR_IE) |
//				     (rd_sfr_bit == kSFR_TCON) | (rd_sfr_bit == kSFR_SCON), BvConst(0, 3), Extract(rd_addr, 2, 0)));
    instr.SetUpdate(op2_reg, op2);
    instr.SetUpdate(op3_reg, op3);

    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi); 

    auto des_acc = Ite(srcCy == BvConst(1, 1), src2, Concat(Extract(src1, 7, 4), Extract(src2, 3, 0)));
    auto des1 = des_acc;
    auto des2 = Ite(srcCy == BvConst(1, 1), src1, Concat(Extract(src2, 7, 4), Extract(src1, 3, 0)));
    auto desCy = BvConst(0, 1);
    auto desAc = BvConst(0, 1);
    auto desOv = BvConst(0, 1);
    
    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi))); 
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    } 
    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
    }
 
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set > BvConst(0, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 7, 7), Extract(psw, 6, 6))));
    instr.SetUpdate(Extract(psw, 5, 5), Ite(psw_set > BvConst(1, 2), desAc, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 5, 5))));
    instr.SetUpdate(Extract(psw, 1, 1), Ite(psw_set > BvConst(2, 2), desOv, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 2, 2), Extract(psw, 1, 1))));
    instr.SetUpdate(Extract(psw, 4, 2), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 5, 3), Extract(psw, 4, 2)));
    instr.SetUpdate(Extract(psw, 1, 1), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 1, 1), Extract(psw, 0, 0)));

  }

  {
    auto instr = model.NewInstr("alu_xor");
    instr.SetDecode(alu_op == BvConst(8, 4));
//    instr.SetUpdate(bit_address, Ite((rd_sfr_bit == kSFR_ACC) | (rd_sfr_bit == kSFR_B) |
//    				     (rd_sfr_bit == kSFR_PSW) | (rd_sfr_bit == kSFR_SP) |
//				     (rd_sfr_bit == kSFR_DPTR_LO) | (rd_sfr_bit == kSFR_DPTR_HI) |
//				     (rd_sfr_bit == kSFR_P0) | (rd_sfr_bit == kSFR_P1) |
//				     (rd_sfr_bit == kSFR_P2) | (rd_sfr_bit == kSFR_P3) |
//				     (rd_sfr_bit == kSFR_IP) | (rd_sfr_bit == kSFR_IE) |
//				     (rd_sfr_bit == kSFR_TCON) | (rd_sfr_bit == kSFR_SCON), BvConst(0, 3), Extract(rd_addr, 2, 0)));
    instr.SetUpdate(op2_reg, op2);
    instr.SetUpdate(op3_reg, op3);

    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1))));
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi); 

    auto des_acc = src1 ^ src2;
    auto des1 = des_acc;
    auto des2 = BvConst(0, 8);
    auto desCy = srcCy | bit_in;
    auto desAc = BvConst(0, 1);
    auto desOv = BvConst(0, 1);

    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc))));
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi))); 
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 

    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
    }

    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set > BvConst(0, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 7, 7), Extract(psw, 6, 6))));
    instr.SetUpdate(Extract(psw, 5, 5), Ite(psw_set > BvConst(1, 2), desAc, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 5, 5))));
    instr.SetUpdate(Extract(psw, 1, 1), Ite(psw_set > BvConst(2, 2), desOv, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 2, 2), Extract(psw, 1, 1))));
    instr.SetUpdate(Extract(psw, 4, 2), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 5, 3), Extract(psw, 4, 2)));
    instr.SetUpdate(Extract(psw, 1, 1), Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 1, 1), Extract(psw, 0, 0)));
  }

  {  
    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), Ite(cy_sel == BvConst(0b10, 2), Ite(rd_addr_r == BoolConst(1) & (rd_ind == BoolConst(0)), sfr_bit_rd_data, ram_bit_rd_data), BvConst(1, 1)))); 
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel1 == BvConst(2, 3), op3_reg, Ite(src_sel1 == BvConst(4, 3), Extract(pc, 15, 8), Ite(src_sel1 == BvConst(5, 3), Extract(pc, 7, 0), Ite(src_sel1 == BvConst(3, 3), acc, BvConst(0, 8)))))));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi);
    auto instr = model.NewInstr("alu_add");
    instr.SetDecode(alu_op == BvConst(0b0001, 4));
    auto add1 = Concat(BvConst(0, 1), Extract(src1, 3, 0));
    auto add2 = Concat(BvConst(0, 1), Extract(src2, 3, 0));
    auto add3 = Concat(BvConst(0, 4), srcCy);
    auto add4 = add1 + add2 + add3;
    
    auto add5 = Concat(BvConst(0, 1), Extract(src1, 6, 4));
    auto add6 = Concat(BvConst(0, 1), Extract(src2, 6, 4));
    auto add7 = Concat(BvConst(0, 3), Extract(add4, 4, 4));
    auto add8 = add5 + add6 + add7;

    auto add9 = Concat(BvConst(0, 1), Extract(src1, 7, 7));
    auto adda = Concat(BvConst(0, 1), Extract(src2, 7, 7));
    auto addb = Concat(BvConst(0, 1), Extract(add8, 3, 3));
    auto addc = add9 + adda + addb;

    auto des_acc = Concat(Concat(Extract(addc, 0, 0), Extract(add8, 2, 0)), Extract(add4, 3, 0));
    auto des1 = src1;
    auto des2 = src3 + Concat(BvConst(0, 7), Extract(addc, 1, 1));
    auto desCy = Extract(addc, 1, 1);
    auto desAc = Extract(add4, 4, 4);
    auto desOv = Extract(addc, 1, 1) ^ Extract(add8, 3, 3);
    // TODO: some sfr want des1

    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite((wr_addr == kSFR_ACC) & (wr), des_acc, acc)))); 
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite((wr_addr == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite((wr_addr == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi))); 
    for (int i = 3; i < sfr_array.size() - 4; i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = sfr_array.size() - 4; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite((wr_addr == kSFR_array[i]) & (wr), des1, sfr_array[i]));
    }
    instr.SetUpdate(sp, Ite((wr_addr == kSFR_SP) & (wr), des1, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)))); 

    for (int i = 0; i < (kRAM_MAX + 1); i++) {
      instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (wr_addr == BvConst(i, kIRAM_ADDR_SIZE)) & (wr), des1, iram[i]));
      // instr.SetUpdate(iram[i], Ite((Extract(wr_addr, 7, 7) == BvConst(0, 1)) & (Extract(wr_addr, 3, 0) == BvConst(i, kIRAM_ADDR_SIZE - 4)) & (wr), des1, iram[i]));
    }
    instr.SetUpdate(Extract(psw, 6, 6), Ite(psw_set > BvConst(0, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 6, 6))));
    instr.SetUpdate(Extract(psw, 5, 0), Ite(wr_sfr == BvConst(0, 2) & (wr_addr == kSFR_PSW) & (wr), Extract(des_acc, 5, 0), Extract(psw, 5, 0)));

  }

  {
    auto instr = model.NewInstr("read_data");
    instr.SetDecode(alu_op == BvConst(0, 4));
    instr.SetUpdate(bit_addr_r, bit_addr);
    instr.SetUpdate(bit_address, Extract(rd_addr, 2, 0));
//    instr.SetUpdate(bit_address, Ite((rd_sfr_bit == kSFR_ACC) | (rd_sfr_bit == kSFR_B) |
//    				     (rd_sfr_bit == kSFR_PSW) | (rd_sfr_bit == kSFR_SP) |
//				     (rd_sfr_bit == kSFR_DPTR_LO) | (rd_sfr_bit == kSFR_DPTR_HI) |
//				     (rd_sfr_bit == kSFR_P0) | (rd_sfr_bit == kSFR_P1) |
//				     (rd_sfr_bit == kSFR_P2) | (rd_sfr_bit == kSFR_P3) |
//				     (rd_sfr_bit == kSFR_IP) | (rd_sfr_bit == kSFR_IE) |
//				     (rd_sfr_bit == kSFR_TCON) | (rd_sfr_bit == kSFR_SCON), BvConst(0, 3), Extract(rd_addr, 2, 0)));
    instr.SetUpdate(rd_addr_r, Extract(rd_addr, 7, 7));
    instr.SetUpdate(rd_ind, ram_rd_sel == BvConst(1, 3));
    instr.SetUpdate(wr_addr_r, wr_addr);
    instr.SetUpdate(ram_rd_data, Ite(bit_addr, ram_src_bit, ram_src));
    instr.SetUpdate(sfr_rd_data, Ite(bit_addr, sfr_src_bit, sfr_src)); 
    instr.SetUpdate(op2_reg, op2);
    instr.SetUpdate(op3_reg, op3);


    auto srcCy = Ite(cy_sel == BvConst(0b00, 2), BvConst(0, 1), Ite(cy_sel == BvConst(0b01, 2), Extract(psw, 6, 6), BvConst(1, 1))); 
    auto src1 = Ite(src_sel1 == BvConst(0b001, 3), op2_reg, Ite(src_sel1 == BvConst(0b010, 3), op3_reg, Ite(src_sel1 == BvConst(0, 3), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), acc)));
    auto src2 = Ite(src_sel2 == BvConst(0b00, 2), Ite((rd_addr_r == BoolConst(1)) & (rd_ind == BoolConst(0)), sfr_rd_data, ram_rd_data), Ite(src_sel2 == BvConst(2, 2), BvConst(0, 8), Ite(src_sel2 == BvConst(3, 2), op2_reg, acc)));
    auto src3 = Ite(src_sel3 == BoolConst(1), Extract(pc, 15, 8), dptr_hi); 
    auto des_acc = src1;
    auto des1 = src1;
    auto des2 = src2;
    auto desCy = srcCy;
    auto desAc = Extract(psw, 5, 5);
    auto desOv = BvConst(0, 1);

    /*
    instr.SetUpdate(acc, Ite(wr_sfr == BvConst(0b10, 2), des2, Ite(wr_sfr == BvConst(1, 2), des_acc, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_ACC) & (wr), des_acc, acc)))); 
    instr.SetUpdate(dptr_lo, Ite(wr_sfr == BvConst(0b11, 2), des_acc, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_DPTR_LO) & (wr), des_acc, dptr_lo))); 
    instr.SetUpdate(dptr_hi, Ite(wr_sfr == BvConst(0b11, 2), des2, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_DPTR_HI) & (wr), des_acc, dptr_hi))); 
    for (int i = 3; i < sfr_array.size(); i++) {
      instr.SetUpdate(sfr_array[i], Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_array[i]) & (wr), des_acc, sfr_array[i]));
    }
    for (int i = 0; i < 16; i++) {
      instr.SetUpdate(iram[i], Ite(wr_sfr == BvConst(0, 2) & (Extract(wr_addr_r, 3, 0) == BvConst(i, 4)) & (wr), des_acc, iram[i]));
    }
    auto update_psw_6_6 = Ite(psw_set > BvConst(0, 2), desCy, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 7, 7), Extract(psw, 6, 6)));
    auto update_psw_5_5 = Ite(psw_set > BvConst(1, 2), desAc, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 6, 6), Extract(psw, 5, 5)));
    auto update_psw_1_1 = Ite(psw_set > BvConst(2, 2), desOv, Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 2, 2), Extract(psw, 1, 1)));
    auto update_psw_4_2 = Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 5, 3), Extract(psw, 4, 2));
    auto update_psw_0_0 = Ite(wr_sfr == BvConst(0, 2) & (wr_addr_r == kSFR_PSW) & (wr), Extract(des_acc, 1, 1), Extract(psw, 0, 0));
    instr.SetUpdate(psw, Concat(update_psw_6_6, Concat(update_psw_5_5, Concat(update_psw_4_2, Concat(update_psw_1_1, update_psw_0_0)))));
    */

  }
  
    auto des_acc_func = FuncRef("des_acc_func", SortRef::BV(8));
    auto des1_func = FuncRef("des1_func", SortRef::BV(8));
    auto des2_func = FuncRef("des2_func", SortRef::BV(8));
    auto desCy_func = FuncRef("desCy_func", SortRef::BV(1));
    auto psw_next_func = FuncRef("psw_next_func", SortRef::BV(8));
    auto des_acc_res = des_acc_func();
    auto des1_res = des1_func();
    auto des2_res = des2_func();
    auto desCy_res = desCy_func();
    auto psw_next_res = psw_next_func();

  {
    auto instr = model.NewInstr("no_wr");
    auto resolved_rd_addr = resolve_addr(rd_addr, bit_addr);
    auto resolved_rd_addr_4 = Extract(resolved_rd_addr, 7, 0);
    auto rd_addr_7_3 = Extract(rd_addr, 7, 3);
    auto rd_addr_2_0 = Extract(rd_addr, 2, 0);
    auto rd_data = Ite(resolved_rd_addr_4 == (kRAM_MAX - 1), iram[kRAM_MAX-1], iram[kRAM_MAX]);
    for (int i = (kRAM_MAX-2); i >= 0; i--)
      rd_data = Ite(resolved_rd_addr_4 == i, iram[i], rd_data);

    // auto resolved_wr_addr = resolve_addr(wr_addr, bit_addr_r);
    instr.SetDecode(wr == BoolConst(0));
    instr.SetUpdate(ram_rd_data, rd_data);
    instr.SetUpdate(bit_addr_r, bit_addr);
    instr.SetUpdate(bit_address, Extract(rd_addr, 2, 0));
    instr.SetUpdate(rd_addr_r, Extract(rd_addr, 7, 7));
    instr.SetUpdate(rd_ind, (ram_rd_sel == BvConst(1, 3)) | (ram_rd_sel == BvConst(3, 3)));
    instr.SetUpdate(sfr_rd_data, Ite((wr_sfr == kWRS_DPTR) & (rd_addr == kSFR_DPTR_LO), des_acc_res, 
    				 Ite((((wr_sfr == kWRS_ACC1) & (rd_addr == kSFR_ACC)) | ((wr_sfr == kWRS_ACC2) & (rd_addr == kSFR_ACC)) | ((wr_sfr == kWRS_DPTR) & (rd_addr == kSFR_DPTR_HI))) & (wait_data == BoolConst(0)), sfr_rd_data, Ite(rd_addr == kSFR_SP, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)), sfr_src))));
    instr.SetUpdate(sfr_bit_rd_data, Ite((wr_sfr == kWRS_ACC1) & (rd_addr_7_3 == kSFR_B_ACC), get_bit(des_acc_res, rd_addr_2_0), 
    				     Ite(rd_addr_7_3 == kSFR_B_ACC, get_bit(acc, rd_addr_2_0), 
				     Ite(rd_addr_7_3 == kSFR_B_PSW, get_bit(psw_next_res, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_P0, get_bit(p0, rd_addr_2_0), 
				     Ite(rd_addr_7_3 == kSFR_B_P1, get_bit(p1, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_P2, get_bit(p2, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_P3, get_bit(p3, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_B, get_bit(b_reg, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_IP, get_bit(ip, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_IE, get_bit(ie, rd_addr_2_0), BvConst(0, 1)))))))))))); 
    instr.SetUpdate(op2_reg, op2);
    instr.SetUpdate(op3_reg, op3);

  }

  {
    auto instr = model.NewInstr("wr_sfr");
    auto resolved_rd_addr = resolve_addr(rd_addr, bit_addr);
    auto resolved_rd_addr_4 = Extract(resolved_rd_addr, 7, 0);
    auto rd_addr_7_3 = Extract(rd_addr, 7, 3);
    auto rd_addr_2_0 = Extract(rd_addr, 2, 0);
    auto rd_data = Ite(resolved_rd_addr_4 == (kRAM_MAX - 1), iram[kRAM_MAX-1], iram[kRAM_MAX]);
    for (int i = (kRAM_MAX-2); i >= 0; i--)
      rd_data = Ite(resolved_rd_addr_4 == i, iram[i], rd_data);

    // auto resolved_wr_addr = resolve_addr(wr_addr, bit_addr_r);
    instr.SetDecode(wr & ((Extract(wr_addr, 7, 7) == BvConst(1, 1)) & (wr_ind == BoolConst(0))));
    instr.SetUpdate(ram_rd_data, rd_data);
    instr.SetUpdate(bit_addr_r, bit_addr);
    instr.SetUpdate(bit_address, Extract(rd_addr, 2, 0));
    instr.SetUpdate(rd_addr_r, Extract(rd_addr, 7, 7));
    instr.SetUpdate(rd_ind, (ram_rd_sel == BvConst(1, 3)) | (ram_rd_sel == BvConst(3, 3)));
    instr.SetUpdate(sfr_rd_data, Ite((wr_sfr == kWRS_DPTR) & (rd_addr == kSFR_DPTR_LO), des_acc_res, 
    				 Ite((((wr_sfr == kWRS_ACC1) & (rd_addr == kSFR_ACC)) | 
				      ((wr_sfr == kWRS_ACC2) & (rd_addr == kSFR_ACC)) | 
				      ((wr_sfr == kWRS_DPTR) & (rd_addr == kSFR_DPTR_HI)) | 
				      ((Extract(wr_addr, 7, 7) == BvConst(1, 1)) & (rd_addr == wr_addr) & (wr_bit_r == BoolConst(0))) |
				      ((Extract(wr_addr, 7, 7) == BvConst(1, 1)) & (Extract(rd_addr, 7, 3) == Extract(wr_addr, 7, 3)) & (wr_bit_r) & (Extract(rd_addr, 2, 0) != BvConst(7, 3))) ) & (wait_data == BoolConst(0)), sfr_rd_data, Ite(rd_addr == kSFR_SP, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)), sfr_src))));

    instr.SetUpdate(sfr_bit_rd_data, Ite(((Extract(rd_addr, 7, 3) == Extract(wr_addr, 7, 3)) & (wr_bit_r == BoolConst(0)) & (Extract(wr_addr, 2, 0) == BvConst(0, 3)) & (valid_sfr)), get_bit(des1_res, rd_addr_2_0),
    				     Ite((wr_sfr == kWRS_ACC1) & (rd_addr_7_3 == kSFR_B_ACC), get_bit(des_acc_res, rd_addr_2_0), 
				     Ite((rd_addr == wr_addr) & (wr_bit_r) & (valid_sfr), desCy_res,
    				     Ite(rd_addr_7_3 == kSFR_B_ACC, get_bit(acc, rd_addr_2_0), 
				     Ite(rd_addr_7_3 == kSFR_B_PSW, get_bit(psw_next_res, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_P0, get_bit(p0, rd_addr_2_0), 
				     Ite(rd_addr_7_3 == kSFR_B_P1, get_bit(p1, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_P2, get_bit(p2, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_P3, get_bit(p3, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_B, get_bit(b_reg, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_IP, get_bit(ip, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_IE, get_bit(ie, rd_addr_2_0), BvConst(0, 1)))))))))))))); 
    instr.SetUpdate(op2_reg, op2);
    instr.SetUpdate(op3_reg, op3);

  }

  {
    auto instr = model.NewInstr("wr_ram");
    auto resolved_rd_addr = resolve_addr(rd_addr, bit_addr);
    auto resolved_wr_addr = resolve_addr(wr_addr, bit_addr_r);
    auto resolved_rd_addr_4 = Extract(resolved_rd_addr, 7, 0);
    auto resolved_wr_addr_4 = Extract(resolved_wr_addr, 7, 0);
    auto rd_addr_7_3 = Extract(rd_addr, 7, 3);
    auto rd_addr_2_0 = Extract(rd_addr, 2, 0);
    auto rd_data = Ite(resolved_rd_addr_4 == (kRAM_MAX - 1), iram[kRAM_MAX-1], iram[kRAM_MAX]);
    for (int i = (kRAM_MAX-2); i >= 0; i--)
      rd_data = Ite(resolved_rd_addr_4 == i, iram[i], rd_data);

    // auto resolved_wr_addr = resolve_addr(wr_addr, bit_addr_r);
    instr.SetDecode(wr & wr_ind);
    instr.SetUpdate(ram_rd_data, Ite((resolved_rd_addr == resolved_wr_addr), ram_rd_data, rd_data));
    instr.SetUpdate(bit_addr_r, bit_addr);
    instr.SetUpdate(bit_address, Extract(rd_addr, 2, 0));
    instr.SetUpdate(rd_addr_r, Extract(rd_addr, 7, 7));
    instr.SetUpdate(rd_ind, (ram_rd_sel == BvConst(1, 3)) | (ram_rd_sel == BvConst(3, 3)));
    instr.SetUpdate(sfr_rd_data, Ite((wr_sfr == kWRS_DPTR) & (rd_addr == kSFR_DPTR_LO), des_acc_res, 
    				 Ite((((wr_sfr == kWRS_ACC1) & (rd_addr == kSFR_ACC)) | ((wr_sfr == kWRS_ACC2) & (rd_addr == kSFR_ACC)) | ((wr_sfr == kWRS_DPTR) & (rd_addr == kSFR_DPTR_HI))) & (wait_data == BoolConst(0)), sfr_rd_data, Ite(rd_addr == kSFR_SP, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)), sfr_src))));
 
    instr.SetUpdate(sfr_bit_rd_data, Ite((wr_sfr == kWRS_ACC1) & (rd_addr_7_3 == kSFR_B_ACC), get_bit(des_acc_res, rd_addr_2_0), 
    				     Ite(rd_addr_7_3 == kSFR_B_ACC, get_bit(acc, rd_addr_2_0), 
				     Ite(rd_addr_7_3 == kSFR_B_PSW, get_bit(psw_next_res, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_P0, get_bit(p0, rd_addr_2_0), 
				     Ite(rd_addr_7_3 == kSFR_B_P1, get_bit(p1, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_P2, get_bit(p2, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_P3, get_bit(p3, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_B, get_bit(b_reg, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_IP, get_bit(ip, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_IE, get_bit(ie, rd_addr_2_0), BvConst(0, 1)))))))))))); 
    instr.SetUpdate(op2_reg, op2);
    instr.SetUpdate(op3_reg, op3);

  }

  {
    auto instr = model.NewInstr("wr_sfr_ram");
    auto resolved_rd_addr = resolve_addr(rd_addr, bit_addr);
    auto resolved_wr_addr = resolve_addr(wr_addr, bit_addr_r);
    auto resolved_rd_addr_4 = Extract(resolved_rd_addr, 7, 0);
    auto resolved_wr_addr_4 = Extract(resolved_wr_addr, 7, 0);
    auto rd_addr_7_3 = Extract(rd_addr, 7, 3);
    auto rd_addr_2_0 = Extract(rd_addr, 2, 0);
    auto rd_data = Ite(resolved_rd_addr_4 == (kRAM_MAX - 1), iram[kRAM_MAX-1], iram[kRAM_MAX]);
    for (int i = (kRAM_MAX-2); i >= 0; i--)
      rd_data = Ite(resolved_rd_addr_4 == i, iram[i], rd_data);

    // auto resolved_wr_addr = resolve_addr(wr_addr, bit_addr_r);
    instr.SetDecode(wr & (wr_ind == BoolConst(0)) & (Extract(resolved_wr_addr, 7, 7) == BvConst(0, 1)));
    instr.SetUpdate(ram_rd_data, Ite((resolved_rd_addr == resolved_wr_addr), ram_rd_data, rd_data));
    instr.SetUpdate(bit_addr_r, bit_addr);
    instr.SetUpdate(bit_address, Extract(rd_addr, 2, 0));
    instr.SetUpdate(rd_addr_r, Extract(rd_addr, 7, 7));
    instr.SetUpdate(rd_ind, (ram_rd_sel == BvConst(1, 3)) | (ram_rd_sel == BvConst(3, 3)));
    instr.SetUpdate(op2_reg, op2);
    instr.SetUpdate(op3_reg, op3);
    instr.SetUpdate(sfr_rd_data, Ite((wr_sfr == kWRS_DPTR) & (rd_addr == kSFR_DPTR_LO), des_acc_res, 
    				 Ite((((wr_sfr == kWRS_ACC1) & (rd_addr == kSFR_ACC)) | 
				      ((wr_sfr == kWRS_ACC2) & (rd_addr == kSFR_ACC)) | 
				      ((wr_sfr == kWRS_DPTR) & (rd_addr == kSFR_DPTR_HI)) | 
				      ((Extract(wr_addr, 7, 7) == BvConst(1, 1)) & (rd_addr == wr_addr) & (wr_bit_r == BoolConst(0))) |
				      ((Extract(wr_addr, 7, 7) == BvConst(1, 1)) & (Extract(rd_addr, 7, 3) == Extract(wr_addr, 7, 3)) & (wr_bit_r) & (Extract(rd_addr, 2, 0) != BvConst(7, 3))) ) & (wait_data == BoolConst(0)), sfr_rd_data, Ite(rd_addr == kSFR_SP, Ite(ram_wr_sel == kRWS_SP, sp + BvConst(1, 8), sp - Concat(BvConst(0, 7), pop)), sfr_src))));

    instr.SetUpdate(sfr_bit_rd_data, Ite(((Extract(rd_addr, 7, 3) == Extract(wr_addr, 7, 3)) & (wr_bit_r == BoolConst(0)) & (Extract(wr_addr, 2, 0) == BvConst(0, 3)) & (valid_sfr)), get_bit(des1_res, rd_addr_2_0),
    				     Ite((wr_sfr == kWRS_ACC1) & (rd_addr_7_3 == kSFR_B_ACC), get_bit(des_acc_res, rd_addr_2_0), 
				     Ite((rd_addr == wr_addr) & (wr_bit_r) & (valid_sfr), desCy_res,
    				     Ite(rd_addr_7_3 == kSFR_B_ACC, get_bit(acc, rd_addr_2_0), 
				     Ite(rd_addr_7_3 == kSFR_B_PSW, get_bit(psw_next_res, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_P0, get_bit(p0, rd_addr_2_0), 
				     Ite(rd_addr_7_3 == kSFR_B_P1, get_bit(p1, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_P2, get_bit(p2, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_P3, get_bit(p3, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_B, get_bit(b_reg, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_IP, get_bit(ip, rd_addr_2_0),
				     Ite(rd_addr_7_3 == kSFR_B_IE, get_bit(ie, rd_addr_2_0), BvConst(0, 1)))))))))))))); 
  }

// TODO: rd_en_r, wr_data_r


}
