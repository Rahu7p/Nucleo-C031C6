#ifndef USER_CM0PLUS_H_
#define USER_CM0PLUS_H_

/* Nested Vectored Interrupt Controller (NVIC) registers */
typedef struct
{
	volatile uint32_t ISER;
	volatile uint32_t RESERVED0[31];
	volatile uint32_t ICER;
	volatile uint32_t RESERVED1[31];
	volatile uint32_t ISPR;
	volatile uint32_t RESERVED2[31];
	volatile uint32_t ICPR;
	volatile uint32_t RESERVED3[95];
	volatile uint32_t IPR[8];
} NVIC_TypeDef;

#define NVIC_BASE			0xE000E100UL//	NVIC base address
#define NVIC    			(( NVIC_TypeDef * )NVIC_BASE )

#endif /* USER_CM0PLUS_H_ */
