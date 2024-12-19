#!/bin/bash

echo "Top 10 processes by memory usage:"
ps aux --sort=-%mem | awk 'NR<=10 {print $0}'

echo ""
echo "Top 10 processes by CPU usage:"
ps aux --sort=-%cpu | awk 'NR<=10 {print $0}'
