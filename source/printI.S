.include "m328Pdef.S"
.include "register.S"

.global printI

.extern printRam
.extern division8

.text
printI:
  push temp
  push ZL
  push ZH
  push YL
  push YH

  CPI p2L , 37
  brge print_Ret_False

  ldi YL, lo8(buffer)
  ldi YH, lo8(buffer)
  adiw Y, 8

  clr temp
  st -Y,temp

printI_Loop:
  rcall division8
  ldi ZL, lo8(txtCode)
  ldi ZH, hi8(txtCode)
  clr temp
  add ZL, p1H
  adc ZH, temp
  lpm temp,Z
  st -Y,temp
  cpi p1L , 1
  BRGE printI_Loop

  mov p1L, YL
  mov p1H, YH
  rcall printRam

  rjmp printI_Ret_True

print_Ret_False:
  ldi p1L,0x01
  rjmp printI_Ret
printI_Ret_True:
  ldi p1L, 0x00

printI_Ret:
  clr p1H

  pop YH
  pop YL
  pop ZH
  pop ZL
  pop temp
  ret

.section .rodata
txtCode: .asciz "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

.data
buffer: .byte 8
