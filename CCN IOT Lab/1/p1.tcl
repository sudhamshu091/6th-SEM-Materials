set ns [new Simulator] ;#creating a new variable ns 
set tf [open p1.tr w] ;#open trace file p1.tr in writable mode 
$ns trace-all $tf ;#main class object ns linked with trace file object tf 
set nf [open p1.nam w] ;#open nam file p1.nam in writable mode 
$ns namtrace-all $nf ;#main class object ns linked with nam file object nf 
set n0 [$ns node] ;#creation of nodes 
set n1 [$ns node] 
set n2 [$ns node] 
set n3 [$ns node] $ns duplex-link $n0 $n2 20Mb 10ms DropTail ;#forming duplex connection between the nodes 
$ns duplex-link $n1 $n2 10Mb 10ms DropTail ;#and vary the bandwidth in this link 
$ns duplex-link $n2 $n3 0.7Mb 10ms DropTail 
$ns set queue-limit $n0 $n2 10 ;#Assigning Queuesize between the nodes 
$ns set queue-limit $n1 $n2 10 
$ns set queue-limit $n2 $n3 5 
set udp0 [new Agent/UDP] ;#creating object(agent) for the class Agent/UDP 
set udp1 [new Agent/UDP] ;#creating object(agent) for the class Agent/UDP 
set null [new Agent/Null] ;#creating Destination object(agent) for the class Agent/Null 
set cbr0 [new Application/Traffic/CBR] ;#creating object(agent) for the class 
 ;#Application/Traffic/CBR 
set cbr1 [new Application/Traffic/CBR] 
$ns attach-agent $n0 $udp0 ;#Attaching agents 
$ns attach-agent $n1 $udp1 
$ns attach-agent $n2 $null 
$ns attach-agent $n3 $null 
$cbr0 attach-agent $udp0 
$cbr1 attach-agent $udp1 
$ns connect $udp0 $null ;#connecting source and destination node agents 
$ns connect $udp1 $null 
$cbr0 set packetSize_ 512 ;#assigning values of packet size and time interval 
$cbr0 set interval_ 0.001 
$cbr1 set packetSize_ 512 
$cbr1 set interval_ 0.005 proc finish { } { ;#terminate Simulation 
global ns nf tf 
$ns flush-trace 
close $tf 
close $nf 
exec nam p1.nam & 
exit 0 
} 
$ns at 0.0 "$cbr0 start" ;#Setting time for start and stop the packet transmission. 
$ns at 10.0 "$cbr0 stop" 
$ns at 2.0 "$cbr1 start" 
$ns at 12.0 "$cbr1 stop" 
$ns at 13.0 "finish" ;#Setting time to stop the simulation 
$ns run 
