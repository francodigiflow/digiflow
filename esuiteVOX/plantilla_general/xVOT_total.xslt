<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="son-pesos">
		<table border="0">
			<td align="left" width="70%">
				<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='03'">					
							<xsl:value-of select="pe:Valor"/>
						</xsl:if>
					</xsl:for-each>
					
				</font>
			</td>
		</table>
	</xsl:template>

	<xsl:template name="son-pesos_1">
		<table border="0" cellpadding="0" cellspacing="0">
			<td align="left" width="70%">
				<font face="Arial, Helvetica, sans-serif" size="2">
				
					<xsl:if test="/pe1:CreditNote!='' or /pe2:DebitNote!=''">
					</xsl:if>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='03'">						
							<xsl:value-of select="pe1:Valor"/>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='03'">					
							<xsl:value-of select="pe2:Valor"/>
						</xsl:if>
					</xsl:for-each>
				</font>
			</td>
		</table>
	</xsl:template>

	<xsl:template name="Total">
		<table border="1" width="100%" cellpadding="3" cellspacing="0" bordercolor="#000000" heigth="100%">
			<tr>
				<td valign="top" width="62%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>Total Gravado</strong>
					</font>
				</td>
				<!--> Total Gravado<-->
					<td valign="top" width="38%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">&#160;
							<xsl:if test="/pe:Invoice/cbc:UBLVersionID= '2.1' or /pe1:CreditNote/cbc:UBLVersionID= '2.1' or /pe2:DebitNote/cbc:UBLVersionID= '2.1'  ">
								<xsl:choose>
									<xsl:when test="//cac:TaxTotal/cbc:TaxAmount='0.00'">
						    0.00
									</xsl:when>

									<xsl:otherwise>
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
												<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')" />&#160;
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
												<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')" />&#160;
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
												<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')" />&#160;
											</xsl:if>
										</xsl:for-each>


									</xsl:otherwise>
								</xsl:choose>	
							</xsl:if>
							<xsl:if test="/pe:Invoice/cbc:UBLVersionID!= '2.1'">	
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
									<xsl:if test="cbc:ID='1001'">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
								</xsl:for-each>

							</xsl:if>


						</font>
					</td>
				</tr>
				<tr>
					<td valign="top" width="62%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>Total no Gravado</strong>
						</font>
					</td>
					<!--> Total No gravado<-->
						<td valign="top" width="38%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="2">&#160;
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
									<xsl:if test="cbc:ID='1002'">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
								</xsl:for-each>  

								<xsl:if test="/pe:Invoice/cbc:UBLVersionID= '2.1' or /pe1:CreditNote/cbc:UBLVersionID= '2.1' or /pe2:DebitNote/cbc:UBLVersionID= '2.1'  ">
									<xsl:choose>
										<xsl:when test="//cac:TaxTotal/cbc:TaxAmount='0.00'">
						    0.00
										</xsl:when>

										<xsl:otherwise>
											<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID = '9998'">
													<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')" />
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID = '9998'">
													<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')" />
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID = '9998'">
													<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')" />
												</xsl:if>
											</xsl:for-each>

										</xsl:otherwise>
									</xsl:choose>	
								</xsl:if>
							</font>
						</td>
					</tr>
					<!--Exportacion ubl2.1-->

					<xsl:if test="//cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and $VersionUbl='01'">
						<tr>
							<td valign="top" width="62%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Total Exportación</strong>
								</font>
							</td>
							<!--> Total Exportacion<-->
								<td valign="top" width="38%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">&#160;


										<xsl:if test="/pe:Invoice/cbc:UBLVersionID= '2.1'">
											<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')" />
												</xsl:if>
											</xsl:for-each>



										</xsl:if>

										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">

											<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
												<font face="Arial, Helvetica, sans-serif" size="2"> <xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
											<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">	
												<font face="Arial, Helvetica, sans-serif" size="2"> <xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
												</font>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">

											<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
												<font face="Arial, Helvetica, sans-serif" size="2"> <xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
											<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">	
												<font face="Arial, Helvetica, sans-serif" size="2"> <xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
												</font>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td valign="top" width="62%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Total Exonerado</strong>
								</font>
							</td>
							<!--> Total Exonerado<-->
								<td valign="top" width="38%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">&#160;


										<xsl:if test="$VersionUbl='01'">
											<!--UBL2.1-->
											<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
													<xsl:value-of select="cbc:TaxableAmount"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">

													<xsl:if test="cbc:TaxableAmount>'0'">
																	0.00
													</xsl:if>

												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
													<!--<xsl:value-of select="cbc:TaxAmount"/>-->
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
													<!--<xsl:value-of select="cbc:TaxAmount"/>-->
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
													<!--<xsl:value-of select="cbc:TaxAmount"/>-->
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
													<!--<xsl:value-of select="cbc:TaxAmount"/>-->
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>


										</xsl:if>
										<xsl:if test="$VersionUbl!='01'">
											<!--UBL2.0-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
												<xsl:if test="cbc:ID='1003'">
													<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
													<!--<xsl:value-of select="cbc:TaxAmount"/>-->
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
													<!--<xsl:value-of select="cbc:TaxAmount"/>-->
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
													<!--<xsl:value-of select="cbc:TaxAmount"/>-->
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
													<!--<xsl:value-of select="cbc:TaxAmount"/>-->
													<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>

										</xsl:if>
									</font>
								</td>
							</tr>

							<tr>
								<td  valign="top" width="62%" align="left" >
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Total Dscto.</strong>
									</font>
								</td>
								<!--> Total Dscto<-->
									<xsl:variable name="Descuento2">
										
										<xsl:value-of select="0.00"/>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID='2005'">
												<xsl:if test="cbc:PayableAmount!='0'">
													<xsl:value-of select="cbc:PayableAmount"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>

									<td width="38%" valign="top"  align="right">
										<font face="Arial, Helvetica, sans-serif" size="2">&#160;
											<xsl:value-of select="format-number($Descuento2,'0.00','pen')"/>
										
										</font>
									</td>
								</tr>
								<tr>
									<td valign="top" width="62%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Total IGV (18%)</strong>
										</font>
									</td>
									<!--> Total IGV<-->
										<xsl:if test="/pe:Invoice/cbc:UBLVersionID!= '2.1'">
											<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
												<td align="right" width="38%">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
															<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
														</xsl:if>
													</font>
												</td>
											</xsl:for-each>
											<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">

											<td align="right">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
														<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
													</xsl:if>
												</font>
											</td>

										</xsl:for-each>

										</xsl:if>
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
											<td align="right" width="38%">
												<font face="Arial, Helvetica, sans-serif" size="2"> 
													<xsl:choose>
														<xsl:when test="//cac:TaxTotal/cbc:TaxAmount='0.00'">
						    0.00
														</xsl:when>

														<xsl:otherwise>
															<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
																<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
																	<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')" />
																</xsl:if>
															</xsl:for-each>

														</xsl:otherwise>
													</xsl:choose>

												</font>
											</td>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
											<td align="right" width="38%">
												<font face="Arial, Helvetica, sans-serif" size="2"> 
													<xsl:choose>
														<xsl:when test="//cac:TaxTotal/cbc:TaxAmount='0.00'">
						    0.00
														</xsl:when>

														<xsl:otherwise>
															<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
																<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
																	<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')" />
																</xsl:if>
															</xsl:for-each>

														</xsl:otherwise>
													</xsl:choose>

												</font>
											</td>
										</xsl:for-each>
											<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
											<td align="right" width="38%">
												<font face="Arial, Helvetica, sans-serif" size="2"> 
													<xsl:choose>
														<xsl:when test="//cac:TaxTotal/cbc:TaxAmount='0.00'">
						    0.00
														</xsl:when>

														<xsl:otherwise>
															<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
																<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
																	<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')" />
																</xsl:if>
															</xsl:for-each>

														</xsl:otherwise>
													</xsl:choose>

												</font>
											</td>
										</xsl:for-each>
										
										
									</tr>
									<xsl:if test="//cac:LegalMonetaryTotal/cbc:PrepaidAmount!='0'">
										<tr>
											<td valign="top" width="62%" align="left">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<strong>Total Anticipos</strong>
												</font>
											</td>
											<td width="38%" align="right">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PrepaidAmount,'###,###,##0.00','pen')"/>
												</font>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td valign="top" width="62%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>Otros Cargos</strong>
											</font>
										</td>
										<td width="38%" align="right">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount,'###,###,##0.00','pen')"/>
											</font>
										</td>
									</tr>
									<tr>
										<td valign="top" width="62%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>Importe Total</strong>
											</font>
										</td>
										<!--> Importe Total<-->
											<td valign="top" width="38%" align="right">
											<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
													<font face="Arial, Helvetica, sans-serif" size="2"> <xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
													</font>
												</xsl:if>
												<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">	
													<font face="Arial, Helvetica, sans-serif" size="2"> <xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
													</font>
												</xsl:if>
											</td>
										</tr>
									</table>
								</xsl:template>

								<xsl:template name="Referencia">
									<table border="0"   width="100%">
										<tbody>
											<tr>
												<td>
													<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
														<tbody>
															<!--<tr><td COLSPAN="2"><strong>&#160;</strong></td></tr>-->
															<tr>
																<td COLSPAN="2">
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																		<xsl:if test="pe1:Codigo='09'">	
																			<xsl:if test="pe1:Valor!='-'">
																				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="80%">
																					<tbody>
																						<tr>
																							<td align="left">
																								<font face="Arial, Helvetica, sans-serif" size="2">
																									<strong>Nota: </strong>
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																										<xsl:if test="pe:Codigo='09'">					
																											<xsl:value-of select="pe:Valor"/>
																											<xsl:if test="string-length(pe:Valor) &lt; 50">
																												<br/>&#160;
																											</xsl:if>
																										</xsl:if>
																									</xsl:for-each>

																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																										<xsl:if test="pe1:Codigo='09'">						
																											<xsl:value-of select="pe1:Valor"/>
																											<xsl:if test="string-length(pe1:Valor) &lt; 50">
																												<br/>&#160;
																											</xsl:if>
																										</xsl:if>
																									</xsl:for-each>

																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																										<xsl:if test="pe2:Codigo='09'">					
																											<xsl:value-of select="pe2:Valor"/>
																											<xsl:if test="string-length(pe2:Valor) &lt; 50">
																												<br/>&#160;
																											</xsl:if>
																										</xsl:if>
																									</xsl:for-each>

																								</font>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																				<font face="Arial, Helvetica, sans-serif" size="0">
																					<br/>
																				</font>
																				<!--<tr><td><font face="Arial, Helvetica, sans-serif" size="2"><br/></font></td></tr>-->
																			</xsl:if>
																		</xsl:if>
																	</xsl:for-each>	
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																		<xsl:if test="pe2:Codigo='09'">	
																			<xsl:if test="pe2:Valor!='-'">
																				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="80%">
																					<tbody>
																						<tr>
																							<td align="left">
																								<font face="Arial, Helvetica, sans-serif" size="2">
																									<strong>Nota: </strong>
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																										<xsl:if test="pe:Codigo='09'">					
																											<xsl:value-of select="pe:Valor"/>
																											<xsl:if test="string-length(pe:Valor) &lt; 50">
																												<br/>&#160;
																											</xsl:if>
																										</xsl:if>
																									</xsl:for-each>

																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																										<xsl:if test="pe1:Codigo='09'">						
																											<xsl:value-of select="pe1:Valor"/>
																											<xsl:if test="string-length(pe1:Valor) &lt; 50">
																												<br/>&#160;
																											</xsl:if>
																										</xsl:if>
																									</xsl:for-each>

																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																										<xsl:if test="pe2:Codigo='09'">					
																											<xsl:value-of select="pe2:Valor"/>
																											<xsl:if test="string-length(pe2:Valor) &lt; 50">
																												<br/>&#160;
																											</xsl:if>
																										</xsl:if>
																									</xsl:for-each>

																								</font>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																				<font face="Arial, Helvetica, sans-serif" size="0">
																					<br/>
																				</font>
																				<!--<tr><td><font face="Arial, Helvetica, sans-serif" size="2"><br/></font></td></tr>-->
																			</xsl:if>
																		</xsl:if>
																	</xsl:for-each>	

																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																		<xsl:if test="pe:Codigo='06'">	
																			<xsl:if test="pe:Valor!='-'">
																				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="80%">
																					<tbody>
																						<tr>
																							<td align="left">
																								<font face="Arial, Helvetica, sans-serif" size="2">Observación :
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																										<xsl:if test="pe:Codigo='06'">					
																											<xsl:value-of select="pe:Valor"/>
																										</xsl:if>
																									</xsl:for-each>

																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																										<xsl:if test="pe1:Codigo='06'">						
																											<xsl:value-of select="pe1:Valor"/>
																										</xsl:if>
																									</xsl:for-each>

																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																										<xsl:if test="pe2:Codigo='06'">					
																											<xsl:value-of select="pe2:Valor"/>
																										</xsl:if>
																									</xsl:for-each>

																								</font>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</xsl:if>
																		</xsl:if>
																	</xsl:for-each>		
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																		<xsl:if test="pe1:Codigo='06'">	
																			<xsl:if test="pe1:Valor!='-'">
																				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="80%">
																					<tbody>
																						<tr>
																							<td align="left">
																								<font face="Arial, Helvetica, sans-serif" size="2">
																									<strong>Observación: </strong>
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																										<xsl:if test="pe:Codigo='06'">					
																											<xsl:value-of select="pe:Valor"/>
																											<xsl:if test="string-length(pe:Valor) &lt; 50">
																												<br/>&#160;
																											</xsl:if>
																										</xsl:if>
																									</xsl:for-each>

																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																										<xsl:if test="pe1:Codigo='06'">						
																											<xsl:value-of select="pe1:Valor"/>
																											<xsl:if test="string-length(pe1:Valor) &lt; 50">
																												<br/>&#160;
																											</xsl:if>
																										</xsl:if>
																									</xsl:for-each>

																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																										<xsl:if test="pe2:Codigo='06'">					
																											<xsl:value-of select="pe2:Valor"/>
																											<xsl:if test="string-length(pe2:Valor) &lt; 50">
																												<br/>
																											</xsl:if>
																										</xsl:if>
																									</xsl:for-each>

																								</font>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</xsl:if>
																		</xsl:if>
																	</xsl:for-each>	
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																		<xsl:if test="pe2:Codigo='06'">	
																			<xsl:if test="pe2:Valor!='-'">
																				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="80%">
																					<tbody>
																						<tr>
																							<td align="left">
																								<font face="Arial, Helvetica, sans-serif" size="2">
																									<strong>Observación: </strong>
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																										<xsl:if test="pe:Codigo='06'">					
																											<xsl:value-of select="pe:Valor"/>
																											<xsl:if test="string-length(pe:Valor) &lt; 50">
																												<br/>&#160;
																											</xsl:if>
																										</xsl:if>
																									</xsl:for-each>

																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																										<xsl:if test="pe1:Codigo='06'">						
																											<xsl:value-of select="pe1:Valor"/>
																											<xsl:if test="string-length(pe1:Valor) &lt; 50">
																												<br/>&#160;
																											</xsl:if>
																										</xsl:if>
																									</xsl:for-each>

																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																										<xsl:if test="pe2:Codigo='06'">					
																											<xsl:value-of select="pe2:Valor"/>
																											<xsl:if test="string-length(pe2:Valor) &lt; 50">
																												<br/>
																											</xsl:if>
																										</xsl:if>
																									</xsl:for-each>

																								</font>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</xsl:if>
																		</xsl:if>
																	</xsl:for-each>

																</td>
															</tr>
															<tr>
																<td COLSPAN="2">
																	<font face="Arial, Helvetica, sans-serif" size="0">
																		<strong></strong>
																	</font>
																</td>
															</tr>
															<tr>
																<td COLSPAN="2">
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																		<xsl:if test="pe:Codigo='07'">	
																			<xsl:if test="pe:Valor!='-'">
																				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="80%">
																					<tbody>
																						<tr>
																							<td align="left">
																								<font face="Arial, Helvetica, sans-serif" size="2">Observación 2:
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																										<xsl:if test="pe:Codigo='07'">					
																											<xsl:value-of select="pe:Valor"/>
																										</xsl:if>
																									</xsl:for-each>
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																										<xsl:if test="pe1:Codigo='07'">						
																											<xsl:value-of select="pe1:Valor"/>
																										</xsl:if>
																									</xsl:for-each>
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																										<xsl:if test="pe2:Codigo='07'">					
																											<xsl:value-of select="pe2:Valor"/>
																										</xsl:if>
																									</xsl:for-each>
																								</font>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</xsl:if>
																		</xsl:if>
																	</xsl:for-each>
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																		<xsl:if test="pe1:Codigo='07'">	
																			<xsl:if test="pe1:Valor!='-'">
																				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="80%">
																					<tbody>
																						<tr>
																							<td align="left">
																								<font face="Arial, Helvetica, sans-serif" size="2">Observación 2:
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																										<xsl:if test="pe:Codigo='07'">					
																											<xsl:value-of select="pe:Valor"/>
																										</xsl:if>
																									</xsl:for-each>
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																										<xsl:if test="pe1:Codigo='07'">						
																											<xsl:value-of select="pe1:Valor"/>
																										</xsl:if>
																									</xsl:for-each>
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																										<xsl:if test="pe2:Codigo='07'">					
																											<xsl:value-of select="pe2:Valor"/>
																										</xsl:if>
																									</xsl:for-each>
																								</font>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</xsl:if>
																		</xsl:if>
																	</xsl:for-each>
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																		<xsl:if test="pe2:Codigo='07'">	
																			<xsl:if test="pe2:Valor!='-'">
																				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="80%">
																					<tbody>
																						<tr>
																							<td align="left">
																								<font face="Arial, Helvetica, sans-serif" size="2">Observación 2:
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																										<xsl:if test="pe:Codigo='07'">					
																											<xsl:value-of select="pe:Valor"/>
																										</xsl:if>
																									</xsl:for-each>
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																										<xsl:if test="pe1:Codigo='07'">						
																											<xsl:value-of select="pe1:Valor"/>
																										</xsl:if>
																									</xsl:for-each>
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																										<xsl:if test="pe2:Codigo='07'">					
																											<xsl:value-of select="pe2:Valor"/>
																										</xsl:if>
																									</xsl:for-each>
																								</font>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</xsl:if>
																		</xsl:if>
																	</xsl:for-each>
																</td>
															</tr>
															<!--<tr><td COLSPAN="2"><strong>&#160;</strong></td></tr>-->
															<tr>
																<td COLSPAN="2">
																	<xsl:call-template name="son-pesos_1"/>
																	<font face="Arial, Helvetica, sans-serif" size="0">
																		<br/>
																	</font>
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																		<xsl:if test="pe:Codigo='05'">
																			<xsl:variable name="formaPago">
																				<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="resto1">
																				<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="lugardespacho">
																				<xsl:value-of select="substring-before($resto1,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="resto2">
																				<xsl:value-of select="substring-after($resto1,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="Sap">
																				<xsl:value-of select="substring-before($resto2,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="resto3">
																				<xsl:value-of select="substring-after($resto2,'*')"/>
																			</xsl:variable>

																			<xsl:if test="$Sap!='-'">
																				<font face="Arial, Helvetica, sans-serif" size="2">
																					<strong>Ref.Fact.SAP:</strong>
										<xsl:value-of select="$Sap"/>
																				</font>
																			</xsl:if>
																		</xsl:if>
																	</xsl:for-each>	
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																		<xsl:if test="pe1:Codigo='05'">
																			<xsl:variable name="formaPago">
																				<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="resto1">
																				<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="lugardespacho">
																				<xsl:value-of select="substring-before($resto1,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="resto2">
																				<xsl:value-of select="substring-after($resto1,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="Sap">
																				<xsl:value-of select="substring-before($resto2,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="resto3">
																				<xsl:value-of select="substring-after($resto2,'*')"/>
																			</xsl:variable>

																			<xsl:if test="$Sap!='-'">

																				<font face="Arial, Helvetica, sans-serif" size="2">
																					<strong>Ref.Fact.SAP:</strong>
												<xsl:value-of select="$Sap"/>
																				</font>
																			</xsl:if>
																		</xsl:if>
																	</xsl:for-each>	
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																		<xsl:if test="pe2:Codigo='05'">
																			<xsl:variable name="formaPago">
																				<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="resto1">
																				<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="lugardespacho">
																				<xsl:value-of select="substring-before($resto1,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="resto2">
																				<xsl:value-of select="substring-after($resto1,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="Sap">
																				<xsl:value-of select="substring-before($resto2,'*')"/>
																			</xsl:variable>
																			<xsl:variable name="resto3">
																				<xsl:value-of select="substring-after($resto2,'*')"/>
																			</xsl:variable>

																			<xsl:if test="$Sap!='-'">
																				<font face="Arial, Helvetica, sans-serif" size="2">
																					<strong>Ref.Fact.SAP:</strong>
												<xsl:value-of select="$Sap"/>
																				</font>
																			</xsl:if>
																		</xsl:if>
																	</xsl:for-each>	
																</td>
															</tr>
															<!--<tr><td COLSPAN="2"><strong>&#160;</strong></td></tr>-->
															<tr>
																<td align="center">
																	<img width="100" height="100" align="center" src="data:image/*;base64,[ted_1]" />
																	<font face="Arial, Helvetica, sans-serif" size="2" >
																		<br/>
																		<strong>Representación impresa de la
																			<xsl:call-template name="aviso"/>
																		</strong>
																		<br/>
										Autorizado mediante la resolución RS N° 0180050001171
										
																	</font>
																</td>
															</tr>
															<!--<tr><td><strong>&#160;</strong></td></tr>-->
															<tr>
																<td align="center">

																	<font face="Arial, Helvetica, sans-serif" size="2">
							Su comprobante electrónico puede consultarse en: http://fe.vmetais.com.pe							
																	</font>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</xsl:template>

								<xsl:template name="Datosadicionales">
									<table cellSpacing="0" cellPadding="0" width="100%" border="1">
										<tbody>
											<tr>
												<td width="30%">
												<xsl:if test="$VersionUbl!='01'"><!--UBL 2.0-->
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
														<xsl:if test="cbc:ID='2001'">
															<xsl:if test="cbc:PayableAmount!='0'">
																<font face="Arial, Helvetica, sans-serif" size="2">
																	<strong>OPERACION SUJETA A PERCEPCIÓN DEL IGV (2%)</strong>
																</font>
															</xsl:if>
														</xsl:if>
													</xsl:for-each>
													</xsl:if>
													<xsl:if test="$VersionUbl='01'"><!--UBL 2.1-->
