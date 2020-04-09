[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_boxfill8
	EXTERN	_putfonts8_asc
	EXTERN	_init_gdtidt
	EXTERN	_init_pic
	EXTERN	_io_sti
	EXTERN	_keyfifo
	EXTERN	_fifo8_init
	EXTERN	_mousefifo
	EXTERN	_io_out8
	EXTERN	_init_keyboard
	EXTERN	_enable_mouse
	EXTERN	_memtest
	EXTERN	_memman_init
	EXTERN	_memman_free
	EXTERN	_init_palette
	EXTERN	_shtctl_init
	EXTERN	_sheet_alloc
	EXTERN	_memman_alloc_4k
	EXTERN	_sheet_setbuf
	EXTERN	_init_screen8
	EXTERN	_init_mouse_cursor8
	EXTERN	_sheet_slide
	EXTERN	_sheet_updown
	EXTERN	_sprintf
	EXTERN	_memman_total
	EXTERN	_sheet_refresh
	EXTERN	_io_cli
	EXTERN	_fifo8_status
	EXTERN	_fifo8_get
	EXTERN	_mouse_decode
	EXTERN	_io_stihlt
[FILE "bootpack.c"]
[SECTION .data]
_closebtn.0:
	DB	"OOOOOOOOOOOOOOO@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"OQQQ@@QQQQ@@QQ$@"
	DB	"OQQQQ@@QQ@@QQQ$@"
	DB	"OQQQQQ@@@@QQQQ$@"
	DB	"OQQQQQQ@@QQQQQ$@"
	DB	"OQQQQQ@@@@QQQQ$@"
	DB	"OQQQQ@@QQ@@QQQ$@"
	DB	"OQQQ@@QQQQ@@QQ$@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"O$$$$$$$$$$$$$$@"
	DB	"@@@@@@@@@@@@@@@@"
[SECTION .text]
	GLOBAL	_make_window8
_make_window8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	SUB	ESP,12
	MOV	EBX,DWORD [12+EBP]
	PUSH	0
	LEA	EAX,DWORD [-1+EBX]
	LEA	EDI,DWORD [-2+EBX]
	PUSH	EAX
	MOV	DWORD [-16+EBP],EAX
	PUSH	0
	PUSH	0
	PUSH	8
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	0
	PUSH	DWORD [-16+EBP]
	PUSH	1
	PUSH	1
	PUSH	7
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	EAX,DWORD [16+EBP]
	ADD	ESP,56
	DEC	EAX
	MOV	DWORD [-20+EBP],EAX
	PUSH	EAX
	PUSH	0
	PUSH	0
	PUSH	0
	PUSH	8
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	ESI,DWORD [16+EBP]
	SUB	ESI,2
	PUSH	ESI
	PUSH	1
	PUSH	1
	PUSH	1
	PUSH	7
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	ESI
	PUSH	EDI
	PUSH	1
	PUSH	EDI
	PUSH	15
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	PUSH	0
	PUSH	DWORD [-16+EBP]
	PUSH	0
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	EAX,DWORD [16+EBP]
	ADD	ESP,56
	SUB	EAX,3
	PUSH	EAX
	LEA	EAX,DWORD [-3+EBX]
	PUSH	EAX
	PUSH	2
	PUSH	2
	PUSH	8
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	LEA	EAX,DWORD [-4+EBX]
	PUSH	20
	PUSH	EAX
	PUSH	3
	PUSH	3
	PUSH	12
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	ESI
	PUSH	EDI
	PUSH	ESI
	PUSH	1
	PUSH	15
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	PUSH	DWORD [-20+EBP]
	PUSH	0
	PUSH	0
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	DWORD [20+EBP]
	PUSH	7
	PUSH	4
	PUSH	24
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_putfonts8_asc
	ADD	ESP,24
	XOR	EDX,EDX
L17:
	XOR	EAX,EAX
L16:
	INC	EAX
	CMP	EAX,15
	JLE	L16
	INC	EDX
	CMP	EDX,13
	JLE	L17
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
[SECTION .data]
LC0:
	DB	"window",0x00
LC1:
	DB	"Welcome to",0x00
LC2:
	DB	"Canopus OS",0x00
LC3:
	DB	"(%3d, %3d)",0x00
LC4:
	DB	"memory %dMB free : %dKB",0x00
LC6:
	DB	"[lcr %4d %4d]",0x00
LC5:
	DB	"%02X",0x00
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	LEA	ESI,DWORD [-732+EBP]
	SUB	ESP,764
	CALL	_init_gdtidt
	CALL	_init_pic
	CALL	_io_sti
	LEA	EAX,DWORD [-348+EBP]
	PUSH	EAX
	PUSH	32
	PUSH	_keyfifo
	CALL	_fifo8_init
	LEA	EAX,DWORD [-476+EBP]
	PUSH	EAX
	PUSH	128
	PUSH	_mousefifo
	CALL	_fifo8_init
	PUSH	249
	PUSH	33
	CALL	_io_out8
	ADD	ESP,32
	PUSH	239
	PUSH	161
	CALL	_io_out8
	CALL	_init_keyboard
	LEA	EAX,DWORD [-748+EBP]
	PUSH	EAX
	CALL	_enable_mouse
	PUSH	-1073741825
	PUSH	4194304
	CALL	_memtest
	PUSH	3932160
	MOV	DWORD [-752+EBP],EAX
	CALL	_memman_init
	PUSH	647168
	PUSH	4096
	PUSH	3932160
	CALL	_memman_free
	MOV	EAX,DWORD [-752+EBP]
	ADD	ESP,36
	SUB	EAX,4194304
	PUSH	EAX
	PUSH	4194304
	PUSH	3932160
	CALL	_memman_free
	CALL	_init_palette
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [4088]
	PUSH	3932160
	CALL	_shtctl_init
	MOV	EBX,EAX
	PUSH	EAX
	CALL	_sheet_alloc
	ADD	ESP,32
	PUSH	EBX
	MOV	DWORD [-756+EBP],EAX
	CALL	_sheet_alloc
	PUSH	EBX
	MOV	DWORD [-760+EBP],EAX
	CALL	_sheet_alloc
	MOVSX	EDX,WORD [4086]
	MOV	DWORD [-764+EBP],EAX
	MOVSX	EAX,WORD [4084]
	IMUL	EAX,EDX
	PUSH	EAX
	PUSH	3932160
	CALL	_memman_alloc_4k
	PUSH	10880
	PUSH	3932160
	MOV	DWORD [-768+EBP],EAX
	CALL	_memman_alloc_4k
	PUSH	-1
	MOV	EBX,EAX
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-768+EBP]
	PUSH	DWORD [-756+EBP]
	CALL	_sheet_setbuf
	ADD	ESP,44
	PUSH	99
	PUSH	16
	PUSH	16
	PUSH	ESI
	PUSH	DWORD [-760+EBP]
	CALL	_sheet_setbuf
	PUSH	-1
	PUSH	68
	PUSH	160
	PUSH	EBX
	PUSH	DWORD [-764+EBP]
	CALL	_sheet_setbuf
	ADD	ESP,40
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-768+EBP]
	CALL	_init_screen8
	PUSH	99
	PUSH	ESI
	CALL	_init_mouse_cursor8
	PUSH	LC0
	PUSH	68
	PUSH	160
	PUSH	EBX
	CALL	_make_window8
	ADD	ESP,36
	PUSH	LC1
	PUSH	0
	PUSH	28
	PUSH	24
	PUSH	160
	PUSH	EBX
	CALL	_putfonts8_asc
	PUSH	LC2
	PUSH	0
	PUSH	44
	PUSH	24
	PUSH	160
	PUSH	EBX
	LEA	EBX,DWORD [-60+EBP]
	CALL	_putfonts8_asc
	ADD	ESP,48
	PUSH	0
	PUSH	0
	PUSH	DWORD [-756+EBP]
	CALL	_sheet_slide
	MOV	ECX,2
	MOV	EAX,DWORD [4084]
	CWD
	IDIV	CX
	CWDE
	LEA	EDI,DWORD [-8+EAX]
	MOV	AX,WORD [4086]
	CWD
	IDIV	CX
	CWDE
	LEA	ESI,DWORD [-8+EAX]
	PUSH	ESI
	PUSH	EDI
	PUSH	DWORD [-760+EBP]
	CALL	_sheet_slide
	PUSH	72
	PUSH	80
	PUSH	DWORD [-764+EBP]
	CALL	_sheet_slide
	ADD	ESP,36
	PUSH	0
	PUSH	DWORD [-756+EBP]
	CALL	_sheet_updown
	PUSH	1
	PUSH	DWORD [-764+EBP]
	CALL	_sheet_updown
	PUSH	2
	PUSH	DWORD [-760+EBP]
	CALL	_sheet_updown
	PUSH	ESI
	PUSH	EDI
	PUSH	LC3
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,40
	PUSH	EBX
	PUSH	7
	PUSH	0
	PUSH	0
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-768+EBP]
	CALL	_putfonts8_asc
	PUSH	3932160
	CALL	_memman_total
	SHR	DWORD [-752+EBP],20
	SHR	EAX,10
	MOV	DWORD [ESP],EAX
	PUSH	DWORD [-752+EBP]
	PUSH	LC4
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,40
	PUSH	EBX
	PUSH	7
	PUSH	32
	PUSH	0
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-768+EBP]
	CALL	_putfonts8_asc
	PUSH	48
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	0
L40:
	PUSH	0
	PUSH	DWORD [-756+EBP]
	CALL	_sheet_refresh
	ADD	ESP,44
