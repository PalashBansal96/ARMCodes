#include <stdio.h>
#include <stdlib.h>

int main(){
	int n,i,j,k,a[100][100],b[100][100],t; 
	scanf("%d", &n);
	for(i=0;i<n;i++)
		for(j=0;j<n;j++)
			scanf("%d", &a[i][j]);
	for(i=0;i<n;i++)
		for(j=0;j<n;j++)
			scanf("%d", &b[i][j]);
	for(i=0;i<n;i++){
		for(j=0;j<n;j++){
			t=0;
			for(k=0;k<n;k++){
				t+=a[i][k]*b[k][j];
			}
			printf("%d ",t);
		}
		printf("\n");
	}
	return 0;
}