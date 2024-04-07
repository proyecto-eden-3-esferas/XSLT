<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="li/p | dl/dt | dl/dd">
"<xsl:value-of select="."/>"
</xsl:template>

<xsl:template match="ol">{
  "ol" : [
  <xsl:apply-templates select="li[1]"/>
  <xsl:for-each select="li[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]
}</xsl:template>

<xsl:template match="ul">{
  "ul" : [
  <xsl:apply-templates select="li[1]"/>
  <xsl:for-each select="li[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]
}</xsl:template>

<!-- A Definition List (dl) is made up of <dt> (terms) and <dd> (definitions) -->
<xsl:template match="dl">{
  "dl" : [
  <xsl:apply-templates select="*[1]"/>
  <xsl:for-each select="*[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]
}</xsl:template>

</xsl:stylesheet>
