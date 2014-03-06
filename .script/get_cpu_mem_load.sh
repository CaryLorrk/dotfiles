cpu_load=`uptime | awk '{printf "%3d%%", $10*100}'`
mem_load=`free | awk 'NR == 2{printf "%3d%%", $3*100/$2}'`

echo "CPU:$cpu_load  MEM:$mem_load"
