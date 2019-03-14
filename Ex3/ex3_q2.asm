COMMENT! Alon Hartanu, id: 305143422
	This program read an array from user and prints it sorted.
!

INCLUDE Irvine32.inc
INCLUDE ex3_q2.inc

.data
	Student BYTE "Alon Hartanu, ID 305143422 Ex2-Q1",10,13,0
	ar_address DWORD ?
	num_elements DWORD ?

.code
Main PROC
	lea edx, Student
	call writeString
	
	call read_arr_sort_print
	call exitProcess
Main ENDP

read_arr_sort_print PROC USES ecx edx
	push ebp
	mov ebp,esp
	lea edx,MSG1
	call writeString
	call ReadInt
	mov num_elements,eax
	mov ecx,TYPE WORD
	allocate:
		sub esp,num_elements
		loop allocate
	mov ar_address,esp
	
	lea edx,MSG2
	call writeString
	push ar_address
	push num_elements
	call read_arr
	
	lea edx,MSG3
	call writeString
	push ar_address
	push num_elements
	call print_arr

	push ar_address
	push num_elements
	call sort_arr
	
	lea edx,MSG4
	call writeString
	push ar_address
	push num_elements
	call print_arr
	mov esp,ebp
	pop ebp
	ret
read_arr_sort_print ENDP

read_arr PROC USES ebx ecx
LENGTH_FROM_EBP=16
	push ebp
	mov ebp,esp
	mov ecx,[ebp+LENGTH_FROM_EBP]
	mov ebx,[ebp+LENGTH_FROM_EBP+4]
	cmp ecx,0
	je no_loop	; Skip loop if number of elements is 0
	read_elements:
		call ReadInt
		mov WORD PTR [ebx],ax
		add ebx,TYPE WORD
		loop read_elements
	no_loop:
	mov esp,ebp
	pop ebp
	ret 8
read_arr ENDP

print_arr PROC USES ebx ecx
LENGTH_FROM_EBP=16
	push ebp
	mov ebp,esp
	mov ebx,[ebp+LENGTH_FROM_EBP+4]
	mov ecx,[ebp+LENGTH_FROM_EBP]
	cmp ecx,0
	je no_loop
	print_loop:
		movsx eax,WORD PTR [ebx]
		call writeInt
		mov al,' '
		call writeChar
		add ebx,2
		loop print_loop
	no_loop:
	call CRLF
	mov esp,ebp
	pop ebp
	ret 8
print_arr ENDP

SWAP PROC USES ecx edx
	push ebp
	mov ebp,esp
	mov cx,WORD PTR [eax]
	mov dx,WORD PTR [ebx]
	mov WORD PTR [eax],dx
	mov WORD PTR [ebx],cx
	mov esp,ebp
	pop ebp
	ret
	
SWAP ENDP

bubble_line PROC USES ebx ecx edi
LENGTH_FROM_EBP=20
	push ebp
	mov ebp,esp
	mov ecx,[ebp+LENGTH_FROM_EBP]
	mov edi,[ebp+LENGTH_FROM_EBP+4]
bubble_loop:
	movsx eax,WORD PTR [edi]		;arr[i]
	movsx ebx,WORD PTR [edi+2]		;arr[i+1]
	cmp eax,ebx
	jg to_swap
	jng keep_loop
	to_swap:
		mov eax,edi
		mov ebx,edi
		add ebx,2
		call SWAP
		jmp keep_loop
	keep_loop:
		add edi,2
		loop bubble_loop
	mov esp,ebp
	pop ebp
	ret 8
bubble_line ENDP

sort_arr PROC USES ecx edi
LENGTH_FROM_EBP=16
	push ebp
	mov ebp,esp
	mov ecx,[ebp+LENGTH_FROM_EBP]
	dec ecx
	mov edi,[ebp+LENGTH_FROM_EBP+4]
	cmp ecx,1
	jng no_loop		; Skip loop if number of elements is 0 or 1
	sort_loop:
		push edi
		push ecx
		call bubble_line
		loop sort_loop
	no_loop:
	mov esp,ebp
	pop ebp
	ret 8
sort_arr ENDP
END Main