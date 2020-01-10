/*======================================================*/
/*			TEXT section			*/
/*======================================================*/
		.section .text
		.global main
		.type main,%function
main:
	mov r1, #10
	mov r2, #20
	mov r3, #12
	mov r4, #15
	mul r5, r1 ,r2
	mul r6, r3 ,r4
	add r0, r5 ,r6
	nop
	.end
