#include "uart.h"
#include "wdt.h"
#include "stdint.h"
#include "stdio.h"

uint8_t main(void)
{
	if(printI(15,10))
		print("Error\r\n");

	print("Hallo Welt\r\n");
	/*

	print("Hallo Welt\r\n");



	uint8_t i = 0;
	while(1)
	{
		print("1");
	}
	*/
}
