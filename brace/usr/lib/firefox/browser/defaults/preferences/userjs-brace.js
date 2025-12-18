//Look
pref("browser.vpn_promo.enabled", false);
pref("devtools.netmonitor.persistlog", true);
pref("devtools.webconsole.persistlog", true);
pref("general.smoothScroll", false);
pref("mailnews.start_page.enabled", false);

//Privacy
pref("privacy.globalprivacycontrol.enabled", true);
pref("network.negotiate-auth.trusted-uris", "");
pref("network.dns.native_https_query", true);
pref("network.trr.uri", "https://dns.quad9.net/dns-query");
pref("network.trr.custom_uri", "https://dns.quad9.net/dns-query");
pref("extensions.enigmail.autoWkdLookup", 0);
pref("messenger.status.reportIdle", false);
pref("media.gmp-widevinecdm.visible", false); //BRACE-KEEP_FOR_NOW: proprietary
pref("network.manage-offline-status", false);
pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
pref("browser.urlbar.quicksuggest.dataCollection.enabled", false);
pref("mailnews.headers.sendUserAgent", false);
pref("mail.sanitize_date_header", true);
pref("dom.private-attribution.submission.enabled", false);

//Security
pref("browser.gnome-search-provider.enabled", false);
pref("fission.autostart", true); //MULL-COMMENT_ME
pref("security.tls.enable_kyber", true);
pref("network.http.http3.enable_kyber", true);
pref("mail.phishing.detection.enabled", true);
pref("mailnews.message_display.disable_remote_image", true);

//Disable Sync
pref("identity.fxaccounts.enabled", false);

//Disable AI junk
pref("browser.ml.chat.enabled", false);
pref("browser.ml.chat.menu", false);
pref("browser.ml.chat.page", false);
pref("browser.ml.enable", false);
pref("browser.ml.linkPreview.enabled", false);
pref("browser.ml.linkPreview.optin", false);
pref("browser.ml.chat.sidebar", false);
pref("browser.ml.chat.shortcuts", false);
pref("extensions.ml.enabled", false);

//Fix IPv6 when using DoH
pref("network.dns.preferIPv6", true); //BRACE-KEEP_FOR_NOW
