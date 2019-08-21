.PHONY: clean all-usages
SHELL=/bin/bash
.ONESHELL:

all-usages: certutil.txt $(addsuffix .txt,getkey getcert exportpfx store dump dumppfx)

certutil.txt:
	certutil.exe -? | tr -d "\r" | iconv -f cp932 -t utf8 | tee $@

%.txt:
	certutil.exe -$(basename $@) -? | tr -d "\r" | iconv -f cp932 -t utf8 | tee $@

clean:
	git clean -dfx


