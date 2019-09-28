SECTION .data
number dd 50
parameter_true db 'The number %d is a power of two', 0Ah,0
parameter_false db 'The number %d is not a power of two', 0Ah,0

SECTION .text
global main
extern printf

main:
	mov eax, [number]	; number
	xor ebx, ebx 		; ris
	
compare_one:	
	cmp eax,0
	je end_false
	
compare_two:
	mov ecx, eax 		; tmp for and bitwise
	and ecx, 1
	cmp ecx, 1
	je compare_three
	
	shr eax, 1		; shift right
	
	jmp compare_two

compare_three:
	cmp eax, 1
	jne end_false
	mov ebx, 1
	
end_true:
	mov edx, [number]	
	push edx
	push parameter_true 
	call printf
	add esp, 8
	ret
	jmp exit
end_false:
	mov edx, [number]
	push edx
	push parameter_false 
	call printf
	add esp, 8
	ret
	
exit:
	mov     ebx, 0
    	mov     eax, 1
    	int     80h	
