SECTION .data
array dd 1,3,5,-7,4,-9,12,-1,0,-12,23
lenght dd 11
parameter db 'Somma: %d, media: %d',0Ah,0

SECTION .text
global main
extern printf

main:
	xor eax, eax 		; sum
	xor ecx, ecx 		; L
while: 
	add eax, [array+ecx*4]
	inc ecx
	cmp ecx, [lenght]
	jne while
	
	mov ecx, eax 		;temp
	xor edx, edx 		

	mov ebx, [lenght] 
	div ebx			; eax/ebx storing the quotient in eax and the rest in edx
	
print:
	push eax 		;avarage
	push ecx 		;sum
	push parameter
	call printf
	add esp, 12
	ret
	
end:
	mov ebx, 0		; 0 status
	mov eax, 1		; call sys_exit
	int 0x80
