#include<stdio.h>
#include<limits.h>
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
    int max=arr[0];
    int min= arr[0];
    for(int i=0;i<=n-1;i++){
        if(arr[i]<min){
            min=arr[i];
        }
        if(arr[i]>max){
            max=arr[i];
        }
    }
    printf("minimum value= %d\n",min);
    printf("maximum value= %d \n",max);
    return 0;
}