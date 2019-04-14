//
/******************************************************************************
 * user.js                                                                    *
 * https://github.com/pyllyukko/user.js                                       *
 ******************************************************************************/

// PREF: Disable raw TCP socket support (mozTCPSocket)
// https://trac.torproject.org/projects/tor/ticket/18863
// https://www.mozilla.org/en-US/security/advisories/mfsa2015-97/
// https://developer.mozilla.org/docs/Mozilla/B2G_OS/API/TCPSocket
pref("dom.mozTCPSocket.enabled",				false);

// PREF: Disable WebRTC getUserMedia, screen sharing, audio capture, video capture
// https://wiki.mozilla.org/Media/getUserMedia
// https://blog.mozilla.org/futurereleases/2013/01/12/capture-local-camera-and-microphone-streams-with-getusermedia-now-enabled-in-firefox/
// https://developer.mozilla.org/en-US/docs/Web/API/Navigator
pref("media.navigator.video.enabled",			false);

// PREF: Disable speech recognition
// https://dvcs.w3.org/hg/speech-api/raw-file/tip/speechapi.html
// https://developer.mozilla.org/en-US/docs/Web/API/SpeechRecognition
// https://wiki.mozilla.org/HTML5_Speech_API
pref("media.webspeech.recognition.enable",			false);

// PREF: Set File URI Origin Policy
// http://kb.mozillazine.org/Security.fileuri.strict_origin_policy
// CIS Mozilla Firefox 24 ESR v1.0.0 - 3.8
pref("security.fileuri.strict_origin_policy",		true);

// PREF: Enable only whitelisted URL protocol handlers
// http://kb.mozillazine.org/Network.protocol-handler.external-default
// http://kb.mozillazine.org/Network.protocol-handler.warn-external-default
// http://kb.mozillazine.org/Network.protocol-handler.expose.%28protocol%29
// https://news.ycombinator.com/item?id=13047883
// https://bugzilla.mozilla.org/show_bug.cgi?id=167475
// https://github.com/pyllyukko/user.js/pull/285#issuecomment-298124005
// NOTICE: Disabling nonessential protocols breaks all interaction with custom protocols such as mailto:, irc:, magnet: ... and breaks opening third-party mail/messaging/torrent/... clients when clicking on links with these protocols
// TODO: Add externally-handled protocols from Windows 8.1 and Windows 10 (currently contains protocols only from Linux and Windows 7) that might pose a similar threat (see e.g. https://news.ycombinator.com/item?id=13044991)
// TODO: Add externally-handled protocols from Mac OS X that might pose a similar threat (see e.g. https://news.ycombinator.com/item?id=13044991)
// If you want to enable a protocol, set network.protocol-handler.expose.(protocol) to true and network.protocol-handler.external.(protocol) to:
//   * true, if the protocol should be handled by an external application
//   * false, if the protocol should be handled internally by Firefox
pref("network.protocol-handler.warn-external-default",	true);
pref("network.protocol-handler.external.http",		false);
pref("network.protocol-handler.external.https",		false);
pref("network.protocol-handler.external.javascript",	false);
pref("network.protocol-handler.external.moz-extension",	false);
pref("network.protocol-handler.external.ftp",		false);
pref("network.protocol-handler.external.file",		false);
pref("network.protocol-handler.external.about",		false);
pref("network.protocol-handler.external.chrome",		false);
pref("network.protocol-handler.external.blob",		false);
pref("network.protocol-handler.external.data",		false);
pref("network.protocol-handler.expose-all",		false);
pref("network.protocol-handler.expose.http",		true);
pref("network.protocol-handler.expose.https",		true);
pref("network.protocol-handler.expose.javascript",		true);
pref("network.protocol-handler.expose.moz-extension",	true);
pref("network.protocol-handler.expose.ftp",		true);
pref("network.protocol-handler.expose.file",		true);
pref("network.protocol-handler.expose.about",		true);
pref("network.protocol-handler.expose.chrome",		true);
pref("network.protocol-handler.expose.blob",		true);
pref("network.protocol-handler.expose.data",		true);

// PREF: Disable Shumway (Mozilla Flash renderer)
// https://developer.mozilla.org/en-US/docs/Mozilla/Projects/Shumway
pref("shumway.disabled", true);

