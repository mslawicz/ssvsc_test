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
