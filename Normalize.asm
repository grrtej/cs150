; Normalize
main:
  ldi r16,18 ; stack (input)
  ldi r17,20 ; r0
  ldi r18,15 ; r1
  push r16
  mov r0,r17
  mov r1,r18
  eor r16,r16
  eor r17,r17
  eor r18,r18
  call Normalize
  pop r24 ; stack (output)
  jmp main

.org 0x20
Normalize:
  pop r2
  pop r3
  pop r16
  sts $116,r16
  andi r16,1
  lds r16,$116
  brbs 1,IsEven
  brbc 1,IsOddDone
IsOddDone:
  rjmp Done
IsEven:
  cp r16,r0
  brbs 0,r0Greater
  brbc 0,r16GreaterDone
r16GreaterDone:
  neg r1
  add r16,r1
  rjmp Done
r0Greater:
  cp r16,r1
  brbs 0,r1GreaterDone
  brbc 0,Done
r1GreaterDone:
  add r16,r0
  rjmp Done
Done:
  push r16
  push r3
  push r2
  ret
