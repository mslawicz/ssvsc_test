set(SDK_PATH "C:/Users/marci/SimplicityStudio/SDKs/simplicity_sdk")
set(COPIED_SDK_PATH "simplicity_sdk_2024.6.0")

add_library(slc_ssvsc_test OBJECT
    "${SDK_PATH}/hardware/board/src/sl_board_control_gpio.c"
    "${SDK_PATH}/hardware/board/src/sl_board_init.c"
    "${SDK_PATH}/platform/common/src/sl_assert.c"
    "${SDK_PATH}/platform/common/src/sl_core_cortexm.c"
    "${SDK_PATH}/platform/common/src/sl_syscalls.c"
    "${SDK_PATH}/platform/Device/SiliconLabs/MGM24/Source/startup_mgm24.c"
    "${SDK_PATH}/platform/Device/SiliconLabs/MGM24/Source/system_mgm24.c"
    "${SDK_PATH}/platform/driver/leddrv/src/sl_led.c"
    "${SDK_PATH}/platform/driver/leddrv/src/sl_simple_led.c"
    "${SDK_PATH}/platform/driver/pwm/src/sl_pwm.c"
    "${SDK_PATH}/platform/emdrv/dmadrv/src/dmadrv.c"
    "${SDK_PATH}/platform/emdrv/gpiointerrupt/src/gpiointerrupt.c"
    "${SDK_PATH}/platform/emdrv/uartdrv/src/uartdrv.c"
    "${SDK_PATH}/platform/emlib/src/em_burtc.c"
    "${SDK_PATH}/platform/emlib/src/em_cmu.c"
    "${SDK_PATH}/platform/emlib/src/em_core.c"
    "${SDK_PATH}/platform/emlib/src/em_emu.c"
    "${SDK_PATH}/platform/emlib/src/em_eusart.c"
    "${SDK_PATH}/platform/emlib/src/em_gpio.c"
    "${SDK_PATH}/platform/emlib/src/em_ldma.c"
    "${SDK_PATH}/platform/emlib/src/em_msc.c"
    "${SDK_PATH}/platform/emlib/src/em_prs.c"
    "${SDK_PATH}/platform/emlib/src/em_system.c"
    "${SDK_PATH}/platform/emlib/src/em_timer.c"
    "${SDK_PATH}/platform/emlib/src/em_usart.c"
    "${SDK_PATH}/platform/peripheral/src/sl_hal_sysrtc.c"
    "${SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager.c"
    "${SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c"
    "${SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager_init.c"
    "${SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c"
    "${SDK_PATH}/platform/service/device_init/src/sl_device_init_dcdc_s2.c"
    "${SDK_PATH}/platform/service/device_init/src/sl_device_init_emu_s2.c"
    "${SDK_PATH}/platform/service/device_manager/clocks/sl_device_clock_efr32xg24.c"
    "${SDK_PATH}/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg24.c"
    "${SDK_PATH}/platform/service/device_manager/src/sl_device_clock.c"
    "${SDK_PATH}/platform/service/device_manager/src/sl_device_peripheral.c"
    "${SDK_PATH}/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c"
    "${SDK_PATH}/platform/service/memory_manager/src/sl_memory_manager_region.c"
    "${SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer.c"
    "${SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c"
    "${SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.c"
    "${SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c"
    "${SDK_PATH}/platform/service/system/src/sl_system_init.c"
    "${SDK_PATH}/platform/service/system/src/sl_system_process_action.c"
    "../autogen/sl_board_default_init.c"
    "../autogen/sl_event_handler.c"
    "../autogen/sl_pwm_init.c"
    "../autogen/sl_simple_led_instances.c"
    "../autogen/sl_uartdrv_init.c"
)

target_include_directories(slc_ssvsc_test PUBLIC
   "../config"
   "../autogen"
   "../."
    "${SDK_PATH}/platform/Device/SiliconLabs/MGM24/Include"
    "${SDK_PATH}/platform/common/inc"
    "${SDK_PATH}/hardware/board/inc"
    "${SDK_PATH}/platform/service/clock_manager/inc"
    "${SDK_PATH}/platform/service/clock_manager/src"
    "${SDK_PATH}/platform/CMSIS/Core/Include"
    "${SDK_PATH}/platform/service/device_manager/inc"
    "${SDK_PATH}/platform/service/device_init/inc"
    "${SDK_PATH}/platform/emdrv/dmadrv/inc"
    "${SDK_PATH}/platform/emdrv/dmadrv/inc/s2_signals"
    "${SDK_PATH}/platform/emdrv/common/inc"
    "${SDK_PATH}/platform/emlib/inc"
    "${SDK_PATH}/platform/emdrv/gpiointerrupt/inc"
    "${SDK_PATH}/platform/peripheral/inc"
    "${SDK_PATH}/platform/service/interrupt_manager/inc"
    "${SDK_PATH}/platform/service/interrupt_manager/inc/arm"
    "${SDK_PATH}/platform/driver/leddrv/inc"
    "${SDK_PATH}/platform/service/memory_manager/inc"
    "${SDK_PATH}/platform/driver/pwm/inc"
    "${SDK_PATH}/platform/common/toolchain/inc"
    "${SDK_PATH}/platform/service/system/inc"
    "${SDK_PATH}/platform/service/sleeptimer/inc"
    "${SDK_PATH}/platform/emdrv/uartdrv/inc"
)

