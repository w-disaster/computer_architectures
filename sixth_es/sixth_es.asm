SECTION .data
array db 3,7,3,7,5
lenght db 5
parameter db '(1) dispari, (0) pari: %d',0Ah,0


SECTION .text
global main
extern printf

main:
	xor al, al			;val
	xor ebx, ebx			;sum
	xor edx, edx			;xor 32 bit register
	mov dl, [lenght]		;lung
jump1:
	mov al, [array+edx-1]		;val
if1:
	cmp al, 0
	jne if2
	jmp if3
	
if2:	
	mov cl, al			;temp for bitwise AND
	and cl, 1			;ris in dh
	cmp cl, 1	
	je somma

if2_1:
	shr al, 1			;shift right val
	jmp if1

somma: 
	inc ebx				;inc somma	
	jmp if2_1 
if3:
	dec dl
	cmp dl ,0
	jne jump1 
	
	and ebx, 1			;ris
	push ebx
	push parameter
	call printf
	add esp, 8
	ret

	mov ebx, 0
	mov eax, 1
	int 80h	

