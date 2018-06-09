#!/bin/bash

packages="";

#Personally Installed
packages=$packages" brasero";
#CentOS 7
packages=$packages" empathy";
#Workstation (GNOME)
packages=$packages" rhythmbox gnome-documents gnome-weather";
#KDE
packages=$packages" kmahjongg konqueror amarok k3b";
#LXDE
packages=$packages" gnumeric abiword midori xpad pidgin asunder lxmusic clipit";
#LXQT
packages=$packages" yarock qlipper quassel qupzilla";
#MATE
packages=$packages" xfburn gnote filezilla hexchat transmission exaile gparted";
#XFCE
packages=$packages" clipman xfburn geany pidgin transmission asunder pragha abiword gnumeric gparted xfdashboard";

sudo dnf remove $packages
