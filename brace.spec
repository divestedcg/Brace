Name: brace
Version: 20241113
Release: 1
Summary: Increases privacy/security through various configs.
License: AGPLv3+
BuildArch: noarch
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root
%define _binary_payload w3T.xzdio
%define _sourcedir %(echo $PWD)
%define _rpmdir %(echo $PWD/build)

%description
Please see the included README

%post
if [ -f /usr/bin/dconf ]; then dconf update; fi;
echo "Please pepper your /etc/fstab like so:";
echo "- / can have discard,noatime";
echo "- /boot can have discard,noatime,nodev,nosuid,noexec";
echo "- /boot/efi can have discard,noatime,nodev,nosuid,noexec";
echo "- /home can have discard,noatime,nodev,nosuid";

%postun
if [ -f /usr/bin/dconf ]; then dconf update; fi;

%install
install -Dm644 %{_sourcedir}/brace/etc/chrony.brace.conf %{buildroot}/etc/chrony.brace.conf;
install -Dm644 %{_sourcedir}/brace/etc/dconf/db/local.d/00-brace-cinnamon %{buildroot}/etc/dconf/db/local.d/00-brace-cinnamon;
install -Dm644 %{_sourcedir}/brace/etc/dconf/db/local.d/00-brace-extra %{buildroot}/etc/dconf/db/local.d/00-brace-extra;
install -Dm644 %{_sourcedir}/brace/etc/dconf/db/local.d/00-brace-gnome %{buildroot}/etc/dconf/db/local.d/00-brace-gnome;
install -Dm644 %{_sourcedir}/brace/etc/dconf/db/local.d/00-brace-mate %{buildroot}/etc/dconf/db/local.d/00-brace-mate;
install -Dm644 %{_sourcedir}/brace/etc/dconf/db/local.d/00-brace-pantheon %{buildroot}/etc/dconf/db/local.d/00-brace-pantheon;
install -Dm644 %{_sourcedir}/brace/etc/dconf/profile/user-full %{buildroot}/etc/dconf/profile/user;
install -Dm644 %{_sourcedir}/brace/etc/profile.d/brace-env-overrides.sh %{buildroot}/etc/profile.d/brace-env-overrides.sh;
install -Dm644 %{_sourcedir}/brace/etc/profile.d/brace-helpers.sh %{buildroot}/etc/profile.d/brace-helpers.sh;
install -Dm644 %{_sourcedir}/brace/etc/tlp.d/00-brace.conf %{buildroot}/etc/tlp.d/00-brace.conf;
mkdir -p %{buildroot}/usr/lib64/firefox/browser/defaults/preferences;
install -Dm644 %{_sourcedir}/brace/usr/lib/firefox/browser/defaults/preferences/userjs-*.js %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/;
install -Dm644 %{_sourcedir}/brace/usr/lib/firefox/distribution/policies.json %{buildroot}/usr/lib64/firefox/distribution/policies.json;
mkdir -p %{buildroot}/usr/lib64/thunderbird/defaults/pref;
install -Dm644 %{_sourcedir}/brace/usr/lib/firefox/browser/defaults/preferences/userjs-*.js %{buildroot}/usr/lib64/thunderbird/defaults/pref/;
install -Dm644 %{_sourcedir}/brace/etc/chromium/policies/managed/brace.json %{buildroot}/etc/chromium/policies/managed/brace.json;
install -Dm644 %{_sourcedir}/brace/etc/chromium/policies/managed/brace.json %{buildroot}/etc/opt/chrome/policies/managed/brace.json;
install -Dm644 %{_sourcedir}/brace/usr/lib/modprobe.d/brace.conf %{buildroot}/usr/lib/modprobe.d/brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/modprobe.d/wireless-perf.conf %{buildroot}/usr/lib/modprobe.d/wireless-perf.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/NetworkManager/conf.d/30-nm-privacy.conf %{buildroot}/usr/lib/NetworkManager/conf.d/30-nm-privacy.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/sysctl.d/60-restrict.conf %{buildroot}/usr/lib/sysctl.d/60-restrict.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/resolved.conf.d/brace.conf %{buildroot}/usr/lib/systemd/resolved.conf.d/brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/system/chronyd.service.d/99-brace.conf %{buildroot}/usr/lib/systemd/system/chronyd.service.d/99-brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/system/ejabberd.service.d/99-brace.conf %{buildroot}/usr/lib/systemd/system/ejabberd.service.d/99-brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/system/httpd.service.d/99-brace.conf %{buildroot}/usr/lib/systemd/system/httpd.service.d/99-brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/system/irqbalance.service.d/99-brace.conf %{buildroot}/usr/lib/systemd/system/irqbalance.service.d/99-brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/system/minetest@.service.d/99-brace.conf %{buildroot}/usr/lib/systemd/system/minetest@.service.d/99-brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/system/ModemManager.service.d/99-brace.conf %{buildroot}/usr/lib/systemd/system/ModemManager.service.d/99-brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/system/murmur.service.d/99-brace.conf %{buildroot}/usr/lib/systemd/system/murmur.service.d/99-brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/system/NetworkManager.service.d/99-brace.conf %{buildroot}/usr/lib/systemd/system/NetworkManager.service.d/99-brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/system/php-fpm.service.d/99-brace.conf %{buildroot}/usr/lib/systemd/system/php-fpm.service.d/99-brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/system/radiusd.service.d/99-brace.conf %{buildroot}/usr/lib/systemd/system/radiusd.service.d/99-brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/system/rngd.service.d/99-brace.conf %{buildroot}/usr/lib/systemd/system/rngd.service.d/99-brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/system/tor.service.d/99-brace.conf %{buildroot}/usr/lib/systemd/system/tor.service.d/99-brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/system/wpa_supplicant.service.d/99-brace.conf %{buildroot}/usr/lib/systemd/system/wpa_supplicant.service.d/99-brace.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/user/restic-backup@.service %{buildroot}/usr/lib/systemd/user/restic-backup@.service;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/user/restic-backup@.timer %{buildroot}/usr/lib/systemd/user/restic-backup@.timer;
install -Dm644 %{_sourcedir}/brace/usr/lib/tmpfiles.d/99-brace-proc.conf %{buildroot}/usr/lib/tmpfiles.d/99-brace-proc.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/tmpfiles.d/99-brace-sys.conf %{buildroot}/usr/lib/tmpfiles.d/99-brace-sys.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/udev/rules.d/50-usb-realtek-net-exceprt.rules %{buildroot}/usr/lib/udev/rules.d/50-usb-realtek-net-exceprt.rules;
install -Dm755 %{_sourcedir}/brace/usr/bin/brace-supplemental-changes %{buildroot}/usr/bin/brace-supplemental-changes;
install -Dm755 %{_sourcedir}/brace/usr/sbin/brace-audit %{buildroot}/usr/sbin/brace-audit;
install -Dm755 %{_sourcedir}/brace/usr/sbin/brace-fedora-enable-auto-updates %{buildroot}/usr/sbin/brace-enable-auto-updates;
install -Dm755 %{_sourcedir}/brace/usr/sbin/brace-fedora-enable-fapolicyd %{buildroot}/usr/sbin/brace-enable-fapolicyd;
install -Dm755 %{_sourcedir}/brace/usr/sbin/brace-fedora-enable-rpmfusion %{buildroot}/usr/sbin/brace-enable-rpmfusion;
install -Dm755 %{_sourcedir}/brace/usr/sbin/brace-fedora-update-system %{buildroot}/usr/sbin/brace-update-system;
install -Dm755 %{_sourcedir}/brace/usr/sbin/brace-installer %{buildroot}/usr/sbin/brace-installer;
install -Dm755 %{_sourcedir}/brace/usr/sbin/brace-rpm-verify %{buildroot}/usr/sbin/brace-rpm-verify;
mkdir -p %{buildroot}/usr/share/doc/brace;
install -Dm644 %{_sourcedir}/README.md %{buildroot}/usr/share/doc/brace/README.md;

