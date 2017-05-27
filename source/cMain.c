#include "uart.h"
#include "wdt.h"
#include "stdint.h"
#include "stdio.h"
#include "mesh.h"

uint8_t init(void)
{
	while (1)
	{
		printf("%d\r\n",getCounter());
	}
}
