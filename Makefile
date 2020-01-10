# hw7 makefile
all:hw7simd.c hw7.c
	gcc -msse4 hw7simd.c -o 7simd
	gcc hw7.c -o 7
clean:
	rm -f 7*
