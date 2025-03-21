<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="mediaobject.xsl"/>
<xsl:include href="list-elements.xsl"/>
<xsl:include href="admonition-elements.xsl"/>


<xsl:template match="remark | comment">
  <xsl:element name="del">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="para | simpara | formalpara">
  <xsl:element name="p">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="blockquote">
  <xsl:element name="blockquote">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="epigraph">
  <!-- An epigraph is a short introduction, typically a quotation, at the beginning of a document or component. The epigraph element may include an attribution element -->
  <xsl:element name="div">
    <xsl:attribute name="class">epigraph</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="attribution">
  <xsl:element name="p">
    <xsl:attribute name="class">attribution</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="literallayout">
  <xsl:element name="pre">
    <xsl:attribute name="class">literallayout</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="preface">
  <xsl:element name="section">
    <xsl:attribute name="class">preface</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="partintro">
  <xsl:element name="section">
    <xsl:attribute name="class">partintro</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="colophon">
  <xsl:element name="section">
    <xsl:attribute name="class">colophon</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="part">
  <xsl:element name="section">
    <xsl:attribute name="class">part</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="appendix">
  <xsl:element name="section">
    <xsl:attribute name="class">appendix</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>


<xsl:template match="chapter">
  <xsl:element name="section">
    <xsl:attribute name="class">chapter</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="section">
  <xsl:element name="section">
    <xsl:attribute name="class">section</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="sect1">
  <xsl:element name="section">
    <xsl:attribute name="class">sect1</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="sect2">
  <xsl:element name="section">
    <xsl:attribute name="class">sect2</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="sect3">
  <xsl:element name="section">
    <xsl:attribute name="class">sect3</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="sect4">
  <xsl:element name="section">
    <xsl:attribute name="class">sect4</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="sect5">
  <xsl:element name="section">
    <xsl:attribute name="class">sect5</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="sidebar">
  <xsl:element name="aside">
    <xsl:attribute name="class">sidebar</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>



</xsl:stylesheet>
