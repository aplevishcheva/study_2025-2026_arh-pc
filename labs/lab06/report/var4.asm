%include 'in_out.asm'

SECTION .data

msg: DB 'Введите x: ',0
rem: DB 'Результат вычислений: ',0


SECTION .bss

x: RESB 80
res: RESB 1


SECTION .text
GLOBAL _start
 _start:

  mov  eax, msg
  call sprintLF

  mov  ecx, x
  mov  edx, 80
  call sread

  mov  eax, x
  call atoi

  xor  edx, edx
  sub  eax, 1
  imul  eax, 4
  mov  ebx, 3
  div  ebx
  add  eax, 5
  inc  edx

  mov  [res], eax

  mov  eax, rem
  call sprint
  mov  eax, [res]
  call iprintLF

  call quit
