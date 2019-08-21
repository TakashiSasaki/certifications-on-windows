SHELL=/bin/bash
.ONESHELL:
.PHONY: enterprise clean

enterprise: enumstore.txt \
	My/ Recovery/ Root/ Trust/ TrustedPeople/ CA/ TrustedPublisher/ SmartCardRoot/

enumstore.txt:
	certutil.exe -user  -enumstore | iconv -f cp932 | tee $@

%.txt:
	certutil.exe -enterprise -store $(basename $@) | iconv -f cp932 | tee $@

%.certhash:%.txt
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


