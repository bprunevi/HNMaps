<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    exclude-result-prefixes="tei xi">
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <!-- Point d'entrée : le fichier master -->
    <xsl:template match="/master">
        <xsl:text>INSERT INTO `lieu` (`idLieu`, `description`, `coordonnees`)&#10;</xsl:text>
        <xsl:text>VALUES&#10;</xsl:text> 
        <xsl:apply-templates select=".//tei:TEI"/>
        <xsl:text>ON DUPLICATE KEY UPDATE idLieu = VALUES(idLieu); </xsl:text>
    </xsl:template>
    
    <!-- INSERT INTO `lieu` (`idLieu`, `description`, `coordonnees`)
         VALUES ('NouvelleOrleans', 'Nouvelle-Orléans', '13.404954, 52.520007') -->
    
    <!-- Pour chaque lettre TEI -->
    <xsl:template match="tei:TEI">
        <xsl:for-each select=".//tei:placeName">
            <xsl:text>                   </xsl:text>
            <xsl:text>('</xsl:text>
            <xsl:value-of select="translate(@xml:id, '''', 'x')"/>
            <xsl:text>', '</xsl:text>
            <xsl:value-of select="translate(., '''', 'x')"/>
            <xsl:text>', '</xsl:text>
            <xsl:text>0.00000, 0.00000</xsl:text>
            <xsl:text>'),&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>