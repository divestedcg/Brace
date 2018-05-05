# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=1.6
pkgrel=26
pkgdesc="Increases privacy/security through various configs. Firefox hardening credit: @pyllyukko"
arch=('any')
license=('GPLv3')
conflicts=('dnu' 'brace-ff')
optdepends=('arch-audit: check for insecure packages'
	'extirpater: erase drive freespace'
	'firejail: sandbox programs'
	'linux-hardened: harden against exploits'
	'rkhunter: scan for rootkits'
	'scfw: seal your ports'
	'firefox: browser'
	'firefox-nightly: browser')
source=('00-gnome_defaults'
	'21-disable-connectivity-check.conf'
	'30-mac-randomization.conf'
	'60-restrict.conf'
	'blacklist-dma.conf'
	'blacklist-usbnet.conf'
	'brace-supplemental-changes.sh'
	'iwlwifi.conf'
	'dnu.service'
	'helpers.sh'
	'umask.sh'
	'https://raw.githubusercontent.com/pyllyukko/user.js/master/user.js')
sha512sums=('6ed87a19868847b99a3c786fcb08307adee4e3ed511aa52dae3ed70718f804844f48db8fdfde268cbf26c5233ae65830fedd219c4fa88cf15385e35bc32285db'
            '8ec47524685a59ed1ca45d5ba5334248cc505c07d71f1340d77a20e96e647b32c7a10cac1f1a2e32b0477a53c7ce14c57e839057b2b4fe7191932001c5679364'
            'cd03db723b789e9084cc2474edb3bf3f878cc5a751b437f69dd6f06a8015070e7c3f6750b581c15524e869f9fd8dd7db7eff9dad0650930e04387f5a36b4510e'
            'a6aceec23666bc7788c43d649e89ed5da0eaf637671e456d12a6de593fff459601a7d4a2bd1ae7707260faea80cfba382f8a785bfecfffaec51b6e1be259ac2f'
            'fcee1964b26f4309f20c8917a71d448e26f0f2c340ccea0a67f99d704dd009249d09aa215bd2424e234bc9b7927e4679043c2dad78f3fe8e8d744b07485ae655'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            '1d51fffb4c6d8a951f19645b644cd4b693536b4fd1acacada2ae6fd6c9967053960d3ec71f257b432c48b8a1e7993fe502ee0f53a05c03b388a7617b30689eb7'
            'c07d4f5d591a07db530deb77065e488e788fd964c081c2859cee07cb0820c69ab8236b8713425c77b47a75435907643cd9a021719f7389c09b20787df1b0860b'
            '2bb7c4306b94687583caf5db2a8c384ffeeedcbaba72acc96a686e91a49c48e7b73a34e2dba74f8532d59ee250560fc6bf819e1308e37d9028d2138297d18b94'
            '68f29b8c373a06ff4e8ed842717e7d7497d3f99f5ac68c6314534652d0080c64934e780c7c3ec324bcee84a1b905fe5db813589bcf9b37937a11810570a6611f'
            'e81b8fad493ee9dc66b1b0e728195b483a4da8edbf8d19771d0b86a2b1883283c7a58ebee97c8daf255355103f47b8d97645b1c5dac6947ca01efac0bdd4a6da'
            'ec2d90935ae3b4baca62ca87da840a183f3e3314082c5e0df1cf7a9fd723a1250a49c661143554ba5bb26a5bd9817e1b6b237dceabed5b90e31564664c5a9dc6')
install=brace.install

