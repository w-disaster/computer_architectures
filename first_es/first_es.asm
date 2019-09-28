SECTION .data
num 	dd 15
prod 	dd 3
parameter db "Prodotto = %d", 10,0

SECTION .text
global main 
extern printf

main:  
	xor eax, eax
	xor ecx, ecx
	xor ebx, ebx 

	mov eax, [num]		; move the number to moltiplicate
	mov ecx, [prod]		; move the number of moltiplication
	mov ebx, eax 
	cmp ecx, 0
	je set_zero 
	
prodotto:
	add eax, ebx
	dec ecx
	cmp ecx,1
	jne prodotto
	jmp fine 

set_zero:
	xor eax, eax
fine:
	push eax
	push parameter
	call printf
	add esp, 8
	ret
	;mov edx, 4		; write four bytes
	;mov ecx, eax		; write the product
	;mov ebx, 1	 	; write to STDOUT
	;mov eax, 4	 	; invoke SYS_WRITE 
	;int 0x80
	
	;mov ebx, 0		; return 0 status on exit
	;mov eax, 1		; call operating system SYS_EXIT function
	;int 0x80		; interrupt reading


