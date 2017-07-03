#include "uart.h"
#include "wdt.h"
#include "stdint.h"
#include "stdio.h"
#include "m328p.h"

uint8_t init(void)
{


	//printf("Hallo ID:%d,%x\r\n",15,15);
	//printf("Hallo ID:%d,%d,%d\r\n",15,30,20);


	printf("Hallo Welt\r\n");

	while(1)
	{
		printf("%d\r\n",getTCNT0());
	}

}
