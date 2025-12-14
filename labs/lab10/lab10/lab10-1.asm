%include 'in_out.asm'

section .data

  filename  db 'readme-1.txt', 0h
  msg       db 'Введит строку для записи в файл: ', 0h

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

  mov  eax, contents
  call slen

  mov  edx, eax
  mov  ecx, contents
  mov  ebx, esi
  mov  eax, 4
  int  80h

  mov  ebx, esi
  mov  eax, 6
  int  80h

  call quit