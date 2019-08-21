.PHONY:all clean

all: \
	$(subst certhash,crt,$(wildcard *.certhash)) \
	$(subst certhash,fingerprint,$(wildcard *.certhash)) 

%.crt: %.certhash
	CertUtil.exe -silent -privatekey -split -getcert $(basename $<) | iconv -f cp932

%.fingerprint: %.crt
	openssl x509 -fingerprint -inform DER -in $< -noout >$@


clean:
	git clean -fdx
