.include "m328Pdef.S"
.include "register.S"

.global asmMain
.global stdhandler

.extern Uart_Init
.extern print
.extern main

.extern wdtOn

.text
asmMain:
	;Ram
	ldi temp , hi8(RAMEND)
	out SPH  , temp
	ldi temp , lo8(RAMEND)
	out SPL  , temp


	rcall wdtOn
	rcall Uart_Init

	rcall main

loop:
	rjmp    loop

stdhandler:
	reti
