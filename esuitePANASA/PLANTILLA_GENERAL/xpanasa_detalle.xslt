<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
	exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes" />

	<xsl:template name="Detalle">
		<xsl:variable name="CTSDetalle">
			<xsl:call-template name="DatoAdicional02">
				<xsl:with-param name="item" select="1" />
				<xsl:with-param name="adicional" select="2" />
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="CTSExportacion">
			<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="16" /></xsl:call-template>
		</xsl:variable>

		<xsl:if test="$CTSDetalle = ''">
			<xsl:if test="$CTSExportacion = ''">
				<table border="1" width="100%" cellpadding="1" cellspacing="0" rules="cols">
					<tr bgcolor="silver">
						<td width="8%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>CÓDIGO</strong>
							</font>
						</td>
						<td width="40%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>DESCRIPCIÓN</strong>
							</font>
						</td>
						<td width="9%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>UNIDAD</strong>
							</font>
						</td>
						<td width="9%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>CANTIDAD</strong>
							</font>
						</td>
						<td width="9%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>VALOR VENTA</strong>
							</font>
						</td>

                 <!-- esta código es para hacer condición 
               si el descuento es >0  debe salir en la facura
                      si no no debe salir =
             <xsl:if test="//cac:AllowanceCharge/cbc:Amount!='0.00'"> 
						 </xsl:if>
						
						 -->


						<xsl:if test="//cac:AllowanceCharge/cbc:Amount!='0.00'"> 

						<td width="8%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>% DSCTO.</strong>
							</font>
						</td>
						
                    </xsl:if>
					
					
					
		

						
						<td width="9%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>PRECIO UNIT.</strong>
							</font>
						</td>
						<td width="9%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>IMPORTE</strong>
							</font>
						</td>
					</tr>

					<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
				
					<xsl:variable name="Descuento">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:Amount">
										<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
									</xsl:if>
								</xsl:variable>
								 
								
							
						<tr>

							<!--CODIGO-->
							<td width="8%" align="center">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID" />
								</font>
							</td>
							<!--DESCRIPCION-->
							<td width="40%">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="cac:Item/cbc:Description" />
								</font>
							</td>
							<!--UNIDAD-->
							<td width="8%" align="center">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:call-template name="DatoAdicional02">
										<xsl:with-param name="item" select="cbc:ID" />
										<xsl:with-param name="adicional" select="1" />
									</xsl:call-template>
								</font>
							</td>
							<!--CANTIDAD-->
							<td width="9%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:InvoicedQuantity, '###,###,##0.000', 'pen')" />
								</font>
							</td>
							<!--VALOR VENTA -->
							<td width="9%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.00000', 'pen')" />
									
								</font>
							</td>
							
							
							
                 <!-- esta código es para hacer condición 
               si el descuento es >0  debe salir en la facura
                      si no no debe salir =
             <xsl:if test="//cac:AllowanceCharge/cbc:Amount!='0.00'"> 
						 </xsl:if>
						
						 -->
							<xsl:if test="//cac:AllowanceCharge/cbc:Amount!='0.00'">


							<!--% DCTO -->
							<td width="8%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<!--<xsl:value-of select="format-number(cac:Price1/cbc:PriceAmount1, '###,###,##0.00000', 'pen')" />-->
									<!--<xsl:value-of select="format-number($Descuento,'###,###,##0.00','pen')"/>-->
									<xsl:call-template name="DatoAdicional18">
										<xsl:with-param name="item" select="cbc:ID" />
										<xsl:with-param name="adicional" select="82" />
									</xsl:call-template>
								</font>
							</td>

								</xsl:if>
							
							
							
							


							
							
							<!--PRECIO VTA UNIT-->
							<td width="9%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:variable name="CTSValor1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											<xsl:if test="cbc:PriceTypeCode = '02'">
												<xsl:value-of select="cbc:PriceAmount" />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>

									<xsl:variable name="CTSValorFinal">
										<xsl:if test="$CTSValor1 = ''">
											<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount" />
										</xsl:if>
										<xsl:if test="$CTSValor1 != ''">
											<xsl:value-of select="$CTSValor1" />
										</xsl:if>
									</xsl:variable>

									<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')" />
								</font>
							</td>
							<!--IMPORTE-->
							<td width="9%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')" />
								</font>
							</td>
						</tr>
					</xsl:for-each>
			
					<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
						<tr>
							<!--CODIGO-->
							<td width="8%" align="center">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID" />
								</font>
							</td>
							<!--DESCRIPCION-->
							<td width="48%">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="cac:Item/cbc:Description" />
								</font>
							</td>
							<!--UNIDAD-->
							<td width="8%" align="center">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:call-template name="DatoAdicional02">
										<xsl:with-param name="item" select="cbc:ID" />
										<xsl:with-param name="adicional" select="1" />
									</xsl:call-template>
								</font>
							</td>
							<!--CANTIDAD-->
							<td width="9%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:CreditedQuantity, '########0.000', 'pen')" />
								</font>
							</td>
							<!--VALOR VENTA-->
							<td width="9%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.00000', 'pen')" />
								</font>
							</td>
							<!--PRECIO UNIT-->
							<td width="9%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:variable name="CTSValor1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											<xsl:if test="cbc:PriceTypeCode = '02'">
												<xsl:value-of select="cbc:PriceAmount" />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>

									<xsl:variable name="CTSValorFinal">
										<xsl:if test="$CTSValor1 = ''">
											<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount" />
										</xsl:if>
										<xsl:if test="$CTSValor1 != ''">
											<xsl:value-of select="$CTSValor1" />
										</xsl:if>
									</xsl:variable>

									<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')" />
								</font>
							</td>
							<!--IMPORTE-->
							<td width="9%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')" />
								</font>
							</td>
						</tr>
					</xsl:for-each>
				
					<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
						<tr>
							<!--CODIGO-->
							<td width="8%" align="center">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID" />
								</font>
							</td>
							<!--DESCRIPCION-->
							<td width="48%">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="cac:Item/cbc:Description" />
								</font>
							</td>
							<!--UNIDAD-->
							<td width="8%" align="center">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:call-template name="DatoAdicional02">
										<xsl:with-param name="item" select="cbc:ID" />
										<xsl:with-param name="adicional" select="1" />
									</xsl:call-template>
								</font>
							</td>
							<!--CANTIDAD-->
							<td width="9%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:DebitedQuantity, '########0.000', 'pen')" />
								</font>
							</td>
							<!-- VALOR VENTA-->
							<td width="9%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.00000', 'pen')" />
								</font>
							</td>
							<!--PRECIO UNIT-->
							<td width="9%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:variable name="CTSValor1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											<xsl:if test="cbc:PriceTypeCode = '02'">
												<xsl:value-of select="cbc:PriceAmount" />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>

									<xsl:variable name="CTSValorFinal">
										<xsl:if test="$CTSValor1 = ''">
											<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount" />
										</xsl:if>
										<xsl:if test="$CTSValor1 != ''">
											<xsl:value-of select="$CTSValor1" />
										</xsl:if>
									</xsl:variable>

									<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')" />
								</font>
							</td>
							<!--IMPORTE-->
							<td width="9%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')" />
								</font>
							</td>
						</tr>
					</xsl:for-each>

					<xsl:call-template name="lineaBl">
						<xsl:with-param name="cont" select="$numColBl" />
					</xsl:call-template>
				</table>
			</xsl:if>
			<xsl:if test="$CTSExportacion != ''">
				<table border="1" width="100%" cellpadding="1" cellspacing="0" rules="cols">
					<tr bgcolor="silver">
						<td width="12%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>CÓDIGO<br/>(Code)</strong>
							</font>
						</td>
						<td width="40%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>DESCRIPCIÓN<br/>(Description of Goods)</strong>
							</font>
						</td>
						<td width="12%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>UNIDAD<br/>(Unit)</strong>
							</font>
						</td>
						<td width="12%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>CANTIDAD<br/>(Quantity)</strong>
							</font>
						</td>
						<!--
						<xsl:if test="//cac:AllowanceCharge/cbc:Amount!='0.00'">
						
						<td width="10%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>DCTO<br/>(discount)</strong>
							</font>
						</td>
						
						</xsl:if>
						-->
						
						<td width="12%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>PRECIO UNIT.<br/>(Unit price)</strong>
							</font>
						</td>
						<td width="12%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<strong>VALOR IMPORTE<br/>(Total)</strong>
							</font>
						</td>
					</tr>

					<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
						<tr>
							<!--CODIGO-->
							<td width="12%" align="center">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID" />
								</font>
							</td>
							<!--DESCRIPCION-->
							<td width="40%">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="cac:Item/cbc:Description" />
								</font>
							</td>
							<!--UNIDAD-->
							<td width="12%" align="center">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:call-template name="DatoAdicional02">
										<xsl:with-param name="item" select="cbc:ID" />
										<xsl:with-param name="adicional" select="1" />
									</xsl:call-template>
								</font>
							</td>
							<!--CANTIDAD-->
							<td width="12%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:InvoicedQuantity, '###,###,##0.000', 'pen')" />
								</font>
							</td>
							<!--DCTO
							<xsl:if test="//cac:AllowanceCharge/cbc:Amount!='0.00'">
							
							<td width="10%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:InvoicedQuantity2, '###,###,##0.000', 'pen')" />
								</font>
							</td>
							</xsl:if>-->
							
							
							<!--PRECIO VTA UNIT-->
							<td width="12%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:variable name="CTSValor1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											<xsl:if test="cbc:PriceTypeCode = '02'">
												<xsl:value-of select="cbc:PriceAmount" />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>

									<xsl:variable name="CTSValorFinal">
										<xsl:if test="$CTSValor1 = ''">
											<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount" />
										</xsl:if>
										<xsl:if test="$CTSValor1 != ''">
											<xsl:value-of select="$CTSValor1" />
										</xsl:if>
									</xsl:variable>

									<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')" />
								</font>
							</td>
							<!--IMPORTE-->
							<td width="12%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')" />
								</font>
							</td>
						</tr>
					</xsl:for-each>
			
					<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
						<tr>
							<!--CODIGO-->
							<td width="12%" align="center">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID" />
								</font>
							</td>
							<!--DESCRIPCION-->
							<td width="40%">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="cac:Item/cbc:Description" />
								</font>
							</td>
							<!--UNIDAD-->
							<td width="12%" align="center">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:call-template name="DatoAdicional02">
										<xsl:with-param name="item" select="cbc:ID" />
										<xsl:with-param name="adicional" select="1" />
									</xsl:call-template>
								</font>
							</td>
							<!--CANTIDAD-->
							<td width="12%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:CreditedQuantity, '########0.000', 'pen')" />
								</font>
							</td>
							
							
							<!--DCTO
							<td width="10%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:CreditedQuantity, '########0.000', 'pen')" />
								</font>
							</td>-->
							
							<!--PRECIO UNIT-->
							<td width="12%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:variable name="CTSValor1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											<xsl:if test="cbc:PriceTypeCode = '02'">
												<xsl:value-of select="cbc:PriceAmount" />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>

									<xsl:variable name="CTSValorFinal">
										<xsl:if test="$CTSValor1 = ''">
											<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount" />
										</xsl:if>
										<xsl:if test="$CTSValor1 != ''">
											<xsl:value-of select="$CTSValor1" />
										</xsl:if>
									</xsl:variable>

									<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')" />
								</font>
							</td>
							<!--IMPORTE-->
							<td width="12%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')" />
								</font>
							</td>
						</tr>
					</xsl:for-each>
				
					<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
						<tr>
							<!--CODIGO-->
							<td width="12%" align="center">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID" />
								</font>
							</td>
							<!--DESCRIPCION-->
							<td width="40%">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="cac:Item/cbc:Description" />
								</font>
							</td>
							<!--UNIDAD-->
							<td width="12%" align="center">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:call-template name="DatoAdicional02">
										<xsl:with-param name="item" select="cbc:ID" />
										<xsl:with-param name="adicional" select="1" />
									</xsl:call-template>
								</font>
							</td>
							<!--CANTIDAD-->
							<td width="12%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:DebitedQuantity, '########0.000', 'pen')" />
								</font>
							</td>
							
							
							
							
								<!--DCTO
							<td width="10%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:DebitedQuantity, '########0.000', 'pen')" />
								</font>
							</td>-->
							
							
							<!--PRECIO UNIT-->
							<td width="12%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:variable name="CTSValor1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											<xsl:if test="cbc:PriceTypeCode = '02'">
												<xsl:value-of select="cbc:PriceAmount" />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>

									<xsl:variable name="CTSValorFinal">
										<xsl:if test="$CTSValor1 = ''">
											<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount" />
										</xsl:if>
										<xsl:if test="$CTSValor1 != ''">
											<xsl:value-of select="$CTSValor1" />
										</xsl:if>
									</xsl:variable>

									<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')" />
								</font>
							</td>
							<!--IMPORTE-->
							<td width="12%" align="right">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')" />
								</font>
							</td>
						</tr>
					</xsl:for-each>

					<xsl:call-template name="lineaBl3">
						<xsl:with-param name="cont" select="$numColBl" />
					</xsl:call-template>
				</table>
			</xsl:if>
		</xsl:if>

		<xsl:if test="$CTSDetalle != ''">
			<table border="1" width="100%" cellpadding="1" cellspacing="0" rules="cols">
				<tr bgcolor="silver">
					<td width="8%" align="center">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>CÓDIGO</strong>
						</font>
					</td>
					<td width="30%" align="center">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>DESCRIPCIÓN</strong>
						</font>
					</td>
					<td width="8%" align="center">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>UNIDAD</strong>
						</font>
					</td>
					<td width="8%" align="center">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>CANTIDAD</strong>
						</font>
					</td>
					<td width="9%" align="center">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>SE FACTURÓ</strong>
						</font>
					</td>
					<td width="9%" align="center">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>DEBE SER</strong>
						</font>
					</td>
					<td width="9%" align="center">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>VALOR VENTA</strong>
						</font>
					</td>
					<td width="9%" align="center">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>PRECIO UNIT.</strong>
						</font>
					</td>
					<td width="9%" align="center">
						<font color="#000000" size="1" face="Times New Roman, Helvetica, sans-serif">
							<strong>IMPORTE</strong>
						</font>
					</td>
				</tr>

				<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
					<tr>
						<!--CODIGO-->
						<td width="8%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID" />
							</font>
						</td>
						<!--DESCRIPCION-->
						<td width="30%">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:value-of select="cac:Item/cbc:Description" />
							</font>
						</td>
						<!--UNIDAD-->
						<td width="8%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:call-template name="DatoAdicional02">
									<xsl:with-param name="item" select="cbc:ID" />
									<xsl:with-param name="adicional" select="1" />
								</xsl:call-template>
							</font>
						</td>
						<!--CANTIDAD-->
						<td width="9%" align="right">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:value-of select="format-number(cbc:CreditedQuantity, '########0.000', 'pen')" />
							</font>
						</td>
						<!--SE FACTURO-->
						<td width="9%" align="right">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:variable name="SeFacturo">
									<xsl:call-template name="DatoAdicional02">
										<xsl:with-param name="item" select="cbc:ID" />
										<xsl:with-param name="adicional" select="2" />
									</xsl:call-template>
								</xsl:variable>

								<xsl:value-of select="format-number($SeFacturo, '###,###,##0.00000', 'pen')" />
							</font>
						</td>
						<!--DEBE SER-->
						<td width="9%" align="right">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:variable name="DebeSer">
									<xsl:call-template name="DatoAdicional02">
										<xsl:with-param name="item" select="cbc:ID" />
										<xsl:with-param name="adicional" select="3" />
									</xsl:call-template>
								</xsl:variable>

								<xsl:value-of select="format-number($DebeSer, '###,###,##0.00000', 'pen')" />
							</font>
						</td>
						<!--VALOR VENTA-->
						<td width="9%" align="right">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.00000', 'pen')" />
							</font>
						</td>
						<!--PRECIO UNIT-->
						<td width="9%" align="right">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:variable name="CTSValor1">
									<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
										<xsl:if test="cbc:PriceTypeCode = '02'">
											<xsl:value-of select="cbc:PriceAmount" />
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>

								<xsl:variable name="CTSValorFinal">
									<xsl:if test="$CTSValor1 = ''">
										<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount" />
									</xsl:if>
									<xsl:if test="$CTSValor1 != ''">
										<xsl:value-of select="$CTSValor1" />
									</xsl:if>
								</xsl:variable>

								<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')" />
							</font>
						</td>
						<!--IMPORTE-->
						<td width="9%" align="right">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')" />
							</font>
						</td>
					</tr>
				</xsl:for-each>
				
				<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
					<tr>
						<!--CODIGO-->
						<td width="8%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID" />
							</font>
						</td>
						<!--DESCRIPCION-->
						<td width="30%">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:value-of select="cac:Item/cbc:Description" />
							</font>
						</td>
						<!--UNIDAD-->
						<td width="8%" align="center">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:call-template name="DatoAdicional02">
									<xsl:with-param name="item" select="cbc:ID" />
									<xsl:with-param name="adicional" select="1" />
								</xsl:call-template>
							</font>
						</td>
						<!--CANTIDAD-->
						<td width="9%" align="right">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:value-of select="format-number(cbc:DebitedQuantity, '########0.000', 'pen')" />
							</font>
						</td>
						<!--SE FACTURO-->
						<td width="9%" align="right">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:variable name="SeFacturo">
									<xsl:call-template name="DatoAdicional02">
										<xsl:with-param name="item" select="cbc:ID" />
										<xsl:with-param name="adicional" select="2" />
									</xsl:call-template>
								</xsl:variable>

								<xsl:value-of select="format-number($SeFacturo, '###,###,##0.00000', 'pen')" />
							</font>
						</td>
						<!--DEBE SER-->
						<td width="9%" align="right">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:variable name="DebeSer">
									<xsl:call-template name="DatoAdicional02">
										<xsl:with-param name="item" select="cbc:ID" />
										<xsl:with-param name="adicional" select="3" />
									</xsl:call-template>
								</xsl:variable>

								<xsl:value-of select="format-number($DebeSer, '###,###,##0.00000', 'pen')" />
							</font>
						</td>
						<!-- VALOR VENTA-->
						<td width="9%" align="right">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.00000', 'pen')" />
							</font>
						</td>
						
						
						<!-- 
						
						
						<td width="9%" align="right">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.00000', 'pen')" />
							</font>
						</td>
						-->
						
						
						
						<!--PRECIO UNIT-->
						<td width="9%" align="right">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:variable name="CTSValor1">
									<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
										<xsl:if test="cbc:PriceTypeCode = '02'">
											<xsl:value-of select="cbc:PriceAmount" />
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>

								<xsl:variable name="CTSValorFinal">
									<xsl:if test="$CTSValor1 = ''">
										<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount" />
									</xsl:if>
									<xsl:if test="$CTSValor1 != ''">
										<xsl:value-of select="$CTSValor1" />
									</xsl:if>
								</xsl:variable>

								<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')" />
							</font>
						</td>
						<!--IMPORTE-->
						<td width="9%" align="right">
							<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
								<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')" />
							</font>
						</td>
					</tr>
				</xsl:for-each>

				<xsl:call-template name="lineaBl2">
					<xsl:with-param name="cont" select="$numColBl" />
				</xsl:call-template>
			</table>
		</xsl:if>

	</xsl:template>

	<xsl:template name="lineaBl">
		<xsl:param name="cont" />
		<xsl:if test="$cont &gt; 0">
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
 <!-- esta código es para hacer condición si el descuento es >0  debe salir en la facura
 si no no debe salir = <xsl:if test="//cac:AllowanceCharge/cbc:Amount!='0.00'">  </xsl:if> -->		
				<xsl:if test="//cac:AllowanceCharge/cbc:Amount!='0.00'">
				<td>&#160;</td>
				</xsl:if>
				<td>&#160;</td>
				<td>&#160;</td>
				
			</tr>


			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="lineaBl2">
		<xsl:param name="cont" />
		<xsl:if test="$cont &gt; 0">
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
			</tr>
			<xsl:call-template name="lineaBl2">
				<xsl:with-param name="cont" select="$cont - 1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="lineaBl3">
		<xsl:param name="cont" />
		<xsl:if test="$cont &gt; 0">
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				
			</tr>
			<xsl:call-template name="lineaBl3">
				<xsl:with-param name="cont" select="$cont - 1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="DatoAdicional02">
		<xsl:param name="item" />
		<xsl:param name="adicional" />

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($item, $adicional)">
				<xsl:value-of select="pe:Valor" />
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
			<xsl:if test="pe1:Codigo = concat($item, $adicional)">
				<xsl:value-of select="pe1:Valor" />
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo = concat($item, $adicional)">
				<xsl:value-of select="pe2:Valor" />
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
<xsl:template name="DatoAdicional18">
		<xsl:param name="item" />
		<xsl:param name="adicional" />

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($item, $adicional)">
				<xsl:value-of select="pe:Valor" />
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
			<xsl:if test="pe1:Codigo = concat($item, $adicional)">
				<xsl:value-of select="pe1:Valor" />
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo = concat($item, $adicional)">
				<xsl:value-of select="pe2:Valor" />
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="xml\20100047641&#x2D;08&#x2D;FD02&#x2D;9000001.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->