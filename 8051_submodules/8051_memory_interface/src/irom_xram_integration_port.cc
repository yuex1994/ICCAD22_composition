#include "memory_interface_three_ports.h"


void MEMORY_INTERFACE_THREE_PORTS::irom_port_input_state(Ila& model) {
  auto idat_i = model.NewBvInput("idat_i", 8);  
  auto iack_i = model.NewBoolInput("iack_i");
  auto istb_t = model.NewBoolState("istb_t");
  auto iadr_t = model.NewBvState("iadr_t", 16);
  auto idat_ir = model.NewBvState("idat_ir", 8);
  auto imem_wait = model.NewBoolState("imem_wait");

  // See in the next month, pure combinational
  // auto rn = model.NewBvInput("rn", 5);
  // auto ri = model.NewBvInput("ri", 8);
  // auto ram_rd_sel = model.NewBvInput("ram_rd_sel", 3);
}

void MEMORY_INTERFACE_THREE_PORTS::xram_port_input_state(Ila& model) {
  auto mem_act = model.NewBvInput("mem_act", 3);
  auto dack_i = model.NewBoolInput("dack_i"); // == dstb_o
  auto ddat_i = model.NewBvInput("ddat_i", 8);
  auto dptr = model.NewBvInput("dptr", 16);
  auto ri = model.NewBvInput("ri", 8);
  auto acc = model.NewBvInput("acc", 8);

  auto dstb_o = model.NewBoolState("dstb_o");
  auto ddat_o = model.NewBvState("ddat_o", 8);
  auto dadr_o = model.NewBvState("dadr_o", 16);
  auto dack_ir = model.NewBoolState("dack_ir");
  auto ddat_ir = model.NewBvState("ddat_ir", 8);
  auto dwe_o = model.NewBvState("dwe_o", 1);
}

void MEMORY_INTERFACE_THREE_PORTS::add_shared_state(Ila& model) {
  auto mem_wait = model.NewBoolState("mem_wait");
}


