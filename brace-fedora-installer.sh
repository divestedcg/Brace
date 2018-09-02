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

if [ -f /etc/centos-release ]; then yum install epel-release; fi;

echo -e ${questionColor}Do you want packages from the Core category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken irqbalance nano htop screen p7zip pixz lm_sensors screenfetch ripgrep tree;
			break;;
		No )
			yum remove irqbalance nano htop screen p7zip pixz lm_sensors screenfetch ripgrep tree;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Frameworks category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken java-1.8.0-openjdk;
			break;;
		No )
			yum remove java-1.8.0-openjdk;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Base category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken @multimedia aspell aspell-en dconf-editor numix-icon-theme-circle arc-theme seahorse gtkhash;
			break;;
		No )
			yum remove @multimedia aspell aspell-en dconf-editor numix-icon-theme-circle arc-theme seahorse gtkhash;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the GNOME Extras category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken gnome-terminal-nautilus gnome-tweak-tool;
			break;;
		No )
			yum remove gnome-terminal-nautilus gnome-tweak-tool;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the HW Compute Acceleration category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken clinfo mesa-libOpenCL beignet pocl;
			break;;
		No )
			yum remove clinfo mesa-libOpenCL beignet pocl;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the HW Video Acceleration category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken libva-utils vdpauinfo mesa-dri-drivers libva-intel-driver libvdpau-va-gl gstreamer1-vaapi;
			break;;
		No )
			yum remove libva-utils vdpauinfo mesa-dri-drivers libva-intel-driver libvdpau-va-gl gstreamer1-vaapi;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Fonts category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken adobe-source-code-pro-fonts mozilla-fira-mono-fonts mozilla-fira-sans-fonts;
			break;;
		No )
			yum remove adobe-source-code-pro-fonts mozilla-fira-mono-fonts mozilla-fira-sans-fonts;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Audio Manipulation category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken audacity;
			break;;
		No )
			yum remove audacity;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Audit category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken lynis checksec spectre-meltdown-checker;
			break;;
		No )
			yum remove lynis checksec spectre-meltdown-checker;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Communication category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken thunderbird thunderbird-enigmail;
			break;;
		No )
			yum remove thunderbird thunderbird-enigmail;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Communication Realtime category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken hexchat mumble gajim;
			break;;
		No )
			yum remove hexchat mumble gajim;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Cryptocurrency category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken electrum;
			break;;
		No )
			yum remove electrum;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Development category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken git gitg ghex sqlitebrowser @development-tools;
			break;;
		No )
			yum remove git gitg ghex sqlitebrowser @development-tools;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Development Android category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken android-tools;
			break;;
		No )
			yum remove android-tools;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Development Java category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken java-1.8.0-openjdk-devel proguard;
			break;;
		No )
			yum remove java-1.8.0-openjdk-devel proguard;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Development RPM category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken fedpkg;
			break;;
		No )
			yum remove fedpkg;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Disks category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken testdisk smartmontools mediawriter gnome-multi-writer nwipe;
			break;;
		No )
			yum remove testdisk smartmontools mediawriter gnome-multi-writer nwipe;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Documents category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken libreoffice meld pdfmod scribus;
			break;;
		No )
			yum remove libreoffice meld pdfmod scribus;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the E-Books category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken calibre;
			break;;
		No )
			yum remove calibre;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the File Encryption category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken ecryptfs-utils encfs;
			break;;
		No )
			yum remove ecryptfs-utils encfs;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the File Syncing category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken syncthing;
			break;;
		No )
			yum remove syncthing;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Flatpak category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken flatpak;
			break;;
		No )
			yum remove flatpak;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Tiny category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken quadrapassel gnome-2048 gnome-mines gnome-chess gnome-sudoku aisleriot;
			break;;
		No )
			yum remove quadrapassel gnome-2048 gnome-mines gnome-chess gnome-sudoku aisleriot;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Misc category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken neverball supertuxkart;
			break;;
		No )
			yum remove neverball supertuxkart;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Sandbox category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken minetest;
			break;;
		No )
			yum remove minetest;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Arena category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken xonotic;
			break;;
		No )
			yum remove xonotic;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Large category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken 0ad wesnoth;
			break;;
		No )
			yum remove 0ad wesnoth;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Games - Emulators category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken dolphin-emu pcsx;
			break;;
		No )
			yum remove dolphin-emu pcsx;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Headless category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken @"Headless-Management";
			break;;
		No )
			yum remove @"Headless-Management";
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Hacking category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken @"Security Lab";
			break;;
		No )
			yum remove @"Security Lab";
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Image Manipulation category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken gimp gimpfx-foundry inkscape darktable pitivi jpegoptim optipng;
			break;;
		No )
			yum remove gimp gimpfx-foundry inkscape darktable pitivi jpegoptim optipng;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Internet category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken firefox mozilla-https-everywhere mozilla-ublock-origin liferea;
			break;;
		No )
			yum remove firefox mozilla-https-everywhere mozilla-ublock-origin liferea;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Mapping category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken viking;
			break;;
		No )
			yum remove viking;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Music Management category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken picard soundconverter sound-juicer;
			break;;
		No )
			yum remove picard soundconverter sound-juicer;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Media category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken lollypop youtube-dl;
			break;;
		No )
			yum remove lollypop youtube-dl;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Passwords category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken keepassxc pwgen diceware u2f-hidraw-policy ssss;
			break;;
		No )
			yum remove keepassxc pwgen diceware u2f-hidraw-policy ssss;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Privacy category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken bleachbit srm wipe scrub;
			break;;
		No )
			yum remove bleachbit srm wipe scrub;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Security category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken clamav clamav-data-empty clamav-update clamtk unhide chkrootkit firewall-config;
			break;;
		No )
			yum remove clamav clamav-data-empty clamav-update clamtk unhide chkrootkit firewall-config;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Tor category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken tor obfs4 torsocks nyx onionshare torbrowser-launcher;
			break;;
		No )
			yum remove tor obfs4 torsocks nyx onionshare torbrowser-launcher;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Torrenting category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken transmission;
			break;;
		No )
			yum remove transmission;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Utility category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken whois mtr stress iotop wavemon pv iperf3 bmon powertop ncdu;
			break;;
		No )
			yum remove whois mtr stress iotop wavemon pv iperf3 bmon powertop ncdu;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Virtualization category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken @virtualization;
			break;;
		No )
			yum remove @virtualization;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Wine category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken wine winetricks;
			break;;
		No )
			yum remove wine winetricks;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want packages from the Yubikey category?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			yum install --skip-broken yubikey-personalization-gui;
			break;;
		No )
			yum remove yubikey-personalization-gui;
			break;;
		Skip )
			break;;
	esac;
done;

yum autoremove;
