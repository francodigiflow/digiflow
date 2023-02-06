<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="son-pesos">
		<table border="0">
			<tr>
				<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="2">SON:
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
		</table>
	</xsl:template>

	<xsl:template name="AdicionalGlosa">
		<table border="0">
			<tr>
				<td align="left" width="100%">
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
			</tr>
			<tr>
				<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='07' and pe:Valor!='-'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='07' and pe1:Valor!='-'">
								<xsl:value-of select="pe1:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='07' and pe2:Valor!='-'">
								<xsl:value-of select="pe2:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>
			<tr>
				<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='08' and pe:Valor!='-'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='08' and pe1:Valor!='-'">
								<xsl:value-of select="pe1:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='08' and pe2:Valor!='-'">
								<xsl:value-of select="pe2:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>
			<tr>
				<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='09' and pe:Valor!='-'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='09' and pe1:Valor!='-'">
								<xsl:value-of select="pe1:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='09' and pe2:Valor!='-'">
								<xsl:value-of select="pe2:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>
			<tr>
				<td align="left" width="100%">
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
			<xsl:if test="//cbc:InvoiceTypeCode = '01'">
					<xsl:for-each select="//cac:PaymentTerms">
						<xsl:if test="cbc:ID='FormaPago' and cbc:PaymentMeansID = 'Credito' ">
			<tr>
				<td align="left" width="100%">
					<table border="1" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
											<tr>
												<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Cuota</strong></font></td>
												<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Vencimiento</strong></font></td>
												<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Moneda</strong></font></td>
												<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Monto</strong></font></td>
												</tr>
											<xsl:for-each select="//cac:PaymentTerms">
												<xsl:if test="substring(cbc:PaymentMeansID,1,5) = 'Cuota'">
													<tr>
														<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><xsl:value-of select="number(substring(cbc:PaymentMeansID,6,3))"/></font></td>
														<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><xsl:value-of select="cbc:PaymentDueDate"/></font></td>
														<td align="center"><font face="Arial, Helvetica, sans-serif" size="2">
															<xsl:choose>
																<xsl:when test="cbc:Amount/@currencyID = 'PEN'">Soles</xsl:when>
																<xsl:when test="cbc:Amount/@currencyID = 'USD'">Dolares</xsl:when>
															</xsl:choose> 
														</font></td>
														<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><xsl:value-of select="cbc:Amount"/></font></td>
													</tr>
												</xsl:if>
											</xsl:for-each>
										</table>
				</td>
			</tr>
			</xsl:if>
					</xsl:for-each>
				</xsl:if>
		</table>
	</xsl:template>

	<xsl:template name="Total">
		<table border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000" heigth="100%">

			<xsl:if test="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount!=''">
				<tr>
					<td bgcolor="#999999">
						<font face="Arial, Helvetica, sans-serif" size="1">DSCTO GLOBAL</font>
					</td>
					<td align="right">
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="Simbolo_Moneda"/>
									</font>
								</td>
								<td align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</xsl:if>

			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
				<xsl:if test="cbc:ID='2005'">
					<xsl:if test="cbc:PayableAmount!='0'">
						<tr>
							<td bgcolor="#999999">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>TOTAL DESCUENTO</strong>
								</font>
							</td>
							<td align="right">
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td align="left">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:call-template name="Simbolo_Moneda"/>
											</font>
										</td>
										<td align="right">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
											</font>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>

			<tr>
				<td width="55%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="2">OP. GRAVADA</font>
				</td>
				<td width="45%" align="right">
					<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:call-template name="Simbolo_Moneda"/>
								</font>
							</td>
							<td align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:variable name="MntNeto">
										<xsl:if test="//cbc:UBLVersionID='2.0'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
												<xsl:if test="cbc:ID = '1001'">
													<xsl:value-of select="cbc:PayableAmount"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="//cbc:UBLVersionID='2.1'">
											<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
													<xsl:value-of select="cbc:TaxableAmount"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
													<xsl:value-of select="cbc:TaxableAmount"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
													<xsl:value-of select="cbc:TaxableAmount"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</xsl:variable>
									<xsl:if test="string-length($MntNeto) != 0">
										<xsl:value-of select="format-number($MntNeto, '###,###,##0.00', 'pen')"/>
									</xsl:if>
									<xsl:if test="string-length($MntNeto) = 0">
										<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
									</xsl:if>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<font face="Arial, Helvetica, sans-serif" size="2">OP. INAFECTA</font>
				</td>
				<td align="right">
					<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:call-template name="Simbolo_Moneda"/>
								</font>
							</td>
							<td align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:if test="//cbc:UBLVersionID='2.0'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID = '1002'">
												<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.1'">
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
												<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
												<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
												<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<font face="Arial, Helvetica, sans-serif" size="2">OP. EXONERADA</font>
				</td>
				<td align="right">
					<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:call-template name="Simbolo_Moneda"/>
								</font>
							</td>
							<td align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:if test="//cbc:UBLVersionID='2.0'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID = '1003'">
												<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.1'">
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
												<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
												<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
												<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<xsl:if test="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount!=''">
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">TOTAL OTROS CARGOS</font>
					</td>
					<td align="right">
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="Simbolo_Moneda"/>
									</font>
								</td>
								<td align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</xsl:if>
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
				<xsl:if test="cbc:ID='2005'">
					<xsl:if test="cbc:PayableAmount!='0'">
						<tr>
							<td>
								<font face="Arial, Helvetica, sans-serif" size="2">TOTAL DSCTO</font>
							</td>
							<td align="right">
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td align="left">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:call-template name="Simbolo_Moneda"/>
											</font>
										</td>
										<td align="right">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
											</font>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">TOTAL I.G.V. 18%</font>
					</td>
					<td align="right">
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="Simbolo_Moneda"/>
									</font>
								</td>
								<td align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:variable name="totaligv">
											<xsl:if test="//cbc:UBLVersionID='2.0'">
												<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
													<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount != '' and cac:TaxSubtotal/cbc:TaxAmount != '0.00'">
														<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
													<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount != '' and cac:TaxSubtotal/cbc:TaxAmount != '0.00'">
														<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
													<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount != '' and cac:TaxSubtotal/cbc:TaxAmount != '0.00'">
														<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="//cbc:UBLVersionID='2.1'">
												<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
										</xsl:variable>
										<xsl:if test="string-length($totaligv) != 0">
											<xsl:value-of select="format-number($totaligv,'###,###,##0.00', 'pen')"/>
										</xsl:if>
										<xsl:if test="string-length($totaligv) = 0">
											<xsl:value-of select="format-number(0,'###,###,##0.00', 'pen')"/>
										</xsl:if>
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			

			<!--<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">TOTAL I.G.V. 18%</font>
					</td>
					<td align="right">
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="Simbolo_Moneda"/>
									</font>
								</td>
								<td align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:variable name="totaligv">
											<xsl:if test="//cbc:UBLVersionID='2.0'">
												<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
													<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount != '' and cac:TaxSubtotal/cbc:TaxAmount != '0.00'">
														<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
													<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount != '' and cac:TaxSubtotal/cbc:TaxAmount != '0.00'">
														<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
													<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount != '' and cac:TaxSubtotal/cbc:TaxAmount != '0.00'">
														<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="//cbc:UBLVersionID='2.1'">
												<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
										</xsl:variable>
										<xsl:value-of select="format-number($totaligv,'###,###,##0.00', 'pen')"/>
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</xsl:for-each>
			<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">TOTAL I.G.V. 18%</font>
					</td>
					<td align="right">

						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="Simbolo_Moneda"/>
									</font>
								</td>
								<td align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:variable name="totaligv">
											<xsl:if test="//cbc:UBLVersionID='2.0'">
												<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
													<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount != '' and cac:TaxSubtotal/cbc:TaxAmount != '0.00'">
														<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
													<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount != '' and cac:TaxSubtotal/cbc:TaxAmount != '0.00'">
														<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
													<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount != '' and cac:TaxSubtotal/cbc:TaxAmount != '0.00'">
														<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="//cbc:UBLVersionID='2.1'">

												<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="cbc:TaxAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
										</xsl:variable>
										<xsl:value-of select="format-number($totaligv,'###,###,##0.00', 'pen')"/>
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</xsl:for-each>-->

			<tr>
				<td>
					<font face="Arial, Helvetica, sans-serif" size="2">IMPORTE TOTAL</font>
				</td>
				<td align="right">
					<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:call-template name="Simbolo_Moneda"/>
								</font>
							</td>
							<td align="right">

								<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</font>
								</xsl:if>
								<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</font>
								</xsl:if>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Referencia">
		<table border="0" cellSpacing="0" cellPadding="1" width="100%">
			<tbody>
				<tr>
					<td>
						<table border="0" cellSpacing="0" cellPadding="0" width="100%">
							<tbody>
								<tr>
									<td width="100%" align="left">
										<xsl:call-template name="son-pesos"/>
									</td>
								</tr>
								<tr>
									<td width="100%" align="left">
										<xsl:call-template name="AdicionalGlosa"/>
									</td>
								</tr>
								<tr>
									<td width="100%" align="left">
										<xsl:call-template name="Transf_Grat"/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>



	<xsl:template name="DatoAdicional_Detraccion">
		<table border="0">

			<tr>
				<td align="left" width="100%">
				</td>
			</tr>
			<tr>
				<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='2003' and cbc:PayableAmount!='0.00'">OPERACIÓN SUJETA AL SISTEMA DE PAGO DE OBLIGACIONES TRIBUTARIAS CON EL GOBIERNO CENTRAL</xsl:if>
						</xsl:for-each>
						<br/>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
							<xsl:if test="cbc:ID='3001' and cbc:Value!=''">CUENTA DE DETRACCIÓN BANCO DE LA NACIÓN: <xsl:value-of select="cbc:Value"/></xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Transf_Grat">
		<table border="0" width="100%" cellpadding="1">
			<tr>
				<td>
					<xsl:for-each select="//ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
						<xsl:if test="cbc:ID='1004' and cbc:PayableAmount!='0.00'">
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
								<b>TRANSFERENCIA GRATUITA</b>
							</font>
						</xsl:if>
						<xsl:if test="cbc:ID!='1004'">
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">&#xA0;</font>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Simbolo_Moneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">€</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">€</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">€</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Panasonic\Formato_PanasonicV1.1\20100165849-01-F301-00000280.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator="">
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bGenerateByteCode" value="true"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="sInitialMode" value=""/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="20254053822-01-FF11-10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template name="son-pesos">
				<block path="table/td/font/xsl:for-each" x="410" y="60"/>
				<block path="table/td/font/xsl:for-each/xsl:if/=[0]" x="314" y="88"/>
				<block path="table/td/font/xsl:for-each/xsl:if" x="360" y="90"/>
				<block path="table/td/font/xsl:for-each[1]" x="300" y="30"/>
				<block path="table/td/font/xsl:for-each[1]/xsl:if/=[0]" x="204" y="58"/>
				<block path="table/td/font/xsl:for-each[1]/xsl:if" x="250" y="60"/>
				<block path="table/td/font/xsl:for-each[1]/xsl:if/xsl:value-of" x="320" y="90"/>
				<block path="table/td/font/xsl:for-each[2]" x="340" y="30"/>
				<block path="table/td/font/xsl:for-each[2]/xsl:if/=[0]" x="84" y="58"/>
				<block path="table/td/font/xsl:for-each[2]/xsl:if" x="130" y="60"/>
				<block path="table/td/font/xsl:for-each[2]/xsl:if/xsl:value-of" x="200" y="90"/>
			</template>
			<template name="Total">
				<block path="table/tr/td[1]/font/xsl:for-each" x="340" y="27"/>
				<block path="table/tr/td[1]/font/xsl:for-each/xsl:if/=[0]" x="44" y="55"/>
				<block path="table/tr/td[1]/font/xsl:for-each/xsl:if" x="90" y="57"/>
				<block path="table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:value-of" x="160" y="87"/>
				<block path="table/tr[1]/td[1]/font/xsl:for-each" x="260" y="27"/>
				<block path="table/tr[1]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="364" y="15"/>
				<block path="table/tr[1]/td[1]/font/xsl:for-each/xsl:if" x="410" y="17"/>
				<block path="table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:value-of" x="40" y="87"/>
				<block path="table/tr[2]/td[1]/font/xsl:for-each" x="20" y="27"/>
				<block path="table/tr[2]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="84" y="15"/>
				<block path="table/tr[2]/td[1]/font/xsl:for-each/xsl:if" x="130" y="17"/>
				<block path="table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:value-of" x="200" y="47"/>
				<block path="table/xsl:for-each" x="300" y="27"/>
				<block path="table/xsl:for-each/xsl:if/=[0]" x="364" y="55"/>
				<block path="table/xsl:for-each/xsl:if" x="410" y="57"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/!=[0]" x="314" y="85"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if" x="360" y="87"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/tr/td[1]/font/xsl:value-of" x="360" y="127"/>
				<block path="table/xsl:if/!=[0]" x="274" y="85"/>
				<block path="table/xsl:if" x="320" y="87"/>
				<block path="table/xsl:if/tr/td[1]/font/xsl:value-of" x="400" y="127"/>
				<block path="table/xsl:for-each[1]" x="280" y="87"/>
				<block path="table/xsl:for-each[1]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="15"/>
				<block path="table/xsl:for-each[1]/tr/td[1]/font/xsl:if" x="90" y="17"/>
				<block path="table/xsl:for-each[1]/tr/td[1]/font/xsl:if/xsl:value-of" x="320" y="127"/>
				<block path="table/xsl:for-each[2]" x="240" y="87"/>
				<block path="table/xsl:for-each[2]/tr/td/font/strong/xsl:value-of" x="360" y="87"/>
				<block path="table/xsl:for-each[2]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="95"/>
				<block path="table/xsl:for-each[2]/tr/td[1]/font/xsl:if" x="90" y="97"/>
				<block path="table/xsl:for-each[2]/tr/td[1]/font/xsl:if/xsl:value-of" x="280" y="127"/>
				<block path="table/xsl:for-each[3]" x="200" y="87"/>
				<block path="table/xsl:for-each[3]/tr/td/font/strong/xsl:value-of" x="360" y="87"/>
				<block path="table/xsl:for-each[3]/tr/td[1]/font/xsl:if/!=[0]" x="124" y="135"/>
				<block path="table/xsl:for-each[3]/tr/td[1]/font/xsl:if" x="170" y="137"/>
				<block path="table/xsl:for-each[3]/tr/td[1]/font/xsl:if/xsl:value-of" x="240" y="127"/>
				<block path="table/tr[3]/td[1]/xsl:if/!=[0]" x="314" y="85"/>
				<block path="table/tr[3]/td[1]/xsl:if" x="360" y="87"/>
				<block path="table/tr[3]/td[1]/xsl:if/font/xsl:value-of" x="40" y="127"/>
				<block path="table/tr[3]/td[1]/xsl:if[1]/!=[0]" x="314" y="85"/>
				<block path="table/tr[3]/td[1]/xsl:if[1]" x="360" y="87"/>
				<block path="table/tr[3]/td[1]/xsl:if[1]/font/xsl:value-of" x="360" y="87"/>
				<block path="table[1]/tr/td/xsl:if/=[0]" x="314" y="85"/>
				<block path="table[1]/tr/td/xsl:if" x="360" y="87"/>
				<block path="table[1]/tr/td/xsl:if[1]/!=[0]" x="314" y="85"/>
				<block path="table[1]/tr/td/xsl:if[1]" x="360" y="87"/>
			</template>
			<template match="/"></template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->