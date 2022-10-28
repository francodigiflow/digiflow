<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
				exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt">

	<!--##TRAFIGURA##-->
	<xsl:template name="bottom_hash_T">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tbody>
				<!--SE MOSTRARA CUANDO ES UNA NOTA DE CREDITO O DEBITO-->
				<xsl:if test="/pe1:CreditNote!='' or /pe2:DebitNote!=''">
				<tr>
					<td colspan="2">
							<table>
								<tr>
									<td><font face="Arial, Helvetica, sans-serif" size="1"><strong>REFERENCIA:</strong></font></td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>:
									
									</font></td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>&#160;
									</font></td>
								</tr>
								<tr>
									<td>&#xA0;</td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">FECHA:</font></td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="19"/>
											</xsl:call-template>
									</font></td>
								</tr>
							</table>
						
					</td>
				</tr>
				</xsl:if>
				<!--BLOQUE NOTA DE CREDITO O DEBITO ARRIBA-->

				<tr>
					<td width="60%" align="left" valign="top">
						<table border="1" cellSpacing="0" borderColor="#999999999" cellPadding="1" width="95%">
							<body>
								<tr><td align="left" valign="top">
									<table border="0" cellSpacing="0" cellPadding="1" width="100%">
									<tr><td width="99%" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="1" color="#08088A">
										<strong>OBSERVACIONES:</strong><br/>
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="05"/>
											</xsl:call-template>
											
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="06"/>
											</xsl:call-template>
											
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="07"/>
											</xsl:call-template>
											
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="08"/>
											</xsl:call-template>

											
									</font>
									</td>
									<td width="1%"><br/><br/><br/><br/><br/><br/></td>
									</tr>
									</table>
									</td>
								</tr>
							
							</body>
						</table>
					</td>

					<td align="center" width="40%" valign="top">
						<font face="Arial, Helvetica, sans-serif" size="1">Representación Impresa de la
							<xsl:call-template name="aviso"/>
							<br/>Podrá ser consultada en: http://www.ecomprobantes.pe/TRAFIGURA<br/>
									Autorizado mediante resolución: 018-005-0002166/SUNAT</font><br/>
							<xsl:call-template name="imp_timbre"/>
