<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tbody>
			<tr>
				<td vAlign="top" width="68%">
					<xsl:call-template name="EncabezadoPeru"/>
				</td>
				<td vAlign="top" width="32%">
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
										<!--<img src="logo_mebol.jpg" width="115" height="155"/>-->
										<img src="data:image/*;base64,[logo_1]" width="115" height="155" />
									</td>
									<td align="left" width="78%">
										<b>
										<font color="#000000" size="6" face="Arial, Helvetica, sans-serif">
											MEBOL
										</font>
										<font color="#000000" size="3.5" face="Arial, Helvetica, sans-serif">
											S.A.C.
										</font></b>
										<br/>
										<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
											<xsl:variable name="ValorDate">
													<xsl:call-template name="Fecha"/>
												</xsl:variable>
												<!--HACIA ADELANTE-->
												<xsl:if test="$ValorDate &gt;'20170918'">Av. El Derby N° 254, Interior 1703 Urb. El Derby- SANTIAGO DE SURCO - LIMA - LIMA</xsl:if>
												<!--FECHAS ANTIGUAS-->
												<xsl:if test="$ValorDate &lt;= '20170918'">Cal. Los Metales  N° 245 Urb. Pro Industrial San Martin de Porres - Lima - Lima</xsl:if>
										</font>
										<br/>
										<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
										Telf: 536-9939
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
					<td>&#160;</td>
				</tr>
			</tbody>
		</table>
	</p>
</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tbody>
			<tr>
				<td>
					<table class="redondeo" borderColor="#000000" cellSpacing="0" cellPadding="4" width="100%">
						<tbody>
							<tr>
								<td vAlign="top" width="100%" align="center">
									<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
										<br/>
										<strong>R.U.C.: 
										<xsl:if test="//cbc:UBLVersionID='2.0'">
											<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'###########','pen')"/>
										</xsl:if>
										<xsl:if test="//cbc:UBLVersionID='2.1'">
											<xsl:value-of select="format-number(//cac:PartyIdentification/cbc:ID,'###########','pen')"/>
										</xsl:if>
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
				</td>
			</tr>
			<tr>
				<td align="center">
					<font size="1" face="Arial, Helvetica, sans-serif"><!-- <strong>SUNAT- CENTRO LIMA</strong> --></font>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

	<xsl:template name="tipodocu">
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