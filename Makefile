#!/bin/make -f
.ONESHELL:
.DEFAULT_GOAL=all
USER_DIR=user/
.PHONY: all

all: 
	$(MAKE) -C usage
	$(MAKE) -C machine
	$(MAKE) -C smartcard
	#$(MAKE) -C user

help:
	$(info make help)
	$(info make test)


user: $(USER_DIR) $(USER_DIR)my.txt $(USER_DIR)enumstore.txt $(USER_DIR)trustedpeople.txt

$(USER_DIR):
	-@mkdir $@

$(USER_DIR)enumstore.txt:
	certutil.exe -enumstore -user | iconv -f sjis | tee $@

$(USER_DIR)trustedpeople.txt:
	certutil.exe -user -store TrustedPeople | iconv -f sjis | tee $@

$(USER_DIR)my.txt:
	certutil.exe -user -store My | iconv -f sjis | tee $@

