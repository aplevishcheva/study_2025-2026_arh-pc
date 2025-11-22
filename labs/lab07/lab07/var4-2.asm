%include 'in_out.asm'

SECTION .data

msg1: DB 'Введите x: ',0
msg2: DB 'Введите a: ',0
rem:  DB 'Результат вычислений: ',0


SECTION .bss

x:   RESB 80
a:   RESB 80
res: RESB 1


SECTION .text
GLOBAL _start
 _start:

  mov  eax, msg1
  call sprintLF

  mov  ecx, x
  mov  edx, 80
  call sread

  mov  eax, x
  call atoi
  mov  [x], eax

  mov  eax, msg2
  call sprintLF

  mov  ecx, a
  mov  edx, 80
  call sread

  mov  eax, a
  call atoi
  mov  [a], eax

  xor  edx, edx
  mov  eax, [x]
  mov  ebx, [a]
  add  eax, eax
  cmp  ebx, 0
  jne add_a
  add  eax, 1
  jmp print

  add_a:
    add  eax, ebx

  print:
    mov  [res], eax

    mov  eax, rem
    call sprint
    mov  eax, [res]
    call iprintLF

    call quit
