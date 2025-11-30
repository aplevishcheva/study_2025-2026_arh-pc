%include 'in_out.asm'

section .data
  msg1 db 'Функция: f(x)=2(x-1)', 0
  msg2 db 'Результат: ', 0

section .text
global _start

_start:

  mov  eax, msg1
  call sprintLF

  pop  ecx

  pop  edx

  sub  ecx, 1

  mov  esi, 0

next:

  cmp  ecx, 0h
  jz  _end

  pop  eax
  call atoi
  sub  eax, 1
  imul eax, 2
  add  esi, eax

  loop next

_end:

  mov  eax, msg2
  call sprint
  mov  eax, esi
  call iprintLF

  call quit