FROM alpine:3.7

# Paquetes
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache supervisor git python openvpn iptables ufw@testing

# Configuracion
COPY supervisor.d /etc/supervisor.d/
ADD ovpn_files /VPN
ADD auth.txt /auth.txt
ADD scripts/proxy.py /proxy.py
ADD scripts/killswitch.sh /killswitch.sh
ADD scripts/start_vpn.sh /start_vpn.sh
ADD scripts/startup.sh /startup.sh
RUN chmod 775 /start_vpn.sh

EXPOSE 8080
CMD ["/startup.sh"]
