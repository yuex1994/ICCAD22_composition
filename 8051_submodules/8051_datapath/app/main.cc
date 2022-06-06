// main.cc

#include "datapath.h"
#include <ilang/ila/instr_lvl_abs.h>
#include <iostream>
#include <ilang/vtarget-out/vtarget_gen.h>

using namespace std;


int main() {
  DATAPATH datapath;

  SetUnsignedComparison(true);
  
  std::ofstream fout("./ila.v"); 
  datapath.model.ExportToVerilog(fout);
  
  VerilogVerificationTargetGenerator::vtg_config_t ret; 
  VerilogGeneratorBase::VlgGenConfig vlg_cfg;
  vlg_cfg.pass_node_name = true;
  std::string RootPath = "..";
  std::string VerilogPath = RootPath + "/verilog/";
  std::string RefrelPath = RootPath + "/refinement/";
  std::string OutputPath = RootPath + "/verification/";
  VerilogVerificationTargetGenerator vg(
      {VerilogPath + "include/"},                                                    // no include
      {VerilogPath + "src/oc8051_datapath.v"},
      "oc8051_datapath",                                             // top_module_name
      RefrelPath + "ref-rel-var-map.json",            // variable mapping
      RefrelPath + "ref-rel-inst-cond.json",          // conditions of start/ready
      OutputPath,                                            // output path
      datapath.model.get(),                                           // model
      VerilogVerificationTargetGenerator::backend_selector::JASPERGOLD, // backend: COSA
      ret,  // target generator configuration
      vlg_cfg); // verilog generator configuration

  vg.GenerateTargets();


  return 0;
}
