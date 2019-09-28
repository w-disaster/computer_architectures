#include <stdio.h>

void main(){
	unsigned int intArray[] = {0,30};
	int num = sizeof(intArray) / sizeof(intArray[0]);
	unsigned int MCD;

	__asm {
		mov esi, 1
		mov eax, [intArray]
		jmp EndCheck
		Body:mov ebx, [intArray + esi*4]
			jmp Euclide		
			BodyContinue:
				inc esi
				EndCheck: cmp esi, num
				je End
				jmp Body
		Euclide:cmp ebx, 0
			jne Exchange
			jmp BodyContinue
		Exchange:cdq
			div ebx
			mov eax, ebx 
			mov ebx, edx
			jmp Euclide
		End:mov MCD, eax















							
		/*
		FindMin:
			cmp eax, [intArray+edi]
			jb NewMin
			FindMinContinue:
				inc edi
				cmp edi, num
				je FindMCD
				jmp FindMin
		NewMin:
			mov eax, [intArray+edi]
			jmp FindMinContinue

		FindMCD:
			//eax is the smallest number
			call DivPrime

		
		DivPrime:

		*/


		
	}
	printf("M.C.D: %d\n", MCD);


}

