<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Perception-1" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
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
									<td vAlign="top" align="center" rowspan="2" width="22%">
										<img src="logo_industrias.jpg" width="115" height="155"/>
									</td>
									<td align="left" width="78%">
										<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">
											INDUSTRIAS ALIMENTARIAS
										</font>
										<font color="#000000" size="3.5" face="Arial, Helvetica, sans-serif">
											S.A.C.
										</font>
										<br/>
										<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
											Av. El Derby  N° 254 Int 1703 Urb. El Derby Santiago de Surco - Lima - Lima
										</font>
										<br/>
										<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
										Telf: 536-9922 / 536-9939
										</font>
									</td>
								</tr>
								<tr>
									<td>
									<br/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>&#160; </td>
				</tr>
			</tbody>
		</table>
	</p>
</xsl:template>


	<xsl:template name="EncabezadoRecuadro">
	<table borderColor="#000000" cellSpacing="0" cellPadding="5" width="100%" border="1">
		<tbody>
			<tr>
				<td vAlign="top" width="100%" align="center">
					<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
						<br/>
						<strong>R.U.C.: 
							<xsl:value-of select="format-number(//cac:AgentParty/cac:PartyIdentification/cbc:ID,'###########','pen')"/>
							<br/>
							<br/>
							<xsl:call-template name="tipodocu"/>
							<br/>
							<xsl:call-template name="NFolio"/>
						</strong>
						<br/>
					</font>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

	<xsl:template name="tipodocu"><!--<xsl:choose>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
			<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">FACTURA ELECTRONICA</font>
		</xsl:when>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRONICA</font></xsl:when>
		<xsl:otherwise>
			
		</xsl:otherwise>
	</xsl:choose>-->
	<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">COMPROBANTE DE PERCEPCIÓN ELECTRÓNICO</font>
</xsl:template>

	<xsl:template name="NFolio">
	<br/>Nº 
	<xsl:if test="/pe:Perception">
		<xsl:value-of select="substring-before(/pe:Perception/cbc:ID,'-')"/>- 
		<xsl:value-of select="format-number(substring-after(/pe:Perception/cbc:ID,'-'),'00000000')"/>
	</xsl:if>
</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="Ejemplo_percepcion_final.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->