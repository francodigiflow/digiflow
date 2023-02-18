<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">
	
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes" />

	


	<xsl:template name="DatosReceptor">
	
		<table border="1" width="100%" cellpadding="2" cellspacing="0">
			<tr>
				<td>
					<table border="0" width="100%" cellpadding="2" cellspacing="0">
						<tr>
							
							<!--<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">	-->
								<td width="15%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Señor(es)</strong>
									</font>
								</td>

							<td width="1%">
								<font face="Arial, Helvetica, sans-serif" size="2">
								<Strong>:</Strong>
								</font>
							</td>
							<td width="51%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
								</font>
							</td>
		<xsl:variable name="validadorCondicioPago" >
			<xsl:call-template name="RetourneValAd">
				<xsl:with-param name="NumAd" select="5"/>
			</xsl:call-template>
		</xsl:variable>
						
							<td width="16%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<Strong>
										<xsl:if test="$validadorCondicioPago!='' and $validadorCondicioPago!='-'">
											Condición Pago
										</xsl:if>	
									</Strong>
								</font>
							</td>
							<td width="1%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<Strong><xsl:if test="$validadorCondicioPago!='' and $validadorCondicioPago!='-'">:</xsl:if></Strong>
								</font>
							</td>
							<td width="16%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:if test="$validadorCondicioPago!='' and $validadorCondicioPago!='-'">
										<xsl:call-template name="RetourneValAd">
											<xsl:with-param name="NumAd" select="5"/>
										</xsl:call-template>
									</xsl:if>
								</font>
							</td>
						</tr>
						
						<tr>
							<td width="15%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<Strong>
										<xsl:choose>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">No Domiciliado</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">No Domiciliado</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '-'">No Domiciliado</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">No Domiciliado</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '1'">DNI</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '4'">Carnet Extr.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">Carnet Extr.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '6'">R.U.C.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">R.U.C.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '7'">Pasaporte</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">Pasaporte</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'A'">Ced. Dip. Ident.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">Ced. Dip. Ident.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'B'">Doc. Ident. País Resid.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'B'">Doc. Ident. País Resid.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'C'">Identification Number</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'C'">Identification Number</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'D'">Identification Number</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'D'">Identification Number</xsl:when>
									</xsl:choose>
									</Strong>
								</font>
							</td>
							
							<td width="1%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<Strong>:</Strong>									
								</font>
							</td>

							<td width="51%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
								</font>
							</td>
							<td width="16%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<Strong>
										Moneda
									</Strong>
								</font>
							</td>
							<td width="1%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<Strong>:</Strong>
								</font>
							</td>
							<td width="16%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:call-template name="RetournerMoneda"/>
								</font>
							</td>
						</tr>

						<tr>
							<td width="15%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<Strong>Dirección</Strong>
								</font>
							</td>
							
							<td width="1%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<Strong>:</Strong>									
								</font>
							</td>

							<td colspan="4">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<!--factura-boleta-->
									<xsl:value-of select="Invoice/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:StreetName"/>
									<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
									<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
									<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
								
									<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
									<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
								
									<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
							
									<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
									<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
									<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
								</font>
							</td>
						</tr>
						
						<tr>
							<td width="15%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Fecha Emisión</strong>
								</font>
							</td>
							<td width="1%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<Strong>:</Strong>
								</font>
							</td>
							<td colspan="4">
								<font face="Arial, Helvetica, sans-serif" size="2">							
									<xsl:if test="/pe:Invoice/cbc:IssueDate">
										<xsl:variable name="dt" select="pe:Invoice/cbc:IssueDate"/>
										<xsl:value-of select="concat(substring($dt,9,2),'-',substring($dt,6,2),'-',substring($dt,1,4))"/>
									</xsl:if>
											
									<xsl:if test="/pe1:CreditNote/cbc:IssueDate">
										<xsl:variable name="dt" select="pe1:CreditNote/cbc:IssueDate"/>
										<xsl:value-of select="concat(substring($dt,9,2),'-',substring($dt,6,2),'-',substring($dt,1,4))"/>
									</xsl:if>
											
									<xsl:if test="/pe2:DebitNote/cbc:IssueDate">
										<xsl:variable name="dt" select="pe2:DebitNote/cbc:IssueDate"/>
										<xsl:value-of select="concat(substring($dt,9,2),'-',substring($dt,6,2),'-',substring($dt,1,4))"/>
									</xsl:if>
								</font>
							</td>
						</tr>
						
						<tr>
							<td width="15%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Hora Emisión</strong>
								</font>
							</td>
							<td width="1%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<Strong>:</Strong>
								</font>
							</td>
							<td colspan="4">
								<font face="Arial, Helvetica, sans-serif" size="2">							
									<xsl:value-of select="//cbc:IssueTime"/>
								</font>
							</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
		
	</xsl:template>			

	<xsl:template name="RetournerMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'PEN'">Soles</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'USD'">Dólares Americanos</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'EUR'">Euros</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'PEN'">Soles</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'USD'">Dólares Americanos</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'EUR'">Euros</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'PEN'">Soles</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'USD'">Dólares Americanos</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'EUR'">Euros</xsl:when>
			<xsl:otherwise>&#xA0;Otra Moneda</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\out\20503105315_2018110101FMY700000043.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->