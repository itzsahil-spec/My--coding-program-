#include<stdio.h>
int main(){
     int n;
    printf("Enter n: ");
    scanf("%d",&n);
    int arr[n];
    for(int i=0;i<=n-1;i++){
        int a=i+1;
        printf("enter the element no %d: ",a);
        scanf("%d",&arr[i]);
    }
    int evencount=0;
    int oddcount=0;
    for(int i=0;i<=n-1;i++){
        if(i%2==0){
            evencount++;
        }
        else{
            oddcount++;
        }
    }
        printf("Total even number is %d\n",evencount);
        printf("Total odd number is %d\n ",oddcount);
    return 0;
}