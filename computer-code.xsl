<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


<xsl:template match="varname">
  <xsl:element name="var">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="classname">
  <xsl:element name="var">
    <xsl:attribute name="class">classname</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="methodname">
  <xsl:element name="var">
    <xsl:attribute name="class">methodname</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="methodparam">
  <xsl:element name="var">
    <xsl:attribute name="class">methodparam</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="userinput">
  <xsl:element name="kbd">
    <xsl:attribute name="class">userinput</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="computeroutput">
  <xsl:element name="samp">
    <xsl:attribute name="class">computeroutput</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>


<xsl:template match="programlisting">
  <xsl:element name="code">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>



<!--
Synopses
========
DocBook provides a number of elements for describing command, function, and class synopses:
cmdsynopsis
  A syntax summary for a software command. A cmdsynopsis contains arg, command, and group elements. For long synopses, the sbr tag can be used to indicate where a break should occur. Complex synopses can be composed from synopfragments.
funcsynopsis
  The syntax summary for a function definition. A function synopsis consists of one or more funcprototypes and may include additional, literal information in a funcsynopsisinfo. Each prototype consists of modifiers, a funcdef, and a collection of paramdef, varargs, and/or void elements.
classsynopsis
  The syntax summary for a class definition. A class synopsis consists of one or more ooclass, ooexception, or oointerface elements followed by zero or more constructorsynopsis, destructorsynopsis, fieldsynopsis, and methodsynopsis elements.
  Like funcsynopsis, it may include additional, literal information, in this case, in a classsynopsisinfo.
-->
<xsl:template match="cmdsynopsis">
  <xsl:element name="div">
  <xsl:attribute name="class">cmdsynopsis</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="funcsynopsis">
  <xsl:element name="div">
  <xsl:attribute name="class">funcsynopsis</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="classsynopsis">
  <xsl:element name="div">
  <xsl:attribute name="class">classsynopsis</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>


</xsl:stylesheet>
