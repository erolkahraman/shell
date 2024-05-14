#!/bin/bash
while [ True ]
do
secim=$(whiptail --title "HeliTR Sunucuları" \
                 --menu "Sunucu Kümesini Seçin" 12 40 4 \
                 "1." "Yönetim Sunucuları" \
                 "2." "Radius Sunucuları" \
                 "3." "İletişim Sunucuları" \
                 "4." "Veri Tabanı Sunucuları" \
                 3>&1 1>&2 2>&3)

    if [ $? -gt 0 ]; then # user pressed <Cancel> button
        break
    fi

case $secim in
        "1.")
                echo bir
        ;;
        "2.")
                echo iki 
        ;;
        "3.")
                echo uc 
        ;;
        "4.")
                echo dort 
        ;;
esac
done
