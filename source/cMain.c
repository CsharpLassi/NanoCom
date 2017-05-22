#include "uart.h"
#include "wdt.h"



int main(void)
{
	wdtOff();

	print("Hallo Welt");

	while(1);
}
