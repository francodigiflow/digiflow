<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt">

	<xsl:template name="bottom_hash">
		<table border="0" bordercolor="#000000" cellpadding="1" cellspacing="2" width="100%"
		style="border-collapse:separate;
						border:solid #2F528F 2px;
						 border-radius:6px;
					   -moz-border-radius:6px;">
			<tbody>
				<tr>
					<td width="100%" >
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td align="left" valign="center">
										<table cellSpacing="" cellPadding="0" width="75%" border="0" >
												<font face="Arial, Helvetica, sans-serif" size="1">
														<b> Sello digital emisor:</b> <xsl:value-of select="//ds:DigestValue"/>
												</font>
										</table>
									</td>
									<td align="right">
										<table cellSpacing="0" cellPadding="0" width="100%" border="0">
											<xsl:call-template name="imp_timbre"/>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>

	</xsl:template>

	<xsl:template name="bottom_final">
		<table border="0" bordercolor="#000000" cellpadding="1" cellspacing="2" width="100%">
			<tbody>
				<tr>
					<td width="100%" >
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td valign="top" width="70%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
										<br/>
											Representacion impresa de la factura Electrónica. 
											<br/>
											consulte en <a href="https://facturacion.ecomprobantes.pe/SCANIA" 
											target="_blank"> https://facturacion.ecomprobantes.pe/SCANIA</a>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="imp_timbre">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tr>
				<td width="100%" align="right">
					<font face="Arial" size="0.5">
						<img width="100" height="100" align="center" src="data:image/*;base64,[ted_1]" />
					</font>
				</td>
				
			</tr>
			<tr>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="timbre">
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:Documento/pe1:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:Documento/pe2:Nombre"/>
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\par" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->