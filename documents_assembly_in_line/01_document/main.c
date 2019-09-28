#include <stdio.h>

int main() {
	char stringa[1024] = "Cantami, o Diva, del Pelìde Achille l'ira funesta che infiniti addusse lutti agli Achei";
	char str1[] = "Pelìde Achille";
	char str2[] = "";
	char risultato[1024];

	__asm{
		xor eax, eax
		xor ebx, ebx
		xor ecx, ecx
		xor edi, edi

		body:
			call main_while
			cmp dh,0
			je end
			cmp dh,[str1]
			je occurrence
			jmp copy_write

		main_while:
			mov dh, [stringa+eax]
			mov dl, [str1+ebx]
			ret

		increase:
			inc eax
			jmp body

		occurrence:
			push eax
			occurrence_body:
				inc eax
				inc ebx
				call main_while
				cmp dl, 0
				je write_result
				cmp dl, dh
				jne write
				jmp occurrence_body

		copy_write:
			mov ch, [stringa+eax]
			mov [risultato+edi], ch
			inc edi
			cmp dh, 0
			je end
			jmp increase

		write_result:
			pop ecx
			xor esi, esi
			write_result_eff:
				mov ch, [str2+esi]
				cmp ch,0
				je continue_
				mov [risultato+edi], ch
				inc edi
				inc esi
				jmp write_result_eff

		continue_:
			xor ebx, ebx
			cmp dh,0
			je end
			jmp body

		write:
			pop esi
			write_body:
				mov cl, [stringa+esi]
				mov [risultato+edi], cl
				inc edi
				inc esi
				cmp esi, eax
				je continue_
				jmp write_body
		end:
			mov [risultato+edi],0
	}
	printf("Stringa: %s\n", stringa);
	printf("Str1: %s\n", str1);
	printf("Str2: %s\n", str2);

	printf("Risultato: %s\n", risultato);
	return 0;
}	