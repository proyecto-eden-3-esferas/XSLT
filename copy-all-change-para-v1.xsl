<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml"/>
<!-- Copy all elements, attributes, and text nodes -->
<xsl:template match="*|@*|text()|comment()">
  <xsl:copy>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="para[@xml:lang='html']">
  <xsl:element name="p">
  <xsl:value-of select="*"/>
  </xsl:element>
</xsl:template>


</xsl:stylesheet>
