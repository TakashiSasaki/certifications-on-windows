.PHONY:all

all: \
	$(subst certhash,crt,$(wildcard *.certhash)) \
	$(subst certhash,fingerprint,$(wildcard *.certhash)) 

%.crt: %.certhash
	CertUtil.exe -silent -split -getcert $(basename $<) | iconv -f cp932

%.fingerprint: %.crt
	openssl x509 -fingerprint -inform DER -in $< -noout >$@

