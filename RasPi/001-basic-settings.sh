#!/bin/sh
# 
echo
echo "############# Konfiguration der Raspi:Tastatur, Bootoption... ###############"
sudo raspi-config
echo "############# System Updates/Upgrades ausführen & Installation der 'unattended_upgrades' ###############"
sudo apt update -y  
sudo apt-get upgrade -y


echo "############# Zusätzliche Software' ###############"
sudo apt-get install gparted -y
sudo apt-get install gnome-disk-utility -y
sudo apt-get install nautilus -y
sudo apt-get install lshw -y
sudo apt-get install curl -y
sudo apt-get install wget -y


echo "############# Anlage eines neuen Users und Passwort vergeben ' ###############"
echo "Wie soll der neue Benutzername lauten?"
user="tj"
echo $user
 
sudo useradd -m $user #User mit Homeverzeichnis anlegen
sudo gpasswd -a $user sudo
sudo gpasswd $user 

echo "############# Aufnahme in alle Gruppen in denen Pi Mitglied ist ' ###############"
sudo adduser $user adm
sudo adduser $user dialout
sudo adduser $user cdrom
sudo adduser $user sudo
sudo adduser $user audio
sudo adduser $user video
sudo adduser $user plugdev
sudo adduser $user games
sudo adduser $user users
sudo adduser $user input
sudo adduser $user netdev
sudo adduser $user spi
sudo adduser $user i2c
sudo adduser $user gpio

echo "############# Installation abgeschlossen, das System wird neu gestartet ###############"
sudo reboot 
