/// \file the ila example of NVDLA CMAC design
#include "cacc_ila.h"

// const int kDataSize = 128;
// const int kWeightSize = 128;
// const int kByteSize = 8;
// const int kActSize = 8;
const int kActInDW = 176;
const int kActInSize = 8;
const int kActOutDW = 514;
const int kModeW = 8;
const int kPDW = 9;
const int kCaccStatusAddr = 0x9000;
const int kCaccPointerAddr = 0x9004;
const int kCaccOpEnableAddr = 0x9008;
const int kCfgAddr = 0x900c;
const int kDOutSize0Addr = 0x9010;
const int kDOutSize1Addr = 0x9014;
const int kDOutAddrAddr = 0x9018;
const int kDBatchNumAddr = 0x901c;
const int kDLineStrideAddr = 0x9020;
const int kDSurfStrideAddr = 0x9024;
const int kDDataOutMapAddr = 0x9028;
const int kDClipCfgAddr = 0x902c;
const int kDSaturateAddr = 0x9030;
// const int kCmacStatusAddr = 0x7000;
// const int kCmacPointerAddr = 0x7004;
// const int kCmacOpAEnableAddr = 0x7008;
// const int kCmacCfgAAddr = 0x700c;
// const int kCmacOpBEnableAddr = 0x8008;
// const int kCmacCfgBAddr = 0x800c;
const ExprRef bool_true = asthub::BoolConst(true);
const ExprRef bool_false = asthub::BoolConst(false);

