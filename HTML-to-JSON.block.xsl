<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text"/>


<!-- Some templates for processing HTML elements in /html/body/main.
Many of them use xsl:value-of select='.' to flatten inner elements -->
<!--
<xsl:template match="code"      >["code", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="pre"       >["pre", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="svg"       >["svg", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="blockquote">["blockquote", "<xsl:value-of select="."/>"]</xsl:template>
-->
<!-- specializations for elements bearing a lang attribute -->
<!--
<xsl:template match="blockquote[@lang]">["blockquote", "<xsl:value-of select="@lang"/>", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="pre[@lang]">["pre", "<xsl:value-of select="@lang"/>", "<xsl:value-of select="."/>"]</xsl:template>
-->

<xsl:template match="nav">{
  "name" : "nav"<xsl:for-each select="@*">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>,
  "content" : [
    <xsl:apply-templates select=".//*[1]/a"/>
  <xsl:for-each select=".//*[position() &gt; 1]/a">,
    <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]
  }</xsl:template>

<!-- block elements capable of holding other block elements
     are converted to {objects} with a 'name', '@ATTR' and 'content',
     and are processed through analogous templates.
     These match: div, header, section, article, main -->

<xsl:template match="div">{
  "name" : "div"<xsl:for-each select="@*">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>,
  "content" : [
  <xsl:apply-templates select="*[1]"/>
  <xsl:for-each select="*[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]
  }</xsl:template>

<xsl:template match="header">{
  "name" : "header"<xsl:for-each select="@*">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>,
  "content" : [
  <xsl:apply-templates select="*[1]"/>
  <xsl:for-each select="*[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]
  }</xsl:template>

<xsl:template match="section">{
  "name" : "section"<xsl:for-each select="@*">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>,
  "content" : [
  <xsl:apply-templates select="*[1]"/>
  <xsl:for-each select="*[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]
  }</xsl:template>

<xsl:template match="article">{
  "name" : "article"<xsl:for-each select="@*">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>,
  "content" : [
  <xsl:apply-templates select="*[1]"/>
  <xsl:for-each select="*[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]
  }</xsl:template>

<xsl:template match="main">{
  "name" : "main"<xsl:for-each select="@*">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>,
  "content" : [
  <xsl:apply-templates select="*[1]"/>
  <xsl:for-each select="*[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]
  }</xsl:template>

</xsl:stylesheet>