<xsl:if test="//cac:PaymentTerms/cbc:ID='Percepcion'">
							<font face="Arial, Helvetica, sans-serif" size="2">
																	<strong>OPERACION SUJETA A PERCEPCIÓN DEL IGV (2%)</strong>
																</font>		
						</xsl:if>
						</xsl:if>
												</td>

												<td width="12%" align="right">
													<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
													<xsl:if test="$VersionUbl!='01'"><!--UBL 2.0-->
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
															<xsl:if test="cbc:ID='2001'">
																<xsl:value-of select="format-number(cbc:PayableAmount,'###.###.##0,00','pen')"/> </xsl:if>
														</xsl:for-each>
													</xsl:if>
													<xsl:if test="$VersionUbl='01'"><!--UBL 2.0-->
														<xsl:value-of select="format-number(//cac:AllowanceCharge/cbc:Amount, '###,###,##0.00', 'pen')"/>				
													</xsl:if>
													</font>
												</td>

												<td width="11%">
												</td>
												<td width="47%">
													<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
														<strong>Por. Resol. SUNAT 013-2006. Somos agentes de Percepción</strong>
													</font>
												</td>
											</tr>

											<tr>
												<td width="30%">
													<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
														<!--DETRACCION:-->
													</font>
												</td>
												<td width="12%" align="right">
												</td>
												<td width="11%">
												</td>

												<td width="47%">
													<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
														<strong>Por. Resol. SUNAT 307-2002. Somos agentes de Retención. No somos afectos al 6%</strong>
													</font>
												</td>
											</tr>
										</tbody>
									</table>
								</xsl:template>

								<xsl:template name="fecha_ddmmaa_ref">
									<xsl:variable name="aa">
										<xsl:value-of select="substring-before(FchRef,'-')"/>
									</xsl:variable>
									<xsl:variable name="mmdd">
										<xsl:value-of select="substring-after(FchRef,'-')"/>
									</xsl:variable>
									<!--prefijo Fecha Emision Mes -->
									<xsl:variable name="mm">
										<xsl:value-of select="substring-before($mmdd,'-')"/>
									</xsl:variable>
									<xsl:variable name="dd">
										<xsl:value-of select="substring-after($mmdd,'-')"/>
									</xsl:variable>
									<!-- MES -Nombre -->

									<xsl:value-of select="concat($dd,'-', $mm, '-' , $aa)"/>
								</xsl:template>

								<xsl:template match="/">
									<html>
										<head/>
										<body/>
									</html>
								</xsl:template>
							</xsl:stylesheet>
							<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="ff12_xml\20261180937&#x2D;07&#x2D;FF12&#x2D;00000084.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"><block path="table/td/font/xsl:for&#x2D;each" x="410" y="60"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if/=[0]" x="314" y="88"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if" x="360" y="90"/><block path="table/td/font/xsl:for&#x2D;each[1]" x="300" y="30"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="204" y="58"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if" x="250" y="60"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/xsl:value&#x2D;of" x="320" y="90"/><block path="table/td/font/xsl:for&#x2D;each[2]" x="340" y="30"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="84" y="58"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if" x="130" y="60"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/xsl:value&#x2D;of" x="200" y="90"/></template><template name="Total"><block path="table/tr/td[1]/font/xsl:for&#x2D;each" x="340" y="27"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="44" y="55"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="90" y="57"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="160" y="87"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="260" y="27"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="15"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="410" y="17"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="40" y="87"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="20" y="27"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="84" y="15"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="130" y="17"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="200" y="47"/><block path="table/xsl:for&#x2D;each" x="300" y="27"/><block path="table/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="55"/><block path="table/xsl:for&#x2D;each/xsl:if" x="410" y="57"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="314" y="85"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if" x="360" y="87"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="360" y="127"/><block path="table/xsl:if/!=[0]" x="274" y="85"/><block path="table/xsl:if" x="320" y="87"/><block path="table/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="400" y="127"/><block path="table/xsl:for&#x2D;each[1]" x="280" y="87"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="15"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if" x="90" y="17"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="320" y="127"/><block path="table/xsl:for&#x2D;each[2]" x="240" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="95"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if" x="90" y="97"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="280" y="127"/><block path="table/xsl:for&#x2D;each[3]" x="200" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/!=[0]" x="124" y="135"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if" x="170" y="137"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="240" y="127"/><block path="table/tr[3]/td[1]/xsl:if/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if/font/xsl:value&#x2D;of" x="40" y="127"/><block path="table/tr[3]/td[1]/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if[1]" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if[1]/font/xsl:value&#x2D;of" x="360" y="87"/><block path="table[1]/tr/td/xsl:if/=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if" x="360" y="87"/><block path="table[1]/tr/td/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if[1]" x="360" y="87"/></template><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->