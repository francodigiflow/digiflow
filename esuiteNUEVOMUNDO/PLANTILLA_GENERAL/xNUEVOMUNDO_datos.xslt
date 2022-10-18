<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DatosCliente">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top">
						<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode!='40' and //cbc:UBLVersionID='2.1'">
							<xsl:call-template name="DatosReceptor"/>
						</xsl:if>
						<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
							<xsl:call-template name="DatosReceptorExportacion"/>
						</xsl:if>
					</td>
				</tr>
				<tr width="100%">
					<td vAlign="top">
						<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode!='40' and //cbc:UBLVersionID='2.1'">
								<xsl:call-template name="DatosFB"/>
							</xsl:if>
						</xsl:if>
						<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
							<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode!='40' and //cbc:UBLVersionID='2.1'">
								<xsl:call-template name="DatosFB"/>
							</xsl:if>
						</xsl:if>
					</td>
				</tr>
				<tr width="100%">
					<td vAlign="top">
						<xsl:if test="/pe1:CreditNote">
							<xsl:call-template name="Dato_Notas"/>
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
							<xsl:call-template name="Dato_Notas"/>
						</xsl:if>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="DatosReceptorExportacion">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000" rules="cols">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="1" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<!--<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>
												<xsl:call-template name="TipoDeDocumento"/>
											</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">-->
									<!-- DOCUMENTO DEL USUARIO O ADQUIRENTE -->
									<!--<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
											<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>&#xA0;</font>
									</td>-->
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>CONSIGNEE:</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- NOMBRE O RAZON SOCIAL DEL USUARIO O ADQUIRENTE -->
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>&#xA0;</font>
									</td>

									<td width="1%">
									</td>

									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>DATE:</b>
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- FECHA DE EMISION -->
											<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
											<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
											<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>&#xA0;</font>
									</td>
								</tr>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>ADDRESS:</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- DIRECCION -->
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										</font>
									</td>


									<td width="1%"></td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>CURRENCY:</b>
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- TIPO DE MONEDA -->
											<xsl:call-template name="TipoDeMoneda"/>
										</font>
									</td>
								</tr>
								<tr>

									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>NOTIFY:</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- NOMBRE O RAZON SOCIAL DEL USUARIO O ADQUIRENTE -->
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>&#xA0;</font>
									</td>

									<td width="1%"></td>

									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>PAYMENT TERMS:</b>
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- FECHA VENCIMIENTO -->
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="2"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='78'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='78'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='78'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>ADDRESS:</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- DIRECCION -->
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										</font>
									</td>
									<!--<td width="15%">
									</td>-->
									<!--<td width="48%" cellpadding="2" valign="top" align="left">
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<xsl:if test="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity!=''">
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity"/>
											</xsl:if>
											<xsl:if test="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName!=''">
												<strong>-</strong>
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
											</xsl:if>
											<xsl:if test="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District!=''">
												<strong>-</strong>
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District"/>
											</xsl:if>

											<xsl:if test="//pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName!=''">
												<xsl:value-of select="//pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
											</xsl:if>
											<xsl:if test="//pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity!=''">
												<strong>-</strong>
												<xsl:value-of select="//pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity"/>
											</xsl:if>
											<xsl:if test="//pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District!=''">
												<strong>-</strong>
												<xsl:value-of select="//pe1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District"/>
											</xsl:if>

											<xsl:if test="//pe2:DeditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName!=''">
												<xsl:value-of select="//pe2:DeditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
											</xsl:if>
											<xsl:if test="//pe2:DeditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity!=''">
												<strong>-</strong>
												<xsl:value-of select="//pe2:DeditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity"/>
											</xsl:if>
											<xsl:if test="//pe2:DeditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District!=''">
												<strong>-</strong>
												<xsl:value-of select="//pe2:DeditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District"/>
											</xsl:if>
										</font>
									</td>-->


									<td width="1%"></td>

									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>PORT OF ORIGIN:</b>
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="3"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='79'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='79'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='79'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>INCOTERMS:</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- INCOTERMS -->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='73'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='73'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='73'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="1%"></td>
									<td width="18%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>PORT OF DISCHERGE:</b>
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- TELEFONO -->
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="1"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='80'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='80'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='80'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>VEESEL:</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- VEESEL -->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='74'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='74'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='74'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="1%"></td>
									<td width="18%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>IMPORT LICENCE:</b>
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- TELEFONO -->
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="1"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='81'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='81'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='81'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>CONTRATC:</b>
										</font>
									</td>
									<td width="48%" cellpadding="75" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- CONTRACT -->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='75'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='75'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='2'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="1%"></td>
									<td width="18%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>MARCAS:</b>
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- TELEFONO -->
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="1"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='82'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='82'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='82'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
										</font>
									</td>
									<td width="48%">
									</td>
									<td width="1%">
									</td>
									<td width="18%">
									</td>
									<td width="18%" cellpadding="75" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- CONTRACT -->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='83'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='83'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='83'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>NET WEIGHT:</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- NET WEIGHT -->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='76'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='76'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='76'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="1%"></td>
									<td width="18%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>GROSS WEIGHT:</b>
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- TELEFONO -->
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="1"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='84'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='84'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='84'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>OBSERVATION</b>
										</font>
									</td>
									<td colspan="5" cellpadding="5" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- OBSERVATION -->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='77'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='77'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='77'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="DatosReceptor">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000" rules="cols">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="1" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>
												<xsl:call-template name="TipoDeDocumento"/>
											</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- DOCUMENTO DEL USUARIO O ADQUIRENTE -->
											<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
											<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>&#xA0;</font>
									</td>


									<td width="1%">
									</td>

									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>FECHA EMISIÓN:</b>
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- FECHA DE EMISION -->
											<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
											<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
											<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>&#xA0;</font>
									</td>
								</tr>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>SEÑOR(ES):</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- NOMBRE O RAZON SOCIAL DEL USUARIO O ADQUIRENTE -->
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>&#xA0;</font>
									</td>


									<td width="1%"></td>

									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>FECHA VENCIMIENTO:</b>
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- FECHA VENCIMIENTO -->
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="2"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='2'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='2'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='2'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>DIRECCIÓN:</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- DIRECCION -->
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										</font>
									</td>


									<td width="1%"></td>

									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>TIPO DE MONEDA:</b>
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<!-- TIPO DE MONEDA -->
											<xsl:call-template name="TipoDeMoneda"/>
										</font>
									</td>
								</tr>
								<tr>

									<td width="15%">
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<xsl:if test="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity!=''">
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity"/>
											</xsl:if>
											<xsl:if test="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName!=''">
												<strong>-</strong>
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
											</xsl:if>
											<xsl:if test="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District!=''">
												<strong>-</strong>
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District"/>
											</xsl:if>

											<xsl:if test="//pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName!=''">
												<xsl:value-of select="//pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
											</xsl:if>
											<xsl:if test="//pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity!=''">
												<strong>-</strong>
												<xsl:value-of select="//pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity"/>
											</xsl:if>
											<xsl:if test="//pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District!=''">
												<strong>-</strong>
												<xsl:value-of select="//pe1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District"/>
											</xsl:if>

											<xsl:if test="//pe2:DeditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName!=''">
												<xsl:value-of select="//pe2:DeditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
											</xsl:if>
											<xsl:if test="//pe2:DeditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity!=''">
												<strong>-</strong>
												<xsl:value-of select="//pe2:DeditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity"/>
											</xsl:if>
											<xsl:if test="//pe2:DeditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District!=''">
												<strong>-</strong>
												<xsl:value-of select="//pe2:DeditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District"/>
											</xsl:if>
										</font>
									</td>


									<td width="1%"></td>

									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>VENDEDOR:</b>
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="3"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='3'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='3'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='3'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>TELÉFONO:</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- TELEFONO -->
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="1"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='1'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='1'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='1'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>

									<td width="1%"></td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<xsl:if test="/pe1:CreditNote">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>COND. DE PAGO</b>
											</font>
										</xsl:if>
										<xsl:if test="/pe2:DebitNote">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>COND. DE PAGO</b>
											</font>
										</xsl:if>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:if test="/pe1:CreditNote">-->
											<!--COD. CLIENTE-->
											<!--<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="5"/>
												</xsl:call-template></xsl:if>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='4'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='4'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<!--<xsl:if test="/pe2:DebitNote">-->
											<!--COD. CLIENTE-->
											<!--<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="5"/>
												</xsl:call-template></xsl:if>-->
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="DatosFB">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000" rules="cols">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="1" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>N° GUIA REMISIÓN:</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- GUIA DE REMISION -->
											<xsl:for-each select="//cac:DespatchDocumentReference">
												<xsl:value-of select="cbc:ID"/>
											</xsl:for-each>
										</font>
									</td>

									<td width="17%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>ORDEN COMPRA:</b>
											<br/>
										</font>
									</td>
									<td width="19%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="//cac:OrderReference/cbc:ID"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>COND. DE PAGO:</b>
										</font>
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="4"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='4'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='4'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='4'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>

									<td width="17%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>PEDIDO:</b>
											<br/>
										</font>
									</td>
									<td width="19%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="5"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='5'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='5'">
													<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='5'">
													<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>


	<xsl:template name="Dato_Notas">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="0" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>DATOS DE REFERENCIA</b>
										</font>
									</td>
									<td>
										<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="all">
											<tr>
												<td width="20%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<b>TIPO DE DOCUMENTO</b>
													</font>
												</td>
												<td width="20%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<b>CORRELATIVO</b>
													</font>
												</td>
												<td width="20%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<b>FECHA</b>
													</font>
												</td>
											</tr>
											<tr>
												<td width="20%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:choose>
															<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
															<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
															<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
															<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
															<xsl:otherwise>Documento NN</xsl:otherwise>
														</xsl:choose>
													</font>
												</td>
												<td width="20%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:value-of select="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>
													</font>
												</td>
												<td width="20%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="TraeValorVariable">
															<xsl:with-param name="varNumVA" select="9"/>
														</xsl:call-template>
													</font>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table border="1" width="100%" cellSpacing="0" cellPadding="1" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="100%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>MOTIVO:</b>&#xA0;
											<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>



	<xsl:template name="TraeValorVariable">
		<xsl:param name="varNumVA"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA">
				<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
					<!--<xsl:value-of select="format-number(pe:Valor, '###,###,##0.00', 'pen')"/>-->
					<xsl:value-of select="pe:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$varNumVA">
				<xsl:if test="pe1:Valor !='-'">
					<xsl:value-of select="pe1:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$varNumVA">
				<xsl:if test="pe2:Valor !='-'">
					<xsl:value-of select="pe2:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="TipoDeDocumento">
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'">&#xA0;NO DOMICILIADO:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">NO DOMICILIADO</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">NO DOMICILIADO</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">&#xA0;DNI:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">&#xA0;CARNET EXTR.:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CARNET EXTR.</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">&#xA0;R.U.C.:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">&#xA0;R.U.C.</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">PASAPORTE:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PASAPORTE</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">CED. DIP. IDENT.:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">CED. DIP. IDENT.</xsl:if>
	</xsl:template>

	<xsl:template name="TipoDeMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
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
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\par" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->