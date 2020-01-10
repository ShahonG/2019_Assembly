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

@O (output address)
	.type O, %object
	.size O, 4
O:
	.word 0

@i (r5 num)
	.type i, %object
	.size i, 4
i:
	.word 0

conv:
	MOV ip, sp
	STMFD sp!, {r4-r10, fp, ip, lr, pc}
	SUB fp, ip, #4
	@ i = r4 , j = r5 , k = r6 , n = r7
	STMFD sp! , {r0-r3 , fp , ip}
	MOV r0 , #52
	
	BL malloc
	MOV r10 , r0
	LDMFD sp! , {r0-r3 , fp , ip}
	MOV r4 , r2
	SUB r4 , r4 , #2
	MOV r5 , r3
	SUB r5 , r5 , #2
	LDR r7 ,=K
	STR r1 , [r7]
	LDR r7 , =i
	STR r5 , [r7]
	LDR r2 , =O
	STR r10 , [r2]
	MOV r2 , #0
	MOV r3 , #0
	MOV r8 , r0
	BL LOOP1

	LOOP1: @ iterator is r4
		LDR r5 , =i
		LDR r5 , [r5]
		LOOP2: @ iterator is r5
			MOV r6 , #0
			LOOP3: @ iterator is r6
				MOV r7 , #0
				LOOP4: @ iterator is r7
					LDR r2 , [r8] , #4  	@ input
					LDR r3 , [r1] , #4 	@ kernel
					MLA r9 , r2 ,r3 ,r9
					ADD r7 , r7 , #1
					CMP r7 , #3
					BNE LOOP4
				ADD r8 , r8 , #12	
				ADD r6 , r6 , #1
				CMP r6 , #3
				BNE LOOP3
			STR r9 , [r10] , #4
			ADD r0 , r0 , #4
			MOV r8 , r0	
			MOV r9 , #0
			LDR r1 , =K
			LDR r1 , [r1]
			SUB r5 , r5 , #1
			CMP r5 , #0
			BNE LOOP2
		SUB r4 , r4 , #1
		CMP r4 , #0
		BNE LOOP1
	LDR r0 , =O
	LDR r0 , [r0]
	LDMEA fp , {r4-r10 , fp , sp , pc}
	.end
