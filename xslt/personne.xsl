<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude"
    exclude-result-prefixes="tei xi">

    <xsl:output method="text" encoding="UTF-8"/>

    <!-- Point d'entrée : le fichier master -->
    <xsl:template match="/master">
        <xsl:text>INSERT INTO `personne` (`idPersonne`, `nom`, `description`)&#10;</xsl:text>
        <xsl:text>VALUES&#10;</xsl:text>
        <xsl:apply-templates select=".//tei:TEI"/>
        <xsl:text>ON DUPLICATE KEY UPDATE idPersonne = VALUES(idPersonne); </xsl:text>
    </xsl:template>

    <!-- INSERT INTO `personne` (`idPersonne`, `nom`, `description`)
         VALUES ('AlbertCamus', 'Albert Camus', 'auteur') -->

    <!-- Pour chaque lettre TEI -->
    <xsl:template match="tei:TEI">
        <xsl:for-each select=".//tei:persName">
            <xsl:text>                       ('</xsl:text>
            <xsl:choose>
                <xsl:when test="not(@xml:id) or @xml:id = ''">
                    <xsl:value-of select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@xml:id"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>', '</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>', '</xsl:text>
            <xsl:text>auteur</xsl:text>
            <xsl:text>'),&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
