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

	LDR r0 , .matrix	 /* 抓第一個 a 的值 */
	LDR r1 , .matrix + 4 /* 抓第一個 b 的值 */
	LDR r2 , .matrix + 8 /* 抓第一個 c 的值 */
	MOV r3 , #0
	MOV r4 , #0
	MOV r5 , #0
	MOV r6 , #0
	B LOOP1

LOOP1:
	CMP r3 , #2
	BGE DONE 
	B LOOP2

LOOP2:
	CMP r4, #3
	ADDGE r3 , r3 , #1
	BGE LOOP1
	
	MOV r5 , #0
	B LOOP3
	
	STR r8 , [r2]!
	MOV r8 , #0
	LDR r1 , .matrix + 4
	LDR r7 , [r0] , #4

LOOP3:
	CMP r5 , #3
	ADDGE r4 , r4 , #1
	BGE LOOP2

	MOV r6 , #0
	B LOOP4

	ADD r7 , r7 , #8

LOOP4:
	CMP r6 , #3
	ADDGE r5 , r5 , #1
	BGE LOOP3

	LDR r10 , [r1] , #4
	LDR r11 , [r7] , #4
	MUL r9 , r10 , r11
	ADD r8 , r8 , r9
	ADD r6 , r6 , #1
	
	B LOOP4
DONE:
