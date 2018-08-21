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

if [ ! -f /usr/bin/flatpak ]; then echo 'flatpak is not installed!'; exit 1; fi;

flatpak remote-add flathub 'https://flathub.org/repo/flathub.flatpakrepo' &>/dev/null || true;

echo -e ${questionColor}Do you want Base?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub ca.desrt.dconf-editor;
			break;;
		No )
			flatpak remove ca.desrt.dconf-editor;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Audio Manipulation?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub org.audacityteam.Audacity;
			break;;
		No )
			flatpak remove org.audacityteam.Audacity;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Communication Realtime?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub io.github.Hexchat org.gajim.Gajim;
			break;;
		No )
			flatpak remove io.github.Hexchat org.gajim.Gajim;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Development?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub org.gnome.gitg org.gnome.ghex;
			break;;
		No )
			flatpak remove org.gnome.gitg org.gnome.ghex;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Development Android?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub com.google.AndroidStudio;
			break;;
		No )
			flatpak remove com.google.AndroidStudio;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Disks?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub org.fedoraproject.MediaWriter;
			break;;
		No )
			flatpak remove org.fedoraproject.MediaWriter;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Documents?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub org.libreoffice.LibreOffice org.gnome.meld;
			break;;
		No )
			flatpak remove org.libreoffice.LibreOffice org.gnome.meld;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Games - Tiny?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub org.gnome.Aisleriot;
			break;;
		No )
			flatpak remove org.gnome.Aisleriot;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Games - Misc?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub net.supertuxkart.SuperTuxKart;
			break;;
		No )
			flatpak remove net.supertuxkart.SuperTuxKart;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Games - Sandbox?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub net.minetest.Minetest;
			break;;
		No )
			flatpak remove net.minetest.Minetest;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Games - Arena?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub org.xonotic.Xonotic;
			break;;
		No )
			flatpak remove org.xonotic.Xonotic;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Games - Large?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub com.play0ad.zeroad org.wesnoth.Wesnoth;
			break;;
		No )
			flatpak remove com.play0ad.zeroad org.wesnoth.Wesnoth;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Games - Emulators?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub org.DolphinEmu.dolphin-emu net.pcsx2.PCSX2 org.ppsspp.PPSSPP;
			break;;
		No )
			flatpak remove org.DolphinEmu.dolphin-emu net.pcsx2.PCSX2 org.ppsspp.PPSSPP;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Image Manipulation?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub org.gimp.GIMP org.inkscape.Inkscape org.darktable.Darktable org.pitivi.Pitivi;
			break;;
		No )
			flatpak remove org.gimp.GIMP org.inkscape.Inkscape org.darktable.Darktable org.pitivi.Pitivi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Media?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub org.gnome.Lollypop;
			break;;
		No )
			flatpak remove org.gnome.Lollypop;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Media Management?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub org.musicbrainz.Picard;
			break;;
		No )
			flatpak remove org.musicbrainz.Picard;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Passwords?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub org.keepassxc.KeePassXC;
			break;;
		No )
			flatpak remove org.keepassxc.KeePassXC;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Screencast?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub com.obsproject.Studio com.uploadedlobster.peek;
			break;;
		No )
			flatpak remove com.obsproject.Studio com.uploadedlobster.peek;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Torrenting?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub com.transmission.bt.Transmission;
			break;;
		No )
			flatpak remove com.transmission.bt.Transmission;
			break;;
		Skip )
			break;;
	esac;
done;

flatpak remove --unused;
