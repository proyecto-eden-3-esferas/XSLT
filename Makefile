DB_TO_HTML = block.xsl inline.xsl
DB_TO_HTML_XSL = db_to_html.v03.xsl

book-with-html-css.epub: html.css book.xml
	dbtoepub --css html.css book.xml
%.epub : %.xml
	dbtoepub --css ../../docbook.css $<
book.html: book.xml $(DB_TO_HTML_XSL) $(DB_TO_HTML)
	xsltproc --output $@  $(DB_TO_HTML_XSL) $<
%.html : %.xml
	xsltproc --output $@ /usr/share/xml/docbook/stylesheet/docbook-xsl/html/docbook.xsl $<