<br />
							<font face="Arial, Helvetica, sans-serif" size="1">NRO. VOUCHER: 
									<xsl:call-template name="TraeValorVariable">
										<xsl:with-param name="varNumVA" select="20"/>
									</xsl:call-template></font>
					</td>
				</tr>
				<tr>
					<td colspan="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='18'">	
													<xsl:if test="pe:Valor!='-'">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:value-of select="substring-before(pe:Valor,'-')"/>
															<br />
															<xsl:value-of select="substring-after(pe:Valor,'-')"/>
														</font>
											 		</xsl:if>
											 	</xsl:if>
											</xsl:for-each>
											
											
											<!--NC-->
										   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='18'">	
													<xsl:if test="pe1:Valor!='-'">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:value-of select="substring-before(pe1:Valor,'-')"/>
															<br />
															<xsl:value-of select="substring-after(pe1:Valor,'-')"/>
														</font>
											 		</xsl:if>
											 	</xsl:if>
										   </xsl:for-each>
											
											
											<!--ND-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='18'">	
													<xsl:if test="pe2:Valor!='-'">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:value-of select="substring-before(pe2:Valor,'-')"/>
															<br />
															<xsl:value-of select="substring-after(pe2:Valor,'-')"/>
														</font>
											 		</xsl:if>
											 	</xsl:if>
											</xsl:for-each>
											
					</td>
				</tr>
				<tr>
					<td>
						<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:if test="cbc:ID='1001'">
									<xsl:if test="cbc:PayableAmount != '0.00'">
									<br/>
									<br/>
									     "Los importes contenidos en este documento han sido transferidos a un patrimonio
									fideicometido administrado por el Banco Internacional SAA-Interbank. En consecuencia
									los pagos deberán de realizarse Ãºnicamente a través de la siguiente cuenta
									recaudadora: Fideicomiso Trafigura - Recaudadora N° 000-4534335, Cta. Cte. dólares
									abierta en el Scotiabank. Código Interbancario N° 0917000000453433527"
								</xsl:if>
								</xsl:if>
							</font>
						</xsl:for-each>-->
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!--##TRAFIGURA##-->

	<!--##IMPALA##-->
	<xsl:template name="bottom_hash_I">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tbody>
				<tr >
					<td width="60%" align="left" valign="top">
						<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="60%">
							<body>
								<tr><td align="left" valign="top">
									<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
									<tr><td width="99%" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>OBSERVACIONES:</strong><br/>
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="02"/>
											</xsl:call-template>
									</font>
									</td>
									<td width="1%">
													<!--VACIO-->
													<table border="0" cellSpacing="0" width="100%">
														<tr><td>&#xA0;</td></tr>
														<tr><td>&#xA0;</td></tr>
														<tr><td>&#xA0;</td></tr>
														<tr><td>&#xA0;</td></tr>
													</table>
													<!--VACIO-->
									</td>
									</tr>
									</table>
									</td>
								</tr>
							
							</body>
						</table>
					</td>

					<td align="center" width="40%" valign="top">
						<font face="Arial, Helvetica, sans-serif" size="1">Representación impresa de la
							<xsl:call-template name="aviso"/>
							<br/>Podrá ser consultada en: http://www.ecomprobantes.pe/IMPALA<br/>
									Autorizado mediante resolución: 0180050001601</font><br/>
							<xsl:call-template name="imp_timbre"/>
					</td>
				</tr>
				<tr>
					<td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2"><br/>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='3'">	
													<xsl:if test="pe:Valor!='-'">
														<xsl:value-of select="pe:Valor"/>&#160;
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
											
											
											<!--NC-->
										   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='3'">	
													<xsl:if test="pe1:Valor!='-'">
														<xsl:value-of select="pe1:Valor"/>&#160;
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
											
											
											<!--ND-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='3'">	
													<xsl:if test="pe2:Valor!='-'">
														<xsl:value-of select="pe2:Valor"/>&#160;
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
											
					</font></td>
				</tr>
				<tr>
					<td>
						<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:if test="cbc:ID='1004'">
									<xsl:if test="cbc:PayableAmount != '0'">
									<br/>
									<br/>
									TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE</xsl:if>
								</xsl:if>
							</font>
						</xsl:for-each>-->
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!--##IMPALA##-->

<!--##URION##-->
	<xsl:template name="bottom_hash_U">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tbody>
				<!--SE MOSTRARA CUANDO ES UNA NOTA DE CREDITO O DEBITO-->
				<xsl:if test="/pe1:CreditNote!='' or /pe2:DebitNote!=''">
				<tr>
					<td colspan="2">
							<table>
								<tr>
									<td><font face="Arial, Helvetica, sans-serif" size="1"><strong>REFERENCIA:</strong></font></td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>:
									
									</font></td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>&#160;
									</font></td>
								</tr>
								<tr>
									<td>&#xA0;</td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">FECHA:</font></td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="19"/>
											</xsl:call-template>
									</font></td>
								</tr>
							</table>
						
					</td>
				</tr>
				</xsl:if>
				<!--BLOQUE NOTA DE CREDITO O DEBITO ARRIBA-->

				<tr>
					<td width="60%" align="left" valign="top">
						<table border="1" cellSpacing="0" borderColor="#999999999" cellPadding="1" width="95%">
							<body>
								<tr><td align="left" valign="top">
									<table border="0" cellSpacing="0" cellPadding="1" width="100%">
									<tr><td width="99%" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>OBSERVACIONES:</strong><br/>
											
										<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="05"/>
											</xsl:call-template>
										
										
										
									</font>
									</td>
									<td width="1%"><br/><br/><br/><br/><br/><br/></td>
									</tr>
									</table>
									</td>
								</tr>
							
							</body>
						</table>
					</td>

					<td align="center" width="40%" valign="top">
						<font face="Arial, Helvetica, sans-serif" size="1">Representación Impresa de la
							<xsl:call-template name="aviso"/>
							<br/>Podrá ser consultada en: http://www.ecomprobantes.pe/IMPALA<br/>
									Autorizado mediante resolución: 0320050000793/SUNAT</font><br/>
							<xsl:call-template name="imp_timbre"/>
