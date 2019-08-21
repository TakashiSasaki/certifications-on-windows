.ONESHELL:
.PHONY: machine clean

machine: enumstore.txt \
	$(addsuffix .certhash, My Recovery Root Trust TrustedPeople CA TrustedPublisher SmartCardRoot)

%.certhash: %.txt
	cat $< | sed -r -n -e 's/^Cert.+\(sha1\): ([0-9a-f]+).*/\1/p' | tee $@

enumstore.txt:
	certutil.exe -enumstore | iconv -f sjis | tee $@

%.txt:
	certutil.exe -store $(basename $@) | iconv -f sjis | tee $@

my.certhash: my.txt
	@#Cert ハッシュ(sha1): 7d6a1c85604cd56538a3262ad481887ae01ab8d9
	cat $< | sed -r -n -e 's/^Cert.+\(sha1\): ([0-9a-f]+).*/\1/p' | tee $@

clean:
	git clean -fdx

