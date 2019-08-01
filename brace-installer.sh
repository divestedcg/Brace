#!/bin/bash
#brace
#Copyright (c) 2015-2019 Divested Computing Group
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.

coloroff='\e[0m';
black='\e[0;30m';
blue='\e[0;34m';
cyan='\e[0;36m';
green='\e[0;32m';
purple='\e[0;35m';
red='\e[0;31m';
white='\e[0;37m';
yellow='\e[0;33m';

#
#Start functions
#
whichPackageManager() {
	if type "zypper" &> /dev/null; then
		echo "zypper" && return 0;
	fi;
	if type "dnf" &> /dev/null; then
		echo "dnf" && return 0;
	fi;
	if type "yum" &> /dev/null; then
		echo "yum" && return 0;
	fi;
	if type "pacman" &> /dev/null; then
		echo "pacman" && return 0;
	fi;
	if type "apt" &> /dev/null; then
		echo "apt" && return 0;
	fi;
}

handleInstall() {
	if [ "$packageManager" == "apt" ]; then
		#TODO: skip if unavailable doesn't exist, handle?
		$packageManager install --no-install-recommends $packagesDebian $packagesBaseDebian;
	fi;
	if [ "$packageManager" == "dnf" ] || [ "$packageManager" == "yum" ]; then
		$packageManager install --skip-broken $packagesFedora $packagesBaseFedora;
	fi;
	if [ "$packageManager" == "pacman" ]; then
		#TODO: handle AUR?
		$packageManager -S --needed $packagesArch $packagesBaseArch;
	fi;
	if [ "$packageManager" == "zypper" ]; then
		$packageManager install $packagesSuse $packagesBaseSuse;
	fi;
}

handleRemove() {
	if [ "$packageManager" == "apt" ]; then
		$packageManager remove $packagesDebian;
	fi;
	if [ "$packageManager" == "dnf" ] || [ "$packageManager" == "yum" ]; then
		$packageManager remove --skip-broken $packagesFedora;
	fi;
	if [ "$packageManager" == "pacman" ]; then
		#$packageManager -Rsc $packagesArch;
		for package in $packagesArch; do
			$packageManager -Rsc $package;
		done;
	fi;
	if [ "$packageManager" == "zypper" ]; then
		$packageManager remove $packagesSuse;
	fi;
}

cleanupOperation() {
	unset category baseIncluded packagesArch packagesDebian packagesFedora packagesSuse;
}

handleOperation() {
	if [ "$baseInstall" = true ]; then
		if [ "$baseIncluded" = true ]; then
			echo -e "${green}Including packages from the $category category${coloroff}";
			if [ "$packageManager" == "apt" ]; then
				packagesBaseDebian="$packagesBaseDebian $packagesDebian";
			fi;
			if [ "$packageManager" == "dnf" ] || [ "$packageManager" == "yum" ]; then
				packagesBaseFedora="$packagesBaseFedora $packagesFedora";
			fi;
			if [ "$packageManager" == "pacman" ]; then
				packagesBaseArch="$packagesBaseArch $packagesArch";
			fi;
			if [ "$packageManager" == "zypper" ]; then
				packagesBaseSuse="$packagesBaseSuse $packagesSuse";
			fi;
		else
			echo -e "${yellow}Skipping packages from the $category category${coloroff}";
		fi;
	else
		echo -e "${purple}Do you want packages from the $category category?${coloroff}";
		select yns in "Yes" "No" "Skip"; do
			case $yns in
				Yes )
					handleInstall;
					break;;
				No )
					handleRemove;
					break;;
				Skip )
					#do nothing
					break;;
			esac;
		done;
	fi;
	cleanupOperation;
}

handleCleanup() {
	if [ "$packageManager" == "apt" ]; then
		$packageManager autoremove;
	fi;
	if [ "$packageManager" == "dnf" ] || [ "$packageManager" == "yum" ]; then
		$packageManager autoremove;
	fi;
	if [ "$packageManager" == "pacman" ]; then
		$packageManager -Rns $(pacman -Qttdq);
		paccache -rk0;
	fi;
	if [ "$packageManager" == "zypper" ]; then
		#TODO: handle this, similar to pacman
		true;
	fi;
}
#
#End functions
#

