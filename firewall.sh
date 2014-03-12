#!/bin/sh

iptables -F
iptables -F -t nat

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE -s 192.168.0.0/24
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE -s 10.100.0.3
iptables -t nat -A POSTROUTING -o br0 -j MASQUERADE

iptables -A FORWARD -i ppp0 -o br1 -p tcp --dport 51413 -j ACCEPT 
iptables -A FORWARD -i ppp0 -o br1 -p udp --dport 51413 -j ACCEPT 
iptables -t nat -I PREROUTING -i ppp0 -p tcp --dport 51413 -j DNAT --to-destination 192.168.0.3:51413 
iptables -t nat -I PREROUTING -i ppp0 -p udp --dport 51413 -j DNAT --to-destination 192.168.0.3:51413 