%files
/etc/chrony.brace.conf
/etc/dconf/db/local.d/00-brace-cinnamon
/etc/dconf/db/local.d/00-brace-extra
/etc/dconf/db/local.d/00-brace-gnome
/etc/dconf/db/local.d/00-brace-mate
/etc/dconf/db/local.d/00-brace-pantheon
/etc/dconf/profile/user
/etc/profile.d/brace-env-overrides.sh
/etc/profile.d/brace-helpers.sh
/etc/tlp.d/00-brace.conf
/usr/lib64/firefox/browser/defaults/preferences/userjs-*.js
/usr/lib64/firefox/distribution/policies.json
/usr/lib64/thunderbird/defaults/pref/userjs-*.js
/etc/chromium/policies/managed/brace.json
/etc/opt/chrome/policies/managed/brace.json
/usr/lib/modprobe.d/brace.conf
/usr/lib/modprobe.d/wireless-perf.conf
/usr/lib/NetworkManager/conf.d/30-nm-privacy.conf
/usr/lib/sysctl.d/60-restrict.conf
/usr/lib/systemd/resolved.conf.d/brace.conf
/usr/lib/systemd/system/chronyd.service.d/99-brace.conf
/usr/lib/systemd/system/ejabberd.service.d/99-brace.conf
/usr/lib/systemd/system/httpd.service.d/99-brace.conf
/usr/lib/systemd/system/irqbalance.service.d/99-brace.conf
/usr/lib/systemd/system/minetest@.service.d/99-brace.conf
/usr/lib/systemd/system/ModemManager.service.d/99-brace.conf
/usr/lib/systemd/system/murmur.service.d/99-brace.conf
/usr/lib/systemd/system/NetworkManager.service.d/99-brace.conf
/usr/lib/systemd/system/php-fpm.service.d/99-brace.conf
/usr/lib/systemd/system/radiusd.service.d/99-brace.conf
/usr/lib/systemd/system/rngd.service.d/99-brace.conf
/usr/lib/systemd/system/tor.service.d/99-brace.conf
/usr/lib/systemd/system/wpa_supplicant.service.d/99-brace.conf
/usr/lib/systemd/user/restic-backup@.service
/usr/lib/systemd/user/restic-backup@.timer
/usr/lib/tmpfiles.d/99-brace-proc.conf
/usr/lib/tmpfiles.d/99-brace-sys.conf
/usr/lib/udev/rules.d/50-usb-realtek-net-exceprt.rules
/usr/bin/brace-supplemental-changes
/usr/sbin/brace-audit
/usr/sbin/brace-enable-auto-updates
/usr/sbin/brace-enable-fapolicyd
/usr/sbin/brace-enable-rpmfusion
/usr/sbin/brace-update-system
/usr/sbin/brace-installer
/usr/sbin/brace-rpm-verify
/usr/share/doc/brace/README.md
