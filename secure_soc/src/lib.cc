// lib.cc
// Synopsis: implementation of the library

#include <ilang/ilang++.h>
#include <iostream>
#include <simple/lib.h>
#include <ilang/util/log.h>
#include <ilang/ila-mngr/v_eq_check_refinement.h>
#include "z3++.h"
#include <ilang/ila/ast/expr.h>

void AddIromInputPort(const InstrLvlAbsPtr &model_ptr)
{
  auto data_0 = model_ptr->NewBvInput("oc8051_ROM_rdata_0", 8);
  auto data_1 = model_ptr->NewBvInput("oc8051_ROM_rdata_1", 8);
  auto data_2 = model_ptr->NewBvInput("oc8051_ROM_rdata_2", 8);
  auto addr_0 = model_ptr->NewBvState("oc8051_ROM_addr_0", 16);
  auto addr_1 = model_ptr->NewBvState("oc8051_ROM_addr_1", 16);
  auto addr_2 = model_ptr->NewBvState("oc8051_ROM_addr_2", 16);

  auto ready_0 = model_ptr->NewBoolState("oc8051_ROM_ready_0");
  // auto valid_0 = model_ptr->NewBoolInput("oc8051_ROM_valid_0");
}

void AddXramOutPort(const InstrLvlAbsPtr &model_ptr) {
  // auto s = model_ptr->NewBvState("XRAM_WR", 2);
  auto xram_valid = model_ptr->NewBoolState("XRAM_valid");
  auto xram_ready = model_ptr->NewBoolInput("XRAM_ready");
}


void Model8051RemapMemInterface(const InstrLvlAbsPtr &model_ptr, std::vector<ExprPtr> &tmp_iram_elements, int instr_num)
{
  auto addr_0 = model_ptr->state("oc8051_ROM_addr_0");
  auto addr_1 = model_ptr->state("oc8051_ROM_addr_1");
  auto addr_2 = model_ptr->state("oc8051_ROM_addr_2");

  auto pc_state = model_ptr->state("PC");
  auto instr = model_ptr->instr(instr_num);
  // if (pc_state)
  //   std::cout << "not null" << std::endl;
  // else
  //   std::cout << "pc NULL" << std::endl;
  auto DfsModifyRom = [&model_ptr](const ExprPtr &e) { DfsFromRomToPort(e, model_ptr); };
  auto DfsModifyIram = [&model_ptr, &tmp_iram_elements](const ExprPtr &e) { DfsFromIramToPort(e, model_ptr, tmp_iram_elements); };

  ModifyXramWrState(model_ptr, instr);
  for (auto updated_state_name : instr->updated_states())
  {
    auto updated_expr = instr->update(updated_state_name);
    updated_expr->DepthFirstVisit(DfsModifyIram);
    updated_expr->DepthFirstVisit(DfsModifyRom);
    // Only Assume Store happens at the ast top level

    if (updated_expr->is_op())
    {
      if (asthub::GetUidExprOp(updated_expr) == AstUidExprOp::kStore)
      {
        std::cout << "store instruction: " << instr->name() << std::endl;
        ModifyIramStore(updated_expr, model_ptr, instr, tmp_iram_elements);
      }
    }
  }
  instr->decode()->DepthFirstVisit(DfsModifyIram);
  instr->decode()->DepthFirstVisit(DfsModifyRom);
  instr->set_update(addr_0, pc_state);
  instr->set_update(addr_1, asthub::Add(pc_state, 1));
  instr->set_update(addr_2, asthub::Add(pc_state, 2));

  return;
}

void ModifyIramInterface(const InstrLvlAbsPtr &model_ptr, std::vector<ExprPtr> &iram)
{
  for (int i = 0; i < 16; i++)
  {
    iram.push_back(model_ptr->NewBvState("oc8051_IRAM_data_" + std::to_string(i), 8));
  }
}

void DfsFromIramToPort(const ExprPtr &expr, const InstrLvlAbsPtr &model_ptr, std::vector<ExprPtr> &iram)
{
  auto ram_state = model_ptr->state("IRAM");
  if (expr->is_op())
  {
    for (int i = 0; i < expr->arg_num(); i++)
    {
      auto arg_expr = expr->arg(i);
      if (arg_expr->is_op())
      {
        auto op_uid = asthub::GetUidExprOp(arg_expr);
        if (op_uid == AstUidExprOp::kLoad)
          ModifyIramLoad(expr, i, model_ptr, iram);
        // ILA_ASSERT(op_uid != AstUidExprOp::kStore);
      }
    }
  }
}

