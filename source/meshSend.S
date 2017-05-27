.include "m328Pdef.S"
.include "register.S"

.global sendInit
.global sendStart
.global sendIRQCompare
.global sendIRQOverflow

.global getCounter

.extern print

sendInit:
  push temp

  ;Modus aktivieren
  ldi temp , (0<< WGM01) | (0 << WGM00)
  sts TCCR0A, temp

  pop temp
  ret

sendStart:
  push temp

  ldi temp , 0
  sts OCR0A, temp

  ;Interrupts aktivieren
  ;ldi temp, (0<<OCIE0A) | (0 << TOIE0)
  ;sts TIMSK0, temp

  ldi temp, (0 << CS02) | (0 << CS01) | (1 << CS00)
  sts TCCR0B, temp

  pop temp
  ret

getCounter:
  clr p1H
  lds p1L , TCNT0
  ret

sendIRQCompare:
  rjmp sendIRQCompare
  reti

sendIRQOverflow:
  rjmp sendIRQOverflow
  reti
