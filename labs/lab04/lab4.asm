SECTION .data
	lab4:      db "Levishcheva Anastasiya",0xa 
		lab4Len:   equ $ - lab4
SECTION .text
	global _start           

_start:                 
        mov eax, 4      
        mov ebx, 1    
        mov ecx, lab4
        mov edx, lab4Len
        int 0x80        
	
	mov eax, 1       
        mov ebx, 0      
        int 0x80
