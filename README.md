# XSLT (eXtensible Stylesheet Languate Transformations)

Stylesheets, snippets and guidelines for transforming between and within DocBook, HTML, possibly also JSON

As of 21st of March, 2025, all files in   ~/francisco/Documents/mis_escritos/precious/psimple/Electric_files/XSLT_code with extensions `xsl` (XSTL), `xml` (DocBook), `html` (web pages) and the *Makefile* file have been uploaded. I haven't yet uploaded directories: borrowed_or_pro/, bulk/, from_html/, HTML2HTML/, pull_processing/, and xml_to_tex/

XSLT is a _language_ for transforming from some XML to other XML or to anything else. __XML__ is a syntax specification for writing texts as well as images (SVG), music score (MusicML), mathematical formulas (MathML), even databases. SVG, MusicML, and MathML are just vocabularies. HTML is the XML vocabulary web pages are written in.

I shall be using the free xsltproc command to effect transformations. Basic usage:

```
xsltproc my-stylesheet.xsl file-to-be-transformed.xml > resulting-file.xml
```
or

```
xsltproc --output resulting-file.xml my-stylesheet.xsl file-to-be-transformed.xml
```

## Failure to Transform `directory.no-xmlns.resolved.xml` into HTML

Note that the default namespace (DocBook) has been removed in `directory.no-xmlns.resolved.xml`. Otherwise the stylesheets applied wouldn't match any elements.

Two bugs and one concern:

1. unclosed <meta > standalone tag in source
SOLUTION:
Change
```
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
```
to
```
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
```

2. standalone `<imagedata />` transforms to just opening `<img >`
SOLUTION:
Catch: `^([ ]*)<img(.*)>` to Replacement: `\1<img\2/>`

3. Of course, you need to review all internal and external (hyper)links

## Producing Atomic Texts and a Graph thereof

One of my aims is to produce __atomic texts__, that is short texts that can stand on their own. These must also point to other texts so that they make up a network or __graph__. And they must be in the format of a webpage or HTML file (e.g. "my-file.html") that follows some guidelines for simplicity, ease of processing and styling and so on.

Also and importantly, I want to document the process of creating and transforming atomic texts.

My purpose in doing this is to enable the creation of a graph as well as alternative graphs and subgraphs on clues given by XML attributes.

Actually, this approach looks very much like **zettelkasten** or slipnotes...

## From DocBook to HTML

I have compiled some relevant notes from DocBook XSL: The Complete Guide, Bob Stayton 2007, which teaches how to apply a 20MB bundle of XSLT stylesheets. The stylesheets are made available free of charge and rely on XSLT version 1.0.

I intend to provide some templates for transformations, guidelines for writing a suitable Makefile, and some definitive XSLT stylesheets that import the aforementioned stylesheets.

### XSLT Files and Procedures

Files:

- block-elements.xsl
  - mediaobject.xsl
  - list-elements.xsl
    - glossary-elements.xsl
  - admonition-elements.xsl

- inline-elements.xsl
- CALS-tables-elements.xsl
- info-elements.xsl
  - authorship-elements.xsl
- link-elements-and-attributes.xsl
- computer-code.xsl


### DocBook TODO's

See to transformation of DocBook elements:
[x] `variablelist`
[x] `bridgehead` (still, some bridgehead elements do not transform)
[x] `link`
[x] `ulink`
[ ] `glossentry`
[ ] `reference` (found in *reference.xml*)
[ ] `purpose`   (found in *reference.xml*)
[ ] `article`      (found in *article.xml*)
[ ] `annotation`   (found in *article.xml*)

[ ] for each term an origin should be given: etymology, source-language, source-word, semantic-change, phonetic-change...

[ ] review and possibly enlarge DocBook files (*book.xml*, *article.xml*, *reference.xml* etc.)

[ ] write *block-elements.xsl* to *block-elements-chapterize.xsl* so that
    /book/chapter/title and /book/chapter/info/title becomes an `html:h1` element
    and write *db_to_html-chapterize.v1.0.xsl* to include *block-elements-chapterize.xsl* instead
[ ] write *block-elements.xsl* to *block-elements-sectionize.xsl* so that
    /book/chapter/section/title and /book/chapter/section/info/title becomes an `html:h1` element
    and write *db_to_html-sectionize.v1.0.xsl* to include *block-elements-sectionize.xsl* instead

[?] On transforming my lengthy DocBook files
    my XSLT processor (`xsltproc`) complains that
      Attribute nodes must be added before any child nodes to an element
    It actually says:
      runtime error: line 51 of file *db_to_html.v1.0.xsl*
      element `copy`
    Now, if I remove the default namespace declaration as well as the `version="5.0"` attribute key-value
    ¡Everything works out fine!
    Still better, it seems that

The offending code is, purportedly was:
```
<xsl:template match="*|@*|text()|comment()">
  <xsl:copy>
    <xsl:apply-templates select="*|text()|comment()"/>
  </xsl:copy>
</xsl:template>
```
Deceptively, the system also complains about transforming `@xml:id:`
  line 4 in file *link-elements-and-attributes.xsl*:
But as before, everything works out fine as soon as I leave `<book>` bare
with no namespace declarations.

[ ] Poetry, in DocBook inside `<literallayout>....</literallayout>`
    is translated into HTML `<pre class="poem">...</pre>`
    I think the best approach would be to leave the transformation like that
    and add a CSS rule to set font to some serif non-monospace font



## Other Transformations
1. From XML to JSON. Some features of this transformation:
  * an XML element transform into a JSON object
  * such a JSON object has "name", "attributes" (an array of, for example length-2 subarrays), and "content" keys
  * "content" is an array
3. Removing comments (so as to hide information): `<xsl:template match="comment()"/>`
4. Removing (block) elements with a given attribute, (`privacy-level`), or where a given attribute is assigned a given value (`privacy-level="intimate"`), through, again, empty templates like:
```
<xsl:template match="*[@privacy-level='intimate']"/>
```
