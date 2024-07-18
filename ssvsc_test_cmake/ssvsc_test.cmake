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
