<?xml version="1.0" encoding="iso-8859-1"?>
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

	<!-- Template encargado de crear y contener las tablas/objetos que componen el sector de Encabezado -->
	<xsl:template name="Encabezado">	
		<table cellSpacing="1" cellPadding="1" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="65%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="top" width="35%">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru">
		<p>
		
		<table cellSpacing="0" border="0"  style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000" >
			<tr>
				<td valign="top" align="center" width="18%">
					<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td align="left">
										<!--<img src="logo_SOLANA.jpg" width="250" height="150"/>-->
										<img src="data:image/*;base64,[logo_1]" width="250" height="150"/>
									</td>
								</tr>		
							</tbody>
						</table>
				</td>
			</tr>
		</table>

		<xsl:variable name="validador1" >
			<xsl:call-template name="RetourneValAd">
				<xsl:with-param name="NumAd" select="1"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="validador2" >
			<xsl:call-template name="RetourneValAd">
				<xsl:with-param name="NumAd" select="2"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="validador3" >
			<xsl:call-template name="RetourneValAd">
				<xsl:with-param name="NumAd" select="3"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="validador4" >
			<xsl:call-template name="RetourneValAd">
				<xsl:with-param name="NumAd" select="4"/>
			</xsl:call-template>
		</xsl:variable>
		
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td valign="top" align="left" width="100%" colspan="4">
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
							<strong>
								<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyName"/><br/>
							</strong>
						</font>
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
							<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/> 
							<br/>
						</font>
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
						<xsl:if test="$validador1!='' and $validador1!='-'">	
							Tienda: 
						<xsl:call-template name="RetourneValAd">
								<xsl:with-param name="NumAd" select="1"/>
							</xsl:call-template>
							<br/>
						</xsl:if>
						<xsl:if test="$validador2!='' and $validador2!='-'">
							Dirección:  
							<xsl:call-template name="RetourneValAd">
								<xsl:with-param name="NumAd" select="2"/>
							</xsl:call-template>
							<br/>
						</xsl:if>
						<xsl:if test="$validador3!='' and $validador3!='-'">
							<xsl:call-template name="RetourneValAd">
								<xsl:with-param name="NumAd" select="3"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$validador4!='' and $validador4!='-'">
							<br/>
							<xsl:call-template name="RetourneValAd">
								<xsl:with-param name="NumAd" select="4"/>
							</xsl:call-template>
						</xsl:if>
                       	</font>
					</td>
				</tr>
			</table>
		</p>
	</xsl:template>

	<!--Tabla Encabezado Recuadro (32%) - derecha del encabezado: Compuesta Informacion de Ruc,tipo de documento, serie, correlativo -->
	<xsl:template name="EncabezadoRecuadro">
	<table cellSpacing="0" width="100%" align="center" border="2" cellpadding="5" borderColor="#000000" style="font-family :Arial,Helvetica,sans-serif;font-size:18px;color:#000000" >
			<tr>
				<td width="100%" align="center">
						<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
						<strong>
							R.U.C. N°
							<!--<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID, '###########', 'pen')"/>-->
							<xsl:value-of select="format-number(//cac:PartyIdentification/cbc:ID,'###########','pen')"/>
							<br/><br/><xsl:call-template name="tipodocu"/>
							<!--<br/>--><br/><xsl:call-template name="NFolio"/>
						</strong>
				 		</font>
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
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->