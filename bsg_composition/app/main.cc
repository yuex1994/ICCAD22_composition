#include <stream.h>
#include <ilang/vtarget-out/vtarget_gen.h>

/// the function to generate configuration
VerilogVerificationTargetGenerator::vtg_config_t SetConfiguration();

void verify_upstream(
  Ila& model, 
  VerilogVerificationTargetGenerator::vtg_config_t vtg_cfg,
  const std::vector<std::string> & design_files
   ) {
  VerilogGeneratorBase::VlgGenConfig vlg_cfg;
  vlg_cfg.pass_node_name = true;
  vtg_cfg.ForceInstCheckReset = true;

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
      "bsg_link_ddr_upstream",                               // top_module_name
      RefrelPath + "ref-rel-var-map-up.json",                // variable mapping
      RefrelPath + "ref-rel-inst-cond-up.json",              // conditions of start/ready
      OutputPath,                                            // output path
      model.get(),                                           // model
      VerilogVerificationTargetGenerator::backend_selector::JASPERGOLD, // backend: JASPERGOLD
      vtg_cfg,  // target generator configuration
      vlg_cfg); // verilog generator configuration

  vg.GenerateTargets();
}

void verify_upstream_child(
  Ila& model, 
  VerilogVerificationTargetGenerator::vtg_config_t vtg_cfg,
  const std::vector<std::string> & design_files
   ) {
  VerilogGeneratorBase::VlgGenConfig vlg_cfg;
  vlg_cfg.pass_node_name = true;
  vtg_cfg.ForceInstCheckReset = true;

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
      "bsg_link_ddr_upstream",                               // top_module_name
      RefrelPath + "ref-rel-var-map-upchild.json",                // variable mapping
      RefrelPath + "ref-rel-inst-cond-upchild.json",              // conditions of start/ready
      OutputPath,                                            // output path
      model.child(0).get(),                                           // model
      VerilogVerificationTargetGenerator::backend_selector::JASPERGOLD, // backend: JASPERGOLD
      vtg_cfg,  // target generator configuration
      vlg_cfg); // verilog generator configuration

  vg.GenerateTargets();
}

void verify_downstream(
  Ila& model, 
  VerilogVerificationTargetGenerator::vtg_config_t vtg_cfg,
  const std::vector<std::string> & design_files
   ) {
  VerilogGeneratorBase::VlgGenConfig vlg_cfg;
  vlg_cfg.pass_node_name = true;
  vtg_cfg.ForceInstCheckReset = true;
  vtg_cfg.MemAbsReadAbstraction = true; // enable read abstraction

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
      "bsg_link_ddr_downstream",                               // top_module_name
      RefrelPath + "ref-rel-var-map-down.json",                // variable mapping
      RefrelPath + "ref-rel-inst-cond-down.json",              // conditions of start/ready
      OutputPath,                                            // output path
      model.get(),                                           // model
      VerilogVerificationTargetGenerator::backend_selector::JASPERGOLD, // backend: JASPERGOLD
      vtg_cfg,  // target generator configuration
      vlg_cfg); // verilog generator configuration

  vg.GenerateTargets();
}

/// Build the model
int main() {
  // extract the configurations
  std::vector<std::string> upstream_design_files = {
    "bsg_link_ddr_upstream.sv2v.v",
  };

  std::vector<std::string> downstream_design_files = {
    "bsg_link_ddr_downstream.sv2v.v"
  };

  auto vtg_cfg = SetConfiguration();

  // build the model
  BSG_UPSTREAM upstream_ila;
  BSG_DOWNSTREAM downstream_ila;

  verify_upstream_child(upstream_ila.model, vtg_cfg, upstream_design_files);
  //verify_upstream(upstream_ila.model, vtg_cfg, upstream_design_files);
  //verify_downstream(downstream_ila.model, vtg_cfg, downstream_design_files);

  return 0;
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