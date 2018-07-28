Name: brace
Version: 1.9
Release: 6
Summary: Increases privacy/security through various configs.
License: GPLv3+
BuildArch: noarch
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
- Adds many helper scripts: brace-installer, brace-remover, brace-supplemental-changes
- GNOME: change default settings
- Firefox: change default settings, credit @pyllyukko, license MIT
- NetworkManager: disable connectivity checking
- Networkmanager: enable MAC address randomization
- kernel: restrict dmesg and ptrace
- kernel: blacklist modules that provide direct memory access externally
- kernel: blacklist modules that allow for USB networking
- profile: adds helper aliases
- kernel: iwlwifi: enables link aggregation for increased performance

%post
dconf update

%postun
dconf update

%install
install -Dm644 00-gnome_defaults %{buildroot}/etc/dconf/db/local.d/00-brace-gnome
install -Dm755 helpers.sh %{buildroot}/etc/profile.d/helpers.sh
install -Dm755 brace-supplemental-changes.sh %{buildroot}/usr/bin/brace-supplemental-changes
install -Dm755 brace-fedora-enable-auto-updates.sh %{buildroot}/usr/bin/brace-enable-auto-updates
install -Dm755 brace-fedora-enable-rpmfusion.sh %{buildroot}/usr/bin/brace-enable-rpmfusion
install -Dm755 brace-fedora-installer.sh %{buildroot}/usr/bin/brace-installer
install -Dm755 brace-fedora-installer-base.sh %{buildroot}/usr/bin/brace-installer-base
install -Dm755 brace-fedora-remover.sh %{buildroot}/usr/bin/brace-remover
install -Dm644 blacklist-dma.conf %{buildroot}/usr/lib/modprobe.d/blacklist-dma.conf
install -Dm644 blacklist-usbnet.conf %{buildroot}/usr/lib/modprobe.d/blacklist-usbnet.conf
install -Dm644 iwlwifi.conf %{buildroot}/usr/lib/modprobe.d/iwlwifi.conf
install -Dm644 21-disable-connectivity-check.conf %{buildroot}/usr/lib/NetworkManager/conf.d/21-disable-connectivity-check.conf
install -Dm644 30-mac-randomization.conf %{buildroot}/usr/lib/NetworkManager/conf.d/30-mac-randomization.conf
install -Dm644 60-restrict.conf %{buildroot}/usr/lib/sysctl.d/60-restrict.conf
install -Dm644 user.js %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;

sh user.js.sh %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;

%files
/etc/dconf/db/local.d/00-brace-gnome
/etc/profile.d/helpers.sh
/usr/bin/brace-supplemental-changes
/usr/bin/brace-enable-auto-updates
/usr/bin/brace-enable-rpmfusion
/usr/bin/brace-installer
/usr/bin/brace-installer-base
/usr/bin/brace-remover
/usr/lib/modprobe.d/blacklist-dma.conf
/usr/lib/modprobe.d/blacklist-usbnet.conf
/usr/lib/modprobe.d/iwlwifi.conf
/usr/lib/NetworkManager/conf.d/21-disable-connectivity-check.conf
/usr/lib/NetworkManager/conf.d/30-mac-randomization.conf
/usr/lib/sysctl.d/60-restrict.conf
/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
