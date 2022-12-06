<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2">

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

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->