#
#Start glue
#
if [[ $EUID -ne 0 ]]; then echo -e "${red}ERROR: This script needs to be run as root!${coloroff}"; exit 1; fi;
echo -e "${cyan}INFO: This script is intended for use on desktop machines, not servers!${coloroff}";
echo -e "${cyan}INFO: This script is geared towards personal use and some packages may not be appropiate for business systems!${coloroff}";
if [ -f /etc/centos-release ]; then yum install epel-release; fi;

packageManager=$(whichPackageManager);
if [ -z ${packageManager} ]; then
	echo -e "${red}ERROR: No package manager found!${coloroff}";
	return 1;
else
	echo -e "${cyan}INFO: Using $packageManager as package manager${coloroff}";
fi;

echo -e "${purple}Would you like to simply install all 'base' packages?${coloroff}";
select yn in "Yes" "No"; do
	case $yn in
		Yes )
			baseInstall=true;
			break;;
		No )
			baseInstall=false;
			break;;
	esac;
done;
#
#End glue
#

#
#Start categories
#
category='Core';
	baseIncluded=true;
	packagesArch='rng-tools irqbalance openssh nano htop wget screen zip p7zip pixz pigz lm_sensors ripgrep dialog crda lostfiles'; packagesAUR='downgrade';
	packagesDebian='rng-tools irqbalance ssh nano htop wget screen p7zip pixz lm-sensors ripgrep';
	packagesFedora='rng-tools irqbalance openssh nano htop wget screen p7zip pixz lm_sensors ripgrep zram grubby';
	packagesSuse='rng-tools irqbalance openssh nano htop wget screen p7zip pixz sensors ripgrep grubby';
	handleOperation;
category='Frameworks';
	baseIncluded=true;
	packagesArch='jre8-openjdk python';
	packagesDebian='default-jre';
	packagesFedora='java-1.8.0-openjdk';
	packagesSuse='java-1_8_0-openjdk';
	handleOperation;
category='GNOME Extras';
	baseIncluded=false;
	packagesArch='nautilus-terminal gnome-tweak-tool seahorse';
	packagesDebian='nautilus-extension-gnome-terminal gnome-tweak-tool seahorse';
	packagesFedora='gnome-terminal-nautilus gnome-tweak-tool seahorse';
	packagesSuse='nautilus-terminal gnome-tweaks seahorse';
	handleOperation;
category='OpenCL';
	baseIncluded=false;
	packagesArch='';
	packagesDebian='clinfo mesa-opencl-icd beignet-opencl-icd pocl-opencl-icd';
	packagesFedora='clinfo mesa-libOpenCL beignet pocl';
	packagesSuse='clinfo Mesa-libOpenCL beignet pocl';
	handleOperation;
category='VA-API';
	baseIncluded=true;
	packagesArch='libva-mesa-driver libva-intel-driver intel-media-driver'; #gstreamer-vaapi
	packagesDebian='mesa-va-drivers vainfo i965-va-driver intel-media-va-driver'; #gstreamer1-vaapi
	packagesFedora='mesa-dri-drivers libva-utils libva-intel-driver libva-intel-hybrid-driver'; #gstreamer1-vaapi
	packagesSuse=''; #TODO
	handleOperation;
category='VDPAU';
	baseIncluded=false;
	packagesArch='vdpauinfo libvdpau libvdpau-va-gl libva-vdpau-driver mesa-vdpau';
	packagesDebian='vdpauinfo libvdpau-va-gl vdpau-va-driver';
	packagesFedora='vdpauinfo libvdpau libvdpau-va-gl libva-vdpau-driver';
	packagesSuse=''; #TODO
	handleOperation;
category='Theming';
	baseIncluded=false;
	packagesArch='arc-gtk-theme'; packagesAUR='numix-circle-icon-theme-git';
	packagesDebian='numix-icon-theme-circle arc-theme';
	packagesFedora='numix-icon-theme-circle arc-theme';
	packagesSuse='gtk3-metatheme-arc gtk2-metatheme-arc';
	handleOperation;
