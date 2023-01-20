<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DatosReceptor">
		<table border="0" cellSpacing="0" cellPadding="0" borderColor="#000000" width="100%">
			<tr>
				<td width="15%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>Señores</strong>
					</font>
				</td>
				<td width="45%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>:</strong>
						<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
						<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
						<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
					</font>
				</td>
				<td width="15%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>Fecha</strong>
					</font>
				</td>
				<td width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>:</strong>
						<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
						<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
						<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
					</font>
				</td>
			</tr>
			<tr>
				<td width="15%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>RUC</strong>
					</font>
				</td>
				<td width="45%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>:</strong>
						<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
						<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
						<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
						<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
					</font>
				</td>
				<td width="15%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>Moneda</strong>
					</font>
				</td>
				<td width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>:</strong>
						<xsl:choose>
							<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'PEN'">SOLES</xsl:when>
							<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'USD'">DOLARES AMERICANOS</xsl:when>
							<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'EUR'">EUROS</xsl:when>
							<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'PEN'">SOLES</xsl:when>
							<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'USD'">DOLARES AMERICANOS</xsl:when>
							<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'EUR'">EUROS</xsl:when>
							<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'PEN'">SOLES</xsl:when>
							<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'USD'">DOLARES AMERICANOS</xsl:when>
							<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'EUR'">EUROS</xsl:when>
							<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
						</xsl:choose>
					</font>
				</td>
			</tr>
			<tr>
				<td width="15%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>Dirección</strong>
					</font>
				</td>
				<td width="45%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>:</strong>
						<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
						<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
						<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
						<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
						<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
						<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
					</font>
				</td>
				<td width="15%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>Guías</strong>
					</font>
				</td>
				<td width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>:</strong>-
						<!-- <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional"> -->
							<!-- <xsl:if test="pe:Codigo = '4'"> -->
							<!-- <xsl:if test="pe:Valor != '-'"> -->
								<!-- <xsl:value-of select="pe:Valor"/> -->
								<!-- </xsl:if> -->
							<!-- </xsl:if> -->
						<!-- </xsl:for-each> -->
						<!-- <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional"> -->
							<!-- <xsl:if test="pe1:Codigo = '4'"> -->
							<!-- <xsl:if test="pe1:Valor != '-'"> -->
								<!-- <xsl:value-of select="pe1:Valor"/> -->
								<!-- </xsl:if> -->
							<!-- </xsl:if> -->
						<!-- </xsl:for-each> -->
						<!-- <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional"> -->
							<!-- <xsl:if test="pe2:Codigo = '4'"> -->
							<!-- <xsl:if test="pe2:Valor != '-'"> -->
								<!-- <xsl:value-of select="pe2:Valor"/> -->
								<!-- </xsl:if> -->
							<!-- </xsl:if> -->
						<!-- </xsl:for-each> -->
					</font>
				</td>
			</tr>
			<!--<tr>
				<td width="15%"><font face="Arial, Helvetica, sans-serif" size="2"></font></td>
				<td width="45%"><font face="Arial, Helvetica, sans-serif" size="2"></font></td>
				<td width="15%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>Oracle Invoice</strong>
					</font>
				</td>
				<td width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>: </strong>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo = '6'"><xsl:value-of select="pe:Valor" /></xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo = '6'"><xsl:value-of select="pe1:Valor" /></xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo = '6'"><xsl:value-of select="pe2:Valor" /></xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>-->
		</table>
	</xsl:template>

	<xsl:template name="RetourneValAd">
		<xsl:param name="NumAd"/>

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
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->