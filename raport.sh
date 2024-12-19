#!/bin/bash

echo "System Information Report"
echo "=========================="
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo "OS Version: $(lsb_release -d | awk -F"\t" '{print $2}')"
echo "Kernel Version: $(uname -r)"
echo "CPU Info: $(lscpu | grep 'Model name' | awk -F: '{print $2}')"
echo "Total Memory: $(free -h | awk '/^Mem:/ {print $2}')"
echo "Disk Usage:"
df -h | grep "^/dev"
echo "Network Interfaces:"
ip -br addr
