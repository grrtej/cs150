; ExportR1Bits
main:
  ldi r16,0x9D ; r1 (input)
  mov r1,r16
  eor r16,r16
  call ExportR1Bits ; r29,r30,r31 (output)
  jmp main

ExportR1Bits:
  mov r31,r1
  mov r30,r1
  mov r29,r1
  andi r31,0xA1
  andi r30,0x4A
  andi r29,0x14
  ret