<br />
							<font face="Arial, Helvetica, sans-serif" size="1">NRO. VOUCHER: 
									<xsl:call-template name="TraeValorVariable">
										<xsl:with-param name="varNumVA" select="20"/>
									</xsl:call-template></font>
					</td>
				</tr>
				<tr>
					<td colspan="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='18'">	
													<xsl:if test="pe:Valor!='-'">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<!--<xsl:value-of select="substring-before(pe:Valor,'-')"/>-->
															<xsl:value-of select="pe:Valor"/>
															<!--<br />
															<xsl:value-of select="substring-after(pe:Valor,'-')"/>-->
														</font>
											 		</xsl:if>
											 	</xsl:if>
											</xsl:for-each>
											
											
											<!--NC-->
										   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='18'">	
													<xsl:if test="pe1:Valor!='-'">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<!--<xsl:value-of select="substring-before(pe1:Valor,'-')"/>
															<br />
															<xsl:value-of select="substring-after(pe1:Valor,'-')"/>-->
															<xsl:value-of select="pe1:Valor"/>
														</font>
											 		</xsl:if>
											 	</xsl:if>
										   </xsl:for-each>
											
											
											<!--ND-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='18'">	
													<xsl:if test="pe2:Valor!='-'">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<!--<xsl:value-of select="substring-before(pe2:Valor,'-')"/>
															<br />
															<xsl:value-of select="substring-after(pe2:Valor,'-')"/>-->
															<xsl:value-of select="pe2:Valor"/>
														</font>
											 		</xsl:if>
											 	</xsl:if>
											</xsl:for-each>
											
					</td>
				</tr>
				<!--<tr>
					<td>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:if test="cbc:ID='1004'">
									<xsl:if test="cbc:PayableAmount != '0'">
									<br/>
									<br/>
									TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE</xsl:if>
								</xsl:if>
							</font>
						</xsl:for-each>
					</td>
				</tr>-->
			</tbody>
		</table>
	</xsl:template>
	<!--##URION##-->


<!--##TRAFIGURA TRADING##-->
	<xsl:template name="bottom_hash_TT">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tbody>
				<!--SE MOSTRARA CUANDO ES UNA NOTA DE CREDITO O DEBITO-->
				<xsl:if test="/pe1:CreditNote!='' or /pe2:DebitNote!=''">
				<tr>
					<td colspan="2">
							<table>
								<tr>
									<td><font face="Arial, Helvetica, sans-serif" size="1"><strong>REFERENCIA:</strong></font></td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>:
									
									</font></td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>&#160;
									</font></td>
								</tr>
								<tr>
									<td>&#xA0;</td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">FECHA:</font></td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="19"/>
											</xsl:call-template>
									</font></td>
								</tr>
							</table>
						
					</td>
				</tr>
				</xsl:if>
				<!--BLOQUE NOTA DE CREDITO O DEBITO ARRIBA-->

				<tr>
					<td width="60%" align="left" valign="top">
						<table border="1" cellSpacing="0" borderColor="#999999999" cellPadding="1" width="95%">
							<body>
								<tr><td align="left" valign="top">
									<table border="0" cellSpacing="0" cellPadding="1" width="100%">
									<tr><td width="99%" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>OBSERVACIONES:</strong><br/>
											
											<xsl:call-template name="TraeValorVariable">
							                    <xsl:with-param name="varNumVA" select="05"/>
						                    </xsl:call-template>
										
									</font>
									</td>
									<td width="1%"><br/><br/><br/><br/><br/><br/></td>
									</tr>
									</table>
									</td>
								</tr>
							
							</body>
						</table>
					</td>

					<td align="center" width="40%" valign="top">
						<font face="Arial, Helvetica, sans-serif" size="1">Representación Impresa de la
							<xsl:call-template name="aviso"/>
							<br/>Podrá ser consultada en: http://www.ecomprobantes.pe/IMPALA<!--<br/>
									Autorizado mediante resolución: XXXXX/SUNAT--></font><br/>
							<xsl:call-template name="imp_timbre"/>
