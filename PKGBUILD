# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=20230306
pkgrel=1
pkgdesc="Increases privacy/security through various configs."
arch=('any')
license=('GPL3')
install=brace.install

build() {
	cp -r ../brace/ "$srcdir"/;
	cp ../README.md "$srcdir"/;
}

package() {
	install -Dm644 brace/etc/dconf/db/local.d/00-brace-cinnamon "$pkgdir"/etc/dconf/db/local.d/00-brace-cinnamon;
	install -Dm644 brace/etc/dconf/db/local.d/00-brace-extra "$pkgdir"/etc/dconf/db/local.d/00-brace-extra;
	install -Dm644 brace/etc/dconf/db/local.d/00-brace-gnome "$pkgdir"/etc/dconf/db/local.d/00-brace-gnome;
	install -Dm644 brace/etc/dconf/db/local.d/00-brace-mate "$pkgdir"/etc/dconf/db/local.d/00-brace-mate;
	install -Dm644 brace/etc/dconf/db/local.d/00-brace-pantheon "$pkgdir"/etc/dconf/db/local.d/00-brace-pantheon;
	install -Dm644 brace/etc/dconf/profile/user "$pkgdir"/etc/dconf/profile/user;
	install -Dm755 brace/etc/default/grub.d/brace.cfg "$pkgdir"/etc/default/grub.d/brace.cfg;
	install -Dm644 brace/etc/profile.d/brace-env-overrides.sh "$pkgdir"/etc/profile.d/brace-env-overrides.sh;
	install -Dm644 brace/etc/profile.d/brace-helpers.sh "$pkgdir"/etc/profile.d/brace-helpers.sh;
	install -Dm644 brace/etc/tlp.d/00-brace.conf "$pkgdir"/etc/tlp.d/00-brace.conf;
	mkdir -p "$pkgdir"/usr/lib/firefox/browser/defaults/preferences;
	install -Dm644 brace/usr/lib/firefox/browser/defaults/preferences/userjs-*.js "$pkgdir"/usr/lib/firefox/browser/defaults/preferences/;
	install -Dm644 brace/usr/lib/firefox/distribution/policies.json "$pkgdir"/usr/lib/firefox/distribution/policies.json;
	mkdir -p "$pkgdir"/usr/lib/thunderbird/defaults/pref;
	install -Dm644 brace/usr/lib/firefox/browser/defaults/preferences/userjs-*.js "$pkgdir"/usr/lib/thunderbird/defaults/pref/;
	install -Dm644 brace/etc/chromium/policies/managed/brace.json "$pkgdir"/etc/chromium/policies/managed/brace.json;
	install -Dm644 brace/etc/chromium/policies/managed/brace.json "$pkgdir"/etc/opt/chrome/policies/managed/brace.json;
	install -Dm644 brace/usr/lib/modprobe.d/blacklist-dma.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-dma.conf;
	install -Dm644 brace/usr/lib/modprobe.d/blacklist-usbnet.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-usbnet.conf;
	install -Dm644 brace/usr/lib/modprobe.d/wireless-perf.conf "$pkgdir"/usr/lib/modprobe.d/wireless-perf.conf;
	install -Dm644 brace/usr/lib/NetworkManager/conf.d/30-nm-privacy.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/30-nm-privacy.conf;
	install -Dm644 brace/usr/lib/sysctl.d/60-restrict.conf "$pkgdir"/usr/lib/sysctl.d/60-restrict.conf;
	install -Dm644 brace/usr/lib/systemd/resolved.conf.d/brace.conf "$pkgdir"/usr/lib/systemd/resolved.conf.d/brace.conf;
	install -Dm644 brace/usr/lib/systemd/system/ejabberd.service.d/99-brace.conf "$pkgdir"/usr/lib/systemd/system/ejabberd.service.d/99-brace.conf;
	install -Dm644 brace/usr/lib/systemd/system/httpd.service.d/99-brace.conf "$pkgdir"/usr/lib/systemd/system/httpd.service.d/99-brace.conf;
	install -Dm644 brace/usr/lib/systemd/system/irqbalance.service.d/99-brace.conf "$pkgdir"/usr/lib/systemd/system/irqbalance.service.d/99-brace.conf;
	install -Dm644 brace/usr/lib/systemd/system/minetest@.service.d/99-brace.conf "$pkgdir"/usr/lib/systemd/system/minetest@.service.d/99-brace.conf;
	install -Dm644 brace/usr/lib/systemd/system/ModemManager.service.d/99-brace.conf "$pkgdir"/usr/lib/systemd/system/ModemManager.service.d/99-brace.conf;
	install -Dm644 brace/usr/lib/systemd/system/murmur.service.d/90-quickstart.conf "$pkgdir"/usr/lib/systemd/system/murmur.service.d/90-quickstart.conf;
	install -Dm644 brace/usr/lib/systemd/system/murmur.service.d/99-brace.conf "$pkgdir"/usr/lib/systemd/system/murmur.service.d/99-brace.conf;
	install -Dm644 brace/usr/lib/systemd/system/NetworkManager.service.d/99-brace.conf "$pkgdir"/usr/lib/systemd/system/NetworkManager.service.d/99-brace.conf;
	install -Dm644 brace/usr/lib/systemd/system/php-fpm.service.d/99-brace.conf "$pkgdir"/usr/lib/systemd/system/php-fpm.service.d/99-brace.conf;
	install -Dm644 brace/usr/lib/systemd/system/radiusd.service.d/99-brace.conf "$pkgdir"/usr/lib/systemd/system/radiusd.service.d/99-brace.conf;
	install -Dm644 brace/usr/lib/systemd/system/rngd.service.d/99-brace.conf "$pkgdir"/usr/lib/systemd/system/rngd.service.d/99-brace.conf;
	install -Dm644 brace/usr/lib/systemd/system/tor.service.d/99-brace.conf "$pkgdir"/usr/lib/systemd/system/tor.service.d/99-brace.conf;
	install -Dm644 brace/usr/lib/systemd/system/wpa_supplicant.service.d/99-brace.conf "$pkgdir"/usr/lib/systemd/system/wpa_supplicant.service.d/99-brace.conf;
	install -Dm644 brace/usr/lib/tmpfiles.d/99-brace-proc.conf "$pkgdir"/usr/lib/tmpfiles.d/99-brace-proc.conf;
	install -Dm644 brace/usr/lib/tmpfiles.d/99-brace-sys.conf "$pkgdir"/usr/lib/tmpfiles.d/99-brace-sys.conf;
	install -Dm644 brace/usr/lib/udev/rules.d/50-usb-realtek-net-exceprt.rules "$pkgdir"/usr/lib/udev/rules.d/50-usb-realtek-net-exceprt.rules;
	install -Dm644 brace/usr/lib/systemd/user/restic-backup@.service "$pkgdir"/usr/lib/systemd/user/restic-backup@.service;
	install -Dm644 brace/usr/lib/systemd/user/restic-backup@.timer "$pkgdir"/usr/lib/systemd/user/restic-backup@.timer;
	install -Dm755 brace/usr/bin/brace-supplemental-changes "$pkgdir"/usr/bin/brace-supplemental-changes;
	install -Dm755 brace/usr/sbin/brace-installer "$pkgdir"/usr/bin/brace-installer;
	install -Dm755 brace/usr/sbin/brace-rpm-verify "$pkgdir"/usr/bin/brace-rpm-verify;
	mkdir -p "$pkgdir"/usr/share/doc/brace;
	install -Dm644 README.md "$pkgdir"/usr/share/doc/brace/README.md;
}
