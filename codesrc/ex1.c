#include <stdlib.h>

int isEven(int n){
  return !(n % 2);
}

int main(){
  int x = 20;
  int* ptr = &x;
  if(isEven(x)){
    printf("The number is even\n", x);
  } else{
    printf("The number is not even\n", x);
  }
  //this is a comment
  /* this is also a 
  awdwadaw
  wadaw */
  return 0;
} 