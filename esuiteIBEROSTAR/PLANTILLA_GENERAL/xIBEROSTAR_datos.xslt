<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"

	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	
	
	<xsl:template name="DatosReceptor">
		<table width="100%" cellpadding="1" cellspacing="0" border="0"  style="font-family :Calibri,sans-serif;font-size:12px;color:#000000">
			<tr>
				<td>
					<table width="100%" cellpadding="2" cellspacing="0" border="0"  style="font-family :Calibri,sans-serif;font-size:14px;color:#000000">
					<!-- <font face="Calibri, sans-serif" size="2">   -->
					<tr bgcolor="#2F4968">
					<td align="center" width="50%" style="color:WHITE">
						<Strong>Datos del Cliente</Strong>
					</td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
				<table width="100%" cellpadding="4" cellspacing="0" border="0"  style="font-family :Calibri,sans-serif;font-size:14px;color:#000000">
				<!-- <xsl:for-each select="/pe:Invoice/cac:InvoiceLine"> -->
					<tr>
						<!--CODIGO-->
						<td valign="top" align="left" width="70%" style="color:#0F2C4E">
							<strong>									
								&#160;&#160;&#160;&#160;<xsl:if test="//cbc:UBLVersionID='2.1'">
									<xsl:choose>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">S/D</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">S/D</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '-'">S/D</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">S/D</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '1'">DNI:
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI:
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '4'">CE:
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CE:
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '6'">RUC:
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">RUC:
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '7'">PAS:
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PAS:
										</xsl:when>
									</xsl:choose>									
								</xsl:if>
							</strong><xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
							<br/>&#160;&#160;&#160;&#160;<strong>Señor(es):</strong>
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
							<br/>&#160;&#160;&#160;&#160;<strong>Dirección: </strong>
							<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
							<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
							<br/>&#160;&#160;&#160;&#160;<strong>Tipo de Pago: </strong>
								<xsl:if test="$FLAG_R='0'">
									<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="03"/></xsl:call-template>
								</xsl:if>
								<xsl:if test="$FLAG_R='1'">
									<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="03"/></xsl:call-template>
								</xsl:if>
						</td>
						<!--DESCRIPCIÃ“N-->
						<td width="30%" style="color:#0F2C4E">
							<strong>Fecha: </strong>
							<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
							<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
							<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
							<br/><strong>Habitación: </strong>
								<xsl:if test="$FLAG_R='0'">
									<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="01"/></xsl:call-template>
								</xsl:if>
								<xsl:if test="$FLAG_R='1'">
									-
								</xsl:if>
						<xsl:if test="/pe1:CreditNote">
							<strong><br/>Doc. Referencia: </strong>
							<xsl:call-template name="Folio_Ref"/>
							<strong><br/>Motivo: </strong>
							<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description" />
							<br/>
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
							<strong><br/>Doc. Referencia: </strong>
							<xsl:call-template name="Folio_Ref"/>
							<strong><br/>Motivo: </strong>
							<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description" />
							<br/>
						</xsl:if>
						
						</td>
					</tr>
				<!-- </xsl:for-each> -->
				</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	

<xsl:template name="Folio_Ref">
	<xsl:if test="/pe1:CreditNote">
		<xsl:value-of select="substring-before(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID, '-')"/>-
		<xsl:value-of select="format-number(substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'),'00000000')"/>
	</xsl:if>
	<xsl:if test="/pe2:DebitNote">
		<xsl:value-of select="substring-before(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID, '-')"/>-
		<xsl:value-of select="format-number(substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'),'00000000')"/>
	</xsl:if>
</xsl:template>

<xsl:template name="Tipo_doc">
	
	<xsl:if test="//cbc:UBLVersionID='2.1'">
		<xsl:choose>
		<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">DOC.TRIB.NO.DOM.SIN.RUC</xsl:when>
		<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">DOC.TRIB.NO.DOM.SIN.RUC</xsl:when>
		<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI</xsl:when>
		<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CARNET EXTR.</xsl:when>
		<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">RUC - REGISTRO UNICO DE CONTRIBUYENTES</xsl:when>
		<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PASAPORTE</xsl:when>
		<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">CED. DIP. IDENT.</xsl:when>
		<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'B'">DOC. IDEN. PAIS RESID. NO D.</xsl:when>
		<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'C'">T.I.N.-Doc.Trib.PP.NN.</xsl:when>
		<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'D'">I.N.-Doc.Trib.PP.JJ.</xsl:when>
		<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'E'">TAM</xsl:when>
		</xsl:choose>
	</xsl:if>
</xsl:template>

<!-- <xsl:call-template name="RetournerMoneda" /> -->
<!-- <xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="01"/></xsl:call-template> -->
	

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

	<xsl:template name="RetournerMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'PEN'">SOLES</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'USD'">DÓLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'EUR'">EUROS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'PEN'">SOLES</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'USD'">DÓLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'EUR'">EUROS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'PEN'">SOLES</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'USD'">DÓLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'EUR'">EUROS</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\ATV\XML\GRAT&#x2D;03&#x2D;B001&#x2D;00000283.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->