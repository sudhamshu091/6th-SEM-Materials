BEGIN { 
pksend = 0 
pkreceive = 0 
pkdrop = 0 
pkrouting = 0 
} 
#Executed for each line of input file thru.tr 
{ 
#For udp packets 
if ( $1=="+" && ($3=="0" || $3=="11") && $5=="cbr" ) 
{ 
pksend++; 
} 
if ( $1=="r" && $4=="5" && $5=="cbr" ) 
{ pkreceive++; 
} 
if ( $1=="d" ) 
{ 
pkdrop++; 
} 
if ( $1=="r" && ($5=="rtProtoDV" || $5=="rtProtoLS") ) 
{ 
pkrouting++; 
} 
} 
END { 
print "No of send packets = " pksend 
print "No of received packets = " pkreceive 
print "No of dropped packets = " pkdrop 
print "No of routing packets = " pkrouting 
print "Normalized Overhead (routing/received), NOH = " pkrouting/pkreceive 
print "Packet Delivery Ratio (received/send), PDR = " pkreceive/pksend 
}
