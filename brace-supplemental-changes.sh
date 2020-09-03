#!/bin/bash
#Copyright (c) 2017-2020 Divested Computing Group
#License: GPLv3

if [[ "$EUID" -eq "0" ]]; then
	if [ -f "/usr/lib/systemd/system/zram-swap.service" ]; then
		echo "Enabling zram-swap";
		systemctl enable zram-swap.service --now;
	fi;

	if [ -f "/usr/lib/systemd/system/fstrim.timer" ]; then
		echo "Enabling weekly fstrim";
		systemctl enable fstrim.timer --now;
	fi;

	#Stealth Firewall
	if [ -x /usr/bin/firewall-cmd ]; then
		echo "Do you want a default drop firewall?";
		select ys in "Yes" "Skip"; do
			case $ys in
				Yes )
					firewall-cmd --set-default-zone=drop;
					firewall-cmd --add-protocol=ipv6-icmp --permanent;
					firewall-cmd --add-service=dhcpv6-client --permanent;
					break;;
				Skip )
					#firewall-cmd --set-default-zone=public;
					break;;
			esac
		done
	fi

	#Kernel Command Line
	if [ -x /usr/sbin/grubby ]; then
		echo "Do you a stricter kernel (via boot command-line arguments)?";
		select ys in "Yes" "Skip"; do
			case $ys in
				Yes )
					grubby --update-kernel=ALL --args="lockdown=confidentiality pti=on vsyscall=none page_poison=1 slab_nomerge slub_debug=FZP page_alloc.shuffle=1 init_on_alloc=1 init_on_free=1 mce=0";
					grubby --update-kernel=ALL --args="iommu=force iommu.passthrough=0 intel_iommu=on,strict amd_iommu=fullflush"; #efi=disable_early_pci_dma (often breaks boot)
					grubby --update-kernel=ALL --args="spectre_v2=on spec_store_bypass_disable=on tsx=off";
					#grubby --update-kernel=ALL --args="mitigations=auto,nosmt";
					grubby --update-kernel=ALL --args="module.sig_enforce=1";
					grubby --update-kernel=ALL --args="fsck.mode=force";
					if [ "$(/usr/bin/uname -m)" = "aarch64" ]; then grubby --update-kernel=ALL --args="kpti=on ssbd=force-on"; fi;
					#grubby --update-kernel=ALL --args="amdgpu.tmz=1"; #Encrypted GPU memory (Linux 5.8/Mesa 20.2)
					break;;
				Skip )
					break;;
			esac
		done
	fi;

	#Stronger Crypto
	if [ -x /usr/bin/update-crypto-policies ]; then
		echo "Do you want stricter crypto policies?";
		select yn in "Yes" "No"; do
			case $yn in
				Yes )
					update-crypto-policies --set NEXT;
					break;;
				No )
					update-crypto-policies --set DEFAULT;
					break;;
			esac
		done
	fi;

	#Hostname
	if [ -x /usr/bin/hostnamectl ]; then
		echo "Do you want a random hostname?";
		select ys in "Yes" "Skip"; do
			case $ys in
				Yes )
					randhost=$(head /dev/urandom | tr -dc a-z | head -c8);
					if [ -x /usr/bin/pwgen ]; then
						randhost=$(pwgen -A0 8 1);
					fi;
					hostnamectl set-hostname "$randhost";
					break;;
				Skip )
					break;;
			esac
		done
	fi;
