.ONESHELL:
MACHINE_DIR=./
.PHONY: machine clean

machine:$(addprefix $(MACHINE_DIR),$(addsuffix .txt,enumstore my recovery root trust trustedpeople))\
	$(addprefix $(MACHINE_DIR),$(addsuffix .certhash, my recovery root trust trustedpeople))

%.certhash: %.txt
	cat $< | sed -r -n -e 's/^Cert.+\(sha1\): ([0-9a-f]+).*/\1/p' | tee $@

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

$(MACHINE_DIR)trust.txt:
	certutil.exe -store trust| iconv -f sjis | tee $@

my.certhash: my.txt
	@#Cert ハッシュ(sha1): 7d6a1c85604cd56538a3262ad481887ae01ab8d9
	cat $< | sed -r -n -e 's/^Cert.+\(sha1\): ([0-9a-f]+).*/\1/p' | tee $@

clean:
	git clean -fdx

