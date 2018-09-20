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
			pacman -S --needed irqbalance openssh nano htop wget screen zip p7zip unrar pixz pigz lm_sensors dialog crda screenfetch ripgrep;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed downgrade lostfiles;
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
			pacman -Rsc screenfetch;
			pacman -Rsc ripgrep;
			pacman -Rsc downgrade;
			pacman -Rsc lostfiles;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Frameworks category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed gcc-multilib jre8-openjdk jre9-openjdk python;
			break;;
		No )
			pacman -Rsc gcc-multilib;
			pacman -Rsc jre8-openjdk;
			pacman -Rsc jre9-openjdk;
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

echo -e ${questionColor}Do you want packages from the Intel CPU Drivers category?${coloroff};
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

echo -e ${questionColor}Do you want packages from the NVIDIA Proprietary GPU Drivers category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed nvidia nvidia-libgl opencl-nvidia nvidia-utils lib32-nvidia-libgl lib32-nvidia-utils lib32-opencl-nvidia nvidia-settings;
			break;;
		No )
			pacman -Rsc nvidia;
			pacman -Rsc nvidia-libgl;
			pacman -Rsc opencl-nvidia;
			pacman -Rsc nvidia-utils;
			pacman -Rsc lib32-nvidia-libgl;
			pacman -Rsc lib32-nvidia-utils;
			pacman -Rsc lib32-opencl-nvidia;
			pacman -Rsc nvidia-settings;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the AMD/Intel/Nvidia FOSS GPU Acceleration category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed vdpauinfo libvdpau libvdpau-va-gl libva-vdpau-driver gstreamer-vaapi lib32-libvdpau lib32-libva-vdpau-driver libva-mesa-driver mesa-vdpau lib32-mesa-vdpau;
			break;;
		No )
			pacman -Rsc vdpauinfo;
			pacman -Rsc libvdpau;
			pacman -Rsc libvdpau-va-gl;
			pacman -Rsc libva-vdpau-driver;
			pacman -Rsc gstreamer-vaapi;
			pacman -Rsc lib32-libvdpau;
			pacman -Rsc lib32-libva-vdpau-driver;
			pacman -Rsc libva-mesa-driver;
			pacman -Rsc mesa-vdpau;
			pacman -Rsc lib32-mesa-vdpau;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Intel FOSS GPU Acceleration Extra category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed libva-intel-driver;
			break;;
		No )
			pacman -Rsc libva-intel-driver;
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

echo -e ${questionColor}Do you want packages from the Gnome category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed file-roller gnome gnome-terminal gnome-tweak-tool dconf-editor xdg-user-dirs;
			break;;
		No )
			pacman -Rsc file-roller;
			pacman -Rsc gnome;
			pacman -Rsc gnome-terminal;
			pacman -Rsc gnome-tweak-tool;
			pacman -Rsc dconf-editor;
			pacman -Rsc xdg-user-dirs;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Gnome Extensions category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed gnome-shell-extensions;
			break;;
		No )
			pacman -Rsc gnome-shell-extensions;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Gnome Extra category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed gnome-user-docs gnome-calendar gnome-characters gnome-font-viewer gnome-logs gnome-sound-recorder gnome-clocks gnome-maps gnome-contacts;
			break;;
		No )
			pacman -Rsc gnome-user-docs;
			pacman -Rsc gnome-calendar;
			pacman -Rsc gnome-characters;
			pacman -Rsc gnome-font-viewer;
			pacman -Rsc gnome-logs;
			pacman -Rsc gnome-sound-recorder;
			pacman -Rsc gnome-clocks;
			pacman -Rsc gnome-maps;
			pacman -Rsc gnome-contacts;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Gnome REMOVE category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed apache empathy epiphany five-or-more four-in-a-row gnome-dictionary gnome-documents gnome-hearts gnome-klotski gnome-weather gnome-music gnome-nettool gnome-nibbles gnome-phone-manager gnome-power-manager gnome-robots gnome-tetravex gnome-todo gnome-user-share gvfs-afc gvfs-goa gvfs-google gvfs-gphoto2 mod_dnssd sushi vino virtviewer;
			break;;
		No )
			pacman -Rsc apache;
			pacman -Rsc empathy;
			pacman -Rsc epiphany;
			pacman -Rsc five-or-more;
			pacman -Rsc four-in-a-row;
			pacman -Rsc gnome-dictionary;
			pacman -Rsc gnome-documents;
			pacman -Rsc gnome-hearts;
			pacman -Rsc gnome-klotski;
			pacman -Rsc gnome-weather;
			pacman -Rsc gnome-music;
			pacman -Rsc gnome-nettool;
			pacman -Rsc gnome-nibbles;
			pacman -Rsc gnome-phone-manager;
			pacman -Rsc gnome-power-manager;
			pacman -Rsc gnome-robots;
			pacman -Rsc gnome-tetravex;
			pacman -Rsc gnome-todo;
			pacman -Rsc gnome-user-share;
			pacman -Rsc gvfs-afc;
			pacman -Rsc gvfs-goa;
			pacman -Rsc gvfs-google;
			pacman -Rsc gvfs-gphoto2;
			pacman -Rsc mod_dnssd;
			pacman -Rsc sushi;
			pacman -Rsc vino;
			pacman -Rsc virtviewer;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Nemo category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed nemo nemo-fileroller;
			break;;
		No )
			pacman -Rsc nemo;
			pacman -Rsc nemo-fileroller;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Nautilus category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed nautilus;
			break;;
		No )
			pacman -Rsc nautilus;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Base category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed gksu gnome-keyring seahorse gvfs-mtp hyphen hyphen-en libmythes mythes-en hunspell hunspell-en aspell aspell-en gnome-screenshot gnome-calculator;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed numix-circle-icon-theme-git numix-icon-theme-git;
			fi
			break;;
		No )
			pacman -Rsc gksu;
			pacman -Rsc gnome-keyring;
			pacman -Rsc seahorse;
			pacman -Rsc gvfs-mtp;
			pacman -Rsc hyphen;
			pacman -Rsc hyphen-en;
			pacman -Rsc libmythes;
			pacman -Rsc mythes-en;
			pacman -Rsc hunspell;
			pacman -Rsc hunspell-en;
			pacman -Rsc aspell;
			pacman -Rsc aspell-en;
			pacman -Rsc gnome-screenshot;
			pacman -Rsc gnome-calculator;
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
			pacman -S --needed pavucontrol paprefs pulseaudio pulseaudio-alsa pulseaudio-gconf pulseaudio-zeroconf lib32-libcanberra-pulse;
			break;;
		No )
			pacman -Rsc pavucontrol;
			pacman -Rsc paprefs;
			pacman -Rsc pulseaudio;
			pacman -Rsc pulseaudio-alsa;
			pacman -Rsc pulseaudio-gconf;
			pacman -Rsc pulseaudio-zeroconf;
			pacman -Rsc lib32-libcanberra-pulse;
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
			break;;
		No )
			pacman -Rsc lynis;
			pacman -Rsc arch-audit;
			pacman -Rsc checksec;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Bluetooth category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed pulseaudio-bluetooth bluez-utils;
			break;;
		No )
			pacman -Rsc pulseaudio-bluetooth;
			pacman -Rsc bluez-utils;
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
			pacman -S --needed jdk8-openjdk jdk9-openjdk intellij-idea-community-edition proguard;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed jd-gui launch4j;
			fi
			break;;
		No )
			pacman -Rsc jdk8-openjdk;
			pacman -Rsc jdk9-openjdk;
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
			pacman -S --needed asp expac;
			break;;
		No )
			pacman -Rsc asp;
			pacman -Rsc expac;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Disks category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed gnome-disk-utility baobab testdisk smartmontools parted gnome-multi-writer;
			break;;
		No )
			pacman -Rsc gnome-disk-utility;
			pacman -Rsc baobab;
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
			pacman -S --needed libreoffice-fresh evince gedit meld pdfmod scribus;
			break;;
		No )
			pacman -Rsc libreoffice-fresh;
			pacman -Rsc evince;
			pacman -Rsc gedit;
			pacman -Rsc meld;
			pacman -Rsc pdfmod;
			pacman -Rsc scribus;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the E-Books category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed calibre;
			break;;
		No )
			pacman -Rsc calibre;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the File Backup category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed deja-dup;
			break;;
		No )
			pacman -Rsc deja-dup;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the File Encryption category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed ecryptfs-utils encfs cryfs;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed sirikali-git gocryptfs;
			fi
			break;;
		No )
			pacman -Rsc ecryptfs-utils;
			pacman -Rsc encfs;
			pacman -Rsc cryfs;
			pacman -Rsc sirikali-git;
			pacman -Rsc gocryptfs;
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
			pacman -S --needed quadrapassel gnome-2048 gnome-mines gnome-chess gnome-sudoku aisleriot;
			break;;
		No )
			pacman -Rsc quadrapassel;
			pacman -Rsc gnome-2048;
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
			pacman -S --needed aircrack-ng nmap wireshark-gtk hashcat;
			break;;
		No )
			pacman -Rsc aircrack-ng;
			pacman -Rsc nmap;
			pacman -Rsc wireshark-gtk;
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
			pacman -S --needed lollypop youtube-dl totem eog;
			break;;
		No )
			pacman -Rsc lollypop;
			pacman -Rsc youtube-dl;
			pacman -Rsc totem;
			pacman -Rsc eog;
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

echo -e ${questionColor}Do you want packages from the Screencast category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed obs-studio;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed peek;
			fi
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
			pacman -S --needed clamav rkhunter unhide rng-tools firejail;
			break;;
		No )
			pacman -Rsc clamav;
			pacman -Rsc rkhunter;
			pacman -Rsc unhide;
			pacman -Rsc rng-tools;
			pacman -Rsc firejail;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Tor category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed tor torsocks arm;
			break;;
		No )
			pacman -Rsc tor;
			pacman -Rsc torsocks;
			pacman -Rsc arm;
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
			pacman -S --needed libvirt virt-manager qemu ebtables;
			break;;
		No )
			pacman -Rsc libvirt;
			pacman -Rsc virt-manager;
			pacman -Rsc qemu;
			pacman -Rsc ebtables;
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

echo -e ${questionColor}Do you want packages from the Yubikey category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed yubikey-manager-qt yubikey-personalization-gui;
			break;;
		No )
			pacman -Rsc yubikey-manager-qt;
			pacman -Rsc yubikey-personalization-gui;
			break;;
		Skip )
			break;;
	esac;
done;

if [ "$aurPackagesEnabled" = "false" ]; then
	echo -e ${infoColor}Here are all the AUR packages that were not installed some may not of been chosen${coloroff}
	echo downgrade lostfiles numix-circle-icon-theme-git numix-icon-theme-git android-apktool sdat2img android-studio jd-gui launch4j sirikali-git gocryptfs scrub peek ;
fi

pacman -Rns $(pacman -Qttdq);
paccache -rk0;
