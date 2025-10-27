#include <stdio.h>

int main() {
    int i, j, k;
    int n = 4;

    for (i = 0; i < n; i++) {
        for (j = 1; j <= n - i; j++) {
            printf("%d ", j);
        }

   
        for (k = 0; k < (2 * i - 1); k++) {
            printf("  "); 
        }

        for (j = n - i; j >= 1; j--) {
            if (j != n) 
                printf("%d ", j);
        }

        printf("\n");
    }

    return 0;
}