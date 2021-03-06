#PXESERVER Version 0.1
FROM alpine:3.5
MAINTAINER charles.xiao "charles-xiao@live.com"
VOLUME /pxe
WORKDIR /pxe
COPY dnsmasq /usr/sbin
RUN chmod a+x /usr/sbin/dnsmasq
#ENTRYPOINT /usr/sbin/dnsmasq --no-daemon --bind-dynamic --no-hosts --no-resolv --except-interface lo --enable-tftp --dhcp-no-override
ENV LISTENADD 192.192.2.41
ENV DHCPRANGE 192.192.0.88,192.192.0.150
ENV LEASETIME 2
ENV DHCPGW 192.168.0.1
ENV TFTPBOOT /pxe
#CMD --listen-address $LISTENADD --dhcp-range $DHCPRANGE,$LEASETIME --dhcp-option 3,$DHCPGW --dhcp-lease-max=254 --tftp-root=$TFTPBOOT --dhcp-boot $TFTPBOOT/pxelinux.0
CMD /usr/sbin/dnsmasq --no-daemon --bind-dynamic --no-hosts --no-resolv --except-interface lo --enable-tftp --dhcp-no-override --pxe-prompt="Let's install coreos!!!!",0 --listen-address ${LISTENADD} --dhcp-range ${DHCPRANGE},${LEASETIME}h --dhcp-option 3,${DHCPGW} --dhcp-lease-max=254 --tftp-root=${TFTPBOOT} --dhcp-boot ${TFTPBOOT}/pxelinux.0
