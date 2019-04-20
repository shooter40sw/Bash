#!/bin/sh
# Este script limpia todas las reglas que hay en algun firewall iptables
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
iptables -X
iptables -Z
