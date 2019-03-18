# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=2.8
pkgrel=3
pkgdesc="Increases privacy/security through various configs. Firefox hardening credit: @pyllyukko"
arch=('any')
license=('GPLv3')
optdepends=('arch-audit: check for insecure packages'
	'scrub: erase drive freespace'
	'firejail: sandbox programs'
	'linux-hardened: harden against kernel exploits'
	'rkhunter: scan for rootkits'
	'ufw: seal your ports'
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
sha512sums=('bab6a22a4ab249a233a2c94bc868ff2c5801a9b13a9cded9bb6f80bb5d32727a26d58e5ee4b97a0d675968f1a03b59d7d4f99412f546b896e4c7585a0a0a7421'
            '9d144653cd3a31c4e60f641f08770f52d3446937bae74a30d8aec14ce2a308cd05c66025112ec4e547c96b35bdc6c941a98b33006ab27667ee38f9f89bd585bb'
            '24616a6133608301d3c4016f2667bdf6982ab3f99ac231b5588bcb220545d992e3fcc97cceafd674f7b4ba00d5747f3f4d25da54130a1ff817d752ba6b93bf98'
            'c18138b8d579e3b9c233fa322262cf098f79857e35fe06f8c29e4f9158098befc8bc2d609660b2c91cd20cee7c14b9ae43ab02c65c947724eeef39bbd3e73400'
            '8ec47524685a59ed1ca45d5ba5334248cc505c07d71f1340d77a20e96e647b32c7a10cac1f1a2e32b0477a53c7ce14c57e839057b2b4fe7191932001c5679364'
            'cd03db723b789e9084cc2474edb3bf3f878cc5a751b437f69dd6f06a8015070e7c3f6750b581c15524e869f9fd8dd7db7eff9dad0650930e04387f5a36b4510e'
            '8c59967722d9ca575b72951d7433072766b7529b5208348e0781bdae52f4e736de7b28d360f696a56e352b518d4829f5fc618a1ed00d770c180dc8d6851910a7'
            'fcee1964b26f4309f20c8917a71d448e26f0f2c340ccea0a67f99d704dd009249d09aa215bd2424e234bc9b7927e4679043c2dad78f3fe8e8d744b07485ae655'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            'ed100b8faa3ba8f8f8060869bc61afcacc8835271c52d496e34230c54b45d53588e5f48a4e782e6015273e861fd063f404299f47596018b912039d5bf621ae95'
            'f20c6e23095388a1a503e53b91236f5a33f7c3d705ef764bd7359c382c99d4529e4b351549ca46a5ee17ba3e55e092e0c5e1bb8bcf87f26c4f17e080030953ef'
            'f66346ed92358fd67ec134c71017a49e73c61efac1e526eafa04527365b662215ac016b117237b657ef0e8d5cf8e3ba14c5b767641ab92e53b471caf664ece55'
            'c07d4f5d591a07db530deb77065e488e788fd964c081c2859cee07cb0820c69ab8236b8713425c77b47a75435907643cd9a021719f7389c09b20787df1b0860b'
            '2bb7c4306b94687583caf5db2a8c384ffeeedcbaba72acc96a686e91a49c48e7b73a34e2dba74f8532d59ee250560fc6bf819e1308e37d9028d2138297d18b94'
            '4500c6f520043596c65c3d6508e0e4f6346eb74e62632e1e41942fb48990dd7c3c03ff662702030a75f0fc8c17953f14e4cd50e42afa59853d60b6bcc81562f5'
            'ecd423b428e72446d59bd8720d7cc324269da7ee9fd8e0ea04259ec5d1d4dd30efe9b8128c28c061af45e4ceb17e69a0871108c717db336b6583e43f082e427f'
            '74186d7c0d33aa52763392e0a4d1b156cc1d033a93c1afe100dd6067bb8a204be522244583a8d1406b965ae7ff1a65145b02471d60f88229c131c137419bd836')
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
