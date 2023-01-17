# XSLT (eXtensible Stylesheet Languate Transformations)

Stylesheets, snippets and guidelines for transforming between and inside DocBook, HTML, possibly also JSON

XSLT is a "language" for transforming from some XML to other XML or to anything else. XML is a syntax specification for writing texts but also images (SVG), music score (MusicML), mathematical formulas (MathML), even databases. SVG, MusicML, and MathML are just vocabularies. HTML is the XML vocabulary web pages are written in.

## Producing Atomic Texts and a Graph thereof

My goal is to produce ==atomic texts==, that is short texts that can stand on their own. These must also point to other texts so that they make up a network or ==graph==. And they must be in the format of a webpage or HTML file (e.g. "my-file.html") that follows some guidelines for simplicity, ease of processing and styling and so on.

Also and importantly, I want to document the process of creating and transforming atomic texts.

My purpose in doing this is to enable the creation of a graph as well as alternative graphs and subgraphs on clues given by XML attributes.


## From DocBook to HTML

I have compiled some relevant notes from DocBook XSL: The Complete Guide, Bob Stayton 2007, which teaches how to apply a 20MB bundle of XSLT stylesheets. The stylesheets are made available free of charge and rely on XSLT version 1.0.


## Other Transformations
- From XML to JSON. Something like:
  ```
  <json-obj>
    <pair>
      <key>First Name</key>
      <value>Sonia</value>
    </pair>
    ...
  </json-obj>
  ```
- Removing comments (so as to hide information)
- Removing (block) elements with a given attribute, (`privacy-level`), or where a given attribute is assigned a given value (`privacy-level="intimate"`)

