#!/bin/bash
#Copyright (c) 2018 Divested Computing Group
#License: GPLv3

if [[ "$EUID" -ne "0" ]]; then echo 'This script needs to be run as root!'; exit 1; fi;

echo "Enabling RPM Fusion Free";
if [ -f /etc/fedora-release ]; then
	dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm;
else
	yum install epel-release;
	yum localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %centos).noarch.rpm;
fi;
echo "Please verify the RPM Fusion signing keys from here: https://rpmfusion.org/keys";
echo "F33: E9A4 91A3 DE24 7814 E7E0  67EA E06F 8ECD D651 FF2E";
echo "F32: 7BDA 98EF 5930 50A3 4B16  97AB A0EE 9D83 100B CD92";
echo "EL8: 8379 35CD 19E1 23AA 7F8A  8E69 979F 0C69 158B 3811";
echo "EL7: DB9A 9A57 CAFD 23DA 3A88  792F 758B 3D18 F5CF 6C1E";
