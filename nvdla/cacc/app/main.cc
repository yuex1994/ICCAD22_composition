#include <ilang/vtarget-out/vtarget_gen.h>
#include "cacc_ila.h"

int main() {
  NVDLA_CACC cacc_model;
  SetUnsignedComparison(true);
  VerilogVerificationTargetGenerator::vtg_config_t vtg_cfg;

  VerilogGeneratorBase::VlgGenConfig vlg_cfg;
  // vtg_cfg.MemAbsReadAbstraction = true; // enable read abstraction
  vtg_cfg.MaxBound = 40;                // bound of BMC
  vlg_cfg.pass_node_name = true;	// whether to use node name in Verilog

  std::string RootPath = "..";
  std::string VerilogPath = RootPath + "/verilog/";
  std::string RefrelPath = RootPath + "/refinement/";
  std::string OutputPath = RootPath + "/verification/";

  VerilogVerificationTargetGenerator vg(
      {}, // no include
      {VerilogPath + "NV_NVDLA_CACC_assembly_buffer.v",   VerilogPath + "NV_NVDLA_CACC_assembly_ctrl.v",
       VerilogPath + "NV_NVDLA_CACC_CALC_fp_48b.v", VerilogPath + "NV_NVDLA_CACC_CALC_int8.v",
       VerilogPath + "NV_NVDLA_CACC_CALC_int16.v",
       VerilogPath + "NV_NVDLA_CACC_calculator.v",
       VerilogPath + "NV_NVDLA_CACC_delivery_buffer.v",
       VerilogPath + "NV_NVDLA_CACC_delivery_ctrl.v",
       VerilogPath + "NV_NVDLA_CACC_dual_reg.v",
       VerilogPath + "NV_NVDLA_CACC_regfile.v",
       VerilogPath + "NV_NVDLA_CACC_single_reg.v",
       VerilogPath + "NV_NVDLA_CACC_slcg.v",
       VerilogPath + "NV_NVDLA_CACC_regfile.v",
       VerilogPath + "NV_NVDLA_cacc.v",
       VerilogPath + "simulate_x_tick.vh",
       VerilogPath + "NV_DW_lsd.v",
       VerilogPath + "NV_DW_minmax.v",
       VerilogPath + "nv_ram_rws_32x512_logic.v",
       VerilogPath + "nv_ram_rws_32x544_logic.v",
       VerilogPath + "nv_ram_rws_32x768_logic.v"
      //  VerilogPath + "CKLNQD12PO4.v",
      //  VerilogPath + "NV_BLKBOX_SINK.v",
      //  VerilogPath + "ScanShareSel_JTAG_reg_ext_cg.v",
      //  VerilogPath + "SDFCNQD1.v",
      //  VerilogPath + "SDFQD1.v",
      //  VerilogPath + "SDFSNQD1.v",
      //  VerilogPath + "sync2d_c_pp.v",
      //  VerilogPath + "p_SDFCNQD1PO4.v"
       },                // designs
      "NV_NVDLA_cacc",   // top_module_name
      RefrelPath + "ref-rel-var-map.json",       // variable mapping
      RefrelPath + "ref-rel-inst-cond.json",     // conditions of start/ready
      OutputPath,                                     // output path
      cacc_model.model.get(),                           // model  
      VerilogVerificationTargetGenerator::backend_selector::JASPERGOLD, // backend: COSA
      vtg_cfg,  // target generator configuration
      vlg_cfg); // verilog generator configuration

  vg.GenerateTargets();

}
