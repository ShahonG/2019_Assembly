#include <stdio.h>
#include <xmmintrin.h>
#define row 400
#define col 400

int main(){
	FILE *pFile = NULL;
	FILE *pData = fopen("data.txt" , "r");

	float data[row][col] __attribute__((aligned(16)));

	for(int i = 0 ; i < row ; i++)
		for(int j = 0 ; j < col ; j++)
			fscanf(pData , "%6f" , &data[i][j]); // load data from data.txt
	fclose(pData);

	pFile = fopen("output.txt" , "w");

    	__m128 *a , *b , *c; // intrinsic functions variable
	float val[4] __attribute__((aligned(16)));

	for(int i = 0 ; i < row ; i++){
		float total = 0;
		for(int j = 0 ; j < row ; j++){
			for(int k = 0 ; k < col / 4 ; k++){
				a = (__m128*)&data[i][4*k]; // get data[i]'s 4 elements address
				b = (__m128*)&data[j][4*k]; // get data[j]'s 4 elements address
				c = (__m128*)val;
				*c = _mm_mul_ps(*a , *b); // multiply
				total += val[0] + val[1] + val[2] + val[3]; // each mul have 4 elements
			}
		}
		fprintf(pFile , "%6f\n" , total); // store in output.txt
	}

	fclose(pFile);    
	return 0;
}
