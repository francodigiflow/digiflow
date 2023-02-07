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
		<xsl:param name="titems"/>
		<xsl:param name="tpaginas"/>
		<xsl:param name="pagina"/>
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000001" cellpadding="4" cellspacing="0">
						<tr>
							<td width="7%" align="center" bgcolor="#C0C0C0">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CÓDIGO</strong>
								</font>
							</td>
							<td width="7%" align="center" bgcolor="#C0C0C0">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="39%" align="center" bgcolor="#C0C0C0">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="7%" align="center" bgcolor="#C0C0C0">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UNIDAD</strong>
								</font>
							</td>
							<td width="10%" align="center" bgcolor="#C0C0C0">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR UNITARIO</strong>
								</font>
							</td>
							<td width="10%" align="center" bgcolor="#C0C0C0">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PRECIO UNITARIO</strong>
								</font>	
							</td>
							<td width="10%" align="center" bgcolor="#C0C0C0">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCUENTO</strong>
								</font>
							</td>
							<td width="10%" align="center" bgcolor="#C0C0C0">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR DE VENTA</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<xsl:variable name="min">
				<xsl:choose>
					<xsl:when test="$pagina = '1'">0</xsl:when>
					<xsl:when test="$pagina = '2'">48</xsl:when>
					<xsl:when test="$pagina = '3'">96</xsl:when>
					<xsl:when test="$pagina = '4'">144</xsl:when>
					<xsl:when test="$pagina = '5'">192</xsl:when>
					<xsl:when test="$pagina = '6'">240</xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="max">
				<xsl:choose>					
					<xsl:when test="$pagina = '1'">49</xsl:when>
					<xsl:when test="$pagina = '2'">97</xsl:when>
					<xsl:when test="$pagina = '3'">145</xsl:when>
					<xsl:when test="$pagina = '4'">193</xsl:when>
					<xsl:when test="$pagina = '5'">241</xsl:when>
					<xsl:when test="$pagina = '6'">289</xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt; $min and cbc:ID &lt; $max ">
								<xsl:variable name="Descuento">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:Amount">
										<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
									</xsl:if>
								</xsl:variable>
								<tr>
									<td width="7%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="7%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:InvoicedQuantity"/>
										</font>
									</td>
									<td width="39%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<td width="7%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
								
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
				                            	<xsl:if test="cbc:PriceTypeCode='01' and cbc:PriceAmount!='0.00'">
				                                	<xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.00', 'pen')"/>
				                                </xsl:if>
				                                <xsl:if test="cbc:PriceTypeCode='02' and cbc:PriceAmount!='0.00'">
				                                	<xsl:value-of select="format-number(cbc:PriceAmount, '###,###,##0.00', 'pen')"/>
				                                </xsl:if>
				                           	</xsl:for-each>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
												<xsl:when test="cac:AllowanceCharge/cbc:Amount!=''">
													<xsl:value-of select="format-number(cac:AllowanceCharge/cbc:Amount, '###,###,##0.00', 'pen')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
												</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')"/>
										</font> 
									</td>
								</tr>
							</xsl:if>

							
						</xsl:for-each>

						<xsl:if test="$tipo_factura='02'">
							<tr>
								<td width="7%" align="center"></td>
								<td width="7%" align="center"></td>
								<td width="39%">
									
									<table border="0" cellpadding="1" cellspacing="2">
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='10'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='11'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='12'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='13'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='14'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>

										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='15'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='16'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='17'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='18'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='19'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='20'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='21'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='22'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='23'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
										<tr>
											<td>
												<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='24'">
														<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												</font>
											</td>
										</tr>
									</table>

								</td>
								<td width="7%" align="center"></td>
								<td width="10%" align="right"></td>
								<td width="10%" align="right"></td>
								<td width="10%" align="center"></td>
								<td width="10%" align="right"></td>
							</tr>
						</xsl:if>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:if test="cbc:ID &gt; $min and cbc:ID &lt; $max ">
								<xsl:variable name="Descuento1">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:Amount">
										<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
									</xsl:if>
								</xsl:variable>
								<tr>
									<td width="7%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="7%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:CreditedQuantity"/>
										</font>
									</td>
									<td width="39%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1"> 
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<td width="7%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt; $min and cbc:ID &lt; $max ">
								<xsl:variable name="Descuento1">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:Amount">
										<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
									</xsl:if>
								</xsl:variable>
								<tr>
									<td width="7%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="7%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:DebitedQuantity"/>
										</font>
									</td>
									<td width="39%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1"> 
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<td width="7%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<!--<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>-->
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
				<td width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="39%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="10%" align="center">
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
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PK'">PK</xsl:when>
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
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='GN'">GG6</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PK'">PK</xsl:when>
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
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='GN'">GG6</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PK'">PK</xsl:when>
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

	<xsl:template name="tmpDatosAdicionalesDetalle">
		<xsl:param name="item" />
		<xsl:param name="adicional" />

		<xsl:for-each select="//pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($item, $adicional)">
				<xsl:choose>
					<xsl:when test="pe:Valor!='' or pe:Valor='-'">
						<xsl:value-of select="format-number(pe:Valor, '###,###,##0.00', 'pen')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//pe1:DatosAdicionales/pe1:LineaDetalle">
			<xsl:if test="pe1:Codigo = concat($item, $adicional)">
				<xsl:choose>
					<xsl:when test="pe1:Valor!='' or pe1:Valor='-'">
						<xsl:value-of select="format-number(pe1:Valor, '###,###,##0.00', 'pen')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo = concat($item, $adicional)">
				<xsl:choose>
					<xsl:when test="pe2:Valor!='' or pe2:Valor='-'">
						<xsl:value-of select="format-number(pe2:Valor, '###,###,##0.00', 'pen')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\xml\20254053822&#x2D;08&#x2D;FF11&#x2D;11000010.xml.orig.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->