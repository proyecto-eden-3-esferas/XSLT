<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml"/>

<!-- Skip all elements, attributes, and text nodes -->
<xsl:template match="node() | @*">
  <xsl:apply-templates select="title"/>
</xsl:template>

<xsl:template match="title">
  <xsl:value-of select="."/>
  <xsl:text>...</xsl:text>
</xsl:template>

</xsl:stylesheet>
