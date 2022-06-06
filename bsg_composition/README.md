# BSG_OFFCHIP Composition
Complete Verification of the off-chip protocol including the interface check

## Resources
**Full implementation**: [bsg_link](https://github.com/bespoke-silicon-group/basejump_stl/tree/master/bsg_link).

**Simulation**: [bsg_network_test](https://github.com/bespoke-silicon-group/basejump_stl/tree/master/testing/bsg_noc/bsg_wormhole_network).

To run the simulation, you still have to 
  1. Comment out "export BSG_CADENV_DIR = $(dir)/bsg_cadenv" and "include $(BSG_CADENV_DIR)/cadenv.mk"
  2. Replace "$(VCS_BIN)/vcs" with your own VCS paths.
  
## Interface Check Properties Example
### Pre-completion Check

**valid_o == 1**
  - valid == 1 |-> nexttime $stable(valid) until “decode of DATA_Sent”
  - valid == 1 |-> nexttime $stable(valid) until “decode of DATA_Sent”
  - token == 1 |-> nexttime $stable(token) until “decode of TOKEN_Sent”
  
**valid_o == 0**
  - valid == 0 |-> nexttime $stable(valid) until “decode of DATA_Out” 
  - token == 0 |-> nexttime $stable(token) until “decode of DATA_Out”
