/* =================================================== */
/*                  TEXT section                       */
/* =================================================== */
	.section .text
	.global conv
	.type conv,%function

@K (kernel address)
	.type K, %object
	.size K, 4
K:
	.word 0

@I (input address)
	.type I, %object
	.size I, 4
I:
	.word 0

@O (output address)
	.type O, %object
	.size O, 4
O:
	.word 0

@i (loop1 counter)
	.type i, %object
	.size i, 4
i:
	.word 4

@j (loop2 counter)
	.type j, %object
	.size j, 4
j:
	.word 5

@k (loop3 counter)
	.type k, %object
	.size k, 4
k:
	.word 2

@n (loop4 counter)
	.type n, %object
	.size n, 4
n:
	.word 3

conv:
	MOV ip, sp
	STMFD sp!, {r4-r10, fp, ip, lr, pc}
	SUB fp, ip, #4
	@ i = r4 , j = r5 , k = r6 , n = r7
	STMFD sp! , {r0-r3 , fp , ip}
	MOV r0 , #24
	BL malloc
	MOV r10 , r0
	LDMFD sp! , {r0-r3 , fp , ip}
	
	LDR r9 , =O
	LDR r1 , =K
	LDR r1 , [r1]
	MOV r4 , r2
	MOV r5 , r3
	MOV r6 , #3
	MOV r7 , #3
	LDR r10 , =O	@ let r10 = Output matrix
	LDR r10 , [r10]
	B LOOP1

LOOP1:
	CMP r4 , #0
	BEQ DONE

	CMP r5 , #0
	ADDEQ r8 , r8 , #12
	MOVEQ r0 , r8
	MOVEQ r6 , #0

	LDR r5, =j
	LDR r5, [r5]
	B LOOP2

LOOP2:
	CMP r5, #0
	SUBEQ r4 ,r4 ,#1
	BEQ LOOP1

	CMP r6, #3
	ADDEQ r8 , r8 , #4
	MOVEQ r1 , r8

	LDR r1, =K
	LDR r1, [r1]
	MOV r6, #0
	B LOOP3

LOOP3:
	CMP r6, #3
	SUBGE r5 , r5 , #1
	STRGE r2 , [r10], #4
	MOVGE r8 , #0
	MOVGE r7 , #0
	BGE LOOP2

	CMP r7 , #3
	ADDEQ r0 , r0 , #8
	
	MOV r7, #0
	B LOOP4

LOOP4:
	CMP r7, #3
	ADDGE r6 , r6 , #1
	BGE LOOP3

	LDR r2, [r0] , #4
	LDR r3 , [r1] , #4
	LDR r3 , [r3]
	MLA r9, r2 ,r3, r9

	ADD r7 , r7, #1
	B LOOP4
	
DONE:
	MOV r0 , r10
	LDMEA fp, {r4-r10, fp, sp, pc}
	.end
