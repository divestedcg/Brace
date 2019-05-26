#!/bin/bash
#Copyright (c) 2015-2018 Divested Computing, Inc.
#License: GPLv3
#Automatically generated! Please edit with care.

if [[ $EUID -ne 0 ]]; then echo 'This script needs to be run as root!'; exit 1; fi;

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

if [ -f /usr/bin/yaourt ]; then
	echo -e ${questionColor}Would you like to skip all AUR packages? They will be printed out later${coloroff};
	select yn in "Yes" "No"; do
		case $yn in
			Yes )
				aurPackagesEnabled=false;
				break;;
			No )
				aurPackagesEnabled=true;
				break;;
		esac
	done
else
	aurPackagesEnabled=false;
fi;

echo -e ${questionColor}Do you want packages from the Core category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed irqbalance openssh nano htop wget screen zip p7zip unrar pixz pigz lm_sensors dialog crda ripgrep lostfiles;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed downgrade;
			fi
			break;;
		No )
			pacman -Rsc irqbalance;
			pacman -Rsc openssh;
			pacman -Rsc nano;
			pacman -Rsc htop;
			pacman -Rsc wget;
			pacman -Rsc screen;
			pacman -Rsc zip;
			pacman -Rsc p7zip;
			pacman -Rsc unrar;
			pacman -Rsc pixz;
			pacman -Rsc pigz;
			pacman -Rsc lm_sensors;
			pacman -Rsc dialog;
			pacman -Rsc crda;
			pacman -Rsc ripgrep;
			pacman -Rsc lostfiles;
			pacman -Rsc downgrade;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Frameworks category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed gcc jre8-openjdk python;
			break;;
		No )
			pacman -Rsc gcc;
			pacman -Rsc jre8-openjdk;
			pacman -Rsc python;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Xorg category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed xorg-server xorg xorg-xinit xorg-server-xwayland;
			break;;
		No )
			pacman -Rsc xorg-server;
			pacman -Rsc xorg;
			pacman -Rsc xorg-xinit;
			pacman -Rsc xorg-server-xwayland;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Intel CPU Firmware category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed intel-ucode;
			break;;
		No )
			pacman -Rsc intel-ucode;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the AMD/Intel/Nvidia FOSS GPU Drivers category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed mesa lib32-mesa mesa-libgl lib32-mesa-libgl opencl-mesa libglvnd lib32-libglvnd;
			break;;
		No )
			pacman -Rsc mesa;
			pacman -Rsc lib32-mesa;
			pacman -Rsc mesa-libgl;
			pacman -Rsc lib32-mesa-libgl;
			pacman -Rsc opencl-mesa;
			pacman -Rsc libglvnd;
			pacman -Rsc lib32-libglvnd;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the VA-API category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed gstreamer-vaapi libva-mesa-driver libva-intel-driver intel-media-driver;
			break;;
		No )
			pacman -Rsc gstreamer-vaapi;
			pacman -Rsc libva-mesa-driver;
			pacman -Rsc libva-intel-driver;
			pacman -Rsc intel-media-driver;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the VDPAU category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed vdpauinfo libvdpau libvdpau-va-gl libva-vdpau-driver lib32-libvdpau lib32-libva-vdpau-driver mesa-vdpau lib32-mesa-vdpau;
			break;;
		No )
			pacman -Rsc vdpauinfo;
			pacman -Rsc libvdpau;
			pacman -Rsc libvdpau-va-gl;
			pacman -Rsc libva-vdpau-driver;
			pacman -Rsc lib32-libvdpau;
			pacman -Rsc lib32-libva-vdpau-driver;
			pacman -Rsc mesa-vdpau;
			pacman -Rsc lib32-mesa-vdpau;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Networking category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed networkmanager openvpn dnsmasq networkmanager-openvpn;
			break;;
		No )
			pacman -Rsc networkmanager;
			pacman -Rsc openvpn;
			pacman -Rsc dnsmasq;
			pacman -Rsc networkmanager-openvpn;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the GNOME category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed gnome gnome-tweak-tool seahorse dconf-editor;
			break;;
		No )
			pacman -Rsc gnome;
			pacman -Rsc gnome-tweak-tool;
			pacman -Rsc seahorse;
			pacman -Rsc dconf-editor;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the GNOME Remove Me category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed epiphany gnome-documents gnome-music;
			break;;
		No )
			pacman -Rsc epiphany;
			pacman -Rsc gnome-documents;
			pacman -Rsc gnome-music;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Base category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed hyphen hyphen-en libmythes mythes-en hunspell hunspell-en aspell aspell-en;
			break;;
		No )
			pacman -Rsc hyphen;
			pacman -Rsc hyphen-en;
			pacman -Rsc libmythes;
			pacman -Rsc mythes-en;
			pacman -Rsc hunspell;
			pacman -Rsc hunspell-en;
			pacman -Rsc aspell;
			pacman -Rsc aspell-en;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Theming category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed numix-circle-icon-theme-git numix-icon-theme-git;
			fi
			break;;
		No )
			pacman -Rsc numix-circle-icon-theme-git;
			pacman -Rsc numix-icon-theme-git;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Fonts category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed adobe-source-code-pro-fonts ttf-fira-mono ttf-fira-sans ttf-liberation cantarell-fonts gsfonts noto-fonts noto-fonts-emoji ttf-freefont;
			break;;
		No )
			pacman -Rsc adobe-source-code-pro-fonts;
			pacman -Rsc ttf-fira-mono;
			pacman -Rsc ttf-fira-sans;
			pacman -Rsc ttf-liberation;
			pacman -Rsc cantarell-fonts;
			pacman -Rsc gsfonts;
			pacman -Rsc noto-fonts;
			pacman -Rsc noto-fonts-emoji;
			pacman -Rsc ttf-freefont;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Audio category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed pavucontrol paprefs pulseaudio pulseaudio-alsa pulseaudio-zeroconf lib32-libcanberra-pulse pulseaudio-bluetooth bluez-utils;
			break;;
		No )
			pacman -Rsc pavucontrol;
			pacman -Rsc paprefs;
			pacman -Rsc pulseaudio;
			pacman -Rsc pulseaudio-alsa;
			pacman -Rsc pulseaudio-zeroconf;
			pacman -Rsc lib32-libcanberra-pulse;
			pacman -Rsc pulseaudio-bluetooth;
			pacman -Rsc bluez-utils;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Audio Manipulation category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed audacity;
			break;;
		No )
			pacman -Rsc audacity;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Audit category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed lynis arch-audit checksec;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed spectre-meltdown-checker;
			fi
			break;;
		No )
			pacman -Rsc lynis;
			pacman -Rsc arch-audit;
			pacman -Rsc checksec;
			pacman -Rsc spectre-meltdown-checker;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Communication category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed evolution;
			break;;
		No )
			pacman -Rsc evolution;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Communication Realtime category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed hexchat gajim;
			break;;
		No )
			pacman -Rsc hexchat;
			pacman -Rsc gajim;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Cryptocurrency category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed electrum;
			break;;
		No )
			pacman -Rsc electrum;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Development category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed git gitg ghex sqlitebrowser;
			break;;
		No )
			pacman -Rsc git;
			pacman -Rsc gitg;
			pacman -Rsc ghex;
			pacman -Rsc sqlitebrowser;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Development Android category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed android-udev android-tools enjarify;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed android-apktool sdat2img android-studio;
			fi
			break;;
		No )
			pacman -Rsc android-udev;
			pacman -Rsc android-tools;
			pacman -Rsc enjarify;
			pacman -Rsc android-apktool;
			pacman -Rsc sdat2img;
			pacman -Rsc android-studio;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Development Java category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed jdk8-openjdk intellij-idea-community-edition;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed proguard jd-gui launch4j;
			fi
			break;;
		No )
			pacman -Rsc jdk8-openjdk;
			pacman -Rsc intellij-idea-community-edition;
			pacman -Rsc proguard;
			pacman -Rsc jd-gui;
			pacman -Rsc launch4j;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Development Pacman category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed asp;
			break;;
		No )
			pacman -Rsc asp;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Disks category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed testdisk smartmontools parted gnome-multi-writer;
			break;;
		No )
			pacman -Rsc testdisk;
			pacman -Rsc smartmontools;
			pacman -Rsc parted;
			pacman -Rsc gnome-multi-writer;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Disk Support category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed btrfs-progs dosfstools exfat-utils f2fs-tools mtools ntfs-3g udftools xfsprogs;
			break;;
		No )
			pacman -Rsc btrfs-progs;
			pacman -Rsc dosfstools;
			pacman -Rsc exfat-utils;
			pacman -Rsc f2fs-tools;
			pacman -Rsc mtools;
			pacman -Rsc ntfs-3g;
			pacman -Rsc udftools;
			pacman -Rsc xfsprogs;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Documents category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed libreoffice-fresh meld scribus gnucash;
			break;;
		No )
			pacman -Rsc libreoffice-fresh;
			pacman -Rsc meld;
			pacman -Rsc scribus;
			pacman -Rsc gnucash;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the E-Books category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed gnome-books;
			break;;
		No )
			pacman -Rsc gnome-books;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the File Backup category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed backintime;
			fi
			break;;
		No )
			pacman -Rsc backintime;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the File Encryption category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed ecryptfs-utils encfs cryfs gocryptfs;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed sirikali-git;
			fi
			break;;
		No )
			pacman -Rsc ecryptfs-utils;
			pacman -Rsc encfs;
			pacman -Rsc cryfs;
			pacman -Rsc gocryptfs;
			pacman -Rsc sirikali-git;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the File Syncing category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed syncthing;
			break;;
		No )
			pacman -Rsc syncthing;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Flatpak category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed flatpak;
			break;;
		No )
			pacman -Rsc flatpak;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Tiny category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed quadrapassel gnome-mines gnome-chess gnome-sudoku aisleriot;
			break;;
		No )
			pacman -Rsc quadrapassel;
			pacman -Rsc gnome-mines;
			pacman -Rsc gnome-chess;
			pacman -Rsc gnome-sudoku;
			pacman -Rsc aisleriot;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Misc category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed neverball supertuxkart;
			break;;
		No )
			pacman -Rsc neverball;
			pacman -Rsc supertuxkart;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Sandbox category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed minetest;
			break;;
		No )
			pacman -Rsc minetest;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Arena category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed xonotic;
			break;;
		No )
			pacman -Rsc xonotic;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Large category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed 0ad wesnoth;
			break;;
		No )
			pacman -Rsc 0ad;
			pacman -Rsc wesnoth;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Hacking category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed aircrack-ng nmap wireshark-qt hashcat;
			break;;
		No )
			pacman -Rsc aircrack-ng;
			pacman -Rsc nmap;
			pacman -Rsc wireshark-qt;
			pacman -Rsc hashcat;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Image Manipulation category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed gimp inkscape darktable pitivi jpegoptim optipng;
			break;;
		No )
			pacman -Rsc gimp;
			pacman -Rsc inkscape;
			pacman -Rsc darktable;
			pacman -Rsc pitivi;
			pacman -Rsc jpegoptim;
			pacman -Rsc optipng;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Internet category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed firefox firefox-extension-https-everywhere liferea;
			break;;
		No )
			pacman -Rsc firefox;
			pacman -Rsc firefox-extension-https-everywhere;
			pacman -Rsc liferea;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Mapping category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed viking;
			break;;
		No )
			pacman -Rsc viking;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Music Management category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed picard soundconverter sound-juicer;
			break;;
		No )
			pacman -Rsc picard;
			pacman -Rsc soundconverter;
			pacman -Rsc sound-juicer;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Media category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed lollypop youtube-dl;
			break;;
		No )
			pacman -Rsc lollypop;
			pacman -Rsc youtube-dl;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Media HTPC category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed kodi;
			break;;
		No )
			pacman -Rsc kodi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Passwords category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed keepassxc pwgen;
			break;;
		No )
			pacman -Rsc keepassxc;
			pacman -Rsc pwgen;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Privacy category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed bleachbit wipe;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed scrub;
			fi
			break;;
		No )
			pacman -Rsc bleachbit;
			pacman -Rsc wipe;
			pacman -Rsc scrub;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Remote category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed x2goclient;
			break;;
		No )
			pacman -Rsc x2goclient;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Screencast category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed obs-studio peek;
			break;;
		No )
			pacman -Rsc obs-studio;
			pacman -Rsc peek;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Security category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed clamav clamtk rkhunter unhide rng-tools firejail linux-hardened apparmor;
			break;;
		No )
			pacman -Rsc clamav;
			pacman -Rsc clamtk;
			pacman -Rsc rkhunter;
			pacman -Rsc unhide;
			pacman -Rsc rng-tools;
			pacman -Rsc firejail;
			pacman -Rsc linux-hardened;
			pacman -Rsc apparmor;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Tor category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed tor torsocks;
			break;;
		No )
			pacman -Rsc tor;
			pacman -Rsc torsocks;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Torrenting category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed transmission-gtk;
			break;;
		No )
			pacman -Rsc transmission-gtk;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Utility category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed whois mtr stress iotop wavemon pv tree iperf3 bmon powertop ncdu;
			break;;
		No )
			pacman -Rsc whois;
			pacman -Rsc mtr;
			pacman -Rsc stress;
			pacman -Rsc iotop;
			pacman -Rsc wavemon;
			pacman -Rsc pv;
			pacman -Rsc tree;
			pacman -Rsc iperf3;
			pacman -Rsc bmon;
			pacman -Rsc powertop;
			pacman -Rsc ncdu;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Virtualization libvirt category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed libvirt virt-manager qemu;
			break;;
		No )
			pacman -Rsc libvirt;
			pacman -Rsc virt-manager;
			pacman -Rsc qemu;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Wine category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed wine-staging winetricks;
			break;;
		No )
			pacman -Rsc wine-staging;
			pacman -Rsc winetricks;
			break;;
		Skip )
			break;;
	esac;
done;

if [ "$aurPackagesEnabled" = "false" ]; then
	echo -e ${infoColor}Here are all the AUR packages that were not installed some may not of been chosen${coloroff}
	echo downgrade numix-circle-icon-theme-git numix-icon-theme-git spectre-meltdown-checker android-apktool sdat2img android-studio proguard jd-gui launch4j backintime sirikali-git scrub ;
fi

pacman -Rns $(pacman -Qttdq);
paccache -rk0;
