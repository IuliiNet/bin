#!/bin/sh 

IPV4=`ip a s ppp0 |grep inet |awk '{print $2}'`
USER="XXX"
PWD="YYY"

ip t d he-ipv6
ip tunnel add he-ipv6 mode sit remote 216.66.80.26 local $IPV4 ttl 255
ip link set he-ipv6 up
ip addr add 2001:470:1f08:79e::2/64 dev he-ipv6
ip route add ::/0 dev he-ipv6
ip -f inet6 addr

wget -O /dev/null https://$USER:$PWD@ipv4.tunnelbroker.net/ipv4_end.php?tid=190038 >> /dev/null 2>&1
