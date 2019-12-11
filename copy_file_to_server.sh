# !/bin/bash

#PATH_FOR_YYAKC=/opt/skaas/bin
PATH_FOR_YYAKC=/tmp
FILE_NAME=ystvYerel.py
CMD_SCP=/usr/bin/scp
CMD_CLR=/usr/bin/clear
USER_NAME=erolk

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

$CMD_CLR
echo -e "${RED}
###########################################################################
#
# Bu betik ile ilgili YYAKCnin yayinlari merkeze aktarimi durdurulacaktir!
#
###########################################################################
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
        echo -e "${RED}Hatali bir giris yatiniz ($IP_ADRESI)!"
        echo -e "Her bir oktet 255ten buyuk olamaz.${NC}"
        exit 1
      fi
    done
    put_file_to_yyakc
    echo ""
#    echo "Dogru bir IP adresi girdiniz ($IP_ADRESI)."
    exit 0
  else
    echo -e "${RED}Hatali bir giris yatiniz ($IP_ADRESI)!"
    echo -e "IP adresi format hatasi.${NC}"
    exit 1
  fi

}

put_file_to_yyakc(){

  if [ -e $FILE_NAME ]; then
    $CMD_SCP $FILE_NAME $USER_NAME@$IP_ADRESI:$PATH_FOR_YYAKC
      if [ $? -eq 0 ]; then
        echo ""
        echo -e "${GREEN}Islem basari ile tamamlandi...${NC}"
      else
        echo -e "${RED}Hata! Islem basari ile tamamlanamadi...${NC}"
      fi
  else
    echo "$FILE_NAME mevcut degil veya betik ile ayni dizinde degil..."
  fi
}

while true; do
    read -p "Devam etmek istiyor musunuz ([E]vet/[H]ayir)? > " eh
    echo ""
    case $eh in
        [Ee]* ) get_ip_addr;exit;;
        [Hh]* ) exit;;
        * ) echo "Evet/Hayir";;
    esac
done

