#!/bin/bash

for disk in $(lsblk -dn -o NAME); do
  echo "SMART Info for /dev/$disk"
  smartctl -H /dev/$disk | grep "SMART overall-health"
  echo ""
done
