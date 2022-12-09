<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes" />

	<xsl:template name="DatosCliente">
		<xsl:variable name="CTSDatosCliente">
			<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="16" /></xsl:call-template>
		</xsl:variable>

		<xsl:if test="$CTSDatosCliente = ''">
			<table cellSpacing="0" cellPadding="1" width="100%" border="1" rules="none">
			
				<tr>
					<td width="13%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>
								<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">NO DOMICILIADO:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '1'">DNI:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '4'">CARNET EXTR.:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '6'">R.U.C. :</xsl:if>
				
								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PASAPORTE:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">CED. DIP. IDENT.:</xsl:if>

								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">NO DOMICILIADO:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">NO DOMICILIADO:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'D'">NO DOMICILIADO:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CARNET EXTR.:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">R.U.C. :</xsl:if>
				
								<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '7'">PASAPORTE:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'A'">CED. DIP. IDENT.:</xsl:if>
							</strong>
						</font>
					</td>
					<td width="30%">
					
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<xsl:variable name="Ruc2">
							<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="30" /></xsl:call-template>
						</xsl:variable>
						<xsl:if test="$Ruc2 != ''">
							<xsl:value-of select="$Ruc2" />
						</xsl:if>
						<xsl:if test="$Ruc2 = ''">
						<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />
						</xsl:if>
						

