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

# BEGIN_SIMPLICITY_STUDIO_METADATA=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=END_SIMPLICITY_STUDIO_METADATA
