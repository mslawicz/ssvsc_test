/***************************************************************************//**
 * @file
 * @brief Top level application functions
 *******************************************************************************
 * # License
 * <b>Copyright 2020 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/
#include "blink.h"

#include "em_gpio.h"
#include "pin_config.h"
#include "sl_simple_led_instances.h"
#include "sl_pwm_instances.h"
#include "em_ldma.h"
#include "sl_uartdrv_instances.h"

/**
 * @brief
 *   DMA descriptor initializer for word transfers from memory to a peripheral.
 * @param[in] src       Source data address.
 * @param[in] dest      Peripheral data register destination address.
 * @param[in] count     Number of words to transfer.
 */
#define LDMA_DESCRIPTOR_SINGLE_M2P_WORD(src, dest, count) \
  {                                                       \
    .xfer =                                               \
    {                                                     \
      .structType   = ldmaCtrlStructTypeXfer,             \
      .structReq    = 0,                                  \
      .xferCnt      = (count) - 1,                        \
      .byteSwap     = 0,                                  \
      .blockSize    = ldmaCtrlBlockSizeUnit1,             \
      .doneIfs      = 1,                                  \
      .reqMode      = ldmaCtrlReqModeBlock,               \
      .decLoopCnt   = 0,                                  \
      .ignoreSrec   = 0,                                  \
      .srcInc       = ldmaCtrlSrcIncOne,                  \
      .size         = ldmaCtrlSizeWord,                   \
      .dstInc       = ldmaCtrlDstIncNone,                 \
      .srcAddrMode  = ldmaCtrlSrcAddrModeAbs,             \
      .dstAddrMode  = ldmaCtrlDstAddrModeAbs,             \
      .srcAddr      = (uint32_t)(src),                    \
      .dstAddr      = (uint32_t)(dest),                   \
      .linkMode     = 0,                                  \
      .link         = 0,                                  \
      .linkAddr     = 0                                   \
    }                                                     \
  }

#define PWM_SIZE  4
uint32_t pwmBuffer[PWM_SIZE] = { 99, 2225, 10, 7775};
//static const LDMA_TransferCfg_t ldmaTimer0Cfg = (LDMA_TransferCfg_t)LDMA_TRANSFER_CFG_PERIPHERAL(ldmaPeripheralSignal_TIMER0_UFOF);
//static const LDMA_Descriptor_t ldmaTimer0Desc = (LDMA_Descriptor_t)LDMA_DESCRIPTOR_SINGLE_M2P_WORD(pwmBuffer, &TIMER0->CC[0].OCB, PWM_SIZE);

/***************************************************************************//**
 * Initialize application.
 ******************************************************************************/
void app_init(void)
{
  blink_init();

  GPIO_PinModeSet(test_out_1_PORT, test_out_1_PIN, gpioModePushPull, 0);
  sl_pwm_set_duty_cycle(&sl_pwm_pulse_1, 10);
  sl_pwm_start(&sl_pwm_pulse_1);

  //LDMA_Init_t ldmaInit = LDMA_INIT_DEFAULT;
  //LDMA_Init(&ldmaInit);
}

/***************************************************************************//**
 * App ticking function.
 ******************************************************************************/
void app_process_action(void)
{
  static uint8_t duty = 10;
  sl_led_state_t led_state_prev = sl_led_get_state(&sl_led_led0);
  blink_process_action();
  if(sl_led_get_state(&sl_led_led0) != led_state_prev)
  {
    // led state changed
    GPIO_PinOutToggle(test_out_1_PORT, test_out_1_PIN);
    //sl_pwm_set_duty_cycle(&sl_pwm_pulse_1, duty);
    duty += 10;
    if(duty > 90)
    {
      duty = 10;
    }
    //LDMA_StartTransfer(0, &ldmaTimer0Cfg, &ldmaTimer0Desc);
    UARTDRV_TransmitB(sl_uartdrv_usart_usart_test_handle, &duty, 1);
    //UARTDRV_ForceTransmit(sl_uartdrv_usart_usart_test_handle, &duty, 1);
  }

}
