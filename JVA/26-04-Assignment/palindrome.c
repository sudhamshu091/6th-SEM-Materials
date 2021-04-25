#include <stdio.h>
#include <string.h>

int main(){
    char str1[100];
    int i, length;
    int status = 0;
    
    printf("Enter a string:");
    scanf("%s", str1);
    
    length = strlen(str1);
    
    for(i=0;i < length ;i++){
        if(str1[i] != str1[length-i-1]){
            status = 1;
            break;
   }
}
    
    if (status) {
        printf("%s is not a palindrome", str1);
    }    
    else {
        printf("%s is a palindrome", str1);
    }
    return 0;
}

/*
Enter a string:malayalam                                                                                                                      
malayalam is a palindrome 
*/
