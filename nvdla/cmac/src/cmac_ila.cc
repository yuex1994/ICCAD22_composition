/// \file the ila example of NVDLA CMAC design
#include "cmac_ila.h"

const int kDataSize = 128;
const int kWeightSize = 128;
const int kByteSize = 8;
const int kActSize = 8;
const int kActUnitSize = 176;
const int kCmacStatusAddr = 0x7000;
const int kCmacPointerAddr = 0x7004;
const int kCmacOpAEnableAddr = 0x7008;
const int kCmacCfgAAddr = 0x700c;
const int kCmacOpBEnableAddr = 0x8008;
const int kCmacCfgBAddr = 0x800c;
const ExprRef bool_true = asthub::BoolConst(true);
const ExprRef bool_false = asthub::BoolConst(false);

NVDLA_CMAC::NVDLA_CMAC()
    : // construct the model
      model("NVDLA_CMAC"),
      // I/O interface: this is where the commands come from.
      producer(model.NewBoolState("producer")),
      consumer(model.NewBoolState("consumer")),
      conv_mode0(model.NewBoolState("conv_mode0")),
      conv_mode1(model.NewBoolState("conv_mode1")),
      proc_precision0(model.NewBvState("proc_precision0", 2)),
      proc_precision1(model.NewBvState("proc_precision1", 2)),
      op_en0(model.NewBoolState("op_en0")),
      op_en1(model.NewBoolState("op_en1"))
      {
	      std::vector<ExprRef> weight_i, data_i;
        for (auto i = 0; i < kDataSize; i++) {
          data_i.push_back(model.NewBvInput("data_i" + std::to_string(i), kByteSize));
        }
        for (auto i = 0; i < kWeightSize; i++) {
          weight_i.push_back(model.NewBvInput("weight_i" + std::to_string(i), kByteSize));
        }
        auto data_mask_i = model.NewBvInput("data_mask_i", kDataSize);
        auto data_valid_i = model.NewBoolInput("data_valid_i");
        auto data_pd_i = model.NewBvInput("data_pd_i", 9);
        auto data_ready_o = model.NewBoolState("data_ready_o");
        auto weight_mask_i = model.NewBvInput("weight_mask_i", kWeightSize);
        auto weight_valid_i = model.NewBoolInput("weight_valid_i");
        auto weight_sel_i = model.NewBvInput("weight_sel_i", 8);

        auto csb_req_pd_i = model.NewBvInput("csb_req_pd", 63);
        auto csb_req_valid_i = model.NewBoolInput("csb_req_valid_i");
        auto csb_req_ready_o = model.NewBoolState("csb_req_ready_o");
        auto csb_resp_valid_o = model.NewBoolState("csb_resp_valid_o");
        auto csb_resp_pd_o = model.NewBvState("csb_resp_pd_o", 34);

	      std::vector<ExprRef> act_data_o;
        auto data_mask_o = model.NewBvState("data_mask_o", kDataSize);
        auto act_valid_o = model.NewBoolState("data_valid_o");
        for (auto i = 0; i < kActSize; i++) {
          act_data_o.push_back(model.NewBvState("act_data_o" + std::to_string(i), kActUnitSize));
        }
        auto act_mask_o = model.NewBvState("act_mask_o", 8);
        auto act_pd_o = model.NewBvState("act_pd_o", 9);

        auto csb_req_addr_i = Extract(csb_req_pd_i, 21, 0);
        auto csb_req_wdata_i = Extract(csb_req_pd_i, 53, 22);
        auto csb_req_wr_i = Extract(csb_req_pd_i, 54, 54);
        // assign req_write = req_pd[54];
        // assign req_nposted = req_pd[55];
        // assign req_srcpriv = req_pd[56];
        // assign req_wrbe[3:0] = req_pd[60:57];
        // assign req_level[1:0] = req_pd[62:61]; 
        auto reg_offset = Concat(Extract(csb_req_addr_i, 21, 0), BvConst(0, 2));

        {
          auto instr = model.NewInstr("set pointer");
          instr.SetDecode((\
            Extract(reg_offset, 11, 0) == BvConst(kCmacPointerAddr & 0xfff, 12)) &\
            csb_req_wr_i & csb_req_valid_i & csb_req_ready_o);
          instr.SetUpdate(producer, Extract(csb_req_wdata_i, 0, 0));
        }

        {
          auto instr = model.NewInstr("set op_enable_0");
          instr.SetDecode((\
            Extract(reg_offset, 11, 0) == BvConst(kCmacOpAEnableAddr & 0xfff, 12)) &\
            (producer == bool_false) & (op_en0 == bool_false) & csb_req_wr_i &\
            csb_req_valid_i & csb_req_ready_o);
          instr.SetUpdate(op_en0, Extract(csb_req_wdata_i, 0, 0)); 
        }

        {
          auto instr = model.NewInstr("set cfg_0");
          instr.SetDecode((\
            Extract(reg_offset, 11, 0) == BvConst(kCmacCfgAAddr & 0xfff, 12)) &\
            (producer == bool_false) & (op_en0 == bool_false) & csb_req_wr_i &\
            csb_req_valid_i & csb_req_ready_o);
          instr.SetUpdate(conv_mode0, Extract(csb_req_wdata_i, 0, 0));
          instr.SetUpdate(proc_precision0, Extract(csb_req_wdata_i, 13, 12));
        }

        {
          auto instr = model.NewInstr("set op_enable_1");
          instr.SetDecode((\
            Extract(reg_offset, 11, 0) == BvConst(kCmacOpBEnableAddr & 0xfff, 12)) &\
            (producer == bool_true) & (op_en1 == bool_false) & csb_req_wr_i & csb_req_valid_i &\
            csb_req_ready_o);
          instr.SetUpdate(op_en1, Extract(csb_req_wdata_i, 0, 0)); 
        }

        {
          auto instr = model.NewInstr("set cfg_1");
          instr.SetDecode((\
            Extract(reg_offset, 11, 0) == BvConst(kCmacCfgBAddr & 0xfff, 12)) &\
            (producer == bool_true) & (op_en1 == bool_false) & csb_req_wr_i &\
            csb_req_valid_i & csb_req_ready_o);
          instr.SetUpdate(conv_mode1, Extract(csb_req_wdata_i, 0, 0));
          instr.SetUpdate(proc_precision1, Extract(csb_req_wdata_i, 13, 12));
        }

        {
          auto instr = model.NewInstr("compute");
          instr.SetDecode(data_valid_i & weight_valid_i & data_ready_o);
          SortRef out_sort = SortRef::BV(kActUnitSize);
          // SortRef arg0_sort = SortRef::BV(kDataSize * kByteSize);
          // SortRef arg1_sort = SortRef::BV(kWeightSize * kByteSize);
          // auto arg0 = data_i[0];
          // auto arg1 = weight_i[0];
          // for (auto i = 1; i < kDataSize; i++) {
          //   arg0 = Concat(data_i[i], arg0);
          //   arg1 = Concat(weight_i[i], arg1);
          // }
          for (auto i = 0; i < kActSize; i++) {
            // FuncRef act_func_i("muladd_" + std::to_string(i), out_sort, arg_sort);
            // FuncRef act_func_i("muladd_" + std::to_string(i), out_sort, arg0_sort, arg1_sort);
            FuncRef act_func_i("muladd_" + std::to_string(i), out_sort);
            // instr.SetUpdate(act_data_o[i], act_func_i(arg0, arg1));
            instr.SetUpdate(act_data_o[i], act_func_i());
          }
          instr.SetUpdate(act_valid_o, data_valid_i);
          instr.SetUpdate(act_mask_o, BvConst(255, kByteSize));
          instr.SetUpdate(act_pd_o, data_pd_i);
        }
}
