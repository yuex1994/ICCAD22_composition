#ifndef MEMORY_INTERFACE_THREE_PORTS_H__
#define MEMORY_INTERFACE_THREE_PORTS_H__

#include <ilang/ilang++.h>
#include <ilang/ila/instr_lvl_abs.h>
#include <vector>

using namespace ilang;

class MEMORY_INTERFACE_THREE_PORTS {
public:
  MEMORY_INTERFACE_THREE_PORTS();
  Ila model;
  void irom_port_input_state(Ila& model);
  void xram_port_input_state(Ila& model);
  void add_shared_state(Ila& model);

  void xram_inst_0(std::vector<ExprPtr>& decode, std::vector<ExprPtr>& u_state, std::vector<ExprPtr>& u_func);
  void xram_inst_1(std::vector<ExprPtr>& decode, std::vector<ExprPtr>& u_state, std::vector<ExprPtr>& u_func);
  void xram_inst_2(std::vector<ExprPtr>& decode, std::vector<ExprPtr>& u_state, std::vector<ExprPtr>& u_func);
  void irom_inst_0(std::vector<ExprPtr>& decode, std::vector<ExprPtr>& u_state, std::vector<ExprPtr>& u_func);
  void irom_inst_1(std::vector<ExprPtr>& decode, std::vector<ExprPtr>& u_state, std::vector<ExprPtr>& u_func);
  void irom_inst_2(std::vector<ExprPtr>& decode, std::vector<ExprPtr>& u_state, std::vector<ExprPtr>& u_func);
 
  void pc_port();
  void iram_port_model(Ila& model);
};


  void integrate_instr(InstrRef& instr, void (MEMORY_INTERFACE_THREE_PORTS::*func_1)(std::vector<ExprPtr>&, std::vector<ExprPtr>&, std::vector<ExprPtr>&), void (MEMORY_INTERFACE_THREE_PORTS::*func_2)(std::vector<ExprPtr>&, std::vector<ExprPtr>&, std::vector<ExprPtr>&), MEMORY_INTERFACE_THREE_PORTS& ptr, ExprRef& shared_update);

#endif
