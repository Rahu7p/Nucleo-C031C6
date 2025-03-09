/* ++++++++++++++++ DATA MEMORY ++++++++++++++++ */	
	.section	.data
A: 	.word	0

/* ++++++++++++++ PROGRAM MEMORY ++++++++++++++ */	
	.section	.text
	.syntax	unified// to accept older versions
	.global	main
	
main:
    // Enable GPIOA clock (assuming LED is connected to GPIOA)
    LDR   R0, =0x40021000  // RCC base address
    LDR   R1, [R0, #0x34]  // RCC_IOPENR offset
    MOVS  R2, #0x01
    ORRS  R1, R1, R2  // Enable GPIOA clock
    STR   R1, [R0, #0x34]

    // Configure PA5 as output (assuming LED is connected to PA5)
    LDR   R0, =0x5000000  // GPIOA base address
    LDR   R1, [R0, #0x0C] // GPIOA_PUPDR offset
    MOVS  R2, #0x0C
    LSLS  R2, #8
    ANDS  R1, R1, R2 // Clear pull-up/pull-down bits for PA5
    STR   R1, [R0, #0x0C]
    LDR   R1, [R0, #0x04] // GPIOA_OTYPER offset
    MOVS  R2, #0x20
    ANDS  R1, R1, R2 // Clear output type bit for PA5
    STR   R1, [R0, #0x0C]
    LDR   R1, [R0, #0x00]  // GPIOA_MODER offset
    MOVS  R2, #0x0C
    LSLS  R2, #8
    ANDS  R1, R1, R2  // Clear mode bits for PA5
    MOVS  R2, #0x40
    ORRS  R1, R1, R2  // Set PA5 as output
    STR   R1, [R0, #0x00]

    // Set PA5 high to turn on LED
    LDR   R1, [R0, #0x18]  // GPIOA_BSRR offset
    MOVS  R2, #0x20
    ORRS  R1, R1, R2  // Set PA5
    STR   R1, [R0, #0x18]

foreverLoop:
    b	foreverLoop//	repeat
