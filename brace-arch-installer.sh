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
			pacman -S --needed irqbalance git openssh nano htop wget screen zip p7zip unrar pixz pigz lm_sensors dialog crda android-udev parallel screenfetch ripgrep;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed downgrade;
			fi
			break;;
		No )
			pacman -Rsc irqbalance;
			pacman -Rsc git;
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
			pacman -Rsc android-udev;
			pacman -Rsc parallel;
			pacman -Rsc screenfetch;
			pacman -Rsc ripgrep;
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
			pacman -S --needed gcc-multilib jdk8-openjdk jre8-openjdk jdk9-openjdk jre9-openjdk python;
			break;;
		No )
			pacman -Rsc gcc-multilib;
			pacman -Rsc jdk8-openjdk;
			pacman -Rsc jre8-openjdk;
			pacman -Rsc jdk9-openjdk;
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

echo -e ${questionColor}Do you want packages from the Xorg Remove category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed xorg-iceauth xorg-luit xorg-server-xephyr xorg-sessreg xorg-smproxy xorg-x11perf xorg-xbacklight xorg-xcmsdb xorg-xcursorgen xorg-xdriinfo xorg-xev xorg-xgamma xorg-xkbevd xorg-xkbutils xorg-xkill xorg-xlsatoms xorg-xlsclients xorg-xpr xorg-xrefresh xorg-xsetroot xorg-xvinfo xorg-xwd xorg-xwininfo xorg-xwud;
			break;;
		No )
			pacman -Rsc xorg-iceauth;
			pacman -Rsc xorg-luit;
			pacman -Rsc xorg-server-xephyr;
			pacman -Rsc xorg-sessreg;
			pacman -Rsc xorg-smproxy;
			pacman -Rsc xorg-x11perf;
			pacman -Rsc xorg-xbacklight;
			pacman -Rsc xorg-xcmsdb;
			pacman -Rsc xorg-xcursorgen;
			pacman -Rsc xorg-xdriinfo;
			pacman -Rsc xorg-xev;
			pacman -Rsc xorg-xgamma;
			pacman -Rsc xorg-xkbevd;
			pacman -Rsc xorg-xkbutils;
			pacman -Rsc xorg-xkill;
			pacman -Rsc xorg-xlsatoms;
			pacman -Rsc xorg-xlsclients;
			pacman -Rsc xorg-xpr;
			pacman -Rsc xorg-xrefresh;
			pacman -Rsc xorg-xsetroot;
			pacman -Rsc xorg-xvinfo;
			pacman -Rsc xorg-xwd;
			pacman -Rsc xorg-xwininfo;
			pacman -Rsc xorg-xwud;
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
			pacman -S --needed libvdpau libvdpau-va-gl libva-vdpau-driver gstreamer-vaapi lib32-libvdpau lib32-libva-vdpau-driver libva-mesa-driver mesa-vdpau lib32-mesa-vdpau;
			break;;
		No )
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
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed gnome-shell-extension-volume-mixer;
			fi
			break;;
		No )
			pacman -Rsc gnome-shell-extension-volume-mixer;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Gnome Extensions Extra category?${coloroff};
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
			pacman -S --needed apache empathy epiphany five-or-more four-in-a-row gnome-boxes gnome-dictionary gnome-documents gnome-hearts gnome-initial-setup gnome-klotski gnome-weather gnome-music gnome-nettool gnome-nibbles gnome-phone-manager gnome-photos gnome-power-manager gnome-robots gnome-software gnome-system-log gnome-system-monitor gnome-tetravex gnome-todo gnome-user-share gucharmap gvfs-afc gvfs-goa gvfs-google gvfs-gphoto2 mod_dnssd sushi tracker vino virtviewer;
			break;;
		No )
			pacman -Rsc apache;
			pacman -Rsc empathy;
			pacman -Rsc epiphany;
			pacman -Rsc five-or-more;
			pacman -Rsc four-in-a-row;
			pacman -Rsc gnome-boxes;
			pacman -Rsc gnome-dictionary;
			pacman -Rsc gnome-documents;
			pacman -Rsc gnome-hearts;
			pacman -Rsc gnome-initial-setup;
			pacman -Rsc gnome-klotski;
			pacman -Rsc gnome-weather;
			pacman -Rsc gnome-music;
			pacman -Rsc gnome-nettool;
			pacman -Rsc gnome-nibbles;
			pacman -Rsc gnome-phone-manager;
			pacman -Rsc gnome-photos;
			pacman -Rsc gnome-power-manager;
			pacman -Rsc gnome-robots;
			pacman -Rsc gnome-software;
			pacman -Rsc gnome-system-log;
			pacman -Rsc gnome-system-monitor;
			pacman -Rsc gnome-tetravex;
			pacman -Rsc gnome-todo;
			pacman -Rsc gnome-user-share;
			pacman -Rsc gucharmap;
			pacman -Rsc gvfs-afc;
			pacman -Rsc gvfs-goa;
			pacman -Rsc gvfs-google;
			pacman -Rsc gvfs-gphoto2;
			pacman -Rsc mod_dnssd;
			pacman -Rsc sushi;
			pacman -Rsc tracker;
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
			pacman -S --needed ttf-dejavu ttf-ubuntu-font-family ttf-droid adobe-source-code-pro-fonts ttf-fira-mono ttf-fira-sans ttf-liberation ttf-roboto cantarell-fonts gsfonts noto-fonts noto-fonts-emoji tex-gyre-fonts ttf-anonymous-pro ttf-hack ttf-inconsolata ttf-freefont ttf-croscore ttf-symbola otf-overpass;
			break;;
		No )
			pacman -Rsc ttf-dejavu;
			pacman -Rsc ttf-ubuntu-font-family;
			pacman -Rsc ttf-droid;
			pacman -Rsc adobe-source-code-pro-fonts;
			pacman -Rsc ttf-fira-mono;
			pacman -Rsc ttf-fira-sans;
			pacman -Rsc ttf-liberation;
			pacman -Rsc ttf-roboto;
			pacman -Rsc cantarell-fonts;
			pacman -Rsc gsfonts;
			pacman -Rsc noto-fonts;
			pacman -Rsc noto-fonts-emoji;
			pacman -Rsc tex-gyre-fonts;
			pacman -Rsc ttf-anonymous-pro;
			pacman -Rsc ttf-hack;
			pacman -Rsc ttf-inconsolata;
			pacman -Rsc ttf-freefont;
			pacman -Rsc ttf-croscore;
			pacman -Rsc ttf-symbola;
			pacman -Rsc otf-overpass;
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

