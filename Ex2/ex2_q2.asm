COMMENT! Alon Hartanu, id: 305143422
	This program switch 2 input chars with 3rd input char.
!

INCLUDE Irvine32.inc
INCLUDE ex2_q2_data.inc

.data
	Student BYTE "Alon Hartanu, ID 305143422 Ex2-Q1",10,13,0
	charToReplace1 BYTE ?
	charToReplace2 BYTE ?
	charToPlace BYTE ?

.code
Main PROC
	mov edx,OFFSET Student
	call writeString
	mov edx,OFFSET Str_before
	call writeString
	mov edx,OFFSET Seuss
	call writeString
	mov edx,OFFSET ask_1st
	call writeString
	call readChar
	call writeChar
	call CRLF
	mov charToReplace1,al
	mov edx,OFFSET ask_2nd
	call writeString
	call readChar
	call writeChar
	call CRLF
	mov charToReplace2,al
	mov edx,OFFSET ask_3rd
	call writeString
	call readChar
	call writeChar
	call CRLF
	mov charToPlace,al
	mov edx,OFFSET Seuss
	mov ecx,lengthOF Seuss
	mov bl,charToPlace
	switch_loop:
		mov al,BYTE PTR [edx]
		cmp al,0
		je done
		cmp charToReplace1,al
		je replace
		jne try2ndchar
	try2ndchar: cmp charToReplace2,al
			je replace
			jne next	
	replace: mov [edx],bl
			jmp next
	next: inc edx
		jmp switch_loop
	done:mov edx,OFFSET Str_after
		call writeString
		mov edx,OFFSET Seuss
		call writeString
	call exitProcess
Main ENDP
END Main