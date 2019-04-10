#!/bin/sh

# set directory
dir=/tmp/mnt/sda1/hosts

# get hosts files and combine and sort, write to temp file
wget -qO- "http://winhelp2002.mvps.org/hosts.txt" "http://someonewhocares.org/hosts/zero/hosts" "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&startdate[day]=&startdate[month]=&startdate[year]=&mimetype=plaintext&useip=0.0.0.0" | grep -w ^0.0.0.0 | sed $'s/\r$//' | sort -u > $dir/temp

#get hosts files combine and convert 127.0.0.1 to 0.0.0.0 and output to temp
wget -qO- "http://www.malwaredomainlist.com/hostslist/hosts.txt" "http://hosts-file.net/ad_servers.txt" | grep -w ^127.0.0.1 | sed s/127.0.0.1/0.0.0.0/g | sed $'s/\r$//' >> $dir/temp

# remove whitelisted entries in temp and write final file, remove temp file
cat $dir/whitelist.txt | sed $'s/\r$//' | grep -vf - $dir/temp > $dir/hosts.blocked

#remove temp file
rm $dir/temp

#restart dnsmasq to apply changes
sleep 1
service restart_dnsmasq