echo -e ${questionColor}Do you want packages from the Backup category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed borg;
			break;;
		No )
			pacman -Rsc borg;
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
			pacman -S --needed hexchat mumble gajim;
			break;;
		No )
			pacman -Rsc hexchat;
			pacman -Rsc mumble;
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
			pacman -S --needed gitg asp intellij-idea-community-edition proguard ghex sqlitebrowser;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed jd-gui launch4j;
			fi
			break;;
		No )
			pacman -Rsc gitg;
			pacman -Rsc asp;
			pacman -Rsc intellij-idea-community-edition;
			pacman -Rsc proguard;
			pacman -Rsc ghex;
			pacman -Rsc sqlitebrowser;
			pacman -Rsc jd-gui;
			pacman -Rsc launch4j;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Development Android category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed android-tools;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed android-apktool dex2jar jd-gui sdat2img android-studio;
			fi
			break;;
		No )
			pacman -Rsc android-tools;
			pacman -Rsc android-apktool;
			pacman -Rsc dex2jar;
			pacman -Rsc jd-gui;
			pacman -Rsc sdat2img;
			pacman -Rsc android-studio;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Disks category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed gnome-disk-utility baobab testdisk parted ntfs-3g dosfstools mtools exfat-utils smartmontools gnome-multi-writer;
			break;;
		No )
			pacman -Rsc gnome-disk-utility;
			pacman -Rsc baobab;
			pacman -Rsc testdisk;
			pacman -Rsc parted;
			pacman -Rsc ntfs-3g;
			pacman -Rsc dosfstools;
			pacman -Rsc mtools;
			pacman -Rsc exfat-utils;
			pacman -Rsc smartmontools;
			pacman -Rsc gnome-multi-writer;
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

echo -e ${questionColor}Do you want packages from the Firmware Updates category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed fwupd;
			break;;
		No )
			pacman -Rsc fwupd;
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

