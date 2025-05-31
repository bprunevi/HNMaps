<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    exclude-result-prefixes="tei xi">
    
    <xsl:output method="html" encoding="UTF-8"/>
    
    <!-- Point d'entrée : le fichier master -->
    <xsl:template match="/master">
        <xsl:text>INSERT INTO `lettres` (`idLettre`, `dateEnvoi`, `titre`, `contenu`)&#10;</xsl:text>
        <xsl:text>VALUES&#10;</xsl:text> 
        <xsl:apply-templates select=".//tei:TEI"/>
        <xsl:text>ON DUPLICATE KEY UPDATE idLettre = VALUES(idLettre); </xsl:text>
    </xsl:template>
    
    <!-- INSERT INTO `lettres` (`idLettre`, `dateEnvoi`, `titre`, `contenu`) 
         VALUES ('222', '1855-07-22', 'A Elie Reclus, chez Lady O. Sparron, Bampton Park, Huntingdon. Londres, 2 mars 1852', 'CONTENU') -->
    
    <!-- Pour chaque lettre TEI -->
    <xsl:template match="tei:TEI">

        <xsl:text>                      ('</xsl:text>
        <xsl:value-of select="@xml:id"/>
        <xsl:text>', '</xsl:text>
        <xsl:for-each select='.//tei:date'>
        <xsl:choose>
            <xsl:when test="string-length(@when) = 10">
                <xsl:value-of select="@when"/>
            </xsl:when>
            <xsl:when test="string-length(@when) = 7">
                <xsl:value-of select="@when"/>
                <xsl:text>-01</xsl:text>
            </xsl:when>
            <xsl:when test="string-length(@when) = 4">
                <xsl:value-of select="@when"/>
                <xsl:value-of select=".//tei:date/@when"/>
                <xsl:text>-01-01</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <!--<xsl:text>ERROR</xsl:text>-->
                <xsl:text>1900-01-01</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:for-each>
        <xsl:text>', '</xsl:text>
        <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
        <xsl:text>', '</xsl:text>
        <!--<xsl:value-of select="translate(.//tei:body, '''', '’')"/>-->
        <xsl:for-each select=".//tei:p">
            <xsl:element name="p">
                <xsl:apply-templates select="translate('.', '''', '’')"/>
            </xsl:element>
        </xsl:for-each>
        <xsl:text>'),&#10;</xsl:text>
<!--
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Titre : </xsl:text>
        <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
        <xsl:text>&#10;</xsl:text>

        <xsl:value-of select=".//tei:date/@when"/>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Lieu d’envoi : </xsl:text>
        <xsl:value-of select=".//tei:placeName[@type='sender']"/>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Destinataire : </xsl:text>
        <xsl:value-of select=".//tei:persName[@type='recipient']"/>
        <xsl:value-of select=".//tei:persName/@xml:id"/>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Expéditeur : </xsl:text>
        <xsl:choose>
            <xsl:when test=".//tei:persName[@type='sender']">
                <xsl:value-of select=".//tei:persName[@type='sender']"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select=".//tei:persName[last()]"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>&#10;&#10;</xsl:text>
        -->
    </xsl:template>
    
</xsl:stylesheet>