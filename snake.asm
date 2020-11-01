		.DATA
timer 		.FILL #150
;;;;;;;;;;;;;;;;;;;;;;;;;;;;printnum;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
printnum
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-13	;; allocate stack space for local variables
	;; function body
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRnp L2_snake
	LEA R7, L4_snake
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L1_snake
L2_snake
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRzp L6_snake
	LDR R7, R5, #3
	NOT R7,R7
	ADD R7,R7,#1
	STR R7, R5, #-13
	JMP L7_snake
L6_snake
	LDR R7, R5, #3
	STR R7, R5, #-13
L7_snake
	LDR R7, R5, #-13
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRzp L8_snake
	LEA R7, L10_snake
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L1_snake
L8_snake
	ADD R7, R5, #-12
	ADD R7, R7, #10
	STR R7, R5, #-2
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	STR R7, R5, #-2
	CONST R3, #0
	STR R3, R7, #0
	JMP L12_snake
L11_snake
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	STR R7, R5, #-2
	LDR R3, R5, #-1
	CONST R2, #10
	MOD R3, R3, R2
	CONST R2, #48
	ADD R3, R3, R2
	STR R3, R7, #0
	LDR R7, R5, #-1
	CONST R3, #10
	DIV R7, R7, R3
	STR R7, R5, #-1
L12_snake
	LDR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRnp L11_snake
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRzp L14_snake
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	STR R7, R5, #-2
	CONST R3, #45
	STR R3, R7, #0
L14_snake
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L1_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;endl;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
endl
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, L17_snake
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L16_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;rand16;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
rand16
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #127
	AND R7, R7, R3
L18_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.DATA
zero 		.FILL #255
		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #255
		.DATA
one 		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.DATA
two 		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.FILL #224
		.FILL #255
		.FILL #255
		.DATA
three 		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.DATA
four 		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #255
		.FILL #3
		.FILL #3
		.FILL #3
		.FILL #3
		.DATA
five 		.FILL #255
		.FILL #255
		.FILL #224
		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.DATA
six 		.FILL #8
		.FILL #24
		.FILL #48
		.FILL #96
		.FILL #253
		.FILL #195
		.FILL #102
		.FILL #60
		.DATA
seven 		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #14
		.FILL #28
		.FILL #56
		.FILL #112
		.FILL #224
		.DATA
eight 		.FILL #255
		.FILL #255
		.FILL #195
		.FILL #255
		.FILL #255
		.FILL #255
		.FILL #195
		.FILL #255
		.DATA
nine 		.FILL #255
		.FILL #255
		.FILL #195
		.FILL #255
		.FILL #255
		.FILL #255
		.FILL #3
		.FILL #255
;;;;;;;;;;;;;;;;;;;;;;;;;;;;init_snake;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
init_snake
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-1
L20_snake
	LDR R7, R5, #-1
	SLL R7, R7, #1
	LEA R3, snake
	ADD R7, R7, R3
	CONST R3, #-100
	STR R3, R7, #0
	LDR R7, R5, #-1
	SLL R7, R7, #1
	LEA R3, snake
	ADD R7, R7, R3
	CONST R3, #-100
	STR R3, R7, #1
L21_snake
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #25
	CMP R7, R3
	BRn L20_snake
	LEA R7, snake_length
	CONST R3, #1
	STR R3, R7, #0
	LEA R7, snake
	CONST R3, #10
	STR R3, R7, #0
	STR R3, R7, #1
	LEA R7, snake_direction
	CONST R3, #3
	STR R3, R7, #0
L19_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;reset_bombs;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
reset_bombs
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-1
L25_snake
	LDR R7, R5, #-1
	SLL R7, R7, #1
	LEA R3, bomb
	ADD R7, R7, R3
	CONST R3, #-100
	STR R3, R7, #0
	LDR R7, R5, #-1
	SLL R7, R7, #1
	LEA R3, bomb
	ADD R7, R7, R3
	CONST R3, #-100
	STR R3, R7, #1
L26_snake
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #5
	CMP R7, R3
	BRn L25_snake
	LEA R7, bombs_count
	CONST R3, #0
	STR R3, R7, #0
L24_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;turn_snake;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
turn_snake
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, snake_direction
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L30_snake
	LDR R7, R5, #3
	CONST R3, #2
	CMP R7, R3
	BRz L30_snake
	LEA R7, snake_direction
	LDR R3, R5, #3
	STR R3, R7, #0
	JMP L31_snake
