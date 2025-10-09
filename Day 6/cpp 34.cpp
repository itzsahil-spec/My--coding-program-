#include <stdio.h>

int main() {
    int n, i;
    long long first = 0, second = 1, next;

   
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    printf("Fibonacci Series up to %d terms:\n", n);

    for (i = 1; i <= n; i++) {
        if (i == 1) {
            printf("%lld ", first);
            continue;
        }
        if (i == 2) {
            printf("%lld ", second);
            continue;
        }

        next = first + second;
        printf("%lld ", next);

        first = second;
        second = next;
    }

    printf("\n");
    return 0;
}
