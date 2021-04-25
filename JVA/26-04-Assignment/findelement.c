#include <stdio.h>

int main(){
  int i, first, last, n, search, arr[100], f;

  printf("\nEnter number of elements :");
  scanf("%d", &n);

  printf("\nEnter %d integers :", n);

  for (i = 0; i < n; i++)
    scanf("%d", &arr[i]);

  printf("\nEnter value to find :");
  scanf("%d", &search);

  first = 0;
  last = n - 1;

  f = binarySearch(arr, first, last, search);
 
  if (f == -1)
    printf("\nElement %d not found", search);
  else
    printf("Element %d found at %d.\n", search, f);
 
  return 0;
}

int binarySearch(int a[], int s, int e, int f) {
   int m;
 
  if (s > e) 
     return -1;

  m = (s + e)/2;

  if (a[m] == f)
    return m;
  else if (f > a[m])  
    return binarySearch(a, m+1, e, f);
  else
    return binarySearch(a, s, m-1, f);
}

/*
Enter number of elements :3                                                                                                                     
                                                                                                                                                
Enter 3 integers :1                                                                                                                             
2                                                                                                                                               
3                                                                                                                                               
                                                                                                                                                
Enter value to find :2                                                                                                                          
Element 2 found at 1. 
*/
