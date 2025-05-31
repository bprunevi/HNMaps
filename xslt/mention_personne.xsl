<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude"
    exclude-result-prefixes="tei xi">

    <xsl:output method="text" encoding="UTF-8"/>

    <!-- Point d'entrée : le fichier master -->
    <xsl:template match="/master">
        <xsl:text>INSERT INTO `mention_personne` (`idLettre`, `idPersonne`, `qualite`)&#10;</xsl:text>
        <xsl:text>VALUES&#10;</xsl:text>
        <xsl:apply-templates select=".//tei:TEI"/>
        <xsl:text>ON DUPLICATE KEY UPDATE idPersonne = VALUES(idPersonne); </xsl:text>
    </xsl:template>

    <!-- INSERT INTO `mention_lieu` (`idLettre`, `idLieu`, `qualite`)
         VALUES ('100', 'Berlin', 'reception'),
                ('101', 'NouvelleOrleans', 'mention'),
                ('102', 'Espagne', 'lesdeux')                                 -->

    <!-- Pour chaque lettre TEI -->
    <xsl:template match="tei:TEI">
        <xsl:for-each select=".//tei:persName">
            <xsl:text>('</xsl:text>
            <xsl:value-of select="./ancestor::tei:TEI/@xml:id"/>
            <xsl:text>', '</xsl:text>
            <xsl:choose>
                <xsl:when test="not(@xml:id) or @xml:id = ''">
                    <xsl:value-of select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@xml:id"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>', '</xsl:text>
            <xsl:choose>
                <xsl:when test="@type = 'mention'">
                    <xsl:text>mention</xsl:text>
                </xsl:when>
                <xsl:when test="@type = 'recepteur'">
                    <xsl:text>destinataire</xsl:text>
                </xsl:when>
                <xsl:when test="@type = 'lesdeux'">
                    <xsl:text>lesdeux</xsl:text>
                </xsl:when>
                <xsl:when test="@type = 'emetteur'">
                    <xsl:text>mention</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>mention</xsl:text>
                    <xsl:value-of select="@type"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>'),&#10;                               </xsl:text>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
