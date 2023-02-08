<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2">

	<xsl:template name="bottom_normal">
		<table border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td valign="baseline" width="60%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0">
							<br/>/&gt;
							<strong>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='08'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="pe:Valor"/>
										</font>
									</xsl:if>
									<xsl:if test="pe1:Codigo='08'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="pe1:Valor"/>
										</font>
									</xsl:if>
									<xsl:if test="pe2:Codigo='08'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="pe2:Valor"/>
										</font>
									</xsl:if>
								</xsl:for-each>
							</strong>
						</font>
					</td>
					<td valign="top" width="10%" align="center"/>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="bottom_hash">
	<br/>
		<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td valign="baseline" width="100%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">Representación impresa del Comprobante de Percepción Electrónico
							<br/>Podrá ser consultado en www.ecomprobantes.pe/industrias
							<br/>Autorizado mediante Resolución de Intendencia N° 0180050003363/SUNAT
							<!--<br/>
							<strong>Valor Resumen :</strong>
							<xsl:value-of select="//ds:DigestValue"/>--></font>
					</td>
					
				</tr>
				<tr>
					<td width="100%">
						<xsl:call-template name="imp_timbre"/>
					</td>
				</tr>
				
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="imp_timbre">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tr>
				<td width="40%" align="right">
					<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
						<tr>
						<!--	<td valign="top" align="center">
								<font face="Arial" size="2">
									<img>
										<xsl:attribute name="src">
											<xsl:call-template name="timbre"/>
										</xsl:attribute>
									</img>
								</font>
							</td> -->
							<td align="left">
							<font color="#000000" size="1.5" face="Arial, Helvetica, sans-serif">
							
							</font>
							<br/>
							<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
							
							</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	

	<xsl:template name="timbre">
		
		
		<xsl:value-of select="pe:Invoice/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
		<xsl:value-of select="pe1:CreditNote/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:Documento/pe1:Nombre"/>
		<xsl:value-of select="pe2:DebitNote/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:Documento/pe2:Nombre"/>
		<xsl:value-of select="'.jpg'"/>
	</xsl:template>

	<xsl:template name="nombreTed">
		<xsl:param name="text"/>
		<xsl:param name="largo" select="0"/>
		<xsl:variable name="largo_actual" select="string-length($text)"/>
		<xsl:choose>
			<xsl:when test="$largo_actual >= $largo">
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