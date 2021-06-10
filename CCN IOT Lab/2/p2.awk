BEGIN{ 
tcp=0; 
cbr=0; 
} 
{ 
if($1=="-" && $5=="tcp") 
tcp++ 
if($1=="-" && $5=="cbr") 
cbr++ 
} 
END{ 
printf("\n no.of tcp packets sent= %d \n",tcp); 
printf("\n no.of cbr packets sent= %d \n",cbr); 
} 
