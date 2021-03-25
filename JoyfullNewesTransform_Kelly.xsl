<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0" xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:template match="/"><xsl:apply-templates></xsl:apply-templates></xsl:template>
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:front">
        <div class="frontmatter"><xsl:apply-templates></xsl:apply-templates></div>
    </xsl:template>
    <xsl:template match="tei:body">
        <body><xsl:apply-templates></xsl:apply-templates></body>
    </xsl:template>
    <xsl:template match="tei:p">
        <p><xsl:apply-templates></xsl:apply-templates></p>
    </xsl:template>
    <xsl:template match="tei:choice"><span class="choice"> 
        <xsl:apply-templates/>
    </span></xsl:template>
    <xsl:template match="tei:choice/tei:orig"><a class="orig"><xsl:value-of select="text()"/></a></xsl:template>
    <xsl:template match="tei:choice/tei:reg"><a class="reg"><xsl:value-of select="text()"/></a></xsl:template>
    <xsl:template match="tei:hi">
     <xsl:choose>
        <xsl:when test="@rend='DIC'"><span style="text-transform:uppercase; font-size:200%;"><xsl:apply-templates></xsl:apply-templates></span></xsl:when>
         <xsl:when test="@rend='italics'"><em><xsl:apply-templates></xsl:apply-templates></em></xsl:when>
     </xsl:choose>
    </xsl:template>
<xsl:template match="tei:salute">
    <p class="salute"><xsl:apply-templates></xsl:apply-templates></p>
</xsl:template>
    <xsl:template match="tei:div">
        <div><xsl:apply-templates></xsl:apply-templates></div>
    </xsl:template>
    <xsl:template match="tei:name">
        <xsl:choose>
            <xsl:when test="@rend='italics'"><name><xsl:apply-templates></xsl:apply-templates></name></xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:placeName"> <!-- what happens when a placename is italicized but the element doesnt exist in HTML? -->
        <xsl:choose>
            <xsl:when test="@rend='italics'"><em><xsl:apply-templates></xsl:apply-templates></em></xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>