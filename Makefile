#!/bin/make -f
.ONESHELL=1
.DEFAULT_GOAL=certs

YKMAN=/drives/c/Program\ Files/Yubico/YubiKey\ Manager/ykman.exe

help:
	$(info make help)
	$(info make test)

scinfo-nopin:
	certutil -scinfo -silent| iconv -f sjis | tee scinfo-nopin.txt

scinfo-pin:
	certutil -scinfo | iconv -f sjis | tee scinfo-nopin.txt

scroot-view:
	certutil -scroots view "Yubico Yubikey 4 OTP+U2F+CCID 0" | iconv -f sjis

9a.cert:
	$(YKMAN) piv export-certificate $(basename $@) $@

9c.cert:
	$(YKMAN) piv export-certificate $(basename $@) $@

9d.cert:
	$(YKMAN) piv export-certificate $(basename $@) $@

9e.cert:
	$(YKMAN) piv export-certificate $(basename $@) $@

certs: 9a.cert 9c.cert 9d.cert 9e.cert