echo -e ${questionColor}Do you want packages from the Games - Steam category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed steam;
			break;;
		No )
			pacman -Rsc steam;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Minecraft category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed multimc5;
			fi
			break;;
		No )
			pacman -Rsc multimc5;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Xonotic category?${coloroff};
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

echo -e ${questionColor}Do you want packages from the Games - Misc category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed supertux neverball;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed opsu;
			fi
			break;;
		No )
			pacman -Rsc supertux;
			pacman -Rsc neverball;
			pacman -Rsc opsu;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Misc - Large category?${coloroff};
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
			pacman -S --needed gimp inkscape jpegoptim optipng;
			break;;
		No )
			pacman -Rsc gimp;
			pacman -Rsc inkscape;
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
			pacman -S --needed chromium firefox liferea;
			break;;
		No )
			pacman -Rsc chromium;
			pacman -Rsc firefox;
			pacman -Rsc liferea;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Proprietary Chromium Extensions category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed chromium-pepper-flash chromium-widevine;
			fi
			break;;
		No )
			pacman -Rsc chromium-pepper-flash;
			pacman -Rsc chromium-widevine;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Maps category?${coloroff};
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

echo -e ${questionColor}Do you want packages from the Media Management category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed picard soundconverter sound-juicer;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed filebot;
			fi
			break;;
		No )
			pacman -Rsc picard;
			pacman -Rsc soundconverter;
			pacman -Rsc sound-juicer;
			pacman -Rsc filebot;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Media Management Other category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed calibre brasero;
			break;;
		No )
			pacman -Rsc calibre;
			pacman -Rsc brasero;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Media category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed lollypop totem eog youtube-dl;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed pithos-git;
			fi
			break;;
		No )
			pacman -Rsc lollypop;
			pacman -Rsc totem;
			pacman -Rsc eog;
			pacman -Rsc youtube-dl;
			pacman -Rsc pithos-git;
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
			break;;
		No )
			pacman -Rsc bleachbit;
			pacman -Rsc wipe;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Remote category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed remmina freerdp;
			break;;
		No )
			pacman -Rsc remmina;
			pacman -Rsc freerdp;
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
			pacman -S --needed clamav rkhunter rng-tools unhide;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed firejail-git;
			fi
			break;;
		No )
			pacman -Rsc clamav;
			pacman -Rsc rkhunter;
			pacman -Rsc rng-tools;
			pacman -Rsc unhide;
			pacman -Rsc firejail-git;
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
			pacman -S --needed transmission-cli transmission-gtk;
			break;;
		No )
			pacman -Rsc transmission-cli;
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
			pacman -S --needed whois mtr vdpauinfo stress iotop expac wavemon tree iperf3;
			if [ "$aurPackagesEnabled" = "true" ]; then
				yaourt -S --needed lostfiles;
			fi
			break;;
		No )
			pacman -Rsc whois;
			pacman -Rsc mtr;
			pacman -Rsc vdpauinfo;
			pacman -Rsc stress;
			pacman -Rsc iotop;
			pacman -Rsc expac;
			pacman -Rsc wavemon;
			pacman -Rsc tree;
			pacman -Rsc iperf3;
			pacman -Rsc lostfiles;
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

echo -e ${questionColor}Do you want packages from the Virtualization VirtualBox category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed virtualbox virtualbox-guest-iso virtualbox-host-dkms linux-headers;
			break;;
		No )
			pacman -Rsc virtualbox;
			pacman -Rsc virtualbox-guest-iso;
			pacman -Rsc virtualbox-host-dkms;
			pacman -Rsc linux-headers;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Wine category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed winetricks wine-staging-nine wine-mono wine_gecko;
			break;;
		No )
			pacman -Rsc winetricks;
			pacman -Rsc wine-staging-nine;
			pacman -Rsc wine-mono;
			pacman -Rsc wine_gecko;
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

