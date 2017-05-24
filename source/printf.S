.include "m328Pdef.S"
.include "register.S"

.global printfS
.global printRam
.global print
.global printf

.extern printC
.extern sync

print:
printf:
	push temp
	mov ZL, p1L
	mov ZH, p1H
printf_1:
  lpm p1L, Z+
  tst p1L
  breq printf_end
  rcall serout
  rjmp printf_1
printf_end:
  rcall sync
	pop temp
  ret

printRam:
printfS:
  push temp
  push temp2

  ds = 2 +3 ;; push und ret

  in YL,SPL
  in YH,SPH

  adiw Y, ds

  rcall print

  mov ZH, p1H
  mov ZL, p1L
printfS_1:
  ld p1L, Z+
  tst p1L
  breq printfS_ret
  rcall serout
  rjmp printfS_1

printfS_ret:
  rcall sync
  pop temp2
  pop temp
  ret
