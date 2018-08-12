#Clearing
alias bleachall='bleachbit --preset --clean';
alias clearlogins='sudo bash -c "echo > /var/log/wtmp && echo > /var/log/btmp"';
alias clearvarlog='sudo find /var/log -type f -regex ".*\.gz$" -delete && sudo find /var/log -type f -regex ".*\.[0-9]$" -delete';
alias clearsyslog='sudo journalctl --system --vacuum-size=1 && sudo journalctl --system --vacuum-time=1 && sudo journalctl --system --vacuum-files=1 && sudo journalctl --system --flush && sudo journalctl --system --vacuum-size=0 && sudo journalctl --system --vacuum-time=0 && sudo journalctl --system --vacuum-files=0 && sudo journalctl --vacuum-size=1 && sudo journalctl --vacuum-time=1 && sudo journalctl --vacuum-files=1 && sudo journalctl --flush && sudo journalctl --vacuum-size=0 && sudo journalctl --vacuum-time=0 && sudo journalctl --vacuum-files=0';
alias clearmisclog='sudo rm -f /var/log/pacman.log /var/log/rkhunter.log /var/log/rkhunter.log.old /var/log/audit/audit.log /var/log/clamav/clamd.log /var/log/clamav/freshclam.log';
alias clearmem='sudo sh -c "free -h && sync && echo 3 > /proc/sys/vm/drop_caches && free -h"';
alias cleardrive='sudo fstrim -av';
alias clearall='clearlogins && clearvarlog && clearsyslog && clearmisclog && clearmem && cleardrive';

#Malware
alias audit='sudo checksec --kernel && sudo checksec --proc-all && sudo lynis audit system -Q';
alias malwaretest='wget http://eicar.org/download/eicar.com.txt && cat eicar.com.txt';
alias rootkitscan='sudo rkhunter --update && sudo rkhunter -c --enable all --disable none --rwo';
alias rootkitscanalt='sudo unhide reverse procall sys';

#Misc
alias fixpermsrecurse='find . -type d -print0 | xargs -0 chmod -v 0700 && find . -type f -print0 | xargs -0 chmod -v 0600';
alias resetdconfdefaults='cat /etc/dconf/db/local.d/00-brace* | dconf load /';
