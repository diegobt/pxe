#!/bin/bash

### DHCPD configuration
apt-get install -y isc-dhcp-server
cp /config/dhcpd.conf /etc/dhcp/dhcpd.conf
cp /config/isc-dhcp-server /etc/default/isc-dhcp-server
systemctl restart isc-dhcp-server

### TFTPD configuration
apt-get install -y tftpd-hpa
cp /config/tftpd-hpa /etc/default/tftpd-hpa
mkdir /tftpboot

### Copy PXE folder to boot
cp -R /resources/clonezilla/* /tftpboot/
systemctl restart tftpd-hpa

### PXE configuration
apt-get install -y pxe
