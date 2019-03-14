COMMENT! Alon Hartanu, id: 305143422
	This program sort an array using bubble sort algorithm.
!

INCLUDE Irvine32.inc
INCLUDE ex2_q3_data.inc

.data
	Student BYTE "Alon Hartanu, ID 305143422 Ex2-Q3",10,13,0
.code
Main PROC
	mov edx,OFFSET Student
	call writeString
	mov edx,OFFSET Str_before
	call writeString
	lenArr=lengthOf Arr
	mov ecx,lenArr
	mov edi,OFFSET Arr
	call Print_Dword_Arr
	mov ebx,sizeof Arr
	sub ebx,4
	bubble_sort:
		jz done_sort
		mov eax,0
		bubble_curr_index:
			cmp eax,ebx
			je done_index
			mov ecx,Arr[eax]
			mov edx,Arr[eax+4]
			cmp ecx,edx
			jg switch
			jng next
			switch: mov Arr[eax],edx
					mov Arr[eax+4],ecx
					jmp next
			next:add eax,4
				jmp bubble_curr_index
			done_index: sub ebx,4
					jmp bubble_sort
		done_sort:mov edx,OFFSET Str_after
				call writeString
				mov ecx,lenArr
				mov edi,OFFSET Arr
				call Print_Dword_Arr
	call exitProcess
Main ENDP

Print_Dword_Arr PROC
	push eax
	push ecx
	push edi
	L1:
		mov eax, [edi]
		call WriteInt
		mov al, ' '
		call writeChar
		add edi, 4
	loop L1
	call CRLF
	pop edi
	pop ecx
	pop eax
	ret
	Print_Dword_Arr ENDP
END Main