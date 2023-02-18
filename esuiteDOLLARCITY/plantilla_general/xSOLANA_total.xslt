<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
	xmlns:ccts="urn:un:unece:uncefact:documentation:2"
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
	exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes" />

	<xsl:variable name="tipoDoc">

	<xsl:if test="//cbc:UBLVersionID = '2.0'">
		<xsl:for-each select="//cac:InvoiceLine">
			<xsl:if test="cbc:ID='001' and cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode = '40'">
				<xsl:value-of select="40" />
			</xsl:if>
		</xsl:for-each>
		
		<xsl:for-each select="//cac:CreditNoteLine">
			<xsl:if test="cbc:ID='001' and cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode = '40'">
				<xsl:value-of select="40" />
			</xsl:if>
		</xsl:for-each>	
		
		<xsl:for-each select="//cac:DebitNoteLine">
			<xsl:if test="cbc:ID='001' and cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode = '40'">
				<xsl:value-of select="40" />
			</xsl:if>
		</xsl:for-each>
	</xsl:if>

	<xsl:if test="//cbc:UBLVersionID = '2.1'">
		<xsl:for-each select="//cac:InvoiceLine">
			<xsl:if test="cbc:ID='1' and cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode = '40'">
				<xsl:value-of select="40" />
			</xsl:if>
		</xsl:for-each>		
		
		<xsl:for-each select="//cac:CreditNoteLine">
			<xsl:if test="cbc:ID='1' and cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode = '40'">
				<xsl:value-of select="40" />
			</xsl:if>
		</xsl:for-each>	
		
		<xsl:for-each select="//cac:DebitNoteLine">
			<xsl:if test="cbc:ID='1' and cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode = '40'">
				<xsl:value-of select="40" />
			</xsl:if>
		</xsl:for-each>			
	</xsl:if>
	</xsl:variable>
	
	
	<xsl:variable name="OPExport">
		<xsl:value-of select="0.00"/>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="OPGravada">
		<xsl:value-of select="0.00"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID = '1001'">
				<xsl:value-of select="cbc:PayableAmount"/>
			</xsl:if>
		</xsl:for-each>

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
	</xsl:variable>

	<xsl:variable name="OPInafecta">
	<xsl:value-of select="0.00"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID='1002'">
				<xsl:value-of select="cbc:PayableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="OPExonerada">
	<xsl:value-of select="0.00"/>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="DsctoGlobal">
		<xsl:value-of select="0"/>
		
		<xsl:for-each select="//pe:Invoice/cac:AllowanceCharge">    
			<xsl:if test="cbc:ChargeIndicator = 'false'">
				<xsl:value-of select="cbc:Amount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//pe1:CreditNote/cac:AllowanceCharge">
			<xsl:if test="cbc:ChargeIndicator = 'false'">
				<xsl:value-of select="cbc:Amount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//pe2:DebitNote/cac:AllowanceCharge">
			<xsl:if test="cbc:ChargeIndicator = 'false'">
				<xsl:value-of select="cbc:Amount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	
	<xsl:variable name="OpeGrat">
	<xsl:value-of select="0.00"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID = '1004'">
				<xsl:value-of select="cbc:PayableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		
		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="IGV" >
	<xsl:value-of select="0.00"/>
		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<!-- Template encargado de crear y contener las tablas/objetos que componen el sector de Totales -->
