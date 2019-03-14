COMMENT!
	Alon Hartanu, ID: 305143422
	This program N tri-bonachi numbers and their sum
!
INCLUDE Irvine32.inc
INCLUDE ex1_q2_data.inc

.data
	STUDENT BYTE "Alon Hartanu id: 305143422 EX1-Q2",10,13,0
	NEWLINE BYTE 10
	TRIBONACHI_PREV_VALUE DWORD 1
	TRIBONACHI_PREV_PREV_VALUE DWORD 1
	TRIBONACHI_SUM DWORD 0

.code
myMain PROC
	; Initialize edx,ecx
	mov edx,OFFSET STUDENT
	call writeString
	mov edx, OFFSET separator
	mov ecx,N-2
	; Printing first two elements of tri-bonachi series
	mov eax,TRIBONACHI_PREV_PREV_VALUE
	call writeDec
	add TRIBONACHI_SUM,eax
	call writeString
	mov eax,TRIBONACHI_PREV_PREV_VALUE
	call writeDec
	add TRIBONACHI_SUM,eax
	
	tribonachiLoop:
		; Loop order: seperator, add the 2nd previous element, add the previous element twice,
		; print the current element, add to sum, prepare for next iteration
		call writeString
		mov eax,0
		add eax,TRIBONACHI_PREV_PREV_VALUE
		add eax,TRIBONACHI_PREV_VALUE
		add eax,TRIBONACHI_PREV_VALUE
		call writeDec
		add TRIBONACHI_SUM,eax
		; Prepare the next iteration: move 2nd previous to previous, move current element to previous
		mov ebx,TRIBONACHI_PREV_VALUE
		mov TRIBONACHI_PREV_PREV_VALUE,ebx
		mov TRIBONACHI_PREV_VALUE,eax
		loop tribonachiLoop
		
	; Print the sum of the series
	mov al,NEWLINE
	call writeChar
	mov edx,OFFSET msg
	call writeString
	mov eax,TRIBONACHI_SUM
	call writeDec
	mov al,NEWLINE
	call writeChar
	
	exit
myMain ENDP
END myMain