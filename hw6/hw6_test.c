#include <stdio.h>

int main(){
	int input[5][6] = { 0 , 1 , 2 , 3 , 4 , 6,
			    1 , 3 , 5 , 7 , 9 , 5,
			    2 , 4 , 6 , 8 , 0 , 4,
			    5 , 4 , 3 , 2 , 1 , 3,
			    1 , 1 , 2 , 3 , 4 , 1
				};
	int kernel[3][3] = { 1 , 3 , 5 ,
			     2 , 4 , 6 ,
			     3 , 2 , 1};
	int *output;
	int row = 5;
	int col = 6;
	int i = 0 , j = 0;
	output = conv(input , kernel , row , col);
	int range = (row-2) * (col-2);
	for(i = 0 ; i < range ; i++)
		printf("%d " , output[i]);
	printf("\n");
	return 0;
}
