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
echo "F32: 7BDA98EF593050A34B1697ABA0EE9D83100BCD92";
echo "EL8: 837935CD19E123AA7F8A8E69979F0C69158B3811";
echo "EL7: DB9A9A57CAFD23DA3A88792F758B3D18F5CF6C1E";
