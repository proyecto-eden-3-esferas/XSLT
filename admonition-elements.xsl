<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name="admonition-style">
  <xsl:attribute name="style">border-style: solid;</xsl:attribute>
</xsl:template>

<xsl:template match="note">
  <xsl:element name="div">
    <xsl:attribute name="class">note</xsl:attribute>
    <xsl:call-template name="admonition-style"/>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="caution">
  <xsl:element name="div">
    <xsl:attribute name="class">caution</xsl:attribute>
    <xsl:call-template name="admonition-style"/>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="important">
  <xsl:element name="div">
    <xsl:attribute name="class">important</xsl:attribute>
    <xsl:call-template name="admonition-style"/>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="tip">
  <xsl:element name="div">
    <xsl:attribute name="class">tip</xsl:attribute>
    <xsl:call-template name="admonition-style"/>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="warning">
  <xsl:element name="div">
    <xsl:attribute name="class">warning</xsl:attribute>
    <xsl:call-template name="admonition-style"/>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>