build() {
	#Mark preferences properly
	sed -i 's/user_pref(/pref(/' user.js;

	#Disable some aggressive preferences
	sed -i 's/pref("dom.serviceWorkers.enabled"/\/\/BRACE-DISABLED: pref("dom.serviceWorkers.enabled"/' user.js
	sed -i 's/pref("dom.workers.enabled"/\/\/BRACE-DISABLED: pref("dom.workers.enabled"/' user.js
	sed -i 's/pref("dom.allow_cut_copy"/\/\/BRACE-DISABLED: pref("dom.allow_cut_copy"/' user.js
	sed -i 's/pref("keyword.enabled"/\/\/BRACE-DISABLED: pref("keyword.enabled"/' user.js
	sed -i 's/pref("svg.disabled"/\/\/BRACE-DISABLED: pref("svg.disabled"/' user.js
	sed -i 's/pref("browser.display.use_document_fonts"/\/\/BRACE-DISABLED: pref("browser.display.use_document_fonts"/' user.js
	sed -i 's/pref("pdfjs.disabled"/\/\/BRACE-DISABLED: pref("pdfjs.disabled"/' user.js
	sed -i 's/pref("app.update.enabled"/\/\/BRACE-DISABLED: pref("app.update.enabled"/' user.js
	sed -i 's/pref("browser.search.suggest.enabled"/\/\/BRACE-DISABLED: pref("browser.search.suggest.enabled"/' user.js
	sed -i 's/pref("browser.urlbar.suggest.history"/\/\/BRACE-DISABLED: pref("browser.urlbar.suggest.history"/' user.js
	sed -i 's/pref("browser.privatebrowsing.autostart"/\/\/BRACE-DISABLED: pref("browser.privatebrowsing.autostart"/' user.js
	sed -i 's/pref("privacy.sanitize.sanitizeOnShutdown"/\/\/BRACE-DISABLED: pref("privacy.sanitize.sanitizeOnShutdown"/' user.js
	sed -i 's/pref("places.history.enabled"/\/\/BRACE-DISABLED: pref("places.history.enabled"/' user.js
	sed -i 's/pref("browser.cache.disk.enable"/\/\/BRACE-DISABLED: pref("browser.cache.disk.enable"/' user.js
	sed -i 's/pref("browser.cache.disk_cache_ssl"/\/\/BRACE-DISABLED: pref("browser.cache.disk_cache_ssl"/' user.js
	sed -i 's/pref("browser.download.manager.retention"/\/\/BRACE-DISABLED: pref("browser.download.manager.retention"/' user.js
	sed -i 's/pref("signon.rememberSignons"/\/\/BRACE-DISABLED: pref("signon.rememberSignons"/' user.js
	sed -i 's/pref("network.cookie.lifetimePolicy"/\/\/BRACE-DISABLED: pref("network.cookie.lifetimePolicy"/' user.js
	sed -i 's/pref("browser.urlbar.autocomplete.enabled"/\/\/BRACE-DISABLED: pref("browser.urlbar.autocomplete.enabled"/' user.js
	sed -i 's/pref("security.OCSP.enabled"/\/\/BRACE-DISABLED: pref("security.OCSP.enabled"/' user.js
	sed -i 's/pref("security.OCSP.required"/\/\/BRACE-DISABLED: pref("security.OCSP.required"/' user.js

	#Fix https://github.com/pyllyukko/user.js/issues/347
	sed -i 's/pref("browser.cache.offline.enable"/\/\/DISABLED: pref("browser.cache.offline.enable"/' user.js

	#Fix https://github.com/pyllyukko/user.js/pull/355
	sed -i 's/en-us, en/en-US/' user.js

	#Add our extras
	echo -e "\n" >> user.js;
	echo "//START OF BRACE EXTRAS" >> user.js;
	##Look
	echo 'pref("browser.tabs.drawInTitlebar", true);' >> user.js;
	echo 'pref("widget.allow-client-side-decoration", true);' >> user.js;
	##Performance
	echo 'pref("general.smoothScroll", false);' >> user.js;
	echo 'pref("layers.acceleration.force-enabled", true);' >> user.js;
	echo 'pref("media.hardware-video-decoding.force-enabled", true);' >> user.js;
	echo 'pref("browser.tabs.remote.autostart", true);' >> user.js;
	echo 'pref("browser.tabs.remote.force-enabled", true);' >> user.js;
	echo 'pref("layers.omtp.enabled", true);' >> user.js;
	##Privacy
	echo 'pref("privacy.firstparty.isolate", true);' >> user.js;
	echo 'pref("privacy.firstparty.isolate.restrict_opener_access", false);' >> user.js;
	echo 'pref("extensions.screenshots.disabled", true);' >> user.js;
	echo 'pref("media.eme.enabled", false);' >> user.js;
	echo 'pref("general.useragent.updates.enabled", false);' >> user.js;
	echo 'pref("browser.snippets.updateUrl", "");' >> user.js;
	echo 'pref("browser.snippets.enabled", false);' >> user.js;
	echo 'pref("browser.snippets.syncPromo.enabled", false);' >> user.js;
	echo 'pref("browser.snippets.firstrunHomepage.enabled", false);' >> user.js;
	echo 'pref("dom.push.serverURL", "");' >> user.js;
	echo 'pref("dom.push.enabled", false);' >> user.js;
	echo 'pref("plugin.expose_full_path", false);' >> user.js;
	echo 'pref("browser.link.open_newwindow_restriction", true);' >> user.js;
	echo 'pref("reader.parse-on-load.enabled", false);' >> user.js;
	echo 'pref("browser.reader.detectedFirstArticle", true);' >> user.js;
	##Security
	echo 'pref("javascript.options.shared_memory", false);' >> user.js;
	echo "//END OF BRACE EXTRAS" >> user.js;
}

package() {
  cd "$srcdir"
  install -Dm755 brace-supplemental-changes.sh "$pkgdir"/bin/brace-supplemental-changes
  install -Dm644 00-gnome_defaults "$pkgdir"/etc/dconf/db/local.d/00-brace-gnome
  install -Dm755 helpers.sh "$pkgdir"/etc/profile.d/helpers.sh
  install -Dm755 umask.sh "$pkgdir"/etc/profile.d/umask.sh
  install -Dm644 blacklist-dma.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-dma.conf
  install -Dm644 blacklist-usbnet.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-usbnet.conf
  install -Dm644 iwlwifi.conf "$pkgdir"/usr/lib/modprobe.d/iwlwifi.conf
  install -Dm644 21-disable-connectivity-check.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/21-disable-connectivity-check.conf
  install -Dm644 30-mac-randomization.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/30-mac-randomization.conf
  install -Dm644 60-restrict.conf "$pkgdir"/usr/lib/sysctl.d/60-restrict.conf
  install -Dm644 dnu.service "$pkgdir"/usr/lib/systemd/system/dnu.service
  install -Dm644 user.js "$pkgdir"/usr/lib/firefox/browser/defaults/preferences/all-brace.js
}
