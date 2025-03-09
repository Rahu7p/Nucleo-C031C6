/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    This code turns ON the USER LED (LD4) of the Nucleo board
   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

/* **************** START *********************** */
/* Libraries, Definitions and Global Declarations */
#include <stdint.h>
#include "main.h"

void USER_GPIO_Init( void );
void USER_Delay( void );

/* Superloop structure */
int main(void)
{
	/* Declarations and Initializations */
	USER_GPIO_Init( );
    	/* Repetitive block */
    	for(;;){
    		GPIOA->BSRR =	0x1UL <<  5U; // Set PA5 high to turn on LED
    	}
}

void USER_GPIO_Init( void ){
  	// Enable GPIOA clock
	RCC->IOPENR	  = RCC->IOPENR   |  ( 0x1UL <<  0U );
  	// Configure PA5 as output
  	GPIOA->BSRR   =	0x1UL << 21U; // Reset PA5 low to turn off LED
  	GPIOA->PUPDR  = GPIOA->PUPDR  & ~( 0x3UL << 10U ); // Clear pull-up/pull-down bits for PA5
  	GPIOA->OTYPER = GPIOA->OTYPER & ~( 0x1UL <<  5U ); // Clear output type bit for PA5
  	GPIOA->MODER  = GPIOA->MODER  & ~( 0x2UL << 10U ); // Set PA5 as output
  	GPIOA->MODER  = GPIOA->MODER  |  ( 0x1UL << 10U ); // Set PA5 as output
}