NVDLA_CACC::NVDLA_CACC()
    : // construct the model
      model("NVDLA_CACC"),
      producer(model.NewBoolState("producer")),
      conv_mode0(model.NewBoolState("conv_mode0")),
      conv_mode1(model.NewBoolState("conv_mode1")),
      proc_precision0(model.NewBvState("proc_precision0", 2)),
      proc_precision1(model.NewBvState("proc_precision1", 2)),
      op_en0(model.NewBoolState("op_en0")),
      op_en1(model.NewBoolState("op_en1")),
      dataout_width_0(model.NewBvState("dataout_width_0", 13)),
      dataout_width_1(model.NewBvState("dataout_width_1", 13)),
      dataout_height_0(model.NewBvState("dataout_height_0", 13)),
      dataout_height_1(model.NewBvState("dataout_height_1", 13)),
      dataout_channel_0(model.NewBvState("dataout_channel_0", 13)),
      dataout_channel_1(model.NewBvState("dataout_channel_1", 13)),
      dataout_addr_0(model.NewBvState("dataout_addr_0", 27)),
      dataout_addr_1(model.NewBvState("dataout_addr_1", 27)),
      batch_number_0(model.NewBvState("batch_number_0", 5)),
      batch_number_1(model.NewBvState("batch_number_1", 5)),
      line_stride_0(model.NewBvState("line_stride_0", 19)),
      line_stride_1(model.NewBvState("line_stride_1", 19)),
      surf_stride_0(model.NewBvState("surf_stride_0", 19)),
      surf_stride_1(model.NewBvState("surf_stride_1", 19)),
      line_packed_0(model.NewBoolState("line_packed_0")),
      line_packed_1(model.NewBoolState("line_packed_1")),
      surf_packed_0(model.NewBoolState("surf_packed_0")),
      surf_packed_1(model.NewBoolState("surf_packed_1")),
      clip_cfg_0(model.NewBvState("clip_cfg_0", 5)),
      clip_cfg_1(model.NewBvState("clip_cfg_1", 5))
      {
        auto csb_req_pd_i = model.NewBvInput("csb_req_pd_i", 63);
        auto csb_req_valid_i = model.NewBoolInput("csb_req_valid_i");
        auto csb_req_ready_o = model.NewBoolState("csb_req_ready_o");

	    std::vector<ExprRef> act_i_a, act_i_b; 
        for (auto i = 0; i < kActInSize; i++) {
            act_i_a.push_back(model.NewBvInput("act_i_a" + std::to_string(i), \
            kActInDW));
            act_i_b.push_back(model.NewBvInput("act_i_b" + std::to_string(i), \
            kActInDW));
        }
        std::vector<ExprRef> abuf, bbuf;
        for (auto i = 0; i < kActInSize; i++) {
            if (i < kActInSize / 2) {
                abuf.push_back(model.NewBvInput("abuf" + std::to_string(i), \
                768));
            }
            else {
                abuf.push_back(model.NewBvInput("bbuf" + std::to_string(i), \
                544));
            }
        }

        auto mask_a_i = model.NewBvInput("mask_a_i", kActInDW);
        auto mode_a_i = model.NewBvInput("mode_a_i", kModeW);
        auto pd_a_i = model.NewBvInput("pd_a_i", kPDW);
        auto valid_a_i = model.NewBoolInput("valid_a_i");
        auto ready_a_o = model.NewBoolState("ready_a_o");
        auto mask_b_i = model.NewBvInput("mask_b_i", kActInDW);
        auto mode_b_i = model.NewBvInput("mode_b_i", kModeW);
        auto pd_b_i = model.NewBvInput("pd_b_i", kPDW);
        auto valid_b_i = model.NewBoolInput("valid_b_i");
        auto ready_b_o = model.NewBoolState("ready_b_o");

        auto cacc2sdp_pd_o = model.NewBvState("cacc2sdp_pd_o", kActOutDW);
        auto cacc2sdp_valid_o = model.NewBoolState("cacc2sdp_valid_o");
        auto cacc2sdp_ready_i = model.NewBoolInput("cacc2sdp_ready_i");
        auto cacc2sc_credit_valid_o = model.NewBoolState("cacc2sc_credit_valid_o");
        auto cacc2sc_credit_pd_o = model.NewBvState("cacc2sc_credit_pd_o", 3);



        auto csb_req_addr_i = Extract(csb_req_pd_i, 21, 0);
        auto csb_req_wdata_i = Extract(csb_req_pd_i, 53, 22);
        auto csb_req_wr_i = Extract(csb_req_pd_i, 54, 54);
        // assign req_write = req_pd[54];
        // assign req_nposted = req_pd[55];
        // assign req_srcpriv = req_pd[56];
        // assign req_wrbe[3:0] = req_pd[60:57];
        // assign req_level[1:0] = req_pd[62:61]; 

        auto reg_offset = Concat(Extract(csb_req_addr_i, 21, 0), \
        BvConst(0, 2));

        {
          auto instr = model.NewInstr("set pointer");
          instr.SetDecode((\
            Extract(reg_offset, 11, 0) == BvConst(kCaccPointerAddr & 0xfff, 12)) &\
            csb_req_wr_i & csb_req_valid_i & csb_req_ready_o);
          instr.SetUpdate(producer, Extract(csb_req_wdata_i, 0, 0));
        }

        {
          auto instr = model.NewInstr("set op_enable_0");
          instr.SetDecode((\
           Extract(reg_offset, 11, 0) == BvConst(kCaccOpEnableAddr & 0xfff, 12)) &\
             (producer == bool_false) & (op_en0 == bool_false) & csb_req_wr_i &\
             csb_req_valid_i & csb_req_ready_o);
          instr.SetUpdate(op_en0, bool_true); 
        }

        {
          auto instr = model.NewInstr("set op_enable_1");
          instr.SetDecode((\
             Extract(reg_offset, 11, 0) == BvConst(kCaccOpEnableAddr & 0xfff, 12)) &\
             (producer == bool_true) & (op_en1 == bool_false) & csb_req_wr_i &\
             csb_req_valid_i & csb_req_ready_o);
          instr.SetUpdate(op_en1, bool_true); 
        }

        {
          auto instr = model.NewInstr("set cfg_0");
          instr.SetDecode((\
            Extract(reg_offset, 11, 0) == BvConst(kCfgAddr & 0xfff, 12)) &\
            (producer == bool_false) & (op_en0 == bool_false) & csb_req_wr_i &\
            csb_req_valid_i & csb_req_ready_o);
          instr.SetUpdate(conv_mode0, Extract(csb_req_wdata_i, 0, 0));
          instr.SetUpdate(proc_precision0, Extract(csb_req_wdata_i, 13, 12));
        }

        {
          auto instr = model.NewInstr("set cfg_1");
          instr.SetDecode((\
            Extract(reg_offset, 11, 0) == BvConst(kCfgAddr & 0xfff, 12)) &\
            (producer == bool_true) & (op_en1 == bool_false) & csb_req_wr_i &\
            csb_req_valid_i & csb_req_ready_o);
          instr.SetUpdate(conv_mode1, Extract(csb_req_wdata_i, 0, 0));
          instr.SetUpdate(proc_precision1, Extract(csb_req_wdata_i, 13, 12));
        }

        {
            auto instr = model.NewInstr("set dataout_size_00");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDOutSize0Addr & 0xfff, 12)) &\
              (producer == bool_false) & (op_en0 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(dataout_width_0, Extract(csb_req_wdata_i, 12, 0));
            instr.SetUpdate(dataout_height_0, Extract(csb_req_wdata_i, 28, 16));
        }

        {
            auto instr = model.NewInstr("set dataout_size_01");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDOutSize0Addr & 0xfff, 12)) &\
              (producer == bool_true) & (op_en1 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(dataout_width_1, Extract(csb_req_wdata_i, 12, 0));
            instr.SetUpdate(dataout_height_1, Extract(csb_req_wdata_i, 28, 16));
        }     

        {
            auto instr = model.NewInstr("set dataout_size_10");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDOutSize1Addr & 0xfff, 12)) &\
              (producer == bool_false) & (op_en0 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(dataout_channel_0, Extract(csb_req_wdata_i, 12, 0));
        }

        {
            auto instr = model.NewInstr("set dataout_size_11");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDOutSize1Addr & 0xfff, 12)) &\
              (producer == bool_true) & (op_en1 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(dataout_channel_1, Extract(csb_req_wdata_i, 12, 0));
        }

        {
            auto instr = model.NewInstr("set dataout_addr_0");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDOutAddrAddr & 0xfff, 12)) &\
              (producer == bool_false) & (op_en0 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(dataout_addr_0, Extract(csb_req_wdata_i, 31, 5));
        }

        {
            auto instr = model.NewInstr("set dataout_addr_1");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDOutAddrAddr & 0xfff, 12)) &\
              (producer == bool_true) & (op_en1 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);

            instr.SetUpdate(dataout_addr_1, Extract(csb_req_wdata_i, 31, 5));
        }

        {
            auto instr = model.NewInstr("set batch_number_0");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDBatchNumAddr & 0xfff, 12)) &\
              (producer == bool_false) & (op_en0 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(batch_number_0, Extract(csb_req_wdata_i, 4, 0));
        }

        {
            auto instr = model.NewInstr("set batch_number_1");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDBatchNumAddr & 0xfff, 12)) &\
              (producer == bool_true) & (op_en1 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(batch_number_1, Extract(csb_req_wdata_i, 4, 0));
        }     

        {
            auto instr = model.NewInstr("set line_stride_0");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDLineStrideAddr & 0xfff, 12))&\
              (producer == bool_false) & (op_en0 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(line_stride_0, Extract(csb_req_wdata_i, 23, 5));
        }

        {
            auto instr = model.NewInstr("set line_stride_1");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDLineStrideAddr & 0xfff, 12)) &\
              (producer == bool_true) & (op_en1 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(line_stride_1, Extract(csb_req_wdata_i, 23, 5));
        }

        {
            auto instr = model.NewInstr("set surf_stride_0");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDSurfStrideAddr & 0xfff, 12)) &\
              (producer == bool_false) & (op_en0 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(surf_stride_0, Extract(csb_req_wdata_i, 23, 5));
        }

        {
            auto instr = model.NewInstr("set surf_stride_1");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDSurfStrideAddr & 0xfff, 12)) &\
              (producer == bool_true) & (op_en1 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(surf_stride_1, Extract(csb_req_wdata_i, 23, 5));
        }

        {
            auto instr = model.NewInstr("set dataout_map_0");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDDataOutMapAddr & 0xfff, 12)) &\
              (producer == bool_false) & (op_en0 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(line_packed_0, Extract(csb_req_wdata_i, 0, 0));
            instr.SetUpdate(surf_packed_0, Extract(csb_req_wdata_i, 16, 16));
        }

        {
            auto instr = model.NewInstr("set dataout_map_1");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDDataOutMapAddr & 0xfff, 12)) &\
              (producer == bool_true) & (op_en1 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(line_packed_1, Extract(csb_req_wdata_i, 0, 0));
            instr.SetUpdate(surf_stride_1, Extract(csb_req_wdata_i, 16, 16));
        }
        
        {
            auto instr = model.NewInstr("set clip_cfg_0");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDClipCfgAddr & 0xfff, 12)) &\
              (producer == bool_false) & (op_en0 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(clip_cfg_0, Extract(csb_req_wdata_i, 4, 0));
        }

        {
            auto instr = model.NewInstr("set clip_cfg_1");
            instr.SetDecode((\
              Extract(reg_offset, 11, 0) == BvConst(kDClipCfgAddr & 0xfff, 12)) &\ 
              (producer == bool_true) & (op_en1 == bool_false) & csb_req_wr_i &\
              csb_req_valid_i & csb_req_ready_o);
            instr.SetUpdate(clip_cfg_1, Extract(csb_req_wdata_i, 4, 0));
        }

        {
            auto instr = model.NewInstr("send_credit");
            instr.SetDecode(cacc2sdp_valid_o & cacc2sdp_ready_i);
            instr.SetUpdate(cacc2sc_credit_pd_o, BvConst(1, 3));
            instr.SetUpdate(cacc2sc_credit_valid_o, BoolConst(true));
        }

        {
          auto instr = model.NewInstr("compute");
          instr.SetDecode(valid_a_i & valid_b_i);
          SortRef out_sort = SortRef::BV(kActOutDW);
          SortRef arg0_sort = SortRef::BV(kActInDW * kActInSize);
          SortRef arg1_sort = SortRef::BV(kActInDW * kActInSize);
          SortRef arg2_sort = SortRef::BV(768*4 + 544*4);
          auto arg0 = act_i_a[0];
          auto arg1 = act_i_b[0];
          auto arg2 = abuf[0];
          for (auto i = 1; i < kActInSize; i++) {
            arg0 = Concat(act_i_a[i], arg0);
            arg1 = Concat(act_i_b[i], arg1);
            arg2 = Concat(abuf[i], arg2);
          }
          //   FuncRef act_func("act_func", out_sort, arg0_sort, arg1_sort, arg2_sort);
          FuncRef act_func("act_func", out_sort);

          // FuncRef abuf_func("abuf_func", )
          //   instr.SetUpdate(cacc2sdp_pd_o, act_func(arg0, arg1, arg2));
          instr.SetUpdate(cacc2sdp_pd_o, act_func());

          instr.SetUpdate(cacc2sdp_valid_o, valid_a_i);
        }
}
