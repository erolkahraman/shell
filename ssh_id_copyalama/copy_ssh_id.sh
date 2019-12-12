#!/bin/bash

##--------------------------------------------------
##
## Script Name: copy_ssh_id.sh
## 
## This script takes IP addresses for YYAKCs from the
## yyakc_ip.txt file and copy RSA public key to each
## IP address.
## It uses p.txt password file with sshpass command 
## to send password for each session. 
## 
## Author: Erol Kahraman (erol.kahraman@tubitak.gov.tr)
## Date: 12.12.2019
## Version: 1.0
##
##--------------------------------------------------

while read IP
do
  ping -c 1 -W 2 $IP > /dev/null
  if [ $? -eq 0 ]; then
    echo "$IP adresine SSH anahtarı kopyalanıyor..."
    echo ""
    sshpass -f p.txt ssh-copy-id -o StrictHostKeyChecking=no -i /home/sadmin/.ssh/id_rsa.pub root@$IP
  else
    echo "$IP adresine erişilemiyor..." 
    echo ""
  fi
done < yyakc_ip.txt
