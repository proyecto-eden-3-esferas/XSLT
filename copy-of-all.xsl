<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- Copy all elements, attributes and text nodes.
     Instead of lenghthy "* | @* | text() | comment"
     we may just "node() | @*"
-->

<!-- Copy all elements, attributes, and text nodes -->
<xsl:template match="*|@*|text()|comment()">
  <xsl:copy>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
