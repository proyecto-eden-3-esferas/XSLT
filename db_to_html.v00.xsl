<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>

<!-- Copy all elements, attributes, and text nodes -->
<xsl:template match="*|@*|text()|comment()">
  <xsl:copy>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="book">
  <html>
  <xsl:text>
  
  </xsl:text>
  <xsl:element name="head">
    <xsl:element name="title">
      <xsl:copy>
        <xsl:apply-templates select="./title"/>
      </xsl:copy>
    </xsl:element>
  </xsl:element>
  <xsl:text>
  </xsl:text>
  <xsl:element name="body">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
  </html>
</xsl:template>

<xsl:template match="title">
  <xsl:element name="h1">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="para">
  <xsl:element name="p">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="preface">
  <xsl:element name="div">
    <xsl:attribute name="class">preface</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="part">
  <xsl:element name="div">
    <xsl:attribute name="class">part"</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="chapter">
  <xsl:element name="div">
    <xsl:attribute name="class">chapter"</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="emphasis">
  <xsl:element name="em">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="userinput">
  <xsl:element name="kbd">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="quote">
  <xsl:element name="q">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="computeroutput">
  <xsl:element name="samp">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>


</xsl:stylesheet>
