<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>



	<xsl:template name="DatosReceptor">
		<table border="0" cellSpacing="2" borderColor="#000000" cellPadding="2" width="100%">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" cellSpacing="1" cellPadding="0" width="100%">
							<tbody>

								<tr>
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>SEÑOR(ES)</strong>
										</font>
									</td>
									<td width="60%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>
									<td width="1%" align="center">
									</td>
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>FECHA</strong>
										</font>
									</td>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
											<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
											<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
										</font>
									</td>
								</tr>
								<tr>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'">
										<td width="12%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>NO DOMICILIADO</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">
										<td width="12%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>DNI</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">
										<td width="12%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>CARNET EXTR.</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">
										<td width="12%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>R.U.C.</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">
										<td width="12%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>PASAPORTE</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">
										<td width="12%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>CED. DIP. IDENT.</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.1'">
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='0'">
											<td width="12%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>RUC</strong>
												</font>
											</td>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='1'">
											<td width="12%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>DNI</strong>
												</font>
											</td>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='4'">
											<td width="12%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>CARNET EXTR.</strong>
												</font>
											</td>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='6'">
											<td width="12%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>R.U.C.</strong>
												</font>
											</td>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='7'">
											<td width="12%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>PASAPORTE</strong>
												</font>
											</td>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='A'">
											<td width="12%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>CED. DIP. IDENT.</strong>
												</font>
											</td>
										</xsl:if>
									</xsl:if>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
											<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="1%" align="center">
									</td>
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>MONEDA</strong>
										</font>
									</td>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
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
										</font>
									</td>
									<!--<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>CONDICION DE PAGO</strong>
										</font>
									</td>
									<td width="15%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>:  </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='01'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='01'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='01'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</font>
										
									</td>-->
								</tr>
								<tr>
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>DIRECCIÓN</strong>
										</font>
									</td>
									<td width="60%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:if test="//cbc:UBLVersionID='2.1'">
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											</xsl:if>
										</font>
									</td>
									<td width="1%" align="center">
									</td>

									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>CONDICION DE PAGO</strong>
										</font>
									</td>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											<xsl:variable name="DatoAdicionalCP">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='01'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo='01'">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo='01'">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>
											<xsl:if test="substring($DatoAdicionalCP,1,1) != 'G'">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='02'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo='02'">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo='02'">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='02'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='02'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='02'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>-->
										</font>
									</td>
								</tr>
								<tr>
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>DOC. SAP</strong>
										</font>
									</td>
									<td width="60%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											<xsl:variable name="DatoAdicionalS">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='01'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo='01'">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo='01'">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>
											<xsl:if test="substring($DatoAdicionalS,1,1) != 'G'">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='01'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo='01'">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo='01'">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='01'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='01'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='01'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>-->
										</font>
									</td>
									<td width="1%" align="center"></td>
									<!--<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20293217280'">
									<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20514020907'">-->


									<xsl:for-each select="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification">
										<xsl:if test="//cbc:ID='20293217280' or cbc:ID='20514020907' or cbc:ID='20507884823' ">
											<td width="12%" align="left">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>NRO. PEDIDO</strong>
												</font>
											</td>
											<td width="15%" align="left">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>:</strong>
													<xsl:value-of select="/pe:Invoice/cac:OrderReference/cbc:ID"/>
													<xsl:value-of select="/pe1:CreditNote/cac:OrderReference/cbc:ID"/>
													<xsl:value-of select="/pe2:DebitNote/cac:OrderReference/cbc:ID"/>
												</font>
											</td>
										</xsl:if>
									</xsl:for-each>

									<!--</xsl:if>									
									</xsl:if>	-->
									<td width="15%" align="left">
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
	</xsl:template>


	<!--
	<xsl:template name="DatosFacturaAdicional_1">

		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
							<tbody>
								<tr>
									<td width="100%" align="justify">
										<table width="100%" border="0">
											<td width="33%" align="left" valign="top">
												<table width="100%" border="0">
													
																

													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='05'">
															<xsl:variable name="adicional" select="substring-before(pe:Valor,'|')"/>
															<xsl:variable name="adicional1" select="substring-after(pe:Valor,'|')"/>
															<tr>
																<td width="35%" align="left">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<b>
																			<xsl:value-of select="substring-before($adicional,':')"/>
																		</b>
																	</font>
																</td>

																<td width="65%" align="right">
																	<font face="Arial, Helvetica, sans-serif" size="1">

																		<xsl:value-of select="substring-after($adicional,':')"/>
																	</font>
																</td>
															</tr>
															<xsl:call-template name="DescripcionAdicional_2_1">
																<xsl:with-param name="resto" select="$adicional1"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='05'">
															<xsl:variable name="adicional" select="substring-before(pe1:Valor,'|')"/>
															<xsl:variable name="adicional1" select="substring-after(pe1:Valor,':')"/>
															<tr>
																<td width="35%" align="left">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<b>
																			<xsl:value-of select="substring-before($adicional,':')"/>
																		</b>
																	</font>
																</td>

																<td width="65%" align="right">
																	<font face="Arial, Helvetica, sans-serif" size="1">

																		<xsl:value-of select="substring-after($adicional,':')"/>
																	</font>
																</td>
															</tr>
															<xsl:call-template name="DescripcionAdicional_2_1">
																<xsl:with-param name="resto" select="substring-after($adicional1,'|')"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='05'">
															<xsl:variable name="adicional" select="substring-before(pe2:Valor,'|')"/>
															<xsl:variable name="adicional1" select="substring-after(pe2:Valor,':')"/>
															<tr>
																<td width="35%" align="left">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<b>
																			<xsl:value-of select="substring-before($adicional,':')"/>
																		</b>
																	</font>
																</td>

																<td width="65%" align="right">
																	<font face="Arial, Helvetica, sans-serif" size="1">

																		<xsl:value-of select="substring-after($adicional,':')"/>
																	</font>
																</td>
															</tr>
															<xsl:call-template name="DescripcionAdicional_2_1">
																<xsl:with-param name="resto" select="substring-after($adicional1,'|')"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:for-each>
													
													
													
												</table>
											</td>
											<td width="34%" align="left" valign="top">
												<table width="100%">


													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='06'">
															<xsl:variable name="adicional" select="substring-before(pe:Valor,'|')"/>
															<xsl:variable name="adicional1" select="substring-after(pe:Valor,':')"/>
															<tr>
																<td width="35%" align="left">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<b>
																			<xsl:value-of select="substring-before($adicional,':')"/>
																		</b>
																	</font>
																</td>

																<td width="65%" align="right">
																	<font face="Arial, Helvetica, sans-serif" size="1">

																		<xsl:value-of select="substring-before($adicional1,'|')"/>
																	</font>
																</td>
															</tr>
															<xsl:call-template name="DescripcionAdicional_2_1">
																<xsl:with-param name="resto" select="substring-after($adicional1,'|')"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='06'">
															<xsl:variable name="adicional" select="substring-before(pe1:Valor,'|')"/>
															<xsl:variable name="adicional1" select="substring-after(pe1:Valor,':')"/>
															<tr>
																<td width="35%" align="left">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<b>
																			<xsl:value-of select="substring-before($adicional,':')"/>
																		</b>
																	</font>
																</td>

																<td width="65%" align="right">
																	<font face="Arial, Helvetica, sans-serif" size="1">

																		<xsl:value-of select="substring-before($adicional1,'|')"/>
																	</font>
																</td>
															</tr>
															<xsl:call-template name="DescripcionAdicional_2_1">
																<xsl:with-param name="resto" select="substring-after($adicional1,'|')"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='06'">
															<xsl:variable name="adicional" select="substring-before(pe2:Valor,'|')"/>
															<xsl:variable name="adicional1" select="substring-after(pe2:Valor,':')"/>
															<tr>
																<td width="35%" align="left">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<b>
																			<xsl:value-of select="substring-before($adicional,':')"/>
																		</b>
																	</font>
																</td>

																<td width="65%" align="right">
																	<font face="Arial, Helvetica, sans-serif" size="1">

																		<xsl:value-of select="substring-before($adicional1,'|')"/>
																	</font>
																</td>
															</tr>
															<xsl:call-template name="DescripcionAdicional_2_1">
																<xsl:with-param name="resto" select="substring-after($adicional1,'|')"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:for-each>
												</table>
											</td>
											<td width="33%" align="left" valign="top">
												<table width="100%">


													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='07'">
															<xsl:variable name="adicional" select="substring-before(pe:Valor,'|')"/>
															<xsl:variable name="adicional1" select="substring-after(pe:Valor,':')"/>
															<tr>
																<td width="35%" align="left">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<b>
																			<xsl:value-of select="substring-before($adicional,':')"/>
																		</b>
																	</font>
																</td>

																<td width="65%" align="right">
																	<font face="Arial, Helvetica, sans-serif" size="1">

																		<xsl:value-of select="substring-before($adicional1,'|')"/>
																	</font>
																</td>
															</tr>
															<xsl:call-template name="DescripcionAdicional_2_1">
																<xsl:with-param name="resto" select="substring-after($adicional1,'|')"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='07'">
															<xsl:variable name="adicional" select="substring-before(pe1:Valor,'|')"/>
															<xsl:variable name="adicional1" select="substring-after(pe1:Valor,':')"/>
															<tr>
																<td width="35%" align="left">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<b>
																			<xsl:value-of select="substring-before($adicional,':')"/>
																		</b>
																	</font>
																</td>

																<td width="65%" align="left">
																	<font face="Arial, Helvetica, sans-serif" size="1">

																		<xsl:value-of select="substring-before($adicional1,'|')"/>
																	</font>
																</td>
															</tr>
															<xsl:call-template name="DescripcionAdicional_2_1">
																<xsl:with-param name="resto" select="substring-after($adicional1,'|')"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='07'">
															<xsl:variable name="adicional" select="substring-before(pe2:Valor,'|')"/>
															<xsl:variable name="adicional1" select="substring-after(pe2:Valor,':')"/>
															<tr>
																<td width="35%" align="left">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<b>
																			<xsl:value-of select="substring-before($adicional,':')"/>
																		</b>
																	</font>
																</td>

																<td width="65%" align="left">
																	<font face="Arial, Helvetica, sans-serif" size="1">

																		<xsl:value-of select="substring-before($adicional1,'|')"/>
																	</font>
																</td>
															</tr>
															<xsl:call-template name="DescripcionAdicional_2_1">
																<xsl:with-param name="resto" select="substring-after($adicional1,'|')"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:for-each>
												</table>
											</td>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	-->


	<!--
	<xsl:template name="DescripcionAdicional_2_1">
		<xsl:param name="resto"/>
		<xsl:variable name="adicional" select="substring-before($resto,'|')"/>
		<xsl:variable name="adicional1" select="substring-after($resto,':')"/>
		<tr>
			<td width="35%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<b>
						<xsl:value-of select="substring-before($adicional,':')"/>
					</b>
				</font>
			</td>

			<td width="65%" align="right">
				<font face="Arial, Helvetica, sans-serif" size="1">

					<xsl:value-of select="substring-after($adicional,':')"/>
				</font>
			</td>
		</tr>
		<xsl:variable name="res" select="substring-after($adicional1,'|')"/>
		<xsl:if test="$res!=''">

			<xsl:call-template name="DescripcionAdicional_2_1">
				<xsl:with-param name="resto" select="$res"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	-->
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\esuite\out\xml\20254053822&#x2D;01&#x2D;F002&#x2D;00345515.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->