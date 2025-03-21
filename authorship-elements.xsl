<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="personname | address | affiliation | contrib | email | personblurb | uri | orgname | orgdiv">
  <xsl:value-of select="."/>
  <xsl:if test='position() != last()'>
    <xsl:text>; </xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="author">
  <xsl:element name="p">
    <xsl:attribute name="class">author</xsl:attribute>
    <xsl:element name="b">Authorship/Autoría: </xsl:element>
    <xsl:for-each select='.'>
      <xsl:apply-templates select="*|@*|text()|comment()"/>
      <!--<xsl:text>; </xsl:text>-->
      <xsl:if test='position() != last()'>
        <xsl:text>; </xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:element>
</xsl:template>


</xsl:stylesheet>
