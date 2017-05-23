.include "m328Pdef.S"
.include "register.S"

.global asmMain
.global stdhandler

.extern Uart_Init
.extern print
.extern init

.extern wdtOn

.extern sendInit
.extern sendStart

.section .init1
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

	rcall init

loop:
	rjmp    loop

stdhandler:
	rjmp stdhandler
	reti
