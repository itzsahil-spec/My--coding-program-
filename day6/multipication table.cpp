#include <stdio.h>

int main() {
    int start, end, i, j, isPrime;

    printf("Enter the range (start end): ");
    scanf("%d %d", &start, &end);

    for(i = start; i <= end; i++) {
        if(i < 2) continue;  // skip numbers less than 2
        isPrime = 1;        // assume number is prime
        for(j = 2; j < i; j++) {
            if(i % j == 0) {
                isPrime = 0; // not prime
                break;
            }
        }
        if(isPrime)
            printf("%d ", i);
    }

    return 0;
}
