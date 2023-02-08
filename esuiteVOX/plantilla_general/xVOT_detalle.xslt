<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>


	<xsl:template name="DetallesEncabezado">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Cantidad</strong>
								</font>
							</td>
							<td width="54%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Unidad</strong>
								</font>
							</td>
							<td width="13%" align="center">

								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Valor Venta Unit.</strong>
									</font>
								</xsl:if>
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Precio de Venta Unit.</strong>
									</font>
								</xsl:if>

								<xsl:if test="/pe1:CreditNote">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:if test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">
											<strong>Valor Venta Unit.</strong>
										</xsl:if>

										<xsl:if test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">
											<strong>Precio de Venta Unit.</strong>
										</xsl:if>
									</font>
								</xsl:if>
								<xsl:if test="/pe2:DebitNote">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:if test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">
											<strong>Valor Venta Unit.</strong>
										</xsl:if>

										<xsl:if test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">
											<strong>Precio de Venta Unit.</strong>
										</xsl:if>
									</font>
								</xsl:if>
							</td>

							<td width="13%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Importes</strong>
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

							<xsl:variable name="Descuento">
								<xsl:value-of select="0"/>
								<xsl:if test="cac:AllowanceCharge/cbc:Amount">
									<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
								</xsl:if>
							</xsl:variable>

							<tr>
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:InvoicedQuantity"/>
									</font> </td>
								<td width="54%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
								&#160;<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->								
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="13%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">

										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###.###.##0,00','pen')"/>&#160;
										</xsl:if>
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">

											<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount!='0'">

												<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###.###.###,00','pen')"/>&#160;
											</xsl:if>
											<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount='0'">

												<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
													<xsl:if test=" cbc:PriceTypeCode='02'">
														<xsl:value-of select="format-number(cbc:PriceAmount,'###.###.###,00','pen')"/>&#160; 
													</xsl:if>
												</xsl:for-each>
											</xsl:if>



										</xsl:if>


									</font> 

								</td>

								<td width="13%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###.###.##0,00','pen')"/>
									</font> </td>
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
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:CreditedQuantity"/>
									</font> </td>
								<td width="54%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->								
									&#160;<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->								
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="13%" align="right">

									<font face="Arial, Helvetica, sans-serif" size="2">

										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###.###.##0,00','pen')"/>&#160;
										</xsl:if>
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
											<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount!='0'">									
												<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###.###.###,00','pen')"/>&#160;
											</xsl:if>
											<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount='0'">
												<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
													<xsl:if test=" cbc:PriceTypeCode='02'">
														<xsl:value-of select="format-number(cbc:PriceAmount,'###.###.###,00','pen')"/>&#160; 
													</xsl:if>
												</xsl:for-each>
											</xsl:if>

										</xsl:if>
										
									</font>

								</td>
								<td width="13%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###.###.##0,00','pen')"/>
									</font> </td>
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
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:DebitedQuantity"/>
									</font> </td>
								<td width="54%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
									&#160;<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->								
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="13%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###.###.###,00','pen')"/>&#160;



									</font> 

								</td>
								<td width="13%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###.###.##0,00','pen')"/>
									</font> </td>
							</tr>
						</xsl:for-each>

					<!--	<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template>-->
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
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
				<td width="54" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
				<td width="13%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
				<td width="13%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 2"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="unidad_medida">
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
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL'">GAL</xsl:when>
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
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='WE'">WE</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PA'">PQT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='INH'">PUL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NRL'">ROL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE'">TNE</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SA'">SAC</xsl:when>		
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE'">NIU</xsl:when>		
			<xsl:otherwise>UNI
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="DetallesEncabezado1">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
						<body>
							<tr>
								<td>
									<table rules="cols" border="0" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
										<tr bgColor="#A4A4A4" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
											<td width="8%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>Cantidad</strong>
												</font>
											</td>
											<td width="8%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>Unidad</strong>
												</font>
											</td>
											<td width="52%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>Descripción</strong>
												</font>
											</td>
											<td width="10%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>Valor de Vta. Unit</strong>
												</font>
											</td>
											<td width="10%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>Precio de Vta. Unit</strong>
												</font>
											</td>
											<td width="12%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>Importe</strong>
												</font>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</body>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
						<body>
							<tr>
								<td>
									<table rules="cols" border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
										<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">

											<xsl:variable name="Descuento">
												<xsl:value-of select="0"/>
												<xsl:if test="cac:AllowanceCharge/cbc:Amount">
													<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
												</xsl:if>
											</xsl:variable>

											<tr>
												<!--cantidad-->
												<td width="8%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>
													</font>
												</td>
												<!--unidad-->
													
												<font face="Arial, Helvetica, sans-serif" size="2">
													<xsl:if test="cbc:ID='1'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">

																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>

																<td width="8%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea1"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='2'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>

																<td width="8%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea2"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>	
													</xsl:if>
													<xsl:if test="cbc:ID='3'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="8%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea3"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>	
													</xsl:if>
													<xsl:if test="cbc:ID='4'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="8%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea4"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='5'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="8%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea5"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='6'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<td width="8%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea6"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='7'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<td width="8%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea7"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='8'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<td width="8%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea8"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='9'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea9">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<td width="8%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea9"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='10'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea9">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea10">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<td width="8%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea10"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
												</font>

												<!--descripcion-->
												<td width="52%" align="left">
													<font face="Arial, Helvetica, sans-serif" size="2">
								&#160;<xsl:value-of select="cac:Item/cbc:Description"/>
													</font>

												</td>
												<!--Vvu-->
												<td width="10%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;

													</font>
												</td>


												<!--pvu-->
												<td width="10%" align="center">
													<!--<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0'">-->
													<font face="Arial, Helvetica, sans-serif" size="2">
														<!--<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0.00'">-->
														<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
															<xsl:if test=" cbc:PriceTypeCode='01'">
																<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')"/>
															</xsl:if>
														</xsl:for-each>
														<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
															<xsl:if test=" cbc:PriceTypeCode='02'">
																<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')"/>
															</xsl:if>
														</xsl:for-each>

													</font>
													
												</td>

												<!--importe-->
												<td width="12%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
													</font> 
												</td>
											</tr>

										</xsl:for-each>

										<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
											<xsl:variable name="Descuento">
												<xsl:value-of select="0"/>
												<xsl:if test="cac:AllowanceCharge/cbc:Amount">
													<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
												</xsl:if>																
											</xsl:variable>

											<tr>
												<!--cantidad-->
												<td width="8%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>
													</font> 
												</td>
												<!--unidad-->
												<font face="Arial, Helvetica, sans-serif" size="2">
													<xsl:if test="cbc:ID='1'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">

																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>

																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea1"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='2'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>

																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea2"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>	
													</xsl:if>
													<xsl:if test="cbc:ID='3'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea3"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>	
													</xsl:if>
													<xsl:if test="cbc:ID='4'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea4"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='5'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea5"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='6'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea6"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='7'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea7"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='8'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea8"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='9'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea9">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea9"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='10'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea9">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea10">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea10"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
												</font>

												<!--Descripción-->
												<td width="52%" align="left">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->								
									&#160;<xsl:value-of select="cac:Item/cbc:Description"/>
													</font>
												</td>
												<!--Vvu-->
												<td width="10%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;
													</font>

												</td>
												<!--precio-->
												<td width="10%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;
													</font>

												</td>
												<!--importe-->
												<td width="12%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
													</font>
												</td>
											</tr>
										</xsl:for-each>

										<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
											<xsl:variable name="Descuento">
												<xsl:value-of select="0"/>
												<xsl:if test="cac:AllowanceCharge/cbc:Amount">
													<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
												</xsl:if>																
											</xsl:variable>

											<tr>
												<!--cantidad-->
												<td width="8%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>
													</font>
												</td>
												<!--unidad-->
												<font face="Arial, Helvetica, sans-serif" size="2">
													<xsl:if test="cbc:ID='1'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">

																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>

																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea1"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='2'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>

																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea2"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>	
													</xsl:if>
													<xsl:if test="cbc:ID='3'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea3"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>	
													</xsl:if>
													<xsl:if test="cbc:ID='4'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea4"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='5'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea5"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='6'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea6"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='7'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea7"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='8'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea8"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='9'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea9">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea9"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='10'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea9">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea10">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea10"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
												</font>

												<!--Descripción-->
												<td width="52%" align="left">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->								
									&#160;<xsl:value-of select="cac:Item/cbc:Description"/>
													</font>
												</td>
												<!--Vvu-->
												<td width="10%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;
													</font>
												</td>
												<!--precio-->
												<td width="10%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;
													</font>
												</td>
												<!--importe-->
												<td width="12%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
													</font>
												</td>
											</tr>
										</xsl:for-each>

										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PrepaidAmount!='0'">
											<tr>
												<!--cantidad-->
												<td width="8%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
							1</font>
												</td>
												<!--unidad-->
												<td width="8%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
								UN
													</font>
												</td>
												<!--descripcion-->
												<td width="52%" align="left">
													<font face="Arial, Helvetica, sans-serif" size="2">
								&#160;Pago Anticipado</font>

												</td>
												<!--Vvu-->
												<td width="10%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
								&#160;

													</font>
												</td>


												<!--pvu-->
												<td width="10%" align="center">

													<font face="Arial, Helvetica, sans-serif" size="2">

													</font>

												</td>

												<!--importe-->
												<td width="12%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PrepaidAmount,'###,###,##0.00','pen')"/>
													</font> 
												</td>
											</tr>

										</xsl:if>
									
										
										<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>

 
									</table>
								</td>
							</tr>
						</body>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<!-- Exportacion-->
	<xsl:template name="DetallesEncabezado2">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
						<body>
							<tr>
								<td>
									<table rules="cols" border="0" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
										<tr bgColor="#A4A4A4" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
											<td width="10%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>Cantidad</strong>
												</font>
											</td>
											<td width="10%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>Unidad</strong>
												</font>
											</td>
											<td width="56%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>Descripción</strong>
												</font>
											</td>
											<td width="12%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>Precio de Vta. Unit</strong>
												</font>
											</td>
											<td width="12%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>Importe</strong>
												</font>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</body>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
						<body>
							<tr>
								<td>
									<table rules="cols" border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
										<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">

											<xsl:variable name="Descuento">
												<xsl:value-of select="0"/>
												<xsl:if test="cac:AllowanceCharge/cbc:Amount">
													<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
												</xsl:if>
											</xsl:variable>

											<tr>
												<!--cantidad-->
												<td width="10%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>
													</font>
												</td>
												<!--unidad-->
												<font face="Arial, Helvetica, sans-serif" size="2">
													<xsl:if test="cbc:ID='1'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">

																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>

																<td width="10%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea1"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='2'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>

																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea2"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>	
													</xsl:if>
													<xsl:if test="cbc:ID='3'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea3"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>	
													</xsl:if>
													<xsl:if test="cbc:ID='4'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea4"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='5'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea5"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='6'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea6"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='7'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea7"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='8'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea8"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='9'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea9">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea9"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='10'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea9">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea10">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea10"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
												</font>

												<!--descripcion-->
												<!--CCL-->
												<td width="56%" align="left">
													<font face="Arial, Helvetica, sans-serif" size="2">
								&#160;<xsl:value-of select="cac:Item/cbc:Description"/>
													</font>

												</td>
												<!--Vvu-->
												<!--td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;
								
								</font>
							</td-->


												<!--pvu-->
												<td width="12%" align="center">
													<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0'">
														<font face="Arial, Helvetica, sans-serif" size="2">
															<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0.00'">
																<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;
															</xsl:if>

															<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
																<xsl:if test=" cbc:PriceTypeCode='02'">
																	<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160; 
																</xsl:if>
															</xsl:for-each>

														</font>
													</xsl:if>
													<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount='0'">
														<font face="Arial, Helvetica, sans-serif" size="2">
															<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
																<xsl:if test=" cbc:PriceTypeCode='02'">
																	<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160; 
																</xsl:if>
															</xsl:for-each>
														</font>
													</xsl:if>

												</td>

												<!--importe-->
												<td width="12%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
													</font> 
												</td>
											</tr>

										</xsl:for-each>

										<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
											<xsl:variable name="Descuento">
												<xsl:value-of select="0"/>
												<xsl:if test="cac:AllowanceCharge/cbc:Amount">
													<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
												</xsl:if>																
											</xsl:variable>

											<tr>
												<!--cantidad-->
												<td width="10%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>
													</font> 
												</td>
												<!--unidad-->
												<font face="Arial, Helvetica, sans-serif" size="2">
													<xsl:if test="cbc:ID='1'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">

																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>

																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea1"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='2'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>

																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea2"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>	
													</xsl:if>
													<xsl:if test="cbc:ID='3'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea3"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>	
													</xsl:if>
													<xsl:if test="cbc:ID='4'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea4"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='5'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea5"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='6'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea6"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='7'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea7"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='8'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea8"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='9'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea9">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea9"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='10'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea9">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea10">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea10"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
												</font>

												<!--Descripción-->
												<td width="56%" align="left">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->								
									&#160;<xsl:value-of select="cac:Item/cbc:Description"/>
													</font>
												</td>
												
												<!--precio-->
												<td width="12%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;
													</font>

												</td>
												<!--importe-->
												<td width="12%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
													</font>
												</td>
											</tr>
										</xsl:for-each>

										<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
											<xsl:variable name="Descuento">
												<xsl:value-of select="0"/>
												<xsl:if test="cac:AllowanceCharge/cbc:Amount">
													<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
												</xsl:if>																
											</xsl:variable>

											<tr>
												<!--cantidad-->
												<td width="10%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>
													</font>
												</td>
												<!--unidad-->
												<font face="Arial, Helvetica, sans-serif" size="2">
													<xsl:if test="cbc:ID='1'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">

																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>

																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea1"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='2'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>

																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea2"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>	
													</xsl:if>
													<xsl:if test="cbc:ID='3'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea3"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>	
													</xsl:if>
													<xsl:if test="cbc:ID='4'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea4"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='5'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea5"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='6'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea6"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='7'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea7"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='8'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea8"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='9'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea9">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea9"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
													<xsl:if test="cbc:ID='10'">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='14'">
																<xsl:variable name="linea1">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea2">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea3">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea4">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea5">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea6">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea7">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea8">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea9">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="linea10">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<td width="7%" align="center">
																	<font face="Arial, Helvetica, sans-serif" size="2">
																		<xsl:value-of select="$linea10"/>
																	</font>
																</td>
															</xsl:if>
														</xsl:for-each>		

													</xsl:if>
												</font>

												<!--Descripción-->
												<td width="56%" align="left">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->								
									&#160;<xsl:value-of select="cac:Item/cbc:Description"/>
													</font>
												</td>
												
												<!--precio-->
												<td width="12%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;
													</font>
												</td>
												<!--importe-->
												<td width="12%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
													</font>
												</td>
											</tr>
										</xsl:for-each>

									<!--<xsl:call-template name="lineaB2">
											<xsl:with-param name="cont" select="$numColBl"/>
											<table>
												<tr>
													<td align="center" valign="top" width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2">
															<xsl:call-template name="total"/>
														</font>
													</td>
												</tr>
											</table>
										</xsl:call-template>-->
										<xsl:call-template name="lineaB2"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>

 
									</table>
								</td>
							</tr>
						</body>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>	

	<xsl:template name="lineaB2">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
				<td width="10" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
				<td width="56%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
				<td width="12" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
				<td width="12%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
			</tr>
			<xsl:call-template name="lineaB2">
				<xsl:with-param name="cont" select="$cont - 5"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="lineaB1">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
				<td width="8%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
				<td width="8%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
				<td width="52%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
				<td width="10" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
				<td width="10" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
				<td width="12%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="2"> </font>
				</td>
			</tr>
			<xsl:call-template name="lineaB1">
				<xsl:with-param name="cont" select="$cont - 5"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20124148970&#x2D;01&#x2D;FF11&#x2D;10000009.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->