<xsl:template name="Total">
		<!--Tabla general del Total-->
		<!--Tabla que se dividira en 2 zonas -->
		<!-- Zona 1: parte superior : Lado izquierdo para (SON:"Monto en Letras) y otra para Totales-->
		<!-- Zona 2: parte inferior : Sustentos - Motivos y Documento Refrencia -->
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<!-- Zona 1 :(SON:"Monto en Letras) y otra para Totales-->
			<tr>
				<!-- Zona 1: pate superior : Lado izquierdo: SON:"Monto en Letras)-->
				<td width="65%" valign="top">
					<!-- Se crea otra tabla interna en esta celda para permitir una mejor distribuicion y facilitar cambios posteriores -->
					<table border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<xsl:call-template name="son-pesos"/>
							</td>
						</tr>

						<tr>
							<td>
								<table border="0" width="90%" cellpadding="0" cellspacing="0">

									<tr>
										<td>
												<table border="1" width="95%" cellpadding="2" cellspacing="0">
														<tr>
															<td>
																			<font face="Arial, Helvetica, sans-serif" size="1">
																				<xsl:variable name="validador6" >
																					<xsl:call-template name="RetourneValAd">
																						<xsl:with-param name="NumAd" select="6"/>
																					</xsl:call-template>
																				</xsl:variable>																				

																				Observaciones: <xsl:if test="$validador6!='' and $validador6!='-'"><xsl:call-template name="RetourneValAd">
																														<xsl:with-param name="NumAd" select="6"/>
																													</xsl:call-template><br/><br/>
																								</xsl:if>
																			</font>
															</td>
														</tr>
													
												</table>
										</td>
									</tr>
										<tr>
																<td>
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<Strong>&#xA0;</Strong>
																	</font>
																</td>
														</tr>
									<tr> 
										<td>
											<table border="0" width="88%" cellpadding="2" cellspacing="0">
												<tr>
													<td>
														<table border="0" width="88%" cellpadding="2" cellspacing="0">
															<tr>
																<!--<td width="5%">
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<Strong>&#xA0;</Strong>
																	</font>
																</td>-->

																<td ><!-- <td width="85%">-->
																	<font face="Arial, Helvetica, sans-serif" size="1">
																		<xsl:if test="//cac:PaymentMeans/cbc:PaymentMeansCode='999'">
																			<xsl:call-template name="Detraccion"/>
																		</xsl:if>
																		
																	</font>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
					

									<tr>
										<td>
											<table border="0" cellpadding="0" cellspacing="0">
												<!-- Zona 2 : Sustentos - Motivos y Documento Referencia -->
								<tr>
									<td width="45%">
										<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
											<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
												

												<tr>
													<td width="100%" align="left">
														<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
															<strong>DATOS REFERENCIA:</strong>
														</font>
													</td>
												</tr>
											
												<tr>
													<td width="80%">
														<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="0" width="80%">
															<tr>
																<td width="40%" align="center">
																	<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
																		<strong>TIPO DE DOCUMENTO</strong>
																	</font>
																</td>
																<td width="60%" align="center">
																	<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
																		<strong>SERIE - CORRELATIVO</strong>
																	</font>
																</td>
															</tr>
														
														
							
																<xsl:for-each select="/pe1:CreditNote/cac:BillingReference">
														<tr>
															<td width="40%" align="center">
		                         		 						<font face="Arial, Helvetica, sans-serif" size="2">
																	<xsl:variable name="CTSTipoCPE">
																		<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
		                													<xsl:if test="cbc:DocumentTypeCode != '10'">
																				<xsl:choose>
			                                        								<xsl:when test="cbc:DocumentTypeCode = '01'">FACTURA*</xsl:when>
			                                        								<xsl:when test="cbc:DocumentTypeCode = '03'">BOLETA*</xsl:when>
			                                        								<xsl:when test="cbc:DocumentTypeCode = '07'">NOTA DE CRÉDITO*</xsl:when>
			                                        								<xsl:when test="cbc:DocumentTypeCode = '08'">NOTA DE DÉBITO*</xsl:when>
			                                        								<xsl:otherwise>Documento NN</xsl:otherwise>
			                                     								</xsl:choose>
																			</xsl:if>
																		</xsl:for-each>
																	</xsl:variable>
																	<xsl:value-of select="substring-before($CTSTipoCPE, '*')"/>
																</font>
		                									</td>
		                 									<td width="60%" align="center">
		                    									<font face="Arial, Helvetica, sans-serif" size="2">
																	<xsl:value-of select="cac:InvoiceDocumentReference/cbc:ID"/>
																</font>
		                 									</td>
														</tr>
													</xsl:for-each>

																<xsl:for-each select="/pe2:DebitNote/cac:BillingReference">
														<tr>
															<td width="40%" align="center">
		                         		 						<font face="Arial, Helvetica, sans-serif" size="2">
																	<xsl:variable name="CTSTipoCPE">
																		<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
		                													<xsl:if test="cbc:DocumentTypeCode != '10'">
																				<xsl:choose>
			                                        								<xsl:when test="cbc:DocumentTypeCode = '01'">FACTURA*</xsl:when>
			                                        								<xsl:when test="cbc:DocumentTypeCode = '03'">BOLETA*</xsl:when>
			                                        								<xsl:when test="cbc:DocumentTypeCode = '07'">NOTA DE CRÉDITO*</xsl:when>
			                                        								<xsl:when test="cbc:DocumentTypeCode = '08'">NOTA DE DÉBITO*</xsl:when>
			                                        								<xsl:otherwise>Documento NN</xsl:otherwise>
			                                     								</xsl:choose>
																			</xsl:if>
																		</xsl:for-each>
																	</xsl:variable>
																	<xsl:value-of select="substring-before($CTSTipoCPE, '*')"/>
																</font>
		                									</td>
		                 				
															<td width="60%" align="center">
		                    									<font face="Arial, Helvetica, sans-serif" size="2">
																	<xsl:value-of select="cac:InvoiceDocumentReference/cbc:ID"/>
																</font>
		                 									</td>
														</tr>
													</xsl:for-each>
														</table>
													</td>
												</tr>
											
												<tr>
													<td width="100%" align="left">
														<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
															&#160;
														</font>
													</td>
												</tr>
																				
												<tr>
													<td width="100%" align="left">
														<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
															<strong>MOTIVO: </strong>
															<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>						
														</font>
													</td>
												</tr>
												
											</xsl:if>
										</table>
									</td>
								</tr>
											</table>
										</td>
									</tr>
							
								</table>
							</td>
						</tr>
					</table>
				</td>
						
								<!-- Zona 1: parte superior : Lado derecho: Montos Totales -->
				<td width="35%">
					<!-- Se crea otra tabla interna en esta celda para permitir una mejor distribuicion y facilitar cambios posteriores -->
					<table border="1" width="100%" cellpadding="2" cellspacing="0">	
						<br></br>
							<xsl:if test="$tipoDoc = '40'">
								<tr>
									<td>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong> Operación Exportación</strong>
										</font>
									</td>
									<td align="right">
										<table border="0" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000" heigth="100%">
											<tr>
												<td width="15%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:choose>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:otherwise>Otra Moneda</xsl:otherwise>
														</xsl:choose>
													</font>
												</td>
												<td width="85%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number($OPExport,'###,###,##0.00','pen')"/>&#xA0;
													</font>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</xsl:if>

							<tr>
									<!-- Titulo Total Gravado-->
								<td width="50%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Total Valor de Venta</strong>
										</font>
									</td>
							
									<td width="50%" align="right">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td width="15%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:choose>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:otherwise>Otra Moneda</xsl:otherwise>
														</xsl:choose>		
													</font>
												</td>
												<td width="85%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:call-template name="RetourneValAd">
															<xsl:with-param name="NumAd" select="7"/>
														</xsl:call-template>&#xA0;
													</font>
												</td>
											</tr>
										</table>
									</td>
							<!-- Total Valor Venta-->
								</tr>

								<tr>
									<!-- Titulo Total Gravado-->
								<td width="50%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Subtotal</strong>
										</font>
									</td>
							
									<td width="50%" align="right">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td width="15%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:choose>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:otherwise>Otra Moneda</xsl:otherwise>
														</xsl:choose>		
													</font>
												</td>
												<td width="85%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:call-template name="RetourneValAd">
															<xsl:with-param name="NumAd" select="8"/>
														</xsl:call-template>&#xA0;
													</font>
												</td>
											</tr>
										</table>
									</td>
							<!-- Sub total-->
								</tr>

						
							<tr>
									<!-- Titulo Total Gravado-->
								<td width="50%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Operación Gravada</strong>
										</font>
									</td>
							
									<td width="50%" align="right">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td width="15%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:choose>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:otherwise>Otra Moneda</xsl:otherwise>
														</xsl:choose>		
													</font>
												</td>
												<td width="85%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>&#xA0;
													</font>
												</td>
											</tr>
										</table>
									</td>
							<!-- Fin Total Gravada-->
								</tr>
						<!-- Total Inafecta - No Gravada-->
								<tr>
							<!-- Titulo Total Inafecta - No Gravada-->
									<td width="50%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Operación Exonerada</strong>
										</font>
									</td>
									
									<td width="50%" align="right">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td width="15%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:choose>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:otherwise>Otra Moneda</xsl:otherwise>
														</xsl:choose>
													</font>
												</td>
												<td width="85%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number($OPExonerada,'###,###,##0.00','pen')"/>&#160;
													</font>
												</td>
												<!-- Fin Inafecta - No Gravada-->
											</tr>
						<!-- Total Exonerado -->
										</table>
									</td>	
								</tr>
									
								<tr>
							<!-- Titulo Total Exonerado -->
									<td width="50%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Operación Inafecta</strong>
										</font>
									</td>
									
							<!-- Dato Total Exonerado -->
									<td width="50%" align="right">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td width="15%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:choose>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:otherwise>Otra Moneda</xsl:otherwise>
														</xsl:choose>
													</font>
												</td>
												<td width="85%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>&#160;
													</font>
												</td>
												<!-- Fin Total Exonerado -->
											</tr>
										</table>
									</td>
								</tr>
									
								
								<tr>
                					<td width="50%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Operación Gratuita</strong>
										</font>
									</td>

									<td width="50%" align="right">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td width="15%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:choose>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:otherwise>Otra Moneda</xsl:otherwise>
														</xsl:choose>
													 </font>
												</td>
										
												<td width="85%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number($OpeGrat, '###,###,##0.00', 'pen')"/>&#xA0;
													</font>
												</td>
            								</tr>
										</table>
									</td>
								</tr>

						<!-- Total IGV -->

								<tr>
               						<td width="50%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>IGV. (18%)</strong>
										</font>
									</td>
									<td width="50%" align="right">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td width="15%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:choose>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUR</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUR</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUR</xsl:when>
															<xsl:otherwise>Otra Moneda</xsl:otherwise>
														</xsl:choose>
													</font>
               									</td>
												<td width="85%" align="right">
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
									<xsl:value-of select="0.00"/> <!-- Valor inicial 0.00 -->
									<xsl:choose>
									<!-- Validamos si se trata de una transferencia gratuita -->
									<xsl:when test="//cbc:Note[@languageLocaleID='1002']!=''"> 
									<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
											<xsl:value-of select="cbc:TaxAmount"/>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
											<xsl:value-of select="cbc:TaxAmount"/>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
											<xsl:value-of select="cbc:TaxAmount"/>
										</xsl:if>
									</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
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
									</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</xsl:variable>
							<xsl:value-of select="format-number($totaligv,'###,###,##0.00', 'pen')"/>&#xA0;
														<!--<xsl:value-of select="format-number($IGV, '###,###,##0.00', 'pen')"/>-->
													</font>
												</td>
            								</tr>
										</table>
									</td>
								</tr>


								<!-- Total ICBPER -->

						<xsl:variable name="bolsa">
                            <xsl:value-of select="0.00"/>
                            <xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                                <xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='7152'">
                                    <xsl:value-of select="cbc:TaxAmount"/>
                                </xsl:if>
                            </xsl:for-each>
                            <xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
                                <xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='7152'">
                                    <xsl:value-of select="cbc:TaxAmount"/>
                                </xsl:if>
                            </xsl:for-each>
                            <xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
                                <xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='7152'">
                                    <xsl:value-of select="cbc:TaxAmount"/>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
						

								<tr>
               						<td width="50%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<Strong>ICBPER.</Strong>
										</font>
									</td>
									<td width="50%" align="right">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td width="15%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:choose>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:otherwise>Otra Moneda</xsl:otherwise>
														</xsl:choose>
													</font>
               									</td>
												<td width="85%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:value-of select="format-number($bolsa, '###,###,##0.00', 'pen')"/>&#xA0;
													</font>
												</td>
            								</tr>
										</table>
									</td>
								</tr>



						<!-- Total Monto - Importe -->
									
								<tr>
									<td width="50%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Importe Total</strong>
										</font>
									</td>
										
									<td width="50%" align="right">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td width="15%" align="right">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:choose>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
															<xsl:otherwise>Otra Moneda</xsl:otherwise>
														</xsl:choose>
													</font>
												</td>

												<td width="85%" align="right">
													<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
														<font face="Arial, Helvetica, sans-serif" size="2">
															<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;
			   											</font>
													</xsl:if>

													<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">	
               											<font face="Arial, Helvetica, sans-serif" size="2">
															<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;
			   											</font>
													</xsl:if>
												</td>
											</tr>
										</table>
									</td>
								</tr>
			
					</table>
				</td>
			</tr>
		</table>
		
	</xsl:template>

	

	<xsl:template name="SimboloMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'PEN'">S/</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'USD'">USD</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'EUR'">EUR</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'USD'">USD</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'EUR'">EUR</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'USD'">USD</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'EUR'">EUR</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="son-pesos">
		<!--<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000">-->
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="100%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<b>SON :&#160;</b>
					</font>
					<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
						<xsl:if test="cbc:ID='1000'">
							<xsl:value-of select="cbc:Value"/>
						</xsl:if>
					</xsl:for-each>

					<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']"/>-->
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']" />
					</font>
				</td>
			</tr>
			<tr>
				<td>
					&#xA0;
				</td>
			</tr>

		<xsl:if test="//cbc:Note/@languageLocaleID = '1002'">	
			<tr>
				<td>
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:value-of select="//cbc:Note"/>
					</font>
				</td>
			</tr>
		</xsl:if>
						
		</table>
	</xsl:template>

	<xsl:template name="fecha_ddmmaa_ref">
		<xsl:variable name="aa">
			<xsl:value-of select="substring-before(FchRef, '-')" />
		</xsl:variable>
		<xsl:variable name="mmdd">
			<xsl:value-of select="substring-after(FchRef, '-')" />
		</xsl:variable>
		<!--prefijo Fecha Emision Mes -->
		<xsl:variable name="mm">
			<xsl:value-of select="substring-before($mmdd, '-')" />
		</xsl:variable>
		<xsl:variable name="dd">
			<xsl:value-of select="substring-after($mmdd, '-')" />
		</xsl:variable>
		<!-- MES -Nombre -->
		<xsl:value-of select="concat($dd,'-', $mm, '-' , $aa)" />
	</xsl:template>

<!--	<xsl:template name="detobservaciones">
		<xsl:param name="var" />

		<xsl:variable name="varvar">
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
				<xsl:if test="pe:Codigo = '9'"><xsl:value-of select="pe:Valor" /></xsl:if>
			</xsl:for-each>
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
				<xsl:if test="pe1:Codigo = '9'"><xsl:value-of select="pe1:Valor" /></xsl:if>
			</xsl:for-each>
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
				<xsl:if test="pe2:Codigo = '9'"><xsl:value-of select="pe2:Valor" /></xsl:if>
			</xsl:for-each>
		</xsl:variable>
	
		<xsl:variable name="linea1">
			<xsl:value-of select="substring-before($varvar, '|')" />
		</xsl:variable>
		<xsl:variable name="resto1">
			<xsl:value-of select="substring-after($varvar, '|')" />
		</xsl:variable>
		<xsl:variable name="linea2">
			<xsl:value-of select="substring-before($resto1, '|')" />
		</xsl:variable>
		<xsl:variable name="resto2">
			<xsl:value-of select="substring-after($resto1, '|')" />
		</xsl:variable>
		<xsl:variable name="linea3">
			<xsl:value-of select="substring-before($resto2, '|')" />
		</xsl:variable>
		<xsl:variable name="resto3">
			<xsl:value-of select="substring-after($resto2, '|')" />
		</xsl:variable>
		<xsl:variable name="linea4">
			<xsl:value-of select="substring-before($resto3, '|')" />
		</xsl:variable>
		<xsl:variable name="resto4">
			<xsl:value-of select="substring-after($resto3, '|')" />
		</xsl:variable>
		<xsl:variable name="linea5">
			<xsl:value-of select="substring-before($resto4, '|')" />
		</xsl:variable>
		<xsl:variable name="resto5">
			<xsl:value-of select="substring-after($resto4, '|')" />
		</xsl:variable>
		<xsl:variable name="linea6">
			<xsl:value-of select="substring-before($resto5, '|')" />
		</xsl:variable>
		<xsl:variable name="resto6">
			<xsl:value-of select="substring-after($resto5, '|')" />
		</xsl:variable>
		<xsl:variable name="linea7">
			<xsl:value-of select="substring-before($resto6, '|')" />
		</xsl:variable>
		<xsl:variable name="resto7">
			<xsl:value-of select="substring-after($resto6, '|')" />
		</xsl:variable>
		
	
		<xsl:choose>
			<xsl:when test="$var = '1'"><xsl:value-of select="$linea1" /></xsl:when>
			<xsl:when test="$var = '2'"><xsl:value-of select="$linea2" /></xsl:when>
			<xsl:when test="$var = '3'"><xsl:value-of select="$linea3" /></xsl:when>
			<xsl:when test="$var = '4'"><xsl:value-of select="$linea4" /></xsl:when>
			<xsl:when test="$var = '5'"><xsl:value-of select="$linea5" /></xsl:when>
			<xsl:when test="$var = '6'"><xsl:value-of select="$linea6" /></xsl:when>
			<xsl:when test="$var = '7'"><xsl:value-of select="$linea7" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->	

	<xsl:template name="TipoDeMoneda_Total">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="Detraccion">

		<table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#000000">
			<!--<xsl:if test="$varCtsPorcenDetra !='' ">-->
				<!--<xsl:if test="$varCtaBN !='' ">-->
				<tbody>
					<tr>
						<td align="left" width="80%">
							<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
								<br/>OPERACIÓN SUJETA AL SISTEMA DE PAGO DE OBLIGACIONES TRIBUTARIAS CON EL GOBIERNO CENTRAL.
								<br/>BANCO DE LA NACIÓN - CTA. CTE. N°&#160;
								<!--Nro. Cuenta de Banco-->
								<xsl:for-each select="//pe:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount">
						    	<xsl:value-of select="cbc:ID"/> 
						   	</xsl:for-each>
																	
							<xsl:for-each select="//pe1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount">
						     	<xsl:value-of select="cbc:ID"/> 
						   	</xsl:for-each>

							<xsl:for-each select="//pe2:DebitNote/cac:PaymentMeans/cac:PayeeFinancialAccount">
						     	<xsl:value-of select="cbc:ID"/> 
						   	</xsl:for-each> &#160; &#160;

								
								<br/><br/></font>
						</td>
					</tr>
				</tbody>
			<!--</xsl:if>-->
		</table>
	</xsl:template>

	<!-- TRAE EL PROCENTAJE DE DETRACCIÃ“N -->
	<!--Revisar el Anexo D Sunat-Catalogo NÂ°14 codigos de otros conceptos tributarios-->
	<!--<xsl:value-of select="Invoice/cac:PaymentMeans/cbc:PaymentMeansCode"/>-->

	<xsl:variable name="varCtsPorcenDetra">
		<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">-->
			<xsl:for-each select="//pe:Invoice/cac:PaymentMeans">
			<!--<xsl:if test="cbc:ID='2003'">-->
				<xsl:value-of select="cbc:PaymentPercent"/>
			<!--</xsl:if>-->
		</xsl:for-each>
	</xsl:variable>

	<!-- DATOS ADICIONALES DE DETRACCION BBySS  -->
	<!--Revisar el Anexo D Sunat-Catalogo NÂ°15 codigos de elementos adicionales en la factura o bv-->
	<xsl:variable name="varCodBBySS">
		<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">-->
			<xsl:for-each select="//pe:Invoice/cac:PaymentMeans">
			<xsl:if test="cbc:PaymentMeansID='030'">
				<xsl:value-of select="cbc:PaymentPercent"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<!-- DATOS ADICIONALES DE DETRACCION CUENTA BN  -->
	<!--Revisar el Anexo D Sunat-Catalogo NÂ°15 codigos de elementos adicionales en la factura o bv-->

	<xsl:variable name="varCtaBN">
		<xsl:for-each select="//pe:Invoice/cac:PaymentMeans">
			<xsl:if test="cbc:PaymentMeansCode='999'">
				<xsl:value-of select="/cac:PayeeFinancialAccount/cbc:ID"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<!--<xsl:for-each select="//pe:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount">
						    	<xsl:value-of select="/cac:PayeeFinancialAccount/cbc:ID"/> 
						   	</xsl:for-each>-->

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>

</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition><template name="son&#x2D;pesos"><block path="table/td/font/xsl:for&#x2D;each" x="410" y="60"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if/=[0]" x="314" y="88"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if" x="360" y="90"/><block path="table/td/font/xsl:for&#x2D;each[1]" x="300" y="30"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="204" y="58"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if" x="250" y="60"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/xsl:value&#x2D;of" x="320" y="90"/><block path="table/td/font/xsl:for&#x2D;each[2]" x="340" y="30"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="84" y="58"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if" x="130" y="60"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/xsl:value&#x2D;of" x="200" y="90"/></template><template name="Total"></template><template match="/"></template><template name="Dato01"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->