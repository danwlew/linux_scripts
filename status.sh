#!/bin/bash

echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " $2 "%"}'

echo "Memory Usage:"
free -h | awk '/^Mem:/ {print "Used: "$3", Free: "$4}'

echo "Disk Usage:"
df -h | awk '/^\/dev/ {print $1 ": " $5}'
