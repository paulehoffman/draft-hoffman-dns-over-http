all: draft-hoffman-dns-over-http-latest.txt

%.txt: %.xml
	xml2rfc $<

%.xml: %.mkd
	kramdown-rfc2629 $< >$@.new
	# -diff $@ $@.new
	mv $@.new $@
