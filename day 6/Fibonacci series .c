#include <stdio.h>

int main() {
    int m, i;
    int first = 0, second = 1, next;

    printf("Enter the number of terms: ");
    scanf("%d", &m);

    printf("Fibonacci Series up to %d terms:\n", m);

    for(i = 1; i <= m; i++) {
        printf("%d ", first);
        next = first + second;
        first = second;
        second = next;
    }

    return 0;
}