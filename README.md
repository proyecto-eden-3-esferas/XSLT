# XSLT (eXtensible Stylesheet Languate Transformations)

Stylesheets, snippets and guidelines for transforming between and inside DocBook, HTML, possibly also JSON

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



## Producing Atomic Texts and a Graph thereof

My goal is to produce __atomic texts__, that is short texts that can stand on their own. These must also point to other texts so that they make up a network or __graph__. And they must be in the format of a webpage or HTML file (e.g. "my-file.html") that follows some guidelines for simplicity, ease of processing and styling and so on.

Also and importantly, I want to document the process of creating and transforming atomic texts.

My purpose in doing this is to enable the creation of a graph as well as alternative graphs and subgraphs on clues given by XML attributes.

Actually, this approach looks very much like **zettelkasten** or slipnotes...

## From DocBook to HTML

I have compiled some relevant notes from DocBook XSL: The Complete Guide, Bob Stayton 2007, which teaches how to apply a 20MB bundle of XSLT stylesheets. The stylesheets are made available free of charge and rely on XSLT version 1.0.

I intend to provide some templates for transformations, guidelines for writing a suitable Makefile, and some definitive XSLT stylesheets that import the aforementioned stylesheets.


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

