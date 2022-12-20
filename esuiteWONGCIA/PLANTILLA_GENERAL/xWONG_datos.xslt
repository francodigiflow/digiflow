<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:template name="DatosReceptor">
		<br/>
		<table width="100%" cellpadding="2" cellspacing="2" border="1" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000" rules="none">
			<tr>
				<td>
					<table width="100%" cellpadding="2" cellspacing="0" border="0" bordercolor="#ffffff" rules="none" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
						<tr>
							<td width="14%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">RAZÓN SOCIAL</xsl:when>
											<xsl:otherwise>CLIENTE</xsl:otherwise>
										</xsl:choose>
									</strong>
								</font>
							</td>
							<td colspan="3">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>:&#xA0;</Strong>
									<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
								</font>
							</td>
							<td width="11%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>FEC. EMISIÓN</Strong>
								</font>
							</td>
							<td width="19%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>:&#xA0;</Strong>
									<xsl:call-template name="fecha_"/>	&#xA0;
									<xsl:value-of select="//cbc:IssueTime"/>
									
									<!--<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
									<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
									<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>-->
								</font>
							</td>
						</tr>
						<tr>
							<td width="14%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>
										<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:choose>
	                                    <xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '-'">NO DOMICILIADO</xsl:when>
	                                    <xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '1'">DNI</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '4'">CARNET EXTR.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '6'">R.U.C.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '7'">PASAPORTE</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'A'">CED. DIP. IDENT.</xsl:when>
                               		</xsl:choose>
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.1'">
									<xsl:choose>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'"><strong>NO DOMICILIADO</strong></xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'"><strong>NO DOMICILIADO</strong></xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'"><strong>DNI</strong></xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'"><strong>CARNET EXTR.</strong></xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'"><strong>RUC</strong></xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'"><strong>PASAPORTE</strong></xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'"><strong>CED. DIP. IDENT.</strong></xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'B'"><strong>DOC. IDEN. PAIS RESID. NO D.</strong></xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'C'"><strong>T.I.N.-Doc.Trib.PP.NN.</strong></xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'D'"><strong>I.N.-Doc.Trib.PP.JJ.</strong></xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'E'"><strong>TAM</strong></xsl:when>
									</xsl:choose>
									</xsl:if>
									</strong>
								</font>
							</td>
							<td width="28%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>:&#xA0;</Strong>
									<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.1'">
									<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" />
									</xsl:if>
								</font>
							</td>
							<td colspan="2">&#xA0;
								&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</td>
							<td width="11%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>MONEDA</Strong>
								</font>
							</td>
							<td width="19%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>:&#xA0;</Strong>
									<xsl:call-template name="RetournerMoneda"/>
								</font>
							</td>
						</tr>
						<tr>
							<td width="14%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>DIRECCIÓN</Strong>
								</font>
							</td>
							<td colspan="3">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>:&#xA0;</Strong>
									<!-- <xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/> -->
									<!-- <xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/> -->
									<xsl:value-of select="Invoice/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:StreetName"/>
									<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
									<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
									<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
									<!-- Nota de Credito -->
									<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
									<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
									<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
									<!-- Nota de Debito -->
									<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
									<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
									<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
								</font>
							</td>



							<td width="11%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>GUIA N°</Strong>
								</font>
							</td>
							<td width="19%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>:&#xA0;</Strong>
									<xsl:value-of select="//cac:DespatchDocumentReference/cbc:ID"/>
								</font>
							</td>
						</tr>
						<tr>

							<td width="14%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CONDICIÓN DE PAGO</strong>
								</font>
							</td>
							<td colspan="3">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>:&#xA0;</Strong>
									<xsl:call-template name="RetourneValAd">
										<xsl:with-param name="NumAd" select="02" />
									</xsl:call-template>	
								</font>
							</td>
							<td width="11%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>N° O.C.</Strong>
								</font>
							</td>
							<td width="19%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>:&#xA0;</Strong>
									<xsl:value-of select="//cac:OrderReference/cbc:ID"/>
								</font>
							</td>
						</tr>
						<tr>

							<td width="14%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VENDEDOR</strong>
								</font>
							</td>
							<td colspan="3">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong>:&#xA0;</Strong>
									<xsl:call-template name="RetourneValAd">
										<xsl:with-param name="NumAd" select="03" />
									</xsl:call-template>	
								</font>
							</td>
							<td width="11%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<Strong></Strong>
								</font>
							</td>
							<td width="19%">
							<!--<font face="Arial, Helvetica, sans-serif" size="1">
								<Strong>:&#xA0;</Strong>
								<xsl:value-of select="/pe:Invoice/cac:PaymentMeans/cbc:PaymentDueDate"/>
								<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
								<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
							</font>  -->
							</td>
						</tr>
						<!--<tr>

							<td width="14%">
								&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
							</td>
							<td colspan="3">
								&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
							</td>
							<td width="11%">&#xA0;
										&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</td>
							<td width="19%">&#xA0;
										&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</td>
						</tr>-->
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="DatosExportacion">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo='19'">
				<xsl:if test="pe:Valor ='E'">
					<xsl:choose>
						<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">
							<table width="100%" cellpadding="2" cellspacing="0" border="0" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
								<!--Primera tabla de exportacion-->
								<tr>
									<td>
										<table width="100%" cellpadding="2" cellspacing="0" border="1" bordercolor="#000000" rules="all" style="font-family :Arial,Helvetica,sans-serif;font-size:12px">
											<tr>
												<td width="50%" colspan="3" align="center" valign="middle" bgcolor="#C4BD97">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>ORDEN DE COMPRA CLIENTE/ CUSTOMER PURCHASE ORDER</strong>
													</font>
												</td>
												<td width="50%" colspan="3" align="center" valign="middle" bgcolor="#C4BD97">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>INFORMACION DE EMBARQUE / SHIPPING INFORMATION</strong>
													</font>
												</td>
											</tr>
											<tr>
												<td width="17%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>DATE</strong>
													</font>
												</td>
												<td width="17%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>RECEIVED</strong>
													</font>
												</td>
												<td width="16%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>NUMBER</strong>
													</font>
												</td>
												<td width="17%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>VIA</strong>
													</font>
												</td>
												<td width="17%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>DATE</strong>
													</font>
												</td>
												<td width="16%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>NUMBER</strong>
													</font>
												</td>
											</tr>
											<tr>
												<td width="17%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="RetourneDato1">
															<xsl:with-param name="NumAd1" select="10"/>
														</xsl:call-template>
													</font>
												</td>
												<td width="17%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="RetourneDato2">
															<xsl:with-param name="NumAd2" select="10"/>
														</xsl:call-template>
													</font>
												</td>
												<td width="16%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="RetourneDato3">
															<xsl:with-param name="NumAd3" select="10"/>
														</xsl:call-template>
													</font>
												</td>
												<td width="17%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="RetourneDato1">
															<xsl:with-param name="NumAd1" select="11"/>
														</xsl:call-template>
													</font>
												</td>
												<td width="17%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="RetourneDato2">
															<xsl:with-param name="NumAd2" select="11"/>
														</xsl:call-template>
													</font>
												</td>
												<td width="16%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="RetourneDato3">
															<xsl:with-param name="NumAd3" select="11"/>
														</xsl:call-template>
													</font>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<!--Tabla: solo para hacer espacio-->
								<tr>
									<td>
										<table width="100%" cellpadding="2" cellspacing="0" border="0" bordercolor="#ffffff" rules="none" style="font-family :Arial,Helvetica,sans-serif;font-size:12px">
											<tr>
												<td width="100%" colspan="3" align="center" valign="middle">&#xA0;	
											&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</td>
											</tr>
										</table>
									</td>
								</tr>
								<!--tabla 2 de exportacion-->
								<tr>
									<td>
										<table width="100%" cellpadding="2" cellspacing="0" border="1" bordercolor="#000000" rules="all" style="font-family :Arial,Helvetica,sans-serif;font-size:12px">
											<tr>
												<td width="50%" align="left" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1" bgcolor="#C4BD97">
														<strong>CONDICIONES DE PAGO / PAYMENT CONDITIONS:</strong>
														<xsl:call-template name="RetourneDato1">
															<xsl:with-param name="NumAd1" select="12"/>
														</xsl:call-template>
													</font>
												</td>
												<td width="34%" colspan="2" align="center" valign="middle" bgcolor="#C4BD97">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>PESO TOTAL / TOTAL WEIGHT</strong>
													</font>
												</td>
												<td width="16%" align="center" valign="middle" bgcolor="#C4BD97">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>MARCAS / MARKS</strong>
													</font>
												</td>
											</tr>
											<tr>
												<td width="50%" align="left" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>PUERTO DE DESTINO / PORT OF DISCHARGE&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;:</strong>
														<xsl:call-template name="RetourneDato2">
															<xsl:with-param name="NumAd2" select="12"/>
														</xsl:call-template>
													</font>
												</td>
												<td width="17%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>BRUTO / GROSS</strong>
													</font>
												</td>
												<td width="17%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>NETO / NET</strong>
													</font>
												</td>
												<td width="16%" rowspan="2" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="RetourneDato3">
															<xsl:with-param name="NumAd3" select="13"/>
														</xsl:call-template>
													</font>
												</td>
											</tr>
											<tr>
												<td width="50%" align="left" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>PUERTO DE EMBARQUE / PORT OF LOADING&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;:</strong>
														<xsl:call-template name="RetourneDato3">
															<xsl:with-param name="NumAd3" select="12"/>
														</xsl:call-template>
													</font>
												</td>
												<td width="17%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="RetourneDato1">
															<xsl:with-param name="NumAd1" select="13"/>
														</xsl:call-template>
													</font>
												</td>
												<td width="17%" align="center" valign="middle">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="RetourneDato2">
															<xsl:with-param name="NumAd2" select="13"/>
														</xsl:call-template>
													</font>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="fecha_">
		<xsl:if test="/pe:Invoice">
			<xsl:variable name="aa">
				<xsl:value-of select="substring-before(/pe:Invoice/cbc:IssueDate, '-')"/>
			</xsl:variable>
			<xsl:variable name="mmdd">
				<xsl:value-of select="substring-after(/pe:Invoice/cbc:IssueDate, '-')"/>
			</xsl:variable>
			<xsl:variable name="mm">
				<xsl:value-of select="substring-before($mmdd, '-')"/>
			</xsl:variable>
			<xsl:variable name="dd">
				<xsl:value-of select="substring-after($mmdd, '-')"/>
			</xsl:variable>
			<xsl:value-of select="concat($dd, '-', $mm, '-' , $aa)"/>
		</xsl:if>

		<xsl:if test="/pe1:CreditNote">
			<xsl:variable name="aa">
				<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:IssueDate, '-')"/>
			</xsl:variable>
			<xsl:variable name="mmdd">
				<xsl:value-of select="substring-after(/pe1:CreditNote/cbc:IssueDate, '-')"/>
			</xsl:variable>
			<xsl:variable name="mm">
				<xsl:value-of select="substring-before($mmdd, '-')"/>
			</xsl:variable>
			<xsl:variable name="dd">
				<xsl:value-of select="substring-after($mmdd, '-')"/>
			</xsl:variable>
			<xsl:value-of select="concat($dd, '-', $mm, '-' , $aa)"/>
		</xsl:if>

		<xsl:if test="/pe2:DebitNote">
			<xsl:variable name="aa">
				<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:IssueDate, '-')"/>
			</xsl:variable>
			<xsl:variable name="mmdd">
				<xsl:value-of select="substring-after(/pe2:DebitNote/cbc:IssueDate, '-')"/>
			</xsl:variable>
			<xsl:variable name="mm">
				<xsl:value-of select="substring-before($mmdd, '-')"/>
			</xsl:variable>
			<xsl:variable name="dd">
				<xsl:value-of select="substring-after($mmdd, '-')"/>
			</xsl:variable>
			<xsl:value-of select="concat($dd, '-', $mm, '-' , $aa)"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="RetourneValAd">
		<xsl:param name="NumAd"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo = $NumAd">
				<xsl:if test="pe:Valor != '-'">
					<xsl:value-of select="pe:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo = $NumAd">
				<xsl:if test="pe1:Valor != '-'">
					<xsl:value-of select="pe1:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo = $NumAd">
				<xsl:if test="pe2:Valor != '-'">
					<xsl:value-of select="pe2:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="RetourneDato1">
		<xsl:param name="NumAd1"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo = $NumAd1">
				<xsl:if test="pe:Valor != '-'">
					<xsl:value-of select="substring-before(pe:Valor,'*')"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="RetourneDato2">
		<xsl:param name="NumAd2"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo = $NumAd2">
				<xsl:if test="pe:Valor != '-'">
					<xsl:value-of select="substring-before(substring-after(pe:Valor,'*'),'*')"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="RetourneDato3">
		<xsl:param name="NumAd3"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo = $NumAd3">
				<xsl:if test="pe:Valor != '-'">
					<xsl:value-of select="substring-after(substring-after(pe:Valor,'*'),'*')"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="RetournerMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'PEN'">SOLES</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'USD'">DÓLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'EUR'">EUROS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'PEN'">SOLES</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'USD'">DÓLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'EUR'">EUROS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'PEN'">SOLES</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'USD'">DÓLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'EUR'">EUROS</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->