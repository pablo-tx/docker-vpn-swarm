FROM alpine:3.7

# Paquetes
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache dante-server@testing supervisor openvpn iptables ufw@testing

# Configuracion
ADD etc/ /etc/
ADD VPN /VPN
ADD auth.txt /auth.txt
ADD scripts/killswitch.sh /killswitch.sh
ADD scripts/start_vpn.sh /start_vpn.sh
ADD scripts/stuck_check.sh /stuck_check.sh
RUN chmod 775 /*.sh

EXPOSE 8080
CMD ["supervisord","-n"]
