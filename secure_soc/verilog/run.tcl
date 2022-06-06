analyze -sva oc8051_defines.v oc8051_gm_top.v oc8051_timescale.v  

elaborate -sv09_expression_mode -top oc8051_top
clock wb_clk_i
reset -expression wb_rst_i

assert -name test1 {((!first_time) && wbd_stb_o) |-> ((!oc8051_memory_interface1.inc_pc until wbd_ack_i))}



