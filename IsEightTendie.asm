; IsEightTendie
; NOTE: preserve registers
main:
  ldi r16,24 ; r8 (input)
  mov r8,r16
  eor r16,r16
  call IsEightTendie
  pop r24 ; stack (output)
  jmp main

.org 0x26
IsEightTendie:
  sts $116,r16
  sts $100,r0
  sts $101,r1
  pop r0
  pop r1

  mov r16,r8
  andi r16,7
  brbs 1,IsDiv
  brbc 1,IsNotDiv
IsDiv:
  ldi r16,0xff
  rjmp Done
IsNotDiv:
  ldi r16,0x00
  rjmp Done
Done:
  push r16
  push r1
  push r0
  lds r1,$101
  lds r0,$100
  lds r16,$116
  ret
