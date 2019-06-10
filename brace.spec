Name: brace
Version: 20190610
Release: 4
Summary: Increases privacy/security through various configs.
License: GPLv3+
BuildArch: noarch
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
- Adds many helper scripts: brace-installer, brace-remover, brace-supplemental-changes
- GNOME/Cinnamon/MATE: change default settings
- Firefox: change default settings, credit @pyllyukko, license MIT
- NetworkManager: disable connectivity checking
- Networkmanager: enable MAC address randomization
- kernel: restrict dmesg and ptrace
- kernel: blacklist modules that provide direct memory access externally
- kernel: blacklist modules that allow for USB networking
- profile: adds helper aliases
- kernel: iwlwifi: enables link aggregation for increased performance

%post
if [ -f /usr/bin/dconf ]; then dconf update; fi;
echo "For additional hardening try the following:";
echo "Pepper your /etc/fstab with nodev,nosuid,noexec";
echo "Stealth Mode: firewall-cmd --set-default-zone=drop";
echo "Stricter Ciphers: update-crypto-policies --set NEXT";
echo "Stricter Kernel: grubby --update-kernel=ALL --args=\"lockdown=1 pti=on vsyscall=none page_poison=1 slab_nomerge slub_debug=FZP\"";
echo "Strict IOMMU: grubby --update-kernel=ALL --args=\"iommu=force intel_iommu=on amd_iommu=force_isolation\"";

%postun
if [ -f /usr/bin/dconf ]; then dconf update; fi;

%install
install -Dm644 00-brace-gnome %{buildroot}/etc/dconf/db/local.d/00-brace-gnome
install -Dm644 00-brace-mate %{buildroot}/etc/dconf/db/local.d/00-brace-mate
install -Dm644 00-brace-cinnamon %{buildroot}/etc/dconf/db/local.d/00-brace-cinnamon
install -Dm644 00-brace-extra %{buildroot}/etc/dconf/db/local.d/00-brace-extra
install -Dm755 brace-helpers.sh %{buildroot}/etc/profile.d/brace-helpers.sh
install -Dm755 brace-supplemental-changes.sh %{buildroot}/usr/bin/brace-supplemental-changes
install -Dm755 brace-fedora-enable-auto-updates.sh %{buildroot}/usr/bin/brace-enable-auto-updates
install -Dm755 brace-fedora-enable-rpmfusion.sh %{buildroot}/usr/bin/brace-enable-rpmfusion
install -Dm755 brace-fedora-installer.sh %{buildroot}/usr/bin/brace-installer
install -Dm755 brace-fedora-installer-base.sh %{buildroot}/usr/bin/brace-installer-base
install -Dm755 brace-flathub-installer.sh %{buildroot}/usr/bin/brace-installer-flathub
install -Dm755 brace-atomic-installer.sh %{buildroot}/usr/bin/brace-installer-atomic
install -Dm755 brace-fedora-remover.sh %{buildroot}/usr/bin/brace-remover
install -Dm755 brace-fedora-update-system.sh %{buildroot}/usr/bin/brace-update-system
install -Dm755 brace-rpm-verify.sh %{buildroot}/usr/bin/brace-rpm-verify
install -Dm644 blacklist-dma.conf %{buildroot}/usr/lib/modprobe.d/blacklist-dma.conf
install -Dm644 blacklist-usbnet.conf %{buildroot}/usr/lib/modprobe.d/blacklist-usbnet.conf
install -Dm644 iwlwifi.conf %{buildroot}/usr/lib/modprobe.d/iwlwifi.conf
install -Dm644 21-disable-connectivity-check.conf %{buildroot}/usr/lib/NetworkManager/conf.d/21-disable-connectivity-check.conf
install -Dm644 30-mac-randomization.conf %{buildroot}/usr/lib/NetworkManager/conf.d/30-mac-randomization.conf
install -Dm644 60-restrict.conf %{buildroot}/usr/lib/sysctl.d/60-restrict.conf
mkdir -p %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/;
install -Dm644 userjs-*.js %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/;
mkdir -p %{buildroot}/usr/lib64/thunderbird/defaults/pref/;
install -Dm644 userjs-*.js %{buildroot}/usr/lib64/thunderbird/defaults/pref/;

%files
/etc/dconf/db/local.d/00-brace-gnome
/etc/dconf/db/local.d/00-brace-mate
/etc/dconf/db/local.d/00-brace-cinnamon
/etc/dconf/db/local.d/00-brace-extra
/etc/profile.d/brace-helpers.sh
/usr/bin/brace-supplemental-changes
/usr/bin/brace-enable-auto-updates
/usr/bin/brace-enable-rpmfusion
/usr/bin/brace-installer
/usr/bin/brace-installer-base
/usr/bin/brace-installer-flathub
/usr/bin/brace-installer-atomic
/usr/bin/brace-remover
/usr/bin/brace-update-system
/usr/bin/brace-rpm-verify
/usr/lib/modprobe.d/blacklist-dma.conf
/usr/lib/modprobe.d/blacklist-usbnet.conf
/usr/lib/modprobe.d/iwlwifi.conf
/usr/lib/NetworkManager/conf.d/21-disable-connectivity-check.conf
/usr/lib/NetworkManager/conf.d/30-mac-randomization.conf
/usr/lib/sysctl.d/60-restrict.conf
/usr/lib64/firefox/browser/defaults/preferences/userjs-*.js
/usr/lib64/thunderbird/defaults/pref/userjs-*.js
