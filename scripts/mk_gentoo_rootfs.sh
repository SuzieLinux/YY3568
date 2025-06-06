#!/bin/bash
#
# Script to create Archlinux rootfs.ext4 for the pocketbeagle2 board

# Copyright (C) 2025 Michel Catudal
# Michel Catudal <michelcatudal@gmail.com>
#
# SPDX-License-Identifier: sGPL-2.0+
#

# Force to english

LC_ALL=C

set -x # echo on

work_directory=$(pwd)
rootfs=$work_directory/gentoo_rootfs

ROOTFS_SIZE=$(rsync -an --stats $rootfs test | grep "Total file size" | sed 's/[^0-9]//g' | xargs -I{} expr {} / $((1024*1024)) + 2800)"M"

dd if=/dev/zero of=$work_directory/input/rootfs.ext4 bs=1 count=0 seek=$ROOTFS_SIZE

# If the rootfs directory does not exist, it will be created
mkdir -p $work_directory/rootfs

mkfs.ext4 $work_directory/input/rootfs.ext4
mount $work_directory/input/rootfs.ext4 $work_directory/rootfs

echo "Extracting filesystem on micro SD image ..."
rsync -a $rootfs/* $work_directory/rootfs