category='Fonts';
	baseIncluded=true;
	packagesArch='adobe-source-code-pro-fonts ttf-fira-mono ttf-fira-sans ttf-liberation cantarell-fonts gsfonts noto-fonts noto-fonts-emoji';
	packagesDebian='fonts-firacode';
	packagesFedora='adobe-source-code-pro-fonts mozilla-fira-mono-fonts mozilla-fira-sans-fonts';
	packagesSuse='adobe-sourcecodepro-fonts';
	handleOperation;
category='Audio Manipulation';
	baseIncluded=true;
	packagesArch='audacity';
	packagesDebian='audacity';
	packagesFedora='audacity';
	packagesSuse='audacity';
	handleOperation;
category='Audit';
	baseIncluded=true;
	packagesArch='lynis checksec arch-audit'; packagesAUR='spectre-meltdown-checker';
	packagesDebian='lynis checksec spectre-meltdown-checker';
	packagesFedora='lynis checksec spectre-meltdown-checker';
	packagesSuse='lynis spectre-meltdown-checker';
	handleOperation;
category='Chat';
	baseIncluded=false;
	packagesArch='hexchat gajim mumble'; packagesAUR='gajim-plugin-omemo';
	packagesDebian='hexchat dino-im mumble';
	packagesFedora='hexchat dino mumble';
	packagesSuse='hexchat gajim gajim-plugin-omemo mumble';
	handleOperation;
category='Communication';
	baseIncluded=true;
	packagesArch='evolution';
	packagesDebian='evolution';
	packagesFedora='evolution';
	packagesSuse='evolution';
	handleOperation;
category='Cryptocurrency';
	baseIncluded=false;
	packagesArch='electrum';
	packagesDebian=''; #electrum
	packagesFedora='electrum';
	packagesSuse=''; #unavailable
	handleOperation;
category='Development';
	baseIncluded=false;
	packagesArch='git gitg ghex sqlitebrowser gcc';
	packagesDebian='git gitg ghex sqlitebrowser build-essential';
	packagesFedora='git gitg ghex sqlitebrowser @development-tools';
	packagesSuse='git gitg ghex sqlitebrowser'; #devel_basis
	handleOperation;
category='Development - Android';
	baseIncluded=false;
	packagesArch='android-udev android-tools enjarify'; packagesAUR='android-apktool sdat2img android-studio';
	packagesDebian='adb fastboot enjarify';
	packagesFedora='android-tools enjarify';
	packagesSuse=''; #unavailable
	handleOperation;
category='Development - Java';
	baseIncluded=false;
	packagesArch='jdk8-openjdk eclipse-java'; packagesAUR='proguard jd-gui launch4j';
	packagesDebian='default-jdk proguard'; #eclipse-jdt
	packagesFedora='java-1.8.0-openjdk-devel eclipse-jdt proguard';
	packagesSuse=''; #unavailable
	handleOperation;
category='Development - Distro Specific Packaging';
	baseIncluded=false;
	packagesArch='asp';
	packagesDebian='';
	packagesFedora='rpmbuild fedpkg';
	packagesSuse='rpmbuild';
	handleOperation;
category='Disks - Management';
	baseIncluded=true;
	packagesArch='testdisk smartmontools parted gnome-multi-writer';
	packagesDebian='testdisk smartmontools parted gnome-multi-writer';
	packagesFedora='testdisk smartmontools parted gnome-multi-writer mediawriter';
	packagesSuse='testdisk smartmontools parted gnome-multi-writer';
	handleOperation;
category='Disks - File Systems';
	baseIncluded=true;
	packagesArch='btrfs-progs dosfstools exfat-utils f2fs-tools mtools ntfs-3g udftools xfsprogs';
	packagesDebian='btrfs-progs dosfstools exfat-utils f2fs-tools mtools ntfs-3g udftools xfsprogs';
	packagesFedora='btrfs-progs dosfstools exfat-utils f2fs-tools mtools ntfs-3g ntfsprogs udftools xfsprogs';
	packagesSuse='btrfsprogs dosfstools exfat-utils f2fs-tools mtools ntfs-3g ntfsprogs udftools xfsprogs';
	handleOperation;
