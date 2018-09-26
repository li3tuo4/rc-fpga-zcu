#!/bin/bash

if [ -z "$1" ]
  then
    echo "Please provide the root path to a SD card"
    exit 1
fi

if [ ! -d "$1/BOOT" ]
  then
    echo "Cannot find the \"BOOT\" partition of SD card"
    exit 1
fi

if [ ! -d "$1/rootfs" ]
  then
    echo "Cannot find the \"rootfs\" partition of SD card"
    exit 1
fi

fpga_images_dir=fpga-images-$2

set -x
cp $fpga_images_dir/BOOT.BIN $1/BOOT/
cp $fpga_images_dir/image.ub $1/BOOT/
cd $fpga_images_dir/ && gzip -d initramfs.cpio.gz
sudo cp initramfs.cpio $1/rootfs/
cd $1/rootfs/; sudo pax -rf initramfs.cpio
