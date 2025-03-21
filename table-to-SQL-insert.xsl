<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--
  This file contains templates for inserting rows in an HTML table
  into an SQL table.
  They implement two different approaches:
  (1) The former set of templates assumes that an xsl:param is set
      for matching the id of an HTML table
      and the name of the SQL table that gets the insertions.
  (2) The latter relies on HTML tables having an SQL-table attribute
      and possibly also an SQL-db attribute.
  -->


<!-- Implementation of the first approach (a): define global parameters. -->
<xsl:param name="HTML-table">an-HTML-table</xsl:param>
<!--
Either of the following will do. Just remember that
the value of the select attr must be quoted ('...')
-->
<!--
<xsl:param name="SQL-table">an-SQL-table</xsl:param>
-->
<xsl:param name="SQL-table" select="'an-SQL-table'"/>


<!-- Implementation of the first approach (b): select tables on their id: -->
<!-- This does never get called when a table's id = $an-HTML-table. Why? -->
<xsl:template match="table[@xml:id='$HTML-table']">
  <xsl:text>TABLE SELECTED ON PARAMETER.
</xsl:text>
</xsl:template>
<!--
The following template will insert the rows of a table whose id=='an-HTML-table'
into an SQL table set by parameter 'SQL-table'.
-->
<xsl:template match="table[@xml:id='an-HTML-table']">
  <xsl:text>HTML table to SQL INSERT:
  </xsl:text>

  <xsl:for-each select=".//tr[td]">
    <xsl:text>INSERT INTO </xsl:text><xsl:value-of select="$SQL-table"/>
    <xsl:text> (</xsl:text>

    <xsl:for-each select="td">
      <xsl:value-of select="."/>
      <xsl:if test='position() != last()'>,</xsl:if>
    </xsl:for-each><xsl:text>);
    </xsl:text>
  </xsl:for-each>
</xsl:template>


<!-- Implementation of the second approach (a):
     dispatch tables bearing an SQL-table attribute
     to the first template,
     and dispatch those bearing both an SQL-table and a SQL-db
     attribute to the second template.
     Both templates call another template by name ('HTML-into-SQL-table')
  -->

<xsl:template match="table[@SQL-table]">
<!--<xsl:text>TABLE SELECTED FOR HAVING AN 'SQL-table' ATTR. SQL-table = </xsl:text>
  <xsl:value-of select="@SQL-table"/><xsl:text>
</xsl:text>-->
  <xsl:call-template name="HTML-into-SQL-table">
    <xsl:with-param name="SQL-table" select="@SQL-table"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="table[@SQL-table][@SQL-db]">
<!--<xsl:text>TABLE SELECTED FOR HAVING AN 'SQL-table' ATTR. SQL-table = </xsl:text>
  <xsl:value-of select="@SQL-table"/><xsl:text>
</xsl:text>-->
  <xsl:text>USE </xsl:text><xsl:value-of select="@SQL-db"/><xsl:text>;
</xsl:text>
  <xsl:call-template name="HTML-into-SQL-table">
    <xsl:with-param name="SQL-table" select="@SQL-table"/>
  </xsl:call-template>
</xsl:template>

<!--<xsl:template match='caption[ancestor::table] | thead | tfoot' mode="HTML-into-SQL-table"/>-->

<xsl:template name="HTML-into-SQL-table">
  <xsl:param name="SQL-table"/>
<!--
  <xsl:text>Template named 'HTML-into-SQL-table' called with param SQL-table=</xsl:text>
  <xsl:value-of select="$SQL-table"/><xsl:text>
</xsl:text>
-->
  <xsl:for-each select=".//tr[td]">
<xsl:text>INSERT INTO </xsl:text><xsl:value-of select="$SQL-table"/><xsl:text> (</xsl:text>
    <xsl:for-each select="td">
      <xsl:value-of select="."/>
      <xsl:if test='position() != last()'>,</xsl:if>
    </xsl:for-each><xsl:text>);
</xsl:text>
  </xsl:for-each>
</xsl:template>


</xsl:stylesheet>
