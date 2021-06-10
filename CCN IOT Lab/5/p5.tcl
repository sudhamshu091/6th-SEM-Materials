set ns [new Simulator] 
 
set tf [open p5.tr w] 
$ns trace-all $tf 
set nf [open p5.nam w] 
$ns namtrace-all-wireless $nf 1000 1000 
set topo [new Topography] 
$topo load_flatgrid 1000 1000 
$ns node-config -adhocRouting DSDV \ 
-llType LL \ 
-macType Mac/802_11 \ 
-ifqType Queue/DropTail \ 
-ifqLen 50 \ 
-phyType Phy/WirelessPhy \ 
-channelType Channel/WirelessChannel \ 
-propType Propagation/TwoRayGround \ 
-antType Antenna/OmniAntenna \ 
-topoInstance $topo \ 
-agentTrace ON \ 
-routerTrace ON 
create-god 3 
set n0 [$ns node] 
set n1 [$ns node] set n2 [$ns node] 
$n0 label "tcp0" 
$n1 label "sink1/tcp1" 
$n2 label "sink2" 
$ns initial_node_pos $n0 50 
$ns initial_node_pos $n1 50 
$ns initial_node_pos $n2 50 
#The below code is used to give the initial node positions. 
$n0 set X_ 50 
$n0 set Y_ 50 
$n1 set X_ 200 
$n1 set Y_ 200 
$n2 set X_ 700 
$n2 set Y_ 700 
$ns at 0.1 "$n0 setdest 50 50 15" 
$ns at 0.1 "$n1 setdest 200 200 25" 
$ns at 0.1 "$n2 setdest 700 700 25" 
set tcp0 [new Agent/TCP] 
set ftp0 [new Application/FTP] 
set sink1 [new Agent/TCPSink] 
set tcp1 [new Agent/TCP] 
set ftp1 [new Application/FTP] 
set sink2 [new Agent/TCPSink] 
$ns attach-agent $n0 $tcp0 
$ftp0 attach-agent $tcp0 
$ns attach-agent $n1 $sink1 
$ns connect $tcp0 $sink1 
$ns attach-agent $n1 $tcp1 
$ftp1 attach-agent $tcp1 
$ns attach-agent $n2 $sink2 
$ns connect $tcp1 $sink2 
$ns at 0.1 "$ftp0 start" 
$ns at 0.1 "$ftp1 start" 
#The below code is used to provide the node movements. 
$ns at 100 "$n1 setdest 550 550 15" 
$ns at 190 "$n1 setdest 100 100 15" 
proc finish {} { 
global ns nf tf 
$ns flush-trace 
exec nam p5.nam & close $tf 
exit 0 
} 
$ns at 250 "finish" 
$ns run 
