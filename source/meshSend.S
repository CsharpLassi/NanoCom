.include "m328Pdef.S"
.include "register.S"

.global sendInit
.global sendStart
.global sendIRQCompare
.global sendIRQOverflow

.extern print

sendInit:
  push temp

  ;Modus aktivieren
  ldi temp , (1<< WGM01) | (0 << WGM00)
  sts TCCR0A, temp

  pop temp
  ret

sendStart:
  push temp

  ldi temp , 128
  sts OCR0A, temp

  ;Interrupts aktivieren
  ldi temp, (1<<OCIE0A) | (1 << TOIE0)
  sts TIMSK0, temp

  ldi temp , (1 << CS02) | (0 << CS01) | (1 << CS00)
  sts TCCR0B, temp

  pop temp
  ret

sendIRQCompare:
  rjmp sendIRQCompare
  reti

sendIRQOverflow:
  rjmp sendIRQOverflow
  reti

.data
txtMessage: .asciz "TestInterrupt"
