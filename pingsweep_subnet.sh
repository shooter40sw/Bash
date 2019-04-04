#!/bin/bash
echo “Enter your subnet in this format 192.168.2”
read SUBNET
for IP in $(seq 1 254); do
            ping -c 1 $SUBNET.$IP |grep "bytes from"
done 
