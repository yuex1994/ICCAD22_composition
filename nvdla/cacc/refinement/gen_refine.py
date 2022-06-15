f = open("ref.tmp", "w")

for i in range(128):
    f.write("     \"" + "sc2mac_dat_data" + str(i) + "\" : \"data_i" + str(i) + "\",\n")
    f.write("     \"" + "sc2mac_wt_data" + str(i) + "\" : \"weight_i" + str(i) + "\",\n")


f2 = open("f_map.tmp", "w")
