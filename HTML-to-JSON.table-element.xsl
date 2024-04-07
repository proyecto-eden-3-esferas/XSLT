<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--
<thead> 	Groups the header content in a table
<tbody> 	Groups the body content in a table
<tfoot> 	Groups the footer content in a table
-->

<xsl:template match="thead">
  "thead": [
  <xsl:apply-templates select="*[1]"/>
  <xsl:for-each select="*[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]</xsl:template>
<xsl:template match="tr">
  "tr": [
  <xsl:apply-templates select="*[1]"/>
  <xsl:for-each select="*[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]</xsl:template>
<xsl:template match="tbody">
  "tbody": [
  <xsl:apply-templates select="*[1]"/>
  <xsl:for-each select="*[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]</xsl:template>
<xsl:template match="tfoot">
  "tfoot": [
  <xsl:apply-templates select="*[1]"/>
  <xsl:for-each select="*[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]</xsl:template>

<xsl:template match="table">{
  "table" : [
  <xsl:apply-templates select="*[1]"/>
  <xsl:for-each select="*[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
    ]
  }</xsl:template>

</xsl:stylesheet>
