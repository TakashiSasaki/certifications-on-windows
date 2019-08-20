#!/bin/make -f
.ONESHELL=1
.DEFAULT_GOAL=import-certs

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

9a.cer:
	$(YKMAN) piv export-certificate $(basename $@) $@

9c.cer:
	$(YKMAN) piv export-certificate $(basename $@) $@

9d.cer:
	$(YKMAN) piv export-certificate $(basename $@) $@

9e.cer:
	$(YKMAN) piv export-certificate $(basename $@) $@

certs: 9a.cer 9c.cer 9d.cer 9e.cer

import-certs: 9a.cer
	certutil -importcert 9a.cer | iconv -f sjis
