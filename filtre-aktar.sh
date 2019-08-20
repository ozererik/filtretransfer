#!/bin/bash
clear
echo "$1 kullanicisinin filtreleri aktarilmak icin hazirlaniyor...." 
filter=`su - zimbra -c "zmprov ga $1 zimbraMailSieveScript" > /tmp/$1`
sed -i -e "1d" /tmp/$1
sed 's/zimbraMailSieveScript: //g' /tmp/$1 > /srv/filter/$2
rm /tmp/$1
StrFilter=`cat /srv/filter/$2`
su - zimbra -c "zmprov ma $2 zimbraMailSieveScript '$StrFilter'" 
echo "$1 kullanicisinin filtreleri $2 kullanicisina aktariliyor..." 
echo "Tüm filtreler $2 kullanicisina aktarildi." 
rm /srv/filter/$2
