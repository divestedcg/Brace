# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=20200822
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
	'00-brace-pantheon'
	'00-brace-extra'
	'dconf-profile-user'
	'30-nm-privacy.conf'
	'60-restrict.conf'
	'restic-backup@.service'
	'restic-backup@.timer'
	'blacklist-dma.conf'
	'blacklist-usbnet.conf'
	'brace-supplemental-changes.sh'
	'brace-installer.sh'
	'wireless-perf.conf'
	'chromium-brace.json'
	'firefox-brace.json'
	'brace-env-overrides.sh'
	'brace-helpers.sh'
	'userjs-brace.js'
	'userjs-brace-perf.js'
	'userjs-oakenpants.js'
	'userjs-pyllyukko.js')
sha512sums=('195fa48f4ada2b96ab8bf8583a6b022a7dc64376a5f176b63b9c457c6f726f5c45f2961a45d7f7660d1f39a233bd5cf62ed9238fbb2c0070c308c026e5c156e8'
            'e84bb6b553fee8a48e11768f7ff9db5d4dcf8485d40ce9da206c4154bf8daafe035ffae5438591da206a1e483f8030671d91d65c6fbb471f8de005d1b817301e'
            '7704320c2887b33e7ca02832c6d137aa610921281ed915c23c3ef4999ef35b96840733290b393a017066c3e610e6439bc88da8b1d2d82a945dbe0da3f1b06f31'
            'ecf9a3951359519f157e1bf2a433b4753e2cbb8b2dc921bd0349903ba09360b5938a017cc4dbd859040ae851c6be6ed12903eca2aaee3c7367e47dac6da30e2d'
            '2990c212bc0b3be152d72703fc3c8717ec18423016f798ac1f3156df0e51a5125e264406eb96f4cd776c470c9289ef8ebe071dd06beaf2cc430d472ff0513ec9'
            '1314c63c629f5970820718aacab764457fbd51dd3dafa091b437bb5cf0ebde8448668dfe2ff7f7d659bd1b005cbb41cd0b65e978e48915b04ea43ae772364633'
            '6e585be661b1494f285356b56eafe9a501674e5d8502f8562d2ee7e33715c50a67c5eca178bef69d602d407cdd309a5ef7bbddc6e0a33002ebb7ca6598b79528'
            '52bcf2ddad0702f239410b6892b9edef3e42051d871325d517849fe7057fd7a962d145a8d57d8828a9d602aa6e081c806f86c7ed25de0122fb58fcbdfe5be42c'
            'b6bf26fe2bab314685cbb1d0568675d57bd1ef7dcec09b9d824400d6e83bee28bbf3b9247ce797a2fff6a2a021d40e3fe25b91b52db54bf482d49575f3daa37f'
            '39e44e8c7bf9f173d2f057adcdeeddc9137dc716de9ad8e005d5c2aebad052949e8bfa1db6e299baa3eaab1944f35323a5f71f44cfb636dfc5d9b27510a03bc2'
            'ba57603a85b3e25f8146269cadbb4953b6b3d66a25e251b1478fc85704c884eb56ef8b1cd17a547631d5778ffab37fd212c9cf0eb0525e4c46b9c7418836146a'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            'bfc83fdb5c6f2a3da868aec35b68f47cc9a6100c3b6af242bb3f97c3419c1498c88f62c39dfdd46716ee1198f16ebe87435769630652bd553997b70baa167e65'
            '7c5e9ed36e9a017050d5135c2ac56ce92cdea53e8326471eee7f63e1cf8ae6f8f56e58f5fbd945610ca487920dcd90a560a84fecc532126c45d940aa446bfa72'
            'd60121d7746936387e058287008ba720c7b389c25cb9654527ccc81a2ce2523ce343fc89f61005a6376e814319c959a794ada076addbe2639971ff0bbee001c5'
            'bc2c89fef204a1ad72e5776dfd8aeeda01d0db39873a19cbe393a7b4141f7eb15d30bd73317153232ba1c68f82e5ed992a27eed1e7220784e71a8b7911448e91'
            '24b4f92440316f4515b82396d63e85ed926837a16cb84d90e8fd8111527b55282527ceea1c4745efaa6684d44870c3f000e222047bde14870c363dbcb3dbf4d3'
            'fbd643adfcbaa48f3ddccacdff1cd19ef50571644b79468cf12324feffd5652f22a6e3059ab3b0e8b985a6637294498facd311f07696f4ef95ecfec94c9bb3a3'
            'f0e76695a172adcbcfa0093308894165e45d4ce8834115c3727d5bcddcd3304572a7a208317add97a703fdb4aac7aaefd2444baf5e4cc0cda49fec2d6608cb71'
            '860b4ca6d3db4ffc57fe926f209ad77705e0ee15d99213b1950b128b792ac56cf43cde4733dc287404c67bca05099b14d44cc51915f654a8743756cdbaef1e56'
            'a9912a9b420168fbcf350108c316632091ee0cc108ed5a84ba2aad09dadc887ed1b48079815202dd6ff5775b4229f7909b6adc39b7f58a2171ea0d9492943a25'
            '6cfef4d66da9ac15294170a4efbe2d2561f2abeac27a9d5ad5b94c9af1091d76f85630f335c07d9b41e2b95d6056b9061cfe439f040692f8468c74231bb307d9'
            'b168818030095032e1d7c417c1bd1dcce494751df2f78ed5193c07ad120bac8de4aac876d01446642295c6ef4603ac5cf97c53ca17a95cc6e971ec554f6610c1')
