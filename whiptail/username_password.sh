#!/bin/bash
user=$(whiptail --inputbox "Kullanıcı Adı" 8 40 --title "Kullanıcı Adı" 3>&1 1>&2 2>&3)
passwd=$(whiptail --passwordbox "$user şifresi" 8 40 --title "Şifre" 3>&1 1>&2 2>&3)
