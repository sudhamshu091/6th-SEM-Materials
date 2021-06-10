set ns [new Simulator] 
set tf [open p3.tr w] 
$ns trace-all $tf 
set nf [open p3.nam w] 
$ns namtrace-all $nf 
$ns color 1 "blue" 
set n0 [$ns node] 
set n1 [$ns node] 
set n2 [$ns node] 
set n3 [$ns node] 
set n4 [$ns node] 
set n5 [$ns node] 
set n6 [$ns node] 
$n1 label "Source/UDP" 
$n3 label "Error Node" 
$n5 label "Destination" 
;#The below code is used to create a two Lans (Lan1 and #Lan2). $ns make-lan "$n0 $n1 $n2 $n3" 100Mb 10ms LL Queue/DropTail Mac/802_3 
$ns make-lan "$n4 $n5 $n6 " 100Mb 10ms LL Queue/DropTail Mac/802_3 
$ns duplex-link $n3 $n6 100Mb 10ms DropTail 
set udp1 [new Agent/UDP] 
set cbr1 [ new Application/Traffic/CBR] 
set null5 [new Agent/Null] 
$ns attach-agent $n1 $udp1 
$cbr1 attach-agent $udp1 
$ns attach-agent $n5 $null5 
$ns connect $udp1 $null5 
$cbr1 set packetSize_ 1000 
$cbr1 set interval_ 0.0001 ;# This is the data rate.Change 
 ;# this to vary the throughput. 
set err [new ErrorModel] ;# The code is used to add an error model 
$ns lossmodel $err $n3 $n6 ;#between the nodes n3 and n6. 
$err set rate_ 0.1 ;# This is the error rate. Change this 
 ;# rate to add errors between n3 and n6. 
$udp1 set class_ 1 
proc finish { } { 
global nf ns tf 
close $nf 
close $tf 
exec nam p3.nam & 
exit 0 
} 
$ns at 0.1 "$cbr1 start" 
$ns at 5.0 "finish" 
$ns run 
