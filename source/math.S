.include "m328Pdef.S"
.include "register.S"

.global __udivmodqi4

__udivmodqi4:
  i = p1L
  b = p2L
  ; p1L = i /b ; p1H = i%b

  push temp
  push p2L
  push p2H
  clr temp

__udivmodqi4_loop:
  cp i, b
  BREQ __udivmodqi4_ret
  BRLO __udivmodqi4_ret
  inc temp
  sub i , b
  rjmp __udivmodqi4_loop

__udivmodqi4_ret:

  mov p1H, i
  mov p1L,temp


  pop p2H
  pop p2L

  pop temp
  ret