echo -e ${questionColor}Do you want packages from the REMOVE category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			pacman -S --needed pulseaudio-equalizer python-pip python2-pip qrencode terminus-font kexec-tools intel-opencl-runtime jdk7-openjdk jre7-openjdk jre7-openjdk-headless turbostat i7z s-nail vi tmon x264 acpi_call speedtest-cli doge alsa-utils cinnamon bc docbook-xsl eclipse-java libopenraw mousetweaks tcpdump gnome-vfs libgnome libbonoboui libgnomeui orbit2 libbonobo libsexy gstreamer0.10 gstreamer0.10-base gstreamer0.10-bad gstreamer0.10-bad-plugins gstreamer0.10-base-plugins gstreamer0.10-ffmpeg gtk-engines gradm boost openssh-askpass polkit-gnome pyalpm python-engineio python-socketio qt5-tools python2-gtkspellcheck python2-gmpy2 python-chardet python-lxml python-requests python-urllib3 x11-ssh-askpass xdg-user-dirs-gtk yasm xorg-xvidtune bridge-utils gtkspell libwnck3 licenses linux-docs nemo-python cryptboot flatabulous-theme-git lib32-at-spi2-atk lib32-colord lib32-flex lib32-json-glib lib32-libepoxy lib32-libgusb lib32-libproxy lib32-libxkbcommon lib32-libxkbcommon-x11 libfilteraudio-git libstdc++5 netctl numix-themes-git perl-text-csv xorg-fonts-100dpi xorg-fonts-75dpi numix-themes dhcpcd dri3proto dri2proto xorg-server-devel gobject-introspection mint-cinnamon-themes pcmciautils vim vim-runtime xorg-server-xvfb xorg-server-xdmx xorg-server-xnest gom grilo-plugins libdmapsharing libftdi libmediaart lirc ncurses5-compat-libs libtinfo gputest android-studio android-ndk phonon-qt4 bluez-firmware bison gperf squashfs-tools perl-switch python2-virtualenv opus-tools vorbis-tools f2fs-tools jfsutils reiserfsprogs gpart nilfs-utils nxproxy xorg-server-xephyr imagemagick apache-ant pdfcrack pdf-decrypt clamav-unofficial-sigs clinfo virtualgl lib32-virtualgl shellcheck sloccount swftools arduino android-ndk android-studio repo gnome-shell-extension-refresh-wifi-git webkitgtk webkitgtk2 qtwebkit ccache gnome-shell-extension-battery-percentage-git gnome-video-effects lxc keepassx2 lxc yubikey-neo-manager grsec-common ipset pg2ipset modprobed-db powertop perf elfutils linux-headers linux-sc-docs linux-sc-headers gnome-shell-extension-caffeine-git paxd linux-pax-flags paxtest paxctl linux-sc gnome-encfs-manager libgee06 abs hardening-wrapper keepass multimc5-git vlc haveged gnome-shell-extension-dash-to-dock-git oh-my-zsh-git gnome-shell-extension-topicons-plus-git gnome-shell-extension-suspend-button-git gnome-shell-extension-mediaplayer-git neofetch-git sensei-raw-ctl-git pg2ipset-git syncthing-gtk pdfsam gnome-shell-extension-freon-git nano-syntax-highlighting-git radeontop-git networkmanager-openconnect networkmanager-pptp networkmanager-vpnc networkmanager-strongswan gnome-shell-extension-dash-to-panel-git gtk-engine-murrine xfce4-terminal arc-gtk-theme zsh prezto-git;
			break;;
		No )
			pacman -Rsc pulseaudio-equalizer;
			pacman -Rsc python-pip;
			pacman -Rsc python2-pip;
			pacman -Rsc qrencode;
			pacman -Rsc terminus-font;
			pacman -Rsc kexec-tools;
			pacman -Rsc intel-opencl-runtime;
			pacman -Rsc jdk7-openjdk;
			pacman -Rsc jre7-openjdk;
			pacman -Rsc jre7-openjdk-headless;
			pacman -Rsc turbostat;
			pacman -Rsc i7z;
			pacman -Rsc s-nail;
			pacman -Rsc vi;
			pacman -Rsc tmon;
			pacman -Rsc x264;
			pacman -Rsc acpi_call;
			pacman -Rsc speedtest-cli;
			pacman -Rsc doge;
			pacman -Rsc alsa-utils;
			pacman -Rsc cinnamon;
			pacman -Rsc bc;
			pacman -Rsc docbook-xsl;
			pacman -Rsc eclipse-java;
			pacman -Rsc libopenraw;
			pacman -Rsc mousetweaks;
			pacman -Rsc tcpdump;
			pacman -Rsc gnome-vfs;
			pacman -Rsc libgnome;
			pacman -Rsc libbonoboui;
			pacman -Rsc libgnomeui;
			pacman -Rsc orbit2;
			pacman -Rsc libbonobo;
			pacman -Rsc libsexy;
			pacman -Rsc gstreamer0.10;
			pacman -Rsc gstreamer0.10-base;
			pacman -Rsc gstreamer0.10-bad;
			pacman -Rsc gstreamer0.10-bad-plugins;
			pacman -Rsc gstreamer0.10-base-plugins;
			pacman -Rsc gstreamer0.10-ffmpeg;
			pacman -Rsc gtk-engines;
			pacman -Rsc gradm;
			pacman -Rsc boost;
			pacman -Rsc openssh-askpass;
			pacman -Rsc polkit-gnome;
			pacman -Rsc pyalpm;
			pacman -Rsc python-engineio;
			pacman -Rsc python-socketio;
			pacman -Rsc qt5-tools;
			pacman -Rsc python2-gtkspellcheck;
			pacman -Rsc python2-gmpy2;
			pacman -Rsc python-chardet;
			pacman -Rsc python-lxml;
			pacman -Rsc python-requests;
			pacman -Rsc python-urllib3;
			pacman -Rsc x11-ssh-askpass;
			pacman -Rsc xdg-user-dirs-gtk;
			pacman -Rsc yasm;
			pacman -Rsc xorg-xvidtune;
			pacman -Rsc bridge-utils;
			pacman -Rsc gtkspell;
			pacman -Rsc libwnck3;
			pacman -Rsc licenses;
			pacman -Rsc linux-docs;
			pacman -Rsc nemo-python;
			pacman -Rsc cryptboot;
			pacman -Rsc flatabulous-theme-git;
			pacman -Rsc lib32-at-spi2-atk;
			pacman -Rsc lib32-colord;
			pacman -Rsc lib32-flex;
			pacman -Rsc lib32-json-glib;
			pacman -Rsc lib32-libepoxy;
			pacman -Rsc lib32-libgusb;
			pacman -Rsc lib32-libproxy;
			pacman -Rsc lib32-libxkbcommon;
			pacman -Rsc lib32-libxkbcommon-x11;
			pacman -Rsc libfilteraudio-git;
			pacman -Rsc libstdc++5;
			pacman -Rsc netctl;
			pacman -Rsc numix-themes-git;
			pacman -Rsc perl-text-csv;
			pacman -Rsc xorg-fonts-100dpi;
			pacman -Rsc xorg-fonts-75dpi;
			pacman -Rsc numix-themes;
			pacman -Rsc dhcpcd;
			pacman -Rsc dri3proto;
			pacman -Rsc dri2proto;
			pacman -Rsc xorg-server-devel;
			pacman -Rsc gobject-introspection;
			pacman -Rsc mint-cinnamon-themes;
			pacman -Rsc pcmciautils;
			pacman -Rsc vim;
			pacman -Rsc vim-runtime;
			pacman -Rsc xorg-server-xvfb;
			pacman -Rsc xorg-server-xdmx;
			pacman -Rsc xorg-server-xnest;
			pacman -Rsc gom;
			pacman -Rsc grilo-plugins;
			pacman -Rsc libdmapsharing;
			pacman -Rsc libftdi;
			pacman -Rsc libmediaart;
			pacman -Rsc lirc;
			pacman -Rsc ncurses5-compat-libs;
			pacman -Rsc libtinfo;
			pacman -Rsc gputest;
			pacman -Rsc android-studio;
			pacman -Rsc android-ndk;
			pacman -Rsc phonon-qt4;
			pacman -Rsc bluez-firmware;
			pacman -Rsc bison;
			pacman -Rsc gperf;
			pacman -Rsc squashfs-tools;
			pacman -Rsc perl-switch;
			pacman -Rsc python2-virtualenv;
			pacman -Rsc opus-tools;
			pacman -Rsc vorbis-tools;
			pacman -Rsc f2fs-tools;
			pacman -Rsc jfsutils;
			pacman -Rsc reiserfsprogs;
			pacman -Rsc gpart;
			pacman -Rsc nilfs-utils;
			pacman -Rsc nxproxy;
			pacman -Rsc xorg-server-xephyr;
			pacman -Rsc imagemagick;
			pacman -Rsc apache-ant;
			pacman -Rsc pdfcrack;
			pacman -Rsc pdf-decrypt;
			pacman -Rsc clamav-unofficial-sigs;
			pacman -Rsc clinfo;
			pacman -Rsc virtualgl;
			pacman -Rsc lib32-virtualgl;
			pacman -Rsc shellcheck;
			pacman -Rsc sloccount;
			pacman -Rsc swftools;
			pacman -Rsc arduino;
			pacman -Rsc android-ndk;
			pacman -Rsc android-studio;
			pacman -Rsc repo;
			pacman -Rsc gnome-shell-extension-refresh-wifi-git;
			pacman -Rsc webkitgtk;
			pacman -Rsc webkitgtk2;
			pacman -Rsc qtwebkit;
			pacman -Rsc ccache;
			pacman -Rsc gnome-shell-extension-battery-percentage-git;
			pacman -Rsc gnome-video-effects;
			pacman -Rsc lxc;
			pacman -Rsc keepassx2;
			pacman -Rsc lxc;
			pacman -Rsc yubikey-neo-manager;
			pacman -Rsc grsec-common;
			pacman -Rsc ipset;
			pacman -Rsc pg2ipset;
			pacman -Rsc modprobed-db;
			pacman -Rsc powertop;
			pacman -Rsc perf;
			pacman -Rsc elfutils;
			pacman -Rsc linux-headers;
			pacman -Rsc linux-sc-docs;
			pacman -Rsc linux-sc-headers;
			pacman -Rsc gnome-shell-extension-caffeine-git;
			pacman -Rsc paxd;
			pacman -Rsc linux-pax-flags;
			pacman -Rsc paxtest;
			pacman -Rsc paxctl;
			pacman -Rsc linux-sc;
			pacman -Rsc gnome-encfs-manager;
			pacman -Rsc libgee06;
			pacman -Rsc abs;
			pacman -Rsc hardening-wrapper;
			pacman -Rsc keepass;
			pacman -Rsc multimc5-git;
			pacman -Rsc vlc;
			pacman -Rsc haveged;
			pacman -Rsc gnome-shell-extension-dash-to-dock-git;
			pacman -Rsc oh-my-zsh-git;
			pacman -Rsc gnome-shell-extension-topicons-plus-git;
			pacman -Rsc gnome-shell-extension-suspend-button-git;
			pacman -Rsc gnome-shell-extension-mediaplayer-git;
			pacman -Rsc neofetch-git;
			pacman -Rsc sensei-raw-ctl-git;
			pacman -Rsc pg2ipset-git;
			pacman -Rsc syncthing-gtk;
			pacman -Rsc pdfsam;
			pacman -Rsc gnome-shell-extension-freon-git;
			pacman -Rsc nano-syntax-highlighting-git;
			pacman -Rsc radeontop-git;
			pacman -Rsc networkmanager-openconnect;
			pacman -Rsc networkmanager-pptp;
			pacman -Rsc networkmanager-vpnc;
			pacman -Rsc networkmanager-strongswan;
			pacman -Rsc gnome-shell-extension-dash-to-panel-git;
			pacman -Rsc gtk-engine-murrine;
			pacman -Rsc xfce4-terminal;
			pacman -Rsc arc-gtk-theme;
			pacman -Rsc zsh;
			pacman -Rsc prezto-git;
			break;;
		Skip )
			break;;
	esac;
done;

if [ "$aurPackagesEnabled" = "false" ]; then
	echo -e ${infoColor}Here are all the AUR packages that were not installed some may not of been chosen${coloroff}
	echo downgrade gnome-shell-extension-volume-mixer numix-circle-icon-theme-git numix-icon-theme-git jd-gui launch4j android-apktool dex2jar jd-gui sdat2img android-studio sirikali-git gocryptfs multimc5 opsu chromium-pepper-flash chromium-widevine filebot pithos-git peek firejail-git lostfiles ;
fi

pacman -Rns $(pacman -Qttdq);
paccache -rk0;
