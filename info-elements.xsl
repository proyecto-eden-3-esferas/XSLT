<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="authorship-elements.xsl"/>

<!--
An info can contain:
title
  The text of the title of a section of a document or of a formal block-level element
titleabbrev
  The abbreviation of a title
subtitle
  The subtitle of a document
abstract
  A summary
address
  A real-world address, generally a postal address
annotation
  An annotation
artpagenums
  The page numbers of an article as published
author
  The name of an individual author
authorgroup
  A wrapper for author information when a document has multiple authors or collaborators
authorinitials
  The initials or other short identifier for an author

bibliocoverage
  The spatial or temporal coverage of a document
biblioid
  An identifier for a document
bibliomisc
  Untyped bibliographic information
bibliomset
  A cooked container for related bibliographic information
bibliorelation
  The relationship of a document to another
biblioset
  A raw container for related bibliographic information
bibliosource
  The source of a document

collab
  Identifies a collaborator
confgroug
  A wrapper for document meta-information about a conference

contractnum
  The contract number of a document
contractsponsor
  The sponsor of a contract
copyright
  Copyright information about a document
date
  The date of publication or revision of a document
edition
  The name or number of an edition of a document
editor
  The name of the editor of a document
extendedlink
  An XLink extended link
issuenum
  The number of an issue of a journal

itermset
  A set of index terms in the meta-information of a document
keywordset
  A set of keywords describing the content of a document

legalnotice
  A statement of legal obligations or requirements
mediaobject
  A displayed media object (video, audio, image, etc.)
orgname
  The name of an organization
othercredit
  A person or entity, other than an author or editor, credited in a document
pagenums
  The numbers of the pages in a book, for use in a bibliographic entry
printhistory
  The printing history of a document
productname
  The formal name of a product
productnumber
  A number assigned to a product

pubdate
  The date of publication of a document
publisher
  The publisher of a document
publishername
  The name of the publisher of a document
releaseinfo
  Information about a particular release of a document
revhistory
  A history of the revisions to a document
seriesvolnums
  Numbers of the volumes in a series of books
subjectset
  A set of terms describing the subject matter of a document
volumenum
  The volume number of a document in a set (as of books in a set or articles in a journal)

The title, titleabbrev, and subtitle elements can usually appear either immediately
before or inside the info wrapper (but not both). This means you don’t need the extra
wrapper in the common case where all you want to specify is a title.
-->

<!-- Default templates for elements title and subtitle -->
<xsl:template match="title">
  <xsl:element name="h4">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="subtitle">
  <xsl:element name="h5">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="titleabbrev"/>

<xsl:template match="part/title | part/info/title | book/title | book/info/title | article/title | article/info/title">
  <xsl:element name="h1">
    <!--<xsl:message>Local name is: <xsl:value-of select="local-name()"/></xsl:message>-->
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="subtitle">
  <xsl:element name="h2">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="chapter/title | chapter/info/title | preface/title | preface/info/title | appendix/title | appendix/info/title">
  <xsl:element name="h2">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="chapter/subtitle | chapter/info/subtitle">
  <xsl:element name="h3">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="chapter/section/title | chapter/section/info/title | sect1/title | sect1/info/title">
  <xsl:element name="h3">
    <!--<xsl:attribute name="class">section</xsl:attribute>-->
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="chapter/section/subtitle | chapter/section/info/subtitle | sect1/subtitle | sect1/info/subtitle">
  <xsl:element name="h4">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>


<xsl:template match="chapter/*/*/title | chapter/*/*/info/title">
  <xsl:element name="h4">
    <!--<xsl:attribute name="class">subsection-or-sec1</xsl:attribute>-->
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="chapter/*/*/subtitle | chapter/*/*/info/subtitle">
  <xsl:element name="h5">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>




<xsl:template match="chapter/bridgehead | chapter/info/bridgehead">
  <xsl:element name="h3">
    <xsl:attribute name="class">bridgehead</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="chapter/*/bridgehead | chapter/*/info/bridgehead">
  <xsl:element name="h4">
    <xsl:attribute name="class">bridgehead</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="chapter/*/*/bridgehead | chapter/*/*/info/bridgehead">
  <xsl:element name="h5">
    <xsl:attribute name="class">bridgehead</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>
<xsl:template match="//bridgehead">
  <xsl:element name="h5">
    <xsl:attribute name="class">bridgehead</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>



<xsl:template match="abstract">
  <xsl:element name="div">
    <xsl:attribute name="class">abstract</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="keywordset">
  <xsl:element name="h3">
    <xsl:attribute name="class">keywords-header</xsl:attribute>
    <xsl:text>keywords: </xsl:text>
  </xsl:element>
  <xsl:element name="ul">
    <xsl:attribute name="class">keywordset</xsl:attribute>
    <xsl:for-each select="keyword">
      <xsl:text>
</xsl:text>
      <xsl:element name="li">
        <xsl:value-of select="."/>
      </xsl:element>
    </xsl:for-each>
  </xsl:element>
</xsl:template>

<!-- A subjectset is a container for a set of subjects.
     All of the subjects within a subject set should come from the same controlled vocabulary.

     A document can be described using terms from more than one controlled vocabulary.
     In order to do this, you should use the 'scheme' attribute to distinguish between controlled vocabularies.

     A “subject” categorizes or describes the topic of a document, or section of a document.
     In DocBook, a subject is defined by the subjectterms that it contains.

     Subject terms should be drawn from a controlled vocabulary,
     such as the Library of Congress Subject Headings.
-->

<xsl:template match="subjectterm">
  <xsl:value-of select='.'/>
  <!--<xsl:text>; </xsl:text>
  <xsl:if test='position() != last'>
    <xsl:text>; </xsl:text>
  </xsl:if>-->
</xsl:template>
<xsl:template match="subject">
  <xsl:element name='li'>
    <xsl:for-each select='subjectterm'>
      <xsl:apply-templates select="*|@*|text()|comment()"/>
      <xsl:if test='position() != last()'>
        <xsl:text>; </xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:element>
</xsl:template>
<xsl:template match="subjectset">
  <xsl:element name="h3">
    <xsl:attribute name="class">subjectset-header</xsl:attribute>
    <xsl:text>Subject sets:</xsl:text>
  </xsl:element>
  <xsl:element name="ul">
    <xsl:attribute name="class">subjectset</xsl:attribute>
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>  <!-- close 'ul' element -->
</xsl:template>


<xsl:template match="info">
  <xsl:element name="header">
    <xsl:apply-templates select="*|@*|text()|comment()"/>
  </xsl:element>
</xsl:template>



</xsl:stylesheet>
