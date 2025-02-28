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
#include "em_timer.h"
#include "em_cmu.h"

#define RAND_BIT  ((rand() % 2) == 0 ? 33 : 66)

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


#define PWM_SIZE  5
uint32_t pwmBuffer[PWM_SIZE];
static LDMA_TransferCfg_t ldmaTimer0Cfg;
static LDMA_Descriptor_t ldmaTimer0Desc;
uint8_t UART_buf[4];

void UART_cbk(UARTDRV_Handle_t handle,
              Ecode_t transferStatus,
              uint8_t *data,
              UARTDRV_Count_t transferCount)
{
  (void)handle;
  (void)transferStatus;
  (void)data;
  (void)transferCount;
}

bool timer_0_cbk(unsigned int channel, unsigned int sequenceNo, void *userParam)
{
  (void)channel;
  (void)sequenceNo;
  (void)userParam;
  GPIO_PinOutClear(test_out_2_PORT, test_out_2_PIN);
  return false; //stop DMA transfers
}

//calculate timer register CC value from PWM duty value
uint32_t dutyToCC(sl_pwm_instance_t* pwmInstance, uint8_t pct)
{
  // read timer top value
  uint32_t top = TIMER_TopGet(pwmInstance->timer);
  return top * pct / 100;
}

/***************************************************************************//**
 * Initialize application.
 ******************************************************************************/
void app_init(void)
{
  blink_init();

  GPIO_PinModeSet(test_out_1_PORT, test_out_1_PIN, gpioModePushPull, 0);
  GPIO_PinModeSet(test_out_2_PORT, test_out_2_PIN, gpioModePushPull, 0);

  // Configure LDMA
  LDMA_Init_t ldmaInit = LDMA_INIT_DEFAULT;
  LDMA_Init(&ldmaInit);
  //Configure DMA transfer
  ldmaTimer0Cfg = (LDMA_TransferCfg_t)LDMA_TRANSFER_CFG_PERIPHERAL(ldmaPeripheralSignal_TIMER0_CC0);  //use CC0 here, not UFOF !
  ldmaTimer0Desc = (LDMA_Descriptor_t)LDMA_DESCRIPTOR_SINGLE_M2P_WORD(pwmBuffer, &TIMER0->CC[0].OC, PWM_SIZE);  

  // start PWM with 0 duty (no wave)
  sl_pwm_set_duty_cycle(&sl_pwm_pulse_1, 0);
  sl_pwm_start(&sl_pwm_pulse_1);
}

/***************************************************************************//**
 * App ticking function.
 ******************************************************************************/
void app_process_action(void)
{
  sl_led_state_t led_state_prev = sl_led_get_state(&sl_led_led0);
  blink_process_action();
  if(sl_led_get_state(&sl_led_led0) != led_state_prev)
  {
    // led state changed
    GPIO_PinOutSet(test_out_1_PORT, test_out_1_PIN);
    GPIO_PinOutSet(test_out_2_PORT, test_out_2_PIN);

    UART_buf[0] = RAND_BIT;
    pwmBuffer[0] = dutyToCC(&sl_pwm_pulse_1, UART_buf[0]);
    UART_buf[1] = RAND_BIT;
    pwmBuffer[1] = dutyToCC(&sl_pwm_pulse_1, UART_buf[1]);
    UART_buf[2] = RAND_BIT;
    pwmBuffer[2] = dutyToCC(&sl_pwm_pulse_1, UART_buf[2]);
    UART_buf[3] = RAND_BIT;
    pwmBuffer[3] = dutyToCC(&sl_pwm_pulse_1, UART_buf[3]);        
    pwmBuffer[4] = 0;
    //LDMA_StartTransfer(1, &ldmaTimer0Cfg, &ldmaTimer0Desc);   //version without callback
    DMADRV_LdmaStartTransfer(1, &ldmaTimer0Cfg, &ldmaTimer0Desc, timer_0_cbk, NULL);  //version with callback (not really used here)
    UARTDRV_Transmit(sl_uartdrv_usart_usart_test_handle, UART_buf, 4, UART_cbk);
    GPIO_PinOutClear(test_out_1_PORT, test_out_1_PIN);
  }

}
