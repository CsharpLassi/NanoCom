.include "m328Pdef.S"
.include "register.S"

.global wdtOn
.global wdtOff
.global wdtReset

;Activate WatchDog
wdtOn:
  push temp
  lds temp , WDTCSR
  ori temp , (1<<WDE) | (1 << WDP2) | (1 << WDP0)
  sts WDTCSR, temp
  pop temp
  ret

wdtOff:
  push temp
  push temp2
  wdr

  lds temp, WDTCSR
  ori temp , (1<<WDE) | (1 << WDCE)

  in temp2, SREG
  cli

  sts WDTCSR,temp

  ldi temp, (0 << WDE)
  sts WDTCSR,temp

  out SREG, temp2
  sei

  pop temp2
  pop temp
  ret


wdtReset:
  wdr
  ret
