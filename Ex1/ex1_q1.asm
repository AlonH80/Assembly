COMMENT! Alon Hartanu, id: 305143422
	This program calculate the multiplication of 2 numbers,
	without mult function 
!

INCLUDE Irvine32.inc
INCLUDE ex1_q1_data.inc

.data
	STUDENT BYTE "Alon Hartanu id: 305143422 EX1-Q1",10,13,0
	EQUALSIGN BYTE " = ",0
	MULTSIGN BYTE " * ",0 

.code
myMain PROC
	mov edx, OFFSET STUDENT 
	call writeString	; Print student details
	; Initialize registers
	mov eax, 0
	movzx ecx, N
	movsx ebx, M
	
multLoop: ; The loop adding ebx to eax N times
	add eax, ebx
	loop multLoop
	
	mov RESULT,eax
	; Printing the result
	mov edx, OFFSET MSG
	call writeString
	movsx eax, M
	call writeInt
	mov edx, OFFSET MULTSIGN
	call writeString
	movzx eax, N
	call writeInt
	mov edx, OFFSET EQUALSIGN
	call writeString
	mov eax, RESULT
	call writeInt
	call CRLF
	
	exit
myMain ENDP
END myMain