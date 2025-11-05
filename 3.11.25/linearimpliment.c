#include <stdio.h>

int main() {
    int n, key,i;
    printf("Enter number of elements: ");
    scanf("%d", &n);

    int arr[n];
    for (i = 0; i <= n-1; i++) {
        int a=i+1;
        printf("Enter element no %d: ", a);
        scanf("%d", &arr[i]);
    }
    printf("Enter the element to search: ");
    scanf("%d", &key);
    int found = 0;
    for ( i = 0; i <= n-1; i++) {
        if (arr[i] == key) {
            found = 1;
            break;
        }
    }

    if (found==1) {
        printf("Element found at index %d (position %d)\n", i, i + 1);
    }else{
        printf("Element not found in arrY \n");
    }

    return 0;
}
