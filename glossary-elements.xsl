<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--

<glossary xmlns='http://docbook.org/ns/docbook'>
  <title>Example Glossary</title>
  <para>This is not a real glossary, it's just an example.</para>
  ...
  <glossdiv>
    <title>E</title>
    <glossentry xml:id="xml">
      <glossterm>Extensible Markup Language</glossterm>
      <acronym>XML</acronym>
      <glossdef>
        <para>Some reasonable definition here.</para>
        <glossseealso otherterm="sgml">SGML</glossseealso>
      </glossdef>
    </glossentry>
  </glossdiv>
  ...
  <glossdiv>
    <title>S</title>
    <glossentry>
      <glossterm>SGML</glossterm>
      <glosssee otherterm="sgml"/>
    </glossentry>
    <glossentry xml:id="sgml">
      <glossterm>Standard Generalized Markup Language</glossterm>
      <acronym>SGML</acronym>
      <abbrev>ISO 8879:1986</abbrev>
      <glossdef>
        <para>Some reasonable definition here.</para>
        <glossseealso otherterm="xml">XML</glossseealso>
      </glossdef>
    </glossentry>
  </glossdiv>

</glossary>

-->

<xsl:template match="glossary">
  <xsl:element name="dl">
    <xsl:attribute name="class">glossary</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="glossary/title">
  <xsl:element name="h3">
    <xsl:attribute name="class">glossary-title</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="glossdiv">
  <xsl:element name="section">
    <xsl:attribute name="class">glossdiv</xsl:attribute>
    <xsl:element name="dl">
      <xsl:attribute name="class">glossdiv-dl</xsl:attribute>
      <xsl:for-each select="glossentry">
        <xsl:element name="div">
          <xsl:attribute name="class">glossentry</xsl:attribute>
          <xsl:apply-templates select="glossterm"/>
          <xsl:element name="dd">
            <xsl:attribute name="class">glossentry-body</xsl:attribute>
            <xsl:apply-templates select="acronym | abbrev | indexing-inlines | glossdef | glosssee"/>
          </xsl:element>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:element>
</xsl:template>

<xsl:template match="glossterm">
  <xsl:element name="dt">
    <xsl:attribute name="class">glossterm</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="glossdef">
  <xsl:element name="div">
    <xsl:attribute name="class">glossdef</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="glosssee">
  <xsl:element name="p">
    <xsl:attribute name="class">glosssee</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="glossseealso">
  <xsl:element name="p">
    <xsl:attribute name="class">glossseealso</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="glosslist">
  <xsl:element name="dl">
    <xsl:attribute name="class">glosslist</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>
