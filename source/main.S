.include "m328Pdef.S"
.include "register.S"

.global asmMain
.global stdhandler

.extern Uart_Init
.extern print
.extern main

.extern wdtOn

.extern sendInit
.extern sendStart

.text
asmMain:
	;Ram
	ldi temp , hi8(RAMEND)
	out SPH  , temp
	ldi temp , lo8(RAMEND)
	out SPL  , temp


	;rcall wdtOn
	rcall Uart_Init

	rcall sendInit

	;SEI

	rcall sendStart

	rcall main

loop:
	rjmp    loop

stdhandler:
	rjmp stdhandler
	reti
