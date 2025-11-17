#include <stdio.h>

struct Book {
    int id;
    char name[50];
    char author[50];
    float price;
};

int main() {
    struct Book books[10];
    int i;

    printf("Enter details of 10 books:\n");

    for(i = 0; i < 10; i++) {
        printf("\nBook %d:\n", i + 1);

        printf("Enter Book ID: ");
        scanf("%d", &books[i].id);
        getchar();  // to clear newline

        printf("Enter Book Name: ");
        fgets(books[i].name, sizeof(books[i].name), stdin);

        printf("Enter Author Name: ");
        fgets(books[i].author, sizeof(books[i].author), stdin);

        printf("Enter Price: ");
        scanf("%f", &books[i].price);
        getchar(); // clear newline
    }

    printf("\n--- Displaying Book Details ---\n");
    for(i = 0; i < 10; i++) {
        printf("\nBook %d\n", i + 1);
        printf("ID: %d", books[i].id);
        printf("\nName: %s", books[i].name);
        printf("Author: %s", books[i].author);
        printf("Price: %.2f\n", books[i].price);
    }

    return 0;
}
