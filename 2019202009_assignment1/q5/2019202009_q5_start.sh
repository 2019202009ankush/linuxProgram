#!/bin/bash
          B="openvpn"
          dpkg -s "$B" &> /dev/null
	      if [ $? -eq 0 ]; 
	      then
          echo "$B is already installed and we are opening it"
          
          else
          sudo apt install openvpn
           
          fi
echo "Please enter your vpn user name"
read unam
cur="$PWD"
cur+="/ubuntu.ovpn"
wget --user "$unam" --ask-password -P "$PWD" https://vpn.iiit.ac.in/secure/ubuntu.ovpn

sudo sed -i '1s/^/nameserver 10.4.20.204 /' /etc/resolv.conf

sudo openvpn --config "$cur"