MEMORY_INTERFACE_THREE_PORTS::MEMORY_INTERFACE_THREE_PORTS() : model("MEMORY_INTERFACE_THREE_PORTS") {
  irom_port_input_state(model);
  xram_port_input_state(model);
  add_shared_state(model);
  pc_port();

  std::vector<void (MEMORY_INTERFACE_THREE_PORTS::*)(std::vector<ExprPtr>&, std::vector<ExprPtr>&, std::vector<ExprPtr>&)> xram_func;
  std::vector<void (MEMORY_INTERFACE_THREE_PORTS::*)(std::vector<ExprPtr>&, std::vector<ExprPtr>&, std::vector<ExprPtr>&)> irom_func;
  xram_func.push_back(&MEMORY_INTERFACE_THREE_PORTS::xram_inst_0);
  xram_func.push_back(&MEMORY_INTERFACE_THREE_PORTS::xram_inst_1);
  xram_func.push_back(&MEMORY_INTERFACE_THREE_PORTS::xram_inst_2);
  irom_func.push_back(&MEMORY_INTERFACE_THREE_PORTS::irom_inst_0);
  irom_func.push_back(&MEMORY_INTERFACE_THREE_PORTS::irom_inst_1);
  irom_func.push_back(&MEMORY_INTERFACE_THREE_PORTS::irom_inst_2);

  std::vector<ExprRef> mem_wait_update;
  mem_wait_update.push_back(BoolConst(1));
  mem_wait_update.push_back(model.state("pc_wr_r"));
  mem_wait_update.push_back(model.state("pc_wr_r"));
  mem_wait_update.push_back(BoolConst(1));
  mem_wait_update.push_back(BoolConst(1));
  mem_wait_update.push_back(BoolConst(1));
  mem_wait_update.push_back(BoolConst(1));
  //auto tmp_0 = Ite(model.state("stb_o") == BoolConst(1), BoolConst(1), Ite(model.state("pc_wr_r") == BoolConst(1), BoolConst(1), BoolConst(0))); 

  mem_wait_update.push_back(model.state("dstb_o") | model.state("pc_wr_r"));
  mem_wait_update.push_back(model.state("dstb_o") | model.state("pc_wr_r"));

  for (int i = 0; i < xram_func.size(); i++) {
    for (int j = 0; j < irom_func.size(); j++) {
      auto instr = model.NewInstr("xram_" + std::to_string(i) + "_irom_" + std::to_string(j));
      integrate_instr(instr, xram_func[i], irom_func[j], *this, mem_wait_update[i*3+j]);
    }
  }

 

  /*
  std::vector<ExprPtr> decode_1, u_state_1, u_func_1;
  {
    auto instr = model.NewInstr("dstb_o_issue");
    xram_inst_1(decode_1, u_state_1, u_func_1);
    for (auto a: decode_1) 
      instr.SetDecode(ExprRef(a));
    for (int i = 0; i < u_state_1.size(); i++)
      instr.SetUpdate(ExprRef(u_state_1[i]), ExprRef(u_func_1[i])); 
  }
  
  std::vector<ExprPtr> decode_2, u_state_2, u_func_2;
  {
    auto instr = model.NewInstr("xram_idle");
    xram_inst_2(decode_2, u_state_2, u_func_2);
    for (auto a: decode_2) 
      instr.SetDecode(ExprRef(a));
    for (int i = 0; i < u_state_2.size(); i++)
      instr.SetUpdate(ExprRef(u_state_2[i]), ExprRef(u_func_2[i])); 
  }

  {
    auto instr = model.NewInstr("irom_issue");
    std::vector<ExprPtr> decode, u_state, u_func;
    irom_inst_0(decode, u_state, u_func);
    for (auto a: decode) 
      instr.SetDecode(ExprRef(a));
    for (int i = 0; i < u_state.size(); i++)
      instr.SetUpdate(ExprRef(u_state[i]), ExprRef(u_func[i])); 
  }

  {
    auto instr = model.NewInstr("irom_done");
    std::vector<ExprPtr> decode, u_state, u_func;
    irom_inst_0(decode, u_state, u_func);
    for (auto a: decode) 
      instr.SetDecode(ExprRef(a));
    for (int i = 0; i < u_state.size(); i++)
      instr.SetUpdate(ExprRef(u_state[i]), ExprRef(u_func[i])); 
  }

  {
    auto instr = model.NewInstr("irom_idle");
    std::vector<ExprPtr> decode, u_state, u_func;
    irom_inst_0(decode, u_state, u_func);
    for (auto a: decode) 
      instr.SetDecode(ExprRef(a));
    for (int i = 0; i < u_state.size(); i++)
      instr.SetUpdate(ExprRef(u_state[i]), ExprRef(u_func[i])); 
  }
  */

  //iram_port_model(model);
}


void MEMORY_INTERFACE_THREE_PORTS::xram_inst_0(std::vector<ExprPtr>& decode, std::vector<ExprPtr>& u_state, std::vector<ExprPtr>& u_func) {
    decode.push_back((model.input("dack_i") == BoolConst(1)).get());
    u_state.push_back(model.state("dstb_o").get());
    u_state.push_back(model.state("dwe_o").get());
    u_state.push_back(model.state("ddat_ir").get());
    u_state.push_back(model.state("dack_ir").get());

    u_func.push_back(BoolConst(0).get());
    u_func.push_back(BoolConst(0).get());
    u_func.push_back(model.input("ddat_i").get());
    u_func.push_back(BoolConst(1).get());
}


