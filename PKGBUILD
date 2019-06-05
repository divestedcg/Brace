# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=20190605
pkgrel=1
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
sha512sums=('c66b0f7975dd7bd096508d093614094d93a108256cc253c1ec5f59f0ca39f00fa58cff9a8847420d933dac9ccd40035b0c465ed79ad631e82c1efc0f783d5a3c'
            '0dabcc58ee08374060e9c6fb39535c60624502de44d64a1d2f488cb1f636d43b9d6f8c07bfca20e7c7da9c5790146b9c1074c56a3cb1c7f809651d7862abc038'
            '24616a6133608301d3c4016f2667bdf6982ab3f99ac231b5588bcb220545d992e3fcc97cceafd674f7b4ba00d5747f3f4d25da54130a1ff817d752ba6b93bf98'
            '1f11c17dfcd63be4ac26e395d4ab1ce6f3433d66a7baa0900a5e022ac9cc41e93e58dd5e6d30bd8419b4ab1ad77283ac435db6df2b80dc56e8309c1513dc88e5'
            '8ec47524685a59ed1ca45d5ba5334248cc505c07d71f1340d77a20e96e647b32c7a10cac1f1a2e32b0477a53c7ce14c57e839057b2b4fe7191932001c5679364'
            'cd03db723b789e9084cc2474edb3bf3f878cc5a751b437f69dd6f06a8015070e7c3f6750b581c15524e869f9fd8dd7db7eff9dad0650930e04387f5a36b4510e'
            '308149c535bf4feabbb7b070705abb44870a6b31fdb1f978760c8d7d3b9c9f6fd5ba03d888956cf61f3ee74c3a07ef656240c30d457954f75f47a95452ce4150'
            'ba57603a85b3e25f8146269cadbb4953b6b3d66a25e251b1478fc85704c884eb56ef8b1cd17a547631d5778ffab37fd212c9cf0eb0525e4c46b9c7418836146a'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            'e91c1479f49d35d57f8be80c4f819f3029b172b9e1a3badae82949a052a84acd5635949b768d2d8e4333f813ce947aef6d3fe46a5b1228252b524313e6bdc229'
            '508789e2a229534745b823bda81e7757f92b8afb76ee2dbf7e81b70321258aa2de4aca933fbf2105c053600829753f830f1f2870f899bf493b8fc90c15d428dc'
            '795e3144004db0598d0cd6b5127ebe818ceeb65d1d74e744520ab5e698fd418ec1e6021bede60015957fece0d79123fc3f290b1e41d6927cd3819125b31ecd33'
            'c07d4f5d591a07db530deb77065e488e788fd964c081c2859cee07cb0820c69ab8236b8713425c77b47a75435907643cd9a021719f7389c09b20787df1b0860b'
            '234d146b76e1ca572d856ba837848842ceced658a547ac058fd9bbcf5f04ac696756608339209b20b97956f80814b9393207dffddc109abda15ca6f98bb0e756'
            '26ee849b74c6f871e651531fd25dc4932901ff513a86d4c01f6a66e8ade2d8038171229087b46cb486a867e23f471f79e4ddb597cb11e5b5669d83b25a0a906a'
            'a0999164d4031a04ce10db848ea944b2db734f08dcf3554bfb6d651305cde95f852b46e3aea2cc4f1468a0a6c07c06623f0e925d025fdee848f122f412ee951a'
            '88ff773bb1e34d0640021c93700b50a0d98e7cdaa3f2977d8a61df8bdc61b462c8b004ecf9221a9a9da79b3d3f37c662a93d2717475c3665e9f6e9a328c965b4'
            'b168818030095032e1d7c417c1bd1dcce494751df2f78ed5193c07ad120bac8de4aac876d01446642295c6ef4603ac5cf97c53ca17a95cc6e971ec554f6610c1')
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
