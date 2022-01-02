#!/bin/bash

#Install tools
if [[ $1 == -i ]]; then
    sudo apt update -y ; sudo apt install -y tor proxychains nmap hydra netdiscover curl jq links && clear || exit
    service tor status

#Tor Status
elif [[ $1 == -s ]]; then
    service tor status

#Edit config proxychains socks4 to socks5
elif [[ $1 == -conf ]]; then
    sudo nano /etc/proxychains.conf

#Your private ip
elif [[ $1 == -ip ]]; then
    sudo hostname -I    

#Scan local network 
elif [[ $1 == -localn ]]; then
    sudo netdiscover       

#Scan nmap + proxychains ip
elif [[ $1 == -n ]]; then
    sudo proxychains nmap -v -Pn -O -T2 $2

#Atack hydra ssh
elif [[ $1 == -ssh ]]; then
    sudo proxychains hydra -l $2 -P $3 $4 ssh

#Atack nmap ftp
elif [[ $1 == -ftp ]]; then
    sudo proxychains nmap --script ftp-brute -p 21 $2

#Help
elif [[ $1 == -h ]]; then
    echo -e "Usage portx:"
    echo -e "portx -conf: ------------------------------------------ Edit config proxychains socks4 to socks5"
    echo -e "portx -i: --------------------------------------------- Install tools"
    echo -e "portx -s: --------------------------------------------- Tor status"
    echo -e "portx -ip --------------------------------------------- Your private ip"
    echo -e "portx -localn ----------------------------------------- Scan local network"    
    echo -e "portx -n (ip): ---------------------------------------- Scan port nmap + proxychains"
    echo -e "portx -ssh (user) (/worldlist.txt) (ip): -------------- Atack hydra ssh"
    echo -e "portx -ftp (ip): -------------------------------------- Atack nmap ftp"
    echo -e "portx -h: --------------------------------------------- help"
fi