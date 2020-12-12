# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=20201212
pkgrel=3
pkgdesc="Increases privacy/security through various configs."
arch=('any')
license=('GPL3')
install=brace.install

build() {
	cp -r ../brace/ "$srcdir"/;
}

package() {
	install -Dm644 brace/etc/dconf/db/local.d/00-brace-cinnamon "$pkgdir"/etc/dconf/db/local.d/00-brace-cinnamon;
	install -Dm644 brace/etc/dconf/db/local.d/00-brace-extra "$pkgdir"/etc/dconf/db/local.d/00-brace-extra;
	install -Dm644 brace/etc/dconf/db/local.d/00-brace-gnome "$pkgdir"/etc/dconf/db/local.d/00-brace-gnome;
	install -Dm644 brace/etc/dconf/db/local.d/00-brace-mate "$pkgdir"/etc/dconf/db/local.d/00-brace-mate;
	install -Dm644 brace/etc/dconf/db/local.d/00-brace-pantheon "$pkgdir"/etc/dconf/db/local.d/00-brace-pantheon;
	install -Dm644 brace/etc/dconf/profile/user-full "$pkgdir"/etc/dconf/profile/user;
	install -Dm755 brace/etc/profile.d/brace-env-overrides.sh "$pkgdir"/etc/profile.d/brace-env-overrides.sh;
	install -Dm755 brace/etc/profile.d/brace-helpers.sh "$pkgdir"/etc/profile.d/brace-helpers.sh;
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
	install -Dm644 brace/usr/lib/systemd/user/restic-backup@.service "$pkgdir"/usr/lib/systemd/user/restic-backup@.service;
	install -Dm644 brace/usr/lib/systemd/user/restic-backup@.timer "$pkgdir"/usr/lib/systemd/user/restic-backup@.timer;
	install -Dm755 brace/usr/bin/brace-supplemental-changes "$pkgdir"/usr/bin/brace-supplemental-changes;
	install -Dm755 brace/usr/sbin/brace-installer "$pkgdir"/usr/sbin/brace-installer;
	install -Dm755 brace/usr/sbin/brace-rpm-verify "$pkgdir"/usr/sbin/brace-rpm-verify;
}
