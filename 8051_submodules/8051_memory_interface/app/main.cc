// main.cc

#include "memory_interface_three_ports.h"
#include <ilang/ila/instr_lvl_abs.h>
#include <iostream>
#include <ilang/vtarget-out/vtarget_gen.h>


int main() {
  /*
  MEMORY_INTERFACE memory_interface;
  std::ofstream fout("./ila_memory_interface.v");
  memory_interface.model.ExportToVerilog(fout);
  std::vector<std::string> design_files = {"oc8051_decoder.v", "oc8051_timescale.v", "oc8051_define.v"};
  
  SetUnsignedComparison(true);
  
  VerilogVerificationTargetGenerator::vtg_config_t ret;
  ret.CosaGenTraceVcd = true;
  VerilogGeneratorBase::VlgGenConfig vlg_cfg;
  vlg_cfg.pass_node_name = true;
  std::string RootPath = "..";
  std::string VerilogPath = RootPath + "/verilog/";
  std::string RefrelPath = RootPath + "/refinement/";
  std::string OutputPath = RootPath + "/verification/";
  VerilogVerificationTargetGenerator vg(
      {VerilogPath},                                                    // no include
      {VerilogPath + "oc8051_memory_interface.v"},
      "oc8051_memory_interface",                                             // top_module_name
      RefrelPath + "ref-rel-var-map.json",            // variable mapping
      RefrelPath + "ref-rel-inst-cond.json",          // conditions of start/ready
      OutputPath,                                            // output path
      memory_interface.model.get(),                                           // model
      VerilogVerificationTargetGenerator::backend_selector::COSA, // backend: COSA
      ret,  // target generator configuration
      vlg_cfg); // verilog generator configuration

  vg.GenerateTargets(); 
  */
  
  {
  MEMORY_INTERFACE_THREE_PORTS this_ila;
  std::ofstream fout("./ila_memory_interface.v");
  this_ila.model.ExportToVerilog(fout);
  std::vector<std::string> design_files = {"oc8051_decoder.v", "oc8051_timescale.v", "oc8051_define.v"};
  
  SetUnsignedComparison(true);
  
  VerilogVerificationTargetGenerator::vtg_config_t ret;
  ret.CosaGenTraceVcd = true;
  VerilogGeneratorBase::VlgGenConfig vlg_cfg;
  vlg_cfg.pass_node_name = true;
  std::string RootPath = "..";
  std::string VerilogPath = RootPath + "/verilog/";
  std::string RefrelPath = RootPath + "/refinement/";
  std::string OutputPath = RootPath + "/verification/";
  VerilogVerificationTargetGenerator vg(
      {VerilogPath},                                                    // no include
      {VerilogPath + "oc8051_memory_interface.v"},
      "oc8051_memory_interface",                                             // top_module_name
      RefrelPath + "ref-rel-ram-path-var-map.json",            // variable mapping
      RefrelPath + "ref-rel-ram-path-inst-cond.json",          // conditions of start/ready
      OutputPath,                                            // output path
      this_ila.model.get(),                                           // model
      VerilogVerificationTargetGenerator::backend_selector::JASPERGOLD, // backend: COSA
      ret,  // target generator configuration
      vlg_cfg); // verilog generator configuration

  vg.GenerateTargets(); 
  }

  return 0;
}
