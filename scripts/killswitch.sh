#!/bin/sh
ufw enable
port=$(grep remote /VPN/$vpn | cut -d" " -f 3)
ufw allow out from any to any port $((port))
ufw allow from any to any port 8080
ufw default deny incoming
ufw default deny outgoing
ufw allow out on tun0

