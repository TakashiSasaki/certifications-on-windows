my.certhash: my.txt
	@#Cert ハッシュ(sha1): 7d6a1c85604cd56538a3262ad481887ae01ab8d9
	cat $< | sed -r -n -e 's/^Cert.+\(sha1\): ([0-9a-f]+).*/\1/p' | tee $@
