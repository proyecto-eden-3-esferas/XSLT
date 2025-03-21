<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Take:

<mediaobject>
  <imageobject>
    <imagedata format='JPEG' fileref='my_image.jpg'/>
  </imageobject>
</mediaobject>

to be substituted for by:

<img src="my_image.jpg"
     alt="an image">
  <caption>My image</caption>
</img>

-->

<xsl:template match="caption">
  <xsl:element name="h3">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<!--
audioobject
A wrapper for audio data and its associated meta-information. (Which contains
audiodata.)

imageobject
A wrapper for image data and its associated meta-information. (Which contains
imagedata.)

imageobjectco
A wrapper for an image object with callouts. (Which contains imagedata and
callout-related information).

videoobject
A wrapper for video data and its associated meta-information. (Which contains
videodata.)

textobject
A wrapper for a text description of an object and its associated meta-information.
(Which contains textdata.)
-->


<xsl:template match="mediaobject | imageobject | audioobject | videoobject | textobject" >
  <xsl:apply-templates select="*|@*|text()|comment()"/>
</xsl:template>
<xsl:template match="imagedata">
  <xsl:element name="img">
    <xsl:attribute name="class">imagedata</xsl:attribute>
    <xsl:attribute name="src"><xsl:value-of select="@fileref"/></xsl:attribute>
  </xsl:element>
</xsl:template>



</xsl:stylesheet>
