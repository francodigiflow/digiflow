<?xml version='1.0'?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" 
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
	xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"  
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
	xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	
	<xsl:template name="DetallesEncabezado">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<tr>
							<td width="10%" align="center">
								<font face="Arial" size="2">
										<strong>Codigo</strong>
								</font>
							</td>
							<td width="20%">
								<font face="Arial" size="2">
										<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial" size="2">
										<strong>Unidad</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial" size="2">
										<strong>Cantidad</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial" size="2">
										<strong>Precio</strong>
								</font>
							</td>
							<td width="20%" align="center">
								<font face="Arial" size="2">
										<strong>Descripción Dcto</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial" size="2">
										<strong>Monto Dcto</strong>
								</font>
							</td>
							<td width="15%" align="center">
								<font face="Arial" size="2">
										<strong>Importe Total</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<tr>
								<td width="10%" align="center"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/></font> </td>
								<td width="20%" align="left"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="cac:Item/cbc:Description"/></font></td>
								<td width="5%" align="center"><font face="Arial" size="2">
								<xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/></font></td>
								<td width="10%" align="center"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="cbc:InvoicedQuantity"/></font> </td>
								<td width="10%" align="center"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount"/></font> </td>
								<td width="20%" align="left"><font face="Arial" size="2">
								<!--<xsl:if test="cac:AllowanceCharge/cbc:ChargeIndicator='true' or cac:AllowanceCharge/cbc:ChargeIndicator='false'">Descrp Dcto</xsl:if>-->
								&#160;</font></td>
								<td width="10%" align="center"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="2">
								</font> </td>
								<td width="15%" align="center"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="cbc:LineExtensionAmount"/></font> </td>
							</tr>
						</xsl:for-each>
						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
								<!--<table>
									<tr>
										<td align="center" valign="top" width="15%">
											<font face="Arial" size="2">
												<xsl:call-template name="total"/>
											</font>
										</td>
									</tr>
								</table>-->
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
				<td width="10%" align="center" valign="top">
					<font face="Arial" size="1"> </font>
				</td>
				<td width="20%" align="center" valign="top">
					<font face="Arial" size="1"> </font>
				</td>
				<td width="8%" align="center">
					<font face="Arial" size="1"> </font>
				</td>
				<td width="8%" align="center">
					<font face="Arial" size="1"> </font>
				</td>
				<td width="10%" align="center">
					<font face="Arial" size="1"> </font>
				</td>
				<td width="20%" align="center">
					<font face="Arial" size="1"> </font>
				</td>
				<td width="10%" align="center">
					<font face="Arial" size="1"> </font>
				</td>
				<td width="15%" align="center">
					<font face="Arial" size="1"> </font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->