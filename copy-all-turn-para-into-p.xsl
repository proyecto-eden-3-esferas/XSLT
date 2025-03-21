<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml"/>

<xsl:template match="para">
  <p>
    <xsl:apply-templates select="@*|node()" />
  </p>
</xsl:template>

<!-- Copy all the other elements and attributes, and text nodes -->
<xsl:template match="*|@*|text()">
  <xsl:copy>
    <xsl:apply-templates select="*|@*|text()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
