# PiStuff
A range of commands that are helpful for Raspberry Pi projects

To remove the access point if you've installed one:

Download and run disable_wifi_ap.sh 

# Manual Commands

On a headless/non-UI Raspberry Pi (Lite) installation, to use a USB stick inserted:

sudo apt update
sudo apt install exfat-fuse exfatprogs

Then install the USB disk controller/manager:

sudo apt install udisks2


Then run fdisk -l to identify the drive (example: /dev/sda2

Then mount the drive so you can use files on it:

udisksctl mount -b /dev/sda2

Then look in the /media directory (cd /media and ls) to see the drive mounted, then run whatever code you need to.
