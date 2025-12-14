%include 'in_out.asm'

section .data

  filename  db 'name.txt', 0
  msg       db 'Как Вас зовут? ', 0

section .bss

contents resb 255

section .text
global _start

 _start:

  mov  eax, msg
  call sprint

  mov  ecx, contents
  mov  edx, 255
  call sread

  mov  ecx, 2
  mov  ebx, filename
  mov  eax, 5
  int  80h

  mov  esi, eax

  mov  edx, 13
  mov  ecx, contents
  mov  ebx, esi
  mov  eax, 4
  int  80h

  mov  ebx, esi
  mov  eax, 6
  int  80h

  call quit