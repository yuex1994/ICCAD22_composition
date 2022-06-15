f = open("ref.tmp", "w")

for i in range(128):
    f.write("     \"" + "sc2mac_dat_data" + str(i) + "\" : \"data_i" + str(i) + "\",\n")
    f.write("     \"" + "sc2mac_wt_data" + str(i) + "\" : \"weight_i" + str(i) + "\",\n")


f2 = open("f_map.tmp", "w")
f2.write("  \"value-holder\":{\n")
for i in range(8):
    f2.write("    \"iend_out_data_" + str(i) + "\":{\n")
    f2.write("      \"cond\": \"##stage_tracker## == 7\",\n")
    f2.write("      \"val\": \"m1.u_core.u_mac_" + str(i) + ".mac_out_data\",\n")
    f2.write("      \"width\": 176\n")
    if i < 7:
        f2.write("    },\n")
    else:
        f2.write("    }\n")
f2.write("  }")
f2.close()