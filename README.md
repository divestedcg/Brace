brace
=====

Overview
--------
Brace offers a wide range of opinionated settings that prioritize privacy, security, and usability for a curated set of Linux programs.

Compatibility
-------------
- Fedora

Fallback Compatibility
----------------------
- Below distros are **untested** and maintained only as a fallback if Fedora goes away
- Arch Linux
- openSUSE
- RHEL-like (CentOS, Rocky, Alma)
- Debian

License
-------
AGPL-3.0-or-later where applicable

Prebuilts
---------
- Fedora via Divested-RPM: https://divested.dev/index.php?page=software#divested-release
- Fedora via CI: https://gitlab.com/divested/brace/-/jobs/artifacts/master/browse?job=build_rpm
- Arch via CI: https://gitlab.com/divested/brace/-/jobs/artifacts/master/browse?job=build_arch
- Debian via CI: https://gitlab.com/divested/brace/-/jobs/artifacts/master/browse?job=build_deb

Building
--------
- git clone [THIS REPO]
- RPM: rpmbuild -ba brace.spec
- Arch Linux: makepkg
- Debian: dpkg-deb --root-owner-group --build brace

Supported Configuration Targets
-------------------------------
- Chromium, Chrome, Brave
- chrony
- Firefox, Firefox ESR, Thunderbird
- GNOME, MATE, Cinnamon
- GRUB
- Kernel
- NetworkManager
- polkit
- systemd
- TLP
- udev

Additional Inclusions
---------------------
- brace-audit			helper to verify settings are applied
- brace-enable-auto-updates	helper to enable dnf automatic updates
- brace-enable-fapolicyd	helper to enable fapolicyd for program allowlisting
- brace-enable-rpmfusion	helper to enable rpmfusion-free repo for eg. codecs
- brace-installer		helper with categories of packages to install
- brace-rpm-verify		helper to verify integrity of installed packages
- brace-supplemental-changes	helper to change additional global and per-user settings
- brace-update-system		helper to update to next major version
- restic-backup@.*		systemd units for daily backups

Known Issues
------------
- A reboot is required on openSUSE after install for dconf changes to take effect.
- Compatibility is best with Fedora, and that is the primary test-bed.
- Restrictions on /sys/bus/scsi in 99-brace-sys.conf can break disc drive access by some programs.

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
- chrony.brace.conf
	- GrapheneOS
	- MIT: https://github.com/GrapheneOS/infrastructure/blob/main/LICENSE
	- https://github.com/GrapheneOS/infrastructure/blob/main/chrony.conf
- modprobe.d/brace.conf additional module blocking
	- @madaidan
	- List likely uncopyrightable
	- https://madaidans-insecurities.github.io/guides/linux-hardening.html#kasr-kernel-modules

Donate
------
- https://divested.dev/donate
