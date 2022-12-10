<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:DespatchAdvice-1" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2">

	<xsl:template name="bottom_normal">
		<table border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					falta
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="bottom_hash">
		<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td valign="baseline" width="100%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
						Representación impresa de la Guía de Remisión Electrónico
							<br/>Podrá ser consultado en http://www.ecomprobantes.pe/MAF
							<!--<br/>
							<strong>Valor Resumen :</strong>
							<xsl:value-of select="//ds:DigestValue"/>-->
						</font>
					</td>
					
				</tr>
				
			</tbody>
		</table>
	</xsl:template>

<xsl:template name="imp_timbre">
        <table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
            <tr align="center">
                <td width="100%" align="center">
                    <table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%" height="60">
                        <tr align="center">
                            <td valign="top" align="center" height="108">
                                <font face="Arial" size="1">
                                    <img height="100" width="100">
                                        <xsl:attribute name="src">
                                            <xsl:call-template name="timbre"/>
                                        </xsl:attribute>
                                    </img>
                                    <!-- <img width="100" height="100" align="center" src="data:image/*;base64,[ted_1]" /> -->
                                </font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </xsl:template>


	<xsl:template name="timbre">  
		<xsl:value-of select="'.jpg'"/>-->
		<xsl:value-of select=" substring(//cac:Signature/cac:DigitalSignatureAttachment/cac:ExternalReference/cbc:URI,1,12)"/>
		<xsl:value-of select="'09'"/>
		<xsl:value-of select=" substring(//cac:Signature/cac:DigitalSignatureAttachment/cac:ExternalReference/cbc:URI,12,20)"/>
		<xsl:value-of select="'.jpg'"/>      
        <xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
        <xsl:value-of select="'.jpg'"/>
    </xsl:template>

	 <xsl:template name="nombreTed">
        <xsl:param name="text"/>
        <xsl:param name="largo" select="0"/>
        <xsl:variable name="largo_actual" select="string-length($text)"/>
        <xsl:choose>
            <xsl:when test="$largo_actual &gt;= $largo">
                <xsl:value-of select="$text"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="prefix" select="concat('0', $text)"/>
                <xsl:call-template name="nombreTed">
                    <xsl:with-param name="text" select="$prefix"/>
                    <xsl:with-param name="largo" select="$largo"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->