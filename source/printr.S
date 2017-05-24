.include "m328Pdef.S"
.include "register.S"

.global printr

printr:
printr:
  push temp

  mov ZH, p1H
  mov ZL, p1L
printr_1:
  ld p1L, Z+
  tst p1L
  breq printr_ret
  rcall serout
  rjmp printr_1

printr_ret:
  rcall sync
  pop temp
  ret
