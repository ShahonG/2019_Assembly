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
	.word 10
	.word 11
	.word 12
	.word 13
	.word 14
	.word 15
	.word 16
	.word 17
	.word 18
	.word 19
	.word 20

/* --- variable b --- */
	.type b, %object
	.size b, 80
b:
	.word 21
    .word 22
    .word 23
    .word 24
    .word 25
    .word 26
    .word 27
    .word 28
    .word 29
    .word 30
    .word 31
    .word 32
    .word 33
    .word 34
    .word 35
    .word 36
    .word 37
    .word 38
    .word 39
	.word 40
c:
	.space 80,0
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
	LDR r0, .matrix
	LDR r1, .matrix + 4
	LDR r2, .matrix + 8
	MOV r7, #0
	MOV r8, #20
loop:
	LDR r4, [r0 , #4]!
	LDR r5, [r1 , #4]!
	ADD r6, r4, r5
	STR r6, [r2 , #4]!
	ADD r7 , #1
	CMP r7, r8
	BNE loop
nop
