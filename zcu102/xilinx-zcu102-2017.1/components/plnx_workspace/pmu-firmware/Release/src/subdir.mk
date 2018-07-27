################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/idle_hooks.c \
../src/pm_api.c \
../src/pm_binding.c \
../src/pm_callbacks.c \
../src/pm_clock.c \
../src/pm_common.c \
../src/pm_config.c \
../src/pm_core.c \
../src/pm_ddr.c \
../src/pm_extern.c \
../src/pm_gic_proxy.c \
../src/pm_gpp.c \
../src/pm_master.c \
../src/pm_mmio_access.c \
../src/pm_node.c \
../src/pm_node_reset.c \
../src/pm_notifier.c \
../src/pm_periph.c \
../src/pm_pll.c \
../src/pm_power.c \
../src/pm_proc.c \
../src/pm_requirement.c \
../src/pm_reset.c \
../src/pm_slave.c \
../src/pm_sram.c \
../src/pm_system.c \
../src/pm_usb.c \
../src/xpfw_aib.c \
../src/xpfw_core.c \
../src/xpfw_crc.c \
../src/xpfw_error_manager.c \
../src/xpfw_events.c \
../src/xpfw_interrupts.c \
../src/xpfw_ipi_manager.c \
../src/xpfw_main.c \
../src/xpfw_mod_dap.c \
../src/xpfw_mod_em.c \
../src/xpfw_mod_legacy.c \
../src/xpfw_mod_pm.c \
../src/xpfw_mod_rtc.c \
../src/xpfw_mod_sched.c \
../src/xpfw_mod_stl.c \
../src/xpfw_mod_wdt.c \
../src/xpfw_module.c \
../src/xpfw_platform.c \
../src/xpfw_resets.c \
../src/xpfw_restart.c \
../src/xpfw_rom_interface.c \
../src/xpfw_scheduler.c \
../src/xpfw_user_startup.c \
../src/xpfw_util.c \
../src/xpfw_xpu.c 

S_UPPER_SRCS += \
../src/xpfw_start.S 

OBJS += \
./src/idle_hooks.o \
./src/pm_api.o \
./src/pm_binding.o \
./src/pm_callbacks.o \
./src/pm_clock.o \
./src/pm_common.o \
./src/pm_config.o \
./src/pm_core.o \
./src/pm_ddr.o \
./src/pm_extern.o \
./src/pm_gic_proxy.o \
./src/pm_gpp.o \
./src/pm_master.o \
./src/pm_mmio_access.o \
./src/pm_node.o \
./src/pm_node_reset.o \
./src/pm_notifier.o \
./src/pm_periph.o \
./src/pm_pll.o \
./src/pm_power.o \
./src/pm_proc.o \
./src/pm_requirement.o \
./src/pm_reset.o \
./src/pm_slave.o \
./src/pm_sram.o \
./src/pm_system.o \
./src/pm_usb.o \
./src/xpfw_aib.o \
./src/xpfw_core.o \
./src/xpfw_crc.o \
./src/xpfw_error_manager.o \
./src/xpfw_events.o \
./src/xpfw_interrupts.o \
./src/xpfw_ipi_manager.o \
./src/xpfw_main.o \
./src/xpfw_mod_dap.o \
./src/xpfw_mod_em.o \
./src/xpfw_mod_legacy.o \
./src/xpfw_mod_pm.o \
./src/xpfw_mod_rtc.o \
./src/xpfw_mod_sched.o \
./src/xpfw_mod_stl.o \
./src/xpfw_mod_wdt.o \
./src/xpfw_module.o \
./src/xpfw_platform.o \
./src/xpfw_resets.o \
./src/xpfw_restart.o \
./src/xpfw_rom_interface.o \
./src/xpfw_scheduler.o \
./src/xpfw_start.o \
./src/xpfw_user_startup.o \
./src/xpfw_util.o \
./src/xpfw_xpu.o 

S_UPPER_DEPS += \
./src/xpfw_start.d 

C_DEPS += \
./src/idle_hooks.d \
./src/pm_api.d \
./src/pm_binding.d \
./src/pm_callbacks.d \
./src/pm_clock.d \
./src/pm_common.d \
./src/pm_config.d \
./src/pm_core.d \
./src/pm_ddr.d \
./src/pm_extern.d \
./src/pm_gic_proxy.d \
./src/pm_gpp.d \
./src/pm_master.d \
./src/pm_mmio_access.d \
./src/pm_node.d \
./src/pm_node_reset.d \
./src/pm_notifier.d \
./src/pm_periph.d \
./src/pm_pll.d \
./src/pm_power.d \
./src/pm_proc.d \
./src/pm_requirement.d \
./src/pm_reset.d \
./src/pm_slave.d \
./src/pm_sram.d \
./src/pm_system.d \
./src/pm_usb.d \
./src/xpfw_aib.d \
./src/xpfw_core.d \
./src/xpfw_crc.d \
./src/xpfw_error_manager.d \
./src/xpfw_events.d \
./src/xpfw_interrupts.d \
./src/xpfw_ipi_manager.d \
./src/xpfw_main.d \
./src/xpfw_mod_dap.d \
./src/xpfw_mod_em.d \
./src/xpfw_mod_legacy.d \
./src/xpfw_mod_pm.d \
./src/xpfw_mod_rtc.d \
./src/xpfw_mod_sched.d \
./src/xpfw_mod_stl.d \
./src/xpfw_mod_wdt.d \
./src/xpfw_module.d \
./src/xpfw_platform.d \
./src/xpfw_resets.d \
./src/xpfw_restart.d \
./src/xpfw_rom_interface.d \
./src/xpfw_scheduler.d \
./src/xpfw_user_startup.d \
./src/xpfw_util.d \
./src/xpfw_xpu.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O2 -c -fmessage-length=0 -MT"$@" -Os -flto -ffat-lto-objects -I../../pmu-firmware_bsp/psu_pmu_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v9.2 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O2 -c -fmessage-length=0 -MT"$@" -Os -flto -ffat-lto-objects -I../../pmu-firmware_bsp/psu_pmu_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v9.2 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


