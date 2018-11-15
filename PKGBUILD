# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=2.6
pkgrel=15
pkgdesc="Increases privacy/security through various configs. Firefox hardening credit: @pyllyukko"
arch=('any')
license=('GPLv3')
optdepends=('arch-audit: check for insecure packages'
	'scrub: erase drive freespace'
	'firejail: sandbox programs'
	'linux-hardened: harden against exploits'
	'rkhunter: scan for rootkits'
	'scfw: seal your ports'
	'firefox: browser'
	'thunderbird: e-mail')
source=('00-brace-gnome'
	'00-brace-mate'
	'00-brace-cinnamon'
	'00-brace-extra'
	'21-disable-connectivity-check.conf'
	'30-mac-randomization.conf'
	'60-restrict.conf'
	'blacklist-dma.conf'
	'blacklist-usbnet.conf'
	'brace-supplemental-changes.sh'
	'brace-arch-installer.sh'
	'brace-flathub-installer.sh'
	'iwlwifi.conf'
	'dnu.service'
	'brace-helpers.sh'
	'user.js.sh'
	'https://raw.githubusercontent.com/pyllyukko/user.js/master/user.js')
sha512sums=('b64da8b337e19717fca4655e739652ae1daa114e27489a282c4f23204a1f69342637a6a2e93b8a713fbb6053898e168a9781debe661ed7c2cd33cb07cba2a74a'
            '9d144653cd3a31c4e60f641f08770f52d3446937bae74a30d8aec14ce2a308cd05c66025112ec4e547c96b35bdc6c941a98b33006ab27667ee38f9f89bd585bb'
            '24616a6133608301d3c4016f2667bdf6982ab3f99ac231b5588bcb220545d992e3fcc97cceafd674f7b4ba00d5747f3f4d25da54130a1ff817d752ba6b93bf98'
            'd6a0629b2354fa2ddaf8e9a086aad384a9f60f36719281236bd180ed7205264862ffc2873ab86e5daa6b062647dbdd0b7251c26e51a76c22dfb4f6e58ffdbe09'
            '8ec47524685a59ed1ca45d5ba5334248cc505c07d71f1340d77a20e96e647b32c7a10cac1f1a2e32b0477a53c7ce14c57e839057b2b4fe7191932001c5679364'
            'cd03db723b789e9084cc2474edb3bf3f878cc5a751b437f69dd6f06a8015070e7c3f6750b581c15524e869f9fd8dd7db7eff9dad0650930e04387f5a36b4510e'
            'a6aceec23666bc7788c43d649e89ed5da0eaf637671e456d12a6de593fff459601a7d4a2bd1ae7707260faea80cfba382f8a785bfecfffaec51b6e1be259ac2f'
            'fcee1964b26f4309f20c8917a71d448e26f0f2c340ccea0a67f99d704dd009249d09aa215bd2424e234bc9b7927e4679043c2dad78f3fe8e8d744b07485ae655'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            '337a3dd60e424eab8dc5ed73a5ef00f137815173788893e6b025fdc2389e2267e28aaf4845cea611cdf500c8fe544b6de6d6fe5c93a8a4d05803a33389044484'
            'f6d055558cd399fa936ef4f7c5c5ff0312aa81fdccfb1700b0fcb73835b5d4b94354bffd27cfc8fcc5a0c0f40a155bf89f15310ef6157324aa20dd6058fc25b5'
            'f66346ed92358fd67ec134c71017a49e73c61efac1e526eafa04527365b662215ac016b117237b657ef0e8d5cf8e3ba14c5b767641ab92e53b471caf664ece55'
            'c07d4f5d591a07db530deb77065e488e788fd964c081c2859cee07cb0820c69ab8236b8713425c77b47a75435907643cd9a021719f7389c09b20787df1b0860b'
            '2bb7c4306b94687583caf5db2a8c384ffeeedcbaba72acc96a686e91a49c48e7b73a34e2dba74f8532d59ee250560fc6bf819e1308e37d9028d2138297d18b94'
            'd196beb86379b2df316d3698cf3827ebdb7ab8120e41a4085bcf87ae2d445c2f1e8875821b5aa18eac1d7c04685fa6ba480c455c1b9f92a072a06883b621df04'
            'dca9b4cf502ff408a7ba8d5a29a9e91d7975c35bfa53a3ca49651fc80bd1dc9b9ebaadebe7fff70b8dee3e2fc74a7d2c8bea9ca3087ece4e5d33f68d3483b486'
            '612463b7bbf5cda6e87ef393fb617a2a823474a275177d0b86538da2d9c75f4c755c58990afe0877c0cf72b0267666c4a5b6f34a28f37667a2b516a428ece46f')
install=brace.install

build() {
	sh user.js.sh user.js;
}

package() {
  cd "$srcdir"
  install -Dm644 00-brace-gnome "$pkgdir"/etc/dconf/db/local.d/00-brace-gnome
  install -Dm644 00-brace-mate "$pkgdir"/etc/dconf/db/local.d/00-brace-mate
  install -Dm644 00-brace-cinnamon "$pkgdir"/etc/dconf/db/local.d/00-brace-cinnamon
  install -Dm644 00-brace-extra "$pkgdir"/etc/dconf/db/local.d/00-brace-extra
  install -Dm755 brace-helpers.sh "$pkgdir"/etc/profile.d/brace-helpers.sh
  install -Dm755 brace-supplemental-changes.sh "$pkgdir"/usr/bin/brace-supplemental-changes
  install -Dm755 brace-arch-installer.sh "$pkgdir"/usr/bin/brace-installer
  install -Dm755 brace-flathub-installer.sh "$pkgdir"/usr/bin/brace-installer-flathub
  install -Dm644 blacklist-dma.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-dma.conf
  install -Dm644 blacklist-usbnet.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-usbnet.conf
  install -Dm644 iwlwifi.conf "$pkgdir"/usr/lib/modprobe.d/iwlwifi.conf
  install -Dm644 21-disable-connectivity-check.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/21-disable-connectivity-check.conf
  install -Dm644 30-mac-randomization.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/30-mac-randomization.conf
  install -Dm644 60-restrict.conf "$pkgdir"/usr/lib/sysctl.d/60-restrict.conf
  install -Dm644 dnu.service "$pkgdir"/usr/lib/systemd/system/dnu.service
  install -Dm644 user.js "$pkgdir"/usr/lib/firefox/browser/defaults/preferences/all-brace.js
  install -Dm644 user.js "$pkgdir"/usr/lib/firefox-developer-edition/browser/defaults/preferences/all-brace.js
  install -Dm644 user.js "$pkgdir"/usr/lib/icecat/browser/defaults/preferences/all-brace.js
  install -Dm644 user.js "$pkgdir"/usr/lib/thunderbird/defaults/preferences/all-brace.js
}
