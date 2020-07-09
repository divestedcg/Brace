# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=20200709
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
	'userjs-ghacks.js'
	'userjs-pyllyukko.js')
sha512sums=('0aa7f7b8ec9b1b45ccea5fa359516588631ec6ff47f36744630a940d57c870273b7944ee09e7faccf1925fbdacb635965cf45ce83491474f7a1a44871367ae3d'
            'e84bb6b553fee8a48e11768f7ff9db5d4dcf8485d40ce9da206c4154bf8daafe035ffae5438591da206a1e483f8030671d91d65c6fbb471f8de005d1b817301e'
            '7704320c2887b33e7ca02832c6d137aa610921281ed915c23c3ef4999ef35b96840733290b393a017066c3e610e6439bc88da8b1d2d82a945dbe0da3f1b06f31'
            'ecf9a3951359519f157e1bf2a433b4753e2cbb8b2dc921bd0349903ba09360b5938a017cc4dbd859040ae851c6be6ed12903eca2aaee3c7367e47dac6da30e2d'
            '2990c212bc0b3be152d72703fc3c8717ec18423016f798ac1f3156df0e51a5125e264406eb96f4cd776c470c9289ef8ebe071dd06beaf2cc430d472ff0513ec9'
            '1314c63c629f5970820718aacab764457fbd51dd3dafa091b437bb5cf0ebde8448668dfe2ff7f7d659bd1b005cbb41cd0b65e978e48915b04ea43ae772364633'
            '6e585be661b1494f285356b56eafe9a501674e5d8502f8562d2ee7e33715c50a67c5eca178bef69d602d407cdd309a5ef7bbddc6e0a33002ebb7ca6598b79528'
            '52bcf2ddad0702f239410b6892b9edef3e42051d871325d517849fe7057fd7a962d145a8d57d8828a9d602aa6e081c806f86c7ed25de0122fb58fcbdfe5be42c'
            'b6bf26fe2bab314685cbb1d0568675d57bd1ef7dcec09b9d824400d6e83bee28bbf3b9247ce797a2fff6a2a021d40e3fe25b91b52db54bf482d49575f3daa37f'
            'dc447b539ea4ab47d12ce989ae717091282fd92839d795707934f9cbd87540f32cff29b47ffea9643d5ad2aac36adccc4d01daea135215d3286ee4df77f9bdfc'
            'ba57603a85b3e25f8146269cadbb4953b6b3d66a25e251b1478fc85704c884eb56ef8b1cd17a547631d5778ffab37fd212c9cf0eb0525e4c46b9c7418836146a'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            '69b15bc7317a27a8cb9d4631d27d475bb45775fe01c2180a108c402f3900756e3fead0d4c884330b1643efc8aa75d16fe1c4d763d4bc16d1bc71df82d8def116'
            '4c647c3a4cea4ed464cde136bf784004ebca328dafe7f181c49d176a02028531fbfeb13e108c29f5f165021f6cf039775f1ac2e9dd86aa90ef138ed577df55cf'
            'd60121d7746936387e058287008ba720c7b389c25cb9654527ccc81a2ce2523ce343fc89f61005a6376e814319c959a794ada076addbe2639971ff0bbee001c5'
            '7807ecf90c804fa7558ac2459479ef85e87a8b321e1699dfdac37cdfd3c6e486a6c5c22e040d49f9102db024cb6bccfc57189bc636c602e780742718a7f7f329'
            '503b2e73e826a26099a110f2641c88984a9ec9fe3c1e802ff2f5051688725a73d04045a7e4d275b1d775be1bb681e4ab2d45af067bebd38dad299ae2cbf9a4d3'
            'fbd643adfcbaa48f3ddccacdff1cd19ef50571644b79468cf12324feffd5652f22a6e3059ab3b0e8b985a6637294498facd311f07696f4ef95ecfec94c9bb3a3'
            'f0e76695a172adcbcfa0093308894165e45d4ce8834115c3727d5bcddcd3304572a7a208317add97a703fdb4aac7aaefd2444baf5e4cc0cda49fec2d6608cb71'
            'f9967e479fb1b8c5068f4acf81fca5148163420100b9dae632ce6b7ce022e25352155864deacc4594d893c886504b6de0059f6b2926002a8048923b611ed79a8'
            'a9912a9b420168fbcf350108c316632091ee0cc108ed5a84ba2aad09dadc887ed1b48079815202dd6ff5775b4229f7909b6adc39b7f58a2171ea0d9492943a25'
            '889a63fccd385707fce2e660091bb2c94af12f3236354e8755630894defc60ff31feb4c002b4ee6c8298f53cc28d031d58c855827069c1cb5a54932ba69bf988'
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
