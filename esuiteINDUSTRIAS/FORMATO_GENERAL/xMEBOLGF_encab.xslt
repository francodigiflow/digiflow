<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td valign="middle" width="68%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td valign="middle" width="32%">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru">
		<table cellSpacing="2" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td valign="middle" align="center" width="32%">
						<!--<img src="Logo_MEBOL.jpg" width="115" height="155"/>-->
						<!-- <img src="Logo_MEBOL.jpg"/> -->			 
						<img src="data:image/*;base64,[logo_1]" />
					</td>
					<td valign="middle" align="left" width="68%">
						<b>
							<font color="#000000" size="6" face="Arial, Helvetica, sans-serif">MEBOL GF</font>
							<font color="#000000" size="3.5" face="Arial, Helvetica, sans-serif">S.A.C.</font>
						</b>
						<br/>
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">CAR.Panamericana Norte KM. 87 FND. Laure Norte (Sector Chancayllo) Lima - Huaral - Chancay</font>
						<br/>
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Telf: -</font>
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
		<table class="redondeo" borderColor="#000000" cellSpacing="0" cellPadding="0" width="100%">
			<tbody>
				<tr>
					<td vAlign="top" width="100%" align="center">
						<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
							<br/>
							<strong>R.U.C.:
								<xsl:value-of select="format-number(//cac:PartyIdentification/cbc:ID,'###########','pen')"/>
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

	<xsl:template name="tipodocu">
		<br/>
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">FACTURA ELECTRÓNICA</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRÓNICA</font>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote">
					<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE CRÉDITO ELECTRÓNICA</font>
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE DÉBITO ELECTRÓNICA</font>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="NFolio">
		<br/>
		<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">Nº
			<xsl:value-of select="/pe:Invoice/cbc:ID"/>
			<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
			<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
		</font>
		<br/>
	</xsl:template>

	<xsl:template name="Fecha">
		<xsl:if test="/pe:Invoice">
			<xsl:variable name="date1" select="substring-before(/pe:Invoice/cbc:IssueDate,'-')"/>
			<xsl:variable name="date2" select="substring-before(substring-after(/pe:Invoice/cbc:IssueDate,'-'),'-')"/>
			<xsl:variable name="date3" select="substring-after(substring-after(/pe:Invoice/cbc:IssueDate,'-'),'-')"/>
			<xsl:value-of select="concat($date1,$date2,$date3)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
			<xsl:variable name="date1" select="substring-before(/pe1:CreditNote/cbc:IssueDate,'-')"/>
			<xsl:variable name="date2" select="substring-before(substring-after(/pe1:CreditNote/cbc:IssueDate,'-'),'-')"/>
			<xsl:variable name="date3" select="substring-after(substring-after(/pe1:CreditNote/cbc:IssueDate,'-'),'-')"/>
			<xsl:value-of select="concat($date1,$date2,$date3)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
			<xsl:variable name="date1" select="substring-before(/pe2:DebitNote/cbc:IssueDate,'-')"/>
			<xsl:variable name="date2" select="substring-before(substring-after(/pe2:DebitNote/cbc:IssueDate,'-'),'-')"/>
			<xsl:variable name="date3" select="substring-after(substring-after(/pe2:DebitNote/cbc:IssueDate,'-'),'-')"/>
			<xsl:value-of select="concat($date1,$date2,$date3)"/>
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
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->