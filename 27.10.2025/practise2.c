#include <stdio.h>

int main() {
    int i, j, num = 10;
    
    for (i = 1; i <= 4; i++) {
        for (j = 1; j <= 4 - i; j++) {
            printf("   "); 
        }
        
        // Print numbers
        for (j = 1; j <= i; j++) {
            printf("%2d ", num--); 
        }
        
        printf("\n");
    }
    
    return 0;
}