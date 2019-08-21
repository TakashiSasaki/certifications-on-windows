.PHONY: user
.ONESHELL:
USER_DIR=./

user: $(USER_DIR) \
	$(addsuffix $(USER_DIR), $(addsuffix, .txt, my enumstore trustedpeople))

$(USER_DIR):
	-@mkdir $@

$(USER_DIR)enumstore.txt:
	certutil.exe -enumstore -user | iconv -f sjis | tee $@

$(USER_DIR)trustedpeople.txt:
	certutil.exe -user -store TrustedPeople | iconv -f sjis | tee $@

$(USER_DIR)my.txt:
	certutil.exe -user -store My | iconv -f sjis | tee $@


