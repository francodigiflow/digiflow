<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>


	<xsl:template name="DetallesEncabezado">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr bgcolor="#1D196E">

							<!--<td width="10%" align="center">
								<font face="Tahonma, Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>CANT.</strong>
								</font>
							</td>-->
							<!--<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>CÓDIGO</strong>
								</font>
							</td>-->
							<td width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="15%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>UNIDAD</strong>
								</font>
							</td>
							<td width="15%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="15%" align="center">
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
									<font face="Arial, Helvetica, sans-serif" size="2" color="white">
										<strong>PRECIO. UNIT</strong>
									</font>
								</xsl:if>
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
									<font face="Arial, Helvetica, sans-serif" size="2" color="white">
										<strong>PRECIO. UNIT</strong>
									</font>
								</xsl:if>
								<xsl:if test="/pe1:CreditNote">
									<font face="Arial, Helvetica, sans-serif" size="2" color="white">
										<xsl:if test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">
											<strong>PRECIO. UNIT</strong>
										</xsl:if>
										<xsl:if test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">
											<strong>PRECIO. UNIT</strong>
										</xsl:if>
									</font>
								</xsl:if>
								<xsl:if test="/pe2:DebitNote">
									<font face="Arial, Helvetica, sans-serif" size="2" color="white">
										<xsl:if test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">
											<strong>PRECIO. UNIT</strong>
										</xsl:if>
										<xsl:if test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">
											<strong>PRECIO. UNIT</strong>
										</xsl:if>
									</font>
								</xsl:if>
							</td>
							<td width="15%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>VALOR VENTA</strong>
								</font>
							</td>
						</tr>
						<!--</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">-->
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:variable name="Descuento">
								<xsl:value-of select="0"/>
								<xsl:if test="cac:AllowanceCharge/cbc:Amount">
									<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
								</xsl:if>
							</xsl:variable>
							<tr>
								<!--ITEM-->
								<!--<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">										
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>-->
								
								<!--CÓDIGO-->
								<!--<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>-->
								<!--DESCRIPCIÓN-->
								<td width="40%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2"> 
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<!--UNIDAD MEDIDA-->
								<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--CANTIDAD-->
								<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,###.000','pen')"/> </font>
								</td>

								<!--V.UNITARIO-->
								<td width="15%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/> </xsl:if>
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,###.00','pen')"/> </xsl:if>
									</font>
								</td>
								<!--DESCUENTO-->
								<!--<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:variable name="ctscts">
												<xsl:value-of select="format-number(cac:AllowanceCharge/cbc:Amount, '###,###,##0.00', 'pen')"/>
											</xsl:variable>
											<xsl:choose>
												<xsl:when test="cac:AllowanceCharge/cbc:Amount">
													<xsl:value-of select="$ctscts"/>
													</xsl:when>
												<xsl:otherwise>0.00</xsl:otherwise>
											</xsl:choose>
									</font>
								</td>-->
								<!--V.TOTAL-->
								<td width="15%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
											<xsl:choose>
												<xsl:when test="cac:AllowanceCharge/cbc:Amount">
													<xsl:value-of select="format-number(cbc:LineExtensionAmount + cac:AllowanceCharge/cbc:Amount ,'###,###,##0.00','pen')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
											<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount*cbc:InvoicedQuantity,'###,###,###.00','pen')"/>&#xA0;-->
											<!--<xsl:choose>
												<xsl:when test="cac:AllowanceCharge/cbc:Amount">
													<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount*cbc:InvoicedQuantity - cac:AllowanceCharge/cbc:Amount,'###,###,###.00','pen')"/>&#xA0;
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount*cbc:InvoicedQuantity,'###,###,###.00','pen')"/>&#xA0;
												</xsl:otherwise>
											</xsl:choose> -->
										</xsl:if>
									</font>
								</td>
							</tr>
						</xsl:for-each>

						<!-- JDL: PENDIENTE NOTA CREDITO -->

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:variable name="Descuento1">
								<xsl:value-of select="0"/>
								<xsl:if test="cac:AllowanceCharge/cbc:Amount">
									<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
								</xsl:if>
							</xsl:variable>
							<tr>
								<!--ITEM-->
								<!--<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>-->
								<!--DESCRIPCIÓN-->
								<td width="40%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2"> 
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<!--UNIDAD MEDIDA-->
								<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medidaC"/>
									</font>
								</td>
								<!--CANTIDAD-->
								<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>
									</font>
								</td>
								<!--CÓDIGO-->
								<!--<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>-->
								
								
								
								<!--V.UNITARIO-->
								<td width="15%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">										
											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>

								<!--V.TOTAL-->
								<td width="15%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:choose>
											<xsl:when test="cac:AllowanceCharge/cbc:Amount">
												<xsl:value-of select="format-number(cbc:LineExtensionAmount + cac:AllowanceCharge/cbc:Amount,'###,###,##0.00','pen')"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
											</xsl:otherwise>
										</xsl:choose>
									</font>
								</td>
							</tr>
						</xsl:for-each>

						<!-- JDL: PENDIENTE NOTA DEBITO -->

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:variable name="Descuento1">
								<xsl:value-of select="0"/>
								<xsl:if test="cac:AllowanceCharge/cbc:Amount">
									<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
								</xsl:if>
							</xsl:variable>

							<tr>
								<!--TEM-->
								<!--<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>-->
								<!--DESCRIPCIÓN-->
								<td width="40%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2"> 
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>

								<!--UNIDAD MEDIDA-->
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medidaD"/>
									</font>
								</td>
								<!--CANTIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:DebitedQuantity"/>
									</font>
								</td>

								<!--CÓDIGO-->
								<!--<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>-->
								
								
								<!--V.UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/> </font>
								</td>
								<!--DESCUENTO-->
								<!--<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:variable name="ctscts">
												<xsl:value-of select="format-number(cac:AllowanceCharge/cbc:Amount, '###,###,##0.00', 'pen')"/>
											</xsl:variable>
											<xsl:choose>
												<xsl:when test="cac:AllowanceCharge/cbc:Amount">
													<xsl:value-of select="$ctscts"/>
													</xsl:when>
												<xsl:otherwise>0.00</xsl:otherwise>
											</xsl:choose>
									</font>
								</td>-->
								<!--V.TOTAL-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:choose>
											<xsl:when test="cac:AllowanceCharge/cbc:Amount">
												<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount*cbc:DebitedQuantity + cac:AllowanceCharge/cbc:Amount,'###,###,##0.00','pen')"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount*cbc:DebitedQuantity,'###,###,##0.00','pen')"/>
											</xsl:otherwise>
										</xsl:choose>
									</font>
								</td>
							</tr>
						</xsl:for-each>

						<!-- <xsl:call-template name="lineaBl"> -->
							<!-- <xsl:with-param name="cont" select="$numColBl"/> -->
							<!-- <table> -->
								<!-- <tr> -->
									<!-- <td align="center" valign="top" width="15%"> -->
										<!-- <font face="Arial, Helvetica, sans-serif" size="2"> -->
											<!-- <xsl:call-template name="total"/> -->
										<!-- </font> -->
									<!-- </td> -->
								<!-- </tr> -->
							<!-- </table> -->
						<!-- </xsl:call-template> -->
						<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
				<!--<td width="5%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2">&#160;
					</font>
				</td>-->
				<!--<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>-->
				<td width="40%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="15%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="15%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="15%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="15%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
			</tr>
			<!-- Mostrar detalle - Completando -->
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="unidad_medida">
		<xsl:choose>
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
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KW'">KW</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KWH'">KWH</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LF'">FT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MD'">MD</xsl:when>
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
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='ZZ'">UNI</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="unidad_medidaC">
		<xsl:choose>
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
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KW'">KW</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KWH'">KWH</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LF'">FT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MD'">MD</xsl:when>
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
			<xsl:when test="cbc:CreditedQuantity/@unitCode='ZS'">CN</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='ZZ'">UNI</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="unidad_medidaD">
		<xsl:choose>
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
			<xsl:when test="cbc:DebitedQuantity/@unitCode='KW'">KW</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='KWH'">KWH</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='LF'">FT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MD'">MD</xsl:when>
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
			<xsl:when test="cbc:DebitedQuantity/@unitCode='ZS'">CN</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='ZZ'">UNI</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="file:///e:/Clientes/SIMSA/PDF/20100177421_2015092408F03500000803.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->