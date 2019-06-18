#!/bin/bash
#Copyright (c) 2018 Divested Computing Group
#License: GPLv3

if [[ $EUID -ne 0 ]]; then echo 'This script needs to be run as root!'; exit 1; fi;

echo "Enabling RPM Fusion Free";
if [ -f /etc/fedora-release ]; then
	dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm;
else
	yum install epel-release;
	yum localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm;
fi;
echo "Please verify the RPM Fusion signing keys from here https://rpmfusion.org/keys";
