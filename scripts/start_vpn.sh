#!/bin/sh

echo "nameserver 1.1.1.1" > /etc/resolv.conf

openvpn /VPN/$vpn
