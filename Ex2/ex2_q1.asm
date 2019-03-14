COMMENT! Alon Hartanu, id: 305143422
	This program sum 3 vectors.
!

INCLUDE Irvine32.inc
INCLUDE ex2_q1_data.inc

.data
	Student BYTE "Alon Hartanu, ID 305143422 Ex2-Q1",10,13,0
	BvecPTR DWORD OFFSET Bvec
	WvecPTR	DWORD OFFSET Wvec
	DvecPTR DWORD OFFSET Dvec

.code
Main PROC
	mov edx,OFFSET Student
	call writeString
	mov ecx,lengthOf Bvec
	mov edi,OFFSET SumVec
	mov eax,0
	sum_loop:
		mov ebx,BvecPTR
		movzx eax,BYTE PTR [ebx]
		mov [edi],eax
		add BvecPTR,1
		mov ebx,WvecPTR
		movsx eax,SWORD PTR [ebx]
		add [edi],eax
		add WvecPTR,2
		mov ebx,DvecPTR
		mov eax,SDWORD PTR [ebx]
		add [edi],eax
		add DvecPTR,4
		add edi,4
		loop sum_loop
	mov ecx,lengthOf SumVec
	mov edi,OFFSET SumVec
	mov edx,OFFSET msg1
	call writeString
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
END main