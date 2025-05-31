<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude"
    exclude-result-prefixes="tei xi">

    <xsl:output method="text" encoding="UTF-8"/>

    <!-- Point d'entrée : le fichier master -->
    <xsl:template match="/master">
        <!--<xsl:text>                               </xsl:text>-->
        <xsl:text>INSERT INTO `mention_lieu` (`idLettre`, `idLieu`, `qualite`)&#10;</xsl:text>
        <xsl:text>VALUES&#10;</xsl:text>
        <xsl:apply-templates select=".//tei:TEI"/>
        <xsl:text>ON DUPLICATE KEY UPDATE idLieu = VALUES(idLieu); </xsl:text>
    </xsl:template>

    <!-- INSERT INTO `mention_personne` (`idLettre`, `idPersonne`, `qualite`)
         VALUES ('100', 'ParentsReclus', 'lesdeux'),
                ('101', 'ElieReclus', 'destinataire'),
                ('102', 'PereReclus', 'mention')                                 -->

    <!-- Pour chaque lettre TEI -->
    <xsl:template match="tei:TEI">
        <xsl:for-each select=".//tei:placeName">
            <xsl:text>                               </xsl:text>
            <xsl:text>('</xsl:text>
            <xsl:value-of select="./ancestor::tei:TEI/@xml:id"/>
            <xsl:text>', '</xsl:text>
            <xsl:value-of select="translate(@xml:id, '''', 'x')"/>
            <xsl:text>', '</xsl:text>
            <xsl:choose>
                <xsl:when test="@type = 'sender'">
                    <xsl:text>mention</xsl:text>
                </xsl:when>
                <xsl:when test="@type = 'mention'">
                    <xsl:text>mention</xsl:text>
                </xsl:when>
                <xsl:when test="@type = 'receiver'">
                    <xsl:text>reception</xsl:text>
                </xsl:when>
                <xsl:when test="@type = 'lesdeux'">
                    <xsl:text>lesdeux</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ERROR : </xsl:text>
                    <xsl:value-of select="@type"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>'),&#10;</xsl:text>
            <!--<xsl:text>                               </xsl:text>-->
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
