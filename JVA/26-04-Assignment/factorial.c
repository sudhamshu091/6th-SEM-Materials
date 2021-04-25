#include <stdio.h>
#include <conio.h>
 
void main() {
    int num,f;
     
    printf("\nEnter the number: ");
    scanf("%d",&num);
     
    f=factorial(num);
    printf("\nFactorial of the number %d is %d",num,f);
    getch();
}
 
int factorial(int number)
{
    if(number==0 || number==1)
        return 1;
    else
        return(number * factorial(number-1));
}
