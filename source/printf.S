.include "m328Pdef.S"
.include "register.S"

.global printf

.extern printC
.extern sync

printf:
	push temp
	push temp2
	push YL
	push YH

	ds = 4 +3 ;; push und ret

	in YL,SPL
  in YH,SPH
	adiw Y, ds

	ld p1L, Y+
	ld p1H, Y+

	mov ZL, p1L
	mov ZH, p1H
printf_1:
  lpm p1L, Z+
  tst p1L
  breq printf_end
	cpi p1L , '%'
	brne printf_out

	lpm p1L, Z+
	tst p1L
	breq printf_end

printf_d:
	cpi p1L, 'd'
	brne printf_x
	ld p1L, Y+
	ld p1H, Y+
	ldi p2L, 10
	clr p2H
	rcall printI
	rjmp printf_1

printf_x:
	cpi p1L, 'x'
	brne printf_pr
	ld p1L, Y+
	ld p1H, Y+
	ldi p2L, 16
	clr p2H
	rcall printI
	rjmp printf_1

printf_pr:
	cpi p1L, '%'
	brne printf_else
	ldi p1L, '%'
	clr p1H
	rcall printC

	rjmp printf_1

printf_else:
	rjmp printf_1

printf_out:
  rcall serout
  rjmp printf_1

printf_end:
  rcall sync

	pop YH
	pop YL
	pop temp2
	pop temp
  ret