void ModifyIramLoad(const ExprPtr &parent_expr, int parent_index, const InstrLvlAbsPtr &model_ptr, std::vector<ExprPtr> &iram)
{
  auto arg_expr = parent_expr->arg(parent_index);
  auto arg_arg_0 = arg_expr->arg(0);
  auto iram_state = model_ptr->state("IRAM");
  if (arg_arg_0 == iram_state)
  {
    auto arg_arg_1 = arg_expr->arg(1);
    auto arg_arg_1_extr = asthub::Extract(arg_arg_1, 3, 0);
    auto repl_expr = asthub::BvConst(0, 8);
    for (int i = 0; i < 16; i++)
    {
      repl_expr = asthub::Ite(asthub::Eq(arg_arg_1_extr, i), iram[i], repl_expr);
    }
    parent_expr->replace_arg(parent_index, repl_expr);
  }
}

void ModifyIramStore(const ExprPtr &expr, const InstrLvlAbsPtr &model_ptr, const InstrPtr &instr_ptr, std::vector<ExprPtr> &iram)
{
  auto arg_0 = expr->arg(0);
  auto iram_state = model_ptr->state("IRAM");
  if (arg_0 == iram_state)
  {
    auto addr = expr->arg(1);
    auto addr_extr = asthub::Extract(addr, 3, 0);
    auto data = expr->arg(2);
    for (int i = 0; i < 16; i++)
    {
      auto update = asthub::Ite(asthub::Eq(addr, i), data, iram[i]);
      instr_ptr->set_update(iram[i], update);
    }
  }
  // instr_ptr->set_update(expr, expr);
}

void DfsFromRomToPort(const ExprPtr &expr, const InstrLvlAbsPtr &model_ptr)
{
  auto pc_state = model_ptr->state("PC");
  auto rom_state = model_ptr->state("ROM");
  if (expr->is_op())
  {
    for (int i = 0; i < expr->arg_num(); i++)
    {
      auto arg_expr = expr->arg(i);
      if (arg_expr->is_op())
      {
        auto op_uid = asthub::GetUidExprOp(arg_expr);
        if (op_uid == AstUidExprOp::kLoad)
        {
          auto arg_arg_0 = arg_expr->arg(0);
          if (arg_arg_0 == rom_state)
          {
            auto arg_arg_1 = arg_expr->arg(1);
            if (arg_arg_1->is_var())
            {
              ILA_ASSERT(arg_arg_1 == pc_state);
              expr->replace_arg(i, model_ptr->input("oc8051_ROM_rdata_0"));
            }
            else
            {
              ILA_ASSERT(arg_arg_1->is_op());
              ILA_ASSERT(asthub::GetUidExprOp(arg_arg_1) == AstUidExprOp::kAdd);
              auto arg_arg_pc = arg_arg_1->arg(0);
              auto arg_arg_const = arg_arg_1->arg(1);
              ILA_ASSERT(arg_arg_pc == pc_state);
              ILA_ASSERT(arg_arg_const->is_const());
              auto const_val = std::dynamic_pointer_cast<ExprConst>(arg_arg_const)->val_bv()->val();
              ILA_ASSERT((const_val == 1) || (const_val == 2));
              if (const_val == 1)
                expr->replace_arg(i, model_ptr->input("oc8051_ROM_rdata_1"));
              else
                expr->replace_arg(i, model_ptr->input("oc8051_ROM_rdata_2"));
            }
          }
        }
      }
    }
  }
  return;
}

