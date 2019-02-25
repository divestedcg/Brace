alias bleachLast='bleachbit --preset --clean';
alias clearTracker='/usr/bin/tracker reset --hard';
alias clearDriveFreeSpace='scrub -p random -X cfs-$RANDOM';
alias clearDriveDiscard='sudo fstrim -av';
alias clearall='clearUserMisc && clearLogins && clearVarLog && clearVarLogMisc && clearJournal && clearMemory && clearDriveDiscard';

clearUserMisc() {
	#rm -fv ~/.*_history;
	#rm -rfv ~/.esmtp_queue;
	rm -fv ~/.lesshst;

	rm -fv ~/.android/adbkey*;
	rm -rfv ~/.cache/thumbnails;
	rm -fv ~/.clamtk/history/*.log;
	rm -fv ~/.config/inkscape/extension-errors.log;
	rm -rfv ~/.config/obs-studio/logs;
	rm -rfv ~/.config/obs-studio/profiler_data;
	rm -fv ~/.config/supertuxkart/stdout.log*;
	#rm -fv ~/.config/wireshark/recent*;
	rm -rfv ~/.jack-server/logs;
	rm -rfv ~/.local/share/gvfs-metadata;
	rm -fv ~/.local/share/ibus-typing-booster/*debug.log;
	rm -fv ~/.local/share/recently-used.xbel;

	rm -fv ~/.wget-hsts
	rm -fv ~/.gnutls/known_hosts;
	#rm -fv ~/.ssh/known_hosts;
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
	free -h;
	sudo sync;
	echo 3 | sudo tee /proc/sys/vm/drop_caches;
	free -h;
}

# malware scanning
alias malwaretest='wget http://eicar.org/download/eicar.com.txt && cat eicar.com.txt';
alias rootkitscan='sudo rkhunter --update && sudo rkhunter -c --enable all --disable none --rwo';
alias rootkitscanalt='sudo unhide reverse procall sys';

# misc
alias dconf-reset-brace='cat /etc/dconf/db/local.d/00-brace* | dconf load /';
