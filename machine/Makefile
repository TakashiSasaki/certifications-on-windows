SHELL=/bin/bash
.ONESHELL:
.PHONY: machine clean

machine: enumstore.txt \
	My/ Recovery/ Root/ Trust/ TrustedPeople/ CA/ TrustedPublisher/ SmartCardRoot/

%.certhash: %.txt
	cat $< | sed -r -n -e 's/^Cert.+\(sha1\): ([0-9a-f]+).*/\1/p' | tee $@

enumstore.txt:
	certutil.exe -enumstore | iconv -f sjis | tee $@

%.txt:
	certutil.exe -store $(basename $@) | iconv -f sjis | tee $@

%/:%.certhash
	mkdir -p $(basename $<)
	exec 3< $<
	while read -u 3 line
	do
		echo $${line} > $@$${line}.certhash
	done

clean:
	git clean -fdx


