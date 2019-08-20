USAGE_DIR=./

usage: $(USAGE_DIR) $(USAGE_DIR)certutil.txt $(USAGE_DIR)getkey.txt $(USAGE_DIR)getcert.txt

$(USAGE_DIR):
	-@mkdir $@

$(USAGE_DIR)certutil.txt:
	certutil.exe -? | tr -d "\r" | iconv -f cp932 -t utf8 | tee $@

$(USAGE_DIR)getkey.txt:
	certutil.exe -getkey -? | tr -d "\r" | iconv -f cp932 -t utf8 | tee $@

$(USAGE_DIR)getcert.txt:
	certutil.exe -getcert -? | tr -d "\r" | iconv -f cp932 -t utf8 | tee $@

clean:
	git clean -dfx