<!--
							<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="30" /></xsl:call-template>

							<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />-->
						</font>
					</td>
					<td width="13%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>COD CLIENTE:</strong>
						</font>
					</td>
					<td width="10%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="03" /></xsl:call-template>
						</font>
					</td>
					<td width="14%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>FECHA EMISIÓN:</strong>
						</font>
					</td>
					<td width="20%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<xsl:value-of select="//cbc:IssueDate" />
						</font>
					</td>				
				</tr>
				<tr>
					<td width="13%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>SEÑORES:</strong>
						</font>
					</td>
					<td colspan="3">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" />
						</font>
					</td>
					<td width="14%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>MONEDA:</strong>
						</font>
					</td>
					<td width="20%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<xsl:call-template name="TipoDeMoneda" />
						</font>
					</td>	
				</tr>
				<tr>
					<td width="13%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>DIRECCIÓN:</strong>
						</font>
					</td>
					<td colspan="3">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">


						<xsl:variable name="Dir2">
							<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="31" /></xsl:call-template>
						</xsl:variable>
						<xsl:if test="$Dir2 != ''">
							<xsl:value-of select="$Dir2" />
						</xsl:if>
						<xsl:if test="$Dir2 = ''">
						<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description" />
						<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
						</xsl:if>

							<!--<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="31" /></xsl:call-template>
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description" />-->
						</font>
					</td>
					<td width="14%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>DOC. SAP:</strong>
						</font>
					</td>
					<td width="20%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<xsl:call-template name="DatoAdicional01">
							<xsl:with-param name="var" select="07" /></xsl:call-template>
						</font>
					</td>
				</tr>
				<tr>
					<td width="13%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>TELÉFONO:</strong>
						</font>
					</td>
					<td colspan="3">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="04" /></xsl:call-template>
						</font>
					</td>
					<td width="14%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>ORD COMPRA:</strong>
						</font>
					</td>
					<td width="20%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="08" /></xsl:call-template>
						</font>
					</td>
				</tr>
				<tr>
					<td width="13%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>PEDIDO:</strong>
						</font>
					</td>
					<td colspan="3">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="05" /></xsl:call-template>
						</font>
					</td>
					<td width="14%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>VENDEDOR:</strong>
						</font>
					</td>
					<td width="20%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="09" /></xsl:call-template>
						</font>
					</td>
				</tr>
				<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode = '01' or /pe:Invoice/cbc:InvoiceTypeCode = '03' ">
				<tr>
				  
					<td width="13%">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<strong>TIPO VENTA:</strong>
						</font>
					</td>
					<td colspan="5">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<xsl:choose>
			<xsl:when test="/pe:Invoice/cac:PaymentTerms/cbc:PaymentMeansID = 'Credito' and /pe:Invoice/cac:PaymentTerms/cbc:PaymentMeansID ='Cuota002'">Credito</xsl:when>
		
			<xsl:otherwise><xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="06" /></xsl:call-template></xsl:otherwise>
		</xsl:choose>
							
						</font>
					</td>
					
				</tr>
				</xsl:if>
			</table>
			
		</xsl:if>

		<xsl:if test="$CTSDatosCliente != ''">
			<table cellSpacing="1" cellPadding="0" width="100%" border="0">
				<tr>
					<td width="100%">
						<table cellSpacing="0" cellPadding="1" width="100%" border="1" rules="none">
							<tr>
								<td width="20%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>
											<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">NO DOMICILIADO (Homeless):</xsl:if>
											<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">NO DOMICILIADO  (Homeless)</xsl:if>
											<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '1'">DNI:</xsl:if>
												<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI:</xsl:if>
											<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '4'">CARNET EXTR. (Foreign Card):</xsl:if>
											<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '6'">R.U.C.:</xsl:if>
											<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '7'">PASAPORTE (Passport):</xsl:if>
											<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'A'">CED. DIP. IDENT.:</xsl:if>
											<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'D'">NO DOMICILIADO  (Homeless)</xsl:if>
										</strong>
									</font>
								</td>
								<td width="18%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">



										<xsl:variable name="Ruc2">
											<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="30" /></xsl:call-template>
										</xsl:variable>
										<xsl:if test="$Ruc2 != ''">
											<xsl:value-of select="$Ruc2" />
										</xsl:if>
										<xsl:if test="$Ruc2 = ''">
										<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />
										</xsl:if>
										<!--<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />-->
									</font>
								</td>
								<td width="20%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>COD CLIENTE (Customer code):</strong>
									</font>
								</td>
								<td width="8%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="03" /></xsl:call-template>
									</font>
								</td>
								<td width="17%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>FECHA EMISIÓN (Date):</strong>
									</font>
								</td>
								<td width="17%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:value-of select="//cbc:IssueDate" />
									</font>
								</td>				
							</tr>
							<tr>
								<td width="20%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>SEÑORES (Messrs):</strong>
									</font>
								</td>
								<td colspan="3">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" />
									</font>
								</td>
								<td width="17%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>MONEDA (Currency):</strong>
									</font>
								</td>
								<td width="17%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:call-template name="TipoDeMoneda" />
									</font>
								</td>	
							</tr>
							<tr>
								<td width="20%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>DIRECCIÓN (Address):</strong>
									</font>
								</td>
								<td colspan="3">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">


									<xsl:variable name="Dir2">
										<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="31" /></xsl:call-template>
									</xsl:variable>
									<xsl:if test="$Dir2 != ''">
										<xsl:value-of select="$Dir2" />
									</xsl:if>
									<xsl:if test="$Dir2 = ''">
									<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description" />
									<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
									</xsl:if>

										<!--<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description" />-->
									</font>
								</td>
								<td width="17%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>DOC. SAP:</strong>
									</font>
								</td>
								<td width="17%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="07" /></xsl:call-template>
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<table cellSpacing="0" cellPadding="1" width="100%" border="1" rules="none">
							<tr>
								<td width="21%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>COND VENTA (Term of sale):</strong>
									</font>
								</td>
								<td width="23%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:variable name="laNena16a">
											<xsl:call-template name="DatoAdicional01">
												<xsl:with-param name="var" select="16" />
											</xsl:call-template>
										</xsl:variable>

										<xsl:value-of select="substring-before($laNena16a, '|')" />
									</font>
								</td>
								<td width="29%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>COMPAÑÍA NAVIERA (Shipping company):</strong>
									</font>
								</td>
								<td width="27%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="20" /></xsl:call-template>
									</font>
								</td>
							</tr>
							<tr>
								<td width="21%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>COND PAGO (Payment term):</strong>
									</font>
								</td>
								<td width="23%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="17" /></xsl:call-template>
									</font>
								</td>
								<td width="29%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>BUQUE (Vessel):</strong>
									</font>
								</td>
								<td width="27%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="21" /></xsl:call-template>
									</font>
								</td>
							</tr>
							<tr>
								<td width="21%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>PROFORMA:</strong>
									</font>
								</td>
								<td width="23%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="18" /></xsl:call-template>
									</font>
								</td>
								<td width="29%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>PUERTO EMBARQUE (Loading port):</strong>
									</font>
								</td>
								<td width="27%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="22" /></xsl:call-template>
									</font>
								</td>
							</tr>
							<tr>
								<td width="21%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>PEDIDO (Order number):</strong>
									</font>
								</td>
								<td width="23%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="19" /></xsl:call-template>
									</font>
								</td>
								<td width="29%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>PUERTO DESTINO (Port of destination):</strong>
									</font>
								</td>
								<td width="27%">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="23" /></xsl:call-template>
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<table cellSpacing="0" cellPadding="1" width="100%" border="1" rules="all">
							<tr>
								<td width="20%" align="center">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>
											<xsl:variable name="laNena16b">
												<xsl:call-template name="DatoAdicional01">
													<xsl:with-param name="var" select="16" />
												</xsl:call-template>
											</xsl:variable>

											<xsl:value-of select="substring-before(substring-after($laNena16b, '|'), '|')" />
										</strong>
									</font>
								</td>
								<td width="20%" align="center">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>FREIGHT</strong>
									</font>
								</td>
								<td width="20%" align="center">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>INSURANCE</strong>
									</font>
								</td>
								<td width="20%" align="center">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>OTHERS</strong>
									</font>
								</td>
								<td width="20%" align="center">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<strong>
											TOTAL
											<xsl:variable name="laNena16c">
												<xsl:call-template name="DatoAdicional01">
													<xsl:with-param name="var" select="16" />
												</xsl:call-template>
											</xsl:variable>

											<xsl:value-of select="substring-before(substring-after(substring-after($laNena16c, '|'), '|'), '|')" />
										</strong>
									</font>
								</td>
							</tr>
							<tr>
								<td width="20%" align="right">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:variable name="CTS24">
											<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="24" /></xsl:call-template>
										</xsl:variable>
										<xsl:value-of select="format-number($CTS24, '###,###,##0.00', 'pen')" />
									</font>
								</td>
								<td width="20%" align="right">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:variable name="CTS25">
											<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="25" /></xsl:call-template>
										</xsl:variable>
										<xsl:value-of select="format-number($CTS25, '###,###,##0.00', 'pen')" />
									</font>
								</td>
								<td width="20%" align="right">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:variable name="CTS26">
											<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="26" /></xsl:call-template>
										</xsl:variable>
										<xsl:value-of select="format-number($CTS26, '###,###,##0.00', 'pen')" />
									</font>
								</td>
								<td width="20%" align="right">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:variable name="CTS27">
											<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="27" /></xsl:call-template>
										</xsl:variable>
										<xsl:value-of select="format-number($CTS27, '###,###,##0.00', 'pen')" />
									</font>
								</td>
								<td width="20%" align="right">
									<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
										<xsl:variable name="CTS28">
											<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="28" /></xsl:call-template>
										</xsl:variable>
										<xsl:value-of select="format-number($CTS28, '###,###,##0.00', 'pen')" />
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>

	<xsl:template name="DatosCliente2">
	
		<table cellSpacing="0" cellPadding="2" width="100%" border="1" rules="none">
		
			<tr>
				<td width="13%">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>GUÍA REMISIÓN:</strong>
					</font>
				</td>
				<td width="87%">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="10" /></xsl:call-template>
						<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="11" /></xsl:call-template>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Referencia">
		<table border="1" cellSpacing="0" cellPadding="1" width="50%" rules="all">
			<tr>
				<td width="20%" align="center">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>TIPO</strong>
					</font>
				</td>
				<td width="40%" align="center">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>SERIE - CORRELATIVO</strong>
					</font>
				</td>
				<td width="40%" align="center">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>SUSTENTO</strong>
					</font>
				</td>
			</tr>
			<tr>
				<td width="20%" align="center">
                  	<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
    						<xsl:if test="cbc:DocumentTypeCode != '10'">
								<xsl:choose>
                                	<xsl:when test="cbc:DocumentTypeCode = '01'">FACTURA</xsl:when>
                                	<xsl:when test="cbc:DocumentTypeCode = '03'">BOLETA</xsl:when>
                                	<xsl:when test="cbc:DocumentTypeCode = '07'">NOTA DE CRÉDITO</xsl:when>
                                	<xsl:when test="cbc:DocumentTypeCode = '08'">NOTA DE DÉBITO</xsl:when>
                                	<xsl:otherwise>Documento NN</xsl:otherwise>
                             	</xsl:choose>
							</xsl:if>
						</xsl:for-each>
                	</font>
        		</td>
         		<td width="40%" align="center">
            		<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
        					<xsl:if test="cbc:DocumentTypeCode != '10'">
								<xsl:value-of select="cbc:ID" />
							</xsl:if>
						</xsl:for-each>
            		</font>
         		</td>
				<td width="40%" align="center">
            		<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description" />
            		</font>
         		</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="TipoDeMoneda">
	<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
		<xsl:choose>
		
			<xsl:when test="//cbc:DocumentCurrencyCode = 'PEN'">SOL</xsl:when>
			<xsl:when test="//cbc:DocumentCurrencyCode = 'USD'">DÓLAR AMERICANO</xsl:when>
			<xsl:when test="//cbc:DocumentCurrencyCode = 'EUR'">EURO</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
			
			
		</xsl:choose>
		</font>
	</xsl:template>

</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Panasa - copia" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->