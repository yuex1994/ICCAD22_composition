res = ""

for i in range(256):
    res += "    \"iram_{iram}\" : \"m1.iram_{iram}\",\n".format(iram=i)

out_f = open("iram_map_generated", "w")
out_f.write(res)
out_f.close()