void MEMORY_INTERFACE_THREE_PORTS::xram_inst_1(std::vector<ExprPtr>& decode, std::vector<ExprPtr>& u_state, std::vector<ExprPtr>& u_func) {
  auto mas_dptr_r = BvConst(0b000, 3);
  auto mas_dptr_w = BvConst(0b001, 3);
  auto mas_ri_r = BvConst(0b010, 3);
  auto mas_ri_w = BvConst(0b011, 3);

  decode.push_back(((model.input("dack_i") == BoolConst(0)) & (model.state("dstb_o") == BoolConst(0)) & ((model.input("mem_act") == mas_dptr_r) | (model.input("mem_act") == mas_ri_r) | (model.input("mem_act") == mas_dptr_w) | (model.input("mem_act") == mas_ri_w))).get());
 
  u_state.push_back(model.state("dstb_o").get());
  u_state.push_back(model.state("dwe_o").get());
  u_state.push_back(model.state("dadr_o").get());
  u_state.push_back(model.state("ddat_o").get());
  u_state.push_back(model.state("dack_ir").get());
  u_func.push_back(BoolConst(1).get());
  u_func.push_back(Ite((model.input("mem_act") == mas_dptr_w) | (model.input("mem_act") == mas_ri_w), BoolConst(1), BoolConst(0)).get());
  u_func.push_back(Ite((model.input("mem_act") == mas_dptr_r) | (model.input("mem_act") == mas_dptr_w), model.input("dptr"), Concat(BvConst(0, 8), model.input("ri"))).get()); 
  u_func.push_back(Ite((model.input("mem_act") == mas_dptr_r) | (model.input("mem_act") == mas_ri_r), BvConst(0, 8), model.input("acc")).get());
  u_func.push_back(BoolConst(0).get());
}

void MEMORY_INTERFACE_THREE_PORTS::xram_inst_2(std::vector<ExprPtr>& decode, std::vector<ExprPtr>& u_state, std::vector<ExprPtr>& u_func) {
  decode.push_back(((model.input("dack_i") == BoolConst(0)) & ((model.state("dstb_o") == BoolConst(1)) | (model.input("mem_act") == BvConst(4, 3)) | (model.input("mem_act") == BvConst(5, 3)) | (model.input("mem_act") == BvConst(6, 3)) | (model.input("mem_act") == BvConst(7, 3)))).get());  
  u_state.push_back(model.state("dack_ir").get());
  u_func.push_back(BoolConst(0).get());
}

void MEMORY_INTERFACE_THREE_PORTS::irom_inst_0(std::vector<ExprPtr>& decode, std::vector<ExprPtr>& u_state, std::vector<ExprPtr>& u_func) {
  decode.push_back((model.input("mem_act") == BvConst(4, 3)).get());
  u_state.push_back(model.state("istb_t").get());
  u_state.push_back(model.state("iadr_t").get());
  u_state.push_back(model.state("imem_wait").get());
  u_func.push_back(BoolConst(1).get());
  u_func.push_back(model.input("alu").get());
  u_func.push_back(BoolConst(1).get());
}

void MEMORY_INTERFACE_THREE_PORTS::irom_inst_1(std::vector<ExprPtr>& decode, std::vector<ExprPtr>& u_state, std::vector<ExprPtr>& u_func) {
  decode.push_back(((BoolConst(0) == (model.input("mem_act") == BvConst(4, 3))) & (model.state("imem_wait") == BoolConst(1))).get());
  u_state.push_back(model.state("imem_wait").get());
  u_func.push_back(BoolConst(0).get());
}

void MEMORY_INTERFACE_THREE_PORTS::irom_inst_2(std::vector<ExprPtr>& decode, std::vector<ExprPtr>& u_state, std::vector<ExprPtr>& u_func) {
  decode.push_back(((BoolConst(0) == (model.input("mem_act") == BvConst(4, 3))) & (model.state("imem_wait") == BoolConst(0))).get());
  u_state.push_back(model.state("istb_t").get());
  u_state.push_back(model.state("idat_ir").get());
  u_func.push_back(BoolConst(0).get());
  u_func.push_back(Ite(model.state("istb_t") | (model.input("iack_i") == BoolConst(0)), model.state("idat_ir"), model.input("idat_i")).get());
}