L30_snake
	LEA R7, snake_direction
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L32_snake
	LDR R7, R5, #3
	CONST R3, #3
	CMP R7, R3
	BRz L32_snake
	LEA R7, snake_direction
	LDR R3, R5, #3
	STR R3, R7, #0
	JMP L33_snake
L32_snake
	LEA R7, snake_direction
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L34_snake
	LDR R7, R5, #3
	CONST R3, #1
	CMP R7, R3
	BRz L34_snake
	LEA R7, snake_direction
	LDR R3, R5, #3
	STR R3, R7, #0
	JMP L35_snake
L34_snake
	LEA R7, snake_direction
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L36_snake
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRz L36_snake
	LEA R7, snake_direction
	LDR R3, R5, #3
	STR R3, R7, #0
L36_snake
L35_snake
L33_snake
L31_snake
L29_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;grow_snake;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
grow_snake
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, snake_length
	LDR R7, R7, #0
	SLL R7, R7, #1
	LEA R3, snake
	ADD R2, R7, R3
	ADD R3, R3, #-2
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R2, #0
	LEA R7, snake_length
	LDR R7, R7, #0
	SLL R7, R7, #1
	LEA R3, snake
	ADD R2, R7, R3
	ADD R3, R3, #-2
	ADD R7, R7, R3
	LDR R7, R7, #1
	STR R7, R2, #1
	LEA R7, snake_length
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L38_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;move_snake;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
move_snake
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-7	;; allocate stack space for local variables
	;; function body
	LEA R7, snake
	LDR R7, R7, #0
	STR R7, R5, #-4
	LEA R7, snake
	LDR R7, R7, #1
	STR R7, R5, #-5
	LEA R7, snake_direction
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L40_snake
	LDR R7, R5, #-5
	ADD R7, R7, #-1
	STR R7, R5, #-3
	LDR R7, R5, #-4
	STR R7, R5, #-2
L40_snake
	LEA R7, snake_direction
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L42_snake
	LDR R7, R5, #-5
	ADD R7, R7, #1
	STR R7, R5, #-3
	LDR R7, R5, #-4
	STR R7, R5, #-2
L42_snake
	LEA R7, snake_direction
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L44_snake
	LDR R7, R5, #-5
	STR R7, R5, #-3
	LDR R7, R5, #-4
	ADD R7, R7, #-1
	STR R7, R5, #-2
L44_snake
	LEA R7, snake_direction
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L46_snake
	LDR R7, R5, #-5
	STR R7, R5, #-3
	LDR R7, R5, #-4
	ADD R7, R7, #1
	STR R7, R5, #-2
L46_snake
	LDR R7, R5, #-2
	STR R7, R5, #-6
	CONST R3, #16
	CMP R7, R3
	BRzp L50_snake
	CONST R7, #0
	LDR R3, R5, #-6
	CMP R3, R7
	BRzp L48_snake
L50_snake
	CONST R7, #0
	JMP L39_snake
L48_snake
	LDR R7, R5, #-3
	STR R7, R5, #-7
	CONST R3, #15
	CMP R7, R3
	BRzp L53_snake
	CONST R7, #0
	LDR R3, R5, #-7
	CMP R3, R7
	BRzp L51_snake
L53_snake
	CONST R7, #0
	JMP L39_snake
L51_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	ADD R7, R7, #-1
	STR R7, R5, #-1
	JMP L57_snake
L54_snake
	LDR R7, R5, #-1
	SLL R7, R7, #1
	LEA R3, snake
	ADD R2, R7, R3
	ADD R3, R3, #-2
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R2, #0
	LDR R7, R5, #-1
	SLL R7, R7, #1
	LEA R3, snake
	ADD R2, R7, R3
	ADD R3, R3, #-2
	ADD R7, R7, R3
	LDR R7, R7, #1
	STR R7, R2, #1
L55_snake
	LDR R7, R5, #-1
	ADD R7, R7, #-1
	STR R7, R5, #-1
L57_snake
	LDR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRp L54_snake
	LEA R7, snake
	LDR R3, R5, #-2
	STR R3, R7, #0
	LDR R3, R5, #-3
	STR R3, R7, #1
	CONST R7, #1
L39_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;spawn_fruit;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
spawn_fruit
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-7	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-4
	JMP L60_snake
L59_snake
	CONST R7, #1
	STR R7, R5, #-4
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-5
	LDR R7, R5, #-5
	CONST R3, #16
	MOD R7, R7, R3
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #15
	CMP R7, R3
	BRnp L62_snake
	CONST R7, #14
	STR R7, R5, #-2
