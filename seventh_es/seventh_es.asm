SECTION .data
array dd 3,7,3,7,5,1,4,-3,-7,-9,2,6
lenght dd 12
parameter db "%d\n",0Ah,0

SECTION .text
global main
extern printf

main: 
	mov ecx, [lenght]		;Pos
	dec ecx

body1:
	xor eax, eax
	mov eax, DWORD[array+ecx*4]	;Max
	mov ebx, ecx 			;MaxPos
	mov edx, ecx 			;I

body2: 
	dec edx
	cmp edx, -1			;cmp I=-1
	jne if1_neg
	jmp if1_pos

if1_neg:
	cmp eax, DWORD[array+edx*4]
	jbe if2_neg
	jmp body2 

if2_neg:
	mov eax, DWORD[array+edx*4]
	mov ebx, edx
	jmp body2
 
if1_pos:
	push edx 			;for tmp variable i push edx that i will not use in this block of code
	mov edx, DWORD[array+ecx*4]
	mov DWORD[array+ecx*4], eax
	mov DWORD[array+ebx*4], edx
	dec ecx
	pop edx

	cmp ecx, 0
	jbe print_stdout
	jmp body1

print_stdout:
	mov eax,0
	
print_array:
	mov ebx, DWORD[array+eax*4]
	push ebx
	push DWORD parameter			;push parameter address
	call printf
	add esp, 8
	ret
	
	
	inc eax
	cmp eax, DWORD[lenght]
	jmp print_array 
	
	mov ebx, 0
	mov eax, 1
	int 80h


	
	