void MEMORY_INTERFACE_THREE_PORTS::iram_port_model(Ila& model) {

  auto mas_no = BvConst(0b111, 3);
  auto mas_dptr_r = BvConst(0b000, 3);
  auto mas_dptr_w = BvConst(0b001, 3);
  auto mas_ri_r = BvConst(0b010, 3);
  auto mas_ri_w = BvConst(0b011, 3);
  auto mas_code = BvConst(0b100, 3);

  auto mem_act = model.NewBvInput("mem_act", 3);
  auto dack_i = model.NewBoolInput("dack_i"); // == dstb_o
  auto ddat_i = model.NewBvInput("ddat_i", 8);
  auto idat_i = model.NewBvInput("idat_i", 8);  
  auto iack_i = model.NewBoolInput("iack_i");
  auto dptr = model.NewBvInput("dptr", 16);
  auto ri = model.NewBvInput("ri", 8);
  auto acc = model.NewBvInput("acc", 8);
 
  auto mem_wait = model.NewBoolState("mem_wait");
  auto dstb_o = model.NewBoolState("dstb_o");
  auto ddat_o = model.NewBvState("ddat_o", 8);
  auto dadr_o = model.NewBvState("dadr_o", 16);
  auto dack_ir = model.NewBoolState("dack_ir");
  auto ddat_ir = model.NewBvState("ddat_ir", 8);
  auto dwe_o = model.NewBvState("dwe_o", 0);
  auto istb_t = model.NewBoolState("istb_t");
  auto iadr_t = model.NewBvState("iadr_t", 16);

  {
    auto instr = model.NewInstr("dack_i_done");
    instr.SetDecode(dack_i == BoolConst(1));
    instr.SetUpdate(dstb_o, BoolConst(0));
    instr.SetUpdate(dwe_o, BoolConst(0));
    instr.SetUpdate(ddat_ir, ddat_i); 
    instr.SetUpdate(mem_wait, BoolConst(0)); //(iack_i == BoolConst(0)) & (istb_t) & (mem_wait == BoolConst(0)));
  }

  {
    auto instr = model.NewInstr("dstb_o_issue");
    instr.SetDecode((dstb_o == BoolConst(0)) & ((mem_act == mas_dptr_r) | (mem_act == mas_ri_r) | (mem_act == mas_dptr_w) | (mem_act == mas_ri_w)));
    instr.SetUpdate(dstb_o, BoolConst(1));
    instr.SetUpdate(dwe_o, Ite((mem_act == mas_dptr_w) | (mem_act == mas_ri_w), BoolConst(1), BoolConst(0)));
    instr.SetUpdate(dadr_o, Ite((mem_act == mas_dptr_r) | (mem_act == mas_dptr_w), dptr,
                            Concat(BvConst(0, 8), ri)));
    instr.SetUpdate(ddat_o, Ite((mem_act == mas_dptr_r) | (mem_act == mas_ri_r), BvConst(0, 8),
                            acc));
    instr.SetUpdate(mem_wait, BoolConst(1)); 
  } 
}


void integrate_instr(InstrRef& instr, void (MEMORY_INTERFACE_THREE_PORTS::*func_1)(std::vector<ExprPtr>&, std::vector<ExprPtr>&, std::vector<ExprPtr>&), void (MEMORY_INTERFACE_THREE_PORTS::*func_2)(std::vector<ExprPtr>&, std::vector<ExprPtr>&, std::vector<ExprPtr>&), MEMORY_INTERFACE_THREE_PORTS& ptr, ExprRef& shared_update) {
  std::vector<ExprPtr> decode, u_state, u_func;
  (ptr.*func_1)(decode, u_state, u_func);
  (ptr.*func_2)(decode, u_state, u_func);
  auto decode_func = BoolConst(1);
  for (auto a: decode) 
    decode_func = decode_func & ExprRef(a);
  instr.SetDecode(decode_func);
  for (int i = 0; i < u_state.size(); i++)
    instr.SetUpdate(ExprRef(u_state[i]), ExprRef(u_func[i]));  
  instr.SetUpdate(ptr.model.state("mem_wait"), shared_update);
}
