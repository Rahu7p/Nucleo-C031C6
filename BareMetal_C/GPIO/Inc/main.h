#ifndef MAIN_H_
#define MAIN_H_

/* Reset and Clock Control registers */
typedef struct
{
	volatile uint32_t CR;
	volatile uint32_t ICSCR;
	volatile uint32_t CFGR;
	volatile uint32_t RESERVEDA;
	volatile uint32_t RESERVEDB;
	volatile uint32_t CRRCR;
	volatile uint32_t CIER;
	volatile uint32_t CIFR;
	volatile uint32_t CICR;
	volatile uint32_t IOPRSTR;
	volatile uint32_t AHBRSTR;
	volatile uint32_t APBRSTR1;
	volatile uint32_t APBRSTR2;
	volatile uint32_t IOPENR;
} RCC_TypeDef;

/* General Purpose I/O registers */
typedef struct
{
	volatile uint32_t MODER;
	volatile uint32_t OTYPER;
	volatile uint32_t OSPEEDR;
	volatile uint32_t PUPDR;
	volatile uint32_t IDR;
	volatile uint32_t ODR;
	volatile uint32_t BSRR;
} GPIO_TypeDef;

#define RCC_BASE	0x40021000UL//		RCC base address
#define GPIOA_BASE	0x50000000UL//		GPIO Port A base address

#define RCC     (( RCC_TypeDef *)RCC_BASE )
#define GPIOA	(( GPIO_TypeDef *)GPIOA_BASE )

#endif /* MAIN_H_ */
