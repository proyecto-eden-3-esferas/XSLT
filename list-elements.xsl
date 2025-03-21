<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="glossary-elements.xsl"/>

<xsl:template match="bibliography">
  <xsl:element name="ul">
    <xsl:attribute name="class">bibliography</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>


<xsl:template match="term">
  <xsl:element name="dt">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="listitem">
  <xsl:element name="dd">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="itemizedlist">
  <xsl:element name="ul">
    <xsl:attribute name="class">itemizedlist</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>


<xsl:template match="orderedlist">
  <xsl:element name="ol">
    <xsl:attribute name="class">orderedlist</xsl:attribute>
    <xsl:apply-templates select="*"/>
  </xsl:element>
</xsl:template>
<xsl:template match="orderedlist[@continuation='continues']">
  <xsl:element name="ol">
    <xsl:attribute name="class">continued-orderedlist</xsl:attribute>
    <xsl:apply-templates select="*"/>
  </xsl:element>
</xsl:template>


<xsl:template match="variablelist">
  <xsl:element name="dl">
    <xsl:attribute name="class">variablelist</xsl:attribute>
    <xsl:for-each select="varlistentry">
      <xsl:apply-templates select="*"/>
    </xsl:for-each>
  </xsl:element>
</xsl:template>


<!--
The qandaset element is suitable for FAQs (Frequently Asked Questions) and other
similar collections of questions and answers. Each qandaentry contains a question and
its answer(s). The set of questions and answers can be divided into sections with
qandadiv.
-->
<xsl:template match="qandaset[qandadiv]">
  <xsl:element name="section">
    <xsl:attribute name="class">qandaset</xsl:attribute>
    <xsl:for-each select="qandadiv">
      <xsl:apply-templates select="*|@*|text()|comment()"/>
      <xsl:if test="position() &lt; last()">
        <xsl:element name="hr"/>
        <xsl:element name="hr"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:element>
</xsl:template>
<xsl:template match="qandaset">
  <xsl:element name="section">
    <xsl:element name="dl">
      <xsl:for-each select="qandaentry">
        <xsl:apply-templates select="*|@*|text()|comment()"/>
        <xsl:if test="position() &lt; last()"><xsl:element name="hr"/></xsl:if>
      </xsl:for-each>
    </xsl:element>
  </xsl:element>
</xsl:template>
<xsl:template match="qandadiv">
  <xsl:element name="dl">
    <xsl:attribute name="class">qandadiv</xsl:attribute>
    <xsl:for-each select="qandaentry">
      <xsl:apply-templates select="*|@*|text()|comment()"/>
      <xsl:if test="position() &lt; last()"><xsl:element name="hr"/></xsl:if>
      </xsl:for-each>
  </xsl:element>
</xsl:template>
<xsl:template match="qandaentry">
  <!--<xsl:number select="position()"/> of <xsl:number select="last()"/>-->
  <xsl:apply-templates select="*|@*|text()|comment()"/>
</xsl:template>
<xsl:template match="question">
  <xsl:element name="dt">
    <xsl:attribute name="class">question</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="answer">
  <xsl:element name="dd">
    <xsl:attribute name="class">answer</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>


<!--
Procedures and tasks
====================
A procedure contains steps, which may contain substeps or stepalternatives.
-->
<xsl:template match="procedure">
  <xsl:element name="div">
    <xsl:attribute name="class">procedure</xsl:attribute>
    <xsl:apply-templates select="title | info | bridgehead"/>
    <xsl:if test="step">
      <xsl:element name='ol'>
        <xsl:for-each select='step'>
          <!--<xsl:call-template name="procedurestep"/>-->
          <xsl:element name="li">
            <xsl:apply-templates select="*"/>
          </xsl:element>
        </xsl:for-each>
      </xsl:element>  <!-- close HTML element ol -->
    </xsl:if>
  </xsl:element>  <!-- close HTML element div -->
</xsl:template>

<xsl:template match="step">
  <xsl:element name='li'>
    <xsl:attribute name="class">step</xsl:attribute>
    <xsl:apply-templates select="*"/>
  </xsl:element>
</xsl:template>
<xsl:template match="substeps">
  <xsl:element name='ol'>
    <xsl:attribute name="class">substeps</xsl:attribute>
    <xsl:apply-templates select="*"/>
  </xsl:element>
</xsl:template>

<!--
The task element is a wrapper around the procedure element that provides additional, optional elements, including tasksummary, taskprerequisites, example, and taskrelated.
-->
<xsl:template match="task">
  <xsl:element name="div">
    <xsl:attribute name="class">task</xsl:attribute>

  </xsl:element>
</xsl:template>
<xsl:template match="tasksummary">
  <xsl:element name="div">
    <xsl:attribute name="class">tasksummary</xsl:attribute>
  </xsl:element>
</xsl:template>
<xsl:template match="taskprerequisites">
  <xsl:element name="div">
    <xsl:attribute name="class">taskprerequisites</xsl:attribute>
  </xsl:element>
</xsl:template>
<xsl:template match="example">
  <xsl:element name="div">
    <xsl:attribute name="class">examplek</xsl:attribute>
  </xsl:element>
</xsl:template>
<xsl:template match="taskrelated">
  <xsl:element name="div">
    <xsl:attribute name="class">taskrelated</xsl:attribute>
  </xsl:element>
</xsl:template>


</xsl:stylesheet>
