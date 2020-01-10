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
			fscanf(pData , "%6f" , &data[i][j]);
	fclose(pData);

	pFile = fopen("output.txt" , "w");
	float a = 0;
	float b = 0;
	for(int i = 0 ; i < row ; i++){
		float total = 0;
		for(int j = 0 ; j < row ; j++){
			for(int k = 0 ; k < col ; k++){
				a = data[j][k]; // pick one element in data[j] 
				b = data[i][k]; // pick one element in data[i]
				total += a*b;
			}
		}
		fprintf(pFile , "%6f\n" , total); // write in output.txt
	}	
	fclose(pFile);    
	return 0;
}
