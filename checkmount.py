from pathlib import Path
from re import search

# Wczytanie punktów montowania z /etc/fstab
fstab_read = Path('/etc/fstab').read_text().splitlines()
fstab = {x.split()[1] for x in fstab_read if x.startswith('UUID')}

# Wczytanie aktualnie zamontowanych punktów z /proc/mounts
mounts_read = Path('/proc/mounts').read_text().splitlines()
mounts = {y.split()[1] for y in mounts_read if search(r'^/dev/(?!.*snap)', y)}

# Porównanie i wyświetlenie wyników
out = fstab - mounts

if not out:
    print("All Disks Are Mounted Correctly.")
else:
    print("These Mount Points Are Not Mounted:", *out, sep="\n")
