#ifndef __STDIO_H__
#define __STDIO_H__

#include <stdarg.h>

uint8_t printI(uint8_t value,uint8_t base);
void print(char*);
void printRam(char*);
void printC(char);

void printf(const char*,...);

#endif
