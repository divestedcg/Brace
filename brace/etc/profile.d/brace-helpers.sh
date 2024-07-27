#!/bin/sh
#Copyright (c) 2018-2020 Divested Computing Group
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU Affero General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU Affero General Public License for more details.
#
#You should have received a copy of the GNU Affero General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.

# cleaning
alias bleachLast='bleachbit --preset --clean';
alias clearTracker='/usr/bin/tracker reset --hard';
alias clearDriveFreeSpace='scrub --no-hwrand -p random -X cfs-$RANDOM';
alias clearDriveDiscard='sudo fstrim -av';
alias clearall='clearUserMisc && clearLogins && clearVarLog && clearVarLogMisc && clearJournal && clearMemory && clearDriveDiscard';

clearUserMisc() {
	#rm -fv ~/.*_history;
	#rm -rfv ~/.esmtp_queue;
	rm -fv ~/.lesshst;

	rm -fv ~/.android/adbkey*;
	rm -rfv ~/.cache/libvirt/qemu/log;
	rm -rfv ~/.cache/thumbnails;
	rm -fv ~/.clamtk/history/*.log;
	rm -fv ~/.config/inkscape/extension-errors.log;
	rm -rfv ~/.config/obs-studio/logs;
	rm -rfv ~/.config/obs-studio/profiler_data;
	rm -fv ~/.config/supertuxkart/stdout.log*;
	#rm -fv ~/.config/wireshark/recent*;
	#rm -rfv ~/.jack-server/logs;
	rm -rfv ~/.local/share/gvfs-metadata;
	rm -fv ~/.local/share/ibus-typing-booster/*debug.log;
	rm -fv ~/.local/share/recently-used.xbel;
	rm -fv ~/.minetest/debug.txt;

	#rm -fv ~/.wget-hsts
	#rm -fv ~/.gnutls/known_hosts;
	#rm -fv ~/.ssh/known_hosts;
}

clearUsersMisc() {
	#contains list of all accessed/modified files on all connected drives (local or remote)
	sudo wipe -irqc /home/*/.local/share/gvfs-metadata;
}

clearLogins() {
	echo "" | sudo tee /var/log/btmp;
	echo "" | sudo tee /var/log/wtmp;
}

clearVarLog() {
	sudo find /var/log -type f -regex ".*\.gz$" -print -delete;
	sudo find /var/log -type f -regex ".*\.log.[0-9]+$" -print -delete;
	sudo find /var/log -type f -regex ".*\.log-[0-9]+$" -print -delete;
}

clearVarLogMisc() {
	# libvirt
	sudo rm -fv /var/log/libvirt/qemu/*.log*;
	# misc
	sudo rm -fv /var/log/grubby;
	# package manangers
	sudo rm -fv /var/log/dnf*.log;
	sudo rm -fv /var/log/hawkey.log;
	sudo rm -fv /var/log/yum*.log;
	sudo rm -fv /var/log/pacman.log;
	# scanners
	sudo rm -fv /var/log/lynis*;
	sudo rm -fv /var/log/rkhunter.log*;
	sudo rm -fv /var/log/freshclam.log;
	sudo rm -fv /var/log/clamav/*.log;
	# security
	sudo rm -fv /var/log/audit/audit.log;
	sudo rm -fv /var/log/usbguard/usbguard-audit.log;
	# systemd
	sudo rm -fv /var/log/boot.log;
}

clearJournal() {
	sudo journalctl --rotate;
	sudo journalctl --vacuum-files=1 --vacuum-size=1K --vacuum-time=1s;
	sudo journalctl --flush;
}

clearMemory() {
	free -m;
	sudo sync; #sudo isn't necessary for this, but ensures the next command is likely to run without delay
	echo 3 | sudo tee /proc/sys/vm/drop_caches;
	free -m;
}

optimizeImages() {
        find "$1" -type f -name "*.jp*g" -print0 | xargs -0 -n1 -P 16 jpegoptim --strip-all;
        find "$1" -type f -name "*.png" -print0 | xargs -0 -n1 -P 16 optipng -strip all;
}

loosePermsRecursive() {
	echo "Recursively setting loose permissions in $PWD";
	echo "You've 5 seconds to Ctrl+C";
	sleep 5;
	find . -type d -print0 | xargs -0 chmod -v 0755;
	find . -type f -print0 | xargs -0 chmod -v 0644;
}

strictPermsRecursive() {
	echo "Recursively setting restrictive permissions in $PWD";
	echo "You've 5 seconds to Ctrl+C";
	sleep 5;
	find . -type d -print0 | xargs -0 chmod -v 0700;
	find . -type f -print0 | xargs -0 chmod -v 0600;
}


# malware scanning
alias malwaretest='wget https://eicar.org/download/eicar.com.txt && cat eicar.com.txt';
alias clamscanhere='clamscan --recursive --detect-pua=yes --infected --allmatch --cross-fs=no --follow-dir-symlinks=0 --follow-file-symlinks=0 .';
alias rootkitscan='sudo rkhunter --update && sudo rkhunter -c --enable all --disable none --rwo';
alias rootkitscanalt='sudo unhide reverse procall sys';

# misc
alias dconf-reset-brace='cat /etc/dconf/db/local.d/00-brace* | dconf load /'; #This is not recommended to be used
alias ssh-tor='torsocks --isolate ssh';
alias dnf-update-security-testing="sudo dnf update --refresh --security --secseverity=Low --enablerepo=*updates-testing";
alias dnf-update-kernel="sudo dnf update --enablerepo=*updates-testing kernel*"; #sometimes testing kernels aren't flagged as security updates
