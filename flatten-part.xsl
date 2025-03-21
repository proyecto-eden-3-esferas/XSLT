<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--

Flattening a docbook:part element entails copying some of its elements and changing others. Front matter and back matter elements should be not just copied because when a book with several parts is flattened, then some front matter and back matter elements might occur between chapters. One solution would be to move all the front matter elements in the book's parts to the front and all the back matter to the back...

An alternative to flattening would be to demote all parts to chapters, all chapters to sections, and all sections to, well, sections...

Synopsis of docbook:part
========================
part ::= ((((title & titleabbrev? & subtitle?), info? db.titleforbidden.info) | info db.titlereq.info),
partintro?, (acknowledgements | appendix | article | bibliography | chapter | colophon | dedication | glossary | index | preface | refentry | reference | toc)+)
-->

<xsl:template match="part/info | part/title" mode="flatten-part"/>

<xsl:template match="part" mode="flatten-part">
  <xsl:for-each select='chapter | preface | appendix'>
    <xsl:apply-templates mode='flatten-part'/>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
