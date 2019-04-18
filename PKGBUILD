# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=3.0
pkgrel=5
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
	'brace-helpers.sh'
	'userjs-brace.js'
	'userjs-brace-perf.js'
	'userjs-ghacks.js'
	'userjs-pyllyukko.js')
sha512sums=('72d4c3aabcc29d705b85a6591029d860ba1e22f52f2150710bf111770392a3c70162451722f479ce9c84f917ffee5151dc7b959a55a84a2d5cffa043383b502f'
            '3c9a63a41dd884f3f53cdbe0ec8a4f9445ba5c31a53020c14c6d46d336ded03b10353e795c2d53f0ffc74f14d0214122c7633f2aacd1166b6f7f8f148c27cbe8'
            '24616a6133608301d3c4016f2667bdf6982ab3f99ac231b5588bcb220545d992e3fcc97cceafd674f7b4ba00d5747f3f4d25da54130a1ff817d752ba6b93bf98'
            '52d53ba383393dea496d58b739cdbef44b48d2f11ba85b54448e4e765fa0feedbf70be5b85e211c5c28db9613abbecbfb0135cc5b79f7b4087d7507b6d026d81'
            '8ec47524685a59ed1ca45d5ba5334248cc505c07d71f1340d77a20e96e647b32c7a10cac1f1a2e32b0477a53c7ce14c57e839057b2b4fe7191932001c5679364'
            'cd03db723b789e9084cc2474edb3bf3f878cc5a751b437f69dd6f06a8015070e7c3f6750b581c15524e869f9fd8dd7db7eff9dad0650930e04387f5a36b4510e'
            '8c59967722d9ca575b72951d7433072766b7529b5208348e0781bdae52f4e736de7b28d360f696a56e352b518d4829f5fc618a1ed00d770c180dc8d6851910a7'
            'fcee1964b26f4309f20c8917a71d448e26f0f2c340ccea0a67f99d704dd009249d09aa215bd2424e234bc9b7927e4679043c2dad78f3fe8e8d744b07485ae655'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            '1957069b9e739f9577f4db135f1dc64f2d65aaf5d74b70423f7983ace1f806809e39356bb40ec4c27e80db66b645c1a85ff73b35d9931b391a0cdb5402301fa2'
            'f20c6e23095388a1a503e53b91236f5a33f7c3d705ef764bd7359c382c99d4529e4b351549ca46a5ee17ba3e55e092e0c5e1bb8bcf87f26c4f17e080030953ef'
            'f66346ed92358fd67ec134c71017a49e73c61efac1e526eafa04527365b662215ac016b117237b657ef0e8d5cf8e3ba14c5b767641ab92e53b471caf664ece55'
            'c07d4f5d591a07db530deb77065e488e788fd964c081c2859cee07cb0820c69ab8236b8713425c77b47a75435907643cd9a021719f7389c09b20787df1b0860b'
            '234d146b76e1ca572d856ba837848842ceced658a547ac058fd9bbcf5f04ac696756608339209b20b97956f80814b9393207dffddc109abda15ca6f98bb0e756'
            '7479e4f001e572c3625b1a21811cdbb1b269cfaa8f816e2ecbac9b4950b0cb91f3ad1a476405b43ccd5d38a99c051b0e609fd93cab6e3f9400002748983df2f4'
            'a0999164d4031a04ce10db848ea944b2db734f08dcf3554bfb6d651305cde95f852b46e3aea2cc4f1468a0a6c07c06623f0e925d025fdee848f122f412ee951a'
            '0cccc61fccf4f547fb6f214a190303b12e51adcf62d8853817b6c2bde2814598887085c076635d225b138e7799207e6235da3849fddc8cfc1112a4a518d3f25d'
            'ed402031d5c7fa33d86fb6c11a2972a66277f137006910be28c71f600a2daf82a5fa34c4966cc848ef7afa4ce9929670ebc56f3a14520366f7135fdb8eb18437')
install=brace.install

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
  mkdir -p "$pkgdir"/usr/lib/firefox/browser/defaults/preferences/
  install -Dm644 userjs-*.js "$pkgdir"/usr/lib/firefox/browser/defaults/preferences/
  mkdir -p "$pkgdir"/usr/lib/thunderbird/defaults/preferences/
  install -Dm644 userjs-*.js "$pkgdir"/usr/lib/thunderbird/defaults/preferences/
}
