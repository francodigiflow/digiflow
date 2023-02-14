<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DatosCliente">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top">
						<xsl:call-template name="DatosReceptor"/>
					</td>
				</tr>
<!--				<tr>
					<td>&#xA0;</td>
				</tr>-->
				<tr>
					<td vAlign="top">
						<!-- MUESTRA SECCION SEGUN TIPO DE FACTURA -->
						<xsl:variable name="varVALOR">
							<xsl:call-template name="TraeValorVariable">
								<xsl:with-param name="varNumVA" select="25"/>
							</xsl:call-template>
						</xsl:variable>

						<xsl:if test="$varVALOR='01'">
							<xsl:call-template name="Datos_Nacional"/>
						</xsl:if>
						<xsl:if test="$varVALOR='02'">
							<xsl:call-template name="Datos_Exportacion"/>
						</xsl:if>
						<xsl:if test="/pe1:CreditNote">
							<xsl:call-template name="Dato_Notas"/>
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
							<xsl:call-template name="Dato_Notas"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td>&#xA0;</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="DatosReceptor">
		
	<!--
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000" rules="cols">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="1" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="11%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>
												<xsl:call-template name="TipoDeDocumento"/>
												<br/>SEÑOR(ES):<br/>
										DIRECCIÓN:<br/>
										COND. VENTA:</b>
										</font>
									</td>
									<td width="57%" cellpadding="1" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											
											<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
											<br/>

											
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<br/>

											
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<br/>

											
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="02"/>
											</xsl:call-template>
											<br/>
										</font>
									</td>

									<td width="1%" align="center"></td>

									<td width="13%" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>FECHA EMISIÓN:<br/>
										TIPO DE MONEDA:<br/>
										CÓDIGO CLIENTE:<br/>
										FECHA VENCMTO:</b>
										</font>
									</td>
									<td width="18%" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											
											<xsl:if test="/pe:Invoice/cbc:IssueDate!=''">
												<xsl:value-of select="concat(substring(/pe:Invoice/cbc:IssueDate,9,2),'.',substring(/pe:Invoice/cbc:IssueDate,6,2),'.',substring(/pe:Invoice/cbc:IssueDate,1,4))"/>
												
											</xsl:if>
											<xsl:if test="/pe1:CreditNote/cbc:IssueDate!=''">
												<xsl:value-of select="concat(substring(/pe1:CreditNote/cbc:IssueDate,9,2),'.',substring(/pe1:CreditNote/cbc:IssueDate,6,2),'.',substring(/pe1:CreditNote/cbc:IssueDate,1,4))"/>
												
											</xsl:if>
											<xsl:if test="/pe2:DebitNote/cbc:IssueDate!=''">
												<xsl:value-of select="concat(substring(/pe2:DebitNote/cbc:IssueDate,9,2),'.',substring(/pe2:DebitNote/cbc:IssueDate,6,2),'.',substring(/pe2:DebitNote/cbc:IssueDate,1,4))"/>
												
											</xsl:if>
											<br/>

											
											<xsl:call-template name="TipoDeMoneda"/>
											<br/>

											
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="01"/>
											</xsl:call-template>
											<br/>

											
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="03"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	-->

	<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%" rules="cols" >
	
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<!--<table border="0" cellSpacing="1" cellPadding="0" width="100%"> -->
						<table border="1" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>

								<tr >
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'  or //cac:AccountingCustomerParty/cbc:AdditionalAccountID='-' ">
										<td width="14%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>NO DOMICILIADO</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">
										<td width="14%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>DNI</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">
										<td width="14%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>CARNET EXTR.</strong>
											</font>
										</td>
									</xsl:if>
									
										 	<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">
										<td width="14%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong> R.U.C.</strong>
											</font>
										</td>
									</xsl:if>
									</xsl:if>
									
									 	<xsl:if test="//cbc:UBLVersionID='2.1'">
									 <xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='6'">
										<td width="14%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>R.U.C.</strong>
											</font>
										</td>
									</xsl:if>
									 <xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='7'">
										<td width="14%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>PASAPORTE</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='A'">
										<td width="14%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>CED. DIP. IDENT.</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='D'">
										<td width="14%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>NO DOMICILIADO</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='0'">
										<td width="14%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>NO DOMICILIADO</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='-'">
										<td width="14%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>NO DOMICILIADO</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='1'">
										<td width="14%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>DNI</strong>
											</font>
										</td>
									</xsl:if>
									 		</xsl:if>
									
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">
										<td width="14%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong> PASAPORTE</strong>
											</font>
										</td>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">
										<td width="14%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong> CED. DIP. IDENT.</strong>
											</font>
										</td>
									</xsl:if>
									
									 	<xsl:if test="//cbc:UBLVersionID='2.0'">
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
										</font>
									</td>
									</xsl:if>
									
										<xsl:if test="//cbc:UBLVersionID='2.1'">
									 <td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</font>
									</td>
									 		</xsl:if>


									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>FECHA</strong>
										</font>
									</td>
									<td width="14%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											<!--
											<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
											<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
											<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
											-->
											<xsl:if test="/pe:Invoice!=''">
												<xsl:value-of select="concat(substring(/pe:Invoice/cbc:IssueDate,9,2),substring(/pe:Invoice/cbc:IssueDate,5,3),'-',substring(/pe:Invoice/cbc:IssueDate,1,4))"/>
											</xsl:if>
											<xsl:if test="/pe1:CreditNote!=''">
												<xsl:value-of select="concat(substring(/pe1:CreditNote/cbc:IssueDate,9,2),substring(/pe1:CreditNote/cbc:IssueDate,5,3),'-',substring(/pe1:CreditNote/cbc:IssueDate,1,4))"/>
											</xsl:if>
											<xsl:if test="/pe2:DebitNote!=''">
												<xsl:value-of select="concat(substring(/pe2:DebitNote/cbc:IssueDate,9,2),substring(/pe2:DebitNote/cbc:IssueDate,5,3),'-',substring(/pe2:DebitNote/cbc:IssueDate,1,4))"/>
											</xsl:if>

										</font>
									</td>
									
									
								</tr>
								<tr >
								<td width="12%" border = "2">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>SEÑOR(ES)</strong>
										</font>
									</td>
									<td width="35%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>
									<!--
									<td width="1%" align="center">
									</td>
									-->
							<td width="8%" >
								<font face="Arial, Helvetica, sans-serif" size="1">
								<strong>MONEDA</strong></font></td>
								<td width="20%" >
								<font face="Arial, Helvetica, sans-serif" size="1">
								<!--<strong>:</strong> -->
								<xsl:choose>
                                    <xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">:SOLES</xsl:when>
                                    <xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">:DOLARES AMERICANOS</xsl:when>
                                    <xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">:EUROS</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='BRL'">:REALES BRASILEÑOS</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">:PESOS CHILENOS</xsl:when>
									
                                    <xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">:SOLES</xsl:when>
                                    <xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">:DOLARES AMERICANOS</xsl:when>
                                    <xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">:EUROS</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='BRL'">:REALES BRASILEÑOS</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">:PESOS CHILENOS</xsl:when>
									
                                    <xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">:SOLES</xsl:when>
                                    <xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">:DOLARES AMERICANOS</xsl:when>
                                    <xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">:EUROS</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='BRL'">:REALES BRASILEÑOS</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">:PESOS CHILENOS</xsl:when>
									
                                <xsl:otherwise>OTRA MONEDA</xsl:otherwise>
                                </xsl:choose>
								</font>
							</td>	
								</tr>
								<tr>
								<td width="12%">
									<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>DIRECCIÓN</strong>
										</font>
									</td>
									<td width="40%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											
											<xsl:if test="//cbc:UBLVersionID='2.0'">
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										</xsl:if>

										<xsl:if test="//cbc:UBLVersionID='2.1'">					
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
										</xsl:if>

										</font>
									</td>

									
										<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>CODIGO CLIENTE</strong>
										</font>
									</td>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											<!--
											<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
											<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
											<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
											-->
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="01"/>
											</xsl:call-template>

										</font>
									</td>
									

								</tr>
								<tr>
								<td width="12%">
									<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>FORMA DE PAGO</strong>
										</font>
									</td>
									<td width="50%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											<!--
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											
											-->
									<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID ='Credito'">
									        CREDITO -
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="02"/>
											</xsl:call-template>
									</xsl:if>
									<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID ='Contado'">
									        CONTADO -
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="02"/>
											</xsl:call-template>
									</xsl:if>
										</font>
									</td>
									
									<td width="14%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>FECHA VENCIMIENTO</strong>
										</font>
									</td>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
											<!--
											<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
											<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
											<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
											-->
											<!--<xsl:choose>-->
			<!--<xsl:when test="/pe:Invoice/cac:PaymentTerms/cbc:PaymentMeansID = 'Credito'">Credito</xsl:when>-->
			<!-- <xsl:when test="/pe:Invoice/cac:PaymentTerms/cbc:PaymentMeansID = 'Credito' and /pe:Invoice/cac:PaymentTerms/cbc:PaymentMeansID ='Cuota002'">Credito</xsl:when> -->
		
			<!--<xsl:otherwise>--><xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="03"/>
											</xsl:call-template>	<!--</xsl:otherwise>-->
		<!--</xsl:choose>-->
																					

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

	<xsl:template name="Datos_Nacional">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="1" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="all">
							<tbody>
								<tr>
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>PTO. EXPEDICIÓN</b>
										</font>
									</td>
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>GUÍA REMISIÓN</b>
										</font>
									</td>
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>PEDIDO SAP</b>
										</font>
									</td>
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>ORDEN COMPRA</b>
										</font>
									</td>
								</tr>
								<tr>
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- PTO. EXPEDICIÓN -->
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="18"/>
											</xsl:call-template>
										</font>
									</td>
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- GUÍA REMISION -->
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="19"/>
											</xsl:call-template>
										</font>
									</td>
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- PEDIDO SAP -->
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="20"/>
											</xsl:call-template>
										</font>
									</td>
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- ORDEN COMPRA -->
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="22"/>
											</xsl:call-template>
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

	<xsl:template name="Datos_Exportacion">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="1" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="100%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>CONSIGNATARIO:</b>&#xA0;
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="04"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
								<tr>
									<td width="100%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>NOTIFY:</b>&#xA0;
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="05"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table border="1" width="100%" cellSpacing="0" cellPadding="1" bordercolor="#000000" rules="all">
							<tbody>
								<tr>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>NANDINA</b>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>PRODUCTO</b>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>PESO NETO</b>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>ORIGEN</b>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>DESTINO</b>
										</font>
									</td>
								</tr>
								<tr>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- NANDINA -->
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="06"/>
											</xsl:call-template>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- PRODUCTO -->
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="07"/>
											</xsl:call-template>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- PESO NETO -->
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="08"/>
											</xsl:call-template>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- ORIGEN -->
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="09"/>
											</xsl:call-template>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- DESTINO -->
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="10"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table border="1" width="100%" cellSpacing="0" cellPadding="1" bordercolor="#000000" rules="all">
							<tbody>
								<tr>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>
												<!-- INCOTERM1 -->
												
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="11"/>
												</xsl:call-template>
												

												




											</b>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>FLETE</b>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>SEGURO</b>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>OTROS</b>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>TOTAL
												<!-- INCOTERM2 -->
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="16"/>
												</xsl:call-template>
											</b>
										</font>
									</td>
								</tr>
								<tr>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- VAL_INCOTERM1 -->
											<!--
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="12"/>
											</xsl:call-template> -->
												<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe:Codigo='12' and pe:Valor != '-'">
																		<xsl:value-of select="format-number(pe:Valor,'###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe:Codigo='12' and pe:Valor = '-'">
																		<xsl:value-of select="format-number(0.00,'###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe1:Codigo='12' and pe1:Valor != '-'">
																		<xsl:value-of select="format-number(pe1:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe1:Codigo='12' and pe1:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
											</xsl:for-each>
										</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe2:Codigo='12' and pe2:Valor != '-'">
																		<xsl:value-of select="format-number(pe2:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe2:Codigo='12' and pe2:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe:Codigo='12' and pe:Valor != '-'">
																		<xsl:value-of select="format-number(pe:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe:Codigo='12' and pe:Valor = '-'">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
												
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe1:Codigo='12' and pe1:Valor != '-'">
																		<xsl:value-of select="format-number(pe1:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe1:Codigo='12' and pe1:Valor = '-'">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe2:Codigo='12' and pe2:Valor != '-' ">
																		<xsl:value-of select="format-number(pe2:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe2:Codigo='12' and pe2:Valor = '-' ">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:otherwise>
										</xsl:choose>


										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- FLETE -->
											<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe:Codigo='13' and pe:Valor != '-'">
																		<xsl:value-of select="format-number(pe:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe:Codigo='13' and pe:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe1:Codigo='13' and pe1:Valor != '-'">
																		<xsl:value-of select="format-number(pe1:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe1:Codigo='13' and pe1:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
											</xsl:for-each>
										</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe2:Codigo='13' and pe2:Valor != '-'">
																		<xsl:value-of select="format-number(pe2:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe2:Codigo='13' and pe2:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe:Codigo='13' and pe:Valor != '-'">
																		<xsl:value-of select="format-number(pe:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe:Codigo='13' and pe:Valor = '-'">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
												
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe1:Codigo='13' and pe1:Valor != '-'">
																		<xsl:value-of select="format-number(pe1:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe1:Codigo='13' and pe1:Valor = '-'">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe2:Codigo='13' and pe2:Valor != '-' ">
																		<xsl:value-of select="format-number(pe2:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe2:Codigo='13' and pe2:Valor = '-' ">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:otherwise>
										</xsl:choose>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- SEGURO -->
											<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe:Codigo='14' and pe:Valor != '-'">
																		<xsl:value-of select="format-number(pe:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe:Codigo='14' and pe:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe1:Codigo='14' and pe1:Valor != '-'">
																		<xsl:value-of select="format-number(pe1:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe1:Codigo='14' and pe1:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
											</xsl:for-each>
										</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe2:Codigo='14' and pe2:Valor != '-'">
																		<xsl:value-of select="format-number(pe2:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe2:Codigo='14' and pe2:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe:Codigo='14' and pe:Valor != '-'">
																		<xsl:value-of select="format-number(pe:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe:Codigo='14' and pe:Valor = '-'">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
												
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe1:Codigo='14' and pe1:Valor != '-'">
																		<xsl:value-of select="format-number(pe1:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe1:Codigo='14' and pe1:Valor = '-'">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe2:Codigo='14' and pe2:Valor != '-' ">
																		<xsl:value-of select="format-number(pe2:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe2:Codigo='14' and pe2:Valor = '-' ">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:otherwise>
										</xsl:choose>
											
												
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- OTROS -->
											
											<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe:Codigo='15' and pe:Valor != '-'">
																		<xsl:value-of select="format-number(pe:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe:Codigo='15' and pe:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe1:Codigo='15' and pe1:Valor != '-'">
																		<xsl:value-of select="format-number(pe1:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe1:Codigo='15' and pe1:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
											</xsl:for-each>
										</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe2:Codigo='15' and pe2:Valor != '-'">
																		<xsl:value-of select="format-number(pe2:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe2:Codigo='15' and pe2:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe:Codigo='15' and pe:Valor != '-'">
																		<xsl:value-of select="format-number(pe:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe:Codigo='15' and pe:Valor = '-'">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
												
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe1:Codigo='15' and pe1:Valor != '-'">
																		<xsl:value-of select="format-number(pe1:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe1:Codigo='15' and pe1:Valor = '-'">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe2:Codigo='15' and pe2:Valor != '-' ">
																		<xsl:value-of select="format-number(pe2:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe2:Codigo='15' and pe2:Valor = '-' ">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:otherwise>
										</xsl:choose>
											
											
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!-- VAL_INCOTERM2 -->
<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe:Codigo='17' and pe:Valor != '-'">
																		<xsl:value-of select="format-number(pe:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe:Codigo='17' and pe:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe1:Codigo='17' and pe1:Valor != '-'">
																		<xsl:value-of select="format-number(pe1:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe1:Codigo='17' and pe1:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
											</xsl:for-each>
										</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe2:Codigo='17' and pe2:Valor != '-'">
																		<xsl:value-of select="format-number(pe2:Valor, '###.###.##0','clp')"/>
																	</xsl:when>
																	<xsl:when test="pe2:Codigo='17' and pe2:Valor = '-'">
																		<xsl:value-of select="format-number(0.00, '###.###.##0','clp')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe:Codigo='17' and pe:Valor != '-'">
																		<xsl:value-of select="format-number(pe:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe:Codigo='17' and pe:Valor = '-'">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
												
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe1:Codigo='17' and pe1:Valor != '-'">
																		<xsl:value-of select="format-number(pe1:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe1:Codigo='17' and pe1:Valor = '-'">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																<xsl:choose>
																	<xsl:when test="pe2:Codigo='17' and pe2:Valor != '-' ">
																		<xsl:value-of select="format-number(pe2:Valor,'###,###,###.00','pen')"/>
																	</xsl:when>
																	<xsl:when test="pe2:Codigo='17' and pe2:Valor = '-' ">
																		<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
																	</xsl:when>
																</xsl:choose>
												</xsl:for-each>
										</xsl:otherwise>
										</xsl:choose>
											

											
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

	<xsl:template name="Dato_Notas">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="1" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="100%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>MOTIVO/SUSTENTO :</b>&#160;
											<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
										</font>
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
											<b>TIPO DOCUMENTO :</b>&#160;
											<xsl:choose>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
								</tr>
								<tr>
									<td width="100%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>SERIE-CORRELATIVO :</b>&#160;
											<!--<xsl:value-of select="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/> -->

																							<xsl:value-of select="substring-before(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-')"/>
																							<xsl:if test="string-length(substring-before(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))>0">
																								-
																							</xsl:if>
																							<xsl:if test="string-length(substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))=1">																						
																								<xsl:value-of select="concat('0000000',substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))"/>
																							</xsl:if>
																							<xsl:if test="string-length(substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))=2">																						
																								<xsl:value-of select="concat('000000',substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))"/>
																							</xsl:if>
																							<xsl:if test="string-length(substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))=3">																						
																								<xsl:value-of select="concat('00000',substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))"/>
																							</xsl:if>
																							<xsl:if test="string-length(substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))=4">																						
																								<xsl:value-of select="concat('0000',substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))"/>
																							</xsl:if>
																							<xsl:if test="string-length(substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))=5">																						
																								<xsl:value-of select="concat('000',substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))"/>
																							</xsl:if>
																							<xsl:if test="string-length(substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))=6">																						
																								<xsl:value-of select="concat('00',substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))"/>
																							</xsl:if>
																							<xsl:if test="string-length(substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))=7">																						
																								<xsl:value-of select="concat('0',substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))"/>
																							</xsl:if>
																							<xsl:if test="string-length(substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'))=8">																						
																								<xsl:value-of select="substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-')"/>
																							</xsl:if>



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
				<xsl:choose>
					<xsl:when test="pe:Codigo='01'">
						<xsl:value-of select="format-number(pe:Valor,'##########','pen')"/>
					</xsl:when>
					<xsl:when test="pe:Codigo='03'">
						<!--<xsl:value-of select="concat(substring(pe:Valor,9,2),'.',substring(pe:Valor,6,2),'.',substring(pe:Valor,1,4))"/> -->
						<xsl:value-of select="pe:Valor"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pe:Valor"/> 

					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<!-- &#160; -->
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$varNumVA">
				<xsl:choose>
					<xsl:when test="pe1:Codigo='03'">
						<!--<xsl:value-of select="concat(substring(pe1:Valor,9,2),'.',substring(pe1:Valor,6,2),'.',substring(pe1:Valor,1,4))"/> -->
						<xsl:value-of select="pe1:Valor"/>
					</xsl:when>
					<xsl:otherwise>
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="pe1:Valor"/>
						</font>

					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<!-- &#160; -->
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$varNumVA">
				<xsl:choose>
					<xsl:when test="pe2:Codigo='03'">
						<xsl:value-of select="pe2:Valor"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pe2:Valor"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<!-- &#160; -->
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="TipoDeDocumento">
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'">NO DOMICILIADO:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">DNI:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">CARNET EXTR.:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">R.U.C.:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">PASAPORTE:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">CED. DIP. IDENT.:</xsl:if>
	</xsl:template>

	<xsl:template name="TipoDeMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">NUEVOS SOLES</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">NUEVOS SOLES</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">NUEVOS SOLES</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\quimpac" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->