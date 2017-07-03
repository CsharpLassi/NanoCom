.include "m328Pdef.S"
.include "register.S"

.global sendInit
.global sendStart
.global sendIRQCompare
.global sendIRQOverflow

.global getTCNT0


sendInit:
  push temp

  clr temp
  sts TCNT0, temp

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
  ldi temp, (0<<OCIE0A) | (1 << TOIE0)
  sts TIMSK0, temp

  ldi temp , (1 << CS02) | (0 << CS01) | (1 << CS00)
  sts TCCR0B, temp

  pop temp
  ret

getTCNT0:
  lds p1L, TCNT0
  ldi p1H, 0
  ret

sendIRQCompare:
  reti

sendIRQOverflow:
  reti
