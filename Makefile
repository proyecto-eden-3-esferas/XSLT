DB_TO_HTML = block.xsl inline.xsl
DB_TO_HTML_XSL = db_to_html.v03.xsl

PSIMPLE = ~/former/home/francisco/Documents/mis_escritos/precious/psimple/

# NOTE: <book> and <article> elements must not bear a default namespace like:
#       <book xmlns="http://docbook.org/ns/docbook" ...>
#       for these stylesheets to work
BLOCK_DB_TO_HTML = block-elements.xsl mediaobject.xsl list-elements.xsl glossary-elements.xsl admonition-elements.xsl
OTHER_DB_TO_HTML = inline-elements.xsl CALS-tables-elements.xsl info-elements.xsl authorship-elements.xsl link-elements-and-attributes.xsl computer-code.xsl
SUBDIRS_TO_SAVE = bulk/ borrowed_or_pro/ xml_to_tex/ from_html/ HTML2HTML/ pull_processing/

ALL_DB_TO_HTML = $(BLOCK_DB_TO_HTML) $(OTHER_DB_TO_HTML)
CUR_XSL = db_to_html.v1.0.xsl



book-with-html-css.epub: html.css book.xml
	dbtoepub --css html.css book.xml
%.epub : %.xml
	dbtoepub --css ../../docbook.css $<
book.html: book.xml $(DB_TO_HTML_XSL) $(DB_TO_HTML)
	xsltproc --output $@  $(DB_TO_HTML_XSL) $<
%.html : %.xml
	xsltproc --output $@ /usr/share/xml/docbook/stylesheet/docbook-xsl/html/docbook.xsl $<
%.my-xsl.html : %.xml $(BLOCK_DB_TO_HTML) $(OTHER_DB_TO_HTML) # use stylesheets written by myself (FF-VH)
	xsltproc --output $@ $(CUR_XSL) $<

save_to_Dropbox:
	cp --update --recursive *.xsl README.md *.xml $(SUBDIRS_TO_SAVE) ~/Dropbox/XSLT_code/
