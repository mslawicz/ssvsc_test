set(SDK_PATH "C:/Users/ep14231/SimplicityStudio/SDKs/simplicity_sdk")
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