L62_snake
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-6
	LDR R7, R5, #-6
	CONST R3, #16
	MOD R7, R7, R3
	STR R7, R5, #-3
	CONST R7, #0
	STR R7, R5, #-1
	JMP L67_snake
L64_snake
	LDR R7, R5, #-1
	SLL R7, R7, #1
	LEA R3, bomb
	ADD R7, R7, R3
	STR R7, R5, #-7
	LDR R3, R7, #0
	LDR R2, R5, #-3
	CMP R3, R2
	BRnp L68_snake
	LDR R7, R5, #-7
	LDR R7, R7, #1
	LDR R3, R5, #-2
	CMP R7, R3
	BRnp L68_snake
	CONST R7, #0
	STR R7, R5, #-4
L68_snake
L65_snake
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L67_snake
	LDR R7, R5, #-1
	LEA R3, bombs_count
	LDR R3, R3, #0
	CMP R7, R3
	BRn L64_snake
L60_snake
	LDR R7, R5, #-4
	CONST R3, #0
	CMP R7, R3
	BRz L59_snake
	LEA R7, fruit
	LDR R3, R5, #-3
	STR R3, R7, #0
	LDR R3, R5, #-2
	STR R3, R7, #1
L58_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;spawn_bomb;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
spawn_bomb
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-7	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-4
	JMP L72_snake
L71_snake
	CONST R7, #1
	STR R7, R5, #-4
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-5
	LDR R7, R5, #-5
	CONST R3, #16
	MOD R7, R7, R3
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #15
	CMP R7, R3
	BRnp L74_snake
	CONST R7, #14
	STR R7, R5, #-2
L74_snake
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-6
	LDR R7, R5, #-6
	CONST R3, #16
	MOD R7, R7, R3
	STR R7, R5, #-3
	CONST R7, #0
	STR R7, R5, #-1
	JMP L79_snake
L76_snake
	LDR R7, R5, #-1
	SLL R7, R7, #1
	LEA R3, bomb
	ADD R7, R7, R3
	STR R7, R5, #-7
	LDR R3, R7, #0
	LDR R2, R5, #-3
	CMP R3, R2
	BRnp L80_snake
	LDR R7, R5, #-7
	LDR R7, R7, #1
	LDR R3, R5, #-2
	CMP R7, R3
	BRnp L80_snake
	CONST R7, #0
	STR R7, R5, #-4
L80_snake
L77_snake
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L79_snake
	LDR R7, R5, #-1
	LEA R3, bombs_count
	LDR R3, R3, #0
	CMP R7, R3
	BRn L76_snake
	LEA R7, fruit
	STR R7, R5, #-7
	LDR R3, R7, #0
	LDR R2, R5, #-3
	CMP R3, R2
	BRnp L82_snake
	LDR R7, R5, #-7
	LDR R7, R7, #1
	LDR R3, R5, #-2
	CMP R7, R3
	BRnp L82_snake
	CONST R7, #0
	STR R7, R5, #-4
L82_snake
L72_snake
	LDR R7, R5, #-4
	CONST R3, #0
	CMP R7, R3
	BRz L71_snake
	LEA R7, bombs_count
	LDR R7, R7, #0
	SLL R7, R7, #1
	LEA R3, bomb
	ADD R7, R7, R3
	LDR R3, R5, #-3
	STR R3, R7, #0
	LEA R7, bombs_count
	LDR R7, R7, #0
	SLL R7, R7, #1
	LEA R3, bomb
	ADD R7, R7, R3
	LDR R3, R5, #-2
	STR R3, R7, #1
	LEA R7, bombs_count
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L70_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;check_bomb_collision;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
check_bomb_collision
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-2	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-1
	JMP L88_snake
L85_snake
	LDR R7, R5, #-1
	SLL R7, R7, #1
	LEA R3, bomb
	ADD R7, R7, R3
	STR R7, R5, #-2
	LEA R3, snake
	LDR R2, R7, #0
	LDR R1, R3, #0
	CMP R2, R1
	BRnp L89_snake
	LDR R7, R5, #-2
	LDR R7, R7, #1
	LDR R3, R3, #1
	CMP R7, R3
	BRnp L89_snake
	CONST R7, #2
	JMP L84_snake
L89_snake
L86_snake
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L88_snake
	LDR R7, R5, #-1
	LEA R3, bombs_count
	LDR R3, R3, #0
	CMP R7, R3
	BRn L85_snake
	CONST R7, #0
