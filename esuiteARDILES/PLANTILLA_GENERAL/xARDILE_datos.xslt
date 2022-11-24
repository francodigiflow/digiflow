<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DatosReceptor">
		<table border="0" width="100%" cellpadding="1" cellspacing="0">
			<tbody>
				<tr>
					<td width="65%">
						<table border="0" width="100%" cellpadding="1" cellspacing="0">
							<tr>
								<td colspan="3" width="20%">
									<xsl:if test="//cbc:UBLVersionID='2.1'">
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='0'">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>NO DOMICILIADO</strong>
											</font>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='1'">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>DNI</strong>
											</font>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='4'">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>CARNET EXTR.</strong>
											</font>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='6'">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>R.U.C.</strong>
											</font>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='7'">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>PASAPORTE</strong>
											</font>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='A'">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>CED. DIP. IDENT.</strong>
											</font>
										</xsl:if>
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.0'">
										<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>NO DOMICILIADO</strong>
											</font>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>DNI</strong>
											</font>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>CARNET EXTR.</strong>
											</font>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>R.U.C.</strong>
											</font>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>PASAPORTE</strong>
											</font>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>CED. DIP. IDENT.</strong>
											</font>
										</xsl:if>
									</xsl:if>
								</td>
								<td colspan="3" width="80%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>:&#xA0;</strong>
										<xsl:if test="//cbc:UBLVersionID='2.1'">
											<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:if>
										<xsl:if test="//cbc:UBLVersionID='2.0'">
											<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
										</xsl:if>
									</font>
								</td>
							</tr>
							<tr>
								<td colspan="3" width="20%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Señores</strong>
									</font>
								</td>
								<td colspan="3">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>:&#xA0;</strong>
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
									</font>
								</td>
							</tr>
							<tr>
								<td colspan="3" width="20%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Dirección</strong>
									</font>
								</td>
								<td colspan="3">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>:&#xA0;</strong>
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
									</font>
								</td>
							</tr>
							<tr>
								<td colspan="3" width="20%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong></strong>
									</font>
								</td>
								<td colspan="3">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong></strong>
										<!--xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='13'">&#xA0;
												&#xA0;<xsl:value-of select="pe:Valor"/></xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='13'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='13'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each-->
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
							</tr>
							<tr>
								<td colspan="3" width="20%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Vendedor</strong>
									</font>
								</td>
								<td colspan="3">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>:&#xA0;</strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='06'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='06'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='06'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
							<tr>
								<td colspan="3" width="20%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Observación</strong>
									</font>
								</td>
								<td colspan="3">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>:&#xA0;</strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='05'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='05'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='05'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
							<tr>
								<td colspan="3" width="20%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Forma de Pago</strong>
									</font>
								</td>
								<td colspan="3">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>:&#xA0;</strong>
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">
											<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">CRÉDITO</xsl:if>
											<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Contado'">CONTADO</xsl:if>
										</xsl:if>
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='16'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='16'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='16'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='10'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='10'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='10'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</font>
								</td>
							</tr>
						</table>
					</td>
					<td width="35%">
						<table rules="none" border="0" width="100%" cellpadding="1" cellspacing="0">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='29'">
									<xsl:if test="pe:Valor!='-'">
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>O/C</strong>
												</font>
											</td>
											<td colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>:&#xA0;</strong>
													<!--xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='07'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='07'">
															<xsl:value-of select="pe1:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='07'">
															<xsl:value-of select="pe2:Valor"/>
														</xsl:if>
													</xsl:for-each-->
													<xsl:value-of select="//cac:OrderReference/cbc:ID"/>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='29'">
									<xsl:if test="pe:Valor!='-'">
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>Pedido</strong>
												</font>
											</td>
											<td colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>:&#xA0;</strong>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='08'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='08'">
															<xsl:value-of select="pe1:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='08'">
															<xsl:value-of select="pe2:Valor"/>
														</xsl:if>
													</xsl:for-each>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='29'">
									<xsl:if test="pe:Valor!='-'">
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>Guía</strong>
												</font>
											</td>
											<td colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>:&#xA0;</strong>
													<!--xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='09'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='09'">
															<xsl:value-of select="pe1:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='09'">
															<xsl:value-of select="pe2:Valor"/>
														</xsl:if>
													</xsl:for-each-->
													<xsl:for-each select="//cac:DespatchDocumentReference">
					                                <xsl:value-of select="cbc:ID"/>
					                            </xsl:for-each>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<tr>
								<td>
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>F. Emisión</strong>
									</font>
								</td>
								<td colspan="3">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>:&#xA0;</strong>
										<xsl:value-of select="//cbc:IssueDate"/>
										<!--<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
										<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
										<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>-->
									</font>
								</td>
							</tr>
							<tr>
								<td>
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Moneda</strong>
									</font>
								</td>
								<td colspan="3">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>:&#xA0;</strong>
										<xsl:call-template name="TipoDeMoneda"/>
									</font>
								</td>
							</tr>
							
							<!-- Condicion de Pago -->
							<xsl:if test="/pe:Invoice">
							<tr>
								<td width="35%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Condición de Pago</strong>
									</font>
								</td>
								<td colspan="3">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>:&#xA0;</strong>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='10'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='10'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='10'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
									</font>
								</td>
							</tr>
							</xsl:if>
							<xsl:if test="/pe1:CreditNote or /pe2:DebitNote"></xsl:if>
							<tr>
								<td>
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Plazos</strong>
									</font>
								</td>
								<td colspan="3">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>:&#xA0;</strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='26'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='26'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='26'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="TipoDeMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">SOL</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">SOL</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">SOL</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->