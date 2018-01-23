Name: brace
Version: 1.2
Release: 15
Summary: Increases privacy/security through various configs.
License: GPLv3+
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
Firefox hardening credit: @pyllyukko

%install
install -Dm755 umask.sh %{buildroot}/etc/profile.d/umask.sh
install -Dm644 blacklist-dma.conf %{buildroot}/usr/lib/modprobe.d/blacklist-dma.conf
install -Dm644 blacklist-usbnet.conf %{buildroot}/usr/lib/modprobe.d/blacklist-usbnet.conf
install -Dm644 60-restrict.conf %{buildroot}/usr/lib/sysctl.d/60-restrict.conf
install -Dm644 dnu.service %{buildroot}/usr/lib/systemd/system/dnu.service
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

#Enable some preferences
sed -i 's/\/\/pref("security.ssl.require_safe_negotiation"/pref("security.ssl.require_safe_negotiation"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js #XXX: Breaks some sites

#Fix https://github.com/pyllyukko/%{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js/issues/347
sed -i 's/pref("browser.cache.offline.enable"/\/\/DISABLED: pref("browser.cache.offline.enable"/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js

#Fix https://github.com/pyllyukko/%{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js/pull/355
sed -i 's/en-us, en/en-US, en/' %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js

#Add our extras
echo -e "\n" >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo "//START OF BRACE EXTRAS" >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
##Performance
echo 'pref("general.smoothScroll", false);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("layers.acceleration.force-enabled", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("media.hardware-video-decoding.force-enabled", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("browser.tabs.remote.autostart", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
echo 'pref("browser.tabs.remote.force-enabled", true);' >> %{buildroot}/usr/lib64/firefox/browser/defaults/preferences/all-brace.js;
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
/etc/profile.d/umask.sh
/usr/lib/modprobe.d/blacklist-dma.conf
/usr/lib/modprobe.d/blacklist-usbnet.conf
/usr/lib/sysctl.d/60-restrict.conf
/usr/lib/systemd/system/dnu.service
/usr/lib64/firefox/browser/defaults/preferences/all-brace.js
