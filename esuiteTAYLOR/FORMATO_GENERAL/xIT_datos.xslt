<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">


	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:template name="DatosReceptor">
		<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="2" width="100%">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" cellSpacing="1" cellPadding="0" width="100%">
							<tbody>

								<tr>
									<!--Señor(es)-->
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>SR.(ES)</strong>
										</font>
									</td>
									<td width="40%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>


									<!--FECHA EMISION-->
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>FECHA EMISIÓN</strong>
										</font>
									</td>
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:if test="/pe:Invoice/cbc:IssueDate">
												<xsl:variable name="dt" select="pe:Invoice/cbc:IssueDate"/>
												<xsl:value-of select="concat(substring($dt,9,2),'-',substring($dt,6,2),'-',substring($dt,1,4))"/>
											</xsl:if>
											<!--<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>-->
											<xsl:if test="/pe1:CreditNote/cbc:IssueDate">
												<xsl:variable name="dt" select="pe1:CreditNote/cbc:IssueDate"/>
												<xsl:value-of select="concat(substring($dt,9,2),'-',substring($dt,6,2),'-',substring($dt,1,4))"/>
											</xsl:if>
											<!--<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>-->
											<xsl:if test="/pe2:DebitNote/cbc:IssueDate">
												<xsl:variable name="dt" select="pe2:DebitNote/cbc:IssueDate"/>
												<xsl:value-of select="concat(substring($dt,9,2),'-',substring($dt,6,2),'-',substring($dt,1,4))"/>
											</xsl:if>
											<!--<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>-->
										</font>
									</td>
								</tr>
								<tr>
									<!--DOCUMENTO IDENTIDAD-->
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'">
										<td>
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>NO DOMICILIADO</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>NO DOMICILIADO</strong>
										</font>
									</td>
								</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">
										<td>
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>DNI</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>DNI</strong>
										</font>
									</td>
								</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">
										<td>
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>CARNET EXTR.</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>CARNET EXTR.</strong>
										</font>
									</td>
								</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>RUC</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>R.U.C.</strong>
										</font>
									</td>
								</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">
										<td>
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>PASAPORTE</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>PASAPORTE</strong>
										</font>
									</td>
								</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">
										<td>
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>CED. DIP. IDENT.</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>CED. DIP. IDENT.</strong>
										</font>
									</td>
								</xsl:if>
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
											<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</font>
									</td>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='100'">
											<xsl:variable name="varTipoConcentrado" select="pe:Valor"/>
											<xsl:if test="$varTipoConcentrado='01'">

												<!--PAGO AVANCE-->
												<td align="left">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<strong>PAGO AVANCE</strong>
													</font>
												</td>
												<td align="left">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<strong>:</strong>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
															<xsl:if test="pe:Codigo='04'">
																<xsl:value-of select="pe:Valor"/>
															</xsl:if>
														</xsl:for-each>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
															<xsl:if test="pe1:Codigo='04'">
																<xsl:value-of select="pe1:Valor"/>
															</xsl:if>
														</xsl:for-each>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
															<xsl:if test="pe2:Codigo='04'">
																<xsl:value-of select="pe2:Valor"/>
															</xsl:if>
														</xsl:for-each>
													</font>
												</td>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='100'">
											<xsl:variable name="varTipoConcentrado" select="pe1:Valor"/>

											<!--PAGO AVANCE-->
											<xsl:if test="$varTipoConcentrado='01'">
												<td align="left">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<strong>PAGO AVANCE</strong>
													</font>
												</td>
												<td align="left">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<strong>:</strong>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
															<xsl:if test="pe:Codigo='04'">
																<xsl:value-of select="pe:Valor"/>
															</xsl:if>
														</xsl:for-each>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
															<xsl:if test="pe1:Codigo='04'">
																<xsl:value-of select="pe1:Valor"/>
															</xsl:if>
														</xsl:for-each>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
															<xsl:if test="pe2:Codigo='04'">
																<xsl:value-of select="pe2:Valor"/>
															</xsl:if>
														</xsl:for-each>
													</font>
												</td>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='100'">
											<xsl:variable name="varTipoConcentrado" select="pe2:Valor"/>
											<xsl:if test="$varTipoConcentrado='01'">

												<!--PAGO AVANCE-->
												<td align="left">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<strong>PAGO AVANCE</strong>
													</font>
												</td>
												<td align="left">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<strong>:</strong>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
															<xsl:if test="pe:Codigo='04'">
																<xsl:value-of select="pe:Valor"/>
															</xsl:if>
														</xsl:for-each>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
															<xsl:if test="pe1:Codigo='04'">
																<xsl:value-of select="pe1:Valor"/>
															</xsl:if>
														</xsl:for-each>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
															<xsl:if test="pe2:Codigo='04'">
																<xsl:value-of select="pe2:Valor"/>
															</xsl:if>
														</xsl:for-each>
													</font>
												</td>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<!--Fecha de Vencimiento-->
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>FECHA DE VCTO</strong>
										</font>
									</td>
									<td>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='18'">
													<xsl:variable name="dt" select="pe:Valor"/>
													<xsl:value-of select="concat(substring($dt,9,2),'-',substring($dt,6,2),'-',substring($dt,1,4))"/>
													<!--<xsl:value-of select="format-dateTime(pe:Valor, '[Y0001]-[M01]-[D01]')"/>-->
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='18'">
													<xsl:variable name="dt" select="pe1:Valor"/>
													<xsl:value-of select="concat(substring($dt,9,2),'-',substring($dt,6,2),'-',substring($dt,1,4))"/>
													<!--<xsl:value-of select="format-dateTime(pe:Valor, '[Y0001]-[M01]-[D01]')"/>-->
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='18'">
													<xsl:variable name="dt" select="pe2:Valor"/>
													<xsl:value-of select="concat(substring($dt,9,2),'-',substring($dt,6,2),'-',substring($dt,1,4))"/>
													<!--<xsl:value-of select="format-dateTime(pe:Valor, '[Y0001]-[M01]-[D01]')"/>-->
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>

								<tr>
									<!--DIRECCION-->
									<td>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>DIRECCIÓN</strong>
										</font>
									</td>
									<td>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										</font>
									</td>

									<!--N° PEDIDO-->
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>N° PEDIDO</strong>
										</font>
									</td>
									<td>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='1'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='1'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='1'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<!--Tipo de Cambio-->
									<td>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>TC.</strong>
										</font>
									</td>
									<td>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='2'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='2'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='2'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<!--MONEDA-->
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>MONEDA</strong>
										</font>
									</td>
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
												<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
												<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
												<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">NUEVOS SOLES</xsl:when>
												<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
												<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
												<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">NUEVOS SOLES</xsl:when>
												<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
												<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
												<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>

									<!--Doc. SAP-->
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>DOC. SAP</strong>
										</font>
									</td>
									<td colspan="3">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='3'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='3'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='3'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<!--O/Compra-->
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>O/COMPRA</strong>
										</font>
									</td>
									<td>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='4'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='4'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='4'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<!--<td width="40%" align="center">
									</td>-->

									<!--NOP-->
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>NOP</strong>
										</font>
									</td>
									<td>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='5'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='5'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='5'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>


									<!--CO-->
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>CO</strong>
										</font>
									</td>
									<td>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='7'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='7' and pe1:Valor!='DEFAULT'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='7' and pe2:Valor!='DEFAULT'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>

								<tr>
									<!--NAVE/VESSEL-->
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>NAVE/VESSEL</strong>
										</font>
									</td>
									<td><!--<td colspan="3">-->
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='6'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='6'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='6'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>

									<!--FORMA DE PAGO-->
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>FORMA DE PAGO</strong>
										</font>
									</td>
									<td>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Contado'">Contado</xsl:if>
											<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">Crédito</xsl:if>
										</font>
									</td>	


									<!--NAVE/VESSEL-->
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>CODIGO CLIENTE</strong>
										</font>
									</td>
									<td><!--<td colspan="5">-->
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>:</strong>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='20'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='20'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='20'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<!--VIAJE-->
									<td align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>VIAJE</strong>
										</font>
									</td>
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='14' and pe:Valor=0">-->
									<!--<td colspan="5">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>:</strong>
													</font>
													</td>-->
													<!--</xsl:if>
													</xsl:for-each>-->
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='14' and pe:Valor=1">-->
											<!--<xsl:if test="pe:Codigo='14' and pe:Valor=1">-->
											<td colspan="5">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>:</strong>

													<!--<xsl:call-template name="Viaje"/>-->
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='21'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='21'">
															<xsl:value-of select="pe1:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='21'">
															<xsl:value-of select="pe2:Valor"/>
														</xsl:if>
													</xsl:for-each>
												</font>
											</td>
									<!--	</xsl:if>
									</xsl:for-each>-->
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<!--<br/>-->
		<!--JDL: Si es de tipo Concentrado  2506-->

		<!--<tr>
									<td colspan="5">-->
		<!--Tipo Concentrado -->
		<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo='01'">
				<xsl:variable name="varTipoConcentrado" select="pe:Valor"/>
				<xsl:if test="$varTipoConcentrado='01'">
					<xsl:call-template name="TipoConcentrado"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo='01'">
				<xsl:variable name="varTipoConcentrado" select="pe1:Valor"/>

				<xsl:if test="$varTipoConcentrado='01'">
					<xsl:call-template name="TipoConcentrado"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo='01'">
				<xsl:variable name="varTipoConcentrado" select="pe2:Valor"/>
				<xsl:if test="$varTipoConcentrado='01'">
					<xsl:call-template name="TipoConcentrado"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>-->
		<!--</td>
								</tr>-->
	</xsl:template>

	<!--Tipo de Documentos Concentrado -->
	<xsl:template name="TipoConcentrado">
		<table width="250px" border="1" bordercolor="#000000" cellpadding="3" cellspacing="0">
			<tr>
				<td width="20%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>TMH</strong>
					</font>
				</td>
				<td align="right">
					<!-- TMH -->
					<font face="Arial, Helvetica, sans-serif" size="2">
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
				<tr>
					<td width="50%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>% HUMEDAD</strong>
						</font>
					</td>
					<td align="right">
						<!--% HUMEDAD -->
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
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
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>TM H20</strong>
						</font>
					</td>
					<td align="right">
						<!-- TM H2O -->
						<font face="Arial, Helvetica, sans-serif" size="2">
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
				<tr>
					<td width="20%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>TMS</strong>
						</font>
					</td>
					<td align="right">
						<!-- TMS -->
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
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
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>% MERMA</strong>
						</font>
					</td>
					<td align="right">
						<!-- %MERMA -->
						<font face="Arial, Helvetica, sans-serif" size="2">
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
				<tr>
					<td width="20%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>TM MERMA</strong>
						</font>
					</td>
					<td align="right">
						<!--TM MERMA -->
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='11'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='11'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='11'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>TMNS</strong>
						</font>
					</td>
					<td align="right">
						<!--TMNS -->
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='12'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='12'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='12'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
			</tr>

			<!-- T. Movimiento condición-->

			<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
				<xsl:if test="pe:Codigo='13'">
					<tr bgcolor="#C4BD97">
						<td align="center">
							<font face="Arial, Helvetica, sans-serif" size="2"> T. MOVIMIENTO </font>
						</td>

						<td align="center">-->
			<!-- T.MOVIMIENTO -->
			<!--<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='13'">
										<xsl:value-of select="pe:Valor"/>
									</xsl:if>
								</xsl:for-each>
							</font>
						</td>
					</tr>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
				<xsl:if test="pe1:Codigo='13'">

					<xsl:if test="pe1:Valor!='-'">
						<tr bgcolor="#C4BD97">
							<td align="center">
								<font face="Arial, Helvetica, sans-serif" size="2"> T. MOVIMIENTO </font>
							</td>

							<td align="center">-->
			<!-- T.MOVIMIENTO -->
			<!--<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='13'">
											<xsl:value-of select="pe1:Valor"/>
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>
						</tr>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
				<xsl:if test="pe2:Codigo='13'">
					<tr bgcolor="#C4BD97">
						<td align="center">
							<font face="Arial, Helvetica, sans-serif" size="2"> T. MOVIMIENTO </font>
						</td>

						<td>-->
			<!-- T.MOVIMIENTO -->
			<!--<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='13'">
										<xsl:value-of select="pe2:Valor"/>
									</xsl:if>
								</xsl:for-each>
							</font>
						</td>
					</tr>
				</xsl:if>
			</xsl:for-each>-->
		</table>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20481450510&#x2D;01&#x2D;F001&#x2D;00000030.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->