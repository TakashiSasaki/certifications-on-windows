.PHONY: user clean
.ONESHELL:
SHELL=/bin/bash

user: enumstore.txt \
	My/ Root/ Trust/ TrustedPeople/ CA/ TrustedPublisher/ SmartCardRoot/

enumstore.txt:
	certutil.exe -enumstore -user | iconv -f cp932 | tee $@

%.txt:
	certutil.exe -user -store $(basename $@) | iconv -f cp932 | tee $@

%.certhash: %.txt
	cat $< | sed -r -n -e 's/^Cert.+\(sha1\): ([0-9a-f]+).*/\1/p' | tee $@

%/:%.certhash
	mkdir -p $(basename $<)
	exec 3< $<
	while read -u 3 line
	do
		echo $${line} > $@$${line}.certhash
	done

clean:
	git clean -fdx


