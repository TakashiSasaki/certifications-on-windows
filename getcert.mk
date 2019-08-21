.PHONY:all clean

all: \
	$(subst certhash,crt,$(wildcard *.certhash)) \
	$(subst certhash,fingerprint,$(wildcard *.certhash)) 

%.crt: %.certhash
	CertUtil.exe -silent -privatekey -split -getcert $(basename $<) | iconv -f cp932

# So called 'CertHash' in CertUtil.exe is identical to OpenSSL SHA1 fingerprint
%.fingerprint: %.crt
	openssl x509 -fingerprint -inform DER -in $< -noout >$@


clean:
	git clean -fdx
