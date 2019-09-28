SECTION .data
string db 'This is the string',0Ah
character db 'e'
lenght dd 19
parameter db "Posizione = %d", 0Ah, 0

SECTION .text
global main
extern printf

main:
	mov bl, [character]
	xor bh, bh
	mov ecx, [lenght]
	xor eax, eax
	
body:
	cmp eax,ecx
	jge first_positive_control
	mov bh, [string+eax]
	
	cmp bh, bl
	jne sec_negative_control
	jmp end

first_positive_control: 
	mov eax, -1
	jmp end

sec_negative_control:
	inc eax
	jmp body

end: 
	push eax 		; 4 bytes register
	push parameter 		; 4 bytes register
	call printf
	add esp, 8		; go 8 bytes less
	ret 
