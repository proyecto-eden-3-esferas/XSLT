<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--
A replaceable is used to mark text that describes what a user is supposed to enter,
but not the actual text that the user is supposed to enter.

It is used to identify a class of object in the document, in which the user is expected to
replace the text that identifies the class with some specific instance of that class. A
canonical example is:

  <replaceable>filename</replaceable>
in which the user is expected to provide the name of some specific file to replace the text “filename.”

Its attribute 'class' identifies the nature of the replaceable text,
and takes values: "command", "function", "option", and "parameter".
-->
<xsl:template match="replaceable">
  <xsl:element name="em">
    <xsl:attribute name="class">replaceable</xsl:attribute>
    <xsl:attribute name="nature"><xsl:value-of select="@class"/></xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="emphasis | italics">
  <xsl:element name="em">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="subscript">
  <xsl:element name="sub">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="superscript">
  <xsl:element name="sup">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="firstterm">
  <xsl:element name="dfn">
    <xsl:attribute name="class">firstterm</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="wordasword">
  <xsl:element name="em">
    <xsl:attribute name="class">wordasword</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>


<xsl:template match="acronym">
  <xsl:element name="abbr">
    <xsl:attribute name="class">acronym</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="abbrev">
  <xsl:element name="abbr">
    <xsl:attribute name="class">abbrev</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="orgname">
  <xsl:element name="span">
    <xsl:attribute name="class">orgname</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="quote">
  <xsl:element name="q">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="citetitle">
  <xsl:element name="cite">
    <xsl:attribute name="class">citetitle</xsl:attribute>
    <!--
    <xsl:if test="@class">
      <xsl:attribute name="fileclass"><xsl:value-of select="@class"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="@path">
      <xsl:attribute name="path"     ><xsl:value-of select= "@path"/></xsl:attribute>
    </xsl:if>
    -->
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<!--
A filename is the name of a file on a local or network disk.
It may be a simple name or may include a path or other elements specific to the operating system.

Attribute 'class' identifies the class of filename = “devicefile” | “directory” | “extension” | “headerfile” (as for a programming language) | “libraryfile” | “partition” | “symlink”, and

Attribute 'path' specifies the path of the filename
-->
<xsl:template match="filename">
  <xsl:element name="cite">
    <xsl:attribute name="class">filename</xsl:attribute>
    <xsl:if test="@class">
      <xsl:attribute name="fileclass"><xsl:value-of select="@class"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="@path">
      <xsl:attribute name="path"     ><xsl:value-of select= "@path"/></xsl:attribute>
    </xsl:if>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="filename[@class]">
  <xsl:element name="cite">
    <xsl:attribute name="class">filename-<xsl:value-of select="@class"/></xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>
