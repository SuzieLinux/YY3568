Here I explain how to create Gentoo and eventually Archlinux and maybe Slackware for theYY3568 board.
Getting a u-boot that works is a little problem. For now my work around was one that was created for ubuntu
I created a small image that has the bootloader in hidden area and a broken ext4 partition
I then copy a rootfs to that partition and use some function to fix the broken partition and expand it.

There is an issue with the u-boot.img if you use a device smaller than 32G, it was 64G
Once I figure out how to create a bootable u-boot using that file won't be necessary

