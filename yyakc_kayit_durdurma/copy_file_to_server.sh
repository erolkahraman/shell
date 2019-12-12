# !/bin/bash

##--------------------------------------------------
##
## Script Name: copy_file_to_server.sh
##
## This script takes IP address of YYAKC from user and send 
## ystvYerel.py file to specified path. The ystvYerel.py file blocks
## transfer of recorded video files to the central archive.
##
## Author: Erol Kahraman (erol.kahraman@tubitak.gov.tr)
## Date: 12.12.2019
## Version: 1.0
##
##--------------------------------------------------

PATH_YYAKC=/opt/skaas/bin
FILE_NAME=ystvYerel.py
CMD_SCP=/usr/bin/scp
CMD_CLR=/usr/bin/clear
USER_NAME=root

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

$CMD_CLR
echo "${RED}
##################################################################################
#
# Bu betik ile belirtilen YYAKC'nin yayinlari merkeze aktarimi durdurulacaktir!
#
##################################################################################
${NC}
"
get_ip_addr(){

# Get IP adress
  echo -n "Lutfen YYAKC'nin IP adresini giriniz > "
  read IP_ADRESI

# Check for IP adress format
  if expr "$IP_ADRESI" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null; then
    for i in 1 2 3 4; do
      if [ $(echo "$IP_ADRESI" | cut -d. -f$i) -gt 255 ]; then
        echo "${RED}Hatali bir giris yatiniz ($IP_ADRESI)!"
        echo "Her bir oktet 255ten buyuk olamaz.${NC}"
        exit 1
      fi
    done
    put_file_to_yyakc
    echo ""
    exit 0
  else
    echo "${RED}Hatali bir giris yatiniz ($IP_ADRESI)!"
    echo "IP adresi format hatasi.${NC}"
    exit 1
  fi

}

put_file_to_yyakc(){

  if [ -e $FILE_NAME ]; then
    $CMD_SCP $FILE_NAME $USER_NAME@$IP_ADRESI:$PATH_YYAKC
      if [ $? -eq 0 ]; then
        echo ""
        echo "${GREEN}Islem basari ile tamamlandi...${NC}"
      else
        echo "${RED}Hata! Islem basari ile tamamlanamadi...${NC}"
      fi
  else
    echo "$FILE_NAME mevcut degil veya betik ile ayni dizinde degil..."
  fi
}

while true; do
    read -p "Devam etmek istiyor musunuz ([e]vet/[h]ayir)? > " eh
    echo ""
    case $eh in
        [Ee]* ) get_ip_addr;exit;;
        [Hh]* ) exit;;
        * ) echo "Evet/Hayir";;
    esac
done

