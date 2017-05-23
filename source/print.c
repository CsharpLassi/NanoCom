#include "stdint.h"
#include "uart.h"



uint8_t printI(uint8_t value,uint8_t base)
{
	char buf[8];
	char* p;

	const char* code = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";


	if (base > 36) {
		return 1;
	}

	p = buf + 7;
	*p= '\0';



	do {
		*--p = code[value % base];
		printC(value % base + 0x30);
		printC(code[base]);
		value /= base;
	} while (value);

	printRam(p);

	return 0;
}
