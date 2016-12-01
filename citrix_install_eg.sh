#!/bin/bash 


cd ~
mkdir citrix
cd citrix
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo Scarico il pacchetto Receiver Citrix:
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wget https://downloads.citrix.com/10837/icaclient_13.4.0.10109380_amd64.deb?__gda__=1480543910_c2e569ca6996a3dad76a5ca5b7428d9c
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo Scarico il pacchetto USB Support per Citrix:
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wget https://downloads.citrix.com/10835/ctxusb_2.7.10109380_amd64.deb?__gda__=1480543910_021855215700eaff0597029b02a22eeb
pacchetti="pacchetti"
pacchetti=$(ls )
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo ora mi servono i permessi di root:
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sudo dpkg -i $pacchetti
cd ~
rm -r citrix

sudo apt-get install figlet
sudo apt-get install aview
mkdir lac
cd lac
wget https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqvcdY8yrmIjg-rxuJltUZThiXOJep1Qgeyxn5-6Xoi6_ZObNm
foto="foto"
foto=$(ls)
figlet "COME ON GUYS, PLAY THE MUSIC"
echo Firmato : Andrea Leonardo Lacaita
echo detto il sommo
echo "do you want to close the program?(Y/N)"
read  parola
asciiview $foto -driver curses
cd ~
rm -r lac

/opt/Citrix/ICAClient/util/configmgr &
sudo ln -s /usr/share/ca-certificates/mozilla/* /opt/Citrix/ICAClient/keystore/cacerts/
sudo c_rehash /opt/Citrix/ICAClient/keystore/cacerts/
sudo rm -f /usr/lib/mozilla/plugins/npwrapper.npica.so /usr/lib/firefox/plugins/npwrapper.npica.so
sudo rm -f /usr/lib/mozilla/plugins/npica.so
sudo ln -s /opt/Citrix/ICAClient/npica.so /usr/lib/mozilla/plugins/npica.so
sudo ln -s /opt/Citrix/ICAClient/npica.so /usr/lib/firefox-addons/plugins/npica.so

xdg-mime default wfica.desktop application/x-ica
