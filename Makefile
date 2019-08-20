#!/bin/make -f
.ONESHELL=1
.DEFAULT_GOAL=all

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

smartcard/:
	-@mkdir $@

smartcard: smartcard/ smartcard/9a.cer smartcard/9c.cer smartcard/9d.cer smartcard/9e.cer

smartcard/9a.cer:
	$(YKMAN) piv export-certificate $(notdir $(basename $@)) $@

smartcard/9c.cer:
	$(YKMAN) piv export-certificate $(notdir $(basename $@)) $@

smartcard/9d.cer:
	$(YKMAN) piv export-certificate $(notdir $(basename $@)) $@

smartcard/9e.cer:
	$(YKMAN) piv export-certificate $(notdir $(basename $@)) $@

view-9a: smartcard/9a.cer
	certutil $< | iconv -f sjis


user: user/ user/my.txt user/enumstore.txt user/trustedpeople.txt

user/:
	-@mkdir user

user/enumstore.txt:
	certutil.exe -enumstore -user | iconv -f sjis | tee $@

user/trustedpeople.txt:
	certutil.exe -user -store TrustedPeople | iconv -f sjis | tee $@

user/my.txt:
	certutil.exe -user -store My | iconv -f sjis | tee $@

machine: machine/ machine/my.txt

machine/:
	-@mkdir machine

machine/enumstore.txt:
	certutil.exe -enumstore | iconv -f sjis | tee $@

machine/my.txt:
	certutil.exe -store My | iconv -f sjis | tee $@

machine/recovery.txt:
	certutil.exe -store Recovery | iconv -f sjis | tee $@

machine/trustedpeople.txt:
	certutil.exe -store TrustedPeople | iconv -f sjis | tee $@

machine/root.txt:
	certutil.exe -store Root | iconv -f sjis | tee $@

usage: usage/ usage/certutil.txt

usage/:
	-@mkdir usage

usage/certutil.txt:
	certutil.exe -? | iconv -f sjis | tee $@

usage/getkey.txt:
	certutil.exe -getkey -? | iconv -f sjis | tee $@

