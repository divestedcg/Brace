# Maintainer: Tad D <tad@spotco.us>
pkgname=brace
pkgver=1.0
pkgrel=6
pkgdesc="Increases security through various configs"
arch=('any')
license=('custom')
conflicts=('dnu')
optdepends=('arch-audit: check for insecure packages'
	'extirpater: erase drive freespace'
	'firejail: sandbox programs'
	'linux-hardened: harden against exploits'
	'rkhunter: scan for rootkits'
	'scfw: seal your ports')
source=('60-restrict.conf'
	'blacklist-dma.conf'
	'blacklist-usbnet.conf'
	'dnu.service'
	'dnu-grsec.service'
	'umask.sh')
sha512sums=('6cb5351444dc9cb12883a44f3895a211388eccc2f0ad00aad5c29add7e721cab846d9b6d048d4bb1a70cc840a53a56c5e946ac72ef0a9bc673fa7131283c5680'
            'fcee1964b26f4309f20c8917a71d448e26f0f2c340ccea0a67f99d704dd009249d09aa215bd2424e234bc9b7927e4679043c2dad78f3fe8e8d744b07485ae655'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            '2bb7c4306b94687583caf5db2a8c384ffeeedcbaba72acc96a686e91a49c48e7b73a34e2dba74f8532d59ee250560fc6bf819e1308e37d9028d2138297d18b94'
            '50fd868b19a8897f770c0ffb16bea46c040cf8c965eb20f226b544907da169320c256e571a4e71072973f41c9fb6debff03208cba57256dc9f271906f63dfb4a'
            'e81b8fad493ee9dc66b1b0e728195b483a4da8edbf8d19771d0b86a2b1883283c7a58ebee97c8daf255355103f47b8d97645b1c5dac6947ca01efac0bdd4a6da')

package() {
  cd "$srcdir"
  install -Dm755 umask.sh "$pkgdir"/etc/profile.d/umask.sh
  install -Dm644 blacklist-dma.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-dma.conf
  install -Dm644 blacklist-usbnet.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-usbnet.conf
  install -Dm644 60-restrict.conf "$pkgdir"/usr/lib/sysctl.d/60-restrict.conf
  install -Dm644 dnu.service "$pkgdir"/usr/lib/systemd/system/dnu.service
  install -Dm644 dnu-grsec.service "$pkgdir"/usr/lib/systemd/system/dnu-grsec.service
}
