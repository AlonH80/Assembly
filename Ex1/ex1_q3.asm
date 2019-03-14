COMMENT!
	Alon Hartanu, ID: 305143422
	This program prints an NxN size multiplication table.
	N is the user input.
!

INCLUDE Irvine32.inc
INCLUDE ex1_q3_data.inc

.data
	STUDENT BYTE "Alon Hartanu id: 305143422 EX1-Q3",10,13,0
	NEWLINE BYTE 10,13,0
	SPACE BYTE " ",0
	line DWORD 1
	lines_left BYTE 1
	N BYTE ?
	
.code
myMain PROC
	; Print student details
	mov edx,OFFSET STUDENT
	call writeString
	; Enter a number
	mov edx,OFFSET MSG1
	call writeString
	call readInt
	; Set loops counter
	mov N,al
	mov lines_left,al	; lines_left - Counter for outer loop 
	; Print multiplication table
	mov edx,OFFSET MSG2
	call writeString
	mov edx,OFFSET SPACE	; Seperate numbers by space
	movzx ecx,N
	
	lines_loop:
		; The outer loops loops between lines.
		mov eax,line
		mov ebx,ecx
		movzx ecx,N
		inLine_loop:
			; Print N elements of the line
			call writeDec
			call writeString
			add eax,line		; Adding the value of line to each element
			loop inLine_loop
		; Set next iteration
		mov ecx,ebx ; Re-initialize outer loop		
		inc line
		call CRLF
		loop lines_loop
	exit
myMain ENDP
END myMain