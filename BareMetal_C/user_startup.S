/**
 * @brief  This is the code that gets called when the processor receives an
 *         unexpected interrupt.  This simply enters an infinite loop, preserving
 *         the system state for examination by a debugger.
 *
 * @param  None
 * @retval : None
*/
  .section .text.Default_Handler,"ax",%progbits
Default_Handler:
Infinite_Loop:
  b Infinite_Loop
  .size Default_Handler, .-Default_Handler

/******************************************************************************
*
* The STM32C031C6Tx vector table.  Note that the proper constructs
* must be placed on this to ensure that it ends up at physical address
* 0x0000.0000.
*
******************************************************************************/
  .section .isr_vector,"a",%progbits
  .type g_pfnVectors, %object

g_pfnVectors:
  .word _estack
  .word Reset_Handler
  .word NMI_Handler
  .word HardFault_Handler
  .word	0
  .word	0
  .word	0
  .word	0
  .word	0
  .word	0
  .word	0
  .word	SVC_Handler
  .word	0
  .word	0
  .word	PendSV_Handler
  .word	SysTick_Handler
  .word	WWDG_IRQHandler                  			/* Window watchdog interrupt                              */
  .word	PVM_IRQHandler                   			/* VDDIO2 monitor interrupt (EXTI line 34                 */
  .word	RTC_IRQHandler                   			/* RTC interrupts (EXTI lines 19)                         */
  .word	FLASH_IRQHandler                 			/* Flash global interrupt                                 */
  .word	RCC_IRQHandler                   			/* RCC global interrupt                                   */
  .word	USER_EXTI0_1_IRQHandler               /* EXTI line 0 and 1 interrupt                            */
  .word	EXTI2_3_IRQHandler               			/* EXTI line 2 and 3 interrupt                            */
  .word	EXTI4_15_IRQHandler              			/* EXTI line 4 and 15 interrupt                           */
  .word	0                                			/* Reserved                                               */
  .word	DMA1_Channel1_IRQHandler         			/* DMA1 channel 1 interrupt                               */
  .word	DMA1_Channel2_3_IRQHandler       			/* DMA1 channel 2 and 3 interrupts                        */
  .word	DMAMUX_DMA1_Channel4_5_IRQHandler			/* DMAMUX and DMA1 channel 4 and 5 interrupts             */
  .word	ADC_IRQHandler                   			/* ADC interrupt                                          */
  .word	TIM1_BRK_UP_TRG_COM_IRQHandler   			/* TIM1 break, update, trigger and commutation interrupts */
  .word	TIM1_CC_IRQHandler               			/* TIM1 Capture Compare interrupt                         */
  .word	0                                			/* Reserved                                               */
  .word	TIM3_IRQHandler                  			/* TIM3 gloabal interrupt                                 */
  .word	0                                			/* Reserved                                               */
  .word	0                                			/* Reserved                                               */
  .word	TIM14_IRQHandler                 			/* TIM14 gloabal interrupt                                */
  .word	0                                			/* Reserved                                               */
  .word	TIM16_IRQHandler                 			/* TIM16 global interrupt                                 */
  .word	TIM17_IRQHandler                 			/* TIM17 global interrupt                                 */
  .word	I2C_IRQHandler                   			/* global interrupt (combined with EXTI 23)               */
  .word	0                                			/* Reserved                                               */
  .word	SPI_IRQHandler                   			/* SPI/I2S global interrupt                               */
  .word	0                                			/* Reserved                                               */
  .word	USART1_IRQHandler                			/* USART1 global interrupt (combined with EXTI 25)        */
  .word	USART2_IRQHandler                			/* USART2 global interrupt (combined with EXTI 25)        */
  .size g_pfnVectors, .-g_pfnVectors

/*******************************************************************************
*
* Provide weak aliases for each Exception handler to the Default_Handler.
* As they are weak aliases, any function with the same name will override
* this definition.
*
*******************************************************************************/

	.weak	NMI_Handler
	.thumb_set NMI_Handler,Default_Handler

	.weak	HardFault_Handler
	.thumb_set HardFault_Handler,Default_Handler

	.weak	SVC_Handler
	.thumb_set SVC_Handler,Default_Handler

	.weak	PendSV_Handler
	.thumb_set PendSV_Handler,Default_Handler

	.weak	SysTick_Handler
	.thumb_set SysTick_Handler,Default_Handler

	.weak	WWDG_IRQHandler
	.thumb_set WWDG_IRQHandler,Default_Handler

	.weak	PVM_IRQHandler
	.thumb_set PVM_IRQHandler,Default_Handler

	.weak	RTC_IRQHandler
	.thumb_set RTC_IRQHandler,Default_Handler

	.weak	FLASH_IRQHandler
	.thumb_set FLASH_IRQHandler,Default_Handler

	.weak	RCC_IRQHandler
	.thumb_set RCC_IRQHandler,Default_Handler

	.weak	USER_EXTI0_1_IRQHandler
	.thumb_set USER_EXTI0_1_IRQHandler,Default_Handler

	.weak	EXTI2_3_IRQHandler
	.thumb_set EXTI2_3_IRQHandler,Default_Handler

	.weak	EXTI4_15_IRQHandler
	.thumb_set EXTI4_15_IRQHandler,Default_Handler

	.weak	DMA1_Channel1_IRQHandler
	.thumb_set DMA1_Channel1_IRQHandler,Default_Handler

	.weak	DMA1_Channel2_3_IRQHandler
	.thumb_set DMA1_Channel2_3_IRQHandler,Default_Handler

	.weak	DMAMUX_DMA1_Channel4_5_IRQHandler
	.thumb_set DMAMUX_DMA1_Channel4_5_IRQHandler,Default_Handler

	.weak	ADC_IRQHandler
	.thumb_set ADC_IRQHandler,Default_Handler

	.weak	TIM1_BRK_UP_TRG_COM_IRQHandler
	.thumb_set TIM1_BRK_UP_TRG_COM_IRQHandler,Default_Handler

	.weak	TIM1_CC_IRQHandler
	.thumb_set TIM1_CC_IRQHandler,Default_Handler

	.weak	TIM3_IRQHandler
	.thumb_set TIM3_IRQHandler,Default_Handler

	.weak	TIM14_IRQHandler
	.thumb_set TIM14_IRQHandler,Default_Handler

	.weak	TIM16_IRQHandler
	.thumb_set TIM16_IRQHandler,Default_Handler

	.weak	TIM17_IRQHandler
	.thumb_set TIM17_IRQHandler,Default_Handler

	.weak	I2C_IRQHandler
	.thumb_set I2C_IRQHandler,Default_Handler

	.weak	SPI_IRQHandler
	.thumb_set SPI_IRQHandler,Default_Handler

	.weak	USART1_IRQHandler
	.thumb_set USART1_IRQHandler,Default_Handler

	.weak	USART2_IRQHandler
	.thumb_set USART2_IRQHandler,Default_Handler

	.weak	SystemInit
