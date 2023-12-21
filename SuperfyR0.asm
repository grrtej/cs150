; SuperfyR0
; NOTE: only use r0,r1,r2,r3 and stack
main:
  ldi r16,28 ; r0 (input)
  ldi r17,15 ; r1 (input)
  ldi r18,3  ; r2 (input)
  ldi r19,77 ; r3 (input)
  mov r0,r16
  mov r1,r17
  mov r2,r18
  mov r3,r19
  eor r16,r16
  eor r17,r17
  eor r18,r18
  eor r19,r19
  call SuperfyR0 ; r0 (output)
  jmp main

.org 0x30
SuperfyR0:
  push r1
  push r2
  push r3
LeftCompare:
  cp r0,r1
  brbs 0,r1Greater
  brbc 0,r0Greater
r1Greater:
  push r1
  rjmp RightCompare
r0Greater:
  push r0
  rjmp RightCompare
RightCompare:
  cp r2,r3
  brbs 0,r3Greater
  brbc 0,r2Greater
r3Greater:
  push r3
  rjmp FinalCompare
r2Greater:
  push r2
  rjmp FinalCompare
FinalCompare:
  pop r0
  pop r1
  cp r0,r1
  brbs 0,r1Greatest
  brbc 0,Done
r1Greatest:
  mov r0,r1
Done:
  pop r3
  pop r2
  pop r1
  ret
