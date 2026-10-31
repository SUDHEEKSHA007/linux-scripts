echo "=====SYSTEM HEALTH CHECK====="
echo "DISK USAGE"
df -h
echo "DISK USAGE WARNINGS"
df -P | awk 'NR>1 {
usage=$5
gsub("%","",usage)
if (usage>80) {
print "WARNING: " $6 " is " usage "% full"
}
}'
echo "CPU USAGE"
top -bn1 | head -n 5
echo "MEMORY USAGE"
free -h
echo "=====CHECK COMPLETED====="

