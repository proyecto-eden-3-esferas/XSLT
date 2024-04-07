<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- This is a standard set of templates
for transforming table subsubelements to JSON.

It just applies <xsl:value-of/>

HTML elements 'colgroup' and 'col' are not translated. -->

<xsl:template match="th">[<xsl:value-of select="."/>]</xsl:template>
<xsl:template match="td" ><xsl:value-of select="."/></xsl:template>
<xsl:template match="caption" >["<xsl:value-of select="."/>"]</xsl:template>
<!--
<th> 	Defines a header cell in a table
<tr> 	Defines a row in a table
<td> 	Defines a cell in a table
<caption> 	Defines a table caption
<colgroup> 	Specifies a group of one or more columns in a table for formatting
<col> 	Specifies column properties for each column within a <colgroup> element
-->
<xsl:template match="colgroup"></xsl:template>
<xsl:template match="col"></xsl:template>

</xsl:stylesheet>
