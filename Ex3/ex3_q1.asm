COMMENT! Alon Hartanu, id: 305143422
	This program prints an array twice - with an iterate function,
	and with a recursive function.
!

INCLUDE Irvine32.inc
INCLUDE ex3_q1.inc

.data
	Student BYTE "Alon Hartanu, ID 305143422 Ex2-Q1",10,13,0

.code
Main PROC
	mov edx,OFFSET Student
	call writeString
	
	mov edx,OFFSET str1
	call writeString
	mov edx,OFFSET PRINT_ITER
	call writeString
	push OFFSET ARR1
	push lengthOf ARR1
	call arr_iter
	mov edx,OFFSET PRINT_REC
	call writeString
	push OFFSET ARR1
	push lengthOf ARR1
	call arr_rec
	call CRLF
	mov edx,OFFSET str2
	call writeString
	mov edx,OFFSET PRINT_ITER
	call writeString
	push OFFSET ARR2
	push lengthOf ARR2
	call arr_iter
	mov edx,OFFSET PRINT_REC
	call writeString
	push OFFSET ARR2
	push lengthOf ARR2
	call arr_rec
	call ExitProcess
Main ENDP

arr_iter PROC USES ebx ecx
LENGTH_FROM_EBP=16
	push ebp
	mov ebp,esp
	mov ebx,[ebp+LENGTH_FROM_EBP+4]
	mov ecx,[ebp+LENGTH_FROM_EBP]
	cmp ecx,0
	je skip_loop
	print_loop:
		mov eax,[ebx]
		call writeInt
		mov al,' '
		call writeChar
		add ebx,4
		loop print_loop
	skip_loop:
	call CRLF
	mov esp,ebp
	pop ebp
	ret 8
arr_iter ENDP

arr_rec PROC USES ebx ecx
LENGTH_FROM_EBP=16
	push ebp
	mov ebp,esp
	mov ebx,[ebp+LENGTH_FROM_EBP+4]
	mov ecx,[ebp+LENGTH_FROM_EBP]
	cmp ecx,0
	je stop_condition
	jne continue_rec
	stop_condition:
		call CRLF
		jmp end_func
	continue_rec:
		mov eax,[ebx]
		call writeInt
		mov al,' '
		call writeChar
		add ebx,4
		dec ecx
		push ebx
		push ecx
		call arr_rec
		jmp end_func
	end_func:
		mov esp,ebp
		pop ebp
		ret 8
arr_rec ENDP

END Main	
	