<br />
							<font face="Arial, Helvetica, sans-serif" size="1">NRO. VOUCHER: 
									<xsl:call-template name="TraeValorVariable">
										<xsl:with-param name="varNumVA" select="20"/>
									</xsl:call-template></font>
					</td>
				</tr>
				<tr>
					<td colspan="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='18'">	
													<xsl:if test="pe:Valor!='-'">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<!--<xsl:value-of select="substring-before(pe:Valor,'-')"/>-->
															<xsl:value-of select="pe:Valor"/>
															<!--<br />
															<xsl:value-of select="substring-after(pe:Valor,'-')"/>-->
														</font>
											 		</xsl:if>
											 	</xsl:if>
											</xsl:for-each>
											
											
											<!--NC-->
										   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='18'">	
													<xsl:if test="pe1:Valor!='-'">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<!--<xsl:value-of select="substring-before(pe1:Valor,'-')"/>
															<br />
															<xsl:value-of select="substring-after(pe1:Valor,'-')"/>-->
															<xsl:value-of select="pe1:Valor"/>
														</font>
											 		</xsl:if>
											 	</xsl:if>
										   </xsl:for-each>
											
											
											<!--ND-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='18'">	
													<xsl:if test="pe2:Valor!='-'">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<!--<xsl:value-of select="substring-before(pe2:Valor,'-')"/>
															<br />
															<xsl:value-of select="substring-after(pe2:Valor,'-')"/>-->
															<xsl:value-of select="pe2:Valor"/>
														</font>
											 		</xsl:if>
											 	</xsl:if>
											</xsl:for-each>
											
					</td>
				</tr>
				<!--<tr>
					<td>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:if test="cbc:ID='1004'">
									<xsl:if test="cbc:PayableAmount != '0'">
									<br/>
									<br/>
									TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE</xsl:if>
								</xsl:if>
							</font>
						</xsl:for-each>
					</td>
				</tr>-->
			</tbody>
		</table>
	</xsl:template>
	<!--##TRAFIGURA TRADING##-->

