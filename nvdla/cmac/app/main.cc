#include <ilang/vtarget-out/vtarget_gen.h>
#include "cmac_ila.h"

/// To verify the block level operation of ILA
/*
void verifyBlockLevel(Ila& model, VerilogVerificationTargetGenerator::vtg_config_t vtg_cfg) {

  VerilogGeneratorBase::VlgGenConfig vlg_cfg;

  vtg_cfg.MemAbsReadAbstraction = true; // enable read abstraction
  vtg_cfg.MaxBound = 40;                // bound of BMC
  vlg_cfg.pass_node_name = true;	// whether to use node name in Verilog

  std::string RootPath = "..";
  std::string VerilogPath = RootPath + "/verilog/";
  std::string RefrelPath = RootPath + "/refinement/";
  std::string OutputPath = RootPath + "/verification/";

  VerilogVerificationTargetGenerator vg(
      {}, // no include
      {VerilogPath + "aes_top.v",   VerilogPath + "reg2byte.v",
       VerilogPath + "reg16byte.v", VerilogPath + "reg32byte.v",
       VerilogPath + "reg256byte.v",
       VerilogPath + "aes_128_abs.v"},                // designs
      "aes_top",                                      // top_module_name
      RefrelPath + "ref-rel-var-map-uaes.json",       // variable mapping
      RefrelPath + "ref-rel-inst-cond-uaes.json",     // conditions of start/ready
      OutputPath,                                     // output path
      model.child(0).get(),                           // model
      VerilogVerificationTargetGenerator::backend_selector::COSA, // backend: COSA
      vtg_cfg,  // target generator configuration
      vlg_cfg); // verilog generator configuration

  vg.GenerateTargets();
}

/// Build the model
int main(int argc, char **argv) {
  // extract the configurations
  auto vtg_cfg = HandleArguments(argc, argv);

  // build the aes model
  AES aes_ila_model;
  // build the aes128 model
  AES_128 aes128;
  // verify separately the hierarchical ILA
  // from IO level down to the AES 128 function
  verifyIO(aes_ila_model.model, vtg_cfg);
  verifyBlockLevel(aes_ila_model.model, vtg_cfg);
  verifyAES128(aes128.model, vtg_cfg);

  return 0;
}
*/


int main() {
  NVDLA_CMAC cmac_model;
  SetUnsignedComparison(true);
  VerilogVerificationTargetGenerator::vtg_config_t vtg_cfg;

  VerilogGeneratorBase::VlgGenConfig vlg_cfg;
  // vtg_cfg.MemAbsReadAbstraction = true; // enable read abstraction
  vtg_cfg.MaxBound = 40;                // bound of BMC
  vlg_cfg.pass_node_name = true;	// whether to use node name in Verilog

  std::string RootPath = "..";
  std::string VerilogPath = RootPath + "/verilog/";
  std::string RefrelPath = RootPath + "/refinement/";
  std::string OutputPath = RootPath + "/verification2/";

  VerilogVerificationTargetGenerator vg(
      {}, // no include
      {VerilogPath + "NV_NVDLA_CMAC_CORE_active.v",   VerilogPath + "NV_NVDLA_CMAC_CORE_cfg.v",
       VerilogPath + "NV_NVDLA_CMAC_CORE_MAC_exp.v", VerilogPath + "NV_NVDLA_CMAC_CORE_MAC_mul.v",

       VerilogPath + "simulate_x_tick.vh",
       VerilogPath + "NV_NVDLA_CMAC_CORE_MAC_nan.v",
       VerilogPath + "NV_NVDLA_CMAC_CORE_mac.v",
       VerilogPath + "NV_NVDLA_CMAC_CORE_rt_in.v",
       VerilogPath + "NV_NVDLA_CMAC_CORE_rt_out.v",
       VerilogPath + "NV_NVDLA_CMAC_CORE_slcg.v",
       VerilogPath + "NV_NVDLA_CMAC_core.v",
       VerilogPath + "NV_NVDLA_CMAC_REG_dual.v",
       VerilogPath + "NV_NVDLA_CMAC_REG_single.v",
       VerilogPath + "NV_NVDLA_CMAC_reg.v",
       VerilogPath + "NV_NVDLA_cmac.v",
       VerilogPath + "NV_DW_lsd.v",
       VerilogPath + "NV_DW_minmax.v",
       VerilogPath + "NV_DW02_tree.v"
       },                // designs
      "NV_NVDLA_cmac",   // top_module_name
      RefrelPath + "ref-rel-var-map.json",       // variable mapping
      RefrelPath + "ref-rel-inst-cond.json",     // conditions of start/ready
      OutputPath,                                     // output path
      cmac_model.model.get(),                           // model
      VerilogVerificationTargetGenerator::backend_selector::JASPERGOLD, // backend: COSA
      vtg_cfg,  // target generator configuration
      vlg_cfg); // verilog generator configuration

  vg.GenerateTargets();

}
