#!/bin/bash

# Pobieranie punktów montowania z /etc/fstab
fstab_mount=($(awk '/^UUID/{print $2}' /etc/fstab))

# Pobieranie aktualnie zamontowanych punktów z /proc/mounts
current_mount=($(grep -P '^/dev/(?!.*snap)' /proc/mounts | awk '{print $2}'))

out=""

# Sprawdzenie każdego punktu z fstab
for i in "${fstab_mount[@]}"
do
  if [[ ! " ${current_mount[@]} " =~ " $i " ]]; then
    echo "This Mount Point Not Mounted: $i"
    out="fail"
  fi
done

if [[ -z $out ]]; then
  echo "All Disks Are Mounted Correctly."
fi
