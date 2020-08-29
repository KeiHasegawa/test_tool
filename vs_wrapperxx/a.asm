	.model	flat
CONST SEGMENT
LC$0:
	;"*res = %ld\n"
	BYTE	42
	BYTE	114
	BYTE	101
	BYTE	115
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	108
	BYTE	100
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$1:
	;"++a = %d\n"
	BYTE	43
	BYTE	43
	BYTE	97
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	100
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$2:
	;"--a = %d\n"
	BYTE	45
	BYTE	45
	BYTE	97
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	100
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$3:
	;"a = %d\n"
	BYTE	97
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	100
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$4:
	;"c = '%c'\n"
	BYTE	99
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	39
	BYTE	37
	BYTE	99
	BYTE	39
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$5:
	;"d = %f\n"
	BYTE	100
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	102
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$6:
	;"ef = %f\n"
	BYTE	101
	BYTE	102
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	102
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$7:
	;"error\n"
	BYTE	101
	BYTE	114
	BYTE	114
	BYTE	111
	BYTE	114
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$8:
	;"f called\n"
	BYTE	102
	BYTE	32
	BYTE	99
	BYTE	97
	BYTE	108
	BYTE	108
	BYTE	101
	BYTE	100
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$9:
	;"i = %d\n"
	BYTE	105
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	100
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$10:
	;"l = %ld\n"
	BYTE	108
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	108
	BYTE	100
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$11:
	;"ok\n"
	BYTE	111
	BYTE	107
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$12:
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
LC$13:
	;"sizeof(signed char) = %d\n"
	BYTE	115
	BYTE	105
	BYTE	122
	BYTE	101
	BYTE	111
	BYTE	102
	BYTE	40
	BYTE	115
	BYTE	105
	BYTE	103
	BYTE	110
	BYTE	101
	BYTE	100
	BYTE	32
	BYTE	99
	BYTE	104
	BYTE	97
	BYTE	114
	BYTE	41
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	100
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$14:
	;"t.a = %d\n"
	BYTE	116
	BYTE	46
	BYTE	97
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	100
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$15:
	;"t.b = %f\n"
	BYTE	116
	BYTE	46
	BYTE	98
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	102
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$16:
	;"uni.a = 0x%x\n"
	BYTE	117
	BYTE	110
	BYTE	105
	BYTE	46
	BYTE	97
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	48
	BYTE	120
	BYTE	37
	BYTE	120
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$17:
	;"vi = %d\n"
	BYTE	118
	BYTE	105
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	100
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$18:
	;"w = %d\n"
	BYTE	119
	BYTE	32
	BYTE	61
	BYTE	32
	BYTE	37
	BYTE	100
	BYTE	10
	BYTE	0
CONST ENDS
CONST SEGMENT
LC$19:
	DD	1
	DD	0
CONST ENDS
CONST SEGMENT
LC$20:
	DD	2
	DD	0
CONST ENDS
CONST SEGMENT
LC$21 	DD	0
	DD	1072693248
CONST ENDS
CONST SEGMENT
LC$22 	DD	0
	DD	1073217536
CONST ENDS
CONST SEGMENT
LC$23:
	DD	1
	DD	0
CONST ENDS
CONST SEGMENT
LC$24 	DD	0
	DD	1073741824
