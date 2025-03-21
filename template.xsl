<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="my-element">
  <xsl:element name="target-element">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="@source-attribute">
  <xsl:attribute name="target-attribute">
    <xsl:value-of select="."/>
  </xsl:attribute>
</xsl:template>


</xsl:stylesheet>
