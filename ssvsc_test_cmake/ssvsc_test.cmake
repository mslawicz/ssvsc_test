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

# BEGIN_SIMPLICITY_STUDIO_METADATA=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=END_SIMPLICITY_STUDIO_METADATA
