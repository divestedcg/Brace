Name: brace
Version: 20200614
Release: 7
Summary: Increases privacy/security through various configs.
License: GPLv3+
BuildArch: noarch
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root
%define _binary_payload w3T.xzdio

%description
- Adds many helper scripts: brace-installer, brace-remover, brace-supplemental-changes
- GNOME/Cinnamon/MATE: change default settings
- Firefox: change default settings, credit @ghacksuserjs + @pyllyukko, license MIT
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
install -Dm644 00-brace-gnome %{buildroot}/etc/dconf/db/local.d/00-brace-gnome
install -Dm644 00-brace-mate %{buildroot}/etc/dconf/db/local.d/00-brace-mate
install -Dm644 00-brace-cinnamon %{buildroot}/etc/dconf/db/local.d/00-brace-cinnamon
install -Dm644 00-brace-pantheon %{buildroot}/etc/dconf/db/local.d/00-brace-pantheon
install -Dm644 00-brace-extra %{buildroot}/etc/dconf/db/local.d/00-brace-extra
install -Dm644 dconf-profile-user %{buildroot}/etc/dconf/profile/user
install -Dm755 brace-env-overrides.sh %{buildroot}/etc/profile.d/brace-env-overrides.sh
install -Dm755 brace-helpers.sh %{buildroot}/etc/profile.d/brace-helpers.sh
install -Dm755 brace-supplemental-changes.sh %{buildroot}/usr/bin/brace-supplemental-changes
install -Dm755 brace-fedora-enable-auto-updates.sh %{buildroot}/usr/bin/brace-enable-auto-updates
install -Dm755 brace-fedora-enable-rpmfusion.sh %{buildroot}/usr/bin/brace-enable-rpmfusion
install -Dm755 brace-installer.sh %{buildroot}/usr/bin/brace-installer
install -Dm755 brace-fedora-remover.sh %{buildroot}/usr/bin/brace-remover
install -Dm755 brace-fedora-update-system.sh %{buildroot}/usr/bin/brace-update-system
install -Dm755 brace-rpm-verify.sh %{buildroot}/usr/bin/brace-rpm-verify
install -Dm644 blacklist-dma.conf %{buildroot}/usr/lib/modprobe.d/blacklist-dma.conf
install -Dm644 blacklist-usbnet.conf %{buildroot}/usr/lib/modprobe.d/blacklist-usbnet.conf
install -Dm644 wireless-perf.conf %{buildroot}/usr/lib/modprobe.d/wireless-perf.conf
install -Dm644 30-nm-privacy.conf %{buildroot}/usr/lib/NetworkManager/conf.d/30-nm-privacy.conf
install -Dm644 60-restrict.conf %{buildroot}/usr/lib/sysctl.d/60-restrict.conf
install -Dm644 restic-backup@.service %{buildroot}/usr/lib/systemd/user/restic-backup@.service
install -Dm644 restic-backup@.timer %{buildroot}/usr/lib/systemd/user/restic-backup@.timer
mkdir -p %{buildroot}/etc/chromium/policies/managed/;
install -Dm644 chromium-brace.json %{buildroot}/etc/chromium/policies/managed/brace.json
mkdir -p %{buildroot}/etc/opt/chrome/policies/managed/;
install -Dm644 chromium-brace.json %{buildroot}/etc/opt/chrome/policies/managed/brace.json
install -Dm644 firefox-brace.json %{buildroot}/usr/lib64/firefox/distribution/policies.json
mkdir -p %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/;
install -Dm644 userjs-*.js %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/;
mkdir -p %{buildroot}/usr/lib64/thunderbird/defaults/pref/;
install -Dm644 userjs-*.js %{buildroot}/usr/lib64/thunderbird/defaults/pref/;

%files
/etc/chromium/policies/managed/brace.json
/etc/opt/chrome/policies/managed/brace.json
/etc/dconf/db/local.d/00-brace-gnome
/etc/dconf/db/local.d/00-brace-mate
/etc/dconf/db/local.d/00-brace-cinnamon
/etc/dconf/db/local.d/00-brace-pantheon
/etc/dconf/db/local.d/00-brace-extra
/etc/dconf/profile/user
/etc/profile.d/brace-env-overrides.sh
/etc/profile.d/brace-helpers.sh
/usr/bin/brace-supplemental-changes
/usr/bin/brace-enable-auto-updates
/usr/bin/brace-enable-rpmfusion
/usr/bin/brace-installer
/usr/bin/brace-remover
/usr/bin/brace-update-system
/usr/bin/brace-rpm-verify
/usr/lib/modprobe.d/blacklist-dma.conf
/usr/lib/modprobe.d/blacklist-usbnet.conf
/usr/lib/modprobe.d/wireless-perf.conf
/usr/lib/NetworkManager/conf.d/30-nm-privacy.conf
/usr/lib/sysctl.d/60-restrict.conf
/usr/lib/systemd/user/restic-backup@.service
/usr/lib/systemd/user/restic-backup@.timer
/usr/lib64/firefox/distribution/policies.json
/usr/lib64/firefox/browser/defaults/preferences/userjs-*.js
/usr/lib64/thunderbird/defaults/pref/userjs-*.js
