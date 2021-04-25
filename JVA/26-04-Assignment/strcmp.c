#include <stdio.h>  
int main(){  
    
   char str1[100]; 
   char str2[100]; 
   int f;
   
    printf("\nEnter the first string : ");  
    scanf("%s",str1);  
    printf("\nEnter the second string : ");  
    scanf("%s",str2);  
   
   f = compare(str1,str2);
   
   if(f==0) { 
        printf("\nStrings are same"); 
   }
   else { 
        printf("\nStrings are not same");  
   }
    return 0;  
}  
  
int compare(char a[],char b[])  
{  
    int status = 0,i = 0;  
    
    while(a[i] != '\0' && b[i] != '\0')   
    {  
       if(a[i] != b[i])  
       {  
           status = 1;  
           break;  
       }  
       i++;  
    } 
    
    if(status==0)
        return 0;  
    else  
        return 1;  
}  

/*
Enter the first string : sudhamshu                                                                                                            
                                                                                                                                              
Enter the second string : sudhamshu                                                                                                           
                                                                                                                                              
Strings are same
*/
