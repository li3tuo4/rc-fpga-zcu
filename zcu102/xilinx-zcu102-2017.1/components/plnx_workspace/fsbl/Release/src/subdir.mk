################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
/home/lituo/workspace/riscv/riscv-zcu102/fpga-zynq/zcu102/xilinx-zcu102-2017.1/components/plnx_workspace/fsbl_hwproj/psu_init.c \
../src/xfsbl_authentication.c \
../src/xfsbl_board.c \
../src/xfsbl_bs.c \
../src/xfsbl_csu_dma.c \
../src/xfsbl_dfu_util.c \
../src/xfsbl_handoff.c \
../src/xfsbl_hooks.c \
../src/xfsbl_image_header.c \
../src/xfsbl_initialization.c \
../src/xfsbl_main.c \
../src/xfsbl_misc.c \
../src/xfsbl_misc_drivers.c \
../src/xfsbl_nand.c \
../src/xfsbl_partition_load.c \
../src/xfsbl_plpartition_valid.c \
../src/xfsbl_qspi.c \
../src/xfsbl_rsa_sha.c \
../src/xfsbl_sd.c \
../src/xfsbl_usb.c 

S_UPPER_SRCS += \
../src/xfsbl_exit.S \
../src/xfsbl_translation_table.S 

OBJS += \
./src/psu_init.o \
./src/xfsbl_authentication.o \
./src/xfsbl_board.o \
./src/xfsbl_bs.o \
./src/xfsbl_csu_dma.o \
./src/xfsbl_dfu_util.o \
./src/xfsbl_exit.o \
./src/xfsbl_handoff.o \
./src/xfsbl_hooks.o \
./src/xfsbl_image_header.o \
./src/xfsbl_initialization.o \
./src/xfsbl_main.o \
./src/xfsbl_misc.o \
./src/xfsbl_misc_drivers.o \
./src/xfsbl_nand.o \
./src/xfsbl_partition_load.o \
./src/xfsbl_plpartition_valid.o \
./src/xfsbl_qspi.o \
./src/xfsbl_rsa_sha.o \
./src/xfsbl_sd.o \
./src/xfsbl_translation_table.o \
./src/xfsbl_usb.o 

S_UPPER_DEPS += \
./src/xfsbl_exit.d \
./src/xfsbl_translation_table.d 

C_DEPS += \
./src/psu_init.d \
./src/xfsbl_authentication.d \
./src/xfsbl_board.d \
./src/xfsbl_bs.d \
./src/xfsbl_csu_dma.d \
./src/xfsbl_dfu_util.d \
./src/xfsbl_handoff.d \
./src/xfsbl_hooks.d \
./src/xfsbl_image_header.d \
./src/xfsbl_initialization.d \
./src/xfsbl_main.d \
./src/xfsbl_misc.d \
./src/xfsbl_misc_drivers.d \
./src/xfsbl_nand.d \
./src/xfsbl_partition_load.d \
./src/xfsbl_plpartition_valid.d \
./src/xfsbl_qspi.d \
./src/xfsbl_rsa_sha.d \
./src/xfsbl_sd.d \
./src/xfsbl_usb.d 


# Each subdirectory must supply rules for building sources it contributes
src/psu_init.o: /home/lituo/workspace/riscv/riscv-zcu102/fpga-zynq/zcu102/xilinx-zcu102-2017.1/components/plnx_workspace/fsbl_hwproj/psu_init.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM A53 gcc compiler'
	aarch64-none-elf-gcc -DARMA53_64 -Wall -O2 -I"/home/lituo/workspace/riscv/riscv-zcu102/fpga-zynq/zcu102/xilinx-zcu102-2017.1/components/plnx_workspace/fsbl_hwproj" -c -fmessage-length=0 -MT"$@" -Os -flto -ffat-lto-objects -DXPS_BOARD_ZCU102 -DXPS_BOARD_ZCU102 -I../../fsbl_bsp/psu_cortexa53_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM A53 gcc compiler'
	aarch64-none-elf-gcc -DARMA53_64 -Wall -O2 -I"/home/lituo/workspace/riscv/riscv-zcu102/fpga-zynq/zcu102/xilinx-zcu102-2017.1/components/plnx_workspace/fsbl_hwproj" -c -fmessage-length=0 -MT"$@" -Os -flto -ffat-lto-objects -DXPS_BOARD_ZCU102 -DXPS_BOARD_ZCU102 -I../../fsbl_bsp/psu_cortexa53_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: ARM A53 gcc compiler'
	aarch64-none-elf-gcc -DARMA53_64 -Wall -O2 -I"/home/lituo/workspace/riscv/riscv-zcu102/fpga-zynq/zcu102/xilinx-zcu102-2017.1/components/plnx_workspace/fsbl_hwproj" -c -fmessage-length=0 -MT"$@" -Os -flto -ffat-lto-objects -DXPS_BOARD_ZCU102 -DXPS_BOARD_ZCU102 -I../../fsbl_bsp/psu_cortexa53_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


