<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="block-elements.xsl"/>
<xsl:include href="inline-elements.xsl"/>
<xsl:include href="CALS-tables-elements.xsl"/>
<xsl:include href="info-elements.xsl"/>
<xsl:include href="link-elements-and-attributes.xsl"/>
<xsl:include href="computer-code.xsl"/>

<xsl:output method="html"/>


<xsl:template match="book | article" name="plain-head">
  <xsl:element name="head">
    <xsl:element name="title">
      <xsl:choose>
        <xsl:when test="title">
          <xsl:value-of select="title"/>
        </xsl:when>
        <xsl:when test="info/title">
          <xsl:value-of select="info/title"/>
        </xsl:when>
      </xsl:choose>
    </xsl:element>  <!-- close element 'title'-->
  </xsl:element>  <!-- close element 'head'-->
</xsl:template>


<xsl:template match="*|@*|text()|comment()" name="toc">
  <xsl:element name="nav">
    <xsl:attribute name="class">toc</xsl:attribute>
    <xsl:element name="ol">
      <xsl:for-each select='*[title | info]'>
        <xsl:choose>
          <xsl:when test="@xml:id">
            <xsl:element name="a">
              <xsl:attribute name="href">#<xsl:value-of select="@xml:id"/></xsl:attribute>
              <xsl:element name="li"> <xsl:value-of select="title | info/title"/> </xsl:element>
            </xsl:element>
          </xsl:when>
          <xsl:otherwise>
            <xsl:element name="li"> <xsl:value-of select="title | info/title"/> </xsl:element>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:element>
  </xsl:element>
</xsl:template>

<!-- Copy all elements, attributes, and text nodes -->
<xsl:template match="@*|*|text()|comment()">
  <xsl:copy>
    <!--
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates select="   *|text()|comment()"/>
    -->
    <xsl:apply-templates select="@*|*|text()|comment()"/>
  </xsl:copy>
</xsl:template>



<xsl:template match="book | article">
<xsl:text>
</xsl:text>
<html>
  <xsl:text>
  
  </xsl:text>
  <xsl:call-template name="plain-head"/>
  <xsl:text>

</xsl:text>

  <xsl:element name="body">
    <xsl:call-template name="toc"/>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>  <!-- close element 'body'-->

</html>
</xsl:template>


</xsl:stylesheet>
