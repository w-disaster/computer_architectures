SECTION .data
number dd 25
parameter db 'La radice di %d è : %d', 0Ah, 0

SECTION .text
global main
extern printf

main:
	mov eax, 0		; radice
	mov ecx, 1		; contatore
	mov edx, [number] 	; numero	
body:
	sub edx, ecx
	cmp edx, 0
	jl end
	inc eax 
	add ecx, 2
	jmp body
end:	
	mov edx, [number] 
	push eax
	push edx 
	push parameter
	call printf
	add esp, 12	
	ret

