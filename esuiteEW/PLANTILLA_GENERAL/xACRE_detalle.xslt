<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>


	<xsl:template name="Detalle">
		<xsl:variable name="CTSDatosCliente">
			<xsl:call-template name="RetourneValAdItem">
				<xsl:with-param name="NumAd" select="13"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:if test="$CTSDatosCliente != ''">
			<xsl:call-template name="DetallesEncabezado_OF"/>
		</xsl:if>
		<xsl:if test="$CTSDatosCliente = ''">
			<xsl:call-template name="DetallesEncabezado"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="DetallesEncabezado">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr bgcolor="#FAFAFA">

							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Código</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cantidad</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Unidad</strong>
								</font>
							</td>

							<td width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>

							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Pv. Unit
										<br/>(Sin IGV)</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:choose>
										<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">
											<strong>Precio
												<br/>Referencial (Con IGV)</strong>
										</xsl:when>
										<xsl:when test="//cbc:Note[@languageLocaleID='1002']">
											<strong>Precio
												<br/>Referencial (Sin IGV)</strong>
										</xsl:when>
										<xsl:when test="//cbc:Note[@languageLocaleID='2001'] and //cac:LegalMonetaryTotal/cbc:PayableAmount='0.00'">
											<strong>Precio
												<br/>Referencial (Sin IGV)</strong>
										</xsl:when>
										<xsl:otherwise>
											<strong>Pv. Unit
												<br/>(Con IGV)</strong>
										</xsl:otherwise>
									</xsl:choose>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Importe</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'24'  ">
								<tr>

									<td width="10%" align="center" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:InvoicedQuantity"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<td width="40%" align="left" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>

											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="ValorAdicional2">
												<xsl:if test="$ValorAdicional1 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:variable name="ValorAdicional3">
												<xsl:if test="$ValorAdicional2 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="3"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional4">
												<xsl:if test="$ValorAdicional3 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="4"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional5">
												<xsl:if test="$ValorAdicional4 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="5"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional6">
												<xsl:if test="$ValorAdicional5 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="6"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional7">
												<xsl:if test="$ValorAdicional6 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="7"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional8">
												<xsl:if test="$ValorAdicional7 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="8"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional9">
												<xsl:if test="$ValorAdicional8 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="9"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional10">
												<xsl:if test="$ValorAdicional9 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="10"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional11">
												<xsl:if test="$ValorAdicional10 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="11"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional12">
												<xsl:if test="$ValorAdicional11 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="12"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional13">
												<xsl:if test="$ValorAdicional12 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="13"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional14">
												<xsl:if test="$ValorAdicional13 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="14"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional15">
												<xsl:if test="$ValorAdicional14 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="15"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional16">
												<xsl:if test="$ValorAdicional15 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="16"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 !='-' ">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional1"/></xsl:if>
											<xsl:if test="$ValorAdicional2 != '' and $ValorAdicional2 !='-'">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional2"/></xsl:if>
											<xsl:if test="$ValorAdicional3 != '' and $ValorAdicional3 !='-'">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional3"/></xsl:if>
											<xsl:if test="$ValorAdicional4 != '' and $ValorAdicional4 !='-'">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional4"/></xsl:if>
											<xsl:if test="$ValorAdicional5 != '' and $ValorAdicional5 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional5"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional6 != '' and $ValorAdicional6 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional6"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional7 != '' and $ValorAdicional7 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional7"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional8 != '' and $ValorAdicional8 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional8"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional9 != '' and $ValorAdicional9 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional9"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional10 != '' and $ValorAdicional10 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional10"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional11 != '' and $ValorAdicional11 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional11"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional12 != '' and $ValorAdicional12 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional12"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional13 != '' and $ValorAdicional13 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional13"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional14 != '' and $ValorAdicional14 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional14"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional15 != '' and $ValorAdicional15 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional15"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional16 != '' and $ValorAdicional16 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional16"/>
											</xsl:if>
										</font>
									</td>
									<td width="10%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
											
											
										</font>
									</td>

									<td width="10%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,###0.00','pen')"/>&#xA0;-->
											<xsl:variable name="CTSValor1">
												<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
													<xsl:if test="cbc:PriceTypeCode = '02'">
														<xsl:value-of select="cbc:PriceAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>

											<xsl:variable name="CTSValorFinal">
												<xsl:if test="$CTSValor1 = ''">
													<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount"/>
												</xsl:if>
												<xsl:if test="$CTSValor1 != ''">
													<xsl:value-of select="$CTSValor1"/>
												</xsl:if>
											</xsl:variable>

											<xsl:choose>
												<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">

													<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:when>

												

												<xsl:when test="//cbc:Note[@languageLocaleID='2001'] and //cac:LegalMonetaryTotal/cbc:PayableAmount='0.00'">
												<!-- <xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
													</xsl:when> -->

												<xsl:choose>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 3">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 4">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 5">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 6">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 7">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 8">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 9">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 10">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:otherwise>
													</xsl:choose>
												</xsl:when> 

												<xsl:when test="//cbc:Note[@languageLocaleID='2001']">
												
													<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:when>
												<!-- Para produsana-->
												<!-- <xsl:when test="//cac:Signature/cac:SignatoryParty/cac:PartyIdentification/cbc:ID='20563468646'">
													<xsl:choose>
														<xsl:when test="//cbc:Note[@languageLocaleID='1002']">
															<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:when>
														<xsl:otherwise>
															<xsl:choose>
																<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 3">
																	<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000', 'pen')"/>&#xA0;</xsl:when>
																<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 4">
																	<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000', 'pen')"/>&#xA0;</xsl:when>
																<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 5">
																	<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')"/>&#xA0;</xsl:when>
																<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 6">
																	<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000', 'pen')"/>&#xA0;</xsl:when>
																<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 7">
																	<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000', 'pen')"/>&#xA0;</xsl:when>
																<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 8">
																	<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000000', 'pen')"/>&#xA0;</xsl:when>
																<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 9">
																	<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000000', 'pen')"/>&#xA0;</xsl:when>
																<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 10">
																	<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000000', 'pen')"/>&#xA0;</xsl:when>
																<xsl:otherwise>
																	<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:otherwise>
															</xsl:choose>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:when> -->


												<xsl:otherwise>
													<xsl:choose>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 3">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 4">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 5">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 6">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 7">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 8">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 9">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 10">
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000000', 'pen')"/>&#xA0;</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:otherwise>
													</xsl:choose>
												</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="10%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;
											<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount/cbc:PriceAmount,'###,###,###0.00','pen')"/>--></font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="//pe:Invoice/cac:PrepaidPayment">

							<tr>
								<!-- ITEM -->
								<td align="left" width="10%">
								</td>
								<td align="left" width="10%">
								</td>
								<td align="left" width="10%">
								</td>
								<td align="left" width="40%">
									<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										<!--&#xA0;&#xA0;<xsl:value-of select="cbc:ID"/> : &#xA0; DCTO. POR ANTICIPO-->

										<xsl:for-each select="//cac:AdditionalDocumentReference">
											<xsl:if test="cbc:ID!='000'">DCTO. ANTICIPO: <xsl:value-of select="cbc:ID"/></xsl:if>
											<br/>
										</xsl:for-each>
									</font>
								</td>
								<td align="left" width="10%">
								</td>
								<td align="left" width="10%">
								</td>

								<td align="right" width="10%">
									<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										<xsl:value-of select="format-number(cbc:PaidAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>
							</tr>
						</xsl:for-each>


						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'24'  ">
								<tr>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:CreditedQuantity"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:value-of select="cbc:CreditedQuantity/@unitCode"/>-->
											<xsl:call-template name="unidad_medidaC"/>
										</font>
									</td>
									<td width="40%" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>

											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="ValorAdicional2">
												<xsl:if test="$ValorAdicional1 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:variable name="ValorAdicional3">
												<xsl:if test="$ValorAdicional2 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="3"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional4">
												<xsl:if test="$ValorAdicional3 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="4"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional5">
												<xsl:if test="$ValorAdicional4 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="5"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional6">
												<xsl:if test="$ValorAdicional5 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="6"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional7">
												<xsl:if test="$ValorAdicional6 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="7"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional8">
												<xsl:if test="$ValorAdicional7 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="8"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional9">
												<xsl:if test="$ValorAdicional8 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="9"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional10">
												<xsl:if test="$ValorAdicional9 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="10"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional11">
												<xsl:if test="$ValorAdicional10 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="11"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional12">
												<xsl:if test="$ValorAdicional11 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="12"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional13">
												<xsl:if test="$ValorAdicional12 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="13"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional14">
												<xsl:if test="$ValorAdicional13 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="14"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional15">
												<xsl:if test="$ValorAdicional14 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="15"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional16">
												<xsl:if test="$ValorAdicional15 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="16"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional1"/></xsl:if>
											<xsl:if test="$ValorAdicional2 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional2"/></xsl:if>
											<xsl:if test="$ValorAdicional3 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional3"/></xsl:if>
											<xsl:if test="$ValorAdicional4 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional4"/></xsl:if>
											<xsl:if test="$ValorAdicional5 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional5"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional6 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional6"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional7 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional7"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional8 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional8"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional9 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional9"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional10 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional10"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional11 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional11"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional12 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional12"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional13 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional13"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional14 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional14"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional15 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional15"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional16 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional16"/>
											</xsl:if>
										</font>
									</td>


									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'24'  ">

								<tr>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:DebitedQuantity"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--><xsl:value-of select="cbc:DebitedQuantity/@unitCode"/>-->
											<xsl:call-template name="unidad_medidaD"/>
										</font>
									</td>
									<!--<td width="46%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>-->
									<td width="40%" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>

											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="ValorAdicional2">
												<xsl:if test="$ValorAdicional1 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:variable name="ValorAdicional3">
												<xsl:if test="$ValorAdicional2 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="3"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional4">
												<xsl:if test="$ValorAdicional3 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="4"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional5">
												<xsl:if test="$ValorAdicional4 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="5"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional6">
												<xsl:if test="$ValorAdicional5 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="6"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional7">
												<xsl:if test="$ValorAdicional6 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="7"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional8">
												<xsl:if test="$ValorAdicional7 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="8"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional9">
												<xsl:if test="$ValorAdicional8 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="9"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional10">
												<xsl:if test="$ValorAdicional9 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="10"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional11">
												<xsl:if test="$ValorAdicional10 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="11"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional12">
												<xsl:if test="$ValorAdicional11 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="12"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional13">
												<xsl:if test="$ValorAdicional12 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="13"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional14">
												<xsl:if test="$ValorAdicional13 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="14"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional15">
												<xsl:if test="$ValorAdicional14 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="15"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional16">
												<xsl:if test="$ValorAdicional15 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="16"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional1"/></xsl:if>
											<xsl:if test="$ValorAdicional2 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional2"/></xsl:if>
											<xsl:if test="$ValorAdicional3 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional3"/></xsl:if>
											<xsl:if test="$ValorAdicional4 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional4"/></xsl:if>
											<xsl:if test="$ValorAdicional5 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional5"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional6 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional6"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional7 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional7"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional8 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional8"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional9 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional9"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional10 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional10"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional11 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional11"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional12 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional12"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional13 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional13"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional14 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional14"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional15 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional15"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional16 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional16"/>
											</xsl:if>
										</font>
									</td>


									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="DetallesEncabezado_OF">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr bgcolor="#FAFAFA">

							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Código</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cantidad</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Unidad</strong>
								</font>
							</td>

							<td width="36%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>

							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Pv. Unit
										<br/>(Con IGV)</strong>
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Importe</strong>
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>MRA</strong>
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Acc Minorit</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'24'  ">
								<tr>

									<td width="10%" align="center" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:InvoicedQuantity"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<td width="36%" align="left" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>

									<td width="6%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,###0.00','pen')"/>&#xA0;</font>
									</td>
									<td width="6%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;
											<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount/cbc:PriceAmount,'###,###,###.00','pen')"/>--></font>
									</td>
									<td width="6%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional3">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumAd" select="3"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional3"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<td width="6%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional4">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumAd" select="4"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional4">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional4"/>
												</font>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<tr>

							<td width="10%" align="center" vAlign="top">
								<font face="Arial, Helvetica, sans-serif" size="1">
								</font>
							</td>
							<td width="10%" align="center" vAlign="top">
								<font face="Arial, Helvetica, sans-serif" size="1">
								</font>
							</td>
							<td width="10%" align="center" valign="top">
								<font face="Arial, Helvetica, sans-serif" size="1">
								</font>
							</td>
							<td width="36%" align="left" vAlign="top">
								<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
									<br/>&#xA0;
										 &#xA0;Comisión Greenox
									<br/>&#xA0;
										 &#xA0;Costo Transferencia
									<br/>&#xA0;
										 &#xA0;Costo Proyecto REDD
									<br/>&#xA0;
										 &#xA0;SubTotal</font>
							</td>
							<td width="6%" align="right" vAlign="top">
								<font face="Arial, Helvetica, sans-serif" size="1">
								</font>
							</td>
							<td width="6%" align="right" vAlign="top">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<br/>
									<xsl:variable name="ValorAdicional15">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="15"/>
											<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:if test="$ValorAdicional15">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$ValorAdicional15"/>
										</font>
									</xsl:if>
									<br/>
									<xsl:variable name="ValorAdicional18">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="18"/>
											<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:if test="$ValorAdicional18">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$ValorAdicional18"/>
										</font>
									</xsl:if>
									<br/>
									<xsl:variable name="ValorAdicional111">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="111"/>
											<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:if test="$ValorAdicional111">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$ValorAdicional111"/>
										</font>
									</xsl:if>
									<br/>
									<xsl:variable name="ValorAdicional114">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="114"/>
											<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:if test="$ValorAdicional114">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$ValorAdicional114"/>&#xA0;</font>
									</xsl:if>
								</font>
							</td>
							<td width="6%" align="right" vAlign="top">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<br/>
									<xsl:variable name="ValorAdicional16">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="16"/>
											<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:if test="$ValorAdicional16">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$ValorAdicional16"/>
										</font>
									</xsl:if>
									<br/>
									<xsl:variable name="ValorAdicional19">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="19"/>
											<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:if test="$ValorAdicional19">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$ValorAdicional19"/>
										</font>
									</xsl:if>
									<br/>
									<xsl:variable name="ValorAdicional112">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="112"/>
											<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:if test="$ValorAdicional112">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$ValorAdicional112"/>
										</font>
									</xsl:if>
									<br/>
									<xsl:variable name="ValorAdicional115">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="115"/>
											<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:if test="$ValorAdicional115">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$ValorAdicional115"/>&#xA0;</font>
									</xsl:if>
								</font>
							</td>
							<td width="6%" align="right" vAlign="top">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<br/>
									<xsl:variable name="ValorAdicional17">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="17"/>
											<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:if test="$ValorAdicional17">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$ValorAdicional17"/>
										</font>
									</xsl:if>
									<br/>
									<xsl:variable name="ValorAdicional110">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="110"/>
											<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:if test="$ValorAdicional110">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$ValorAdicional110"/>
										</font>
									</xsl:if>
									<br/>
									<xsl:variable name="ValorAdicional113">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="113"/>
											<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:if test="$ValorAdicional113">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$ValorAdicional113"/>
										</font>
									</xsl:if>
									<br/>
									<xsl:variable name="ValorAdicional116">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="116"/>
											<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:if test="$ValorAdicional116">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$ValorAdicional116"/>&#xA0;</font>
									</xsl:if>
								</font>
							</td>
						</tr>
						<xsl:call-template name="lineaB5">
							<xsl:with-param name="cont" select="$numColB5"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>


	<xsl:template name="DetallesEncabezado2">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr bgcolor="#FAFAFA">

							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Código</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cantidad</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Unidad</strong>
								</font>
							</td>

							<td width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>

							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Pv. Unit
										<br/>(Sin IGV)</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Pv. Unit
										<br/>(Con IGV)</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Importe</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt;'23' and cbc:ID &lt;'47'  ">
								<tr>

									<td width="10%" align="center" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:InvoicedQuantity"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<td width="40%" align="left" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>

											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="ValorAdicional2">
												<xsl:if test="$ValorAdicional1 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:variable name="ValorAdicional3">
												<xsl:if test="$ValorAdicional2 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="3"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional4">
												<xsl:if test="$ValorAdicional3 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="4"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional5">
												<xsl:if test="$ValorAdicional4 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="5"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional6">
												<xsl:if test="$ValorAdicional5 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="6"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional7">
												<xsl:if test="$ValorAdicional6 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="7"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional8">
												<xsl:if test="$ValorAdicional7 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="8"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional9">
												<xsl:if test="$ValorAdicional8 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="9"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional10">
												<xsl:if test="$ValorAdicional9 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="10"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional11">
												<xsl:if test="$ValorAdicional10 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="11"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional12">
												<xsl:if test="$ValorAdicional11 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="12"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional13">
												<xsl:if test="$ValorAdicional12 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="13"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional14">
												<xsl:if test="$ValorAdicional13 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="14"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional15">
												<xsl:if test="$ValorAdicional14 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="15"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional16">
												<xsl:if test="$ValorAdicional15 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="16"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 !='-' ">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional1"/></xsl:if>
											<xsl:if test="$ValorAdicional2 != '' and $ValorAdicional2 !='-'">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional2"/></xsl:if>
											<xsl:if test="$ValorAdicional3 != '' and $ValorAdicional3 !='-'">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional3"/></xsl:if>
											<xsl:if test="$ValorAdicional4 != '' and $ValorAdicional4 !='-'">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional4"/></xsl:if>
											<xsl:if test="$ValorAdicional5 != '' and $ValorAdicional5 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional5"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional6 != '' and $ValorAdicional6 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional6"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional7 != '' and $ValorAdicional7 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional7"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional8 != '' and $ValorAdicional8 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional8"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional9 != '' and $ValorAdicional9 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional9"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional10 != '' and $ValorAdicional10 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional10"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional11 != '' and $ValorAdicional11 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional11"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional12 != '' and $ValorAdicional12 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional12"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional13 != '' and $ValorAdicional13 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional13"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional14 != '' and $ValorAdicional14 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional14"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional15 != '' and $ValorAdicional15 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional15"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional16 != '' and $ValorAdicional16 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional16"/>
											</xsl:if>
										</font>
									</td>
									<td width="10%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,###.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,###.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;
											<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount/cbc:PriceAmount,'###,###,###.00','pen')"/>--></font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:if test="cbc:ID &gt;'23' and cbc:ID &lt;'47'  ">
								<tr>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:CreditedQuantity"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:value-of select="cbc:CreditedQuantity/@unitCode"/>-->
											<xsl:call-template name="unidad_medidaC"/>
										</font>
									</td>
									<td width="40%" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>

											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="ValorAdicional2">
												<xsl:if test="$ValorAdicional1 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:variable name="ValorAdicional3">
												<xsl:if test="$ValorAdicional2 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="3"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional4">
												<xsl:if test="$ValorAdicional3 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="4"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional5">
												<xsl:if test="$ValorAdicional4 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="5"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional6">
												<xsl:if test="$ValorAdicional5 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="6"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional7">
												<xsl:if test="$ValorAdicional6 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="7"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional8">
												<xsl:if test="$ValorAdicional7 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="8"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional9">
												<xsl:if test="$ValorAdicional8 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="9"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional10">
												<xsl:if test="$ValorAdicional9 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="10"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional11">
												<xsl:if test="$ValorAdicional10 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="11"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional12">
												<xsl:if test="$ValorAdicional11 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="12"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional13">
												<xsl:if test="$ValorAdicional12 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="13"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional14">
												<xsl:if test="$ValorAdicional13 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="14"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional15">
												<xsl:if test="$ValorAdicional14 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="15"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional16">
												<xsl:if test="$ValorAdicional15 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="16"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional1"/></xsl:if>
											<xsl:if test="$ValorAdicional2 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional2"/></xsl:if>
											<xsl:if test="$ValorAdicional3 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional3"/></xsl:if>
											<xsl:if test="$ValorAdicional4 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional4"/></xsl:if>
											<xsl:if test="$ValorAdicional5 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional5"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional6 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional6"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional7 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional7"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional8 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional8"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional9 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional9"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional10 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional10"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional11 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional11"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional12 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional12"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional13 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional13"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional14 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional14"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional15 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional15"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional16 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional16"/>
											</xsl:if>
										</font>
									</td>


									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt;'23' and cbc:ID &lt;'47'  ">

								<tr>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:DebitedQuantity"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--><xsl:value-of select="cbc:DebitedQuantity/@unitCode"/>-->
											<xsl:call-template name="unidad_medidaD"/>
										</font>
									</td>
									<!--<td width="46%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>-->
									<td width="40%" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>

											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="ValorAdicional2">
												<xsl:if test="$ValorAdicional1 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:variable name="ValorAdicional3">
												<xsl:if test="$ValorAdicional2 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="3"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional4">
												<xsl:if test="$ValorAdicional3 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="4"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional5">
												<xsl:if test="$ValorAdicional4 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="5"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional6">
												<xsl:if test="$ValorAdicional5 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="6"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional7">
												<xsl:if test="$ValorAdicional6 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="7"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional8">
												<xsl:if test="$ValorAdicional7 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="8"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional9">
												<xsl:if test="$ValorAdicional8 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="9"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional10">
												<xsl:if test="$ValorAdicional9 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="10"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional11">
												<xsl:if test="$ValorAdicional10 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="11"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional12">
												<xsl:if test="$ValorAdicional11 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="12"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional13">
												<xsl:if test="$ValorAdicional12 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="13"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional14">
												<xsl:if test="$ValorAdicional13 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="14"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional15">
												<xsl:if test="$ValorAdicional14 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="15"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional16">
												<xsl:if test="$ValorAdicional15 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="16"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional1"/></xsl:if>
											<xsl:if test="$ValorAdicional2 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional2"/></xsl:if>
											<xsl:if test="$ValorAdicional3 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional3"/></xsl:if>
											<xsl:if test="$ValorAdicional4 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional4"/></xsl:if>
											<xsl:if test="$ValorAdicional5 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional5"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional6 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional6"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional7 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional7"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional8 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional8"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional9 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional9"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional10 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional10"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional11 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional11"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional12 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional12"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional13 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional13"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional14 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional14"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional15 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional15"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional16 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional16"/>
											</xsl:if>
										</font>
									</td>


									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="DetallesEncabezado3">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr bgcolor="#FAFAFA">

							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Código</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cantidad</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Unidad</strong>
								</font>
							</td>

							<td width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>

							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Pv. Unit
										<br/>(Sin IGV)</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Pv. Unit
										<br/>(Con IGV)</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Importe</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt;'46' and cbc:ID &lt;'70'  ">
								<tr>

									<td width="10%" align="center" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:InvoicedQuantity"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<td width="40%" align="left" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>

											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="ValorAdicional2">
												<xsl:if test="$ValorAdicional1 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:variable name="ValorAdicional3">
												<xsl:if test="$ValorAdicional2 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="3"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional4">
												<xsl:if test="$ValorAdicional3 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="4"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional5">
												<xsl:if test="$ValorAdicional4 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="5"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional6">
												<xsl:if test="$ValorAdicional5 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="6"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional7">
												<xsl:if test="$ValorAdicional6 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="7"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional8">
												<xsl:if test="$ValorAdicional7 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="8"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional9">
												<xsl:if test="$ValorAdicional8 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="9"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional10">
												<xsl:if test="$ValorAdicional9 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="10"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional11">
												<xsl:if test="$ValorAdicional10 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="11"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional12">
												<xsl:if test="$ValorAdicional11 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="12"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional13">
												<xsl:if test="$ValorAdicional12 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="13"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional14">
												<xsl:if test="$ValorAdicional13 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="14"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional15">
												<xsl:if test="$ValorAdicional14 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="15"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional16">
												<xsl:if test="$ValorAdicional15 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="16"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 !='-' ">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional1"/></xsl:if>
											<xsl:if test="$ValorAdicional2 != '' and $ValorAdicional2 !='-'">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional2"/></xsl:if>
											<xsl:if test="$ValorAdicional3 != '' and $ValorAdicional3 !='-'">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional3"/></xsl:if>
											<xsl:if test="$ValorAdicional4 != '' and $ValorAdicional4 !='-'">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional4"/></xsl:if>
											<xsl:if test="$ValorAdicional5 != '' and $ValorAdicional5 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional5"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional6 != '' and $ValorAdicional6 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional6"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional7 != '' and $ValorAdicional7 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional7"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional8 != '' and $ValorAdicional8 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional8"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional9 != '' and $ValorAdicional9 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional9"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional10 != '' and $ValorAdicional10 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional10"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional11 != '' and $ValorAdicional11 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional11"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional12 != '' and $ValorAdicional12 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional12"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional13 != '' and $ValorAdicional13 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional13"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional14 != '' and $ValorAdicional14 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional14"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional15 != '' and $ValorAdicional15 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional15"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional16 != '' and $ValorAdicional16 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional16"/>
											</xsl:if>
										</font>
									</td>
									<td width="10%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,###.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,###.00','pen')"/>&#xA0;</font>
									</td>
									<td width="12%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;
											<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount/cbc:PriceAmount,'###,###,###.00','pen')"/>--></font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:if test="cbc:ID &gt;'46' and cbc:ID &lt;'70'  ">
								<tr>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:CreditedQuantity"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:value-of select="cbc:CreditedQuantity/@unitCode"/>-->
											<xsl:call-template name="unidad_medidaC"/>
										</font>
									</td>
									<td width="40%" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>

											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="ValorAdicional2">
												<xsl:if test="$ValorAdicional1 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:variable name="ValorAdicional3">
												<xsl:if test="$ValorAdicional2 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="3"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional4">
												<xsl:if test="$ValorAdicional3 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="4"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional5">
												<xsl:if test="$ValorAdicional4 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="5"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional6">
												<xsl:if test="$ValorAdicional5 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="6"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional7">
												<xsl:if test="$ValorAdicional6 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="7"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional8">
												<xsl:if test="$ValorAdicional7 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="8"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional9">
												<xsl:if test="$ValorAdicional8 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="9"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional10">
												<xsl:if test="$ValorAdicional9 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="10"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional11">
												<xsl:if test="$ValorAdicional10 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="11"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional12">
												<xsl:if test="$ValorAdicional11 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="12"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional13">
												<xsl:if test="$ValorAdicional12 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="13"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional14">
												<xsl:if test="$ValorAdicional13 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="14"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional15">
												<xsl:if test="$ValorAdicional14 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="15"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional16">
												<xsl:if test="$ValorAdicional15 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="16"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional1"/></xsl:if>
											<xsl:if test="$ValorAdicional2 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional2"/></xsl:if>
											<xsl:if test="$ValorAdicional3 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional3"/></xsl:if>
											<xsl:if test="$ValorAdicional4 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional4"/></xsl:if>
											<xsl:if test="$ValorAdicional5 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional5"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional6 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional6"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional7 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional7"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional8 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional8"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional9 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional9"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional10 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional10"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional11 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional11"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional12 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional12"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional13 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional13"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional14 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional14"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional15 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional15"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional16 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional16"/>
											</xsl:if>
										</font>
									</td>


									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt;'46' and cbc:ID &lt;'70'  ">

								<tr>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:DebitedQuantity"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--><xsl:value-of select="cbc:DebitedQuantity/@unitCode"/>-->
											<xsl:call-template name="unidad_medidaD"/>
										</font>
									</td>
									<!--<td width="46%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>-->
									<td width="40%" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>

											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="ValorAdicional2">
												<xsl:if test="$ValorAdicional1 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:variable name="ValorAdicional3">
												<xsl:if test="$ValorAdicional2 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="3"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional4">
												<xsl:if test="$ValorAdicional3 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="4"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional5">
												<xsl:if test="$ValorAdicional4 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="5"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional6">
												<xsl:if test="$ValorAdicional5 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="6"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional7">
												<xsl:if test="$ValorAdicional6 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="7"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional8">
												<xsl:if test="$ValorAdicional7 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="8"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional9">
												<xsl:if test="$ValorAdicional8 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="9"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional10">
												<xsl:if test="$ValorAdicional9 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="10"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional11">
												<xsl:if test="$ValorAdicional10 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="11"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional12">
												<xsl:if test="$ValorAdicional11 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="12"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional13">
												<xsl:if test="$ValorAdicional12 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="13"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional14">
												<xsl:if test="$ValorAdicional13 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="14"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional15">
												<xsl:if test="$ValorAdicional14 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="15"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional16">
												<xsl:if test="$ValorAdicional15 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="16"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional1"/></xsl:if>
											<xsl:if test="$ValorAdicional2 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional2"/></xsl:if>
											<xsl:if test="$ValorAdicional3 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional3"/></xsl:if>
											<xsl:if test="$ValorAdicional4 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional4"/></xsl:if>
											<xsl:if test="$ValorAdicional5 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional5"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional6 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional6"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional7 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional7"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional8 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional8"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional9 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional9"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional10 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional10"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional11 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional11"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional12 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional12"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional13 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional13"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional14 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional14"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional15 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional15"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional16 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional16"/>
											</xsl:if>
										</font>
									</td>


									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<td width="10%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="DetallesEncabezado4">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr bgcolor="#FAFAFA">

							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Código</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cantidad</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Unidad</strong>
								</font>
							</td>

							<td width="46%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>

							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Pv. Unit</strong>
								</font>
							</td>
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Importe</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt;'69' and cbc:ID &lt;'93'  ">
								<tr>

									<td width="10%" align="center" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:InvoicedQuantity"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<td width="46%" align="left" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>

											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="ValorAdicional2">
												<xsl:if test="$ValorAdicional1 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:variable name="ValorAdicional3">
												<xsl:if test="$ValorAdicional2 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="3"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional4">
												<xsl:if test="$ValorAdicional3 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="4"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional5">
												<xsl:if test="$ValorAdicional4 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="5"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional6">
												<xsl:if test="$ValorAdicional5 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="6"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional7">
												<xsl:if test="$ValorAdicional6 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="7"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional8">
												<xsl:if test="$ValorAdicional7 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="8"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional9">
												<xsl:if test="$ValorAdicional8 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="9"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional10">
												<xsl:if test="$ValorAdicional9 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="10"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional11">
												<xsl:if test="$ValorAdicional10 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="11"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional12">
												<xsl:if test="$ValorAdicional11 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="12"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional13">
												<xsl:if test="$ValorAdicional12 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="13"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional14">
												<xsl:if test="$ValorAdicional13 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="14"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional15">
												<xsl:if test="$ValorAdicional14 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="15"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional16">
												<xsl:if test="$ValorAdicional15 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="16"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 !='-' ">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional1"/></xsl:if>
											<xsl:if test="$ValorAdicional2 != '' and $ValorAdicional2 !='-'">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional2"/></xsl:if>
											<xsl:if test="$ValorAdicional3 != '' and $ValorAdicional3 !='-'">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional3"/></xsl:if>
											<xsl:if test="$ValorAdicional4 != '' and $ValorAdicional4 !='-'">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional4"/></xsl:if>
											<xsl:if test="$ValorAdicional5 != '' and $ValorAdicional5 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional5"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional6 != '' and $ValorAdicional6 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional6"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional7 != '' and $ValorAdicional7 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional7"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional8 != '' and $ValorAdicional8 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional8"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional9 != '' and $ValorAdicional9 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional9"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional10 != '' and $ValorAdicional10 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional10"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional11 != '' and $ValorAdicional11 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional11"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional12 != '' and $ValorAdicional12 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional12"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional13 != '' and $ValorAdicional13 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional13"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional14 != '' and $ValorAdicional14 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional14"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional15 != '' and $ValorAdicional15 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional15"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional16 != '' and $ValorAdicional16 !='-'">
												<br/>
												<xsl:value-of select="$ValorAdicional16"/>
											</xsl:if>
										</font>
									</td>
									<td width="12%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
												<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,###.00','pen')"/>&#xA0;</xsl:if>
											<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
												<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,###.00','pen')"/>&#xA0;</xsl:if>
										</font>
									</td>
									<td width="12%" align="right" vAlign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;
											<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount/cbc:PriceAmount,'###,###,###.00','pen')"/>--></font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:if test="cbc:ID &gt;'69' and cbc:ID &lt;'93'  ">
								<tr>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:CreditedQuantity"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:value-of select="cbc:CreditedQuantity/@unitCode"/>-->
											<xsl:call-template name="unidad_medidaC"/>
										</font>
									</td>
									<td width="46%" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>

											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="ValorAdicional2">
												<xsl:if test="$ValorAdicional1 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:variable name="ValorAdicional3">
												<xsl:if test="$ValorAdicional2 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="3"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional4">
												<xsl:if test="$ValorAdicional3 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="4"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional5">
												<xsl:if test="$ValorAdicional4 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="5"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional6">
												<xsl:if test="$ValorAdicional5 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="6"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional7">
												<xsl:if test="$ValorAdicional6 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="7"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional8">
												<xsl:if test="$ValorAdicional7 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="8"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional9">
												<xsl:if test="$ValorAdicional8 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="9"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional10">
												<xsl:if test="$ValorAdicional9 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="10"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional11">
												<xsl:if test="$ValorAdicional10 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="11"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional12">
												<xsl:if test="$ValorAdicional11 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="12"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional13">
												<xsl:if test="$ValorAdicional12 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="13"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional14">
												<xsl:if test="$ValorAdicional13 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="14"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional15">
												<xsl:if test="$ValorAdicional14 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="15"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional16">
												<xsl:if test="$ValorAdicional15 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="16"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional1"/></xsl:if>
											<xsl:if test="$ValorAdicional2 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional2"/></xsl:if>
											<xsl:if test="$ValorAdicional3 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional3"/></xsl:if>
											<xsl:if test="$ValorAdicional4 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional4"/></xsl:if>
											<xsl:if test="$ValorAdicional5 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional5"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional6 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional6"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional7 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional7"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional8 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional8"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional9 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional9"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional10 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional10"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional11 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional11"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional12 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional12"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional13 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional13"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional14 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional14"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional15 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional15"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional16 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional16"/>
											</xsl:if>
										</font>
									</td>


									<td width="12%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">
												<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>

											<xsl:if test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">
												<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
										</font>
									</td>
									<td width="12%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt;'69' and cbc:ID &lt;'93'  ">

								<tr>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:DebitedQuantity"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--><xsl:value-of select="cbc:DebitedQuantity/@unitCode"/>-->
											<xsl:call-template name="unidad_medidaD"/>
										</font>
									</td>
									<!--<td width="46%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>-->
									<td width="46%" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>

											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="ValorAdicional2">
												<xsl:if test="$ValorAdicional1 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="2"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:variable name="ValorAdicional3">
												<xsl:if test="$ValorAdicional2 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="3"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional4">
												<xsl:if test="$ValorAdicional3 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="4"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional5">
												<xsl:if test="$ValorAdicional4 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
														<xsl:with-param name="NumAd" select="5"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional6">
												<xsl:if test="$ValorAdicional5 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="6"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional7">
												<xsl:if test="$ValorAdicional6 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="7"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional8">
												<xsl:if test="$ValorAdicional7 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="8"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional9">
												<xsl:if test="$ValorAdicional8 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="9"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional10">
												<xsl:if test="$ValorAdicional9 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="10"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional11">
												<xsl:if test="$ValorAdicional10 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="11"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional12">
												<xsl:if test="$ValorAdicional11 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="12"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional13">
												<xsl:if test="$ValorAdicional12 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="13"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional14">
												<xsl:if test="$ValorAdicional13 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="14"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional15">
												<xsl:if test="$ValorAdicional14 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="15"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>

											<xsl:variable name="ValorAdicional16">
												<xsl:if test="$ValorAdicional15 != ''">
													<xsl:call-template name="RetourneValAdItem">
														<xsl:with-param name="NumAd" select="16"/>
														<xsl:with-param name="NumLinea" select="cbc:ID"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional1"/></xsl:if>
											<xsl:if test="$ValorAdicional2 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional2"/></xsl:if>
											<xsl:if test="$ValorAdicional3 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional3"/></xsl:if>
											<xsl:if test="$ValorAdicional4 != ''">
												<br/>&#xA0;&#xA0;<xsl:value-of select="$ValorAdicional4"/></xsl:if>
											<xsl:if test="$ValorAdicional5 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional5"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional6 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional6"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional7 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional7"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional8 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional8"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional9 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional9"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional10 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional10"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional11 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional11"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional12 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional12"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional13 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional13"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional14 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional14"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional15 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional15"/>
											</xsl:if>
											<xsl:if test="$ValorAdicional16 != ''">
												<br/>
												<xsl:value-of select="$ValorAdicional16"/>
											</xsl:if>
										</font>
									</td>


									<td width="12%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">
												<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>

											<xsl:if test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">
												<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
										</font>
									</td>
									<td width="12%" align="right" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">
					</font>
				</td>
				<td width="10" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="40%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="lineaB5">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">
					</font>
				</td>
				<td width="10" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="36%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="6%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="6%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="6%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="6%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
			</tr>
			<xsl:call-template name="lineaB5">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="unidad_medida">
	<xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/>
		<!--<xsl:choose>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BG'">BG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BX'">BX</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='DR'">DM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='DT'">TMS</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='DZN'">DZ</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='EA'">EA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTK'">SF</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL'">GL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GRM'">GM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='HIU'">HD</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='HUR'">HR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='JR'">FK</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KT'">KI</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KWH'">KW</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LF'">FT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PA'">PC</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PK'">PK</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PR'">PR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='QT'">QT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='RO'">RL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SET'">ST</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='ST'">SH</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE'">TM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TU'">TB</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='ZS'">CN</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='ZZ'">SS</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BFT'">PTA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PL'">BAL</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>-->
	</xsl:template>

	<xsl:template name="unidad_medidaC">
	<xsl:value-of select="cbc:CreditedQuantity/@unitCode"/>
		<!--<xsl:choose>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BG'">BG</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BX'">BX</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='DR'">DM</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='DT'">TMS</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='DZN'">DZ</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='EA'">EA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='FTK'">SF</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='GLL'">GL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='GRM'">GM</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='HIU'">HD</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='HUR'">HR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='JR'">FK</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KT'">KI</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KWH'">KW</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LF'">FT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PA'">PC</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PK'">PK</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PR'">PR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='QT'">QT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='RO'">RL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='SET'">ST</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='ST'">SH</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='TNE'">TM</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='TU'">TB</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='ZS'">CN</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='ZZ'">SS</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PL'">BAL</xsl:when>

			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>-->
	</xsl:template>

	<xsl:template name="unidad_medidaD">
	<xsl:value-of select="cbc:DebitedQuantity/@unitCode"/>
		<!--<xsl:choose>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='BG'">BG</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='BX'">BX</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='DR'">DM</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='DT'">TMS</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='DZN'">DZ</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='EA'">EA</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='FTK'">SF</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='GLL'">GL</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='GRM'">GM</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='HIU'">HD</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='HUR'">HR</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='JR'">FK</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='KT'">KI</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='KWH'">KW</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='LF'">FT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PA'">PC</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PK'">PK</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PR'">PR</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='QT'">QT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='RO'">RL</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='SET'">ST</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='ST'">SH</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='TNE'">TM</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='TU'">TB</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='ZS'">CN</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='ZZ'">SS</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PL'">BAL</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>-->
	</xsl:template>

	<xsl:template name="RetourneValAdItem">
		<xsl:param name="NumLinea"/>
		<xsl:param name="NumAd"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
			<xsl:if test="pe1:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\xml\20254053822-08-FF11-11000010.xml.orig.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->