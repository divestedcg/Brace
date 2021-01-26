Name: brace
Version: 20210126
Release: 1
Summary: Increases privacy/security through various configs.
License: GPLv3+
BuildArch: noarch
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root
%define _binary_payload w3T.xzdio

%description
- Adds many helper scripts: brace-installer, brace-supplemental-changes
- GNOME/Cinnamon/MATE: change default settings
- Firefox: change default settings, credit @arkenfox, license MIT
- Chromium: change default settings
- NetworkManager: disable connectivity checking
- Networkmanager: enable MAC address randomization
- NetworkManager: enable IPv6 privacy extensions
- kernel: restrict dmesg and ptrace
- kernel: blacklist modules that provide direct memory access externally
- kernel: blacklist modules that allow for USB networking
- profile: adds helper aliases
- kernel: increases wi-fi performance for b43 and iwlwifi

%post
if [ -f /usr/bin/dconf ]; then dconf update; fi;
echo "Please pepper your /etc/fstab with discard,noatime,nodev,nosuid,noexec";

%postun
if [ -f /usr/bin/dconf ]; then dconf update; fi;

%install
install -Dm644 %{_sourcedir}/brace/etc/dconf/db/local.d/00-brace-cinnamon %{buildroot}/etc/dconf/db/local.d/00-brace-cinnamon;
install -Dm644 %{_sourcedir}/brace/etc/dconf/db/local.d/00-brace-extra %{buildroot}/etc/dconf/db/local.d/00-brace-extra;
install -Dm644 %{_sourcedir}/brace/etc/dconf/db/local.d/00-brace-gnome %{buildroot}/etc/dconf/db/local.d/00-brace-gnome;
install -Dm644 %{_sourcedir}/brace/etc/dconf/db/local.d/00-brace-mate %{buildroot}/etc/dconf/db/local.d/00-brace-mate;
install -Dm644 %{_sourcedir}/brace/etc/dconf/db/local.d/00-brace-pantheon %{buildroot}/etc/dconf/db/local.d/00-brace-pantheon;
install -Dm644 %{_sourcedir}/brace/etc/dconf/profile/user-full %{buildroot}/etc/dconf/profile/user;
install -Dm644 %{_sourcedir}/brace/etc/profile.d/brace-env-overrides.sh %{buildroot}/etc/profile.d/brace-env-overrides.sh;
install -Dm644 %{_sourcedir}/brace/etc/profile.d/brace-helpers.sh %{buildroot}/etc/profile.d/brace-helpers.sh;
mkdir -p %{buildroot}/usr/lib64/firefox/browser/defaults/preferences;
install -Dm644 %{_sourcedir}/brace/usr/lib/firefox/browser/defaults/preferences/userjs-*.js %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/;
install -Dm644 %{_sourcedir}/brace/usr/lib/firefox/distribution/policies.json %{buildroot}/usr/lib64/firefox/distribution/policies.json;
mkdir -p %{buildroot}/usr/lib64/thunderbird/defaults/pref;
install -Dm644 %{_sourcedir}/brace/usr/lib/firefox/browser/defaults/preferences/userjs-*.js %{buildroot}/usr/lib64/thunderbird/defaults/pref/;
install -Dm644 %{_sourcedir}/brace/etc/chromium/policies/managed/brace.json %{buildroot}/etc/chromium/policies/managed/brace.json;
install -Dm644 %{_sourcedir}/brace/etc/chromium/policies/managed/brace.json %{buildroot}/etc/opt/chrome/policies/managed/brace.json;
install -Dm644 %{_sourcedir}/brace/usr/lib/modprobe.d/blacklist-dma.conf %{buildroot}/usr/lib/modprobe.d/blacklist-dma.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/modprobe.d/blacklist-usbnet.conf %{buildroot}/usr/lib/modprobe.d/blacklist-usbnet.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/modprobe.d/wireless-perf.conf %{buildroot}/usr/lib/modprobe.d/wireless-perf.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/NetworkManager/conf.d/30-nm-privacy.conf %{buildroot}/usr/lib/NetworkManager/conf.d/30-nm-privacy.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/sysctl.d/60-restrict.conf %{buildroot}/usr/lib/sysctl.d/60-restrict.conf;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/user/restic-backup@.service %{buildroot}/usr/lib/systemd/user/restic-backup@.service;
install -Dm644 %{_sourcedir}/brace/usr/lib/systemd/user/restic-backup@.timer %{buildroot}/usr/lib/systemd/user/restic-backup@.timer;
install -Dm755 %{_sourcedir}/brace/usr/bin/brace-supplemental-changes %{buildroot}/usr/bin/brace-supplemental-changes;
install -Dm755 %{_sourcedir}/brace/usr/sbin/brace-fedora-enable-auto-updates %{buildroot}/usr/sbin/brace-enable-auto-updates;
install -Dm755 %{_sourcedir}/brace/usr/sbin/brace-fedora-enable-rpmfusion %{buildroot}/usr/sbin/brace-enable-rpmfusion;
install -Dm755 %{_sourcedir}/brace/usr/sbin/brace-fedora-update-system %{buildroot}/usr/sbin/brace-update-system;
install -Dm755 %{_sourcedir}/brace/usr/sbin/brace-installer %{buildroot}/usr/sbin/brace-installer;
install -Dm755 %{_sourcedir}/brace/usr/sbin/brace-rpm-verify %{buildroot}/usr/sbin/brace-rpm-verify;

%files
/etc/dconf/db/local.d/00-brace-cinnamon
/etc/dconf/db/local.d/00-brace-extra
/etc/dconf/db/local.d/00-brace-gnome
/etc/dconf/db/local.d/00-brace-mate
/etc/dconf/db/local.d/00-brace-pantheon
/etc/dconf/profile/user
/etc/profile.d/brace-env-overrides.sh
/etc/profile.d/brace-helpers.sh
/usr/lib64/firefox/browser/defaults/preferences/userjs-*.js
/usr/lib64/firefox/distribution/policies.json
/usr/lib64/thunderbird/defaults/pref/userjs-*.js
/etc/chromium/policies/managed/brace.json
/etc/opt/chrome/policies/managed/brace.json
/usr/lib/modprobe.d/blacklist-dma.conf
/usr/lib/modprobe.d/blacklist-usbnet.conf
/usr/lib/modprobe.d/wireless-perf.conf
/usr/lib/NetworkManager/conf.d/30-nm-privacy.conf
/usr/lib/sysctl.d/60-restrict.conf
/usr/lib/systemd/user/restic-backup@.service
/usr/lib/systemd/user/restic-backup@.timer
/usr/bin/brace-supplemental-changes
/usr/sbin/brace-enable-auto-updates
/usr/sbin/brace-enable-rpmfusion
/usr/sbin/brace-update-system
/usr/sbin/brace-installer
/usr/sbin/brace-rpm-verify
