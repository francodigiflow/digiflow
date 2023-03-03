<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt">

	<xsl:template name="bottom_hash">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%" class="tipo2">
			<tbody>
				<tr >
					
					<!--<td align="center" width="50%" valign="top">
						
						    <br/>Autorizado mediante resolución N° 0180050002572
							<br/>Representación impresa - <xsl:call-template name="aviso"/>
							<br/>Podrá ser consultada en:
							<br/>http://ecomprobantes.pe/epm
							<br/><br/>
							<img width="50%" align="center">
								<xsl:attribute name="src"><xsl:call-template name="timbre"/></xsl:attribute>
							</img>
					</td>
					<td align="right" width="50%" valign="bottom">
						
						    <br/>
							<img src="logo_iso.jpg"/>
					</td>-->

					<td align="center" width="100%" valign="top" colspan="3">
						
						    <br/>Autorizado mediante resolución N° 0180050002572
							<br/>Representación impresa - <xsl:call-template name="aviso"/>
							<br/>Podrá ser consultada en:
							<br/>http://ecomprobantes.pe/epm
							<br/><br/>
					</td>
				</tr>
				<tr>
					<td align="center" width="33%" valign="top">
					</td>
					<td align="center" width="33%" valign="top">
							<!-- <img align="center" width="140" height="140">
								<xsl:attribute name="src"><xsl:call-template name="timbre"/></xsl:attribute>
							</img> -->
							<img width="100" height="100" align="center" src="data:image/*;base64,[ted_1]" />
					</td>
					<td align="right" width="33%">
						 <img width="180" height="90" src="data:image/*;base64,[logo_2]" />
					</td>
					
				</tr>
				<tr>
					<td colspan="2">
					
					</td>
				</tr>
				<tr>
					
				</tr>
			</tbody>
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