L84_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;check_fruit_collision;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
check_fruit_collision
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	LEA R7, snake
	STR R7, R5, #-1
	LEA R3, fruit
	LDR R2, R7, #0
	LDR R1, R3, #0
	CMP R2, R1
	BRnp L92_snake
	LDR R7, R5, #-1
	LDR R7, R7, #1
	LDR R3, R3, #1
	CMP R7, R3
	BRnp L92_snake
	CONST R7, #3
	JMP L91_snake
L92_snake
	CONST R7, #0
L91_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;check_self_collision;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
check_self_collision
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-4	;; allocate stack space for local variables
	;; function body
	LEA R7, snake
	LDR R7, R7, #0
	STR R7, R5, #-2
	LEA R7, snake
	LDR R7, R7, #1
	STR R7, R5, #-3
	CONST R7, #1
	STR R7, R5, #-1
	JMP L98_snake
L95_snake
	LDR R7, R5, #-1
	SLL R7, R7, #1
	LEA R3, snake
	ADD R7, R7, R3
	STR R7, R5, #-4
	LDR R3, R7, #0
	LDR R2, R5, #-2
	CMP R3, R2
	BRnp L99_snake
	LDR R7, R5, #-4
	LDR R7, R7, #1
	LDR R3, R5, #-3
	CMP R7, R3
	BRnp L99_snake
	CONST R7, #4
	JMP L94_snake
L99_snake
L96_snake
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L98_snake
	LDR R7, R5, #-1
	LEA R3, snake_length
	LDR R3, R3, #0
	CMP R7, R3
	BRn L95_snake
	CONST R7, #0
L94_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;handle_collisions;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
handle_collisions
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-4	;; allocate stack space for local variables
	;; function body
	JSR check_bomb_collision
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	JSR check_fruit_collision
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-2
	JSR check_self_collision
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-3
	CONST R7, #0
	STR R7, R5, #-4
	LDR R3, R5, #-1
	CMP R3, R7
	BRnp L102_snake
	LDR R7, R5, #-2
	LDR R3, R5, #-4
	CMP R7, R3
	BRnp L102_snake
	LDR R7, R5, #-3
	LDR R3, R5, #-4
	CMP R7, R3
	BRnp L102_snake
	CONST R7, #0
	JMP L101_snake
L102_snake
	LDR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRz L104_snake
	LDR R7, R5, #-1
	JMP L101_snake
L104_snake
	LDR R7, R5, #-2
	CONST R3, #0
	CMP R7, R3
	BRz L106_snake
	LDR R7, R5, #-2
	JMP L101_snake
L106_snake
	LDR R7, R5, #-3
	CONST R3, #0
	CMP R7, R3
	BRz L108_snake
	LDR R7, R5, #-3
	JMP L101_snake
L108_snake
	CONST R7, #0
L101_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;update_game_state;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
update_game_state
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-2	;; allocate stack space for local variables
	;; function body
	JSR move_snake
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #0
	CMP R7, R3
	BRnp L111_snake
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR printnum
	ADD R6, R6, #1	;; free space for arguments
	CONST R7, #2
	JMP L110_snake
L111_snake
	JSR handle_collisions
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #2
	CMP R7, R3
	BRnp L113_snake
	CONST R7, #200
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR printnum
	ADD R6, R6, #1	;; free space for arguments
	CONST R7, #2
	JMP L110_snake
L113_snake
	LDR R7, R5, #-1
	CONST R3, #3
	CMP R7, R3
	BRnp L115_snake
	JSR grow_snake
	ADD R6, R6, #0	;; free space for arguments
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #25
	CMP R7, R3
	BRnp L117_snake
	CONST R7, #1
	JMP L110_snake
L117_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #5
	MOD R7, R7, R3
	CONST R3, #0
	CMP R7, R3
	BRnp L119_snake
	LEA R7, L121_snake
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, timer
	LDR R3, R7, #0
	CONST R2, #30
	SUB R3, R3, R2
	STR R3, R7, #0
	LDR R7, R7, #0
	CONST R3, #35
	CMP R7, R3
	BRzp L122_snake
	LEA R7, timer
	CONST R3, #35
	STR R3, R7, #0
L122_snake
	LEA R7, bombs_count
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRzp L124_snake
	JSR spawn_bomb
	ADD R6, R6, #0	;; free space for arguments
