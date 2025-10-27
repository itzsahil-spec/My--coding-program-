#include<stdio.h>
int main(){
    int n;
    printf("Enter n: ");
    scanf("%d",&n);
    int nst=1;
    int nsp=(n-1)/2;
    int ml=(n+1)/2;
    for(int i=1;i<=n;i++){
        for(int j=1;j<=nsp;j++){
            printf(" ");
        }
        for(int k=1;k<=nst;k++){
            printf("*");
        }
        if(i<ml){
            nsp--;
            nst+=2;
        }else{
            nst-=2;
            nsp++;
        }
        printf("\n");
    }
    return 0;
}