<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>


	<xsl:template name="Totales">
		<tr>
			<td>
			<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode!='40' and //cbc:UBLVersionID='2.1'">
				<xsl:call-template name="Total"/>
				</xsl:if>
				<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
				<xsl:call-template name="TotalExportacion"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td valign="top" width="100%" align="left">
				<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
					<tbody>
						<tr heigth="100%">
							<td valign="top" width="100%" align="left" colspan="2">
								<xsl:call-template name="MontoLiteral"/>
							</td>
						</tr>
						<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<tr heigth="100%">
								<td valign="top" width="50%" align="left"></td>
							</tr>
						</xsl:if>

						<!--xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<tr heigth="100%">
								<td valign="top" width="70%" align="left">
									<xsl:call-template name="Observacion"/>
								</td>
							<td valign="top" width="30%">
								<xsl:call-template name="Total"/>
							</td>
						</tr>
						</xsl:if-->

						<xsl:if test="/pe1:CreditNote">
							<tr heigth="100%">
								<td valign="top" width="60%" align="left">
									<!-- xsl:call-template name="Referencia"/ -->
								</td>
								<!--td valign="top" width="30%" rowspan="2">
								<xsl:call-template name="Total"/>
							</td-->
							</tr>
						</xsl:if>
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="Total">

		<tr>
			<table width="40%" valign="top">
				<tr>
					<td>
						<xsl:for-each select="//cac:PrepaidPayment">
							<xsl:if test="//cbc:InvoiceTypeCode!='10'">
								<table width="100%" border="0" rules="none" bgcolor="#C4BD97">
									<tbody>
										<tr>
											<xsl:if test="//cac:PrepaidPayment/cbc:ID/@schemeID='02'">
												<td width="30%" align="left">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>Anticipo</strong>:

														<xsl:value-of select="substring-before(cbc:ID,'-')"/>-
														<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
													</font>
												</td>
												<td width="5%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="SimboloMoneda"/>
													</font>
												</td>
												<td width="10%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:value-of select="cbc:PaidAmount"/>
													</font>
												</td>
											</xsl:if>
										</tr>
									</tbody>
								</table>
							</xsl:if>
						</xsl:for-each>

						<xsl:if test="//cbc:DocumentTypeCode='02' or //cbc:DocumentTypeCode='03'">
							<table width="100%" border="0" rules="none" bgcolor="#C4BD97" >
								<tbody>
									<td width="100%" align="right">
										<table width="100%">
											<tbody>

												<xsl:for-each select="//cac:AdditionalDocumentReference">
													<xsl:if test="//cbc:InvoiceTypeCode!='10'">
														<tr>
															<td width="30%" align="left">
																<font face="Arial, Helvetica, sans-serif" size="1">
																	<strong>Anticipo</strong>:
																	<xsl:value-of select="cbc:ID"/>
																</font>
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
									<td width="100%">
										<table width="100%">
											<tbody>
												<xsl:if test="//cbc:DocumentTypeCode='02' or //cbc:DocumentTypeCode='03'">
													<xsl:for-each select="//cac:PrepaidPayment">
														<xsl:if test="//cbc:InvoiceTypeCode!='10'">
															<tr>
																<td width="50%" align="right">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<xsl:call-template name="SimboloMoneda"/>
																	</font>
																</td>
																<td width="50%" align="right">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<xsl:value-of select="cbc:PaidAmount"/>
																	</font>
																</td>
															</tr>
														</xsl:if>
													</xsl:for-each>
												</xsl:if>
											</tbody>
										</table>
									</td>
								</tbody>
							</table>
						</xsl:if>
					
					</td>
				</tr>
				<tr>
					<td align="right" valign="top">
						<xsl:choose>
							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'or /pe:Invoice/cbc:InvoiceTypeCode='03'">
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode/@listID = '1001'">
									<xsl:call-template name="DetalleDetraccion"/>
								</xsl:if>
							</xsl:when>
							<xsl:when test="/pe1:CreditNote">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
									<xsl:if test="cbc:ID='2003'">
										<xsl:call-template name="DetalleDetraccion"/>
									</xsl:if>
								</xsl:for-each>
							</xsl:when>
							<xsl:when test="/pe2:DebitNote">
								
										<xsl:call-template name="DetalleDetraccionDebito"/>
									
							</xsl:when>
							<xsl:otherwise>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</tr>

		<tr>
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<table border="1" width="100%" bordercolor="#000000" cellspacing="0" rules="all">
							<tbody>
								<tr>
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>VALOR VENTA<br/>
									BRUTO</b>
										</font>
									</td>
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>MONTO<br/>DESCUENTO</b>
										</font>
									</td>
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>DESCUENTO<br/>
									ANTICIPO</b>
										</font>
									</td>
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>OP.<br/>
									GRAVADA</b>
										</font>
									</td>
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>OP.<br/>
									EXONERADA</b>
										</font>
									</td>
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>OP.<br/>
									INAFECTA</b>
										</font>
									</td>
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>OP.<br/>
									GRATUITA</b>
										</font>
									</td>
									<!--<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
										<td width="10%" align="center">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>TOTAL<br/>EXPORTACION</b>
											</font>
										</td>
									</xsl:if>-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>OTROS<br/>
									CARGOS</b>
										</font>
									</td>
									<!--<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>Total<br/>
									Descuento</b>
										</font>
									</td>-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>I.G.V.</b>
										</font>
									</td>
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>IMPORTE<br/>
									TOTAL&#xA0;<xsl:call-template name="SimboloMoneda"/>&#xA0;</b>
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="VVB">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="6"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:value-of select="format-number($VVB,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="7"/>
											</xsl:call-template>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="Desc_anticipo">
												<xsl:value-of select="0"/>
											<xsl:for-each select="//pe:Invoice/cac:LegalMonetaryTotal">
												<xsl:value-of select="cbc:PrepaidAmount"/> 
											</xsl:for-each>
											<xsl:for-each select="//pe1:CreditNote/cac:LegalMonetaryTotal">
												<xsl:value-of select="cbc:PrepaidAmount"/> 
											</xsl:for-each>
											<xsl:for-each select="//pe2:DebitNote/cac:LegalMonetaryTotal">		
												<xsl:value-of select="cbc:PrepaidAmount"/> 
											</xsl:for-each>		
									</xsl:variable>
											<xsl:value-of select="format-number($Desc_anticipo,'###,###,##0.00','pen')"/>&#xA0;
										</font>
									</td>
									<xsl:variable name="v_TotalGravado">
										<xsl:if test="//cbc:UBLVersionID='2.0'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
												<xsl:if test="cbc:ID = '1001'">
													<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="//cbc:UBLVersionID='2.1'">
											<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">

												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</xsl:variable>

									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="$v_TotalGravado != '0' or $v_TotalGravado!='0.00'">
												<xsl:value-of select="$v_TotalGravado"/>
											</xsl:if>
											<xsl:if test="$v_TotalGravado = ''">
												<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</font>
									</td>

									<xsl:variable name="v_TotalExonerado">
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
									</xsl:variable>

									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="$v_TotalExonerado != '0' or $v_TotalExonerado!='0.00'">
												<xsl:value-of select="$v_TotalExonerado"/>
											</xsl:if>
											<xsl:if test="$v_TotalExonerado = ''">
												<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</font>
									</td>

									<xsl:variable name="v_TotalNoGravado">
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
									</xsl:variable>

									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="$v_TotalNoGravado != '0' or $v_TotalNoGravado!='0.00'">
												<xsl:value-of select="$v_TotalNoGravado"/>
											</xsl:if>
											<xsl:if test="$v_TotalNoGravado = ''">
												<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</font>
									</td>


									<!--	GRATUITO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="//cbc:UBLVersionID='2.0'">
												<xsl:variable name="TotalGratuita">
													<xsl:value-of select="0"/>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
														<xsl:if test="cbc:ID='1004'">
															<xsl:value-of select="cbc:PayableAmount"/>
														</xsl:if>
													</xsl:for-each>
												</xsl:variable>

												<xsl:value-of select="format-number($TotalGratuita,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>

											<xsl:if test="//cbc:UBLVersionID='2.1'">
												<xsl:variable name="OpeGrat">
													<xsl:value-of select="0"/>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
														<xsl:if test="cbc:ID = '1004'">
															<!--<xsl:value-of select="cbc:PayableAmount"/>-->
															<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
													</xsl:for-each>
												</xsl:variable>

												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID!='9996'">
													<xsl:value-of select="format-number($OpeGrat, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>

												<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
														<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
												</xsl:for-each>


												
