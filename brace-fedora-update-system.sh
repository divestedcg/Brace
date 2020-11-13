#!/bin/bash
#Copyright (c) 2018-2020 Divested Computing Group
#License: GPLv3

if [[ "$EUID" -ne "0" ]]; then echo 'This script needs to be run as root!'; exit 1; fi;

if [ -f /etc/fedora-release ]; then
	if [ -z $1 ]; then echo 'You must provide a version to upgrade to'; exit 1; fi;

	dnf distro-sync --refresh;
	dnf install dnf-plugin-system-upgrade;
	dnf system-upgrade download --refresh --releasever="$1";
else
	echo "Currently only Fedora is supported";
fi;
