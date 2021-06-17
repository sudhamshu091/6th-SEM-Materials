set ns [new Simulator] 
set tf [open p4.tr w] 
$ns trace-all $tf 
set nf [open p4.nam w] 
$ns namtrace-all $nf 
set n0 [$ns node] 
set n1 [$ns node] 
set n2 [$ns node] 
set n3 [$ns node] 
$ns make-lan "$n0 $n1 $n2 $n3" 10Mb 10ms LL Queue/DropTail Mac/802_3 
set tcp1 [new Agent/TCP] 
set ftp1 [new Application/FTP] 
set sink1 [new Agent/TCPSink] 
set tcp2 [new Agent/TCP] 
set ftp2 [new Application/FTP] 
set sink2 [new Agent/TCPSink] 
$ns attach-agent $n0 $tcp1 
$ftp1 attach-agent $tcp1 
$ns attach-agent $n3 $sink1 
$ns connect $tcp1 $sink1 
$ns attach-agent $n2 $tcp2 
$ftp2 attach-agent $tcp2 
$ns attach-agent $n1 $sink2 
$ns connect $tcp2 $sink2 
set file1 [open file1.tr w] 
$tcp1 attach $file1 
$tcp1 trace cwnd_ 
$tcp1 set maxcwnd_ 20 
set file2 [open file2.tr w] 
$tcp2 attach $file2 
$tcp2 trace cwnd_ 
$tcp2 set maxcwnd_ 30 
$ns color 1 "red" 
$ns color 2 "blue" 
$tcp1 set class_ 1 
$tcp2 set class_ 2 
proc finish { } { 
global nf tf ns 
$ns flush-trace 
exec nam p4.nam & 
close $nf 
close $tf 
exit 0 
} 
$ns at 0.1 "$ftp1 start" 
$ns at 1.5 "$ftp1 stop" 
$ns at 2 "$ftp1 start" 
$ns at 3 "$ftp1 stop" 
$ns at 0.2 "$ftp2 start" 
$ns at 2 "$ftp2 stop" 
$ns at 2.5 "$ftp2 start" 
$ns at 4 "$ftp2 stop" 
$ns at 5.0 "finish" 
$ns run 