// PREF: Disable Gnome Shell Integration NPAPI plugin
pref("plugin.state.libgnome-shell-browser-plugin",		0);

// PREF: Disable remote debugging
// https://developer.mozilla.org/en-US/docs/Tools/Remote_Debugging/Debugging_Firefox_Desktop
// https://developer.mozilla.org/en-US/docs/Tools/Tools_Toolbox#Advanced_settings
pref("devtools.debugger.force-local",                   true);

// PREF: Reject .onion hostnames before passing the to DNS
// https://bugzilla.mozilla.org/show_bug.cgi?id=1228457
// RFC 7686
pref("network.dns.blockDotOnion",				true);

// PREF: Disallow NTLMv1
// https://bugzilla.mozilla.org/show_bug.cgi?id=828183
pref("network.negotiate-auth.allow-insecure-ntlm-v1",	false);
// it is still allowed through HTTPS. uncomment the following to disable it completely.
//pref("network.negotiate-auth.allow-insecure-ntlm-v1-https",		false);

// PREF: Enable Subresource Integrity
// https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity
// https://wiki.mozilla.org/Security/Subresource_Integrity
pref("security.sri.enable",				true);

// PREF: Disable the "new tab page" feature and show a blank tab instead
// https://wiki.mozilla.org/Privacy/Reviews/New_Tab
// https://support.mozilla.org/en-US/kb/new-tab-page-show-hide-and-customize-top-sites#w_how-do-i-turn-the-new-tab-page-off
pref("browser.newtab.url",					"about:blank");

// PREF: Display a notification bar when websites offer data for offline use
// http://kb.mozillazine.org/Browser.offline-apps.notify
pref("browser.offline-apps.notify",			true);

// PREF: Enable HSTS preload list (pre-set HSTS sites list provided by Mozilla)
// https://blog.mozilla.org/security/2012/11/01/preloading-hsts/
// https://wiki.mozilla.org/Privacy/Features/HSTS_Preload_List
// https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security
pref("network.stricttransportsecurity.preloadlist",	true);

// PREF: Enable OCSP Must-Staple support (Firefox >= 45)
// https://blog.mozilla.org/security/2015/11/23/improving-revocation-ocsp-must-staple-and-short-lived-certificates/
// https://www.entrust.com/ocsp-must-staple/
// https://github.com/schomery/privacy-settings/issues/40
// NOTICE: Firefox falls back on plain OCSP when must-staple is not configured on the host certificate
pref("security.ssl.enable_ocsp_must_staple",		true);

// PREF: Disable insecure TLS version fallback
// https://bugzilla.mozilla.org/show_bug.cgi?id=1084025
// https://github.com/pyllyukko/user.js/pull/206#issuecomment-280229645
pref("security.tls.version.fallback-limit",		3);

// PREF: Disable null ciphers
pref("security.ssl3.rsa_null_sha",				false);
pref("security.ssl3.rsa_null_md5",				false);
pref("security.ssl3.ecdhe_rsa_null_sha",			false);
pref("security.ssl3.ecdhe_ecdsa_null_sha",			false);
pref("security.ssl3.ecdh_rsa_null_sha",			false);
pref("security.ssl3.ecdh_ecdsa_null_sha",			false);

// PREF: Disable SEED cipher
// https://en.wikipedia.org/wiki/SEED
pref("security.ssl3.rsa_seed_sha",				false);

// PREF: Disable 40/56/128-bit ciphers
// 40-bit ciphers
pref("security.ssl3.rsa_rc4_40_md5",			false);
pref("security.ssl3.rsa_rc2_40_md5",			false);
// 56-bit ciphers
pref("security.ssl3.rsa_1024_rc4_56_sha",			false);
// 128-bit ciphers
pref("security.ssl3.rsa_camellia_128_sha",			false);
pref("security.ssl3.ecdhe_rsa_aes_128_sha",		false);
pref("security.ssl3.ecdhe_ecdsa_aes_128_sha",		false);
pref("security.ssl3.ecdh_rsa_aes_128_sha",			false);
pref("security.ssl3.ecdh_ecdsa_aes_128_sha",		false);
pref("security.ssl3.dhe_rsa_camellia_128_sha",		false);
pref("security.ssl3.dhe_rsa_aes_128_sha",			false);