L124_snake
L119_snake
	JSR spawn_fruit
	ADD R6, R6, #0	;; free space for arguments
	CONST R7, #0
	JMP L110_snake
L115_snake
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRnp L126_snake
	CONST R7, #44
	HICONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR printnum
	ADD R6, R6, #1	;; free space for arguments
	CONST R7, #2
	JMP L110_snake
L126_snake
	CONST R7, #0
L110_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;index_to_pixel;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
index_to_pixel
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LDR R7, R5, #3
	SLL R7, R7, #3
L128_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_pixel;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_pixel
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-2	;; allocate stack space for local variables
	;; function body
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR index_to_pixel
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	STR R7, R5, #-1
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR index_to_pixel
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	STR R7, R5, #-2
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
L129_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_snake;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_snake
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-1
	JMP L134_snake
L131_snake
	CONST R7, #0
	HICONST R7, #51
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	SLL R7, R7, #1
	LEA R3, snake
	ADD R7, R7, R3
	LDR R3, R7, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R7, R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_pixel
	ADD R6, R6, #3	;; free space for arguments
L132_snake
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L134_snake
	LDR R7, R5, #-1
	LEA R3, snake_length
	LDR R3, R3, #0
	CMP R7, R3
	BRn L131_snake
L130_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_bombs;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_bombs
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-1
	JMP L139_snake
L136_snake
	CONST R7, #255
	HICONST R7, #255
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	SLL R7, R7, #1
	LEA R3, bomb
	ADD R7, R7, R3
	LDR R3, R7, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R7, R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_pixel
	ADD R6, R6, #3	;; free space for arguments
L137_snake
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L139_snake
	LDR R7, R5, #-1
	LEA R3, bombs_count
	LDR R3, R3, #0
	CMP R7, R3
	BRn L136_snake
L135_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_fruit;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_fruit
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	CONST R7, #0
	HICONST R7, #124
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, fruit
	LDR R3, R7, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R7, R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_pixel
	ADD R6, R6, #3	;; free space for arguments
L140_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;display_score;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
display_score
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L142_snake
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L142_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L144_snake
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, two
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L144_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L146_snake
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, three
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L146_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRnp L148_snake
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, four
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L148_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRnp L150_snake
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, five
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L150_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #6
	CMP R7, R3
	BRnp L152_snake
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, six
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L152_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #7
	CMP R7, R3
	BRnp L154_snake
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, seven
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L154_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRnp L156_snake
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, eight
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L156_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #9
	CMP R7, R3
	BRnp L158_snake
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, nine
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L158_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #10
	CMP R7, R3
	BRnp L160_snake
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L160_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #11
	CMP R7, R3
	BRnp L162_snake
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L162_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #12
	CMP R7, R3
	BRnp L164_snake
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, two
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L164_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #13
	CMP R7, R3
	BRnp L166_snake
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, three
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L166_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #14
	CMP R7, R3
	BRnp L168_snake
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, four
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L168_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #15
	CMP R7, R3
	BRnp L170_snake
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, five
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L170_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #16
	CMP R7, R3
	BRnp L172_snake
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, six
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L172_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #17
	CMP R7, R3
	BRnp L174_snake
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, seven
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L174_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #18
	CMP R7, R3
	BRnp L176_snake
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, eight
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L176_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #19
	CMP R7, R3
	BRnp L178_snake
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, nine
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L178_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #20
	CMP R7, R3
	BRnp L180_snake
	LEA R7, two
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L180_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #21
	CMP R7, R3
	BRnp L182_snake
	LEA R7, two
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L182_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #22
	CMP R7, R3
	BRnp L184_snake
	LEA R7, two
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, two
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L184_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #23
	CMP R7, R3
	BRnp L186_snake
	LEA R7, two
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, three
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L186_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #24
	CMP R7, R3
	BRnp L188_snake
	LEA R7, two
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, four
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	JMP L141_snake
L188_snake
	LEA R7, snake_length
	LDR R7, R7, #0
	CONST R3, #25
	CMP R7, R3
	BRnp L141_snake
	LEA R7, two
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, five
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L141_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;redraw;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
redraw
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	JSR lc4_reset_vmem
	ADD R6, R6, #0	;; free space for arguments
	JSR draw_snake
	ADD R6, R6, #0	;; free space for arguments
	JSR draw_bombs
	ADD R6, R6, #0	;; free space for arguments
	JSR draw_fruit
	ADD R6, R6, #0	;; free space for arguments
	JSR display_score
	ADD R6, R6, #0	;; free space for arguments
	JSR lc4_blt_vmem
	ADD R6, R6, #0	;; free space for arguments
