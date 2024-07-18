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

# BEGIN_SIMPLICITY_STUDIO_METADATA=eJztXQtz3DaS/iuuqdTV7q2G1MNOfDo7LlkaJ9qTLJVGci6VSbEoEhrxzNeRHElOKv/9wDdBAiQANobS1t0jtjlAfx8ajQdBdPefs8uri38ujq+Nq4uL69nh7M/V7GpxdnR9+mVhNH9azQ5XM01bzf6a7VR1lhc3V8eLJa727sOT5756QFHsBP771WxP213NXiHfCmzHX+MHN9ef5m9Xsw8/rqKV/y6Mgv9BVvIK/xmiKPm2tPCfuFTxfDXLir169e4ucG0UvfJNL/3ZCvw7Z139mv7uuKj8NXYND3lB9M3Iy2n3mMImcvBPabFD/fhQv4kxRR2Fe6/3D/b0peOFrmM5mECysZ1Af3hjPAbR1zg0LaTH8UNsGQmKEz0XqNMQ9CEynumbaxQZEVpj3WyBGxOQTdVGD46FDMd3EsO2bEslyx4sNsE4xUGGi+z0/3dV8mNDselZbmB9rRQfxJbjumYSRCp5cmDyEk4ihLZHtYXGJun4CYqiTZhUVeN9lTQH8NhEbwMzstOSSRS4KhmygPhGNvI22xrYJFSPHQaRWssj5TOIIM91bvOyNrrdrJUx6gHqmftchMLE8ZDS6YSKUpJ6p+cLMX1ZNjdJsEZ+z7qc262N7syNm2QWollgbSjgdSYOQ7VX1wvjOPDCwEd+EgMqtSTUBegbCEU5wzIT0w0gO7mhICoMmxV6SIvem77tokgNow4ELxslBtSB4NqSOH6cmL6FYjWkWEiC3JR0HwuJwc11/K8oSp9org3OpyWdwUGzomrTif8KzqIjn28WjSscI7a/Gvu7+6+179PXqEYriAoh3u7dBZHXKNEpc5KtyUSJTpmlg2ED/8y8jVsFO0XPfzrff90p1JUYbKIOalmyaamJGSWb0PDWHm6seE8sT/4r1km96aVW9LzpeqN1ekZfz9npHXB9kO63OEHeRGxb2F2yLetids6pb7kbm6N3Mqzd8PZg/8E3JWYPufYW9PQO+mD3YPXkW9CtcyWQB3lmLTNMywunUWoFzctUau0AIdpeS3p53m4i05uIaYXNzzWxpuOaY3NytbzNREwLZE6e6WHSRERLaF6mWKp/F0xFtkbn5euZuFZsRU6YBDLvASC0OyR42YeuOxXnApqTKZpspCGhkYY2Md47TUW1AudkexdH1lRjrcLm5LoO8RvDRFwrbG6uzlRqLaEFmBphMJnJEvicnO/vprPaCpub69N0VJ9EmDr7U42uApmXpznZXqaE5mVqmdb99l+52uCcbL+ib7Fl+hPRbaBz8nXxrmcisiW0ANOnW3Oq3WETXpBx+r3A8Sd7yaXR4G0Byj7YTEW8RuflO+Ga5gquae50a5ortqZ5puPeBk8TkW2g8/INzfvb6Y5qmvC8jOOpFuMCmZfnw1RHigUyJ8/Q8qfaipfQvEyjqZaFApmfpxE7a990J+TbZMDJO7YiM7HuQ9OeiDZJgJc1mnbOJfB5OU92thQLnS3FeIt8J3P7AYRqBc7PdrqD/Bqck+2Uu0XRveJmys3iRnS3OOWBqOh56INtTmWxJTQn00db6h4UBNMSWuxSwLa5tsG5bwVQH1Me0h617+R7XuD33zBxfItys4S8smQmgeeA22XOTscEdAKjrajudTwbGZZrxrFz51hm4gTgZ0YkNQbgAE9n60SZiEMaRf4G/I2PVGGJMMQEM0fwk3XL0iqMYUtL66k2rhJjmE0Efpbb5hJRD2w7VxgTM9mAv8yQXGoMfWgi7F7XizjmtNwKgK+KFW3ABHQCg6dv0/8k6MlTy6mNNNjX6bG468pcnxVg1UQR7+8kCFzr3nTaSx3XYsd0Dst9tBRZeUW5tPcOKGW/QOW5XYJ8zNaWZYQRcvKt0LYYdlE7xg22tcL0h2/vEr5VQ7ZJm7SGnMMkvTV6tVu0TCeQqtmDCj9oEA6lonFvgl/96ePex2HYoul1jXh/YvU3WAg2YjriUiYzsbVIGsrkNsI2D9bbp8yKSZkWttJX5b6VCi86HiZjzEXWmY4tBVp2Ye3YV+GYCrpGFjIz0qqGHsm7HHtt5GETLGqEKHLCexThWWYKwiS8ypmC0JAiG241tRhybWSZvpmCMAkv1zdZo7seZP3dY6C76GD/aQ3vUMVod86y3VckDbn25/IEFFArPVtBt62Jgi/VCrqEoCfjdAEFnYnreCLq9kINqNbk1kbnHvhVtITJWNfgW5iTKz0pnuayxpJzHAEt3D8T8WX4ZUiPvk6IE5Ax6HRDp6jSVweoepeiUhju527QF0VHpEMt6GcCOzbJ8B0tF3KqpiwvdmLDxy0wHpwo2ajbqHT1k44LMz2To3IQ8oQe6PvttonFAGy0kwHBYJZbapAxVWOFBCsHCpOCygWMDqrIXlrtJo/vuxTADCa/TwBjKMXdBJXHxzlE4/tOE3B46i8qhFGA98GxYVqJQlOmcu1CqzThpoIUGW7RyvL7Kgko2yPb5NqFhhtcVYQtoAFWyVNmsxVCZbcEJkeH1lHFslPi/MbiBHRb8MLM86AJUxGv0IV5T2YfJDrH0TNZVdmgb1OmASudhOsRpL6J5dxGYAr1xdZItkHVfVY/Pl+eLvs/qh8HUTdAEnccJcqLUxp3z5GLoderzqwtekq3uhPaBRzo8LxCEbt5awQbeAP8kj+yiKfoCXzXQiFHgnFpbm2Bn2YxtVZgDfHK7l95Bwfb4NXEGuDlhRsDv8g/vN0CLwJL3WSSRXTtn0wGbwribaeS7UXGLVvmmgi9l/FwwTTokkoihfxBGuk9UaU8CoAhIkixPhCfPrKQJyp5lABDRFKXVJU8CvlDNFL/SJU0CvlDNPLXRqVMaoghMko2+wQXxoae79MD7zQIvDjkDUh3mU2Ewfnn3gF3piaYlAA887FSHoxPTF0a2abSBN+Ftdk0YAbdX1Trh8QY0pEazxJCP5yOJZmlg3tPtEYS1dG7u46r8G8hbYbPvQWXjEzvbuOrnWEaGEN0FL1zEXR63rOoWy61HcXh+1OUM9bIRxG8R2CHUBOIZy+okg/rcz9tL6iSByu+Hm0vqJIHI/wJhcY21iYShmeDqpINI0AIZYOqIJ4CwYQdNYGxW1ZMpoDgI7OVeaYLxbeVV8mJcdIqdQpS3xwceRQSuwq/E9Usy88VfR+FQN5pSAzg7my0pzjoJ7GG3C7r0opmzz6CzJlUygDtyHnofFdtlXGRbUcPMN9esSxo68yboOcsSwMtcDg++6VS0dZ4kXAqv5elEMBmSbaosMwCR0jT2+BFwoEdZHcfkJ1zb0b2o9n6CtYqk2XbGj/h50m7AO8Jldz1THJpsiTM0NxIZtoDPHztI9eGU7MgEVhANtxqVWG7HSQ+rQNeUOrjRb+WJDF4OnmdGo0yQ5lTRGaKqZA4MiSQbtPsV4BYlTwqWoRM20OaB5fEqyGxQsyzaG2iLMpMCX2Sp/fDwK55i1ziSdazx9nOwrl1XIyaaiay93/YfW0e7mrp/x7tprmJQzNK2gU9a6OZkadlni+al7q+EGmIcLUqIEC7Lt7OaLGDGcVaHGtpMc2xUSauqqOt/Y1m2cnh3r62r+1p+7v7+3v7u2+wXGysfRLtr1qcmBb+r4P/flgmB9OM+evdN9+//Y+9N983E4WVeTKw1n58pzf/VVosodns6Tu9yL6c/Wu2M1uenl+enR6fXv9qLK9vTk4vjPOLk5uzLN/zb3+mJuAFDwh31+Gd6cZoByt647iJ4y+esk+wMf7lt9/rx3kmq+qpF9gbF2V5pct80Ifn59nDV0+e68eHxdP3qxVej5IkPNT1x8fHUidYPdh89Mu8kIbSs5y05KsCLquWRJv8oWNn/95YWo6rxSjZhNpxdnRYyLgM4uQjrmxrtVlqa8vKBIS2R0j8cYXVlOkyiwWRnrHF2KiSBEU5tPbv6X/1olyl3bKNP65mtWqwFlK5f+38i6j1X0WhZcrxvsStO1WhngS9RCGOzM095Vvpk8mSZLpb4reevNvMcmQaX6LYQLJkomwnaTrtV2bacqJwvR1uZ+cmi9Gy2T6b4bGxjnNSL3ZYsFPc7tQ/ttJxNn5hpuoly1Cz1ZJFOglb+37u1G5YE5FZlaPU87Kna+Slr5HoBVtUvrXdaWxkd4ht5g4zRSrv24ekhPI9gb9670udpJjGCGFVF7sVOkpQcQ9xlIzGl0lZOc27h5IyiHuCkjLIS6M8QsRSioJI7CRUhZNaZRSFFIliYIlVjk5YmQn3SBDLegkosfR6hxRZJ5GElNrJ8QgpvEjGCCgSgXdVnd0QUGiVhRBQZpUtEFSmA0+zkXoPUG6VIg9U5hO0yCLrHKREE3wuqbO4AQpt5FoDlFomRQMWWWYuUyC2mVYMUnyd/AtSqoJR5cKPqkb2FUipjcRUkGJj6PFaJHsClFhmZYIUGUGbfCvDEaBkMgkRpGCkxlRj8H1PfYcMVij89lzFvLdRMfGp2EmWCVwARZaZVkBEthOijBKan0/pcYL1uAkLoZxHMINCm0Q5ZbJSTEjUrRKhiNdl5P+QEVRe25epG3FvGOlZQsRr1tkihOsys6YISOrkexCv287LIC6hmUNBoDZHGP0x0uq0AeOlNMIq8Qjru0smXZ+88yUuhrw8KF2fvOTHI4bhqiRcVehYjeaVJFyv9MYTr8i/FepxdBOvLjR5Ur1wpCo277ALCxA4LqO6owhXFHj36fH0EK4u8O7Bch0Triu2gWa4TEhWHWUUQvtplmubWF3Sq5O/bjuUgnDNIvaBeL0iVoFwRSQJyPGxkl6x8N4Xrle42wvXq53jhatWvuw8NYd8LcbKEJxuhlxZeGSIJY+AlcjzUZ1LLCVvhLxIViIZWImNfCnAgkXuCMjnABornZH2BlpsM/eSiGzOCOKAIgW2ReKR6AGl1pHiJYSKJGAYIV4sq8EIILIfq4wfYBLJlBwjxDLSxoBJJPO6iIgVjfQ9XjYr4vY4yTzx2yEQGDHuRUQLBpYeIXooVreI6KGIlqNktQNPSgqjBsiFkkUGgQWVKrdn5I/8OkoqLTirkMC+cNSjBXVjRUuIpAcvHy2oG1n82dxWrm51L7N/vtAby89GncUVeqxMXGMdv1R91jfuNSuqnFOs6DlZ7sYq60+l5N+pfnmXJ+epU967D1gTq9Wr4lzs/Wq2p+2uZvgJ8q3AxtaBH91cf5q/Xc0+YNgUFwMXuLhY4WAp5ySX4mBReDuYfFta+M80Lkghelah4UL4/96FWEraNHuZoPBH3Hbi3xW12iWxePJKVRtHtU5Xz4/lMiSk9dxNuQbJB1mnXFnawQNu1fDO7rhx4V+zk18zQXjA5JafPswcf9In2SzQ1A8XANMTDBqvxyUOGqr+ltb2W4NG4vAuVAvZclCEBhtwPISGY3l0qrRF0u0SvLdIJ1FQ8T1+suAjiubiKQtSh3AgHxcXFC7N5B7/Mw90EGdxDA7LtUkvZ1F9inWL7fo3amUo9mLcSwPdmxMXqbZXdV90O4iry7uupqDiWe6m0CAdj1S1ANC90OM0uxUcaIW1fJRlZY+ZP6qxNskE0v82PmoSYZxgMCeVVvXyoINRnlErv3jZW4dRs3FXk6M6Q0h2yZO7OotJ9losKIU+jNp3VztWGDcjkAlfhaWPMTGKrZuwIxm2pIkRZAxjwe47rTMDjVVOx2lXUjtMJ2CADiRclUfyI2QBcCPdkyGUVwmDY1ctawDkUAzKrfKZBmFXSYPkl9+/geJXRU6F4VdcMQNhVychgOFW3mQAIddIrA7ErnYwhyFYy4Pj2HFXh6HaEQvHuPCBh+FZCANjhwBHCwIeLbVjPgy9ShwYw8rLH4RgJQ2MXxUxAIRfJQ2QnwOnvkYGBTh2VSADMIqVRDCeVWAEEI6VNEB+T5D0nmDZFfEaQMgVsuC4mYD7hVIYHLsqiAQMv0ocGMNGRAoQig15YBzL+BYgBEthoOzKUBlgDEuB4CybkTdA2TYFw7GuA3rAkEXNBCNAHEHXFhd8bXEh1xYXem1phIIAIdiQB8exEQMFhmRDIBzLGG4hrFNcAXF7gDvqKmSBcSvDvICQK4XBsYvgpuo6ORcYt2bsGSiOTZlgXMloNiBUSZFwTBH0nEhIhOMJeC4SA5+L1H7HMPSaueTAGEIeEhP5tWAYwu684PddG9iN1wZ+5wV7OAd/NlfGTQKhVwoDY1eGYAJhVwqD/jQ8nl9bnNJvw9zFOQryFOne7U0vbcvcg3DyHFKc9x/at3bq0FL9vcUKSMXbKbTrW9QQSyI0GCKkOTHjPgmQYsqQ11QZA0tENWUdedQ6HpCQZTQTnktbRhksR8wYGmnFpZEjjjNJemwzedQ6UpkIbl1rGJl/dutcCotGzS5V9DOulnVipo3ryaZDrwh+u+6Inm3EXxNh0KynsneroGryN+hElh+Wmjqh3Lh0NRwRTnDHwOA1lhAEk24APjlGXTncxj3xBqlwn5XZIRH+LvKWLjIVsvqRHgCmvy8lIsqMNLe+2CzyXPukjh0fvRFwQNXbkAtKGpKoAhMA730lHa+gz8W7W/TNU8WKSo/eJaOU3nBgsCMAkCEAOUqoMnl2FGFTLLwMiyMDBk27QrYDH/HpnC+I0lhzpYZQAiBICnxJ80w7npaUMhixueB7C4YgKXBbvZUHYgPtMDK4mpRmeMLDbUtDRSw5KBX1BaKT0pVYrLvntzyki/6zWBvaMROFeoMjBiPQxNMKwgjCshb3AlcJIiCnuDp6onsC9xgYP0Gvhi2M5U44jklHNCNEIp/uBeMujrWR3niR4xj3y37OI70dh2LA/ZtT2/R4orI67o9SuhWP40FbGts+lsxnNPOQ0aKm3Ugww5zy9YFg7NTnPID5NMNtnYIBa5+Reea3TaY1y1ZUUT6V9wYmHbvoMcOTjuDWFfaSBkgrKq2QHuiBbdX00ThuXWHPaahWocQmHq5E8GhObQ+EoB5tDKxw0ePptQQCM63CZQMRreQB8wTsb1Le6M8V3djbkhRpol7UFE0EiBdWAjVmPWDvjCDVFvNSLm8cny9PlzJXN47TuM/Sk7xcZCfqy2gad81xeTova6ueEq9uMndFjDKnXFwjnZokoYaEUXySP7KAq+iJY0dEIUNWB9DM2uI4YWRqpag9jkd2g9A7OJDj0aw9iocXbgwz8h7eSvEgar+UqSYLaSsz1Yy46dpMMtivZXpiQskLpnWGQgHQosYIyCK5oQhmUUUeFAm3E41tZ5lTUQCzrCIPWuRjFMAsashDFqkcBSCLGvKQdRZIAdS6kjww5+adnndS5UXsEU48zfzLPM1yWjmbR8wERRJmAdSyyrgZTxBT8CMcDbKR71MMuVFxhFuSeLvJWvJt5/UCYqQSlwe+5fGIoeUSH7Oy8fkdMTJ7ywM3EkkLIDdqyUNzv0WwUjmP3EiIKnuUrxUlKbogeLPquN2MGLboRQL6bkYMUzQmHn03I4YpGF6FCik3V5MVx22nxJAFg49Qt1NcMR0YCehH7+OEgYtKY4Elx3G38tgNpRi+wOmdonfk+t7hll+U43bi8361DaVNf6Y78ridbZ67lQ4tV728+yk1X708GaH5UZHp2pHzwPXdr1PTRbYdPUz7xRBzGLb6vIl6zrc0/KLm6I9ZVZIWSR6kgJf0VSilPGj+ZJuLEVDUBNS9HA9SwLM7kO3/sd2l92ZkP5oDX3c6tbLEVdtftPJ8Wb33csr26FnZcriQFeVncjKtXe/RZB+RtoDnu4ASfJnjpdXWYpx06o7Ve+9lnz4O/Fd8FA0+1mOyoWZYnuO1E+9VLU4rHOrHh/pNjN/9dRTuvd4/2NOXVc6oZaYS/eGN8RhEX+PQTL9fV9mp9AKirYgWkdsUXzWVCmSATIRM20OaZ6ul04DpEKLlIxuLxwkjFbNrjOw6uo2ElO4gHEOF6ckLLzRbl+SFdr/aQlDsuj8CSi19ZcaIrN6nxwghX3UgWki9m69MsJ55W8gL7+wxIZh2L4ADzAlEGBsIlvWdVxBpxDUtikTPtKLgJI0C76TXaesl5mTx8eYnY/HpXKRSNuPuXn482P/y+Uik4s9HVye/HF0tjI8X+G/GyeLT0c3ZtXH1yfh49PnEwEJ3R4hb3lxeXlxdL429UiKEMFlyy7NC0uej80W2Wj+Y7ib95d/+dxMk//nx6mT/h93XR/m/pCRfLb5QBB/t7krJPL44v7z4vPh8bRwfXR+dXfxkXF4tlvjfwnJOFg1hl4ur08ufF1dHZ8by1+XV9TFBuT7bEUHJFh3j85fTY+PL6dX1zdHZuNrGz4ujk8WV8en0jNZVNL8tSRUTqjm+uCLhrOyy4RiRy7PF4vL69HxxRQhuXljviMcrWWRG3z4Re88smStfUe6CtMWCWtAPsE1QCqfT8EVY6CD9x2mWYbd6qm0srRFRDhcKsud9xTQr3LQ7IUFPc+/gYFsM7loM7sKHN/M43Bq8G5iJYd46rZEZ0V4IeBiU90z7CVS3UetwcKxMv2nFMydOKuDarjkCyr3Ta2CZ5qSXCbzbwfZUxZ59g/Ic1v2tycsUfyyz1IKEeXzXykattxJjb8Nw0ssH6UMjRtmfMcGQkXhbAQ/bTExwDgKd5Jt+YFgGnkqn0kDgOYlxF+HZ2wiD7F1hIiJYEejJQuGU5oA5REniTGAIZd75czPMFtRp2m+lkYF9O1s/muvq3tst4T89MRj84x97P2yHw6MZ+Y6/jjXTdSfqhooCekoic2oSIbJNP3EscqOTn2Rut0MiZKAoCqJ4KippCc/5I4vLTu7SnT/4KXjmV5SttmbkaanLSGJGa5S0OTCKdXa9cw8/eS+x9x3JI7nfeLctJsWz7RBob77nHn7yvtiCz+2977dGhLoNx3TS53P8/L3QlrwDU8+Pg4zqoqzJfB4n9nuRGb0HIwwFCIUhe37PSQlN8sC0aEv//M4P5vnTyUgx9kQZteZv27Wtck422ovk/JfsyfbVpZ6RlH66K/j8l+LZhDpSykpET8wFdX4BYtOiGlLNR0Q37HfT+V3627z+bfuK2io5Ea31nyzM78rfJ9XeJCSFxmX/qcD8Li0wzwrMqwITDNdpaIpo8vmdKALq/wU0jnkEzC75EppFP1piFGOfBY87Ah7JKjv87Bx9zvHLG7Li9+mvWvbXbfEpz+CM/N+GZ4Yks/8u5K1ezc/N8P13f7u4ub68uTZOTq/+rn/3t8uri38ujq/Tr8Z/17LKnLzzGwKag62lOJtvUy7uvwQhuSvJ8hvuhrcH+w8+wN6toygnZt3DZI+AuWd5tPOYwXoc/T4oYw0x2LA6tNhxzds465LYOdjP1WQnWn45xb7dOK6dfYjT1v5Ga0yLt2Zxw6+hx4bAVum8kJYqWguSexS5uFkvS+XMq8A9de48FMdYj3MX+evk/j3tesY2ui19zRbpuGb5/+86uK5zzEhDj2E2IbEmo9NF+oJ6UZ53COuLrmc5rinP9EFxDaE0iYc32mttr028p0JhQ6ZtZ9dDTDe9lzt9E3nXUanl4Rd3Zz5fWz2vNnwi/GCenmfMo8cnLGvtIT+h7RTkG38fxImC5ZFne6Ny2ytF+gn/oxI5f3SS+3n2sjDNYlvs1wZmbFFxlhNZG9eMbBQi30a+9U3+y9vzaZWPrdjubLLFvpnJraz0SWOMrBfSRXXZcoJ37TvXXEtM6UpnulFdwbldamphIh2804uXqurJq3cfnjw3xchjkWCUPW03aw22qcB2/DV+dHP9af52NftQCypfzqrbjhtL8wJ7g+fdGCWbULPRnblxkyVKkuyLde06o2W3MnFNLCNEUfJtaeE/sYjqhU9XT29jXeZFhIi1ddxJ3JCfIbA6lnSM0qwo9QX375x1+tcMOTUyrK9qAONH5au4zR7Vbe+0bjfPdmbL0/PLs9Pj0+tfjeX1zcnphYFf0i8XV9eni+XscPYnfveuNLGaHa7wkxV+Zj4ge5kE1tcvZuSYeM2L08eH6X/SAun/YGMPHVzK/noW5Inayx8Oy7/ElVuVEdtfjf3d/dfa97gji593yr+EZoTNvluffLsvHv6V/wfXnp3k1vayeP+FeyWnkN5zinEn/Pb77K//Aw0YRf4==END_SIMPLICITY_STUDIO_METADATA
