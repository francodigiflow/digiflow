<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ccts="urn:un:unece:uncefact:documentation:2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
	xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes" />

	<xsl:variable name="DireccionEmisor">
		<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
	</xsl:variable>

	<xsl:variable name="DistritoEmisor">
		<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District"/>
	</xsl:variable>

	<xsl:variable name="ProvinciaEmisor">
		<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
	</xsl:variable>

	<xsl:variable name="DepartamentoEmisor">
		<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:RegistrationName"/>
	</xsl:variable>

	<!-- Template encargado de crear y contener las tablas/objetos que componen el sector de Encabezado -->
	<xsl:template name="Encabezado">	
		<!--Tabla general del encabezado-->
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="left" width="68%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="middle" width="32%">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<!--Tabla Encabezado Peru (68%) - izquierda del encabezado: Compuesta por 2 columnas - 1.logo 2.informacion -->
	<xsl:template name="EncabezadoPeru">
		
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<!--Fila-->
				<tr>
					<!--Primera columna - Ubicacion de Logo -->
					<td width="100%" align="left">
					<!--Crea una tabla para alojar la imagen-->
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td align="left">
									<img src="data:image/*;base64,[logo_1]" width="407" height="122" />
									<!--<img src="logo_PRUNI.jpg"/>-->
								</td>
							</tr>
						</table>
					</td>
					<!--Segunda columna - Ubicacion de informacion de la empresa-->
					
				</tr>
				
			</tbody>
		</table>
		
	</xsl:template>

	<!--Tabla Encabezado Recuadro (32%) - derecha del encabezado: Compuesta Informacion de Ruc,tipo de documento, serie, correlativo -->
	<xsl:template name="EncabezadoRecuadro">
	<table cellSpacing="0" cellPadding="0" width="100%" border="1" valign="top">
		<tr>
			<td>
			<!--Tabla dentro de la celda que permitira contener la informacion de manera ordenada -->
				<table borderColor="#000000" cellSpacing="0" cellPadding="5" width="100%" border="1" vAlign="top">
					<tr>
						<td vAlign="top" width="100%" align="center">
							<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
								<strong>R.U.C.:
									<xsl:value-of select="format-number(//cac:PartyIdentification/cbc:ID,'###########','pen')"/>
									<br/>
									<br/>
									<xsl:call-template name="tipodocu"/>
									<br/>
									<xsl:call-template name="NFolio"/>
								</strong>
							</font>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</xsl:template>

	<!--Template encargado de Determinar el tipo de documento, Realiza validacion segun el codigo de comprobante -->
	<xsl:template name="tipodocu">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">FACTURA ELECTRÓNICA</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">BOLETA DE VENTA ELECTRÓNICA</xsl:when>
			<xsl:when test="/pe1:CreditNote">NOTA DE CRÉDITO ELECTRÓNICA</xsl:when>
			<xsl:when test="/pe2:DebitNote">NOTA DE DÉBITO ELECTRÓNICA</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!--Template encargado de recuperar el Numero de Serie y Correlativo del Comprobante por medio del tag cbc:ID -->
	<xsl:template name="NFolio">
		<br/>Nº
		<xsl:value-of select="/pe:Invoice/cbc:ID"/>
		<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
		<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
	</xsl:template>

	<!-- Template encargado de recuperar los datos en el tag adicionales -->
	<xsl:template name="RetourneValAd">
		<xsl:param name="NumAd"/>
		<!-- Se especifica el numero de linea y adicional para su ubicacion y extraccion -->
		<!-- Se indica que el proceso debe raelizarse para todos los tipos de documento Factura/Boleta y Notas de Credito/Debito -->
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo = $NumAd">
				<xsl:if test="pe:Valor != '-'">
					<xsl:value-of select="pe:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo = $NumAd">
				<xsl:if test="pe1:Valor != '-'">
					<xsl:value-of select="pe1:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo = $NumAd">
				<xsl:if test="pe2:Valor != '-'">
					<xsl:value-of select="pe2:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios/>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->