L192_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;play_game;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
play_game
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-2	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-2
	CONST R7, #0
	STR R7, R5, #-1
	LEA R7, timer
	CONST R3, #150
	STR R3, R7, #0
	JSR init_snake
	ADD R6, R6, #0	;; free space for arguments
	JSR draw_snake
	ADD R6, R6, #0	;; free space for arguments
	JSR spawn_fruit
	ADD R6, R6, #0	;; free space for arguments
	JSR draw_fruit
	ADD R6, R6, #0	;; free space for arguments
	JSR reset_bombs
	ADD R6, R6, #0	;; free space for arguments
	JMP L195_snake
L194_snake
	JSR draw_snake
	ADD R6, R6, #0	;; free space for arguments
	LEA R7, timer
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_getc_timer
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #105
	CMP R7, R3
	BRnp L197_snake
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR turn_snake
	ADD R6, R6, #1	;; free space for arguments
	JMP L198_snake
L197_snake
	LDR R7, R5, #-2
	CONST R3, #106
	CMP R7, R3
	BRnp L199_snake
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR turn_snake
	ADD R6, R6, #1	;; free space for arguments
	JMP L200_snake
L199_snake
	LDR R7, R5, #-2
	CONST R3, #107
	CMP R7, R3
	BRnp L201_snake
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR turn_snake
	ADD R6, R6, #1	;; free space for arguments
	JMP L202_snake
L201_snake
	LDR R7, R5, #-2
	CONST R3, #108
	CMP R7, R3
	BRnp L203_snake
	CONST R7, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR turn_snake
	ADD R6, R6, #1	;; free space for arguments
	JMP L204_snake
L203_snake
	LDR R7, R5, #-2
	CONST R3, #113
	CMP R7, R3
	BRnp L205_snake
	JMP L196_snake
L205_snake
L204_snake
L202_snake
L200_snake
L198_snake
	JSR update_game_state
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #2
	CMP R7, R3
	BRnp L207_snake
	LEA R7, L209_snake
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L208_snake
L207_snake
	LDR R7, R5, #-1
	CONST R3, #1
	CMP R7, R3
	BRnp L210_snake
	LEA R7, L212_snake
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L211_snake
L210_snake
	LDR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRnp L213_snake
	JSR redraw
	ADD R6, R6, #0	;; free space for arguments
L213_snake
L211_snake
L208_snake
L195_snake
	LDR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRz L194_snake
L196_snake
L193_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;main;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
main
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-1
	LEA R7, L216_snake
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L217_snake
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L219_snake
L218_snake
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_getc_timer
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #113
	CMP R7, R3
	BRnp L221_snake
	JMP L220_snake
L221_snake
	LDR R7, R5, #-1
	CONST R3, #114
	CMP R7, R3
	BRnp L223_snake
	LEA R7, L225_snake
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L226_snake
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L227_snake
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JSR play_game
	ADD R6, R6, #0	;; free space for arguments
	LEA R7, L228_snake
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L223_snake
L219_snake
	JMP L218_snake
L220_snake
	CONST R7, #0
L215_snake
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.DATA
bombs_count 		.BLKW 1
		.DATA
fruit 		.BLKW 2
		.DATA
bomb 		.BLKW 10
		.DATA
snake_direction 		.BLKW 1
		.DATA
snake_length 		.BLKW 1
		.DATA
snake 		.BLKW 50
		.DATA
L228_snake 		.STRINGZ "Press 'r' to play again, or 'q' to quit...\n"
		.DATA
L227_snake 		.STRINGZ "Eat food (red) to grow, and avoid bombs (white)\n"
		.DATA
L226_snake 		.STRINGZ "Use i, j, k, l to move\n"
		.DATA
L225_snake 		.STRINGZ "\nNew game!\n"
		.DATA
L217_snake 		.STRINGZ "Press 'r' to start\n"
		.DATA
L216_snake 		.STRINGZ "Welcome to Snake!\n"
		.DATA
L212_snake 		.STRINGZ "Congratulations! you won\n"
		.DATA
L209_snake 		.STRINGZ "Better luck next time\n"
		.DATA
L121_snake 		.STRINGZ "Its about to get tougher\n"
		.DATA
L17_snake 		.STRINGZ "\n"
		.DATA
L10_snake 		.STRINGZ "-32768"
		.DATA
L4_snake 		.STRINGZ "0"
