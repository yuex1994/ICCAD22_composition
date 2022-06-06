// =============================================================================
// MIT License
//
// Copyright (c) 2019 Princeton University
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
// =============================================================================

// File: main.cc
#include <flex.h>

#include <ilang/ilang++.h>
#include <ilang/util/log.h>
#include <iostream>
#include <ilang/vtarget-out/vtarget_gen.h>
using namespace std;

using namespace ilang;

/// the function to generate configuration
VerilogVerificationTargetGenerator::vtg_config_t SetConfiguration();

void verify_pecore(Ila& model, 
  VerilogVerificationTargetGenerator::vtg_config_t vtg_cfg,
  const std::vector<std::string> & design_files); 

void verify_peact(Ila& model, 
  VerilogVerificationTargetGenerator::vtg_config_t vtg_cfg,
  const std::vector<std::string> & design_files); 

int main(int argc, char* argv[]) {
  SetToStdErr(1);

  cout << "start";
  // get the ILA model
  // auto pe_core = flex::GetPECoreIla("pe_core", 0);

  // ILA_INFO << "#input: " << pe_core.input_num();
  // ILA_INFO << "#state: " << pe_core.state_num();
  // ILA_INFO << "#instr: " << pe_core.instr_num();

  // for (auto i = 0; i < pe_core.instr_num(); i++) {
  //   ILA_INFO << pe_core.instr(i);
  // }
  // for (auto i = 0; i < pe_core.state_num(); i++) {
  //   ILA_INFO << pe_core.state(i);
  // }
  // for (auto i = 0; i < pe_core.input_num(); i++) {
  //   ILA_INFO << pe_core.input(i);
  // }

  // std::vector<std::string> pecore_design_files = {
  //   "concat_PECore_simply.v"
  // };

  // auto vtg_cfg = SetConfiguration();

  // verify_pecore(pe_core, vtg_cfg, pecore_design_files);

  auto pe_act = flex::GetPEActIla("pe_act", 0);

  ILA_INFO << "#input: " << pe_act.input_num();
  ILA_INFO << "#state: " << pe_act.state_num();
  ILA_INFO << "#instr: " << pe_act.instr_num();

  for (auto i = 0; i < pe_act.instr_num(); i++) {
    ILA_INFO << pe_act.instr(i);
  }

  // for (auto i = 0; i < pe_act.state_num(); i++) {
  //   ILA_INFO << pe_act.state(i);
  // }

  for (auto i = 0; i < pe_act.input_num(); i++) {
    ILA_INFO << pe_act.input(i);
  }

  std::vector<std::string> peact_design_files = {
    "concat_ActUnit_simply.v"
  };
  auto vtg_cfg = SetConfiguration();

  verify_peact(pe_act, vtg_cfg, peact_design_files);

  return 0;
}

void verify_pecore(
  Ila& model, 
  VerilogVerificationTargetGenerator::vtg_config_t vtg_cfg,
  const std::vector<std::string> & design_files
   ) {
  VerilogGeneratorBase::VlgGenConfig vlg_cfg;
  vlg_cfg.pass_node_name = true;
  vtg_cfg.ForceInstCheckReset = true;
  vtg_cfg.MemAbsReadAbstraction = true;

  std::string RootPath    = "..";
  std::string VerilogPath = RootPath    + "/verilog/";
  std::string IncludePath = VerilogPath + "include/";
  std::string RefrelPath  = RootPath    + "/refinement/";
  std::string OutputPath  = RootPath    + "/verification/";

  std::vector<std::string> path_to_design_files;
  for(auto && f : design_files)
    path_to_design_files.push_back( VerilogPath + f );
  

  VerilogVerificationTargetGenerator vg(
      {IncludePath},                                         // one include path
      path_to_design_files,                                  // designs
      "PECore",                               // top_module_name
      RefrelPath + "ref-rel-var-map-pecore.json",                // variable mapping
      RefrelPath + "ref-rel-inst-cond-pecore.json",              // conditions of start/ready
      OutputPath,                                            // output path
      model.get(),                                           // model
      VerilogVerificationTargetGenerator::backend_selector::JASPERGOLD, // backend: JASPERGOLD
      vtg_cfg,  // target generator configuration
      vlg_cfg); // verilog generator configuration

  vg.GenerateTargets();
}

void verify_peact(
  Ila& model, 
  VerilogVerificationTargetGenerator::vtg_config_t vtg_cfg,
  const std::vector<std::string> & design_files
   ) {
  VerilogGeneratorBase::VlgGenConfig vlg_cfg;
  vlg_cfg.pass_node_name = true;
  vtg_cfg.ForceInstCheckReset = true;
  vtg_cfg.MemAbsReadAbstraction = true;

  std::string RootPath    = "..";
  std::string VerilogPath = RootPath    + "/verilog/";
  std::string IncludePath = VerilogPath + "include/";
  std::string RefrelPath  = RootPath    + "/refinement/";
  std::string OutputPath  = RootPath    + "/verification/";

  std::vector<std::string> path_to_design_files;
  for(auto && f : design_files)
    path_to_design_files.push_back( VerilogPath + f );
  

  VerilogVerificationTargetGenerator vg(
      {IncludePath},                                         // one include path
      path_to_design_files,                                  // designs
      "ActUnit",                               // top_module_name
      RefrelPath + "ref-rel-var-map-peact.json",                // variable mapping
      RefrelPath + "ref-rel-inst-cond-peact.json",              // conditions of start/ready
      OutputPath,                                            // output path
      model.get(),                                           // model
      VerilogVerificationTargetGenerator::backend_selector::JASPERGOLD, // backend: JASPERGOLD
      vtg_cfg,  // target generator configuration
      vlg_cfg); // verilog generator configuration

  vg.GenerateTargets();
}

VerilogVerificationTargetGenerator::vtg_config_t SetConfiguration() {

  // set ilang option, operators like '<' will refer to unsigned arithmetics
  SetUnsignedComparison(true); 
  
  VerilogVerificationTargetGenerator::vtg_config_t ret;
  ret.CosaSolver = "btor";
  ret.CosaPyEnvironment = "~/cosaEnv/bin/activate";
  ret.CosaPath = "~/CoSA";
  ret.CosaGenTraceVcd = true;
  ret.CosaAddKeep = false;

  /// other configurations
  ret.PortDeclStyle = VlgVerifTgtGenBase::vtg_config_t::NEW;
  ret.CosaGenJgTesterScript = true;
  //ret.CosaOtherSolverOptions = "--blackbox-array";
  //ret.ForceInstCheckReset = true;

  return ret;
}
