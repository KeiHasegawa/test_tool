CONST SEGMENT
LC$0:
	;"r = %d\n"
	BYTE	114
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	100
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$1:
	DD	0
	DD	0
CONST ENDS
CONST SEGMENT
LC$2:
	DD	1
	DD	0
CONST ENDS
CONST SEGMENT
LC$3:
	DD	-1
	DD	-1
CONST ENDS
CONST SEGMENT
LC$4:
	DD	2
	DD	0
CONST ENDS
CONST SEGMENT
LC$5:
	DD	0
	DD	0
CONST ENDS
CONST SEGMENT
LC$6:
	DD	0
	DD	0
CONST ENDS
CONST SEGMENT
LC$7:
	DD	1
	DD	0
CONST ENDS
_BSS SEGMENT
buf DB 256 DUP (?)
_BSS ENDS
_TEXT SEGMENT
printf	PROC
	; enter
	push 	rbp
	push	rbx
	mov 	rbp, rsp
	; parameter registers are saved
	mov 	QWORD PTR [rbp+24], rcx
	mov 	[rbp+32], rdx
	mov 	[rbp+40], r8
	mov 	[rbp+48], r9

	sub 	rsp, 136
	; _ArgList := va_start _Format
	lea 	rax, QWORD PTR [rbp+24]
	add 	rax, 8
	mov 	QWORD PTR [rbp-16], rax
	; param .integer1
	mov	eax, 1
	mov 	ecx, eax
	; .var0000015D590EA990 := call __acrt_iob_func
	call	__acrt_iob_func
	mov 	QWORD PTR [rbp-24], rax
	; _Format := _Format
	mov 	rax, QWORD PTR [rbp+24]
	mov 	QWORD PTR [rbp-40], rax
	; _ArgList := _ArgList
	mov 	rax, QWORD PTR [rbp-16]
	mov 	QWORD PTR [rbp-56], rax
	; _Stream := .var0000015D590EA990
	mov 	rax, QWORD PTR [rbp-24]
	mov 	QWORD PTR [rbp-32], rax
	; _Locale := .pointer0
	lea 	rax, 	LC$5
	mov 	rax, QWORD PTR [rax]
	mov 	QWORD PTR [rbp-48], rax
	; .var0000015D590EB350 := call __local_stdio_printf_options
	call	__local_stdio_printf_options
	mov 	QWORD PTR [rbp-64], rax
	; .var0000015D590EB4D0 := *.var0000015D590EB350
	mov 	rax, QWORD PTR [rbp-64]
	mov	rax, [rax]
	mov 	QWORD PTR [rbp-72], rax
	; param .var0000015D590EB4D0
	mov 	rax, QWORD PTR [rbp-72]
	mov 	rcx, rax
	; param _Stream
	mov 	rax, QWORD PTR [rbp-32]
	mov 	rdx, rax
	; param _Format
	mov 	rax, QWORD PTR [rbp-40]
	mov 	r8, rax
	; param _Locale
	mov 	rax, QWORD PTR [rbp-48]
	mov 	r9, rax
	; param _ArgList
	mov 	rax, QWORD PTR [rbp-56]
	mov 	QWORD PTR [rsp+32], rax
	; .var0000015D590EA4B0 := call __stdio_common_vfprintf
	call	__stdio_common_vfprintf
	mov 	DWORD PTR [rbp-76], eax
	; return .var0000015D590EA4B0
	mov 	eax, DWORD PTR [rbp-76]
	; leave
	mov 	rsp, rbp
	pop	rbx
	pop	rbp
	ret
printf	ENDP
_TEXT ENDS
_TEXT SEGMENT
	PUBLIC	_test_main
_test_main	PROC
	; enter
	push 	rbp
	push	rbx
	sub 	rsp, 108h
	lea	rbp, [rsp+20h]

	mov     rdi,rsp  
	mov         ecx,42h  
	mov         eax,0CCCCCCCCh  
	rep stos    dword ptr [rdi]  
	; lea         rcx,[__8B65E7F2_a@c (07FF60BF81003h)] 
;
;	mov		rdi, rsp
;	add		rdi, 108h
;

	; .var0000015D59230598 := &buf
	lea 	rbx, buf
	mov 	QWORD PTR [rbp-8], rbx
	; param .var0000015D59230598
	mov 	rax, QWORD PTR [rbp-8]
	mov 	rcx, rax
	; ????
	mov         rdx,rbp
	add         rdx,0FFFFFFFFFFFFFFE0h
	call        _setjmp
	mov 	DWORD PTR [rbp-12], eax
	; r := call _setjmp
	; call	_setjmp
	; mov 	DWORD PTR [rbp-12], eax
	; if r != 0 goto label0000015D591D8600
	mov 	eax, DWORD PTR [rbp-12]
	cmp	eax, 0
	jne	_test_main0000015D591D8600$
	; .var0000015D5922EAC8 := &buf
	lea 	rbx, buf
	mov 	QWORD PTR [rbp-8], rbx
	; param .var0000015D5922EAC8
	mov 	rax, QWORD PTR [rbp-8]
	mov 	rcx, rax
	; param 4
	mov	eax, 4
	mov 	edx, eax
	; call longjmp
	call	longjmp
	; label0000015D591D8600:
_test_main0000015D591D8600$:
	; return 0
	mov	eax, 0
	; leave
	lea 	rsp, [rbp+0E8h]
	pop	rbx
	pop	rbp
	ret
_test_main	ENDP
_TEXT ENDS
EXTERN __acrt_iob_func:PROC
EXTERN __local_stdio_printf_options:PROC
EXTERN __stdio_common_vfprintf:PROC
EXTERN _setjmp:PROC
EXTERN longjmp:PROC
END
s
