# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=20200522
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
sha512sums=('192168de8f5e54ddfae3d08e6d26f15f43d050b547c53dabac7a557812968b5b630b09a6bf510d99575bd119d4d1470b06f9fb48eee83748043b9dc273a9ba89'
            'e84bb6b553fee8a48e11768f7ff9db5d4dcf8485d40ce9da206c4154bf8daafe035ffae5438591da206a1e483f8030671d91d65c6fbb471f8de005d1b817301e'
            '7704320c2887b33e7ca02832c6d137aa610921281ed915c23c3ef4999ef35b96840733290b393a017066c3e610e6439bc88da8b1d2d82a945dbe0da3f1b06f31'
            'ecf9a3951359519f157e1bf2a433b4753e2cbb8b2dc921bd0349903ba09360b5938a017cc4dbd859040ae851c6be6ed12903eca2aaee3c7367e47dac6da30e2d'
            '3625e53fee7a1bf755a9de3b5f702e75ba67bb4160c6fd8b36f6cf28a9e939e8db982151c507f76b7955391c5bb93654695a2da39724e88309fe350242689d90'
            '1314c63c629f5970820718aacab764457fbd51dd3dafa091b437bb5cf0ebde8448668dfe2ff7f7d659bd1b005cbb41cd0b65e978e48915b04ea43ae772364633'
            '6e585be661b1494f285356b56eafe9a501674e5d8502f8562d2ee7e33715c50a67c5eca178bef69d602d407cdd309a5ef7bbddc6e0a33002ebb7ca6598b79528'
            '95956862013e563e8916b87020b7c60d175fa262d69da423f2e6e35883371dc408f0dd0298bc33eb2d34fc7ba7b56de1c81ad577110bcfd8ff92ca2c68072688'
            'b6bf26fe2bab314685cbb1d0568675d57bd1ef7dcec09b9d824400d6e83bee28bbf3b9247ce797a2fff6a2a021d40e3fe25b91b52db54bf482d49575f3daa37f'
            'dc447b539ea4ab47d12ce989ae717091282fd92839d795707934f9cbd87540f32cff29b47ffea9643d5ad2aac36adccc4d01daea135215d3286ee4df77f9bdfc'
            'ba57603a85b3e25f8146269cadbb4953b6b3d66a25e251b1478fc85704c884eb56ef8b1cd17a547631d5778ffab37fd212c9cf0eb0525e4c46b9c7418836146a'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            '2eb73e0cfaa7fc9d3aac66dfe5f231cda7cf7555bb3788a1a4e6483a3912ae6f5d11000422fa6d27d97e8d9f45bb1faba5ec000a99e20746b3ccbbe9e7fe6a02'
            'd4c2daec57d4e239f96509249327d847d94a2d511f15be64acdc546e3665dacdcb15a4981068ef4a211964ac8a586edb5c0b00bf925917381650a157817f034f'
            'd60121d7746936387e058287008ba720c7b389c25cb9654527ccc81a2ce2523ce343fc89f61005a6376e814319c959a794ada076addbe2639971ff0bbee001c5'
            'e1b671756c86f6b436cc714126636481641e23b39e63a079f1bc80e61061f32ea44bb33482c7f88d97f102eb47b06d053ea4a1d5777a77f56e46a6a23502f345'
            '90ff0d018430463e880f5a7c73ca32e77722196f43d8f7a6cd78fcd377f7cfd9471fc41a5196c04c1a83f3fd55aade92a6eab3f43bcfe5478a4285dc648e143e'
            '9a5fc92642f35a8b3427dab89ac3305bfbbffb5c52d90f9e384385fd9513c51e7d772baee39d973f6a708993e511ce0b4588428aafc575df290388f8a697c56d'
            'fbe25dad82cce4711c273805339410c666d3f782ad0ceaa2545090f912d3b0ee8337de91c8772bb5feae63131ee8f732c8c12d351c515e39baa61af399b449c5'
            '3d0d8322fb45c58259e9680ee10155f2f89de8db75d7caf8ba09c563f581b0fc9f271b7847dfae2920168475a454dd9689f0eef4a2638bf0905ec2175453b465'
            'a9912a9b420168fbcf350108c316632091ee0cc108ed5a84ba2aad09dadc887ed1b48079815202dd6ff5775b4229f7909b6adc39b7f58a2171ea0d9492943a25'
            '275cf79cd56adfc8bb0c2bb2d87770f8f06c42c4d3eb41f0ea97d59ab8c58a957be1395f00509af58abfb71086f7d6faaf29a74eec6422199cc99aab945d1a98'
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
