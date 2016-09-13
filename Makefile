DRAFT=draft-hoffman-dns-over-http-latest
all: $(DRAFT).txt

.PRECIOUS: $(DRAFT).xml

%.txt: %.xml
	xml2rfc $<

%.xml: %.mkd
	kramdown-rfc2629 $< >$@.new
	# -diff $@ $@.new
	mv $@.new $@

clean:
	$(RM) $(DRAFT).xml $(DRAFT).txt $(DRAFT).html