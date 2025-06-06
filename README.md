Here I explain how to create Gentoo and eventually Archlinux and maybe Slackware for theYY3568 board.
Getting a u-boot that works is a little problem. For now my work around was one that was created for ubuntu
I created a small image that has the bootloader in hidden area and a broken ext4 partition
I then copy a rootfs to that partition and use some function to fix the broken partition and expand it.


The partition is an EFI partition formatted as ext4 which is weird.
I will eventually change uboot.img to have that fixed

I plan to do archlinux before I do that.

For now all you have to do is this, make sure that you use the correct dev if sdd is not your micro SD card :

sudo gdisk /dev/sdd
p
t
8300
w
Y




