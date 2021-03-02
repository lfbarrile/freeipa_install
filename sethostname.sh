#!/bin/bash

domain=.csd.intra
ip=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
echo $ip
hostname=$(hostname)
echo $hostname

echo "ajustando hostname do client"
echo "insira o nome do host"
read host
hostname=$host$domain
echo $hostname
hostnamectl set-hostname "$hostname"
exec bash
sleep 5
~                             
