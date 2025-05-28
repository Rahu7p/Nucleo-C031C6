#include <stdint.h>
#include "main.h"
#include "user_uart.h"

// The following makes printf() write to USART2:
int _write(int file, uint8_t *ptr, int len)
{
  int DataIdx;
  for( DataIdx = 0; DataIdx < len; DataIdx++ ){
    while(!( USART2->ISR & ( 0x1UL << 7U )));
    USART2->TDR = *ptr++;
  }
  return len;
}

void USER_UART2_Init( void ){
  RCC->IOPENR	|=  ( 0x1UL <<  0U ); // GPIOA clock enabled
  RCC->APBENR1  |=  ( 0x1UL << 17U ); // USART2 clock enabled

  // Configure the TX pin (PA2)
  GPIOA->AFR[0] &= ~( 0xEUL <<  8U );
  GPIOA->AFR[0] |=  ( 0x1UL <<  8U ); // Select the AF1 for the PA2
  GPIOA->PUPDR  &= ~( 0x3UL <<  4U ); // Clear pull-up/pull-down bits for PA2
  GPIOA->OTYPER &= ~( 0x1UL <<  2U ); // Clear output type bit for PA2
  GPIOA->MODER  &= ~( 0x1UL <<  4U );
  GPIOA->MODER  |=  ( 0x2UL <<  4U ); // Set PA2 as AF

  // Configure the RX pin (PA3)
  GPIOA->AFR[0] &= ~( 0xEUL << 12U );
  GPIOA->AFR[0] |=  ( 0x1UL << 12U ); // Select the AF1 for the PA3
  GPIOA->PUPDR  &= ~( 0x3UL <<  6U ); // Clear pull-up/pull-down bits for PA3
  GPIOA->OTYPER &= ~( 0x1UL <<  3U ); // Clear output type bit for PA3
  GPIOA->MODER  &= ~( 0x1UL <<  6U );
  GPIOA->MODER  |=  ( 0x2UL <<  6U ); // Set PA3 as AF

  // Configure the UART module
  USART2->CR1   &= ~( 0x1UL << 28U ); 		// 8-bit word length
  USART2->CR1   &= ~( 0x1UL << 12U ); 		// 8-bit word length
  USART2->BRR   =   ( 48000000 / 115200 ); 	// Desired baud rate
  USART2->CR2   &= ~( 0x3UL << 12U ); 		// 1 stop bit
  USART2->CR1   |=  ( 0x1UL <<  0U ); 		// USART is enabled
  USART2->CR1   |=  ( 0x1UL <<  3U ); 		// Transmitter is enabled
  USART2->CR1   |=  ( 0x1UL <<  2U ); 		// Receiver is enabled
}

static void USER_UART2_Send_8bit( uint8_t Data ){
	while(!( USART2->ISR & ( 0x1UL <<  7U)));//	wait until next data can be written
	USART2->TDR = Data;// Data to send
}

void USER_UART2_Transmit( uint8_t *pData, uint16_t size ){
	for( int i = 0; i < size; i++ ){
		USER_UART2_Send_8bit( *pData++ );
	}
}
