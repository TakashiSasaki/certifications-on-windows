#!/bin/make -f
.ONESHELL=1
.DEFAULT_GOAL=all
SMARTCARD_DIR=smartcard/
USER_DIR=user/
MACHINE_DIR=machine/
USAGE_DIR=usage/
YKMAN=/drives/c/Program\ Files/Yubico/YubiKey\ Manager/ykman.exe

all: smartcard user machine usage

help:
	$(info make help)
	$(info make test)

scinfo-nopin:
	certutil -scinfo -silent| iconv -f sjis | tee scinfo-nopin.txt

scinfo-pin:
	certutil -scinfo | iconv -f sjis | tee scinfo-nopin.txt

scroot-view:
	certutil -scroots view "Yubico Yubikey 4 OTP+U2F+CCID 0" | iconv -f sjis

$(SMARTCARD_DIR):
	-@mkdir $@

smartcard: $(SMARTCARD_DIR) $(SMARTCARD_DIR)9a.cer $(SMARTCARD_DIR)9c.cer $(SMARTCARD_DIR)9d.cer $(SMARTCARD_DIR)9e.cer

$(SMARTCARD_DIR)9a.cer:
	$(YKMAN) piv export-certificate $(notdir $(basename $@)) $@

$(SMARTCARD_DIR)9c.cer:
	$(YKMAN) piv export-certificate $(notdir $(basename $@)) $@

$(SMARTCARD_DIR)9d.cer:
	$(YKMAN) piv export-certificate $(notdir $(basename $@)) $@

$(SMARTCARD_DIR)9e.cer:
	$(YKMAN) piv export-certificate $(notdir $(basename $@)) $@

view-9a: $(SMARTCARD_DIR)9a.cer
	certutil $< | iconv -f sjis


user: $(USER_DIR) $(USER_DIR)my.txt $(USER_DIR)enumstore.txt $(USER_DIR)trustedpeople.txt

$(USER_DIR):
	-@mkdir $@

$(USER_DIR)enumstore.txt:
	certutil.exe -enumstore -user | iconv -f sjis | tee $@

$(USER_DIR)trustedpeople.txt:
	certutil.exe -user -store TrustedPeople | iconv -f sjis | tee $@

$(USER_DIR)my.txt:
	certutil.exe -user -store My | iconv -f sjis | tee $@

machine: $(MACHINE_DIR) $(MACHINE_DIR)my.txt

$(MACHINE_DIR):
	-@mkdir $@

$(MACHINE_DIR)enumstore.txt:
	certutil.exe -enumstore | iconv -f sjis | tee $@

$(MACHINE_DIR)my.txt:
	certutil.exe -store My | iconv -f sjis | tee $@

$(MACHINE_DIR)recovery.txt:
	certutil.exe -store Recovery | iconv -f sjis | tee $@

$(MACHINE_DIR)trustedpeople.txt:
	certutil.exe -store TrustedPeople | iconv -f sjis | tee $@

$(MACHINE_DIR)root.txt:
	certutil.exe -store Root | iconv -f sjis | tee $@

