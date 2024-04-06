<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text"/>

<xsl:template match="/html/body//text()">"<xsl:value-of select="."/>"</xsl:template>

<!-- Common attributes are realized as "@name" : "value"" -->
<xsl:template match="@id"  >"@id" : "<xsl:value-of select='.'/>"</xsl:template>
<xsl:template match="@lang">"@lang" : "<xsl:value-of select='.'/>"</xsl:template>

<!-- In production code, "HTML-to-JSON.tables.xsl" as well as this file ("HTML-to-JSON.xsl")
     should be included from an includes-only file. -->
<!--
<xsl:include href="HTML-to-JSON.h-p-as-strings.xsl"/>
<xsl:include href="HTML-to-JSON.tables.simple.xsl"/>
-->

<!-- Copy all elements, attributes, and text nodes -->
<xsl:template match="node() | @*">
  <xsl:copy>
    <xsl:apply-templates select="node() | @*"/>
  </xsl:copy>
</xsl:template>

<!-- Some templates for processing HTML elements in /html/body/main.
Many of them use xsl:value-of select='.' to flatten inner elements -->
<xsl:template match="code"      >["code", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="pre"       >["pre", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="svg"       >["svg", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="blockquote">["blockquote", "<xsl:value-of select="."/>"]</xsl:template>
<!-- specializations for elements bearing a lang attribute -->
<xsl:template match="blockquote[@lang]">["blockquote", "<xsl:value-of select="@lang"/>", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="pre[@lang]">["pre", "<xsl:value-of select="@lang"/>", "<xsl:value-of select="."/>"]</xsl:template>

<xsl:template match="a"                                       >[ "<xsl:value-of select="@href"/>", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="a[@rel]">[ "<xsl:value-of select="@rel"/>", "<xsl:value-of select="@href"/>", "<xsl:value-of select="."/>"]</xsl:template>

<!-- Do not transform html/head, only html/body: -->
<xsl:template match="html/head"/>
<xsl:template match="html/body">{
  "title": "<xsl:value-of select="/html/head/title"/>"<xsl:if test="/html/head/meta[@name='author']">,
  "author": "<xsl:value-of select="/html/head/meta[@name='author']/@content"/>"</xsl:if>
  <xsl:if test="/html/head/meta[@name='description']">,
  "description": "<xsl:value-of select="/html/head/meta[@name='description']/@content"/>"</xsl:if>
  <xsl:if test="/html/head/meta[@name='keywords']">,
  "keywords": "<xsl:value-of select="/html/head/meta[@name='keywords']/@content"/>"</xsl:if>
  <!-- Then transform attributes -->
  <xsl:for-each select="/html/body/@*">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  <!-- Last, transform the children nodes into items of array "content" -->
  "content" : [
  <xsl:if test="*"><xsl:apply-templates select="*[1]"/></xsl:if>
  <xsl:for-each select="/html/body/*[position() &gt; 1]">,
  <xsl:apply-templates select="."/>
  </xsl:for-each>
  ]
}
</xsl:template>

<!--
<xsl:template match="html/head/meta[@name='author']">
  <xsl:text>x.set_author("</xsl:text>
  <xsl:apply-templates select="@content"/>
  <xsl:text select='@content'/>
  <xsl:value-of select="html/head/meta[@name='author']/@content"/>
  <xsl:text>");</xsl:text>
</xsl:template>
-->

</xsl:stylesheet>
