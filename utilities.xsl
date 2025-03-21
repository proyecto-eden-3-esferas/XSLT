<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name='add-class-attr-eq-name'>
  <xsl:attribute name='class'><xsl:value-of select="local-name(.)"/></xsl:attribute>
</xsl:template>

<xsl:template name='value-to-hyphenated-name'>
  <xsl:value-of select="translate(., ' :', '-_')"/>
  <xsl:if test='../subtitle'>
    <xsl:for-each select='../subtitle'>_<xsl:value-of select="translate(., ' :', '-_')"/></xsl:for-each>
  </xsl:if>
</xsl:template>



</xsl:stylesheet>
