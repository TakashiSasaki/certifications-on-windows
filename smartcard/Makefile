SMARTCARD_DIR=./
YKMAN=/drives/c/Program\ Files/Yubico/YubiKey\ Manager/ykman.exe
.PHONY: smartcard

smartcard: $(SMARTCARD_DIR) \
	$(addprefix $(SMARTCARD_DIR), $(addsuffix .crt, 9a 9c 9d 9e)) \
	$(addprefix $(SMARTCARD_DIR), $(addsuffix .certutil.txt, 9a 9c 9d 9e)) \
	$(addprefix $(SMARTCARD_DIR), $(addsuffix .openssl.txt, 9a 9c 9d 9e))


scinfo-nopin:
	certutil -scinfo -silent| iconv -f sjis | tee scinfo-nopin.txt

scinfo-pin:
	certutil -scinfo | iconv -f sjis | tee scinfo-nopin.txt

scroot-view:
	certutil -scroots view "Yubico Yubikey 4 OTP+U2F+CCID 0" | iconv -f sjis

$(SMARTCARD_DIR):
	-@mkdir $@

$(SMARTCARD_DIR)9a.crt:
	$(YKMAN) piv export-certificate $(notdir $(basename $@)) $@

$(SMARTCARD_DIR)9c.crt:
	$(YKMAN) piv export-certificate $(notdir $(basename $@)) $@

$(SMARTCARD_DIR)9d.crt:
	$(YKMAN) piv export-certificate $(notdir $(basename $@)) $@

$(SMARTCARD_DIR)9e.crt:
	$(YKMAN) piv export-certificate $(notdir $(basename $@)) $@

%.certutil.txt: %.crt
	certutil $< | iconv -f sjis | tee $@

%.openssl.txt: %.crt
	openssl x509 -in $< -text >$@

