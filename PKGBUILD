# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=20190713
pkgrel=1
pkgdesc="Increases privacy/security through various configs."
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
	'30-nm-privacy.conf'
	'60-restrict.conf'
	'blacklist-dma.conf'
	'blacklist-usbnet.conf'
	'brace-supplemental-changes.sh'
	'brace-arch-installer.sh'
	'brace-flathub-installer.sh'
	'wireless-perf.conf'
	'chromium-brace.json'
	'brace-helpers.sh'
	'userjs-brace.js'
	'userjs-brace-perf.js'
	'userjs-ghacks.js'
	'userjs-pyllyukko.js')
sha512sums=('d759332dafa53824b99f1317c3823aed2861007a53dfe87c1f42b6a927b69b0f4a4376c921c3a731b272928702bd00d9e16d2a554f6df218ca23a3d972832a0f'
            '79814e1dd242ddc3128b929d755ee7bc84431a700f945c2e9a849d925131654b32e46a3763cb54734cb1612d9cc27277a315d02517c3c06020383040a5d94ba6'
            '24616a6133608301d3c4016f2667bdf6982ab3f99ac231b5588bcb220545d992e3fcc97cceafd674f7b4ba00d5747f3f4d25da54130a1ff817d752ba6b93bf98'
            '3625e53fee7a1bf755a9de3b5f702e75ba67bb4160c6fd8b36f6cf28a9e939e8db982151c507f76b7955391c5bb93654695a2da39724e88309fe350242689d90'
            '6e585be661b1494f285356b56eafe9a501674e5d8502f8562d2ee7e33715c50a67c5eca178bef69d602d407cdd309a5ef7bbddc6e0a33002ebb7ca6598b79528'
            'c1c4bf258ba5075159bdf55d8bc15fcc8f8170b6399979ee950ca80970fad41539eb2c518e7bf98e6f0a299e76aed38acd62b032f9068ecc347f9e6c219ff186'
            'ba57603a85b3e25f8146269cadbb4953b6b3d66a25e251b1478fc85704c884eb56ef8b1cd17a547631d5778ffab37fd212c9cf0eb0525e4c46b9c7418836146a'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            '788403d186d3d0c310fd5947fb2ce0b73e157e632f2059f067f791509d3150876e5280fb9792d983f04bd7fd4b91bb027eb96ced969109757720b0406138e6a0'
            'a920e63691928f474111d818a652f9cd1f6ea041e97f145e43bafecfa5b941fa1c29af320f6c615481605278b9f85b43e1a49b32d0b26f86b453ee626d3851e8'
            '06c4d7d94600147a0060984525e28c79bbf731da5a3248b4e14e93e7b86b9fc21a3aa9cbf0418735ffe0be5acd60274b0f1f4384dbfcea2a0b06889ed53eba49'
            'd60121d7746936387e058287008ba720c7b389c25cb9654527ccc81a2ce2523ce343fc89f61005a6376e814319c959a794ada076addbe2639971ff0bbee001c5'
            '8112ae304bdafe1f6fa611a001e6e5674001a62abf45e8ab947474536c0e90e28ada821003208ecd91555a94c4d60d1a96cac02cb0a534bfc95a1fddac33f29f'
            '234d146b76e1ca572d856ba837848842ceced658a547ac058fd9bbcf5f04ac696756608339209b20b97956f80814b9393207dffddc109abda15ca6f98bb0e756'
            '2bd5348ff840cf63c5bfa06a8cd33c7c73b6de58e7b1865fe955e38a828ffc6cb72da6910c64ee03010993cf5bd46ad903a5b72ae2f59854b92fe523d51e470c'
            'a0999164d4031a04ce10db848ea944b2db734f08dcf3554bfb6d651305cde95f852b46e3aea2cc4f1468a0a6c07c06623f0e925d025fdee848f122f412ee951a'
            'cf3fb1c6ff580d697153844b7ce1b4944570aa0f9a1779ee3054ff52243bcdeadff832130b5c663ca48bc6c2ad0c4b0c4e4df2e4e30ce85bac58040770cb9d88'
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
  install -Dm644 wireless-perf.conf "$pkgdir"/usr/lib/modprobe.d/wireless-perf.conf
  install -Dm644 21-disable-connectivity-check.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/21-disable-connectivity-check.conf
  install -Dm644 30-nm-privacy.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/30-nm-privacy.conf
  install -Dm644 60-restrict.conf "$pkgdir"/usr/lib/sysctl.d/60-restrict.conf
  mkdir -p "$pkgdir"/etc/chromium/policies/managed/
  install -Dm644 chromium-brace.json "$pkgdir"/etc/chromium/policies/managed/brace.json
  mkdir -p "$pkgdir"/usr/lib/firefox/browser/defaults/preferences/
  install -Dm644 userjs-*.js "$pkgdir"/usr/lib/firefox/browser/defaults/preferences/
  mkdir -p "$pkgdir"/usr/lib/thunderbird/defaults/preferences/
  install -Dm644 userjs-*.js "$pkgdir"/usr/lib/thunderbird/defaults/preferences/
}