<!--##TRAFIGURA METALES BÁSICOS##-->
	<xsl:template name="bottom_hash_TM">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tbody>
				<!--SE MOSTRARA CUANDO ES UNA NOTA DE CREDITO O DEBITO-->
				<xsl:if test="/pe1:CreditNote!='' or /pe2:DebitNote!=''">
				<tr>
					<td colspan="2">
							<table>
								<tr>
									<td><font face="Arial, Helvetica, sans-serif" size="1"><strong>REFERENCIA:</strong></font></td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>:
									
									</font></td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>&#160;
									</font></td>
								</tr>
								<tr>
									<td>&#xA0;</td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">FECHA:</font></td>
									<td><font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="19"/>
											</xsl:call-template>
									</font></td>
								</tr>
							</table>
						
					</td>
				</tr>
				</xsl:if>
				<!--BLOQUE NOTA DE CREDITO O DEBITO ARRIBA-->

				<tr>
					<td width="60%" align="left" valign="top">
						<table border="1" cellSpacing="0" borderColor="#999999999" cellPadding="1" width="95%">
							<body>
								<tr><td align="left" valign="top">
									<table border="0" cellSpacing="0" cellPadding="1" width="100%">
									<tr><td width="99%" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>OBSERVACIONES:</strong><br/>
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="05"/>
											</xsl:call-template>
											<br />
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="06"/>
											</xsl:call-template>
											<br />
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="07"/>
											</xsl:call-template>
											<br />
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="08"/>
											</xsl:call-template>

											
									</font>
									</td>
									<td width="1%"><br/><br/><br/><br/><br/><br/></td>
									</tr>
									</table>
									</td>
								</tr>
							
							</body>
						</table>
					</td>

					<td align="center" width="40%" valign="top">
						<font face="Arial, Helvetica, sans-serif" size="1">Representación Impresa de la
							<xsl:call-template name="aviso"/>
							<br/>Podrá ser consultada en: http://www.ecomprobantes.pe/IMPALA<!--<br/>
									Autorizado mediante resolución: XXXX/SUNAT--></font><br/>
							
							       <xsl:call-template name="imp_timbre"/>
							<br />
							<font face="Arial, Helvetica, sans-serif" size="1">NRO. VOUCHER: 
									<xsl:call-template name="TraeValorVariable">
										<xsl:with-param name="varNumVA" select="20"/>
									</xsl:call-template></font>
					</td>
				</tr>
				<tr>
					<td colspan="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='18'">	
													<xsl:if test="pe:Valor!='-'">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:value-of select="pe:Valor"/>
															<!--<br />
															<xsl:value-of select="substring-after(pe:Valor,'-')"/>-->
														</font>
											 		</xsl:if>
											 	</xsl:if>
											</xsl:for-each>
											
											
											<!--NC-->
										   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='18'">	
													<xsl:if test="pe1:Valor!='-'">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:value-of select="pe1:Valor"/>
															<!--<br />
															<xsl:value-of select="substring-after(pe1:Valor,'-')"/>-->
														</font>
											 		</xsl:if>
											 	</xsl:if>
										   </xsl:for-each>
											
											
											<!--ND-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='18'">	
													<xsl:if test="pe2:Valor!='-'">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:value-of select="pe2:Valor"/>
															<!--<br />
															<xsl:value-of select="substring-after(pe2:Valor,'-')"/>-->
														</font>
											 		</xsl:if>
											 	</xsl:if>
											</xsl:for-each>
											
					</td>
				</tr>
				
			</tbody>
		</table>
	</xsl:template>
	<!--##TRAFIGURA METALES BÁSICOS##-->

	<xsl:template name="imp_timbre">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tr>
				<td width="100%" align="right">
					<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td valign="top" align="center" width="100%">
								<font face="Arial" size="1">
									<!--<img width="100" height="100">
										<xsl:attribute name="src">
											<xsl:call-template name="timbre"/>
										</xsl:attribute>
									</img>-->
									<img width="100" height="100" align="center" src="data:image/*;base64,[ted_1]" />
								</font>
							</td>
						</tr>
						<tr>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>


<xsl:template name="timbre">
        <xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
        <xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:Documento/pe1:Nombre"/>
        <xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:Documento/pe2:Nombre"/>
        <xsl:value-of select="'.jpg'"/>
    </xsl:template> 


    <xsl:template name="nombreTed">
        <xsl:param name="text"/>
        <xsl:param name="largo" select="0"/>
        <xsl:variable name="largo_actual" select="string-length($text)"/>
        <xsl:choose>
            <xsl:when test="$largo_actual &gt;= $largo">
                <xsl:value-of select="$text"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="prefix" select="concat('0', $text)"/>
                <xsl:call-template name="nombreTed">
                    <xsl:with-param name="text" select="$prefix"/>
                    <xsl:with-param name="largo" select="$largo"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>



<!--	<xsl:template name="timbre">
		<xsl:call-template name="nombreTed">
			<xsl:with-param name="text" select="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID"/>
			<xsl:with-param name="largo" select="'11'"/>
		</xsl:call-template>
		<xsl:value-of select="'-'"/>
		<xsl:value-of select="//cbc:InvoiceTypeCode"/>
		<xsl:if test="/pe1:CreditNote">
			<xsl:value-of select="'07'"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
			<xsl:value-of select="'08'"/>
		</xsl:if>
		<xsl:value-of select="'-'"/>
		<xsl:value-of select="/pe:Invoice/cbc:ID"/>
		<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
		<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
		<xsl:value-of select="'.jpg'"/>
	</xsl:template>

	<xsl:template name="nombreTed">
		<xsl:param name="text"/>
		<xsl:param name="largo" select="0"/>
		<xsl:variable name="largo_actual" select="string-length($text)"/>
		<xsl:choose>
			<xsl:when test="$largo_actual &gt;= $largo">
				<xsl:value-of select="$text"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="prefix" select="concat('0', $text)"/>
				<xsl:call-template name="nombreTed">
					<xsl:with-param name="text" select="$prefix"/>
					<xsl:with-param name="largo" select="$largo"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\par" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->