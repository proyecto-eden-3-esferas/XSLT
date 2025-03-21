<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--
  DocBook does not have elements for inserted and deleted matter. But we could make up them, though.

  Furthermore, we could demand that such elements bear a date attribute and that dates are comparable,
  so that different versions of a document may be produced according to date.

  Especially, we might want to bring deleted material back into our document.

  Or an 'inserted' element might bear an 'author' attribute...

  Alternatively, insersions and deletions might be realized not through elements but through attributes.

-->

<xsl:template match="inserted[@xml:date]">
  <xsl:element name="ins">
    <xsl:attribute name="date"><xsl:value-of select="@xml:date]"/></xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="deleted[@xml:date]">
  <xsl:element name="del">
    <xsl:attribute name="date"><xsl:value-of select="@xml:date]"/></xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>


</xsl:stylesheet>
