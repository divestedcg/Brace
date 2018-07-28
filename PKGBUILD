# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=2.1
pkgrel=1
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
	'iwlwifi.conf'
	'dnu.service'
	'helpers.sh'
	'user.js.sh'
	'https://raw.githubusercontent.com/pyllyukko/user.js/master/user.js')
sha512sums=('0a3990151e0d63fc51dda46f3b83ca880316ab5bf99317786bc822be05edecd0cabb66ba10bc0fdfe738ced4c32f60cceaf5527f29b0e699ba21fd602216433c'
            '20c54f74e873b8fc85db0241bbb962474875f6fe7a881a16e49f32fc0111453281edf1959c897e82a23bb36d8add8c781b0dc459f1e8a4dafa041e7d45826a07'
            '405894a41424f4cb5a2983f55dad8fda3c560e8fee75c7af1d44e68c507aeddec81b47b54419213c63a362772ca9e3fd53dcc8ebdc02985c2f5d5593f76765fa'
            '9a7b15bace5951e144d5b02e1d472b4b84457bed778c3717c9e7a7997a78fd4f11e8dfaaa54fbcd0cb64723b6b477bbf8ea84796b82fe305082e9cdfd6d92b7f'
            '8ec47524685a59ed1ca45d5ba5334248cc505c07d71f1340d77a20e96e647b32c7a10cac1f1a2e32b0477a53c7ce14c57e839057b2b4fe7191932001c5679364'
            'cd03db723b789e9084cc2474edb3bf3f878cc5a751b437f69dd6f06a8015070e7c3f6750b581c15524e869f9fd8dd7db7eff9dad0650930e04387f5a36b4510e'
            'a6aceec23666bc7788c43d649e89ed5da0eaf637671e456d12a6de593fff459601a7d4a2bd1ae7707260faea80cfba382f8a785bfecfffaec51b6e1be259ac2f'
            'fcee1964b26f4309f20c8917a71d448e26f0f2c340ccea0a67f99d704dd009249d09aa215bd2424e234bc9b7927e4679043c2dad78f3fe8e8d744b07485ae655'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            'd02be3486ebed1a8bba9742c705349078c49daf8fe96d0f3950ae3841dc376c247fbd77a3882d957ef5a7cb23c41714ec2dc28c9e07e4cddb90c66d007b5ab08'
            '07ee653f32ec9df08420c996a5994ac7c9a5463396a9ed0c580178f090358753812128638bb8fb373bc9dcef464ad623c40b346207725620be84e468b3a9c4ce'
            'c07d4f5d591a07db530deb77065e488e788fd964c081c2859cee07cb0820c69ab8236b8713425c77b47a75435907643cd9a021719f7389c09b20787df1b0860b'
            '2bb7c4306b94687583caf5db2a8c384ffeeedcbaba72acc96a686e91a49c48e7b73a34e2dba74f8532d59ee250560fc6bf819e1308e37d9028d2138297d18b94'
            '68f29b8c373a06ff4e8ed842717e7d7497d3f99f5ac68c6314534652d0080c64934e780c7c3ec324bcee84a1b905fe5db813589bcf9b37937a11810570a6611f'
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
  install -Dm755 helpers.sh "$pkgdir"/etc/profile.d/helpers.sh
  install -Dm755 brace-supplemental-changes.sh "$pkgdir"/usr/bin/brace-supplemental-changes
  install -Dm755 brace-arch-installer.sh "$pkgdir"/usr/bin/brace-installer
  install -Dm644 blacklist-dma.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-dma.conf
  install -Dm644 blacklist-usbnet.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-usbnet.conf
  install -Dm644 iwlwifi.conf "$pkgdir"/usr/lib/modprobe.d/iwlwifi.conf
  install -Dm644 21-disable-connectivity-check.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/21-disable-connectivity-check.conf
  install -Dm644 30-mac-randomization.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/30-mac-randomization.conf
  install -Dm644 60-restrict.conf "$pkgdir"/usr/lib/sysctl.d/60-restrict.conf
  install -Dm644 dnu.service "$pkgdir"/usr/lib/systemd/system/dnu.service
  install -Dm644 user.js "$pkgdir"/usr/lib/firefox/browser/defaults/preferences/all-brace.js
}
