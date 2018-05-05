#!/bin/bash

if [ -d "/usr/share/fonts/adobe-source-code-pro" ]; then
	gsettings set org.gnome.builder.editor font-name 'Source Code Pro 11';
	gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro 11';
fi;

if [ -d "/usr/share/icons/Numix-Circle" ]; then
	gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle';
fi;

#Night Light
echo "Do you want Night Light enabled?"
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

#Power
echo "Do you want auto suspend enabled?"
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
echo "Do you want search enabled? (disable on low performance systems)"
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
echo "Do you want Tracker enabled? (disable for increased security/privacy at the expense of weirdness)"
select yn in "Yes" "No"; do
	case $yn in
		Yes )
			gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors true;
			break;;
		No )
			gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false;
			break;;
	esac
done

#Themes
echo "Do you want the dark theme?"
select yn in "Yes" "No"; do
	case $yn in
		Yes )
			gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark';
			break;;
		No )
			gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita';
			break;;
	esac
done


echo "Applied the way better settings. Ensure brace is installed for the rest!"
