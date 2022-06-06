/// \file the ila example of upstream of BSG_Link
///

#include "stream.h"

BSG_DOWNSTREAM::BSG_DOWNSTREAM()
    : // construct the model
      model("BSG_DOWNSTREAM_ch"),
    
    // Input data
    io_valid_in (model.NewBvInput("io_valid_in", 1)),
    io_data_in (model.NewBvInput("io_data_in", CHANNEL_WIDTH)),
    // Input ready
    core_ready (model.NewBvInput("core_ready", 1)),

    // Output Channel
    core_data_out  (model.NewBvState("core_data_out", CORE_WIDTH/2)),
    core_valid_out (model.NewBvState("core_valid_out", 1)),

    // Token Out Channel
    io_token_out   (model.NewBvState("io_token_out", 1)),

    // Internal valid and data
    io_valid       (model.NewBvState("io_valid", 1)), // indicate whether the second phase of the data
    io_data        (model.NewBvState("io_data", CHANNEL_WIDTH)),
    core_data0      (model.NewBvState("core_data0", CORE_WIDTH/4)),

    // Internal State
    buffer (model.NewMemState("buffer", BUFFER_BIT, CORE_WIDTH/4)),
    rptr   (model.NewBvState("rptr", BUFFER_BIT + 1)),
    wptr   (model.NewBvState("wptr", BUFFER_BIT + 1)),
    wptr_t (model.NewBvState("wptr_t",  BUFFER_BIT + 1)),
    full   (model.NewBvState("full", 1))
{
    model.SetValid( /*always true*/ BoolConst(true) );
    // ------- Instruction ------ //
    {
        // Receive from Upstream
        auto instr = model.NewInstr("DOWN_DATA_IN_FIRST");
        instr.SetDecode((io_valid_in == BvConst(1,1) & io_valid == BvConst(0,1)) );

        instr.SetUpdate(io_valid, BvConst(1,1));
        instr.SetUpdate(io_data,  io_data_in);
    }

    {
        // Receive from Upstream
        auto instr = model.NewInstr("DOWN_DATA_IN_SECOND");
        instr.SetDecode((io_valid_in == BvConst(1,1) & io_valid == BvConst(1,1)) );

        instr.SetUpdate(io_valid, BvConst(0,1));

        // write buffer
        instr.SetUpdate(buffer, Store(buffer, wptr(BUFFER_BIT - 1, 0), Concat(io_data_in, io_data)));

        auto wptr_updated = wptr + 1; 
        instr.SetUpdate(wptr, wptr_updated);
        instr.SetUpdate(full, Ite(wptr_updated(BUFFER_BIT) != rptr(BUFFER_BIT) & 
                                  wptr(BUFFER_BIT - 1, 0) == rptr(BUFFER_BIT - 1, 0), 
                              BvConst(1,1), BvConst(0,1)));
        instr.SetUpdate(wptr_t, wptr_updated);
    }

    {   // Produce Instruction
        auto instr = model.NewInstr("DOWN_DATA0");
        instr.SetDecode(wptr_t != rptr & rptr(0) == BvConst(0,1) & core_valid_out == BvConst(0,1));

        auto data_out = Load(buffer, rptr(BUFFER_BIT-1,0));
        instr.SetUpdate(core_data0, data_out);
        instr.SetUpdate(rptr, rptr + 1);
        instr.SetUpdate(full, BvConst(0,1));
    }

    {   // Produce Instruction
        auto instr = model.NewInstr("DOWN_DATA1");
        instr.SetDecode(wptr_t != rptr & rptr(0) == BvConst(1,1) & core_valid_out == BvConst(0,1));

        auto data_out = Load(buffer, rptr(BUFFER_BIT-1,0));
        instr.SetUpdate(core_data_out, Concat(data_out, core_data0));
        instr.SetUpdate(core_valid_out, BvConst(1, 1));
        instr.SetUpdate(rptr, rptr + 1);
        instr.SetUpdate(full, BvConst(0,1));

        auto rptr_updated = rptr + 1;
        instr.SetUpdate(io_token_out, rptr_updated(3)^rptr(3));
    }

    {
        // Send Instruction
        auto instr = model.NewInstr("DOWN_DATA_SEND");
        instr.SetDecode(core_ready == BvConst(1,1) & core_valid_out == BvConst(1,1));

        instr.SetUpdate(core_valid_out, BvConst(0,1));

    }

    {
        // Send Instruction
        auto instr = model.NewInstr("DOWN_TOKEN_SEND");
        instr.SetDecode(io_token_out == BvConst(1,1));
        
        instr.SetUpdate(io_token_out, BvConst(0, 1));
    }
}
