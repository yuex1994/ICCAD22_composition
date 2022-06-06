/// \file The child ila of upstream

#include "stream.h"

void BSG_UPSTREAM::AddChild(InstrRef& inst) {
  auto child = model.NewChild("BSG_UPSTREAM_OUT");
  auto ready = (sent_cnt - finish_cnt) < BvConst(64, 7);

  child.SetValid(child_valid == BvConst(1,1));

  auto step = child.NewBvState("step", STEP_BITS);

  // init conditions : when doing verification
  // should be exported as the status update of the higher-level
  // triggering instruction
  child.AddInit(step == BvConst(0, STEP_BITS));

  { // First Cycle of Output: positive // Produce
    auto instr = child.NewInstr("Output0");
    instr.SetDecode(child_valid == BvConst(1,1) & ready & step == BvConst(0,2));

    for (int i = 0; i < CHANNEL_NUM; i++){
        instr.SetUpdate(io_data_out[i], 
        Extract(data_cycle_0, CHANNEL_WIDTH * (2 * i + 1) - 1, CHANNEL_WIDTH * 2 * i));
    }
    instr.SetUpdate(io_valid_out, BvConst(1,1));
    
    instr.SetUpdate(step, BvConst(1,2));
    instr.SetUpdate(sent_cnt, sent_cnt + 1);
  }

  { // First Cycle of Output: negative // Send & Produce
    auto instr = child.NewInstr("Output1_Send0");
    instr.SetDecode(step == BvConst(1,2) & ready);

    for (int i = 0; i < CHANNEL_NUM; i++){
        instr.SetUpdate(io_data_out[i], 
        Extract(data_cycle_0, CHANNEL_WIDTH * (2 * i + 2) - 1, CHANNEL_WIDTH * (2 * i + 1)));
    }
    instr.SetUpdate(io_valid_out, BvConst(1, 1)); // only 1 on posedge
    instr.SetUpdate(step, BvConst(2,2));
  }

  { // Second Cycle of Output : positive // Send & Produce
    auto instr = child.NewInstr("Output2_Send1");
    instr.SetDecode(ready & io_valid_out == BvConst(1,1) & step == BvConst(2,2));

    for (int i = 0; i < CHANNEL_NUM; i++){
        instr.SetUpdate(io_data_out[i], 
        Extract(data_cycle_1, CHANNEL_WIDTH * (2 * i + 1) - 1, CHANNEL_WIDTH * 2 * i));
    }
    instr.SetUpdate(io_valid_out, BvConst(1,1));

    instr.SetUpdate(sent_cnt, sent_cnt + 1);
    instr.SetUpdate(step, BvConst(3,2));
  }

  { // Second Cycle of Output : negative
    auto instr = child.NewInstr("Output3_Send2"); // Send & Produce
    instr.SetDecode(io_valid_out == BvConst(1,1) & step == BvConst(3,2) & ready);

    for (int i = 0; i < CHANNEL_NUM; i++){
        instr.SetUpdate(io_data_out[i], 
        Extract(data_cycle_1, CHANNEL_WIDTH * (2 * i + 2) - 1, CHANNEL_WIDTH * (2 * i + 1)));
    }
    instr.SetUpdate(io_valid_out, BvConst(1,1)); // only 1 on posedge
    instr.SetUpdate(step, BvConst(0,2));
  }

  { // Final Data Send Instruction
    auto instr = child.NewInstr("Send3"); // Send & Produce
    instr.SetDecode(io_valid_out == BvConst(1,1) & step == BvConst(0,2));

    instr.SetUpdate(io_valid_out, BvConst(0,1)); 
    instr.SetUpdate(child_valid, BvConst(0,1));
  }
}
