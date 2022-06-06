// main.cc
// Synopsis: Entry point for the executable

#include "decoder.h"
#include <ilang/ila/instr_lvl_abs.h>
#include <iostream>
#include <ilang/vtarget-out/vtarget_gen.h>


int main() {
  DECODER model;
  
  std::vector<std::string> design_files = {"oc8051_decoder.v", "oc8051_timescale.v", "oc8051_define.v"};
  
  std::ofstream fout("./ila.v"); 
  model.model.ExportToVerilog(fout);
  
  VerilogVerificationTargetGenerator::vtg_config_t ret; 
  ret.ForceInstCheckReset = true;
  ret.CosaGenTraceVcd = true;
  std::string RootPath = "..";
  std::string VerilogPath = RootPath + "/verilog/";
  std::string RefrelPath = RootPath + "/refinement/";
  std::string OutputPath = RootPath + "/verification/";

  VerilogGeneratorBase::VlgGenConfig vlg_cfg;
  vlg_cfg.pass_node_name = true; 
  VerilogVerificationTargetGenerator vg(
      {VerilogPath},                                                    
      {VerilogPath + "oc8051_decoder.v"},
      "oc8051_decoder",                                                 // top_module_name
      RefrelPath + "ref-rel-var-map.json",                              // variable mapping
      RefrelPath + "ref-rel-inst-cond.json",          		        // conditions of start/ready
      OutputPath,                                                       // output path
      model.model.get(),                                                // model
      VerilogVerificationTargetGenerator::backend_selector::JASPERGOLD, // backend: JASPERGOLD
      ret,                                                              // target generator configuration
      vlg_cfg);                                                         // verilog generator configuration
  vg.GenerateTargets();

  
  // VerilogGeneratorBase::VlgGenConfig vlg_cfg_child;
  // vlg_cfg_child.pass_node_name = true; 
  // VerilogVerificationTargetGenerator vg(
  //     {VerilogPath},                                                    
  //     {VerilogPath + "oc8051_decoder.v"},
  //     "oc8051_decoder",                                                 // top_module_name
  //     RefrelPath + "ref-rel-var-map.json",                        // variable mapping
  //     RefrelPath + "ref-rel-inst-cond-child.json",          		// conditions of start/ready
  //     OutputPath,                                                       // output path
  //     model.model.child(0).get(),                                       // model
  //     VerilogVerificationTargetGenerator::backend_selector::JASPERGOLD, // backend: JASPERGOLD
  //     ret,                                                              // target generator configuration
  //     vlg_cfg_child);                                                   // verilog generator configuration
  // vg.GenerateTargets();
  return 0;
}
