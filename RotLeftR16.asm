; RotLeftR16
main:
  ldi r16,0x9B ; r16 (input)
  ldi r17,2 ; r0 (input)
  mov r0,r17
  eor r17,r17
  call RotLeftR16 ; r16 (output)
  jmp main

RotLeftR16:
  mov r1,r16
  mov r2,r16
  mov r21,r0
  mov r22,r0
  neg r22
  ldi r30,8
  add r22,r30
  ldi r30,1
  neg r30
LeftShift:
  add r1,r1
  add r21,r30
  cpi r21,0
  brbs 1,RightShift
  brbc 1,LeftShift
RightShift:
  lsr r2
  add r22,r30
  cpi r22,0
  brbs 1,Done
  brbc 1,RightShift
Done:
  or r1,r2
  mov r16,r1
  ret
