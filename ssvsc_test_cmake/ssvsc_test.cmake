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
    "${SDK_PATH}/platform/emlib/src/em_burtc.c"
    "${SDK_PATH}/platform/emlib/src/em_cmu.c"
    "${SDK_PATH}/platform/emlib/src/em_core.c"
    "${SDK_PATH}/platform/emlib/src/em_emu.c"
    "${SDK_PATH}/platform/emlib/src/em_gpio.c"
    "${SDK_PATH}/platform/emlib/src/em_ldma.c"
    "${SDK_PATH}/platform/emlib/src/em_msc.c"
    "${SDK_PATH}/platform/emlib/src/em_prs.c"
    "${SDK_PATH}/platform/emlib/src/em_system.c"
    "${SDK_PATH}/platform/emlib/src/em_timer.c"
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
    "${SDK_PATH}/platform/peripheral/inc"
    "${SDK_PATH}/platform/service/interrupt_manager/inc"
    "${SDK_PATH}/platform/service/interrupt_manager/inc/arm"
    "${SDK_PATH}/platform/driver/leddrv/inc"
    "${SDK_PATH}/platform/service/memory_manager/inc"
    "${SDK_PATH}/platform/driver/pwm/inc"
    "${SDK_PATH}/platform/common/toolchain/inc"
    "${SDK_PATH}/platform/service/system/inc"
    "${SDK_PATH}/platform/service/sleeptimer/inc"
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
