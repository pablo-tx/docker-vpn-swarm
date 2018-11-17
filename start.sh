#!/bin/bash

count=5000; for f in $(ls ovpn_files/); do count=$((count+1)); echo "http 127.0.0.1 $count" >> 
vpn-instances.txt; docker run -d --privileged -p 127.0.0.1:$count:8080 -e "vpn=$f" 
docker-vpn-swarm; 
done
