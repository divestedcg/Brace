userjs=$1;

#Mark preferences properly
sed -i 's/user_pref(/pref(/' $userjs;

#Disable some aggressive preferences
sed -i 's/pref("dom.serviceWorkers.enabled"/\/\/BRACE-DISABLED: pref("dom.serviceWorkers.enabled"/' $userjs;
sed -i 's/pref("dom.workers.enabled"/\/\/BRACE-DISABLED: pref("dom.workers.enabled"/' $userjs;
sed -i 's/pref("dom.allow_cut_copy"/\/\/BRACE-DISABLED: pref("dom.allow_cut_copy"/' $userjs;
sed -i 's/pref("keyword.enabled"/\/\/BRACE-DISABLED: pref("keyword.enabled"/' $userjs;
sed -i 's/pref("svg.disabled"/\/\/BRACE-DISABLED: pref("svg.disabled"/' $userjs;
sed -i 's/pref("browser.display.use_document_fonts"/\/\/BRACE-DISABLED: pref("browser.display.use_document_fonts"/' $userjs;
sed -i 's/pref("pdfjs.disabled"/\/\/BRACE-DISABLED: pref("pdfjs.disabled"/' $userjs;
sed -i 's/pref("app.update.enabled"/\/\/BRACE-DISABLED: pref("app.update.enabled"/' $userjs;
sed -i 's/pref("browser.search.suggest.enabled"/\/\/BRACE-DISABLED: pref("browser.search.suggest.enabled"/' $userjs;
sed -i 's/pref("browser.urlbar.suggest.history"/\/\/BRACE-DISABLED: pref("browser.urlbar.suggest.history"/' $userjs;
sed -i 's/pref("browser.privatebrowsing.autostart"/\/\/BRACE-DISABLED: pref("browser.privatebrowsing.autostart"/' $userjs;
sed -i 's/pref("privacy.sanitize.sanitizeOnShutdown"/\/\/BRACE-DISABLED: pref("privacy.sanitize.sanitizeOnShutdown"/' $userjs;
sed -i 's/pref("places.history.enabled"/\/\/BRACE-DISABLED: pref("places.history.enabled"/' $userjs;
sed -i 's/pref("browser.cache.disk.enable"/\/\/BRACE-DISABLED: pref("browser.cache.disk.enable"/' $userjs;
sed -i 's/pref("browser.cache.disk_cache_ssl"/\/\/BRACE-DISABLED: pref("browser.cache.disk_cache_ssl"/' $userjs;
sed -i 's/pref("browser.download.manager.retention"/\/\/BRACE-DISABLED: pref("browser.download.manager.retention"/' $userjs;
sed -i 's/pref("signon.rememberSignons"/\/\/BRACE-DISABLED: pref("signon.rememberSignons"/' $userjs;
sed -i 's/pref("network.cookie.lifetimePolicy"/\/\/BRACE-DISABLED: pref("network.cookie.lifetimePolicy"/' $userjs;
sed -i 's/pref("browser.urlbar.autocomplete.enabled"/\/\/BRACE-DISABLED: pref("browser.urlbar.autocomplete.enabled"/' $userjs;
sed -i 's/pref("security.OCSP.enabled"/\/\/BRACE-DISABLED: pref("security.OCSP.enabled"/' $userjs;
sed -i 's/pref("security.OCSP.required"/\/\/BRACE-DISABLED: pref("security.OCSP.required"/' $userjs;

#Fix https://github.com/pyllyukko/$userjs/issues/347
sed -i 's/pref("browser.cache.offline.enable"/\/\/DISABLED: pref("browser.cache.offline.enable"/' $userjs;

#Fix https://github.com/pyllyukko/$userjs/pull/355
sed -i 's/en-US, en/data:text\/plain,intl.accept_languages=en-US, en/' $userjs;

#Add our extras
echo -e "\n" >> $userjs;
echo "//START OF BRACE EXTRAS" >> $userjs;
##Look
echo 'pref("browser.tabs.drawInTitlebar", true);' >> $userjs;
echo 'pref("widget.allow-client-side-decoration", true);' >> $userjs;
##Performance
echo 'pref("general.smoothScroll", false);' >> $userjs;
echo 'pref("layers.acceleration.force-enabled", true);' >> $userjs;
echo 'pref("media.hardware-video-decoding.force-enabled", true);' >> $userjs;
echo 'pref("browser.tabs.remote.autostart", true);' >> $userjs;
echo 'pref("browser.tabs.remote.force-enabled", true);' >> $userjs;
echo 'pref("layers.omtp.enabled", true);' >> $userjs;
##Privacy
echo 'pref("privacy.firstparty.isolate", true);' >> $userjs;
echo 'pref("privacy.firstparty.isolate.restrict_opener_access", false);' >> $userjs;
echo 'pref("extensions.screenshots.disabled", true);' >> $userjs;
echo 'pref("media.eme.enabled", false);' >> $userjs;
echo 'pref("general.useragent.updates.enabled", false);' >> $userjs;
echo 'pref("browser.snippets.updateUrl", "");' >> $userjs;
echo 'pref("browser.snippets.enabled", false);' >> $userjs;
echo 'pref("browser.snippets.syncPromo.enabled", false);' >> $userjs;
echo 'pref("browser.snippets.firstrunHomepage.enabled", false);' >> $userjs;
echo 'pref("dom.push.serverURL", "");' >> $userjs;
echo 'pref("dom.push.enabled", false);' >> $userjs;
echo 'pref("plugin.expose_full_path", false);' >> $userjs;
echo 'pref("browser.link.open_newwindow_restriction", true);' >> $userjs;
echo 'pref("reader.parse-on-load.enabled", false);' >> $userjs;
echo 'pref("browser.reader.detectedFirstArticle", true);' >> $userjs;
echo 'pref("network.negotiate-auth.trusted-uris", "");' >> $userjs;
##Security
echo 'pref("javascript.options.shared_memory", false);' >> $userjs;
echo "//END OF BRACE EXTRAS" >> $userjs;
