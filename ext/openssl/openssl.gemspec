Gem::Specification.new do |s|
  s.name = 'openssl'
  s.version = '1.1.0'

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Martin"]
  s.date = "2014-01-24"
  s.description = "A wrapper around OpenSSL"
  s.email = ["martin@example.org"]
  s.extensions = ["ext/openssl/extconf.rb"]
  s.extra_rdoc_files = []
  s.files = ["ext/openssl/openssl_missing.c","ext/openssl/ossl.c","ext/openssl/ossl_asn1.c","ext/openssl/ossl_bio.c","ext/openssl/ossl_bn.c","ext/openssl/ossl_cipher.c","ext/openssl/ossl_config.c","ext/openssl/ossl_digest.c","ext/openssl/ossl_engine.c","ext/openssl/ossl_hmac.c","ext/openssl/ossl_ns_spki.c","ext/openssl/ossl_ocsp.c","ext/openssl/ossl_pkcs12.c","ext/openssl/ossl_pkcs5.c","ext/openssl/ossl_pkcs7.c","ext/openssl/ossl_pkey.c","ext/openssl/ossl_pkey_dh.c","ext/openssl/ossl_pkey_dsa.c","ext/openssl/ossl_pkey_ec.c","ext/openssl/ossl_pkey_rsa.c","ext/openssl/ossl_rand.c","ext/openssl/ossl_ssl.c","ext/openssl/ossl_ssl_session.c","ext/openssl/ossl_x509.c","ext/openssl/ossl_x509attr.c","ext/openssl/ossl_x509cert.c","ext/openssl/ossl_x509crl.c","ext/openssl/ossl_x509ext.c","ext/openssl/ossl_x509name.c","ext/openssl/ossl_x509req.c","ext/openssl/ossl_x509revoked.c","ext/openssl/ossl_x509store.c","ext/openssl/extconf.h","ext/openssl/openssl_missing.h","ext/openssl/ossl.h","ext/openssl/ossl_asn1.h","ext/openssl/ossl_bio.h","ext/openssl/ossl_bn.h","ext/openssl/ossl_cipher.h","ext/openssl/ossl_config.h","ext/openssl/ossl_digest.h","ext/openssl/ossl_engine.h","ext/openssl/ossl_hmac.h","ext/openssl/ossl_ns_spki.h","ext/openssl/ossl_ocsp.h","ext/openssl/ossl_pkcs12.h","ext/openssl/ossl_pkcs5.h","ext/openssl/ossl_pkcs7.h","ext/openssl/ossl_pkey.h","ext/openssl/ossl_rand.h","ext/openssl/ossl_ssl.h","ext/openssl/ossl_version.h","ext/openssl/ossl_x509.h","ext/openssl/ruby_missing.h","ext/openssl/deprecation.rb","ext/openssl/extconf.rb","ext/openssl/gemspec.rb","lib/openssl","lib/openssl/bn.rb","lib/openssl/buffering.rb","lib/openssl/cipher.rb","lib/openssl/config.rb","lib/openssl/digest.rb","lib/openssl/ssl.rb","lib/openssl/x509.rb","lib/openssl.rb"]
  s.homepage = "http://www.ruby-lang.org"
  s.licenses = ["Ruby"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubyforge_project = "openssl"
  s.rubygems_version = "2.2.1"
  s.summary = "A thin wrapper exposing OpenSSL to Ruby"
  s.test_files = ["test/openssl/ssl_server.rb","test/openssl/test_asn1.rb","test/openssl/test_bn.rb","test/openssl/test_buffering.rb","test/openssl/test_cipher.rb","test/openssl/test_config.rb","test/openssl/test_digest.rb","test/openssl/test_engine.rb","test/openssl/test_fips.rb","test/openssl/test_hmac.rb","test/openssl/test_ns_spki.rb","test/openssl/test_ocsp.rb","test/openssl/test_pair.rb","test/openssl/test_pkcs12.rb","test/openssl/test_pkcs5.rb","test/openssl/test_pkcs7.rb","test/openssl/test_pkey_dh.rb","test/openssl/test_pkey_dsa.rb","test/openssl/test_pkey_ec.rb","test/openssl/test_pkey_rsa.rb","test/openssl/test_ssl.rb","test/openssl/test_ssl_session.rb","test/openssl/test_x509cert.rb","test/openssl/test_x509crl.rb","test/openssl/test_x509ext.rb","test/openssl/test_x509name.rb","test/openssl/test_x509req.rb","test/openssl/test_x509store.rb","test/openssl/utils.rb"]
end
