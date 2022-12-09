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

	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr width="100%">
				<td vAlign="middle" width="65%"><xsl:call-template name="EncabezadoPeru" /></td>
				<td vAlign="middle" width="35%"><xsl:call-template name="EncabezadoRecuadro" /></td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr valign="middle">			
				<td align="left" width = "30%" >
					<!-- <img src="logo_panasa.jpg"  width="200px" height="66px" /> -->
					<img src="logo_panasa.jpg"  width="200px" height="66px" />
					<!--<img src="C:\Users\aescribano\Desktop\plantilla_panasa\logo_panasa.jpg" width="250px" height="83px" />-->	
				</td>
				<td align="left" width = "65%">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
						<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID != '0'">
						CAL. LUISA BEAUSEJOUR NRO. 2450 URB. CHACRA RIOS NORTE LIMA - LIMA - LIMA
						</xsl:if>
						<xsl:if test="//cac:AddressLine/cbc:Line != '0'">
						LUISA BEAUSEJOUR NRO. 2450 URB. CHACRA RIOS. LIMA - PERU
						</xsl:if>
						<br/><xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="01" /></xsl:call-template>
						<br/><xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="02" /></xsl:call-template>
					</font>
				</td>
			</tr>
			<xsl:if test="//cbc:UBLVersionID= '2.0'">
			<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID != '0'">
			<tr>
				<td colspan="2"  width = "30%" >
					<!-- <img src="logo_panasa_secundario.jpg" width="120px" height="40px" /> -->
					<img src="logo_panasa_secundario.jpg"/>
					<!--<img src="C:\Users\aescribano\Desktop\plantilla_panasa\logo_panasa_secundario.jpg" />-->
				</td>
			</tr>
			</xsl:if>
			</xsl:if>
				<xsl:if test="//cbc:UBLVersionID= '2.1'">
				<xsl:choose>
					<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='D'" >
						
					</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='-'" >
						
					</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='0'" >
						
					</xsl:when>
					<xsl:otherwise> 
					<tr>
							<td colspan="2"  width = "30%" >
								<!-- <img src="logo_panasa_secundario.jpg" width="120px" height="40px" /> -->
								<img src="logo_panasa_secundario.jpg"/>
								<!--<img src="C:\Users\aescribano\Desktop\plantilla_panasa\logo_panasa_secundario.jpg" />-->
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			
			</xsl:if>




			<!--<xsl:if test="pe1:CreditNote or pe2:DebitNote" >
			<xsl:if test="//cac:AddressLine/cbc:Line != '0'">
			<tr>
				<td colspan="2"  width = "30%" >

					<img src="logo_panasa_secundario.jpg" width="120px" height="40px" /> 
				
					<img src="C:\Users\aescribano\Desktop\plantilla_panasa\logo_panasa_secundario.jpg" />
				</td>
			</tr>
			</xsl:if>
			</xsl:if>-->

		</table>
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
		<table  cellSpacing="0" cellPadding="1" width="100%" border="1">
			
			<tr>
				<td vAlign="top" width="100%" align="center">
					<font color="#000000" size="4" face="Tahoma, Helvetica, sans-serif">
						<strong>
							R.U.C. N° <xsl:value-of select="format-number(//cac:PartyIdentification/cbc:ID, '###########', 'pen')" />
							<br/>&#160;
							<br/><xsl:call-template name="tipodocu" />
							<xsl:variable name="CTSvar16">
								<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="16" /></xsl:call-template>
							</xsl:variable>
							<xsl:if test="$CTSvar16 != ''">
								<br/><xsl:call-template name="tipodocu2" />
							</xsl:if>
							<br/>&#160;
							<br/><xsl:call-template name="NFolio" />
						</strong>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="tipodocu">
	
		<xsl:choose>

			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">FACTURA ELECTRÓNICA</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">BOLETA DE VENTA ELECTRÓNICA</xsl:when>
			<xsl:when test="/pe1:CreditNote">NOTA DE CRÉDITO ELECTRÓNICA</xsl:when>
			<xsl:when test="/pe2:DebitNote">NOTA DE DÉBITO ELECTRÓNICA</xsl:when> 
			<xsl:otherwise></xsl:otherwise>
			
		</xsl:choose>
	</xsl:template>

	<xsl:template name="tipodocu2">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">(Electronic Invoice)</xsl:when>
			<xsl:when test="/pe1:CreditNote">(Note Electronic Credit)</xsl:when>
			<xsl:when test="/pe2:DebitNote">(Note Electronic Debit)</xsl:when> 
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="NFolio">
		<xsl:value-of select="/pe:Invoice/cbc:ID" />
		<xsl:value-of select="/pe1:CreditNote/cbc:ID" />
		<xsl:value-of select="/pe2:DebitNote/cbc:ID" />
	</xsl:template>

	<xsl:template name="DatoAdicional01">
		<xsl:param name="var"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo = $var">
				<xsl:if test="pe:Valor != '-'">
					<xsl:value-of select="pe:Valor" />
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo = $var">
				<xsl:if test="pe1:Valor != '-'">
					<xsl:value-of select="pe1:Valor" />
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo = $var">
				<xsl:if test="pe2:Valor != '-'">
					<xsl:value-of select="pe2:Valor" />
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="/">
		<html><head></head>
			<body/>
		</html>
	</xsl:template>

</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->