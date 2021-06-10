set ns [new Simulator] 
 
set tf [open p2.tr w] 
$ns trace-all $tf 
 
set nf [open p2.nam w] 
$ns namtrace-all $nf 
set n0 [$ns node] 
set n1 [$ns node] 
set n2 [$ns node] 
set n3 [$ns node] 
$ns duplex-link $n0 $n2 20Mb 10ms DropTail 
$ns duplex-link $n1 $n2 10Mb 10ms DropTail 
$ns duplex-link $n2 $n3 0.7Mb 10ms DropTail 
$ns set queue-limit $n0 $n2 10 $ns set queue-limit $n1 $n2 10 
$ns set queue-limit $n2 $n3 5 
set tcp [new Agent/TCP] 
set udp [new Agent/UDP] 
 
set tcpsink [new Agent/TCPSink] 
set null [new Agent/Null] 
 
set cbr [new Application/Traffic/CBR] 
set ftp [new Application/FTP] 
$ns attach-agent $n0 $tcp 
$ns attach-agent $n1 $udp 
$ns attach-agent $n3 $tcpsink 
$ns attach-agent $n3 $null 
 
$ftp attach-agent $tcp 
$cbr attach-agent $udp 
 
$ns connect $udp $null 
$ns connect $tcp $tcpsink 
$cbr set packetSize_ 512 
$cbr set interval_ 0.005 
$ftp set packetSize_ 512 
$ftp set interval_ 0.005 
proc finish {} { 
global ns nf tf 
$ns flush-trace 
close $tf 
close $nf 
exec nam p2.nam & 
exit 0 
} 
$ns at 0.0 "$ftp start" 
$ns at 10.0 "$ftp stop" 
$ns at 2.0 "$cbr start" 
$ns at 12.0 "$cbr stop" 
 
$ns at 13.0 "finish" 
$ns run 