else
	#Looks
	if [ -d "/usr/share/fonts/adobe-source-code-pro" ]; then
		gsettings set org.gnome.builder.editor font-name 'Source Code Pro 10';
		gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro 10';
		gsettings set org.mate.desktop.interface monospace-font-name 'Source Code Pro 10';
	fi;
	if [ -f "/usr/share/fonts/mozilla-fira/FiraSans-Regular.otf" ] || [ -f "/usr/share/fonts/TTF/FiraSans-Regular.ttf" ]; then
		gsettings set org.gnome.desktop.interface font-name 'Fira Sans 10';
		gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Fira Sans Bold 11';
		gsettings set org.cinnamon.desktop.interface font-name 'Fira Sans 10';
		#TODO cinnamon legacy title font
		gsettings set org.mate.caja.desktop font 'Fira Sans 10';
		gsettings set org.mate.desktop.interface font-name 'Fira Sans 10';
		gsettings set org.mate.marco.general titlebar-font 'Fira Sans Bold 11';
	fi;
	if [ -f "/usr/share/fonts/mozilla-fira/FiraMono-Regular.otf" ] || [ -f "/usr/share/fonts/TTF/FiraMono-Regular.ttf" ]; then
		gsettings set org.gnome.builder.editor font-name 'Fira Mono 10';
		gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Mono 10';
		gsettings set org.gnome.gedit.preferences.editor editor-font 'Fira Mono 10';
		gsettings set org.cinnamon.desktop.interface monospace-font-name 'Fira Mono 10';
		gsettings set org.mate.desktop.interface monospace-font-name 'Fira Mono 10';
	fi;
	if [ -d "/usr/share/icons/Numix-Circle" ]; then
		gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle';
		gsettings set org.cinnamon.desktop.interface icon-theme 'Numix-Circle';
		gsettings set org.mate.desktop.interface icon-theme 'Numix-Circle';
	fi;

	#Thumbnails
	echo "Do you want thumbnails enabled? (brace default disabled)";
	select yn in "Yes" "No"; do
		case $yn in
			Yes )
				#Only allow enabling thumbnailers where extra restrictions are in place
				gsettings set org.gnome.desktop.thumbnailers disable-all false;
				#gsettings set org.cinnamon.desktop.thumbnailers disable-all false;
				#gsettings set org.mate.desktop.thumbnailers disable-all false;
				break;;
			No )
				gsettings set org.gnome.desktop.thumbnailers disable-all true;
				gsettings set org.cinnamon.desktop.thumbnailers disable-all true;
				gsettings set org.mate.desktop.thumbnailers disable-all true;
				break;;
		esac
	done

	#Night Light
	echo "Do you want GNOME Night Light enabled?";
	select yn in "Yes" "No"; do
		case $yn in
			Yes )
				gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true;
				break;;
			No )
				gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false;
				break;;
		esac
	done

	#Power #TODO: MATE
	echo "Do you want auto suspend enabled?";
	select yn in "Yes" "No"; do
		case $yn in
			Yes )
				gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'suspend';
				gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'suspend';
				break;;
			No )
				gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing';
				gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing';
				break;;
		esac
	done

	#Search
	echo "Do you want search enabled? (disable on low performance systems)";
	select yn in "Yes" "No"; do
		case $yn in
			Yes )
				gsettings set org.gnome.desktop.search-providers disable-external false;
				break;;
			No )
				gsettings set org.gnome.desktop.search-providers disable-external true;
				break;;
		esac
	done
	echo "Do you want Tracker enabled?";
	select yn in "Yes" "No"; do
		case $yn in
			Yes )
				gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors true;
				gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -1;
				break;;
			No )
				gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false;
				gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2;
				break;;
		esac
	done

	#Themes
	echo "Do you want the dark theme?";
	select yn in "Yes" "No"; do
		case $yn in
			Yes )
				gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark';
				gsettings set org.cinnamon.theme name 'Mint-Y-Dark';
				gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-Dark';
				gsettings set org.cinnamon.desktop.wm.preferences theme 'Mint-Y-Dark';
				gsettings set org.mate.desktop.interface gtk-theme 'BlackMATE';
				gsettings set org.mate.marco.general theme 'BlackMATE';
				break;;
			No )
				gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita';
				gsettings set org.cinnamon.theme name 'Mint-Y';
				gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y';
				gsettings set org.cinnamon.desktop.wm.preferences theme 'Mint-Y';
				gsettings set org.mate.desktop.interface gtk-theme 'BlueMenta';
				gsettings set org.mate.marco.general theme 'BlueMenta';
				break;;
		esac
	done
fi;

echo "Applied the supplemental changes";