CONST ENDS
_TEXT SEGMENT
_printf	PROC
	; enter
	push 	ebp
	mov 	ebp, esp
	push 	ebx
	sub 	esp, 80
	; .var0x800117830 := &_Format
	lea 	ebx, DWORD PTR [ebp+12]
	mov 	DWORD PTR [ebp-12], ebx
	; .var0x80011b270 := (char *).var0x800117830
	mov 	eax, DWORD PTR [ebp-12]
	mov 	DWORD PTR [ebp-16], eax
	; _ArgList := .var0x80011b270 + .integer3
	mov 	eax, DWORD PTR [ebp-16]
	add 	eax, 4
	mov 	DWORD PTR [ebp-8], eax
	; param .integer2
	mov	eax, 1
	mov	DWORD PTR 0[esp], eax
	; .var0x80011c230 := call __acrt_iob_func
	call	___acrt_iob_func
	mov 	DWORD PTR [ebp-20], eax
	; _Format := _Format
	mov 	eax, DWORD PTR [ebp+12]
	mov 	DWORD PTR [ebp-28], eax
	; _ArgList := _ArgList
	mov 	eax, DWORD PTR [ebp-8]
	mov 	DWORD PTR [ebp-36], eax
	; _Stream := .var0x80011c230
	mov 	eax, DWORD PTR [ebp-20]
	mov 	DWORD PTR [ebp-24], eax
	; _Locale := .pointer1
	mov	eax, 0
	mov 	DWORD PTR [ebp-32], eax
	; .var0x80011bf70 := call __local_stdio_printf_options
	call	___local_stdio_printf_options
	mov 	DWORD PTR [ebp-40], eax
	; .var0x80011c8e0 := *.var0x80011bf70
	mov 	eax, DWORD PTR [ebp-40]
	mov	edx, [eax+4]
	mov	eax, [eax]
	mov	DWORD PTR [ebp-48], eax
	mov	DWORD PTR [ebp-44], edx
	; param .var0x80011c8e0
	mov	eax, DWORD PTR [ebp-48]
	mov	edx, DWORD PTR [ebp-44]
	mov	 DWORD PTR 0[esp], eax
	mov	 DWORD PTR 4[esp], edx
	; param _Stream
	mov 	eax, DWORD PTR [ebp-24]
	mov	DWORD PTR 8[esp], eax
	; param _Format
	mov 	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR 12[esp], eax
	; param _Locale
	mov 	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR 16[esp], eax
	; param _ArgList
	mov 	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR 20[esp], eax
	; .var0x80011c8c0 := call __stdio_common_vfprintf
	call	___stdio_common_vfprintf
	mov 	DWORD PTR [ebp-52], eax
	; return .var0x80011c8c0
	mov 	eax, DWORD PTR [ebp-52]
	; leave
	mov 	esp, ebp
	sub 	esp , 4
	pop 	ebx
	pop 	ebp
	ret
_printf	ENDP
_TEXT ENDS
_BSS SEGMENT
COMM	_uni$25:DWORD
_BSS ENDS
_TEXT SEGMENT
	PUBLIC	?_test_main@@YAHHPAPAD@Z
?_test_main@@YAHHPAPAD@Z	PROC
	; enter
	push 	ebp
	mov 	ebp, esp
	push 	ebx
	sub 	esp, 192
	; a := 1
	mov	eax, 1
	mov 	DWORD PTR [ebp-8], eax
	; .var0x800168848 := &"a = %d\n"
	lea 	ebx, LC$3
	mov 	DWORD PTR [ebp-28], ebx
	; param .var0x800168848
	mov 	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR 0[esp], eax
	; param 1
	mov	eax, 1
	mov	DWORD PTR 4[esp], eax
	; call printf
	call	_printf
	; goto label0x800169b30
	jmp	__test_main0x800169b30$
	; label0x800168c70:
__test_main0x800168c70$:
	; .var0x800169168 := &"ok\n"
	lea 	ebx, LC$11
	mov 	DWORD PTR [ebp-144], ebx
	; param .var0x800169168
	mov 	eax, DWORD PTR [ebp-144]
	mov	DWORD PTR 0[esp], eax
	; call printf
	call	_printf
	; goto label0x800169c30
	jmp	__test_main0x800169c30$
	; label0x8001693b0:
__test_main0x8001693b0$:
	; .var0x800169848 := &"error\n"
	lea 	ebx, LC$7
	mov 	DWORD PTR [ebp-148], ebx
	; param .var0x800169848
	mov 	eax, DWORD PTR [ebp-148]
	mov	DWORD PTR 0[esp], eax
	; call printf
	call	_printf
	; goto label0x800169c30
	jmp	__test_main0x800169c30$
	; goto label0x800169c30
	jmp	__test_main0x800169c30$
	; label0x800169b30:
__test_main0x800169b30$:
	; if a == 1 goto label0x800168c70
	mov 	eax, DWORD PTR [ebp-8]
	cmp	eax, 1
	je	__test_main0x800168c70$
	; goto label0x8001693b0
	jmp	__test_main0x8001693b0$
	; label0x800169c30:
