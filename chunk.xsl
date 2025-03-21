<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml"/>
<xsl:include href="utilities.xsl"/>

<!-- Copy all elements, attributes, and text nodes -->
<xsl:template match="node()|@*">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="chapter/title[not(contains(., '*'))]">
  <xsl:element name="h1">
    <xsl:call-template name="add-class-attr-eq-name"/>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
    <xsl:message>CHAPTER TITLE: <xsl:call-template name="value-to-hyphenated-name"/></xsl:message>
  </xsl:element>
</xsl:template>
<!--
<xsl:template match="title">
  <xsl:element name="target-element">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>-->

</xsl:stylesheet>
