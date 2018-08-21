# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=2.4
pkgrel=2
pkgdesc="Increases privacy/security through various configs. Firefox hardening credit: @pyllyukko"
arch=('any')
license=('GPLv3')
optdepends=('arch-audit: check for insecure packages'
	'extirpater: erase drive freespace'
	'firejail: sandbox programs'
	'linux-hardened: harden against exploits'
	'rkhunter: scan for rootkits'
	'scfw: seal your ports'
	'firefox: browser')
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
sha512sums=('0cef04c8d406a814d606af07aac655d0205b1da03673bc3a618949135e2c2d5b86d4a9ac2aa2fc0a79a855ba8eb1da0d51ff19aaa1658c99240b0e12f60237e8'
            '5b6dad124ff1e5c32c868d7566c634a3aa3f3d933e0184d7a97b3ea223209e3b5b0808ff3e9f8ea8517250835a8e8fdc1579f718cb494b028cf2cf333b70b174'
            '24616a6133608301d3c4016f2667bdf6982ab3f99ac231b5588bcb220545d992e3fcc97cceafd674f7b4ba00d5747f3f4d25da54130a1ff817d752ba6b93bf98'
            'd6a0629b2354fa2ddaf8e9a086aad384a9f60f36719281236bd180ed7205264862ffc2873ab86e5daa6b062647dbdd0b7251c26e51a76c22dfb4f6e58ffdbe09'
            '8ec47524685a59ed1ca45d5ba5334248cc505c07d71f1340d77a20e96e647b32c7a10cac1f1a2e32b0477a53c7ce14c57e839057b2b4fe7191932001c5679364'
            'cd03db723b789e9084cc2474edb3bf3f878cc5a751b437f69dd6f06a8015070e7c3f6750b581c15524e869f9fd8dd7db7eff9dad0650930e04387f5a36b4510e'
            'a6aceec23666bc7788c43d649e89ed5da0eaf637671e456d12a6de593fff459601a7d4a2bd1ae7707260faea80cfba382f8a785bfecfffaec51b6e1be259ac2f'
            'fcee1964b26f4309f20c8917a71d448e26f0f2c340ccea0a67f99d704dd009249d09aa215bd2424e234bc9b7927e4679043c2dad78f3fe8e8d744b07485ae655'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            '337a3dd60e424eab8dc5ed73a5ef00f137815173788893e6b025fdc2389e2267e28aaf4845cea611cdf500c8fe544b6de6d6fe5c93a8a4d05803a33389044484'
            '7c80ef0b59d639f5bc5dbbf2d3c3281ab5a0d427d4124b4826596299be6bc71a8adb89002190c2105e9a7cb19e12dfa427b30ea179d1a7f35d421edf2a01a429'
            '2b13562c0815519a1951906d9a4429cfa35fcf7b89b9b1af15e9d2da81c4a2a4ed4710a224dc6d4e1e32c16e18d9e159c8b4ec07ca9a95da49c52255c5d946f7'
            'c07d4f5d591a07db530deb77065e488e788fd964c081c2859cee07cb0820c69ab8236b8713425c77b47a75435907643cd9a021719f7389c09b20787df1b0860b'
            '2bb7c4306b94687583caf5db2a8c384ffeeedcbaba72acc96a686e91a49c48e7b73a34e2dba74f8532d59ee250560fc6bf819e1308e37d9028d2138297d18b94'
            'd196beb86379b2df316d3698cf3827ebdb7ab8120e41a4085bcf87ae2d445c2f1e8875821b5aa18eac1d7c04685fa6ba480c455c1b9f92a072a06883b621df04'
            '5ed86f308ce297a38c36d25055f4fbb53634d2cb2860099aef284e8b83e89b38c97a8365c8e0e855e964d7738c900d7b6ee205dd14539f7613e8f2e563280ed3'
            '6c7d60e6cb655e3b8931a1afeab7a39cfd37672eb639f0c93c7d6acffa5ed885ebf065cc5c1a18783f206dbb94f74ad4fad3292054511217727db320b1ff02d4')
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
  install -Dm755 brace-flathub-installer.sh "$pkgdir"/usr/bin/brace-installer-flatpak
  install -Dm644 blacklist-dma.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-dma.conf
  install -Dm644 blacklist-usbnet.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-usbnet.conf
  install -Dm644 iwlwifi.conf "$pkgdir"/usr/lib/modprobe.d/iwlwifi.conf
  install -Dm644 21-disable-connectivity-check.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/21-disable-connectivity-check.conf
  install -Dm644 30-mac-randomization.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/30-mac-randomization.conf
  install -Dm644 60-restrict.conf "$pkgdir"/usr/lib/sysctl.d/60-restrict.conf
  install -Dm644 dnu.service "$pkgdir"/usr/lib/systemd/system/dnu.service
  install -Dm644 user.js "$pkgdir"/usr/lib/firefox/browser/defaults/preferences/all-brace.js
}