__test_main0x800169c30$:
	; .var0x80016a4d8 := &"c = '%c'\n"
	lea 	ebx, LC$4
	mov 	DWORD PTR [ebp-32], ebx
	; .var0x80016a660 := (int)'c'
	mov	eax, 99
	movsx	eax, al
	mov 	DWORD PTR [ebp-36], eax
	; param .var0x80016a4d8
	mov 	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR 0[esp], eax
	; param .var0x80016a660
	mov 	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR 4[esp], eax
	; call printf
	call	_printf
	; .var0x80016ae58 := &"d = %f\n"
	lea 	ebx, LC$5
	mov 	DWORD PTR [ebp-40], ebx
	; param .var0x80016ae58
	mov 	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR 0[esp], eax
	; param 1.5
	lea	eax, LC$22
	fld	QWORD PTR [eax]
	fstp	QWORD PTR 4[esp]
	; call printf
	call	_printf
	; i := 0
	mov	eax, 0
	mov 	DWORD PTR [ebp-152], eax
	; label0x80016b280:
__test_main0x80016b280$:
	; if i >= 2 goto label0x80016b580
	mov 	eax, DWORD PTR [ebp-152]
	cmp	eax, 2
	jge	__test_main0x80016b580$
	; if i != 0 goto label0x80016b980
	mov 	eax, DWORD PTR [ebp-152]
	cmp	eax, 0
	jne	__test_main0x80016b980$
	; goto label0x80016c450
	jmp	__test_main0x80016c450$
	; goto label0x80016ba40
	jmp	__test_main0x80016ba40$
	; label0x80016b980:
__test_main0x80016b980$:
	; .var0x80016c168 := &"i = %d\n"
	lea 	ebx, LC$9
	mov 	DWORD PTR [ebp-156], ebx
	; param .var0x80016c168
	mov 	eax, DWORD PTR [ebp-156]
	mov	DWORD PTR 0[esp], eax
	; param i
	mov 	eax, DWORD PTR [ebp-152]
	mov	DWORD PTR 4[esp], eax
	; call printf
	call	_printf
	; label0x80016ba40:
__test_main0x80016ba40$:
	; label0x80016c450:
__test_main0x80016c450$:
	; i := i + 1
	mov 	eax, DWORD PTR [ebp-152]
	add 	eax, 1
	mov 	DWORD PTR [ebp-152], eax
	; goto label0x80016b280
	jmp	__test_main0x80016b280$
	; label0x80016b580:
__test_main0x80016b580$:
	; label0x80016b320:
__test_main0x80016b320$:
	; a := a + 1
	mov 	eax, DWORD PTR [ebp-8]
	add 	eax, 1
	mov 	DWORD PTR [ebp-8], eax
	; .var0x80016c9b8 := &"++a = %d\n"
	lea 	ebx, LC$1
	mov 	DWORD PTR [ebp-160], ebx
	; param .var0x80016c9b8
	mov 	eax, DWORD PTR [ebp-160]
	mov	DWORD PTR 0[esp], eax
	; param a
	mov 	eax, DWORD PTR [ebp-8]
	mov	DWORD PTR 4[esp], eax
	; call printf
	call	_printf
	; if a == 3 goto label0x80016b320
	mov 	eax, DWORD PTR [ebp-8]
	cmp	eax, 3
	je	__test_main0x80016b320$
	; label0x80016d120:
__test_main0x80016d120$:
	; if a == 0 goto label0x80016daf0
	mov 	eax, DWORD PTR [ebp-8]
	cmp	eax, 0
	je	__test_main0x80016daf0$
	; a := a - 1
	mov 	eax, DWORD PTR [ebp-8]
	sub 	eax, 1
	mov 	DWORD PTR [ebp-8], eax
	; .var0x80016d838 := &"--a = %d\n"
	lea 	ebx, LC$2
	mov 	DWORD PTR [ebp-44], ebx
	; param .var0x80016d838
	mov 	eax, DWORD PTR [ebp-44]
	mov	DWORD PTR 0[esp], eax
	; param a
	mov 	eax, DWORD PTR [ebp-8]
	mov	DWORD PTR 4[esp], eax
	; call printf
	call	_printf
	; goto label0x80016d120
	jmp	__test_main0x80016d120$
	; label0x80016daf0:
__test_main0x80016daf0$:
	; .var0x80016e7f8 := &"w = %d\n"
	lea 	ebx, LC$18
	mov 	DWORD PTR [ebp-48], ebx
	; param .var0x80016e7f8
	mov 	eax, DWORD PTR [ebp-48]
	mov	DWORD PTR 0[esp], eax
	; param 2
	mov	eax, 2
	mov	DWORD PTR 4[esp], eax
	; call printf
	call	_printf
	; .var0x80016f018 := &"ef = %f\n"
	lea 	ebx, LC$6
	mov 	DWORD PTR [ebp-52], ebx
	; .var0x80016f160 := (double)ef
	lea 	eax, _ef
	fld	DWORD PTR [eax]
	fstp 	QWORD PTR [ebp-64]
	; param .var0x80016f018
	mov 	eax, DWORD PTR [ebp-52]
	mov	DWORD PTR 0[esp], eax
	; param .var0x80016f160
	fld	QWORD PTR [ebp-64]
	fstp	QWORD PTR 4[esp]
	; call printf
	call	_printf
	; goto label0x80016f6a0
	jmp	__test_main0x80016f6a0$
	; .var0x80016f4e8 := &"error\n"
	lea 	ebx, LC$7
	mov 	DWORD PTR [ebp-68], ebx
	; param .var0x80016f4e8
	mov 	eax, DWORD PTR [ebp-68]
	mov	DWORD PTR 0[esp], eax
	; call printf
	call	_printf
	; label0x80016f6a0:
__test_main0x80016f6a0$:
	; .var0x80016f680 := &"f called\n"
	lea 	ebx, LC$8
	mov 	DWORD PTR [ebp-164], ebx
	; param .var0x80016f680
	mov 	eax, DWORD PTR [ebp-164]
	mov	DWORD PTR 0[esp], eax
	; call printf
	call	_printf
	; l := .integer37
	mov	eax, 10
	mov 	DWORD PTR [ebp-12], eax
	; .var0x800170118 := &"l = %ld\n"
	lea 	ebx, LC$10
	mov 	DWORD PTR [ebp-72], ebx
	; param .var0x800170118
	mov 	eax, DWORD PTR [ebp-72]
	mov	DWORD PTR 0[esp], eax
	; param .integer37
	mov	eax, 10
	mov	DWORD PTR 4[esp], eax
	; call printf
	call	_printf
	; .var0x800170b48 := &"r = %d\n"
	lea 	ebx, LC$12
	mov 	DWORD PTR [ebp-76], ebx
	; .var0x800170c50 := (int).integer38
	mov	eax, 5
	movsx	eax, ax
	mov 	DWORD PTR [ebp-80], eax
	; param .var0x800170b48
	mov 	eax, DWORD PTR [ebp-76]
	mov	DWORD PTR 0[esp], eax
	; param .var0x800170c50
	mov 	eax, DWORD PTR [ebp-80]
	mov	DWORD PTR 4[esp], eax
	; call printf
	call	_printf
	; .var0x800170fd0 := &l
	lea 	ebx, DWORD PTR [ebp-12]
	mov 	DWORD PTR [ebp-84], ebx
	; .var0x800171958 := &"*res = %ld\n"
	lea 	ebx, LC$0
	mov 	DWORD PTR [ebp-88], ebx
	; .var0x800171b20 := *.var0x800170fd0
	mov 	eax, DWORD PTR [ebp-84]
	mov	eax, [eax]
	mov 	DWORD PTR [ebp-92], eax
	; param .var0x800171958
	mov 	eax, DWORD PTR [ebp-88]
	mov	DWORD PTR 0[esp], eax
	; param .var0x800171b20
	mov 	eax, DWORD PTR [ebp-92]
	mov	DWORD PTR 4[esp], eax
	; call printf
	call	_printf
	; .var0x800172cd8 := &"sizeof(signed char) = %d\n"
	lea 	ebx, LC$13
	mov 	DWORD PTR [ebp-96], ebx
	; param .var0x800172cd8
	mov 	eax, DWORD PTR [ebp-96]
	mov	DWORD PTR 0[esp], eax
	; param 1
	mov	eax, 1
	mov	DWORD PTR 4[esp], eax
	; call printf
	call	_printf
	; uni[0] := .float47
	mov	eax, 1065353216
	lea 	ebx, _uni$25
	mov	DWORD PTR [ebx], eax
	; .var0x800173f38 := &"uni.a = 0x%x\n"
	lea 	ebx, LC$16
	mov 	DWORD PTR [ebp-100], ebx
	; .var0x80016cd10 := uni[0]
	lea 	eax, _uni$25
	mov 	eax, [eax]
	mov 	DWORD PTR [ebp-104], eax
	; param .var0x800173f38
	mov 	eax, DWORD PTR [ebp-100]
	mov	DWORD PTR 0[esp], eax
	; param .var0x80016cd10
	mov 	eax, DWORD PTR [ebp-104]
	mov	DWORD PTR 4[esp], eax
	; call printf
	call	_printf
	; t[0] := 1
	mov	eax, 1
	mov	DWORD PTR [ebp-24], eax
	; t[4] := .float52
	mov	eax, 1073741824
	mov	DWORD PTR [ebp-20], eax
	; .var0x8001751f8 := &"t.a = %d\n"
	lea 	ebx, LC$14
	mov 	DWORD PTR [ebp-108], ebx
	; .var0x800175300 := t[0]
	mov 	eax, [ebp-24]
	mov 	DWORD PTR [ebp-112], eax
	; param .var0x8001751f8
	mov 	eax, DWORD PTR [ebp-108]
	mov	DWORD PTR 0[esp], eax
	; param .var0x800175300
	mov 	eax, DWORD PTR [ebp-112]
	mov	DWORD PTR 4[esp], eax
	; call printf
	call	_printf
	; .var0x800175b28 := &"t.b = %f\n"
	lea 	ebx, LC$15
	mov 	DWORD PTR [ebp-116], ebx
	; .var0x800175c70 := t[4]
	fld	DWORD PTR [ebp-20]
	fstp 	DWORD PTR [ebp-120]
	; .var0x800175cd0 := (double).var0x800175c70
	fld	DWORD PTR [ebp-120]
	fstp 	QWORD PTR [ebp-128]
	; param .var0x800175b28
	mov 	eax, DWORD PTR [ebp-116]
	mov	DWORD PTR 0[esp], eax
	; param .var0x800175cd0
	fld	QWORD PTR [ebp-128]
	fstp	QWORD PTR 4[esp]
	; call printf
	call	_printf
	; if .integer14 <= .integer11 goto label0x8001760a0
	mov	eax, 4294967295
	cmp	eax, 0
	jbe	__test_main0x8001760a0$
	; .var0x800176298 := &"ok\n"
	lea 	ebx, LC$11
	mov 	DWORD PTR [ebp-132], ebx
	; param .var0x800176298
	mov 	eax, DWORD PTR [ebp-132]
	mov	DWORD PTR 0[esp], eax
	; call printf
	call	_printf
	; goto label0x800176140
	jmp	__test_main0x800176140$
	; label0x8001760a0:
__test_main0x8001760a0$:
	; .var0x800176518 := &"error\n"
	lea 	ebx, LC$7
	mov 	DWORD PTR [ebp-136], ebx
	; param .var0x800176518
	mov 	eax, DWORD PTR [ebp-136]
	mov	DWORD PTR 0[esp], eax
	; call printf
	call	_printf
	; label0x800176140:
__test_main0x800176140$:
	; .var0x800176d28 := &"vi = %d\n"
	lea 	ebx, LC$17
	mov 	DWORD PTR [ebp-140], ebx
	; param .var0x800176d28
	mov 	eax, DWORD PTR [ebp-140]
	mov	DWORD PTR 0[esp], eax
	; param vi
	lea	ebx, _vi
	mov	eax, DWORD PTR [ebx]
	mov	DWORD PTR 4[esp], eax
	; call printf
	call	_printf
	; return 0
	mov	eax, 0
	; leave
	mov 	esp, ebp
	sub 	esp , 4
	pop 	ebx
	pop 	ebp
	ret
?_test_main@@YAHHPAPAD@Z	ENDP
_TEXT ENDS
CONST SEGMENT
LC$26 	DD	0
	DD	1072168960
CONST ENDS
_DATA SEGMENT
	PUBLIC	_ef
_ef:
	DWORD	1061158912
_DATA ENDS
_DATA SEGMENT
	PUBLIC	_vi
_vi:
	DWORD	11
_DATA ENDS
EXTERN ___acrt_iob_func:PROC
EXTERN ___local_stdio_printf_options:PROC
EXTERN ___stdio_common_vfprintf:PROC
END