void ModifyXramWrState(const InstrLvlAbsPtr &model_ptr, const InstrPtr &instr_ptr) {
  auto XRAM_ADDR = model_ptr->state("XRAM_ADDR");
  auto XRAM_DATA_IN = model_ptr->state("XRAM_DATA_IN");
  auto XRAM_DATA_OUT = model_ptr->state("XRAM_DATA_OUT");
  auto PSW = model_ptr->state("PSW");
  auto DPH = model_ptr->state("DPH");
  auto DPL = model_ptr->state("DPL");
  auto ACC = model_ptr->state("ACC");
  auto oc8051_IRAM_data_0 = model_ptr->state("oc8051_IRAM_data_0");
  auto oc8051_IRAM_data_1 = model_ptr->state("oc8051_IRAM_data_1");
  auto oc8051_IRAM_data_8 = model_ptr->state("oc8051_IRAM_data_8");
  auto oc8051_IRAM_data_9 = model_ptr->state("oc8051_IRAM_data_9");  
  auto updated_states = instr_ptr->updated_states();
  // z3::context ctx;
  // IlaZ3Unroller unr(ctx);
  // if (instr_ptr->name().str() == "I.1") {
  //   std::cout << "XRAM_ADDR update:" << unr.GetZ3Expr(instr_ptr->update("XRAM_ADDR")) << std::endl;
  //   std::cout << "XRAM_DATA_IN update:" << unr.GetZ3Expr(instr_ptr->update("XRAM_DATA_IN")) << std::endl;
  //   std::cout << "XRAM_DATA_OUT update:" << unr.GetZ3Expr(instr_ptr->update("XRAM_DATA_OUT")) << std::endl;
  // }
  auto a1_addr = asthub::Concat(asthub::BvConst(0, 8), asthub::Ite(asthub::Eq(asthub::Extract(PSW, 3, 3), asthub::BvConst(1, 1)), oc8051_IRAM_data_9, oc8051_IRAM_data_1));
  auto a2_addr = asthub::Concat(asthub::BvConst(0, 8), asthub::Ite(asthub::Eq(asthub::Extract(PSW, 3, 3), asthub::BvConst(1, 1)), oc8051_IRAM_data_8, oc8051_IRAM_data_0));
  auto a3_addr = asthub::Concat(DPH, DPL);
  auto default_addr = asthub::BvConst(0, 16);
  auto a_data_out = ACC;

  if(instr_ptr->name().str() == "I.224") {// e0
    instr_ptr->ForceAddUpdate("XRAM_ADDR", a3_addr);
    std::cout << "I224 modify XRAM update func." << std::endl;
  } else if (instr_ptr->name().str() == "I.240") {// e0
    instr_ptr->ForceAddUpdate("XRAM_ADDR", a3_addr);
    instr_ptr->ForceAddUpdate("XRAM_DATA_OUT", ACC);
    instr_ptr->ForceAddUpdate("XRAM_valid", asthub::BoolConst(true));
    instr_ptr->ForceAddUpdate("oc8051_ROM_ready_0", asthub::BoolConst(false));
    std::cout << "I240 modify XRAM update func." << std::endl;
  } else if(instr_ptr->name().str() == "I.226") {// e0
    instr_ptr->ForceAddUpdate("XRAM_ADDR", a2_addr);
    std::cout << "I226 modify XRAM update func." << std::endl;
  } else if(instr_ptr->name().str() == "I.242") {// e0
    instr_ptr->ForceAddUpdate("XRAM_ADDR", a2_addr);
    instr_ptr->ForceAddUpdate("XRAM_DATA_OUT", ACC);
    instr_ptr->ForceAddUpdate("XRAM_valid", asthub::BoolConst(true));
    instr_ptr->ForceAddUpdate("oc8051_ROM_ready_0", asthub::BoolConst(false));
    std::cout << "I242 modify XRAM update func." << std::endl;
  } else {
    instr_ptr->ForceAddUpdate("XRAM_ADDR", XRAM_ADDR);
    instr_ptr->ForceAddUpdate("XRAM_DATA_OUT", XRAM_DATA_OUT);
  }
  if(instr_ptr->name().str() == "I.227") {// e0
    instr_ptr->ForceAddUpdate("XRAM_ADDR", a1_addr);
    std::cout << "I227 modify XRAM update func." << std::endl;
  }
  if(instr_ptr->name().str() == "I.243") {// e0
    instr_ptr->ForceAddUpdate("XRAM_ADDR", a1_addr);
    instr_ptr->ForceAddUpdate("XRAM_DATA_OUT", ACC);
    instr_ptr->ForceAddUpdate("XRAM_valid", asthub::BoolConst(true));
    instr_ptr->ForceAddUpdate("oc8051_ROM_ready_0", asthub::BoolConst(false));
    std::cout << "I243 modify XRAM update func." << std::endl;
  }          
  // if (updated_states.find("XRAM_ADDR") != updated_states.end()) {
  //   auto update_addr_expr = instr_ptr->update("XRAM_ADDR");
  //   if (update_addr_expr != XRAM_ADDR) {
  //     auto update_data_out_expr = instr_ptr->update(XRAM_DATA_OUT);
  //     if (update_data_out_expr != XRAM_DATA_OUT) {
  //       std::cout << "Write to XRAM:" << instr_ptr->name() << std::endl;
  //       instr_ptr->set_update(XRAM_WR, asthub::BvConst(2, 2));  
  //     } else {
  //       std::cout << "Read from XRAM:" << instr_ptr->name() << std::endl;
  //       instr_ptr->set_update(XRAM_WR, asthub::BvConst(1, 2));   
  //     }
  //   }
  // }
}

void ModifyDecodeWithValid(const InstrLvlAbsPtr &model_ptr) {
  auto ready_0 = model_ptr->state("oc8051_ROM_ready_0");
  for (auto i = 0; i < model_ptr->instr_num(); i++) {
    auto instr = model_ptr->instr(i);
    auto decode = asthub::And(instr->decode(), ready_0);
    instr->ForceSetDecode(decode);
  }
}

void AddHandshakeInstr(const InstrLvlAbsPtr &model_ptr) {
 
  auto xram_valid = model_ptr->state("XRAM_valid");
  auto xram_ready = model_ptr->input("XRAM_ready"); 
  auto ready_0 = model_ptr->state("oc8051_ROM_ready_0");
  auto instr = model_ptr->NewInstr("XramOutPortHandshake");
  instr->set_decode(asthub::And(xram_valid, xram_ready));
  instr->set_update(xram_valid, asthub::BoolConst(false));
  instr->set_update(ready_0, asthub::BoolConst(true));


}