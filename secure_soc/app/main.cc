// main.cc
// Synopsis: Entry point for the executable

#include <ilang/ilang++.h>
#include <ilang/target-json/interface.h>
#include <iostream>
#include "z3++.h"
#include <simple/lib.h>
#include <aes_ila.h>
#include <aes_128.h>
#include <ilang/vtarget-out/vtarget_gen.h>
#include "helper.h"
#include "hl_ila.h"
#include <sys/resource.h>

using namespace ilang;
using std::cout;
using std::endl;


void add_input(InstrLvlAbsPtr src, InstrLvlAbsPtr dest) {
  for (size_t i = 0; i != src->input_num(); i++) {
    if ((dest->find_input(src->input(i)->name()).get()) ==nullptr)
      dest->AddInput(src->input(i));
  }
}

void add_input(InstrLvlAbsPtr dest, CustExprSet& inputs) {
  for (auto input : inputs) {
    dest->AddInput(input);
  }
}

void add_state(InstrLvlAbsPtr src, InstrLvlAbsPtr dest) {
  for (size_t i = 0; i != src->state_num(); i++) {
    if ((dest->find_state(src->state(i)->name()).get()) == nullptr)
      dest->AddState(src->state(i));
  }
}

void iter_state(InstrLvlAbsPtr model) {
  for (int i = 0; i < model->state_num(); i++) {
    std::cout << "state " << i << " : " << model->state(i) << std::endl;
  }
}

void iter_instr(InstrLvlAbsPtr model) {
  for (int i = 0; i < model->instr_num(); i++) {
    std::cout << "instr " << i << " : " << model->instr(i) << std::endl;
  }
}

bool is_same(ExprPtr a, ExprPtr b) {
  return a == b;
}

void iter_input(InstrLvlAbsPtr model) {
  for (int i = 0; i < model->input_num(); i++) {
    std::cout << "input " << i << " : " << model->input(i) << std::endl;
  }
}

void set_stack_size() {
    const rlim_t kStackSize = 256 * 1024 * 1024;   // min stack size = 16 MB
    struct rlimit rl;
    int result;
    result = getrlimit(RLIMIT_STACK, &rl);
    if (result == 0) {
        if (rl.rlim_cur < kStackSize)
        {
            rl.rlim_cur = kStackSize;
            result = setrlimit(RLIMIT_STACK, &rl);
            if (result != 0)
            {
                fprintf(stderr, "setrlimit returned result = %d\n", result);
            }
        }
    }
 
}

void loc_estimate(const InstrLvlAbsPtr& proc_ila) {
  std::unordered_set<ExprPtr> update_func;
  for (int i = 0; i < proc_ila->instr_num(); i++) {
    auto instr = proc_ila->instr(i);
    auto updated_states = instr->updated_states();
    for (auto s = updated_states.begin(); s != updated_states.end(); s++) {
      update_func.insert(instr->update(*s));
    }
  }
  std::cout << update_func.size() << " updates" << std::endl;
  std::cout << proc_ila->state_num() << "states" << std::endl;
  std::cout << proc_ila->instr_num() << "instrs" << std::endl;
}

int main() {
  set_stack_size();
  SetUnsignedComparison(true);
  auto proc_file = "./oc8051.json";
  auto proc_ila = IlaSerDesMngr::DesFromFile(proc_file);
  loc_estimate(proc_ila);
  cout << "oc8051 loaded" << endl;

  AES aes_ila_model;
  auto aes_ila = aes_ila_model.model.get();
  cout << "aes loaded" << endl;
  // auto sha_file = "./sha.json";
  // auto sha_ila = IlaSerDesMngr::DesFromFile(sha_file);
  // std::cout << "sha loaded" << std::endl;

  
  cout << "state_num: " << proc_ila->state_num() << endl;
  cout << "child_num: " << proc_ila->child_num() << endl;
  cout << "instr_num: " << proc_ila->instr_num() << endl;

  cout << "prepropcess oc8051 model" << endl;

  std::vector<ExprPtr> tmp_iram_elements;
  ModifyIramInterface(proc_ila, tmp_iram_elements);
  
  AddIromInputPort(proc_ila);
  AddXramOutPort(proc_ila);
  for (int i = 0; i < 255; i++) {
    Model8051RemapMemInterface(proc_ila, tmp_iram_elements, i);
    // cout << "instr " << i << " has done." << endl; 
  }
  AddHandshakeInstr(proc_ila);
  ModifyDecodeWithValid(proc_ila);

  VerilogGeneratorBase::VlgGenConfig vlg_cfg;
  VerilogVerificationTargetGenerator::vtg_config_t vtg_cfg;
  // vtg_cfg.ForceInstCheckReset = true;
  vlg_cfg.pass_node_name = true;
  std::string RootPath = "..";
  std::string VerilogPath = RootPath + "/verilog/";
  std::string RefPath = RootPath + "/refinement/";
  std::string OutputPath = RootPath + "/verification/";
  SetUnsignedComparison(true);

  VerilogVerificationTargetGenerator vg({}, {VerilogPath + "oc8051_gm_top.v"}, "oc8051_top",
  RefPath + "ref-rel-var-map.json", RefPath + "ref-rel-inst-cond.json",
  OutputPath,
  proc_ila,
  VerilogVerificationTargetGenerator::backend_selector::JASPERGOLD,
  vtg_cfg,
  vlg_cfg);
  vg.GenerateTargets();
  
 
  return 0;
}
