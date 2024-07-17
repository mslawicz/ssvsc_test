set(SDK_PATH "${CMAKE_SOURCE_DIR}/../../../SDKs/simplicity_sdk")
set(COPIED_SDK_PATH "simplicity_sdk_2024.6.0")
message(CMAKE_SOURCE_DIR="${CMAKE_SOURCE_DIR}")
message(PROJECT_SOURCE_DIR="${PROJECT_SOURCE_DIR}")

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
    "../app.c"
    "../autogen/sl_board_default_init.c"
    "../autogen/sl_event_handler.c"
    "../autogen/sl_simple_led_instances.c"
    "../blink.c"
    "../main.c"
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
