.PHONY:all clean

all: \
	$(subst certhash,crt,$(wildcard *.certhash)) \
	$(subst certhash,fingerprint,$(wildcard *.certhash)) \
	$(subst certhash,p12,$(wildcard *.certhash))  

%.crt: %.certhash
	CertUtil.exe -silent -split -getcert $(basename $<) | iconv -f cp932

%.p12: %.certhash
	CertUtil.exe -privatekey -p "test" -exportPfx $(basename $<) $@ ExtendedProperties,NoEncryptCert | iconv -f cp932

# So called 'CertHash' in CertUtil.exe is identical to OpenSSL SHA1 fingerprint
%.fingerprint: %.crt
	openssl x509 -fingerprint -inform DER -in $< -noout >$@

clean:
	git clean -fdx
