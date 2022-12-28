<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DetallesEncabezado">
		<table border="0" width="100%" cellpadding="0" cellspacing="2" bordercolor="#000000">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
							<td width="9%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CÓDIGO</strong>
								</font>
							</td>
							<td width="9%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="9%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UNIDAD</strong>
								</font>
							</td>
							<td width="46%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="9%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PRECIO UNITARIO</strong>
								</font>
							</td>
							<td width="9%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DSCTO.</strong>
								</font>	
							</td>
							<!--<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR UNITARIO</strong>
								</font>	
							</td>-->
							<td width="9%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR DE VENTA</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td><!--  -->
					<table  rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:variable name="Descuento">
								<xsl:value-of select="0"/>
								<xsl:if test="cac:AllowanceCharge/cbc:Amount">
									<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
								</xsl:if>
							</xsl:variable>
							<tr>
								<td width="9%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<td width="9%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:InvoicedQuantity"/>
									</font>
								</td>
								<td width="9%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="46%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<td width="9%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										
								<!-- Pruebas -->
										<xsl:if test="//cbc:PayableAmount!='0'">
											<xsl:if test="//cbc:PayableAmount!='0.00'">
		                                  		<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
		                                	</xsl:if>
											<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
                                                <xsl:if test=" cbc:PriceTypeCode='02'">
                                                    <xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
                                                </xsl:if>
                                            </xsl:for-each>
										</xsl:if>
										<xsl:if test="//cbc:PayableAmount='0.00'">
	                                   		<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
                                                <xsl:if test=" cbc:PriceTypeCode='02'">
                                                    <xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
                                                </xsl:if>
												<xsl:if test=" cbc:PriceTypeCode='01'">
                                                    <xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
                                                </xsl:if>
                                            </xsl:for-each>
										</xsl:if>
									</font>
									<!--<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
									</font>-->
								</td>
								<td width="9%" align="right">
									<!--<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0'">
											<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0.00'">
		                                  		<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
		                                	</xsl:if>
											<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
                                                <xsl:if test=" cbc:PriceTypeCode='02'">
                                                    <xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
                                                </xsl:if>
                                            </xsl:for-each>
										</xsl:if>
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount='0'">
                                      		<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
                                                <xsl:if test=" cbc:PriceTypeCode='02'">
                                                    <xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
                                                </xsl:if>
                                            </xsl:for-each>
										</xsl:if>
									</font>-->
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number($Descuento,'###,###,##0.0000','pen')"/>
									</font>
								</td>
								<!--<td width="8%" align="right">
																		<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0'">
											<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0.00'">
		                                  		<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
		                                	</xsl:if>
											<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
                                                <xsl:if test=" cbc:PriceTypeCode='02'">
                                                    <xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
                                                </xsl:if>
                                            </xsl:for-each>
										</xsl:if>
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount='0'">
                                      		<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
                                                <xsl:if test=" cbc:PriceTypeCode='02'">
                                                    <xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
                                                </xsl:if>
                                            </xsl:for-each>
										</xsl:if>
									</font>
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
									</font>
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number($Descuento,'###,###,##0.00','pen')"/>
									</font>
								</td>-->
								<td width="9%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.0000', 'pen')"/>
									</font> 
								</td>
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:variable name="Descuento1">
								<xsl:value-of select="0"/>
								<xsl:if test="cac:AllowanceCharge/cbc:Amount">
									<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
								</xsl:if>
							</xsl:variable>
							<tr>
								<td width="9%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="cbc:CreditedQuantity"/>-->
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<td width="9%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:CreditedQuantity"/>
									</font>
								</td>
								<td width="9%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="46%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1"> 
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<td width="9%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
									</font>
								</td>
								<td width="9%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>-->
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.0000','pen')"/>-->
									</font>
								</td>
								<!--<td width="9%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
									</font>
								</td>-->
								<td width="9%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.0000','pen')"/>
									</font>
								</td>
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:variable name="Descuento1">
								<xsl:value-of select="0"/>
								<xsl:if test="cac:AllowanceCharge/cbc:Amount">
									<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
								</xsl:if>
							</xsl:variable>

							<tr>
								<td width="9%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="cbc:DebitedQuantity"/>-->
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<td width="9%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:DebitedQuantity"/>
									</font>
								</td>
								<td width="9%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="46%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1"> 
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>

								<td width="9%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
									</font>
								</td>
								<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
									</font>
								</td>-->
								<td width="9%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>-->
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.0000','pen')"/>-->
									</font>
								</td>
								<td width="9%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.0000','pen')"/>
									</font>
								</td>
							</tr>
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
		<xsl:if test="$cont>0">
			<tr>
				<td width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="46%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<!--<td width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>-->
				<td width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="unidad_medida">
		<xsl:if test="/pe:Invoice">
			<xsl:choose>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PL'">BAL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='D64'">BLK</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='BG'">BOL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='BO'">BOT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='BX'">CAJ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='CY'">CIL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='CLT'">CL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='CMT'">CM</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='CJ'">CON</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='DLT'">DL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL'">UGL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='GRM'">GR</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='HUR'">HRA</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='KT'">JGO</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM'">KG</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='KWT'">KW</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR'">LB</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR'">LT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTR'">M</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK'">M2</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTQ'">M3</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='MIL'">MIL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='D61'">MIN</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='MLT'">ML</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='MMT'">MM</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='NPR'">PAR</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTK'">PI2</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTQ'">PI3</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PA'">PQT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='INH'">PUL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='NRL'">ROL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE'">TON</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='NIU'">UN</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='SA'">SAC</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PQ'">PAQ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='BLL'">BB6</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='GN'">GG6</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
			<xsl:choose>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='PL'">BAL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='D64'">BLK</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='BG'">BOL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='BO'">BOT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='BX'">CAJ</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='CY'">CIL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='CLT'">CL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='CMT'">CM</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='CJ'">CON</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='DLT'">DL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='GLL'">UGL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='GRM'">GR</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='HUR'">HRA</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='KT'">JGO</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='KGM'">KG</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='KWT'">KW</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='LBR'">LB</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='LTR'">LT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='MTR'">M</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='MTK'">M2</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='MTQ'">M3</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='MIL'">MIL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='D61'">MIN</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='MLT'">ML</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='MMT'">MM</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='NPR'">PAR</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='FTK'">PI2</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='FTQ'">PI3</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='PA'">PQT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='INH'">PUL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='NRL'">ROL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='TNE'">TON</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='NIU'">UN</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='SA'">SAC</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='PQ'">PAQ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='BLL'">BB6</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
			<xsl:choose>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='PL'">BAL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='D64'">BLK</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='BG'">BOL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='BO'">BOT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='BX'">CAJ</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='CY'">CIL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='CLT'">CL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='CMT'">CM</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='CJ'">CON</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='DLT'">DL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='GLL'">UGL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='GRM'">GR</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='HUR'">HRA</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='KT'">JGO</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='KGM'">KG</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='KWT'">KW</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='LBR'">LB</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='LTR'">LT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='MTR'">M</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='MTK'">M2</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='MTQ'">M3</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='MIL'">MIL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='D61'">MIN</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='MLT'">ML</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='MMT'">MM</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='NPR'">PAR</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='FTK'">PI2</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='FTQ'">PI3</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='PA'">PQT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='INH'">PUL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='NRL'">ROL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='TNE'">TON</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='NIU'">UN</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='SA'">SAC</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='PQ'">PAQ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='BLL'">BB6</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>


<xsl:template name="simbolo">
		<xsl:if test="/pe:Invoice">
			<xsl:choose>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PL'">S/</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='D64'">$/</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
			<xsl:choose>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='PL'">BAL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='D64'">BLK</xsl:when>
				
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
			<xsl:choose>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='PL'">BAL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='D64'">BLK</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20381034071&#x2D;07&#x2D;F011&#x2D;00000008.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->