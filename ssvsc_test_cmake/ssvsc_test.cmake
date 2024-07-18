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
    "${SDK_PATH}/platform/emlib/src/em_burtc.c"
    "${SDK_PATH}/platform/emlib/src/em_cmu.c"
    "${SDK_PATH}/platform/emlib/src/em_core.c"
    "${SDK_PATH}/platform/emlib/src/em_emu.c"
    "${SDK_PATH}/platform/emlib/src/em_gpio.c"
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
