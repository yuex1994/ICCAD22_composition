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
#include <csc.h>

#include <ilang/ilang++.h>
#include <ilang/util/log.h>
#include <iostream>
#include <ilang/vtarget-out/vtarget_gen.h>
using namespace std;

using namespace ilang;

/// the function to generate configuration
VerilogVerificationTargetGenerator::vtg_config_t SetConfiguration();

void verify_csc(Ila& model, 
  VerilogVerificationTargetGenerator::vtg_config_t vtg_cfg,
  const std::vector<std::string> & design_files); 

int main(int argc, char* argv[]) {
  SetToStdErr(1);

  cout << "start";
  // get the ILA model
  auto csc = GetCSCIla("csc");

  ILA_INFO << "#instr: " << csc.instr_num();
  for (auto i = 0; i < csc.instr_num(); i++) {
    ILA_INFO << csc.instr(i);
  }

  ILA_INFO << "#state: " << csc.state_num();
  for (auto i = 0; i < csc.state_num(); i++) {
    ILA_INFO << csc.state(i);
  }

  ILA_INFO << "#input: " << csc.input_num();
  for (auto i = 0; i < csc.input_num(); i++) {
    ILA_INFO << csc.input(i);
  }

  std::vector<std::string> csc_design_files = {
    "NV_NVDLA_csc_top.v"
  };

  auto vtg_cfg = SetConfiguration();

  verify_csc(csc, vtg_cfg, csc_design_files);

  

  return 0;
}

void verify_csc(
  Ila& model, 
  VerilogVerificationTargetGenerator::vtg_config_t vtg_cfg,
  const std::vector<std::string> & design_files
   ) {
  VerilogGeneratorBase::VlgGenConfig vlg_cfg;
  vlg_cfg.pass_node_name = true;
  vtg_cfg.ForceInstCheckReset = true;
  vtg_cfg.MemAbsReadAbstraction = true;

  std::string RootPath    = "..";
  std::string VerilogPath = RootPath    + "/nvdla/csc/";
  std::string IncludePath = VerilogPath + "include/";
  std::string RefrelPath  = RootPath    + "/refinement/";
  std::string OutputPath  = RootPath    + "/verification/";

  std::vector<std::string> path_to_design_files;
  for(auto && f : design_files)
    path_to_design_files.push_back( VerilogPath + f );
  

  VerilogVerificationTargetGenerator vg(
      {IncludePath},                                         // one include path
      path_to_design_files,                                  // designs
      "NV_NVDLA_csc",                               // top_module_name
      RefrelPath + "ref-rel-var-map-csc.json",                // variable mapping
      RefrelPath + "ref-rel-inst-cond-csc.json",              // conditions of start/ready
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
