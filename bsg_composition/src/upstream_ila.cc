/// \file the ila example of Downstream of BSG_Link
///

#include "stream.h"

BSG_UPSTREAM::BSG_UPSTREAM()
    : // construct the model
      model("BSG_UPSTREAM"),
    
    // Input Data Channel 
    core_data_in  (model.NewBvInput("core_data_in", CORE_WIDTH)),
    core_valid_in (model.NewBvInput("core_valid_in", 1)),

    // Input Token Channel
    io_token      (model.NewBvInput("io_token", 1)),

    // Output
    io_valid_out (model.NewBvState("io_valid_out", 1)),

    // Internal states
    data_cycle_0 (model.NewBvState("data_cycle_0", CORE_WIDTH/2)),
    data_cycle_1 (model.NewBvState("data_cycle_1", CORE_WIDTH/2)),
    child_valid  (model.NewBvState("child_valid", 1)),
    sent_cnt     (model.NewBvState("sent_cnt", BUFFER_BIT + 1)),
    finish_cnt   (model.NewBvState("finish_cnt", BUFFER_BIT + 1))

{
    // Output
    for (int i = 0; i < CHANNEL_NUM; i++){
        io_data_out.push_back(model.NewBvState("io_data_out_ch" + std::to_string(i), CHANNEL_WIDTH));
    }
    model.SetValid( /*always true*/ BoolConst(true) );

    model.AddInit(sent_cnt == BvConst(0, BUFFER_BIT + 1));
    model.AddInit(finish_cnt == BvConst(0, BUFFER_BIT + 1));

    // ------- Instruction ------ //

    {
        auto instr = model.NewInstr("TOKEN_IN");
        instr.SetDecode(io_token == BvConst(1,1));
        instr.SetUpdate(finish_cnt, finish_cnt + BvConst(8, BUFFER_BIT + 1));
    }

    {
        auto instr = model.NewInstr("DATA_IN");
        instr.SetDecode((core_valid_in == BvConst(1,1) & child_valid == BvConst(0, 1)) );
        instr.SetUpdate(data_cycle_0, Extract(core_data_in, CORE_WIDTH/2 - 1, 0));
        instr.SetUpdate(data_cycle_1, Extract(core_data_in, CORE_WIDTH - 1, CORE_WIDTH/2));
        instr.SetUpdate(child_valid, BvConst(1,1));
        AddChild(instr);
    }

}
