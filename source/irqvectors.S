.extern main
.extern stdhandler
.extern sendIRQCompare
.extern sendIRQOverflow

.global IRQTable
.section .init0
IRQTable:
;Einstiegspunkt und Interrupt
jmp asmMain
jmp stdhandler ;ExInt 0
jmp stdhandler ;ExInt 1
jmp stdhandler ;PinChange 0
jmp stdhandler ;PinChange 1
jmp stdhandler ;PinChange 2
jmp stdhandler ;WDT
jmp stdhandler ;Timer2 CompA
jmp stdhandler ;Timer2 CompB
jmp stdhandler ;Timer2 OVF
jmp stdhandler ;Timer1 CAPT
jmp stdhandler ;Timer1 CompA
jmp stdhandler ;Timer1 CompB
jmp stdhandler ;Timer1 OVF
jmp sendIRQCompare ;Timer0 CompA
jmp sendIRQCompare ;Timer0 CompB
jmp sendIRQOverflow ;Timer0 OVF
jmp stdhandler ;SPI STC
jmp UartReceiveInterrupt ;USART, RX Complete
jmp UartReceiveInterrupt ;USART, Data Register Empty
jmp UartReceiveInterrupt ;USART, TX Complete
jmp stdhandler ;ADC Conversion Complete
jmp stdhandler ;EEPROM Ready
jmp stdhandler ;AnalogComperator
jmp stdhandler ;2-wire Interface
jmp stdhandler ;Store Program Memory Ready
