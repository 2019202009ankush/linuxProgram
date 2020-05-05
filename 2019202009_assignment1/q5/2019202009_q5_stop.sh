#!/bin/bash
sudo killall openvpn
cur="$PWD"
cur+="/ubuntu.ovpn"
rm "$cur"
sudo sed -i 's/nameserver 10.4.20.204 //g' /etc/resolv.conf