// PREF: Disable RC4
// https://developer.mozilla.org/en-US/Firefox/Releases/38#Security
// https://bugzilla.mozilla.org/show_bug.cgi?id=1138882
// https://rc4.io/
// https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-2566
pref("security.ssl3.ecdh_ecdsa_rc4_128_sha",		false);
pref("security.ssl3.ecdh_rsa_rc4_128_sha",			false);
pref("security.ssl3.ecdhe_ecdsa_rc4_128_sha",		false);
pref("security.ssl3.ecdhe_rsa_rc4_128_sha",		false);
pref("security.ssl3.rsa_rc4_128_md5",			false);
pref("security.ssl3.rsa_rc4_128_sha",			false);
pref("security.tls.unrestricted_rc4_fallback",		false);

// PREF: Disable 3DES (effective key size is < 128)
// https://en.wikipedia.org/wiki/3des#Security
// http://en.citizendium.org/wiki/Meet-in-the-middle_attack
// http://www-archive.mozilla.org/projects/security/pki/nss/ssl/fips-ssl-ciphersuites.html
pref("security.ssl3.dhe_dss_des_ede3_sha",			false);
pref("security.ssl3.dhe_rsa_des_ede3_sha",			false);
pref("security.ssl3.ecdh_ecdsa_des_ede3_sha",		false);
pref("security.ssl3.ecdh_rsa_des_ede3_sha",		false);
pref("security.ssl3.ecdhe_ecdsa_des_ede3_sha",		false);
pref("security.ssl3.ecdhe_rsa_des_ede3_sha",		false);
pref("security.ssl3.rsa_des_ede3_sha",			false);
pref("security.ssl3.rsa_fips_des_ede3_sha",		false);

// PREF: Disable ciphers with ECDH (non-ephemeral)
pref("security.ssl3.ecdh_rsa_aes_256_sha",			false);
pref("security.ssl3.ecdh_ecdsa_aes_256_sha",		false);

// PREF: Disable 256 bits ciphers without PFS
pref("security.ssl3.rsa_camellia_256_sha",			false);

// PREF: Enable ciphers with ECDHE and key size > 128bits
pref("security.ssl3.ecdhe_rsa_aes_256_sha",		true); // 0xc014
pref("security.ssl3.ecdhe_ecdsa_aes_256_sha",		true); // 0xc00a

// PREF: Enable GCM ciphers (TLSv1.2 only)
// https://en.wikipedia.org/wiki/Galois/Counter_Mode
pref("security.ssl3.ecdhe_ecdsa_aes_128_gcm_sha256",	true); // 0xc02b
pref("security.ssl3.ecdhe_rsa_aes_128_gcm_sha256",		true); // 0xc02f

// PREF: Enable ChaCha20 and Poly1305 (Firefox >= 47)
// https://www.mozilla.org/en-US/firefox/47.0/releasenotes/
// https://tools.ietf.org/html/rfc7905
// https://bugzilla.mozilla.org/show_bug.cgi?id=917571
// https://bugzilla.mozilla.org/show_bug.cgi?id=1247860
// https://cr.yp.to/chacha.html
pref("security.ssl3.ecdhe_ecdsa_chacha20_poly1305_sha256",	true);
pref("security.ssl3.ecdhe_rsa_chacha20_poly1305_sha256",	true);

// PREF: Disable ciphers susceptible to the logjam attack
// https://weakdh.org/
pref("security.ssl3.dhe_rsa_camellia_256_sha",		false);
pref("security.ssl3.dhe_rsa_aes_256_sha",			false);

// PREF: Disable ciphers with DSA (max 1024 bits)
pref("security.ssl3.dhe_dss_aes_128_sha",			false);
pref("security.ssl3.dhe_dss_aes_256_sha",			false);
pref("security.ssl3.dhe_dss_camellia_128_sha",		false);
pref("security.ssl3.dhe_dss_camellia_256_sha",		false);

// PREF: Fallbacks due compatibility reasons
pref("security.ssl3.rsa_aes_256_sha",			true); // 0x35
pref("security.ssl3.rsa_aes_128_sha",			true); // 0x2f
