#!/bin/bash
proj=$1
base_dir=`pwd`
proj_dir=$base_dir/$proj
config_dir=$base_dir/soft_config

bsp=$config_dir/xilinx-zcu102-v2017.1-final.bsp
gen_config=$config_dir/config
rootfs_config=$config_dir/rootfs_config
device_tree=$config_dir/system-user.dtsi
fpga=$config_dir/rocketchip_wrapper.bit

#require: fpga implemented (bitstream) and exported (*.hdf)
petalinux-create -t project -s $bsp -n $proj
cd $proj_dir
#copy config file to the folder and replace the default config file
cp -v $gen_config $proj_dir/project-spec/configs/
#FIX the hardcoded path
sed -i "s@FIXME_PLDIR@$proj_dir@g" $proj_dir/project-spec/configs/config
petalinux-config --get-hw-description=$config_dir --oldconfig
#copy config file to the folder and replace the default config file
cp -v $rootfs_config $proj_dir/project-spec/configs/
#load petalinux_config
petalinux-config -c rootfs --oldconfig 
#load petalinux_rootfs_config
#modify <PetaLinux-project>/project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi
cp -v $device_tree $proj_dir/project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi

petalinux-build

cd $proj_dir/images/linux 
petalinux-package --boot --fsbl zynqmp_fsbl.elf --fpga $fpga --pmufw pmufw.elf --u-boot --force
#Now you have BOOT.BIN and image.ub