<!--												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID!='9996'">-->
													<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
														<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
															<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
													</xsl:for-each>
												<!--</xsl:if>-->

												<!--<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID!='9996'">-->
													<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
														<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
															<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
													</xsl:for-each>
												<!--</xsl:if>-->
											</xsl:if>
										</font>
									</td>


									<!--EXPORTACION-->
									<!--<xsl:variable name="v_TotalExportacion">
										<xsl:if test="//cbc:UBLVersionID='2.1'">
											<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</xsl:variable>
									<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
										<td width="10%" align="right">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:if test="$v_TotalExportacion != '0' or $v_TotalExportacion!='0.00'">
													<xsl:value-of select="$v_TotalExportacion"/>
												</xsl:if>
												<xsl:if test="$v_TotalExportacion = ''">
													<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</font>
										</td>
									</xsl:if>-->
									<!--OTROS CARGOS-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="//cbc:UBLVersionID!='2.1'">
												<xsl:choose>
													<xsl:when test="string(number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount)) = 'NaN'">0.00</xsl:when>
													<xsl:otherwise>
														<xsl:for-each select="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount">
															<xsl:if test="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount!='0.00'">
																<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount,'###,###,##0.00','pen')"/>
															</xsl:if>
														</xsl:for-each>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>

											<!--UBL 2.1-->
											<xsl:if test="//cbc:UBLVersionID='2.1'">
												<xsl:choose>
													<xsl:when test="string(number(//cac:AllowanceCharge/cbc:Amount)) = 'NaN'">0.00</xsl:when>
													<xsl:when test="//cac:AllowanceCharge/cbc:ChargeIndicator='false'">0.00</xsl:when>
													<xsl:otherwise>
														<xsl:if test="//cac:AllowanceCharge/cbc:ChargeIndicator='true'">
															<xsl:for-each select="//cac:AllowanceCharge/cbc:Amount">
																<xsl:if test="//cac:AllowanceCharge/cbc:Amount!='0.00'">
																	<xsl:value-of select="format-number(//cac:AllowanceCharge/cbc:Amount,'###,###,##0.00','pen')"/>
																</xsl:if>
															</xsl:for-each>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<!--FIN UBL 2.1-->
										</font>
									</td>
									<!-- IGV -->

									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="//cbc:UBLVersionID='2.0'">
												<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
													</xsl:if>
												</xsl:for-each>

												<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
													</xsl:if>
												</xsl:for-each>

												<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>

											<xsl:if test="//cbc:UBLVersionID='2.1'">
												<xsl:variable name="IGV">
													<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
														<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '1000'">
															<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
													</xsl:for-each>

													<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
														<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
															<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
													</xsl:for-each>

													<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
														<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
															<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
													</xsl:for-each>
												</xsl:variable>

												
												<!--<xsl:value-of select="format-number($IGV,'###,###,##0.00','pen')"/>-->
											<xsl:choose>
											
												<xsl:when test="//cbc:Note[@languageLocaleID='1002']">
												<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
														<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
												</xsl:for-each>
													<!--<xsl:for-each select="pe:Invoice/cac:TaxTotal">
														<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '9996'">
															4<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
													</xsl:for-each>-->
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</font>
									</td>
									<!--TOTAL-->
									<td width="10%" align="right">
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
											<font face="Arial, Helvetica, sans-serif" size="1">

												<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
										</xsl:if>

										<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="SimboloMoneda"/>&#xA0;
												<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</tr>
	</xsl:template>

	<xsl:template name="TotalExportacion">

		<tr>
			<table width="40%" valign="top">
				<tr>
					<td>
						<xsl:for-each select="//cac:PrepaidPayment">
							<xsl:if test="//cbc:InvoiceTypeCode!='10'">
								<table width="100%" border="0" rules="none" bgcolor="#C4BD97">
									<tbody>
										<tr>
											<xsl:if test="//cac:PrepaidPayment/cbc:ID/@schemeID='02'">
												<td width="30%" align="left">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>Anticipo</strong>:

														<xsl:value-of select="substring-before(cbc:ID,'-')"/>-
														<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
													</font>
												</td>
												<td width="5%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="SimboloMoneda"/>
													</font>
												</td>
												<td width="10%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:value-of select="cbc:PaidAmount"/>
													</font>
												</td>
											</xsl:if>
										</tr>
									</tbody>
								</table>
							</xsl:if>
						</xsl:for-each>

						<xsl:if test="//cbc:DocumentTypeCode='02'">
							<table width="100%" border="0" rules="none" bgcolor="#C4BD97">
								<tbody>
									<td width="100%">
										<table width="100%">
											<tbody>

												<xsl:for-each select="//cac:AdditionalDocumentReference">
													<xsl:if test="//cbc:InvoiceTypeCode!='10'">
														<tr>
															<td width="30%" align="left">
																<font face="Arial, Helvetica, sans-serif" size="1">
																	<strong>Anticipo</strong>:
																	<xsl:value-of select="cbc:ID"/>
																</font>
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
									<td width="100%">
										<table width="100%">
											<tbody>
												<xsl:if test="//cbc:DocumentTypeCode='02'">
													<xsl:for-each select="//cac:PrepaidPayment">
														<xsl:if test="//cbc:InvoiceTypeCode!='10'">
															<tr>
																<td width="50%" align="right">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<xsl:call-template name="SimboloMoneda"/>
																	</font>
																</td>
																<td width="50%" align="right">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<xsl:value-of select="cbc:PaidAmount"/>
																	</font>
																</td>
															</tr>
														</xsl:if>
													</xsl:for-each>
												</xsl:if>
											</tbody>
										</table>
									</td>
								</tbody>
							</table>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td align="right" valign="top">
						<xsl:choose>
							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'or /pe:Invoice/cbc:InvoiceTypeCode='03'">
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode/@listID = '1001'">
									<xsl:call-template name="DetalleDetraccion"/>
								</xsl:if>
							</xsl:when>
							<xsl:when test="/pe1:CreditNote">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
									<xsl:if test="cbc:ID='2003'">
										<xsl:call-template name="DetalleDetraccion"/>
									</xsl:if>
								</xsl:for-each>
							</xsl:when>
							<xsl:when test="/pe2:DebitNote">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
									<xsl:if test="cbc:ID='2003'">
										<xsl:call-template name="DetalleDetraccion"/>
									</xsl:if>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</tr>

		<tr>
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<table border="1" width="100%" bordercolor="#000000" cellspacing="0" rules="all">
							<tbody>
								<tr>
									<!--<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>VALOR VENTA<br/>
									BRUTO</b>
										</font>
									</td>-->
									<!--<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>MONTO<br/>DESCUENTO</b>
										</font>
									</td>-->
									<!--<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>OP.<br/>
									GRAVADA</b>
										</font>
									</td>-->
									<!--<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>OP.<br/>
									EXONERADA</b>
										</font>
									</td>-->
									<!--<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>OP.<br/>
									INAFECTA</b>
										</font>
									</td>
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>OP.<br/>
									GRATUITA</b>
										</font>
									</td>-->
									<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
										<td width="25%" align="center">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b><xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='85'">
												<xsl:if test="pe:Valor !='-' and pe:Valor !=''" >
													<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='85'">
												<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''" >
													<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='85'">
												<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''" >
													<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>&#xA0;&#xA0;<xsl:call-template name="SimboloMoneda"/></b>
											</font>
										</td>
									</xsl:if>
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>FLETE / FREIGHT&#xA0;&#xA0;<xsl:call-template name="SimboloMoneda"/></b>
										</font>
									</td>
									<!--<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>Total<br/>
									Descuento</b>
										</font>
									</td>-->
									<!--<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>I.G.V.</b>
										</font>
									</td>-->
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>SEGURO / INSURANCE&#xA0;&#xA0;<xsl:call-template name="SimboloMoneda"/></b>
										</font>
									</td>
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b><xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='86'">
												<xsl:if test="pe:Valor !='-' and pe:Valor !=''" >
													<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='86'">
												<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''" >
													<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='86'">
												<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''" >
													<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each></b><!--&#xA0;&#xA0;<xsl:call-template name="SimboloMoneda"/></b>-->
										</font>
									</td>
								</tr>
								<tr>
									<!--<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="6"/>
											</xsl:call-template>
										</font>
									</td>-->
									<!--<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="7"/>
											</xsl:call-template>
										</font>
									</td>-->
									<!--<xsl:variable name="v_TotalGravado">
										<xsl:if test="//cbc:UBLVersionID='2.0'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
												<xsl:if test="cbc:ID = '1001'">
													<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="//cbc:UBLVersionID='2.1'">
											<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">

												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</xsl:variable>

									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="$v_TotalGravado != '0' or $v_TotalGravado!='0.00'">
												<xsl:value-of select="$v_TotalGravado"/>
											</xsl:if>
											<xsl:if test="$v_TotalGravado = ''">
												<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</font>
									</td>-->

									<!--<xsl:variable name="v_TotalExonerado">
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
									</xsl:variable>

									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="$v_TotalExonerado != '0' or $v_TotalExonerado!='0.00'">
												<xsl:value-of select="$v_TotalExonerado"/>
											</xsl:if>
											<xsl:if test="$v_TotalExonerado = ''">
												<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</font>
									</td>-->

									<!--<xsl:variable name="v_TotalNoGravado">
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
									</xsl:variable>

									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="$v_TotalNoGravado != '0' or $v_TotalNoGravado!='0.00'">
												<xsl:value-of select="$v_TotalNoGravado"/>
											</xsl:if>
											<xsl:if test="$v_TotalNoGravado = ''">
												<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</font>
									</td>-->


									<!--	GRATUITO-->
									<!--<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="//cbc:UBLVersionID='2.0'">
												<xsl:variable name="TotalGratuita">
													<xsl:value-of select="0"/>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
														<xsl:if test="cbc:ID='1004'">
															<xsl:value-of select="cbc:PayableAmount"/>
														</xsl:if>
													</xsl:for-each>
												</xsl:variable>

												<xsl:value-of select="format-number($TotalGratuita,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>

											<xsl:if test="//cbc:UBLVersionID='2.1'">
												<xsl:variable name="OpeGrat">
													<xsl:value-of select="0"/>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
														<xsl:if test="cbc:ID = '1004'">
															<xsl:value-of select="cbc:PayableAmount"/>
															<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
													</xsl:for-each>
												</xsl:variable>

												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID!='9996'">
													<xsl:value-of select="format-number($OpeGrat, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>

												<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
														<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
												</xsl:for-each>


												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID!='9996'">
													<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
														<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
															<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
													</xsl:for-each>
												</xsl:if>

												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID!='9996'">
													<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
														<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
															<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
													</xsl:for-each>
												</xsl:if>
											</xsl:if>
										</font>
									</td>-->


									<!--EXPORTACION-->
									<xsl:variable name="v_TotalExportacion">
										<xsl:if test="//cbc:UBLVersionID='2.1'">
											<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</xsl:variable>
									<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
										<td width="25%" align="right">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!-- <xsl:if test="$v_TotalExportacion != '0' or $v_TotalExportacion!='0.00'"> -->
													<!-- <xsl:value-of select="$v_TotalExportacion"/> -->
												<!-- </xsl:if> -->
												<!-- <xsl:if test="$v_TotalExportacion = ''"> -->
													<!-- <xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/> -->
												<!-- </xsl:if> -->
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="89"/>
												</xsl:call-template>
											</font>
										</td>
									</xsl:if>
									<!--OTROS CARGOS-->
									<td width="25%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="//cbc:UBLVersionID!='2.1'">
												<xsl:choose>
													<xsl:when test="string(number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount)) = 'NaN'">0.00</xsl:when>
													<xsl:otherwise>
														<xsl:for-each select="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount">
															<xsl:if test="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount!='0.00'">
																<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount,'###,###,##0.00','pen')"/>
															</xsl:if>
														</xsl:for-each>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>

											<!--UBL 2.1-->
											<xsl:if test="//cbc:UBLVersionID='2.1'">
												<!-- <xsl:choose> -->
													<!-- <xsl:when test="string(number(//cac:AllowanceCharge/cbc:Amount)) = 'NaN'">0.00</xsl:when> -->
													<!-- <xsl:when test="//cac:AllowanceCharge/cbc:ChargeIndicator='false'">0.00</xsl:when> -->
													<!-- <xsl:otherwise> -->
														<!-- <xsl:if test="//cac:AllowanceCharge/cbc:ChargeIndicator='true'"> -->
															<!-- <xsl:for-each select="//cac:AllowanceCharge/cbc:Amount"> -->
																<!-- <xsl:if test="//cac:AllowanceCharge/cbc:Amount!='0.00'"> -->
																	<!-- <xsl:value-of select="format-number(//cac:AllowanceCharge/cbc:Amount,'###,###,##0.00','pen')"/> -->
																<!-- </xsl:if> -->
															<!-- </xsl:for-each> -->
														<!-- </xsl:if> -->
													<!-- </xsl:otherwise> -->
												<!-- </xsl:choose> -->
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="90"/>
												</xsl:call-template>
											</xsl:if>
											<!--FIN UBL 2.1-->
										</font>
									</td>
									
									<!-- IGV -->
									<!--<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="//cbc:UBLVersionID='2.0'">
												<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
													</xsl:if>
												</xsl:for-each>

												<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
													</xsl:if>
												</xsl:for-each>

												<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>

											<xsl:if test="//cbc:UBLVersionID='2.1'">

												<xsl:variable name="IGV">
													<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
														<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '1000'">
															<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
													</xsl:for-each>

													<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
														<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
															<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
													</xsl:for-each>

													<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
														<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
															<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
													</xsl:for-each>
												</xsl:variable>

												<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
											</xsl:if>
										</font>
									</td>-->
									<!--SEGURO-->
									<td width="25%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="87"/>
											</xsl:call-template>
										</font>
										</td>
									<!--TOTAL-->
									<td width="25%" align="right">
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
											<font face="Arial, Helvetica, sans-serif" size="1">

												<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
										</xsl:if>

										<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="SimboloMoneda"/>&#xA0;
												<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</tr>
	</xsl:template>

	<xsl:template name="MontoLiteral">
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td align="left" width="100%" colspan="2">
						<font face="Arial, Helvetica, sans-serif" size="0.5">
							<strong>SON:</strong>&#xA0;
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
								<xsl:if test="cbc:ID='1000'">
									<xsl:value-of select="cbc:Value"/>
								</xsl:if>
							</xsl:for-each>

							<!--<xsl:value-of select="//cbc:Note"/>-->
							<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']"/>
						</font>
					</td>

					<td align="left" width="50%">
						<font face="Arial, Helvetica, sans-serif" size="0.5">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2001'">
									<strong>COMPROBANTE DE PERCEPCION</strong>Monto de Percepción: <xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/> 
							Total a Pagar: <xsl:value-of select="format-number(sac:TotalAmount,'###,###,##0.00','pen')"/></xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td align="left" width="100%" colspan="2">
					<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
						<font face="Arial, Helvetica, sans-serif" size="0.5">
							<strong><xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='88'">
												<xsl:if test="pe:Valor !='-' and pe:Valor !=''" >
													<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='88'">
												<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''" >
													<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='88'">
												<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''" >
													<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each></strong>
						</font>
						</xsl:if>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="DetalleDetraccion">
		<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
			<tbody>
				<tr>
					<td width="50%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Detracción</strong>&#xA0;
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:value-of select="format-number(cbc:Percent,'###,###,##0.00','pen')"/>%</xsl:if>
							</xsl:for-each>
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode/@listID = '1001'">
								<xsl:value-of select="format-number(//cac:PaymentTerms/cbc:PaymentPercent,'###,###,##0.00','pen')"/>%</xsl:if>
							<!--	<xsl:value-of select="//cac:PaymentTerms/cbc:PaymentPercent"/>%</xsl:if>-->
						</font>
					</td>
					<td width="50%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Monto</strong>&#xA0;
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode/@listID = '1001'">
								<xsl:value-of select="format-number(//cac:PaymentTerms/cbc:Amount,'###,###,##0.00','pen')"/>
							</xsl:if>
						</font>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<font face="Calibri" size="1">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
								<xsl:if test="cbc:ID='3001' and cbc:Value!=''">OPERACIÓN SUJETA A DETRACCIÓN CUENTA BANCO DE LA NACIÓN<strong><xsl:value-of select="cbc:Value"/></strong></xsl:if>
							</xsl:for-each>
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode/@listID = '1001'">OPERACIÓN SUJETA A DETRACCIÓN CUENTA BANCO DE LA NACIÓN<strong><xsl:value-of select="//cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID"/></strong></xsl:if>
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	
	
	
		<xsl:template name="DetalleDetraccionDebito">
		<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
			<tbody>
				<tr>
					<td width="50%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Detracción</strong>&#xA0;
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:value-of select="format-number(cbc:Percent,'###,###,##0.00','pen')"/>%</xsl:if>
							</xsl:for-each>
							<xsl:if test="/pe2:DebitNote">
								<xsl:value-of select="format-number(//cac:PaymentTerms/cbc:PaymentPercent,'###,###,##0.00','pen')"/>%</xsl:if>
							<!--	<xsl:value-of select="//cac:PaymentTerms/cbc:PaymentPercent"/>%</xsl:if>-->
						</font>
					</td>
					<td width="50%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Monto</strong>&#xA0;
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:if test="/pe2:DebitNote">
								<xsl:value-of select="format-number(//cac:PaymentTerms/cbc:Amount,'###,###,##0.00','pen')"/>
							</xsl:if>
						</font>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<font face="Calibri" size="1">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
								<xsl:if test="cbc:ID='3001' and cbc:Value!=''">OPERACIÓN SUJETA A DETRACCIÓN CUENTA BANCO DE LA NACIÓN<strong><xsl:value-of select="cbc:Value"/></strong></xsl:if>
							</xsl:for-each>
							<xsl:if test="/pe2:DebitNote">OPERACIÓN SUJETA A DETRACCIÓN CUENTA BANCO DE LA NACIÓN<strong><xsl:value-of select="//cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID"/></strong></xsl:if>
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>


	<!--xsl:template name="Observacion">
		<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
			<tbody>
				<tr>
					<td>
						<table border="0" cellpadding="1" cellspacing="0" align="left" width="100%">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<b>OBSERVACIONES:</b>&#160;
								<xsl:call-template name="TraeValorVariable">
									<xsl:with-param name="varNumVA" select="05"/>
								</xsl:call-template>
							</font>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template -->



	<!-- xsl:template name="Referencia">
		<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
			<tbody>
				<tr>
					<td>
						<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
							<tbody>
								<tr>
									<td width="100%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">DOCUMENTO(S) DE REFERENCIA :</font>
									</td>
								</tr>
								<tr>
									<td width="100%" align="left">
										<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="50%">
											<tbody>
												<tr>
													<td width="50%" align="center">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<strong>Tipo de Documento</strong>
														</font>
													</td>
													<td width="50%" align="center">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<strong>Correlativo</strong>
														</font>
													</td>
												</tr>
												<xsl:for-each select="//cac:DespatchDocumentReference">
													<xsl:if test="cbc:DocumentTypeCode != '10'">
														<tr>
															<td width="50%" align="center">
																<font face="Arial, Helvetica, sans-serif" size="1">
																	<xsl:choose>
																		<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
																		<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
																		<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
																		<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
																		<xsl:otherwise>Documento NN</xsl:otherwise>
																	</xsl:choose>
																</font>
															</td>
															<td width="50%" align="center">
																<font face="Arial, Helvetica, sans-serif" size="1">
																	<xsl:value-of select="cbc:ID"/>
																</font>
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
													<xsl:if test="cbc:DocumentTypeCode != '10'">
														<tr>
															<td width="50%" align="center">
																<font face="Arial, Helvetica, sans-serif" size="1">
																	<xsl:choose>
																		<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
																		<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
																		<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
																		<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
																		<xsl:otherwise>Documento NN</xsl:otherwise>
																	</xsl:choose>
																</font>
															</td>
															<td width="50%" align="center">
																<font face="Arial, Helvetica, sans-serif" size="1">
																	<xsl:value-of select="cbc:ID"/>
																</font>
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td width="100%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">SUSTENTO :&#xA0;
											<xsl:value-of select="pe1:CreditNote/cac:DiscrepancyResponse/cbc:Description"/>
											<xsl:value-of select="pe2:DebitNote/cac:DiscrepancyResponse/cbc:Description"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template -->

	<xsl:template name="SimboloMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\xml\Facturas\20101266819&#x2D;01&#x2D;FF14&#x2D;11000010.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="true"/><advancedProp name="bGenerateByteCode" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="xsltVersion" value="2.0"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->