<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text"/>

<!-- Some templates for processing HTML elements in /html/body/main.
Many of them use xsl:value-of select='.' to flatten inner elements -->
<xsl:template match="h1 | h2 | h3 | h4 | h5 | h6">["<xsl:value-of select="."/>"]</xsl:template>

<xsl:template match="h1">["h1", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="h2">["h2", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="h3">["h3", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="h4">["h4", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="h5">["h5", "<xsl:value-of select="."/>"]</xsl:template>
<xsl:template match="h6">["h6", "<xsl:value-of select="."/>"]</xsl:template>

<xsl:template match="p">["p", "<xsl:value-of select="."/>"]</xsl:template>

</xsl:stylesheet>
