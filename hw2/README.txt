Program details：
	將整數10,20.12.15分別讀入至r1,r2,r3,r4暫存器裡面。
	再使用mul指令將r1*r2，r3*r4的值分別存進r5,r6暫存器，
	最後將r5 + r6的值存在r7暫存器。

Compile：
	使用arm-none-eabi-gcc -g -O0 hw2.s -o hw2.exe

Environment：
	Ubuntu-18.04.2-desktop-arm64

Execute：
	run "arm-none-eabi-insight" after compile hw2.s