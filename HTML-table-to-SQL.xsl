<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text"/>

<xsl:template match="/html/body//text()"/>

<!-- Common attributes are realized as "@name" : "value"" -->
<!--
<xsl:template match="@id"  >"@id" : "<xsl:value-of select='.'/>"</xsl:template>
<xsl:template match="@lang">"@lang" : "<xsl:value-of select='.'/>"</xsl:template>
-->
<!-- Copy all elements, attributes, and text nodes -->
<!--
<xsl:template match="node() | @*">
  <xsl:copy>
    <xsl:apply-templates select="node() | @*"/>
  </xsl:copy>
</xsl:template>
-->

<!--
(1) only tables meeting certain criteria are translated into SQL
(2) remember to turn all empty strings into NULL (with a sed script)
-->

<xsl:template match="tr[td]">
('<xsl:value-of select="td[1]"/>'<xsl:for-each  select="td[position() &gt; 1]">,
 '<xsl:value-of select="."/>'</xsl:for-each>)
</xsl:template>

<xsl:template match="html/body//table[@SQL-table]">
INSERT INTO <xsl:value-of select="@SQL-table"/> <xsl:if test=".//th[@colname]">
(<xsl:value-of select=".//th[1]/@colname"/>
<xsl:for-each  select=".//th[position() &gt; 1]">, <xsl:apply-templates select="@colname"/></xsl:for-each>)</xsl:if>
VALUES <xsl:apply-templates select=".//tr[1]"/>
<xsl:for-each select=".//tr[position() &gt; 1]">, <xsl:apply-templates select="."/></xsl:for-each>
;
</xsl:template>

<xsl:template match="html/head"/>
<xsl:template match="html/body">
  <xsl:apply-templates select="table[@SQL-table]"/>
</xsl:template>

</xsl:stylesheet>