category='Files - Backup';
	baseIncluded=true;
	packagesArch=''; packagesAUR='backintime';
	packagesDebian='backintime-qt4';
	packagesFedora='backintime-qt4';
	packagesSuse='backintime-qt';
	handleOperation;
category='Files - Encryption';
	baseIncluded=true;
	packagesArch='ecryptfs-utils encfs cryfs gocryptfs'; packagesAUR='sirikali';
	packagesDebian='encfs cryfs gocryptfs'; #ecryptfs-utils sirikali
	packagesFedora='ecryptfs-utils encfs gocryptfs cryptsetup-reencrypt'; #sirikali
	packagesSuse='ecryptfs-utils encfs cryfs';
	handleOperation;
category='Files - Sharing';
	baseIncluded=true;
	packagesArch='transmission-gtk'; packagesAUR='magic-wormhole';
	packagesDebian='transmission-gtk'; #magic-wormhole
	packagesFedora='transmission'; #magic-wormhole
	packagesSuse='transmission-gtk';
	handleOperation;
category='Files - Syncing';
	baseIncluded=false;
	packagesArch='syncthing';
	packagesDebian='syncthing';
	packagesFedora='syncthing';
	packagesSuse='syncthing';
	handleOperation;
category='Games - Tiny';
	baseIncluded=true;
	packagesArch='quadrapassel gnome-mines gnome-chess gnome-sudoku aisleriot';
	packagesDebian='quadrapassel gnome-mines gnome-chess gnome-sudoku aisleriot';
	packagesFedora='quadrapassel gnome-mines gnome-chess gnome-sudoku aisleriot';
	packagesSuse='quadrapassel gnome-mines gnome-chess gnome-sudoku aisleriot';
	handleOperation;
category='Games - Sandbox';
	baseIncluded=false;
	packagesArch='minetest';
	packagesDebian='minetest';
	packagesFedora='minetest';
	packagesSuse='minetest';
	handleOperation;
category='Games - Arena';
	baseIncluded=false;
	packagesArch='xonotic';
	packagesDebian=''; #unavailable
	packagesFedora='xonotic';
	packagesSuse='xonotic';
	handleOperation;
category='Image Manipulation';
	baseIncluded=true;
	packagesArch='gimp inkscape darktable pitivi jpegoptim optipng';
	packagesDebian='gimp inkscape darktable pitivi jpegoptim optipng';
	packagesFedora='gimp gimpfx-foundry inkscape darktable pitivi jpegoptim optipng';
	packagesSuse='gimp inkscape darktable pitivi jpegoptim optipng';
	handleOperation;
category='Internet';
	baseIncluded=true;
	packagesArch='firefox firefox-extension-https-everywhere liferea';
	packagesDebian='firefox-esr webext-https-everywhere webext-ublock-origin liferea';
	packagesFedora='firefox mozilla-https-everywhere mozilla-ublock-origin liferea';
	packagesSuse='MozillaFirefox liferea';
	handleOperation;
category='Media - Consumption';
	baseIncluded=true;
	packagesArch='vlc lollypop gnome-books youtube-dl'; #TODO: codecs
	packagesDebian='vlc pragha gnome-books youtube-dl'; #TODO: codecs
	packagesFedora='@multimedia vlc lollypop gnome-books youtube-dl';
	packagesSuse='vlc lollypop gnome-books youtube-dl'; #TODO: codecs
	handleOperation;
category='Media - HTPC';
	baseIncluded=false;
	packagesArch='kodi';
	packagesDebian='kodi';
	packagesFedora='kodi';
	packagesSuse=''; #unavailable
	handleOperation;
category='Media - Music Management';
	baseIncluded=false;
	packagesArch='picard soundconverter sound-juicer';
	packagesDebian='picard soundconverter sound-juicer';
	packagesFedora='picard soundconverter sound-juicer';
	packagesSuse='picard soundconverter sound-juicer';
	handleOperation;
category='Office';
	baseIncluded=true;
	packagesArch='libreoffice-fresh meld scribus gnucash dia aspell aspell-en hyphen hyphen-en libmythes mythes-en';
	packagesDebian='libreoffice meld scribus gnucash dia aspell aspell-en';
	packagesFedora='libreoffice meld scribus gnucash dia aspell aspell-en';
	packagesSuse='libreoffice meld scribus gnucash dia aspell';
	handleOperation;
