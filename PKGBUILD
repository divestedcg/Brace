# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=20201211
pkgrel=1
pkgdesc="Increases privacy/security through various configs."
arch=('any')
license=('GPL3')
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
	'userjs-arkenfox.js'
	'userjs-pyllyukko.js')
sha512sums=('ff80dd8c88090845b6a3456fcf03190c80709d4c028e74d8bef9b04fb2ae2b3e9747c240fe980cf310862e222d02012b64cecef0e2c7aa6aeced42959467f945'
            '01c27019944d377ab8dc4e39986ffff1e03f49ed3e1958902836c81aa6e117ac1b30da8edaaa6397f7a24f3fb83b6f1a69641b89a33861739fb99885da032981'
            '7704320c2887b33e7ca02832c6d137aa610921281ed915c23c3ef4999ef35b96840733290b393a017066c3e610e6439bc88da8b1d2d82a945dbe0da3f1b06f31'
            'ecf9a3951359519f157e1bf2a433b4753e2cbb8b2dc921bd0349903ba09360b5938a017cc4dbd859040ae851c6be6ed12903eca2aaee3c7367e47dac6da30e2d'
            '2990c212bc0b3be152d72703fc3c8717ec18423016f798ac1f3156df0e51a5125e264406eb96f4cd776c470c9289ef8ebe071dd06beaf2cc430d472ff0513ec9'
            '1314c63c629f5970820718aacab764457fbd51dd3dafa091b437bb5cf0ebde8448668dfe2ff7f7d659bd1b005cbb41cd0b65e978e48915b04ea43ae772364633'
            '6e585be661b1494f285356b56eafe9a501674e5d8502f8562d2ee7e33715c50a67c5eca178bef69d602d407cdd309a5ef7bbddc6e0a33002ebb7ca6598b79528'
            'c13b4dc3af72fd33972029491927bf42c50faa4677d1f4ad268e12a2196f5c7a49122083a767709ee1a70472a5ee90fbfc876d97f876982e7a429674575e1abd'
            'b6bf26fe2bab314685cbb1d0568675d57bd1ef7dcec09b9d824400d6e83bee28bbf3b9247ce797a2fff6a2a021d40e3fe25b91b52db54bf482d49575f3daa37f'
            '39e44e8c7bf9f173d2f057adcdeeddc9137dc716de9ad8e005d5c2aebad052949e8bfa1db6e299baa3eaab1944f35323a5f71f44cfb636dfc5d9b27510a03bc2'
            'ba57603a85b3e25f8146269cadbb4953b6b3d66a25e251b1478fc85704c884eb56ef8b1cd17a547631d5778ffab37fd212c9cf0eb0525e4c46b9c7418836146a'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            'dcce61eaeeca07e4dc5fa18521b226d0744dae2961fcc64173707e02dff09630ec3e140796172e28a45a228f01a8f65c6fa129432dad464302e6f6514545f3a3'
            '4cd8ff292a70cf0063a0396ffa641f2f3309878400d509968ef0e5657ebd9514f5c428952cf65201aa68a010aa838bc1ed56941d28942497e2015524a17fb2f7'
            'd60121d7746936387e058287008ba720c7b389c25cb9654527ccc81a2ce2523ce343fc89f61005a6376e814319c959a794ada076addbe2639971ff0bbee001c5'
            'd41501a809efb33bb3225667468cad44025509350f30614bcc4693bf53329d86f681ad6b44e78cc4a98b21ecd2b97a39511587d0c7fdd21d38fb70cd75d66a66'
            '144c8f01c4ddb2c9edc92ee478042201e99d658b7e9c6221a41a47bc55ee8586b61eff1b6bbb809eb9e7148e6fee58d19ae66682eb7c67d2fddf65d29fb635c8'
            '9bc0c3cfa17c81416720dd8783d7c075af6cb5415c4d67d67f8fc0f4c5d44093c664f265d452e969ef853dd44a3e4bab5bee0d53c84a5870d4845bb1aa5b5f6f'
            '10b7aa852c3849a5baf18e43b1c917242ed652e23acaa8d68d0e380fae687ab1984c10a106f15a9d9eb71f65b015a7c2c98e1b8a2758fbdb1efb748efa17accb'
            'ae642743d3ed813def47300e8335d97e8b405526e5cf4922195b72a02d01eaa2498f9fa1f9b42e5b14cf42fdad382164e9a8337dd10616c76d32dd184d41db17'
            '45084a2eadc8c20c055f34ac2c217b77515486f5e9f6efbfadea8c3507983669b1467f8069a5b12388264a5906decb4e8f8b790cf80075235112fd67860f1e14'
            '99b0b9fd9fa1fe4cce5fe94c5fd78bb8475c0970976f9d24713d4e9cb68d783210becb24b0c4f3199b41a172792a265741f442602219bbc39d510919988e1274'
            'cfcb8071d6394df912dd6f64fd675410c7dd89cdaacb832a042d6d78d3cdcafef76131b73b466dcc458292777441a0148da47ef792bd7cb586031db232427976')
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