L39:
	CALL	_io_cli
	PUSH	_keyfifo
	CALL	_fifo8_status
	PUSH	_mousefifo
	MOV	EBX,EAX
	CALL	_fifo8_status
	LEA	EAX,DWORD [EAX+EBX*1]
	POP	EBX
	POP	EDX
	TEST	EAX,EAX
	JE	L41
	PUSH	_keyfifo
	CALL	_fifo8_status
	POP	ECX
	TEST	EAX,EAX
	JNE	L42
	PUSH	_mousefifo
	CALL	_fifo8_status
	POP	EDX
	TEST	EAX,EAX
	JE	L39
	PUSH	_mousefifo
	CALL	_fifo8_get
	MOV	EBX,EAX
	CALL	_io_sti
	MOVZX	EAX,BL
	PUSH	EAX
	LEA	EAX,DWORD [-748+EBP]
	PUSH	EAX
	CALL	_mouse_decode
	ADD	ESP,12
	TEST	EAX,EAX
	JE	L39
	PUSH	DWORD [-740+EBP]
	PUSH	DWORD [-744+EBP]
	PUSH	LC6
	LEA	EBX,DWORD [-60+EBP]
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,16
	MOV	EAX,DWORD [-736+EBP]
	TEST	EAX,1
	JE	L32
	MOV	BYTE [-59+EBP],76
