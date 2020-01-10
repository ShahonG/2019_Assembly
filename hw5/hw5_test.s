/* =================================================== */
/*                  DATA section                       */
/* =================================================== */
	.data
	.align 4
/* --- variable a --- */
	.type a, %object
	.size a, 80
a:
	.word 1
	.word 2
	.word 3
	.word 4
	.word 5
	.word 6
	.word 7
	.word 8
	.word 9
	.word 0
	.word 3
	.word 2
	.word 1
	.word 2
	.word 4
	.word 3
	.word 7
	.word 1
	.word 9
	.word 2

/* --- variable b --- */
	.type b, %object
	.size b, 80
b:
    .word 1
    .word 1
    .word 0
    .word 0
    .word 3
    .word 1
    .word 2
    .word 1
    .word 1

/* --- variable c --- */
	.type c, %object
c:
	.space 24, 0

/* =================================================== */
/*                  TEXT section                       */
/* =================================================== */
	.section .text
	.global main
	.type main,%function
.matrix:
	.word a
	.word b
	.word c
main:
	MOV ip , sp
	STMFD sp!, {fp, ip, lr, pc}
	SUB fp, ip, #4
	LDR r0 , .matrix
	LDR r1 , .matrix + 4
	MOV r2 , #4
	MOV r3 , #5
	BL conv
	nop
	LDMEA fp, {fp, sp, pc}
.end
	
