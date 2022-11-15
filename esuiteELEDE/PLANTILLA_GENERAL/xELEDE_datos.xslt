<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DatosReceptor">
		<table border="0" width="100%" cellspacing="0" cellPadding="4" borderColor="#000000" class="redondeo">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="0" width="100%" cellSpacing="0" cellPadding="2">
							<tbody>
								<tr>
									<td valign="top" align="left" width="48%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>CLIENTE: </strong>	
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>
									<td valign="top" align="left" width="18%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>
											<xsl:call-template name="TipoDeDocumento"/>
										</strong>
											<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
											<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>&#xA0;
										</font>
									</td>
									<td valign="top" align="left" width="20%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>TELÉFONO: </strong>
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
								<!--<xsl:if test="/pe:Invoice">-->
								<tr>
									<td valign="top" align="left" width="48%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>FECHA EMISIÓN: </strong>
											<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
											<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
											<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
										</font>
									</td>
									<td valign="top" align="left" width="20%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong><!--FECHA VENCIMIENTO:--> </strong>
											<!--<xsl:value-of select="/pe:Invoice/cbc:DueDate"/>-->
										</font>
									</td>						
									<td valign="top" align="left" width="20%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
										<!--<strong>TIPO DE PAGO: </strong>
											<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
												Crédito
											</xsl:if>
											<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Contado'">
												Contado		
											</xsl:if>	-->
										</font>
									</td>
								</tr>
								<!--</xsl:if>-->
								<tr>			
									<td valign="top" align="left" width="48%"  >
										<font face="Arial, Helvetica, sans-serif" size="2" colspan="3">
										<strong>DIRECCIÓN: </strong>
											<!-- DIRECCION -->
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										</font>
									</td>
								</tr>
								<tr>
									<td valign="top" align="left" width="48%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
											
										</font>
									</td>
									<td valign="top" align="left" width="18%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>MONEDA: </strong>		
										<xsl:call-template name="TipoDeMoneda"/>	
										</font>
									</td>
									<td valign="top" align="left" width="20%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>FORMA DE PAGO: </strong>
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
										<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
												Crédito
											</xsl:if>
											<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Contado'">
												Contado		
											</xsl:if>	
										</xsl:if>
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
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
										</xsl:if>
										</font>
									</td>
								</tr>
								<xsl:if test="/pe:Invoice">
								<tr>
									<td valign="top" align="left" width="48%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>ENTREGA N°: </strong>
											<!-- DIRECCION -->
											<!--<xsl:value-of select="/pe:Invoice/cac:DespatchDocumentReference/cbc:ID"/>
											<xsl:value-of select="/pe1:CreditNote/cac:DespatchDocumentReference/cbc:ID"/>
											<xsl:value-of select="/pe2:DebitNote/cac:DespatchDocumentReference/cbc:ID"/>-->
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='20'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='20'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='20'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
										</font>
									</td>
									<td valign="top" align="left" width="18%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>CAMPAÑA: </strong>		
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='08'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='08'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='08'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
										</font>
									</td>
									<td valign="top" align="left" width="20%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>PEDIDO: </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='09'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='09'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='09'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
										</font>
									</td>
								</tr>
								</xsl:if>
								<xsl:if test="/pe1:CreditNote">
								<tr>
									<td valign="top" align="left" width="48%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>CAMPAÑA: </strong>		
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='08'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='08'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='08'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
										</font>
									</td>
									<td valign="top" align="left" width="18%"  >
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>PEDIDO: </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='09'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='09'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='09'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
										</font>
									</td>
									<td valign="top" align="left" width="20%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong> </strong>
										
										</font>
									</td>
								</tr>
								</xsl:if>
								<xsl:if test="/pe1:DebitNote">
								<tr>
									<td valign="top" align="left" width="48%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>CAMPAÑA: </strong>		
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='08'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='08'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='08'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
										</font>
									</td>
									<td valign="top" align="left" width="18%"  >
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>PEDIDO: </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='09'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='09'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='09'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
										</font>
									</td>
									<td valign="top" align="left" width="20%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong> </strong>
										
										</font>
									</td>
								</tr>
								</xsl:if>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>


	<xsl:template name="Dato_Notas">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="0" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>DATOS DE REFERENCIA</b>
										</font>
									</td>
									<td>
										<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="all">
											<tr>
												<td width="20%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<b>TIPO DE DOCUMENTO</b>
													</font>
												</td>
												<td width="20%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<b>CORRELATIVO</b>
													</font>
												</td>
												<td width="20%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<b>FECHA</b>
													</font>
												</td>
											</tr>
											<tr>
												<td width="20%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:choose>
															<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
															<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
															<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
															<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
															<xsl:otherwise>Documento NN</xsl:otherwise>
														</xsl:choose>
													</font>
												</td>
												<td width="20%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:value-of select="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>
													</font>
												</td>
												<td width="20%" align="center">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="TraeValorVariable">
															<xsl:with-param name="varNumVA" select="9"/>
														</xsl:call-template>
													</font>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table border="1" width="100%" cellSpacing="0" cellPadding="1" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="100%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>MOTIVO:</b>&#xA0;
											<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
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



	<xsl:template name="TraeValorVariable">
		<xsl:param name="varNumVA"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA">
				<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
					<xsl:value-of select="format-number(pe:Valor, '###,###,##0.00', 'pen')"/>
					<!--<xsl:value-of select="pe:Valor"/>-->
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$varNumVA">
				<xsl:if test="pe1:Valor !='-'">
					<xsl:value-of select="pe1:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$varNumVA">
				<xsl:if test="pe2:Valor !='-'">
					<xsl:value-of select="pe2:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="TipoDeDocumento">
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'">NO DOMICILIADO: </xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">NO DOMICILIADO: </xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">NO DOMICILIADO: </xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">DNI: </xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI: </xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">CARNET EXTR.: </xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CARNET EXTR.: </xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">R.U.C.:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">R.U.C.: </xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">PASAPORTE: </xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PASAPORTE: </xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">CED. DIP. IDENT.: </xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">CED. DIP. IDENT.: </xsl:if>
	</xsl:template>

	<xsl:template name="TipoDeMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\par" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->