L32:
	TEST	EAX,2
	JE	L33
	MOV	BYTE [-57+EBP],82
L33:
	AND	EAX,4
	JE	L34
	MOV	BYTE [-58+EBP],67
L34:
	PUSH	31
	PUSH	151
	PUSH	16
	PUSH	32
	PUSH	15
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-768+EBP]
	CALL	_boxfill8
	PUSH	EBX
	PUSH	7
	PUSH	16
	PUSH	32
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-768+EBP]
	CALL	_putfonts8_asc
	ADD	ESP,52
	PUSH	32
	PUSH	152
	PUSH	16
	PUSH	32
	PUSH	DWORD [-756+EBP]
	CALL	_sheet_refresh
	ADD	ESP,20
	ADD	ESI,DWORD [-740+EBP]
	ADD	EDI,DWORD [-744+EBP]
	JS	L43
L35:
	TEST	ESI,ESI
	JS	L44
L36:
	MOVSX	EAX,WORD [4084]
	SUB	EAX,16
	CMP	EDI,EAX
	JLE	L37
	MOV	EDI,EAX
L37:
	MOVSX	EAX,WORD [4086]
	SUB	EAX,16
	CMP	ESI,EAX
	JLE	L38
	MOV	ESI,EAX
L38:
	PUSH	ESI
	PUSH	EDI
	PUSH	LC3
	PUSH	EBX
	CALL	_sprintf
	PUSH	15
	PUSH	79
	PUSH	0
	PUSH	0
	PUSH	8
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-768+EBP]
	CALL	_boxfill8
	ADD	ESP,44
	PUSH	EBX
	PUSH	7
	PUSH	0
	PUSH	0
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-768+EBP]
	CALL	_putfonts8_asc
	PUSH	16
	PUSH	80
	PUSH	0
	PUSH	0
	PUSH	DWORD [-756+EBP]
	CALL	_sheet_refresh
	ADD	ESP,44
	PUSH	ESI
	PUSH	EDI
	PUSH	DWORD [-760+EBP]
	CALL	_sheet_slide
	ADD	ESP,12
	JMP	L39
L44:
	XOR	ESI,ESI
	JMP	L36
L43:
	XOR	EDI,EDI
	JMP	L35
L42:
	PUSH	_keyfifo
	CALL	_fifo8_get
	MOV	EBX,EAX
	CALL	_io_sti
	PUSH	EBX
	LEA	EBX,DWORD [-60+EBP]
	PUSH	LC5
	PUSH	EBX
	CALL	_sprintf
	PUSH	31
	PUSH	15
	PUSH	16
	PUSH	0
	PUSH	15
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-768+EBP]
	CALL	_boxfill8
	ADD	ESP,44
	PUSH	EBX
	PUSH	7
	PUSH	16
	PUSH	0
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-768+EBP]
	CALL	_putfonts8_asc
	PUSH	32
	PUSH	16
	PUSH	16
	JMP	L40
L41:
	CALL	_io_stihlt
	JMP	L39
