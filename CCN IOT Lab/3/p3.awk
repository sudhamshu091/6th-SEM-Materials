BEGIN { 
 Rpacketsize=0; 
 Rtimeinterval=0; 
} 
{ 
if ($1=="r" && $3=="3" && $4=="6") 
Rpacketsize = Rpacketsize+$6; 
Rtimeinterval=$2; 
} 
END { 
printf ("throughput:%f Mbps\n",(Rpacketsize/Rtimeinterval)*(8/1000000)); } 
