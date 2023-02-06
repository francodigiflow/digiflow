<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi">
<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tbody>
			<tr width="100%">
				<td vAlign="top" width="60%">
					<xsl:call-template name="EncabezadoPeru"/>
				</td>
				<td vAlign="top" width="40%">
					<xsl:call-template name="EncabezadoRecuadro"/>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

	<xsl:template name="EncabezadoPeru">
	<p>
		<table cellSpacing="2" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td width="100%" align="center">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								
								<tr>
									<td align="center">
										<img src="logo_upch.jpg" width="239" height="94"/>
									</td>
									<td align="center">
										<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
											<xsl:value-of select="//cbc:RegistrationName"/>
										</font>
										<!--<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
											<br/><xsl:value-of select="//cbc:Name"/>
										</font> -->
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<!--<br/><xsl:value-of select="//cac:PostalAddress/cbc:StreetName"/>
											<br/><xsl:value-of select="//cac:PostalAddress/cbc:CitySubdivisionName"/>
											<br/><xsl:value-of select="//cac:PostalAddress/cbc:CityName"/>
											&#160;<strong>-</strong>&#160;&#160;<xsl:value-of select="//cac:PostalAddress/cbc:CountrySubentity"/>
											&#160;<strong>-</strong>&#160;&#160;<xsl:value-of select="//cac:PostalAddress/cbc:District"/>-->
											<br/>Sede Principal: Av. Honorio Delgado N° 430 Urb. Ingeniería
											<br/>San Martín de Porres - Lima - Lima
											<br/>Teléfonos: 482-1130 319-0000 319-0030
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>  </td>
				</tr>
			</tbody>
		</table>
	</p>
</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
	<table borderColor="#000000" cellSpacing="0" cellPadding="16" width="100%" align="center" border="1" style="font-size: 18px; font-family: arial,helvetica,sans-serif; color: #000000;">
				<!--	<table borderColor="#000000" cellSpacing="0" cellPadding="5" width="100%" border="1"> -->
						<tbody>
							<tr>
								<td vAlign="top" width="100%" align="center">
									<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">
										
										<strong>R.U.C.: 
											<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">
											<xsl:value-of select="format-number(//cac:AgentParty/cac:PartyIdentification/cbc:ID,'###########','pen')"/>
											<br/>
											<br/>
											<xsl:call-template name="tipodocu"/>
											<br/>
											<xsl:call-template name="NFolio"/>
											</font>
										</strong>
										<br/>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				
</xsl:template>

<xsl:template name="tipodocu">
	<!--<xsl:choose>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
			<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">FACTURA ELECTRONICA</font>
		</xsl:when>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRONICA</font></xsl:when>
		<xsl:otherwise>
			
		</xsl:otherwise>
	</xsl:choose>-->
	<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
		COMPROBANTE DE RETENCIÓN ELECTRÓNICO
	</font>
</xsl:template>

<xsl:template name="NFolio">
	<br/>Nº 
	
	<!--<xsl:value-of select="pe:Retention/cbc:ID"/>-->

<xsl:if test="/pe:Retention">
		<xsl:value-of select="substring-before(/pe:Retention/cbc:ID,'-')"/>- 
		<xsl:value-of select="format-number(substring-after(/pe:Retention/cbc:ID,'-'),'00000000')"/>
	</xsl:if>

</xsl:template>
<xsl:template match="/">
	<html><head></head>
		<body/>
	</html>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->