.include "m328Pdef.S"
.include "register.S"



.text
printI:
  push temp

print_Ret_False:
  ldi p1L,0x01
  rjmp printI_Ret
printI_Ret_True:
  ldi p1L, 0x00

printI_Ret:
  pop temp
  ret

.section .rodata
txtCode: .asciz "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

.data
buffer: .byte 8
