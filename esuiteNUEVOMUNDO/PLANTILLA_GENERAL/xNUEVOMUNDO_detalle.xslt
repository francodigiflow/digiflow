<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" exclude-result-prefixes="cac cbc ccts ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Detalle">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="cols">
						<tr>
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<td width="14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<td width="48%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCION</strong> / 
									<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
										<strong>DESCRIPTION</strong>
									</xsl:if>
								</font>
							</td>
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PIEZAS</strong><br/>
									<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
										<strong>PIECES</strong>
									</xsl:if>
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CALIDAD</strong><br/>
									<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
										<strong>QUALITY</strong>
									</xsl:if>
								</font>
							</td>
							<td width="7%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong><br/>
									<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
										<strong>QUANTITY</strong>
									</xsl:if>
								</font>
							</td>
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UM</strong>
								</font>
							</td>
							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VU</strong>
								</font>
							</td>

							<!--<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Dscto.</strong>
								</font>
							</td>-->
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>IMPORTE</strong><br/>
									<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
										<strong>AMOUNT</strong>
									</xsl:if>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="cols">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'24'  ">
								<tr>
									<!-- ITEM -->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--CODIGO-->
									<td width="14%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--Piezas.-->
									<td width="4%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--Calidad.-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional2"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="7%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>&#xA0;
											<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
									</td>
									<!--UNIDAD-->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--PRECIO UNIT.-->
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<!--<xsl:for-each select="//cac:PricingReference/cac:AlternativeConditionPrice">
			                              <xsl:if test="cbc:PriceAmount!=0">
				                               <xsl:value-of select="cbc:PriceAmount"/>
			                              </xsl:if>
			    	                    </xsl:for-each>-->
											<!-- <xsl:if test="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount!=0">-->
											<!-- <xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;-->
											<!-- <xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>-->
											<!-- </xsl:if>-->

											<xsl:variable name="CTSValor1">
												<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
													<xsl:if test="cbc:PriceTypeCode = '02'">
														<xsl:value-of select="cbc:PriceAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>

											<xsl:variable name="CTSValorFinal">
												<xsl:if test="$CTSValor1 = ''">
													<xsl:value-of select="cac:Price/cbc:PriceAmount"/>
												</xsl:if>
												<xsl:if test="$CTSValor1 != ''">
													<xsl:value-of select="$CTSValor1"/>
												</xsl:if>
											</xsl:variable>
											
											<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0;

											<!-- <xsl:choose> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 3"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 4"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 5"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 6"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 7"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 8"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 9"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 10"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:otherwise> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0; -->
													<!-- </xsl:otherwise> -->
											<!-- </xsl:choose> -->
										</font>
									</td>
									<!-- VALOR UNIT.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--DSCTO.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:AllowanceCharge/cbc:Amount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--VALOR VTA.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'24'  ">
								<tr>
									<!-- ITEM -->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--CODIGO-->
									<td width="14%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--Piezas.-->
									<td width="4%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--Calidad-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional2"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="7%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>&#xA0;
											<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
									</td>
									<!--UNIDAD-->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!-- VALOR UNIT.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->

									<!--DSCTO.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:AllowanceCharge/cbc:chargeIndicator,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--PRECIO UNIT.-->
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>-->
											<!--<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount"/>-->
											<xsl:value-of select="cac:Price/cbc:PriceAmount"/>
											</font>
									</td>
									<!--VALOR VTA.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'24'  ">
								<tr>
									<!-- ITEM -->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--CODIGO-->
									<td width="14%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--Piezas.-->
									<td width="4%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--CALIDAD-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional2"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="7%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>&#xA0;
											<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
									</td>
									<!--UNIDAD-->

									<!--<xsl:if select="/pe:Invoice/cac:InvoiceLine">-->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--</xsl:if>-->
									<!--<xsl:if select="/pe1:CreditNote/cac:CreditNoteLine">
										<td width="4%" align="center">
											<font face="Arial, Helvetica, sans-serif" size="0.5">
												<xsl:call-template name="unidad_medidaC"/>
											</font>
										</td>
									</xsl:if>-->

									<!--<xsl:if select="/pe2:DebitNote/cac:DebitNoteLine">
										<td width="4%" align="center">
											<font face="Arial, Helvetica, sans-serif" size="0.5">
												<xsl:call-template name="unidad_medidaD"/>
											</font>
										</td>
									</xsl:if>-->

									<!-- VALOR UNIT.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--DSCTO.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Allowancecharge/cbc:chargeIndicator,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--PRECIO UNIT.-->
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>-->
											<xsl:value-of select="cac:Price/cbc:PriceAmount"/>
											</font>
									</td>
									<!--VALOR VTA.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<!-- <xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template> -->

						<tr>
									<!-- ITEM -->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--CODIGO-->
									<td width="14%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<!--Descripcion-->
											
										</font>
									</td>
									<!--Piezas.-->
									<td width="4%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--Calidad.-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="7%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											</font>
									</td>
									<!--UNIDAD-->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--PRECIO UNIT.-->
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									
									<!--VALOR VTA.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">

											</font>
									</td>
								</tr>
						<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='6' and pe:Valor!='-'">
							<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="none">
								<tr>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>CANJEADO CON:</strong>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="6"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='10'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="7"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='11'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="12"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='12'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="13"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='13'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="14"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='14'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="15"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='15'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="16"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='16'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="17"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='17'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="18"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='18'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%" align="center">
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="19"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='19'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="20"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='20'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="21"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='21'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="22"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='22'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="23"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='23'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="24"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='24'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="25"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='25'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="26"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='26'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="27"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='27'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%" align="center">
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="28"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='28'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="29"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='29'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="30"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='30'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="31"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='31'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="32"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='32'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="33"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='33'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="34"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='34'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="35"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='35'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="36"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='36'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%" align="center">
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="37"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='37'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="38"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='38'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="39"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='39'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="40"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='40'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="41"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='41'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="42"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='42'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="43"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='43'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="44"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='44'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="45"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='45'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%" align="center">
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="46"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='46'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="47"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='47'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="48"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='48'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="49"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='49'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="50"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='50'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="51"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='51'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="52"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='52'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="53"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='53'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="54"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='54'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%" align="center">
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="55"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='55'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="56"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='56'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="57"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='57'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="58"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='58'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="59"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='59'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="60"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='60'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="61"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='61'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="62"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='62'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="63"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='63'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%" align="center">
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="64"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='64'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="65"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='65'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="66"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='66'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="67"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='67'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="68"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='68'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="69"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='69'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="70"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='70'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="71"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='71'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="72"/>
											</xsl:call-template>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='72'">
													<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
							</table>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Detalle2">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="cols">
						<tr>
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<td width="14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<td width="48%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCION</strong>
								</font>
							</td>
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PIEZAS</strong>
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CALIDAD</strong>
								</font>
							</td>
							<td width="7%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UM</strong>
								</font>
							</td>
							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VU</strong>
								</font>
							</td>

							<!--<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Dscto.</strong>
								</font>
							</td>-->
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>IMPORTE</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="cols">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt;'23' and cbc:ID &lt;'47'  ">
								<tr>
									<!-- ITEM -->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--CODIGO-->
									<td width="14%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--Piezas.-->
									<td width="4%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--Calidad.-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional2"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="7%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>&#xA0;
											<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
									</td>
									<!--UNIDAD-->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--PRECIO UNIT.-->
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<!--<xsl:for-each select="//cac:PricingReference/cac:AlternativeConditionPrice">
			                              <xsl:if test="cbc:PriceAmount!=0">
				                               <xsl:value-of select="cbc:PriceAmount"/>
			                              </xsl:if>
			    	                    </xsl:for-each>-->
											<!-- <xsl:if test="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount!=0">-->
											<!-- <xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;-->
											<!-- <xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>-->
											<!-- </xsl:if>-->
											
											<xsl:variable name="CTSValor1">
												<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
													<xsl:if test="cbc:PriceTypeCode = '02'">
														<xsl:value-of select="cbc:PriceAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>

											<xsl:variable name="CTSValorFinal">
												<xsl:if test="$CTSValor1 = ''">
													<xsl:value-of select="cac:Price/cbc:PriceAmount"/>
												</xsl:if>
												<xsl:if test="$CTSValor1 != ''">
													<xsl:value-of select="$CTSValor1"/>
												</xsl:if>
											</xsl:variable>
											
											<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0;

											<!-- <xsl:variable name="CTSValor1"> -->
												<!-- <xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice"> -->
													<!-- <xsl:if test="cbc:PriceTypeCode = '02'"> -->
														<!-- <xsl:value-of select="cbc:PriceAmount"/> -->
													<!-- </xsl:if> -->
												<!-- </xsl:for-each> -->
											<!-- </xsl:variable> -->

											<!-- <xsl:variable name="CTSValorFinal"> -->
												<!-- <xsl:if test="$CTSValor1 = ''"> -->
													<!-- <xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount"/> -->
												<!-- </xsl:if> -->
												<!-- <xsl:if test="$CTSValor1 != ''"> -->
													<!-- <xsl:value-of select="$CTSValor1"/> -->
												<!-- </xsl:if> -->
											<!-- </xsl:variable> -->

											<!-- <xsl:choose> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 3"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 4"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 5"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 6"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 7"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 8"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 9"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 10"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:otherwise> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:otherwise> -->
											<!-- </xsl:choose> -->
										</font>
									</td>
									<!-- VALOR UNIT.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--DSCTO.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:AllowanceCharge/cbc:Amount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--VALOR VTA.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:if test="cbc:ID &gt;'23' and cbc:ID &lt;'47'  ">
								<tr>
									<!-- ITEM -->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--CODIGO-->
									<td width="14%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--Piezas.-->
									<td width="4%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--Calidad-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="7%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>&#xA0;
											<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
									</td>
									<!--UNIDAD-->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!-- VALOR UNIT.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->

									<!--DSCTO.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:AllowanceCharge/cbc:chargeIndicator,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--PRECIO UNIT.-->
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<!--VALOR VTA.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt;'23' and cbc:ID &lt;'47'  ">
								<tr>
									<!-- ITEM -->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--CODIGO-->
									<td width="14%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--Piezas.-->
									<td width="4%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--CALIDAD-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="7%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>&#xA0;
											<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
									</td>
									<!--UNIDAD-->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!-- VALOR UNIT.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--DSCTO.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Allowancecharge/cbc:chargeIndicator,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--PRECIO UNIT.-->
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<!--VALOR VTA.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<!-- <xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template> -->
						<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>
					</table>
				</td>
			</tr>

			<!--<tr>
				<td>
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
				<xsl:if test="pe:Codigo='6' and pe:Valor!='-'">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="none">
						<tr>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANJEADO CON:</strong>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="6"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="7"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="12"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="13"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="14"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="15"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="16"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="17"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="18"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="19"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="20"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="21"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="22"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="23"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="24"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="25"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="26"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="27"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="28"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="29"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="30"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="31"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="32"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="33"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="34"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="35"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="36"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="37"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="38"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="39"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="40"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="41"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="42"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="43"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="44"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="45"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="46"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="47"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="48"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="49"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="50"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="51"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="52"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="53"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="54"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="55"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="56"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="57"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="58"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="59"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="60"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="61"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="62"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="63"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="64"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="65"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="66"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="67"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="68"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="69"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="70"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="71"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="72"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
					</table>
					</xsl:if>
					</xsl:for-each>
				</td>
			</tr>-->
		</table>
	</xsl:template>

	<xsl:template name="Detalle3">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="cols">
						<tr>
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<td width="14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<td width="48%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCION</strong>
								</font>
							</td>
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PIEZAS</strong>
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CALIDAD</strong>
								</font>
							</td>
							<td width="7%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UM</strong>
								</font>
							</td>
							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VU</strong>
								</font>
							</td>

							<!--<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Dscto.</strong>
								</font>
							</td>-->
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>IMPORTE</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="cols">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt;'46' and cbc:ID &lt;'70'  ">
								<tr>
									<!-- ITEM -->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--CODIGO-->
									<td width="14%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--Piezas.-->
									<td width="4%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--Calidad.-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional2"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="7%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>&#xA0;
											<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
									</td>
									<!--UNIDAD-->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--PRECIO UNIT.-->
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<!--<xsl:for-each select="//cac:PricingReference/cac:AlternativeConditionPrice">
			                              <xsl:if test="cbc:PriceAmount!=0">
				                               <xsl:value-of select="cbc:PriceAmount"/>
			                              </xsl:if>
			    	                    </xsl:for-each>-->
											<!-- <xsl:if test="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount!=0">-->
											<!-- <xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;-->
											<!-- <xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>-->
											<!-- </xsl:if>-->

											<!-- <xsl:variable name="CTSValor1"> -->
												<!-- <xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice"> -->
													<!-- <xsl:if test="cbc:PriceTypeCode = '02'"> -->
														<!-- <xsl:value-of select="cbc:PriceAmount"/> -->
													<!-- </xsl:if> -->
												<!-- </xsl:for-each> -->
											<!-- </xsl:variable> -->

											<!-- <xsl:variable name="CTSValorFinal"> -->
												<!-- <xsl:if test="$CTSValor1 = ''"> -->
													<!-- <xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount"/> -->
												<!-- </xsl:if> -->
												<!-- <xsl:if test="$CTSValor1 != ''"> -->
													<!-- <xsl:value-of select="$CTSValor1"/> -->
												<!-- </xsl:if> -->
											<!-- </xsl:variable> -->

											<!-- <xsl:choose> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 3"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 4"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 5"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 6"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 7"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 8"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 9"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 10"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:otherwise> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:otherwise> -->
											<!-- </xsl:choose> -->
											<xsl:variable name="CTSValor1">
												<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
													<xsl:if test="cbc:PriceTypeCode = '02'">
														<xsl:value-of select="cbc:PriceAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>

											<xsl:variable name="CTSValorFinal">
												<xsl:if test="$CTSValor1 = ''">
													<xsl:value-of select="cac:Price/cbc:PriceAmount"/>
												</xsl:if>
												<xsl:if test="$CTSValor1 != ''">
													<xsl:value-of select="$CTSValor1"/>
												</xsl:if>
											</xsl:variable>
											
											<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0;
											
										</font>
									</td>
									<!-- VALOR UNIT.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--DSCTO.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:AllowanceCharge/cbc:Amount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--VALOR VTA.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:if test="cbc:ID &gt;'46' and cbc:ID &lt;'70'  ">
								<tr>
									<!-- ITEM -->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--CODIGO-->
									<td width="14%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--Piezas.-->
									<td width="4%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--Calidad-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="7%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>&#xA0;
											<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
									</td>
									<!--UNIDAD-->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!-- VALOR UNIT.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->

									<!--DSCTO.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:AllowanceCharge/cbc:chargeIndicator,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--PRECIO UNIT.-->
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<!--VALOR VTA.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt;'46' and cbc:ID &lt;'70'  ">
								<tr>
									<!-- ITEM -->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--CODIGO-->
									<td width="14%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--Piezas.-->
									<td width="4%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--CALIDAD-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="7%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>&#xA0;
											<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
									</td>
									<!--UNIDAD-->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!-- VALOR UNIT.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--DSCTO.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Allowancecharge/cbc:chargeIndicator,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--PRECIO UNIT.-->
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<!--VALOR VTA.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<!-- <xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template> -->
						<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>
					</table>
				</td>
			</tr>

			<!--<tr>
				<td>
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
				<xsl:if test="pe:Codigo='6' and pe:Valor!='-'">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="none">
						<tr>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANJEADO CON:</strong>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="6"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="7"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="12"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="13"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="14"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="15"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="16"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="17"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="18"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="19"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="20"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="21"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="22"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="23"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="24"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="25"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="26"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="27"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="28"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="29"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="30"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="31"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="32"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="33"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="34"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="35"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="36"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="37"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="38"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="39"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="40"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="41"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="42"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="43"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="44"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="45"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="46"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="47"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="48"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="49"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="50"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="51"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="52"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="53"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="54"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="55"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="56"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="57"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="58"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="59"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="60"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="61"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="62"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="63"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="64"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="65"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="66"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="67"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="68"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="69"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="70"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="71"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="72"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
					</table>
					</xsl:if>
					</xsl:for-each>
				</td>
			</tr>-->
		</table>
	</xsl:template>

	<xsl:template name="Detalle4">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="cols">
						<tr>
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<td width="14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<td width="48%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCION</strong>
								</font>
							</td>
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PIEZAS</strong>
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CALIDAD</strong>
								</font>
							</td>
							<td width="7%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UM</strong>
								</font>
							</td>
							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VU</strong>
								</font>
							</td>

							<!--<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Dscto.</strong>
								</font>
							</td>-->
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>IMPORTE</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="cols">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt;'69' and cbc:ID &lt;'93'  ">
								<tr>
									<!-- ITEM -->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--CODIGO-->
									<td width="14%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--Piezas.-->
									<td width="4%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--Calidad.-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional2"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="7%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>&#xA0;
											<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
									</td>
									<!--UNIDAD-->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--PRECIO UNIT.-->
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<!--<xsl:for-each select="//cac:PricingReference/cac:AlternativeConditionPrice">
			                              <xsl:if test="cbc:PriceAmount!=0">
				                               <xsl:value-of select="cbc:PriceAmount"/>
			                              </xsl:if>
			    	                    </xsl:for-each>-->
											<!-- <xsl:if test="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount!=0">-->
											<!-- <xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;-->
											<!-- <xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>-->
											<!-- </xsl:if>-->
											<xsl:variable name="CTSValor1">
												<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
													<xsl:if test="cbc:PriceTypeCode = '02'">
														<xsl:value-of select="cbc:PriceAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>

											<xsl:variable name="CTSValorFinal">
												<xsl:if test="$CTSValor1 = ''">
													<xsl:value-of select="cac:Price/cbc:PriceAmount"/>
												</xsl:if>
												<xsl:if test="$CTSValor1 != ''">
													<xsl:value-of select="$CTSValor1"/>
												</xsl:if>
											</xsl:variable>
											
											<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0;
											<!-- <xsl:variable name="CTSValor1"> -->
												<!-- <xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice"> -->
													<!-- <xsl:if test="cbc:PriceTypeCode = '02'"> -->
														<!-- <xsl:value-of select="cbc:PriceAmount"/> -->
													<!-- </xsl:if> -->
												<!-- </xsl:for-each> -->
											<!-- </xsl:variable> -->

											<!-- <xsl:variable name="CTSValorFinal"> -->
												<!-- <xsl:if test="$CTSValor1 = ''"> -->
													<!-- <xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount"/> -->
												<!-- </xsl:if> -->
												<!-- <xsl:if test="$CTSValor1 != ''"> -->
													<!-- <xsl:value-of select="$CTSValor1"/> -->
												<!-- </xsl:if> -->
											<!-- </xsl:variable> -->

											<!-- <xsl:choose> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 3"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 4"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 5"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 6"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 7"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 8"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 9"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 10"> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000000', 'pen')"/>&#xA0;</xsl:when> -->
												<!-- <xsl:otherwise> -->
													<!-- <xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:otherwise> -->
											<!-- </xsl:choose> -->
										</font>
									</td>
									<!-- VALOR UNIT.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--DSCTO.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:AllowanceCharge/cbc:Amount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--VALOR VTA.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:if test="cbc:ID &gt;'69' and cbc:ID &lt;'93'  ">
								<tr>
									<!-- ITEM -->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--CODIGO-->
									<td width="14%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--Piezas.-->
									<td width="4%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--Calidad-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="7%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>&#xA0;
											<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
									</td>
									<!--UNIDAD-->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!-- VALOR UNIT.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->

									<!--DSCTO.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:AllowanceCharge/cbc:chargeIndicator,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--PRECIO UNIT.-->
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<!--VALOR VTA.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt;'69' and cbc:ID &lt;'93'  ">
								<tr>
									<!-- ITEM -->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--CODIGO-->
									<td width="14%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--Piezas.-->
									<td width="4%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--CALIDAD-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>&#xA0;</font>
											</xsl:if>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="7%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>&#xA0;
											<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
									</td>
									<!--UNIDAD-->
									<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!-- VALOR UNIT.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--DSCTO.-->
									<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="0.5">
										<xsl:value-of select="format-number(cac:Allowancecharge/cbc:chargeIndicator,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>-->
									<!--PRECIO UNIT.-->
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
									<!--VALOR VTA.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<!-- <xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template> -->
						<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>
					</table>
				</td>
			</tr>

			<!--<tr>
				<td>
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
				<xsl:if test="pe:Codigo='6' and pe:Valor!='-'">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="none">
						<tr>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANJEADO CON:</strong>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="6"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="7"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="12"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="13"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="14"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="15"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="16"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="17"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="18"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="19"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="20"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="21"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="22"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="23"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="24"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="25"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="26"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="27"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="28"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="29"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="30"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="31"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="32"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="33"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="34"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="35"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="36"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="37"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="38"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="39"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="40"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="41"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="42"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="43"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="44"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="45"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="46"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="47"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="48"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="49"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="50"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="51"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="52"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="53"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="54"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="55"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="56"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="57"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="58"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="59"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="60"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="61"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="62"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="63"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
						<tr>
							<td width="10%" align="center">
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="64"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="65"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="66"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="67"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="68"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="69"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="70"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="71"/>
											</xsl:call-template>
								</font>
							</td>
							<td width="10%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="72"/>
											</xsl:call-template>
								</font>
							</td>
						</tr>
					</table>
					</xsl:if>
					</xsl:for-each>
				</td>
			</tr>-->
		</table>
	</xsl:template>

	<xsl:template name="RetourneValAd">
		<xsl:param name="NumAd"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$NumAd">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$NumAd">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$NumAd">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
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


	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr>
				<td width="4%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="14%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="48%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="4%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="6%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="7%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="4%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<!--<td width="8%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>-->
				<!--<td width="8%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>-->
				<td width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>


	<xsl:template name="unidad_medida">
		<xsl:choose>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='C62'">C/U</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='C62'">PZA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PR'">PAR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PK'">PQT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='ST'">HOJ</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='RO'">ROL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='JR'">FCO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PD'">BLK</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SET'">JGO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR'">L</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BX'">CJA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='AV'">CAP</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FOT'">PIE</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE'">TM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='ST'">PGO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BG'">BLS</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CA'">LTA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='STN'">TON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGS'">KGS</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTK'">P2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR'">LBS</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NPT'">EQP</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GRM'">G</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='5B'">LOT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='C62'">C/U</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='C62'">PZA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PR'">PAR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PK'">PQT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='ST'">HOJ</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='RO'">ROL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='JR'">FCO</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PD'">BLK</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='SET'">JGO</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LTR'">L</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BX'">CJA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='AV'">CAP</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='FOT'">PIE</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='TNE'">TM</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='ST'">PGO</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BG'">BLS</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='CA'">LTA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='STN'">TON</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KGS'">KGS</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='FTK'">P2</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LBR'">LBS</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='NPT'">EQP</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='GRM'">G</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='5B'">LOT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='C62'">C/U</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='C62'">PZA</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PR'">PAR</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PK'">PQT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='ST'">HOJ</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='RO'">ROL</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='JR'">FCO</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PD'">BLK</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='SET'">JGO</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='LTR'">L</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='BX'">CJA</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='AV'">CAP</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='FOT'">PIE</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='TNE'">TM</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='ST'">PGO</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='BG'">BLS</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='CA'">LTA</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='STN'">TON</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='KGS'">KGS</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='FTK'">P2</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='LBR'">LBS</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='NPT'">EQP</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='GRM'">G</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='5B'">LOT</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\M&amp;M Trading\DESARROLLO RI\ri_mm_lvm\20386222771&#x2D;01&#x2D;F001&#x2D;00025673.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="bGenerateByteCode" value="true"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="xsltVersion" value="2.0"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->