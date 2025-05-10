<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="link[@linkend]">
  <xsl:element name="a">
    <xsl:attribute name="href">#<xsl:value-of select="@linkend"/></xsl:attribute>
    <xsl:apply-templates select="*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="link[@url]">
  <xsl:element name="a">
    <xsl:attribute name="target">_blank</xsl:attribute>
    <xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
    <xsl:apply-templates select="*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="ulink[@url]">
  <xsl:element name="a">
    <xsl:attribute name="target">_blank</xsl:attribute>
    <xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
    <xsl:apply-templates select="*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<!--
  prefix xml is meaningless, line should be:
  <xsl:template match="@id">
-->
<xsl:template match="@xml:id">
  <xsl:attribute name="id">
    <xsl:value-of select="."/>
  </xsl:attribute>
</xsl:template>

<xsl:template match="*[@linkend]">
  <xsl:element name="a">
    <xsl:attribute name="href">
      <xsl:text>#</xsl:text><xsl:value-of select="./@linkend"/>
    </xsl:attribute>
    <xsl:apply-templates select="*|text()|comment()"/>
  </xsl:element>  <!-- close element 'a' -->
</xsl:template>


</xsl:stylesheet>
