#include "uart.h"
#include "wdt.h"
#include "stdint.h"
#include "stdio.h"

uint8_t init(void)
{
	if(printI(15,16))
		print("Error\r\n");

	print("Hallo Welt\r\n");

	printf("Hallo ID:%d",5,3,2);
	/*

	print("Hallo Welt\r\n");



	uint8_t i = 0;
	while(1)
	{
		print("1");
	}
	*/
}
