#!/bin/bash
#Copyright (c) 2017-2018 Divested Computing Group
#License: GPLv3

if [[ "$EUID" -ne "0" ]]; then echo 'This script needs to be run as root!'; exit 1; fi;

echo "Enabling automatic update download/install";
if [ -f /etc/fedora-release ]; then
	dnf install dnf-automatic;
	systemctl enable dnf-automatic-install.timer --now;
else
	echo "Currently only Fedora is supported";
fi;