target_compile_definitions(slc_ssvsc_test PUBLIC
    "DEBUG_EFM=1"
    "MGM240PB32VNA=1"
    "HARDWARE_BOARD_DEFAULT_RF_BAND_2400=1"
    "HARDWARE_BOARD_SUPPORTS_1_RF_BAND=1"
    "HARDWARE_BOARD_SUPPORTS_RF_BAND_2400=1"
    "SL_BOARD_NAME=\"BRD2704A\""
    "SL_BOARD_REV=\"A00\""
    "SL_COMPONENT_CATALOG_PRESENT=1"
    "SL_CODE_COMPONENT_PERIPHERAL_SYSRTC=hal_sysrtc"
    "CMSIS_NVIC_VIRTUAL=1"
    "CMSIS_NVIC_VIRTUAL_HEADER_FILE=\"cmsis_nvic_virtual.h\""
    "SL_CODE_COMPONENT_CORE=core"
    "SL_CODE_COMPONENT_SLEEPTIMER=sleeptimer"
)

target_link_libraries(slc_ssvsc_test PUBLIC
    "-Wl,--start-group"
    "gcc"
    "c"
    "m"
    "nosys"
    "-Wl,--end-group"
)
target_compile_options(slc_ssvsc_test PUBLIC
    $<$<COMPILE_LANGUAGE:C>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:C>:-mthumb>
    $<$<COMPILE_LANGUAGE:C>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:C>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:C>:-Wall>
    $<$<COMPILE_LANGUAGE:C>:-Wextra>
    $<$<COMPILE_LANGUAGE:C>:-Os>
    $<$<COMPILE_LANGUAGE:C>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:C>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:C>:-fomit-frame-pointer>
    "$<$<COMPILE_LANGUAGE:C>:SHELL:-imacros sl_gcc_preinclude.h>"
    $<$<COMPILE_LANGUAGE:C>:-mcmse>
    $<$<COMPILE_LANGUAGE:C>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:C>:-g>
    $<$<COMPILE_LANGUAGE:CXX>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:CXX>:-mthumb>
    $<$<COMPILE_LANGUAGE:CXX>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:CXX>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
    $<$<COMPILE_LANGUAGE:CXX>:-Wall>
    $<$<COMPILE_LANGUAGE:CXX>:-Wextra>
    $<$<COMPILE_LANGUAGE:CXX>:-Os>
    $<$<COMPILE_LANGUAGE:CXX>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-fomit-frame-pointer>
    "$<$<COMPILE_LANGUAGE:CXX>:SHELL:-imacros sl_gcc_preinclude.h>"
    $<$<COMPILE_LANGUAGE:CXX>:-mcmse>
    $<$<COMPILE_LANGUAGE:CXX>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:CXX>:-g>
    $<$<COMPILE_LANGUAGE:ASM>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:ASM>:-mthumb>
    $<$<COMPILE_LANGUAGE:ASM>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:ASM>:-mfloat-abi=hard>
    "$<$<COMPILE_LANGUAGE:ASM>:SHELL:-imacros sl_gcc_preinclude.h>"
    "$<$<COMPILE_LANGUAGE:ASM>:SHELL:-x assembler-with-cpp>"
)

set(post_build_command )
set_property(TARGET slc_ssvsc_test PROPERTY C_STANDARD 17)
set_property(TARGET slc_ssvsc_test PROPERTY CXX_STANDARD 17)
set_property(TARGET slc_ssvsc_test PROPERTY CXX_EXTENSIONS OFF)

target_link_options(slc_ssvsc_test INTERFACE
    -mcpu=cortex-m33
    -mthumb
    -mfpu=fpv5-sp-d16
    -mfloat-abi=hard
    -T${CMAKE_CURRENT_LIST_DIR}/../autogen/linkerfile.ld
    --specs=nano.specs
    "SHELL:-Xlinker -Map=$<TARGET_FILE_DIR:ssvsc_test>/ssvsc_test.map"
    -Wl,--gc-sections
    -Wl,--no-warn-rwx-segments
)

# BEGIN_SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
