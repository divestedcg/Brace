#!/bin/bash
#Copyright (c) 2015-2018 Divested Computing, Inc.
#License: GPLv3
#Automatically generated! Please edit with care.

coloroff='\e[0m';
black='\e[0;30m';
blue='\e[0;34m';
cyan='\e[0;36m';
green='\e[0;32m';
purple='\e[0;35m';
red='\e[0;31m';
white='\e[0;37m';
yellow='\e[0;33m';
infoColor=${green};
questionColor=${yellow};
outputColor=${yellow};

echo -e ${questionColor}Would you like to uninstall packages from groups that arent selected?${coloroff};
select yn in "Yes" "No"; do
	case $yn in
		Yes )
			uninstallPackagesEnabled=true;
			break;;
		No )
			uninstallPackagesEnabled=false;
			break;;
	esac
done

if [ -f /etc/centos-release ]; then yum install epel-release; fi;

echo -e ${questionColor}Do you want packages from the Core category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install irqbalance nano htop screen p7zip pixz lm_sensors parallel screenfetch;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove irqbalance nano htop screen p7zip pixz lm_sensors parallel screenfetch;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Frameworks category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install java-1.8.0-openjdk;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove java-1.8.0-openjdk;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Base category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install @multimedia aspell aspell-en gnome-terminal-nautilus gnome-tweak-tool dconf-editor numix-icon-theme-circle seahorse;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove @multimedia aspell aspell-en gnome-terminal-nautilus gnome-tweak-tool dconf-editor numix-icon-theme-circle seahorse;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Fonts category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install adobe-source-code-pro-fonts mozilla-fira-mono-fonts mozilla-fira-sans-fonts google-droid-sans-fonts google-droid-sans-mono-fonts google-droid-serif-fonts;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove adobe-source-code-pro-fonts mozilla-fira-mono-fonts mozilla-fira-sans-fonts google-droid-sans-fonts google-droid-sans-mono-fonts google-droid-serif-fonts;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Audio Manipulation category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install audacity;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove audacity;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Audit category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install lynis checksec;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove lynis checksec;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Backup category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install borgbackup;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove borgbackup;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Communication category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install evolution;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove evolution;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Communication Realtime category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install polari mumble;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove polari mumble;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Development category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install java-1.8.0-openjdk-devel gitg proguard bless sqlitebrowser fedpkg @development-tools;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove java-1.8.0-openjdk-devel gitg proguard bless sqlitebrowser fedpkg @development-tools;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Development Android category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install android-tools;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove android-tools;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Disks category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install testdisk smartmontools mediawriter hdparm;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove testdisk smartmontools mediawriter hdparm;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Documents category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install libreoffice meld pdfmod;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove libreoffice meld pdfmod;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the File Encryption category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install ecryptfs-utils encfs;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove ecryptfs-utils encfs;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the File Syncing category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install syncthing;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove syncthing;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Tiny category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install quadrapassel gnome-2048 gnome-mines aisleriot;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove quadrapassel gnome-2048 gnome-mines aisleriot;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Hacking category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install aircrack-ng nmap wireshark-gtk;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove aircrack-ng nmap wireshark-gtk;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Image Manipulation category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install gimp inkscape darktable pitivi jpegoptim optipng;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove gimp inkscape darktable pitivi jpegoptim optipng;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Internet category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install firefox mozilla-https-everywhere mozilla-ublock-origin;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove firefox mozilla-https-everywhere mozilla-ublock-origin;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Maps category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install viking;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove viking;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Media Management category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install picard soundconverter sound-juicer;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove picard soundconverter sound-juicer;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Media Management Books category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install calibre;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove calibre;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Media category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install lollypop youtube-dl;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove lollypop youtube-dl;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Passwords category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install keepassxc pwgen;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove keepassxc pwgen;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Privacy category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install bleachbit srm;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove bleachbit srm;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Security category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install clamav clamav-data-empty clamav-update clamtk unhide chkrootkit firewall-config;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove clamav clamav-data-empty clamav-update clamtk unhide chkrootkit firewall-config;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Tor category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install tor torsocks tor-arm onionshare torbrowser-launcher;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove tor torsocks tor-arm onionshare torbrowser-launcher;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Torrenting category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install transmission;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove transmission;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Utility category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install whois mtr vdpauinfo stress iotop wavemon tree pv iperf3 bmon powertop ncdu;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove whois mtr vdpauinfo stress iotop wavemon tree pv iperf3 bmon powertop ncdu;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Wine category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install winetricks wine;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove winetricks wine;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Yubikey category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install yubikey-personalization-gui;
			break;;
		No )
			if [ "$uninstallPackagesEnabled" = "true" ]; then
				yum remove yubikey-personalization-gui;
			fi;
			break;;
		Skip )
			break;;
	esac;
done;

yum autoremove;
