; SetLowerNibble
main:
  ldi r16,0x29 ; stack (input)
  push r16
  eor r16,r16
  call SetLowerNibble
  pop r24 ; stack (output)
  jmp main

.org 0x24
SetLowerNibble:
  pop r0
  pop r1

  pop r16
  ori r16,0x0f
  push r16

  push r1
  push r0
  ret
