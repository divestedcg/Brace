Name: brace
Version: 1.6
Release: 33
Summary: Increases privacy/security through various configs.
License: GPLv3+
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
- Changes many default settings for GNOME
- Hardens Firefox to prevent tracking, credit @pyllyukko, license MIT
- Adds many aliases for clearing logs
- Blacklists DMA drivers such as Firewire and Thunderbolt
- Blacklists USB ethernet drivers
- Enables MAC address randomization on all interfaces
- Disables network connectivity checking
- Restricts dmesg and ptrace
- Increases performance on select Intel Wi-Fi adapters

%post
dconf update

%postun
dconf update

%install
install -Dm644 00-gnome_defaults %{buildroot}/etc/dconf/db/local.d/00-brace-gnome
install -Dm755 helpers.sh %{buildroot}/etc/profile.d/helpers.sh
install -Dm755 brace-supplemental-changes.sh %{buildroot}/usr/bin/brace-supplemental-changes
install -Dm644 blacklist-dma.conf %{buildroot}/usr/lib/modprobe.d/blacklist-dma.conf
install -Dm644 blacklist-usbnet.conf %{buildroot}/usr/lib/modprobe.d/blacklist-usbnet.conf
install -Dm644 iwlwifi.conf %{buildroot}/usr/lib/modprobe.d/iwlwifi.conf
install -Dm644 21-disable-connectivity-check.conf %{buildroot}/usr/lib/NetworkManager/conf.d/21-disable-connectivity-check.conf
install -Dm644 30-mac-randomization.conf %{buildroot}/usr/lib/NetworkManager/conf.d/30-mac-randomization.conf
install -Dm644 60-restrict.conf %{buildroot}/usr/lib/sysctl.d/60-restrict.conf
install -Dm644 user.js %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js

#Mark preferences properly
sed -i 's/user_pref(/pref(/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;

#Disable some aggressive preferences
sed -i 's/pref("dom.serviceWorkers.enabled"/\/\/BRACE-DISABLED: pref("dom.serviceWorkers.enabled"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("dom.workers.enabled"/\/\/BRACE-DISABLED: pref("dom.workers.enabled"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("dom.allow_cut_copy"/\/\/BRACE-DISABLED: pref("dom.allow_cut_copy"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("keyword.enabled"/\/\/BRACE-DISABLED: pref("keyword.enabled"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("svg.disabled"/\/\/BRACE-DISABLED: pref("svg.disabled"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("browser.display.use_document_fonts"/\/\/BRACE-DISABLED: pref("browser.display.use_document_fonts"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("pdfjs.disabled"/\/\/BRACE-DISABLED: pref("pdfjs.disabled"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("app.update.enabled"/\/\/BRACE-DISABLED: pref("app.update.enabled"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("browser.search.suggest.enabled"/\/\/BRACE-DISABLED: pref("browser.search.suggest.enabled"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("browser.urlbar.suggest.history"/\/\/BRACE-DISABLED: pref("browser.urlbar.suggest.history"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("browser.privatebrowsing.autostart"/\/\/BRACE-DISABLED: pref("browser.privatebrowsing.autostart"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("privacy.sanitize.sanitizeOnShutdown"/\/\/BRACE-DISABLED: pref("privacy.sanitize.sanitizeOnShutdown"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("places.history.enabled"/\/\/BRACE-DISABLED: pref("places.history.enabled"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("browser.cache.disk.enable"/\/\/BRACE-DISABLED: pref("browser.cache.disk.enable"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("browser.cache.disk_cache_ssl"/\/\/BRACE-DISABLED: pref("browser.cache.disk_cache_ssl"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("browser.download.manager.retention"/\/\/BRACE-DISABLED: pref("browser.download.manager.retention"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("signon.rememberSignons"/\/\/BRACE-DISABLED: pref("signon.rememberSignons"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("network.cookie.lifetimePolicy"/\/\/BRACE-DISABLED: pref("network.cookie.lifetimePolicy"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("browser.urlbar.autocomplete.enabled"/\/\/BRACE-DISABLED: pref("browser.urlbar.autocomplete.enabled"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("security.OCSP.enabled"/\/\/BRACE-DISABLED: pref("security.OCSP.enabled"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
sed -i 's/pref("security.OCSP.required"/\/\/BRACE-DISABLED: pref("security.OCSP.required"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js

#Fix https://github.com/pyllyukko/user.js/pull/347
sed -i 's/pref("browser.cache.offline.enable"/\/\/DISABLED: pref("browser.cache.offline.enable"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js

#Fix https://github.com/pyllyukko/user.js/pull/355
sed -i 's/en-us, en/en-US, en/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js

#Add our extras
echo -e "\n" >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo "//START OF BRACE EXTRAS" >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
##Look
echo 'pref("browser.tabs.drawInTitlebar", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("widget.allow-client-side-decoration", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
##Performance
echo 'pref("general.smoothScroll", false);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("layers.acceleration.force-enabled", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("media.hardware-video-decoding.force-enabled", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("browser.tabs.remote.autostart", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("browser.tabs.remote.force-enabled", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("layers.omtp.enabled", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
##Privacy
echo 'pref("privacy.firstparty.isolate", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("privacy.firstparty.isolate.restrict_opener_access", false);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("extensions.screenshots.disabled", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("media.eme.enabled", false);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("general.useragent.updates.enabled", false);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("browser.snippets.updateUrl", "");' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("browser.snippets.enabled", false);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("browser.snippets.syncPromo.enabled", false);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("browser.snippets.firstrunHomepage.enabled", false);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("dom.push.serverURL", "");' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("dom.push.enabled", false);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("plugin.expose_full_path", false);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("browser.link.open_newwindow_restriction", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("reader.parse-on-load.enabled", false);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("browser.reader.detectedFirstArticle", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
##Security
echo 'pref("javascript.options.shared_memory", false);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo "//END OF BRACE EXTRAS" >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;

%files
/etc/dconf/db/local.d/00-brace-gnome
/etc/profile.d/helpers.sh
/usr/bin/brace-supplemental-changes
/usr/lib/modprobe.d/blacklist-dma.conf
/usr/lib/modprobe.d/blacklist-usbnet.conf
/usr/lib/modprobe.d/iwlwifi.conf
/usr/lib/NetworkManager/conf.d/21-disable-connectivity-check.conf
/usr/lib/NetworkManager/conf.d/30-mac-randomization.conf
/usr/lib/sysctl.d/60-restrict.conf
/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
