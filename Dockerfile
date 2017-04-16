#PXESERVER Version 0.1
FROM alpine:3.5
MAINTAINER charles.xiao "charles-xiao@live.com"
VOLUME /pxe
WORKDIR /pxe
COPY dnsmasq /usr/sbin
RUN chmod a+x /usr/sbin/dnsmasq
ENTRYPOINT ["dnsmasq -d"]
CMD ["--bind-dynamic",\
     "--except-interface lo",\
     "--listen-address 192.192.2.41",\
     "--dhcp-range 192.192.0.88,192.192.0.150",\
     "--dhcp-lease-max=253",\
     "--dhcp-no-override",\
     "--enable-tftp",\
     "--tftp-root=/tmp"\
    ]
