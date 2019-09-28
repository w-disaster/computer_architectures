#include <stdio.h>
void main() {
	
	unsigned int vet[] = { 0,1,2,3,4,5,6,7,8,9,10,-1,-2,-3,254 };
	unsigned int num = sizeof(vet) / sizeof(vet[0]);

	__asm {
		main: xor edi, edi
		Index: mov eax, [vet+edi*4]
			xor edx, edx
			Body: cmp eax, 0
				je Is_Sum_Odd
				mov ebx, eax
				and ebx, 1
				cmp ebx, 1
				je Inc_Occurrence
				shr eax, 1
				jmp Body
		Inc_Occurrence: inc edx
			shr eax, 1
			jmp Body
		Is_Sum_Odd: and edx, 1
			cmp edx, 1
			je Reverse
			Continue: inc edi
				cmp edi, num 
				je End
				jmp Index
		Reverse: mov ecx, [vet+edi*4]
			bswap ecx
			mov [vet+edi*4], ecx
			jmp Continue
		End:

	}

	for (int i = 0; i < num; i++) {
		printf("%d ", vet[i]);
	}

}