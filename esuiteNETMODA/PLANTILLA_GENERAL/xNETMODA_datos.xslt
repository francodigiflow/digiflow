<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" exclude-result-prefixes="cac cbc ext pe pe1 pe2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="RetourneValAd">
		<xsl:param name="NumAd"/>
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$NumAd">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$NumAd">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$NumAd">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="tmpDatosReceptor">
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					
						<xsl:call-template name="tmpDatosReceptor_FB"/>
					
				</td>
			</tr>
		</table>
	</xsl:template>



	<xsl:template name="tmpDatosReceptor_FB">
		<table style="
	border-collapse: separate;
    border-spacing: 10;
    border: 1px solid #A5A5A5;
    border-radius: 15px;
    -moz-border-radius: 20px;
    padding: 2px;" width="100%" cellpadding="2" cellspacing="0">
			<tbody >
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Cliente</strong>
						</font>
					</td>
					<td width="56%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							:&#xA0;<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
							<xsl:if test="/pe2:DebitNote">						
								<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
							</xsl:if>
							<xsl:if test="/pe1:CreditNote">
								<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
							</xsl:if>
						</font>
					</td>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Fecha de emisión</strong>
						</font>
					</td>
					<td width="20%" >
						<font face="Arial, Helvetica, sans-serif" size="1">
							:&#xA0;
							<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
							<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
							<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>							
						</font>
					</td>
					
				</tr>
				<tr>
				<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong><xsl:call-template name="TipoDeDocumento"/>

							</strong>
						</font>
					</td>
					<td width="20%" >
						<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							:&#xA0;
							<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							:&#xA0;<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
						</xsl:if>
						</font>
					</td>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Condición de pago</strong>
						</font>
					</td>
					<td width="26%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							:&#xA0;<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="03"/></xsl:call-template>

						</font>
					</td>

					
					
				</tr>
					<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Dirección:</strong>
						</font>
					</td>
					<td width="56%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
							:&#xA0;<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							:&#xA0;<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							:&#xA0;<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
						</xsl:if>

						<xsl:if test="//cbc:UBLVersionID='2.1'">
						:&#xA0;<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
						</xsl:if>
						</font>
					</td>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Trans</strong>
						</font>
					</td>
					<td width="20%" >
						<font face="Arial, Helvetica, sans-serif" size="1">
							:&#xA0;<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="02"/></xsl:call-template>								
						</font>
					</td>
					
				</tr>
				
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Teléfono</strong>
						</font>
					</td>
					<td width="56%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							:&#xA0;<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="01"/></xsl:call-template>
						</font>
					</td>
					<td width="12%" >
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>
							Moneda
							</strong>
						</font>
					</td>
					<td width="20%" >
						<font face="Arial, Helvetica, sans-serif" size="1">
							:&#xA0;<xsl:call-template name="tmpDescripcionMoneda"/>
						</font>
					</td>
				
				</tr>
				
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Nro. Tienda</strong>
						</font>
					</td>
					<td width="56%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							:&#xA0;<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="07"/></xsl:call-template>
						</font>
					</td>
					<td width="12%" >
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>
							Nro Caja
							</strong>
						</font>
					</td>
					<td width="20%" >
						<font face="Arial, Helvetica, sans-serif" size="1">
							:&#xA0;<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="08"/></xsl:call-template>
						</font>
					</td>
				
				</tr>
				
				
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="tmpDescripcionMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">US DÓLARES</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="TipoDeDocumento">
		<xsl:choose>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'">NO DOMICILIADO</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">NO DOMICILIADO</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='-'">NO DOMICILIADO</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">NO DOMICILIADO</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">DNI</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">CARNET EXTR.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CARNET EXTR.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">R.U.C.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">R.U.C.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">PASAPORTE</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PASAPORTE</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">CED. DIP. IDENT.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">CED. DIP. IDENT.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='B'">DOC.IDENT. PAIS. RES. NO. DOM.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='B'">DOC.IDENT. PAIS. RES. NO. DOM.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='C'">DOC. TRIB. PP.NN.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='C'">DOC. TRIB. PP.NN.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='D'">DOC. TRIB. PP.JJ.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='D'">DOC. TRIB. PP. JJ.</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="/">
	<p>
		<html>
			<body style="background-color: #c0c0c0"/>
		</html>
	</p>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->