category='Passwords';
	baseIncluded=true;
	packagesArch='keepassxc pwgen'; packagesAUR='u2f-hidraw-policy';
	packagesDebian='keepassxc pwgen diceware ssss libu2f-udev';
	packagesFedora='keepassxc pwgen diceware ssss u2f-hidraw-policy';
	packagesSuse='keepassxc pwgen libu2f-host0';
	handleOperation;
category='Privacy';
	baseIncluded=true;
	packagesArch='bleachbit wipe'; packagesAUR='scrub';
	packagesDebian='bleachbit wipe scrub';
	packagesFedora='bleachbit srm wipe scrub';
	packagesSuse='bleachbit srm wipe scrub';
	handleOperation;
category='Screencast';
	baseIncluded=false;
	packagesArch='obs-studio';
	packagesDebian='obs-studio';
	packagesFedora='obs-studio';
	packagesSuse=''; #unavailable
	handleOperation;
category='Security - Malware';
	baseIncluded=true;
	packagesArch='clamav clamtk rkhunter unhide';
	packagesDebian='clamav clamtk chkrootkit unhide';
	packagesFedora='clamav clamav-data-empty clamav-update clamtk chkrootkit unhide'; #rkhunter
	packagesSuse='clamav clamtk';
	handleOperation;
category='Security - System';
	baseIncluded=true;
	packagesArch='firewalld firejail apparmor linux-hardened';
	packagesDebian='firewalld firewall-config firejail apparmor apparmor-profiles apparmor-profiles-extra apparmor-utils';
	packagesFedora='firewalld firewall-config firejail setroubleshoot';
	packagesSuse='firewalld firewall-config firejail apparmor-profiles';
	handleOperation;
category='Tor';
	baseIncluded=true;
	packagesArch='tor torsocks'; packagesAUR='onionshare';
	packagesDebian='tor torsocks obfs4proxy onionshare'; #torbrowser-launcher
	packagesFedora='tor torsocks obfs4 onionshare torbrowser-launcher';
	packagesSuse='tor torsocks python3-onionshare torbrowser-launcher'; #torbrowser-apparmor-profile
	handleOperation;
category='Utility';
	baseIncluded=true;
	packagesArch='dconf-editor whois mtr stress iotop wavemon pv tree iperf3 bmon powertop ncdu';
	packagesDebian='dconf-editor whois mtr stress iotop wavemon pv tree iperf3 bmon powertop ncdu vrms';
	packagesFedora='dconf-editor whois mtr stress iotop wavemon pv tree iperf3 bmon powertop ncdu vrms-rpm';
	packagesSuse='dconf-editor whois mtr stress-ng iotop wavemon pv tree iperf bmon powertop ncdu';
	handleOperation;
category='Virtualization';
	baseIncluded=false;
	packagesArch='libvirt virt-manager qemu';
	packagesDebian=''; #TODO
	packagesFedora='@virtualization';
	packagesSuse=''; #'Install Hypervisor' can be used
	handleOperation;
category='Wine';
	baseIncluded=false;
	packagesArch='wine-staging winetricks';
	packagesDebian='wine'; #winetricks
	packagesFedora='wine winetricks';
	packagesSuse='wine-staging winetricks';
	handleOperation;
category='Remove - Distro Bloat';
	baseIncluded=false;
	packagesArch='gnome-documents gnome-weather gnome-music';
	packagesDebian='gnome-games'; #TODO
	packagesFedora=''; #TODO: move brace-fedora-remover.sh into here
	packagesSuse='gnome-documents gnome-weather gnome-music brasero iagno lightsoff gnome-mahjongg pidgin polari tigervnc swell-foop xterm';
	handleOperation;
#
#End categories
#

#Queued base install if selected
if [ "$baseInstall" = true ]; then
	handleInstall;
	echo -e "${cyan}INFO: Packages installed${coloroff}";
fi;

#Cleanup
echo -e "${cyan}INFO: Cleaning up${coloroff}";
handleCleanup;

#Finish
echo -e "${cyan}INFO: Installer complete!${coloroff}";
