brace
=====

Overview
--------
Brace is a toolkit compatible with multiple existing Linux distributions that allows for a rapid installation of handpicked applications, along with corresponding configurations that have been fine-tuned for reasonable privacy and security.

Compatibility
-------------
- Arch Linux
- CentOS 7/8/Stream
- Debian 10
- Fedora 32/33 (preferred)
- openSUSE 15.2/Tumbleweed

License
-------
GPLv3 where applicable

Building
--------
- git clone [THIS REPO]
- Arch Linux: makepkg
- CentOS: rpmbuild -ba brace.spec --define "_sourcedir $PWD"
- Debian: dpkg-deb --build brace
- Fedora: fedpkg local

Contents
--------
- /etc/apt/apt.conf.d/90-brace					= apt: enable seccomp filter during package install
- /etc/dconf/db/local.d/00-brace-*				= GNOME/Cinnamon/MATE: change default settings
- /etc/dconf/profile/user					= Fixup dconf overrides on select distros
- /etc/profile.d/brace-env-overrides.sh				= profile: sets some environment overrides (eg. umask)
- /etc/profile.d/brace-helpers.sh				= profile: adds helper aliases (eg. cleaning functions)
- /usr/lib64/firefox/browser/defaults/preferences/userjs-*.js	= Firefox: change default settings
	- /usr/lib64/firefox/distribution/policies.json
	- /usr/lib64/thunderbird/defaults/pref/userjs-*.js
- /etc/chromium/policies/managed/brace.json			= Chromium: change default settings
	- /etc/opt/chrome/policies/managed/brace.json
- /usr/lib/modprobe.d/blacklist-dma.conf			= kernel: disable modules that allow direct memory access externally
- /usr/lib/modprobe.d/blacklist-usbnet.conf			= kernel: disable modules that allow for USB networking
- /usr/lib/modprobe.d/wireless-perf.conf			= kernel: increase Wi-Fi performance for b43 and iwlwifi
- /usr/lib/NetworkManager/conf.d/30-nm-privacy.conf		= NetworkManager: enables MAC randomization and IPv6 privacy extensions and disables connectivity checks
- /usr/lib/sysctl.d/60-restrict.conf				= sysctl: set more restrictive defaults (dmesg, ptrace)
- /usr/lib/systemd/system/*.service.d/99-brace.conf		= systemd service unit sandboxing
- /usr/lib/systemd/user/restic-backup@.*			= systemd user unit for restic backups
- /usr/lib/tmpfiles.d/99-brace-proc.conf			= /proc: harden permissions
- /usr/lib/tmpfiles.d/99-brace-sys.conf				= /sys: harden permissions
- /usr/bin/brace-supplemental-changes				= change extra default settings
- /usr/sbin/brace-enable-auto-updates				= Fedora: automatic system updates using dnf-plugin-system-upgrade
- /usr/sbin/brace-enable-rpmfusion				= Fedora: enable RPM Fusion 'free' repos
- /usr/sbin/brace-update-system					= Fedora: helper to update to the next release
- /usr/sbin/brace-installer					= unified recommended package installer
- /usr/sbin/brace-rpm-verify					= RPM: verifies installed packages for corruption

Known Issues
------------
- A reboot is required on openSUSE after install for dconf changes to take effect.
- Compatibility is best with Fedora, and that is the primary test-bed.

Credits
-------
- userjs-arkenfox.js
	- @thorin-oakenpants + @earthlng + @claustromaniac
	- MIT: https://github.com/arkenfox/user.js/blob/af516315971b7c94075db1e317bee5b12dc3b781/LICENSE.txt
	- https://github.com/arkenfox/user.js
- 99-brace-proc.conf and 99-brace-sys.conf
	- Topi Miettinen (@topimiettinen)
	- GPL-2.0+: https://salsa.debian.org/corsac/hardening-runtime/-/blob/1a315536726cf41b64af6dc65c7cf9b250b5dda1/debian/copyright
	- https://salsa.debian.org/corsac/hardening-runtime/-/commit/1a315536726cf41b64af6dc65c7cf9b250b5dda1
- brace-rpm-verify
	- @doktor5000
	- CC BY-SA 3.0: https://stackoverflow.com/help/licensing
	- https://unix.stackexchange.com/a/217024
- firewalld IPv6 drop zone fix
	- Mark
	- CC BY-SA 3.0: https://stackoverflow.com/help/licensing
	- https://serverfault.com/a/775153
- restic-backup.service
	- Link Dupont
	- CC BY-SA 3.0: https://fedoramagazine.org/terms-and-conditions/
	- https://fedoramagazine.org/automate-backups-with-restic-and-systemd/

Donate
-------
- https://divested.dev/donate
