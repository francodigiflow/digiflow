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
				<tr width="100%">
					<td vAlign="middle" width="68%">
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
						<td width="30%" align="center">
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td align="left">
										<!-- <img src="logo_bechtel.png"/> -->
										<img src="data:image/*;base64,[logo_1]" />
									</td>
								</tr>
							</table>
						</td>
						<td valign="middle" width="70%" align="center">
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tbody>
									<xsl:choose>
										<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20257982794'">-->
										<xsl:when test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID ='20257982794'">
											<tr>
												<td valign="top" align="Left">
													<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">
														<strong>OVERSEAS BECHTEL, Inc.</strong>
													</font>
												</td>
											</tr>
											<tr>
												<td valign="middle" align="Left">
													<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
														<strong>SUCURSAL DEL PERU</strong>
													</font>
												</td>
											</tr>
											<!--</xsl:if>-->
										</xsl:when>
										<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20538694836'">	-->
										<xsl:when test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID ='20538694836'">
											<tr>
												<td valign="top" align="Left">
													<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">
														<strong>BECHTEL CHILE LIMITADA,</strong>
													</font>
												</td>
											</tr>
											<tr>
												<td valign="middle" align="Left">
													<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
														<strong>SUCURSAL DEL PERU</strong>
													</font>
												</td>
											</tr>
											<!--</xsl:if>-->
										</xsl:when>
										<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20603629451'">-->
										<xsl:when test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID ='20603629451'">
											<tr>
												<td valign="top" align="Left">
													<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">
														<strong>BECHTEL PERU S.R.L.</strong>
													</font>
												</td>
											</tr>
											<!--<tr>
										<td valign="middle" align="Left">
											<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
												<strong>SUCURSAL DEL PERU</strong>
											</font>
										</td>
									</tr>-->
											<!--</xsl:if>-->
										</xsl:when>
										<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20603630409'">-->
										<xsl:when test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID ='20603630409'">
											<tr>
												<td valign="top" align="Left">
													<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">
														<strong>CONSTRUCTORA BECHTEL</strong>
													</font>
												</td>
											</tr>
											<tr>
												<td valign="middle" align="Left">
													<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">
														<strong>PERU S.R.L.</strong>
													</font>
												</td>
											</tr>
											<!--</xsl:if>-->
										</xsl:when>
									</xsl:choose>
									<tr>
										<td valign="middle" align="Left">
											<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
												<xsl:variable name="ValorDate">
													<xsl:call-template name="Fecha_Julio"/>
												</xsl:variable>
												<xsl:if test="$ValorDate &gt; '20190630'">
													<!-- <br/>Oficina Central: Av. El Derby 055, Torre 2, Oficina 503 -->
													<!-- <br/>Santiago de Surco, Lima Lima -->
													<!-- <br/>Telf:+51 1 203 5300 -->
													<br/>Oficina Central: Av. El Derby 055, Torre 2, Oficina 403
													<br/>Santiago de Surco, Lima Lima
													<br/>Telf:+51 1 203 5300
												</xsl:if>
												<xsl:if test="$ValorDate &lt; '20190630'">
													<br/>Oficina Central: Av. El Derby 055, Torre 1, Oficina 901
													<br/>Santiago de Surco, Lima Lima
													<br/>Telf:+51 1 203 5300
												</xsl:if>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>&#xA0;</td>
					</tr>
				</tbody>
			</table>
		</p>
	</xsl:template>

	<xsl:template name="Fecha_Julio">
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

	<xsl:template name="EncabezadoRecuadro">
		<table cellSpacing="0" cellPadding="0" width="100%" border="1">
			<tr>
				<td>
					<table borderColor="#000000" cellSpacing="0" cellPadding="15" width="100%" border="1">
						<tr>
							<td vAlign="top" width="100%" align="center">
								<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
									<strong>R.U.C.:
										<!--<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID, '#########','pen')" />-->
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
			<tr>
				<td align="center"></td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="tipodocu">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">FACTURA ELECTRÓNICA</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">BOLETA ELECTRÓNICA</xsl:when>
			<xsl:when test="/pe1:CreditNote">NOTA DE CRÉDITO ELECTRÓNICA</xsl:when>
			<xsl:when test="/pe2:DebitNote">NOTA DE DÉBITO ELECTRÓNICA</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="NFolio">
		<br/>Nº
		<xsl:value-of select="/pe:Invoice/cbc:ID"/>
		<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
		<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
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