#include <stdlib.h>

void display(int* arr, int n){
    for(int i = 0; i < n; ++i){
        printf("Index %d: Value %d", i, *(arr + i));
    }
}

int main(){
    int arr[10] = {1,6,2,7,2,6,3,7,0,4};
    int size = sizeof(arr) / sizeof(*arr);

    display(arr, size);
}