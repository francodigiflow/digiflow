<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	
	<!-- INDICADOR TIPO DE FACTURA -->
	<xsl:variable name="varTipoFactura1">
		<xsl:call-template name="TraeValorVariablezz">
			<xsl:with-param name="varNumVA" select="12"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- Doc cliente No domiciliado -->
	<xsl:variable name="dato15">
		<xsl:call-template name="TraeValorVariablezz">
			<xsl:with-param name="varNumVA" select="15"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VALOR SEGUN NRO DE VARAIBLE -->
	<xsl:template name="TraeValorVariablezz">
		<xsl:param name="varNumVA"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA">
				<xsl:if test="pe:Valor!='-'">
					<xsl:value-of select="pe:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$varNumVA">
				<xsl:if test="pe1:Valor!='-'">
					<xsl:value-of select="pe1:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$varNumVA">
				<xsl:if test="pe2:Valor!='-'">
					<xsl:value-of select="pe2:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="65%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="top" width="35%">
						<xsl:call-template name="EncabezadoRecuadro"/>
						<xsl:if test="$varCicloVta!=''">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="1">
								<strong>CICLO DE VENTA  :</strong>&#xA0;
								<xsl:value-of select="$varCicloVta"/>
							</font>
						</xsl:if>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru">
		<xsl:variable name="VersionUbl">
			<xsl:value-of select="0"/>
			<xsl:choose>
				<!-- UBL2.0  -->
				<xsl:when test="//cbc:UBLVersionID != '2.1'">
					<xsl:value-of select="0"/>
				</xsl:when>
				<!-- UBL2.1  -->
				<xsl:when test="//cbc:UBLVersionID = '2.1'">
					<xsl:value-of select="1"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<p>
			<table cellSpacing="2" cellPadding="0" width="100%" border="0">
				<tbody>
					<tr>
						<td>
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td>

										<!-- <img src="logo_medifarma.jpg" width="200" height="100"/> -->
										<img src="data:image/*;base64,[logo_1]" width="220" height="100" />
									</td>
								</tr>
							</table>
						</td>
						<td align="center">
							<table cellSpacing="0" cellPadding="0" width="85%" border="0">
								<tr>
									<td align="center">
										<font size="3" face="Arial, Helvetica, sans-serif">
											<strong>MEDIFARMA S.A.</strong>
										</font>
										<br/>
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<br/>Jr. Ecuador N° 787 - Lima - Lima - Lima
											<br/>Central Telefénica:332-6200
											<br/>Fax: 431-9764</font>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td>
										<tr>
											<td width="23%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>RAZÓN SOCIAL</strong>
												</font>
											</td>
											<td width="77%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>:</strong>&#xA0;
													<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
													<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
													<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												</font>
											</td>
										</tr>
										<xsl:if test="$varNomComercial!=''">
											<tr>
												<td width="23%">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>NOMBRE COMERCIAL</strong>
													</font>
												</td>
												<td width="77%">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>:</strong>&#xA0;
														<xsl:value-of select="$varNomComercial"/>
													</font>
												</td>
											</tr>
										</xsl:if>
										<tr>
											<td width="23%" vAlign="top">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>DIRECCIÓN</strong>
												</font>
											</td>
											<td width="77%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>:</strong>&#xA0;

													<xsl:if test="$VersionUbl='01'">
														<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
														<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
														<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
														<xsl:value-of select="Invoice/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:StreetName"/>

														<!-- -->
														<xsl:if test="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName != ''">

															<xsl:value-of select="concat(' - ', /pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName)"/>
														</xsl:if>
														

														<!--<xsl:if test="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName != ''">
															<xsl:value-of select="concat(' - ', /pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName)"/>
														</xsl:if>-->

														<xsl:if test="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity != ''">

															<xsl:value-of select="concat(' - ', /pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity)"/>
														</xsl:if>

														<xsl:if test="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District != ''">
															<xsl:value-of select="concat(' - ', /pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District)"/>
														</xsl:if>

														<!-- -->

														<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
														<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
														<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>

														<!--  -->
														<xsl:if test="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName != ''">

															<xsl:value-of select="concat(' - ', /pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName)"/>
														</xsl:if>

														<!--<xsl:if test="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName != ''">
															<xsl:value-of select="concat(' - ', /pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName)"/>
														</xsl:if>-->

														<xsl:if test="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity != ''">
															<xsl:value-of select="concat(' - ', /pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity)"/>
														</xsl:if>

														<xsl:if test="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District != ''">
															<xsl:value-of select="concat(' - ', /pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District)"/>
														</xsl:if>
														<!-- -->

														<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
														<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
														<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>

														<!-- -->
														<xsl:if test="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName != ''">
															<xsl:value-of select="concat(' - ', /pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName)"/>
														</xsl:if>														

														<!--<xsl:if test="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName != ''">
															<xsl:value-of select="concat(' - ', /pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName)"/>
														</xsl:if>-->

														<xsl:if test="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity != ''">
															<xsl:value-of select="concat(' - ', /pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity)"/>
														</xsl:if>

														<xsl:if test="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District != ''">
															<xsl:value-of select="concat(' - ', /pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District)"/>
														</xsl:if>
													</xsl:if>

													<xsl:if test="$VersionUbl!='01'">
														<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
														<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
														<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
													</xsl:if>
												</font>
											</td>
										</tr>
									</td>
								</tr>
							</table>
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td>

										<tr>
											<td width="23%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>
														<xsl:if test="$VersionUbl='01'">
															<xsl:choose>
																<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">DOC.TRIB.NO.DOM.SIN.RUC</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">NO DOMICILIADO</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '-'">NO DOMICILIADO</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">NO DOMICILIADO</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '1'">DNI</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '4'">CARNET EXTR.</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CARNET EXTR.</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '6'">R.U.C.</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">R.U.C.</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '7'">PASAPORTE</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PASAPORTE</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'A'">CED. DIP. IDENT.</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">CED. DIP. IDENT.</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'B'">DOC.IDENT.PAIS.RESIDENCIA-NO.D</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'B'">DOC.IDENT.PAIS.RESIDENCIA-NO.D</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'C'">DOC TRIB PP.NN</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'C'">DOC TRIB PP.NN</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'D'">NO DOMICILIADO</xsl:when>
																<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'D'">NO DOMICILIADO</xsl:when>
															</xsl:choose>
														</xsl:if>

														<xsl:if test="$VersionUbl!='01'">
															<xsl:call-template name="TipoDeDocumento"/>
														</xsl:if>
													</strong>
												</font>
											</td>											
											<td width="40%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>:</strong>&#xA0;

													<!-- <xsl:if test="$VersionUbl='01'">
														<xsl:if test="$varTipoFactura1!='1'">
															<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
															<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
															<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
															<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
														</xsl:if>
														<xsl:if test="$varTipoFactura1='1'">
															<xsl:value-of select="$dato15"/>
														</xsl:if>
													</xsl:if>

													<xsl:if test="$VersionUbl!='01'">
														<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '-' or //cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">
															<xsl:value-of select="$varDocTribNoDomSinRuc"/>
														</xsl:if>
														<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID != '-'">
															<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
														</xsl:if>
													</xsl:if> -->
													<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />
											
												</font>
											</td>
											<td width="5%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>
											<td width="14%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>FECHA</strong>
												</font>
											</td>
											<td width="18%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>:</strong>&#xA0;</font>
												<font face="Arial, Helvetica, sans-serif" size="1">

													<!-- xsl:if test="/pe:Invoice!=''">
														<xsl:value-of select="concat(substring(/pe:Invoice/cbc:IssueDate,9,2),'/',substring(/pe:Invoice/cbc:IssueDate,6,2),'/',substring(/pe:Invoice/cbc:IssueDate,1,4))"/>
													</xsl:if>
													<xsl:if test="/pe1:CreditNote!=''">
														<xsl:value-of select="concat(substring(/pe1:CreditNote/cbc:IssueDate,9,2),'/',substring(/pe1:CreditNote/cbc:IssueDate,6,2),'/',substring(/pe1:CreditNote/cbc:IssueDate,1,4))"/>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote!=''">
														<xsl:value-of select="concat(substring(/pe2:DebitNote/cbc:IssueDate,9,2),'/',substring(/pe2:DebitNote/cbc:IssueDate,6,2),'/',substring(/pe2:DebitNote/cbc:IssueDate,1,4))"/>
													</xsl:if -->

													<xsl:value-of select="concat(substring($varFechEmis,9,2),'/',substring($varFechEmis,6,2),'/',substring($varFechEmis,1,4))"/>
												</font>
											</td>
										</tr>
										<tr>
											<td width="23%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>TIPO DE MONEDA</strong>
												</font>
											</td>
											<td width="40%">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
													<strong>:</strong>&#xA0;
													<!-- xsl:choose>
														<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">NUEVOS SOLES</xsl:when>
														<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
														<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
														<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='BRL'">REALES BRASILEÃ‘OS</xsl:when>
														<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">NUEVOS SOLES</xsl:when>
														<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
														<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
														<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='BRL'">REALES BRASILEÃ‘OS</xsl:when>
														<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">NUEVOS SOLES</xsl:when>
														<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
														<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
														<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='BRL'">REALES BRASILEÃ‘OS</xsl:when>
														<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
													</xsl:choose -->
													<xsl:call-template name="TipoDeMoneda"/>
												</font>
											</td>
											<td width="5%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>
											<td width="14%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>FECHA VCTO</strong>
												</font>
											</td>
											<td width="18%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>:</strong>&#xA0;
													<xsl:call-template name="TraeValorVariable">
														<xsl:with-param name="varNumVA" select="5"/>
													</xsl:call-template>
												</font>
											</td>
										</tr>
										<tr>
											<td width="23%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>CONDICIÓN DE PAGO</strong>
												</font>
											</td>
											<td width="40%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>:</strong>&#xA0;
													<xsl:choose>
														<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01' and //cbc:Note/@languageLocaleID='1002'">
															CONTADO
														</xsl:when>
														<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03' and //cbc:Note/@languageLocaleID='1002'">
															CONTADO
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="TraeValorVariable">
																<xsl:with-param name="varNumVA" select="2"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>

													
												</font>
											</td>
											<td width="5%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>
											<td width="14%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>TIPO TRANSC</strong>
												</font>
											</td>
											<td width="18%">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
													<strong>:</strong>&#xA0;													
													<xsl:call-template name="tformapago"/>
												</font>
											</td>
										</tr>
										<tr>
											<td width="23%" vAlign="top">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>REFERENCIA</strong>
												</font>
											</td>
											<td width="40%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>:</strong>&#xA0;
													<xsl:call-template name="TraeValorVariable">
														<xsl:with-param name="varNumVA" select="3"/>
													</xsl:call-template>
												</font>
											</td>
											<td width="5%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>
											<td width="14%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>O/C</strong>
												</font>
											</td>
											<td width="18%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>:</strong>&#xA0;
													<xsl:call-template name="TraeValorVariable">
														<xsl:with-param name="varNumVA" select="1"/>
													</xsl:call-template>
												</font>
											</td>
										</tr>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</p>
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
		<xsl:variable name="VersionUbl">
			<xsl:value-of select="0"/>
			<xsl:choose>
				<!-- UBL2.0  -->
				<xsl:when test="//cbc:UBLVersionID != '2.1'">
					<xsl:value-of select="0"/>
				</xsl:when>
				<!-- UBL2.1  -->
				<xsl:when test="//cbc:UBLVersionID = '2.1'">
					<xsl:value-of select="1"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>


		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td>
						<table borderColor="#000000" cellSpacing="0" cellPadding="15" width="100%" border="2">
							<tbody>
								<tr>
									<td vAlign="top" width="100%" align="center">
										<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
											<strong>R.U.C.:

												<xsl:if test="$VersionUbl='01'">
													<xsl:value-of select="(//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID)"/>
												</xsl:if>
												<xsl:if test="$VersionUbl!='01'">
													<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>
												</xsl:if>
												<br/>
												<br/>
												<xsl:call-template name="tipodocu"/>
												<br/>
												<xsl:call-template name="NFolio"/>
											</strong>
											<br/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center">
						<font size="2" face="Arial, Helvetica, sans-serif">
							<!-- <strong>SUNAT- CENTRO LIMA</strong> -->
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="tipodocu">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">FACTURA ELECTRONICA</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRONICA</font>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote">
					<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE CREDITO ELECTRONICA</font>
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE DEBITO ELECTRONICA</font>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="NFolio">
		<br/>
		<xsl:value-of select="/pe:Invoice/cbc:ID"/>
		<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
		<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
		<br/>
	</xsl:template>
	<xsl:template name="aviso">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Factura Electrónica</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Boleta de Venta Electrónica</font>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de Crédito Electrónica</font>
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de Débito Electrónica</font>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->