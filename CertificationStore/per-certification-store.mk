all: \
	My/ Recovery/ Root/ Trust/ TrustedPeople/ CA/ TrustedPublisher/ SmartCardRoot/

%.certutil-store:
	certutil.exe $(CERTIFICATION_STORE_OPTION) -store $(basename $@) | iconv -f cp932 | tee $@

%.certhash: %.certutil-store
	cat $< | sed -r -n -e 's/^Cert.+\(sha1\): ([0-9a-f]+).*/\1/p' | tee $@

%/:%.certhash
	mkdir -p $(basename $<)
	exec 3< $<
	while read -u 3 line
	do
		echo $${line} > $@$${line}.certhash
	done