install=brace.install

package() {
  cd "$srcdir"
  install -Dm644 00-brace-gnome "$pkgdir"/etc/dconf/db/local.d/00-brace-gnome
  install -Dm644 00-brace-mate "$pkgdir"/etc/dconf/db/local.d/00-brace-mate
  install -Dm644 00-brace-cinnamon "$pkgdir"/etc/dconf/db/local.d/00-brace-cinnamon
  install -Dm644 00-brace-pantheon "$pkgdir"/etc/dconf/db/local.d/00-brace-pantheon
  install -Dm644 00-brace-extra "$pkgdir"/etc/dconf/db/local.d/00-brace-extra
  install -Dm644 dconf-profile-user "$pkgdir"/etc/dconf/profile/user
  install -Dm755 brace-env-overrides.sh "$pkgdir"/etc/profile.d/brace-env-overrides.sh
  install -Dm755 brace-helpers.sh "$pkgdir"/etc/profile.d/brace-helpers.sh
  install -Dm755 brace-supplemental-changes.sh "$pkgdir"/usr/bin/brace-supplemental-changes
  install -Dm755 brace-installer.sh "$pkgdir"/usr/bin/brace-installer
  install -Dm644 blacklist-dma.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-dma.conf
  install -Dm644 blacklist-usbnet.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-usbnet.conf
  install -Dm644 wireless-perf.conf "$pkgdir"/usr/lib/modprobe.d/wireless-perf.conf
  install -Dm644 30-nm-privacy.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/30-nm-privacy.conf
  install -Dm644 60-restrict.conf "$pkgdir"/usr/lib/sysctl.d/60-restrict.conf
  install -Dm644 restic-backup@.service "$pkgdir"/usr/lib/systemd/user/restic-backup@.service
  install -Dm644 restic-backup@.timer "$pkgdir"/usr/lib/systemd/user/restic-backup@.timer
  mkdir -p "$pkgdir"/etc/chromium/policies/managed/
  install -Dm644 chromium-brace.json "$pkgdir"/etc/chromium/policies/managed/brace.json
  mkdir -p "$pkgdir"/etc/opt/chrome/policies/managed/
  install -Dm644 chromium-brace.json "$pkgdir"/etc/opt/chrome/policies/managed/brace.json
  install -Dm644 firefox-brace.json "$pkgdir"/usr/lib/firefox/distribution/policies.json
  mkdir -p "$pkgdir"/usr/lib/firefox/browser/defaults/preferences/
  install -Dm644 userjs-*.js "$pkgdir"/usr/lib/firefox/browser/defaults/preferences/
  mkdir -p "$pkgdir"/usr/lib/thunderbird/defaults/preferences/
  install -Dm644 userjs-*.js "$pkgdir"/usr/lib/thunderbird/defaults/preferences/
}
