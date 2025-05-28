/* **************** START *********************** */
/* Libraries, Definitions and Global Declarations */
#include <stdint.h>
#include <stdio.h>
#include "main.h"
#include "user_uart.h"
#include "FreeRTOSConfig.h"
#include "FreeRTOS.h"
#include "task.h"

TaskHandle_t Task1Handle;

void USER_RCC_Init( void );
void StartTask1( void *pvParameters );

/* Superloop structure */
int main(void)
{
	/* Declarations and Initializations */
	HAL_Init( );
	USER_RCC_Init( );
	USER_UART2_Init( );

	/* Create a task with a priority of 0 (idle), 1 (belowNormal), 2 (Normal), 3 (High), 4 (VeryHigh) */
	xTaskCreate(StartTask1, "Task1", 128, NULL, 2, &Task1Handle);

	/* Start the scheduler */
	printf("Heap Available: %u bytes\r\n", xPortGetFreeHeapSize());
	printf("Initializing Scheduler...\r\n");
	vTaskStartScheduler();

	/* Repetitive block */
	for(;;){

	}
}

// Task1 function
void StartTask1(void *pvParameters) {

  /* Infinite loop */
  for(;;) {
	  printf("Task 1\r\n");
	  vTaskDelay(1000);
  }
}

void USER_RCC_Init( void ){
	/* System Clock (SYSCLK) configuration for 48 MHz */
	FLASH->ACR	&= ~( 0x6UL <<  0U );// 2 HCLK cycles latency, if SYSCLK >=24MHz <=48MHz
	FLASH->ACR	|=  ( 0x1UL <<  0U );// 2 HCLK cycles latency, if SYSCLK >=24MHz <=48MHz
	while(( FLASH->ACR & ( 0x7UL <<  0U )) != 0x001UL );// wait until LATENCY[2:0]=001
	RCC->CR		&= ~( 0x7UL << 11U );// select HSISYS division factor by 1
	while(!( RCC->CR & ( 0x1UL << 10U )));// wait until HSISYS is stable and ready
	RCC->CFGR	&= ~( 0x7UL <<  0U );// select HSISYS as the SYSCLK clock source
	RCC->CFGR	&= ~( 0x1UL << 11U );// select HCLK division factor by 1
	SystemCoreClock = 48000000;
}
