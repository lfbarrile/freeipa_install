#!/bin/bash
  
domain=.csd.intra
ip=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
echo $ip
hostname=$(hostname)
echo $hostname

echo -e "$ip\t$hostname\t" >> /etc/hosts
echo -e "10.10.10.44\tfreeipa-srv03.csd.intra\t" >> /etc/hosts
echo -e "10.10.9.130\tfreeipa-srv01.csd.intra\t" >> /etc/hosts
echo -e "10.10.11.19\tfreeipa-srv02.csd.intra\t" >> /etc/hosts
sleep 5


iptables -I INPUT -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -p tcp --dport 53 -j ACCEPT
iptables -I INPUT -p tcp --dport 389 -j ACCEPT
iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
iptables -I INPUT -p tcp --dport 88 -j ACCEPT
iptables -I INPUT -p tcp --dport 464 -j ACCEPT
iptables -I INPUT -p tcp --dport 123 -j ACCEPT
sleep 5

apt-get update -y
apt-get install freeipa-client -y

sleep 10

~                                           
