/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    This code turns ON the USER LED (LD4) of the Nucleo board
   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

/* ++++++++++++++++++++ DATA MEMORY +++++++++++++++++++++++++++ */	
	.section	.data
A: 	.word	0

/* ++++++++++++++++++ PROGRAM MEMORY ++++++++++++++++++++++++++ */	
	.section	.text
	.syntax	unified// to accept older versions
	.global	main
	
main:
    BL    USER_GPIO_Init
    // Set PA5 high to turn on LED 
    MOVS  R1, #0x1
    LSLS  R1, #5 // Set PA5 high to turn on LED 
    STR   R1, [R0, #0x18] // GPIOA_BSRR offset

foreverLoop:
    B     foreverLoop//	repeat

USER_GPIO_Init:
    // Enable GPIOA clock
    LDR   R0, =0x40021000  // RCC base address
    LDR   R1, [R0, #0x34]  // RCC_IOPENR offset
    MOVS  R2, #0x01
    ORRS  R1, R1, R2  // Enable GPIOA clock
    STR   R1, [R0, #0x34]
    // Configure PA5 as output
    LDR   R0, =0x50000000 // GPIOA base address 
    MOVS  R1, #0x1
    LSLS  R1, #21  // Reset PA5 low to turn off LED
    STR   R1, [R0, #0x18] // GPIOA_BSRR offset
    LDR   R1, [R0, #0x0C] // GPIOA_PUPDR offset
    MOVS  R3, #0x03
    LSLS  R3, #10
    MVNS  R2, R3
    ANDS  R1, R1, R2 // Clear pull-up/pull-down bits for PA5
    STR   R1, [R0, #0x0C]
    LDR   R1, [R0, #0x04] // GPIOA_OTYPER offset
    MOVS  R3, #0x01
    LSLS  R3, #5
    MVNS  R2, R3
    ANDS  R1, R1, R2 // Clear output type bit for PA5
    STR   R1, [R0, #0x04]
    LDR   R1, [R0, #0x00]  // GPIOA_MODER offset
    MOVS  R3, #0x03
    LSLS  R3, #10
    MVNS  R2, R3
    ANDS  R1, R1, R2  // Clear mode bits for PA5
    MOVS  R2, #0x01
    LSLS  R2, #10
    ORRS  R1, R1, R2  // Set PA5 as output
    STR   R1, [R0, #0x00]
    BX    LR
