# Disable ECC

This config disables the all the ECC modules when put in /etc/modprobe.d.
Otherwise the Kernel will check for ECC-RAM in my Asrock Extreme6 mainboard.
I don't have ECC-RAM build in, so this speeds up boot and removes some errors
from my bootlog.
