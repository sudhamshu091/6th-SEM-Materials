#include <stdio.h>
#include <conio.h>
 
int main(){
    
    int arr[500] , i, n, key;
   
    printf("\nEnter size of the array : ");
    scanf("%d", &n);
    printf("\nEnter the elements : ");
    
    for(i=0; i < n; i++)
    {
        scanf("%d",&arr[i]);
    }
        printf("Enter the key : ");
        scanf("%d", &key);
     
    for(i=0; i<n; i++)
    {
        if(arr[i]==key)
        {
			printf("Element found at %d", i);
            return 0;		 
        }
 
    }
    
	printf("Element  not  found");
}

/*
Enter size of the array : 5                                                                                                                   
 
Enter the elements : 21                                                                                                                       
22                                                                                                                                            
33                                                                                                                                            
22                                                                                                                                            
11                                                                                                                                            
Enter the key : 22                                                                                                                            
Element found at 1 
*/
