<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">
	
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes" />

	<xsl:template name="DetallesEncabezado">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>UNIDAD</strong>
								</font>
							</td>
							<td width="50%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="15%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>PV UNIT</strong>
								</font>
							</td>
							<td width="15%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>IMPORTE</strong>
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
							<tr>
								<!--Cantidad-->
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:choose>
											<xsl:when test="substring-after(cbc:InvoicedQuantity, '.') = '00'">
												<xsl:value-of select="substring-before(cbc:InvoicedQuantity, '.')"/>
											</xsl:when>
											<xsl:when test="substring-after(cbc:InvoicedQuantity, '.') = '000'">
												<xsl:value-of select="substring-before(cbc:InvoicedQuantity, '.')"/>
											</xsl:when>
											<xsl:when test="substring-after(cbc:InvoicedQuantity, '.') = '0000'">
												<xsl:value-of select="substring-before(cbc:InvoicedQuantity, '.')"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="cbc:InvoicedQuantity"/>
											</xsl:otherwise>
										</xsl:choose>
									</font>
								</td>
								<!--Unidad de medida-->
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida" />
									</font>
								</td>
								<!--Descripción-->
								<td width="50%" align="left" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Description" />

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

										<!--<xsl:if test="$ValorAdicional1 = '-'">
											<br/><xsl:value-of select="$ValorAdicional1"/>guion
										</xsl:if>-->
										<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 != '-'">
										<!--<xsl:if test="$ValorAdicional1 != '-'" or test="$ValorAdicional1 != ''">-->
											<br/><xsl:value-of select="$ValorAdicional1"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional2 != ''and $ValorAdicional2 != '-'">
											<br/><xsl:value-of select="$ValorAdicional2"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional3 != '' and $ValorAdicional3 != '-'">
											<br/><xsl:value-of select="$ValorAdicional3"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional4 != '' and $ValorAdicional4 != '-'">
											<br/><xsl:value-of select="$ValorAdicional4"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional5 != '' and $ValorAdicional5 != '-' ">
											<br/><xsl:value-of select="$ValorAdicional5"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional6 != '' and $ValorAdicional6 != '-' ">
											<br/><xsl:value-of select="$ValorAdicional6"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional7 != '' and $ValorAdicional7 != '-' ">
											<br/><xsl:value-of select="$ValorAdicional7"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional8 != '' and $ValorAdicional8 != '-' ">
											<br/><xsl:value-of select="$ValorAdicional8"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional9 != '' and $ValorAdicional9 != '-' ">
											<br/><xsl:value-of select="$ValorAdicional9"/>
										</xsl:if>
									</font>
								</td>
								<!--Precio V. Unit-->
								<td width="15%" align="right" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount != '0.00'">
											<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
												<!--<xsl:if test="cbc:PriceTypeCode='01' and cbc:PriceAmount!='0.00' and cbc:PriceAmount!='0'">-->
												<xsl:if test="cbc:PriceTypeCode = '01'">
													<xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.00', 'pen')" />
												</xsl:if>
											</xsl:for-each>
											<!--<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
												<xsl:if test="cbc:PriceTypeCode='02'">
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')"/>
												</xsl:if>
											</xsl:for-each>-->
										</xsl:if>
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount = '0.00'">
											<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
												<xsl:if test="cbc:PriceTypeCode = '02'">
													<xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.00', 'pen')" />
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</font>
								</td>
								<!--Importe-->
								<td width="15%" align="right" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">
												<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')" />
											</xsl:when>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">
												<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')" />
											</xsl:when>
											<xsl:otherwise></xsl:otherwise>
										</xsl:choose>
									</font>
								</td>
							</tr>
						</xsl:for-each>
						
						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<tr>
								<!--Cantidad-->
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:choose>
											<xsl:when test="substring-after(cbc:CreditedQuantity, '.') = '00'">
												<xsl:value-of select="substring-before(cbc:CreditedQuantity, '.')"/>
											</xsl:when>
											<xsl:when test="substring-after(cbc:CreditedQuantity, '.') = '000'">
												<xsl:value-of select="substring-before(cbc:CreditedQuantity, '.')"/>
											</xsl:when>
											<xsl:when test="substring-after(cbc:CreditedQuantity, '.') = '0000'">
												<xsl:value-of select="substring-before(cbc:CreditedQuantity, '.')"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="cbc:CreditedQuantity"/>
											</xsl:otherwise>
										</xsl:choose>
									</font>
								</td>
								<!--Unidad de medida-->
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida" />
									</font>
								</td>
								<!--Descripción-->
								<td width="50%" align="left" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Description" />

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

										<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 != '-'">
											<br/><xsl:value-of select="$ValorAdicional1"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional2 != '' and $ValorAdicional2 != '-'">
											<br/><xsl:value-of select="$ValorAdicional2"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional3 != '' and $ValorAdicional3 != '-'">
											<br/><xsl:value-of select="$ValorAdicional3"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional4 != '' and $ValorAdicional4 != '-'">
											<br/><xsl:value-of select="$ValorAdicional4"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional5 != '' and $ValorAdicional5 != '-'">
											<br/><xsl:value-of select="$ValorAdicional5"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional6 != '' and $ValorAdicional6 != '-'">
											<br/><xsl:value-of select="$ValorAdicional6"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional7 != '' and $ValorAdicional7 != '-'">
											<br/><xsl:value-of select="$ValorAdicional7"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional8 != '' and $ValorAdicional8 != '-'">
											<br/><xsl:value-of select="$ValorAdicional8"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional9 != '' and $ValorAdicional9 != '-'">
											<br/><xsl:value-of select="$ValorAdicional9"/>
										</xsl:if>
									</font>
								</td>
								<!--Precio V. Unit-->
								<td width="15%" align="right" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount != '0'">
											<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
												<xsl:if test="cbc:PriceTypeCode = '01' and cbc:PriceAmount != '0.00' and cbc:PriceAmount != '0'">
													<xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.00', 'pen')" />
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
												<xsl:if test="cbc:PriceTypeCode = '02'">
													<xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.00', 'pen')" />
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount = '0'">
											<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
												<xsl:if test="cbc:PriceTypeCode = '02'">
													<xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.00', 'pen')" />
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</font>
								</td>
								<!--Importe-->
								<td width="15%" align="right" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')" />
									</font>
								</td>
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<tr>
								<!--Cantidad-->
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:choose>
											<xsl:when test="substring-after(cbc:DebitedQuantity, '.') = '00'">
												<xsl:value-of select="substring-before(cbc:DebitedQuantity, '.')"/>
											</xsl:when>
											<xsl:when test="substring-after(cbc:DebitedQuantity, '.') = '000'">
												<xsl:value-of select="substring-before(cbc:DebitedQuantity, '.')"/>
											</xsl:when>
											<xsl:when test="substring-after(cbc:DebitedQuantity, '.') = '0000'">
												<xsl:value-of select="substring-before(cbc:DebitedQuantity, '.')"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="cbc:DebitedQuantity"/>
											</xsl:otherwise>
										</xsl:choose>
									</font>
								</td>
								<!--Unidad de medida-->
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida" />
									</font>
								</td>
								<!--Descripción-->
								<td width="50%" align="left" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Description" />

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

										<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 != '-'">
											<br/><xsl:value-of select="$ValorAdicional1"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional2 != '' and $ValorAdicional2 != '-'">
											<br/><xsl:value-of select="$ValorAdicional2"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional3 != '' and $ValorAdicional3 != '-'">
											<br/><xsl:value-of select="$ValorAdicional3"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional4 != '' and $ValorAdicional4 != '-'">
											<br/><xsl:value-of select="$ValorAdicional4"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional5 != '' and $ValorAdicional5 != '-'">
											<br/><xsl:value-of select="$ValorAdicional5"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional6 != '' and $ValorAdicional6 != '-'">
											<br/><xsl:value-of select="$ValorAdicional6"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional7 != '' and $ValorAdicional7 != '-'">
											<br/><xsl:value-of select="$ValorAdicional7"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional8 != '' and $ValorAdicional8 != '-'">
											<br/><xsl:value-of select="$ValorAdicional8"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional9 != '' and $ValorAdicional9 != '-'">
											<br/><xsl:value-of select="$ValorAdicional9"/>
										</xsl:if>
									</font>
								</td>
								<!--Precio V. Unit-->
								<td width="15%" align="right" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount, '###,###,##0.00', 'pen')" />
									</font>
								</td>
								<!--Importe-->
								<td width="15%" align="right" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')" />
									</font>
								</td>
							</tr>
						</xsl:for-each>
						
						<xsl:call-template name="lineaB2"><xsl:with-param name="cont" select="$numColBl" /></xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="lineaB2">
		<xsl:param name="cont" />
		<xsl:if test="$cont&gt;0">
			<tr>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;</font>
				</td>
				<td width="50%" align="left" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;</font>
				</td>
				<td width="15%" align="right" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;</font>
				</td>
				<td width="15%" align="right" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;</font>
				</td>
			</tr>
			<xsl:call-template name="lineaB2">
				<xsl:with-param name="cont" select="$cont - 1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="unidad_medida">
		<xsl:if test="/pe:Invoice">
			<xsl:choose>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'PL'">BAL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'D64'">BLK</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'BG'">BOL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'BO'">BOT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'BX'">CAJ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'CY'">CIL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'CLT'">CL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'CMT'">CM</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'CJ'">CON</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'DLT'">DL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'GLL'">GAL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'GRM'">GR</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'HUR'">HRA</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'KT'">JGO</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'KGM'">KG</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'KWT'">KW</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'LBR'">LB</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'LTR'">LT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MTR'">M</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MTK'">M2</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MTQ'">M3</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MIL'">MIL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'D61'">MIN</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MLT'">ML</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MMT'">MM</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'NPR'">PAR</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'FTK'">PI2</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'FTQ'">PI3</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'PA'">PQT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'INH'">PUL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'NRL'">ROL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'TNE'">TON</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'NIU'">UNI</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'SA'">SAC</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'PQ'">PAQ</xsl:when>
				<xsl:otherwise>NIU</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote" >
			<!--<td width="10%" align="center" valign="top">-->
			<xsl:choose>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'PL'">BAL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'D64'">BLK</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'BG'">BOL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'BO'">BOT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'BX'">CAJ</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'CY'">CIL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'CLT'">CL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'CMT'">CM</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'CJ'">CON</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'DLT'">DL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'GLL'">GAL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'GRM'">GR</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'HUR'">HRA</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'KT'">JGO</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'KGM'">KG</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'KWT'">KW</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'LBR'">LB</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'LTR'">LT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'MTR'">M</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'MTK'">M2</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'MTQ'">M3</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'MIL'">MIL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'D61'">MIN</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'MLT'">ML</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'MMT'">MM</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'NPR'">PAR</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'FTK'">PI2</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'FTQ'">PI3</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'PA'">PQT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'INH'">PUL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'NRL'">ROL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'TNE'">TON</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'NIU'">UNI</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'SA'">SAC</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'PQ'">PAQ</xsl:when>
				<xsl:otherwise>NIU</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
			<xsl:choose>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'PL'">BAL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'D64'">BLK</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'BG'">BOL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'BO'">BOT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'BX'">CAJ</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'CY'">CIL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'CLT'">CL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'CMT'">CM</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'CJ'">CON</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'DLT'">DL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'GLL'">GAL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'GRM'">GR</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'HUR'">HRA</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'KT'">JGO</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'KGM'">KG</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'KWT'">KW</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'LBR'">LB</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'LTR'">LT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'MTR'">M</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'MTK'">M2</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'MTQ'">M3</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'MIL'">MIL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'D61'">MIN</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'MLT'">ML</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'MMT'">MM</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'NPR'">PAR</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'FTK'">PI2</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'FTQ'">PI3</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'PA'">PQT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'INH'">PUL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'NRL'">ROL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'TNE'">TON</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'NIU'">UNI</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'SA'">SAC</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'PQ'">PAQ</xsl:when>
				<xsl:otherwise>NIU</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="RetourneValAdItem">
		<xsl:param name="NumLinea"/>
		<xsl:param name="NumAd"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Linea = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe:Valor" />
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
			<xsl:if test="pe1:Linea = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe1:Valor" />
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Linea = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe2:Valor" />
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->