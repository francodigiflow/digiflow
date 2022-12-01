<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi"> 

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="numColBl">
		<xsl:if test="/pe:Invoice!=''">
			<xsl:value-of select="23-count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote!=''">
			<xsl:value-of select="20-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote!=''">
			<xsl:value-of select="20-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="numColB2">
		<xsl:if test="/pe:Invoice!=''">
			<xsl:value-of select="4-count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote!=''">
			<xsl:value-of select="5-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote!=''">
			<xsl:value-of select="5-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>

	<xsl:variable name="DETALLE_TRANSPORTE">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo='70'">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo='70'">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo='70'">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="CAMPA�A">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo='83'">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="CONTINGENCIA">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo='01'">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="CAMPA�A_FINAL">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo='65'">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="v_RucEmisor">
		<xsl:if test="//cbc:UBLVersionID='2.1'">
			<xsl:value-of select="//cac:PartyIdentification/cbc:ID"/>
		</xsl:if>
		<xsl:if test="//cbc:UBLVersionID='2.0'">
			<xsl:value-of select="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID"/>
		</xsl:if>
	</xsl:variable>

	<xsl:include href="xSF_encab.xslt"/>
	<xsl:include href="xSF_detalle.xslt"/>
	<xsl:include href="xSF_bottom.xslt"/>
	<xsl:include href="xSF_datos.xslt"/>
	<xsl:include href="xSF_total.xslt"/>
	<xsl:template match="/">
		<html xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2" xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2">
			<head>
				<style>
		body {
		margin-top: 30px;
        margin-bottom: 0px;
        margin-right: 20px;
        margin-left: 40px; 
		}
				</style>

				<title>Comprobante Electr�nico</title>
			</head>
			<body>

				<table cellSpacing="1" width="100%" border="0">
					<tbody>
						<tr>
							<td>
								<xsl:call-template name="Encabezado"/>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:call-template name="DatosReceptor"/>
							</td>
						</tr>

						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='70'">	
								<xsl:if test="pe:Valor !='S'">	

									<xsl:if test="$DETALLE_TRANSPORTE!='-'">
										<tr>
											<td>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
													<xsl:if test="pe:Codigo='70'">
														<xsl:variable name="ruc">
															<xsl:value-of select="substring-before(pe:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto1">
															<xsl:value-of select="substring-after(pe:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="placa">
															<xsl:value-of select="substring-before($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto2">
															<xsl:value-of select="substring-after($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="marca">
															<xsl:value-of select="substring-before($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto3">
															<xsl:value-of select="substring-after($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="licencia">
															<xsl:value-of select="substring-before($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto4">
															<xsl:value-of select="substring-after($resto3,'*')"/>
														</xsl:variable>


														<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
															<body>
																<tr bgColor="#A4A4A4" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
																	<td width="35%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1">
																			<strong>RUC / Empresa Transportista</strong>
																		</font>
																	</td>
																	<td width="15%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1">
																			<strong>Placa Nro</strong>
																		</font>
																	</td>
																	<td width="35%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1">
																			<strong>Veh�culo / Marca</strong>
																		</font>
																	</td>
																	<td width="15%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1">
																			<strong>Nro. Licencia</strong>
																		</font>
																	</td>
																</tr>
																<tr>
																	<td width="35%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$ruc"/>
																		</font>
																	</td>
																	<td width="15%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$placa"/>
																		</font>
																	</td>
																	<td width="35%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$marca"/>
																		</font>
																	</td>
																	<td width="15%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$licencia"/>
																		</font>
																	</td>
																</tr >
															</body>
														</table>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
													<xsl:if test="pe1:Codigo='70'">
														<xsl:variable name="ruc">
															<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto1">
															<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="placa">
															<xsl:value-of select="substring-before($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto2">
															<xsl:value-of select="substring-after($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="marca">
															<xsl:value-of select="substring-before($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto3">
															<xsl:value-of select="substring-after($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="licencia">
															<xsl:value-of select="substring-before($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto4">
															<xsl:value-of select="substring-after($resto3,'*')"/>
														</xsl:variable>
														<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
															<body>
																<tr bgColor="#A4A4A4" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
																	<td width="35%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1">
																			<strong>RUC / Empresa Transportista</strong>
																		</font>
																	</td>
																	<td width="15%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1">
																			<strong>Placa Nro</strong>
																		</font>
																	</td>
																	<td width="35%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1">
																			<strong>Veh�culo / Marca</strong>
																		</font>
																	</td>
																	<td width="15%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1">
																			<strong>Nro. Licencia</strong>
																		</font>
																	</td>
																</tr>
																<tr>
																	<td width="35%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$ruc"/>
																		</font>
																	</td>
																	<td width="15%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$placa"/>
																		</font>
																	</td>
																	<td width="35%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$marca"/>
																		</font>
																	</td>
																	<td width="15%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$licencia"/>
																		</font>
																	</td>
																</tr >
															</body>
														</table>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
													<xsl:if test="pe2:Codigo='70'">
														<xsl:variable name="ruc">
															<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto1">
															<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="placa">
															<xsl:value-of select="substring-before($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto2">
															<xsl:value-of select="substring-after($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="marca">
															<xsl:value-of select="substring-before($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto3">
															<xsl:value-of select="substring-after($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="licencia">
															<xsl:value-of select="substring-before($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto4">
															<xsl:value-of select="substring-after($resto3,'*')"/>
														</xsl:variable>
														<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
															<body>
																<tr bgColor="#A4A4A4" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
																	<td width="35%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1">
																			<strong>RUC / Empresa Transportista</strong>
																		</font>
																	</td>
																	<td width="15%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1">
																			<strong>Placa Nro</strong>
																		</font>
																	</td>
																	<td width="35%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1">
																			<strong>Veh�culo / Marca</strong>
																		</font>
																	</td>
																	<td width="15%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1">
																			<strong>Nro. Licencia</strong>
																		</font>
																	</td>
																</tr>
																<tr>
																	<td width="35%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1">;<xsl:value-of select="$ruc"/>
																		</font>
																	</td>
																	<td width="15%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$placa"/>
																		</font>
																	</td>
																	<td width="35%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$marca"/>
																		</font>
																	</td>
																	<td width="15%" align="center">
																		<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$licencia"/>
																		</font>
																	</td>
																</tr >
															</body>
														</table>
													</xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>


						
						<tr>
							<!--seleccion según tipo de documento-->
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='1'">
									<xsl:if test="$CAMPA�A!='CA'">
										<td>
											<xsl:call-template name="DetallesEncabezado1"/>
										</td>
									</xsl:if>
									<xsl:if test="$CAMPA�A='CA'">
										<td>
											<xsl:call-template name="DetallesEncabezado3"/>
										</td>
									</xsl:if>
								</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='6'">
									<xsl:if test="$CAMPA�A!='CA'">
										<td>
											<xsl:call-template name="DetallesEncabezado1"/>
										</td>
									</xsl:if>
									<xsl:if test="$CAMPA�A='CA'">
										<td>
											<xsl:call-template name="DetallesEncabezado3"/>
										</td>
									</xsl:if>
								</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='0'">
									<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
											<td>
												<xsl:call-template name="DetallesEncabezado2"/>
											</td>
										</xsl:when>
										<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
											<td>
												<xsl:call-template name="DetallesEncabezado2"/>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="/pe1:CreditNote">
												<td>
													<xsl:call-template name="DetallesEncabezado1"/>
												</td>
											</xsl:if>
											<xsl:if test="/pe2:DebitNote">
												<td>
													<xsl:call-template name="DetallesEncabezado1"/>
												</td>
											</xsl:if>      
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='4'">
									<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
											<td>
												<xsl:call-template name="DetallesEncabezado2"/>
											</td>
										</xsl:when>
										<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
											<td>
												<xsl:call-template name="DetallesEncabezado2"/>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="/pe1:CreditNote">
												<td>
													<xsl:call-template name="DetallesEncabezado1"/>
												</td>
											</xsl:if>
											<xsl:if test="/pe2:DebitNote">
												<td>
													<xsl:call-template name="DetallesEncabezado1"/>
												</td>
											</xsl:if>      
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='7'">
									<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
											<td>
												<xsl:call-template name="DetallesEncabezado2"/>
											</td>
										</xsl:when>
										<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
											<td>
												<xsl:call-template name="DetallesEncabezado2"/>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="/pe1:CreditNote">
												<td>
													<xsl:call-template name="DetallesEncabezado1"/>
												</td>
											</xsl:if>
											<xsl:if test="/pe2:DebitNote">
												<td>
													<xsl:call-template name="DetallesEncabezado1"/>
												</td>
											</xsl:if>      
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='A'">
									<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
											<td>
												<xsl:call-template name="DetallesEncabezado2"/>
											</td>
										</xsl:when>
										<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
											<td>
												<xsl:call-template name="DetallesEncabezado2"/>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="/pe1:CreditNote">
												<td>
													<xsl:call-template name="DetallesEncabezado1"/>
												</td>
											</xsl:if>
											<xsl:if test="/pe2:DebitNote">
												<td>
													<xsl:call-template name="DetallesEncabezado1"/>
												</td>
											</xsl:if>      
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:variable name="Serie">
									<xsl:value-of select="substring-before(/pe:Invoice/cbc:ID, '-')"/>
									<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:ID, '-')"/>
									<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:ID, '-')"/>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="not(number($Serie))">
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">
											<xsl:if test="$CAMPA�A!='CA'">
												<td>
													<xsl:call-template name="DetallesEncabezado1"/>
												</td>
											</xsl:if>
											<xsl:if test="$CAMPA�A='CA'">
												<td>
													<xsl:call-template name="DetallesEncabezado3"/>
												</td>
											</xsl:if>

										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">
											<xsl:if test="$CAMPA�A!='CA'">
												<td>
													<xsl:call-template name="DetallesEncabezado1"/>
												</td>
											</xsl:if>
											<xsl:if test="$CAMPA�A='CA'">
												<td>
													<xsl:call-template name="DetallesEncabezado3"/>
												</td>
											</xsl:if>

										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'C' or //cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'D'">
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
													<td>
														<xsl:call-template name="DetallesEncabezado2"/>
													</td>
												</xsl:when>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
													<td>
														<xsl:call-template name="DetallesEncabezado2"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<xsl:if test="/pe1:CreditNote">
														<td>
															<xsl:call-template name="DetallesEncabezado1"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote">
														<td>
															<xsl:call-template name="DetallesEncabezado1"/>
														</td>
													</xsl:if>      
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
													<td>
														<xsl:call-template name="DetallesEncabezado2"/>
													</td>
												</xsl:when>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
													<td>
														<xsl:call-template name="DetallesEncabezado2"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<xsl:if test="/pe1:CreditNote">
														<td>
															<xsl:call-template name="DetallesEncabezado1"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote">
														<td>
															<xsl:call-template name="DetallesEncabezado1"/>
														</td>
													</xsl:if>      
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
													<td>
														<xsl:call-template name="DetallesEncabezado2"/>
													</td>
												</xsl:when>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
													<td>
														<xsl:call-template name="DetallesEncabezado2"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<xsl:if test="/pe1:CreditNote">
														<td>
															<xsl:call-template name="DetallesEncabezado1"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote">
														<td>
															<xsl:call-template name="DetallesEncabezado1"/>
														</td>
													</xsl:if>      
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
													<td>
														<xsl:call-template name="DetallesEncabezado2"/>
													</td>
												</xsl:when>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
													<td>
														<xsl:call-template name="DetallesEncabezado2"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<xsl:if test="/pe1:CreditNote">
														<td>
															<xsl:call-template name="DetallesEncabezado1"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote">
														<td>
															<xsl:call-template name="DetallesEncabezado1"/>
														</td>
													</xsl:if>      
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
													<td>
														<xsl:call-template name="DetallesEncabezado2"/>
													</td>
												</xsl:when>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
													<td>
														<xsl:call-template name="DetallesEncabezado2"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<xsl:if test="/pe1:CreditNote">
														<td>
															<xsl:call-template name="DetallesEncabezado1"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote">
														<td>
															<xsl:call-template name="DetallesEncabezado1"/>
														</td>
													</xsl:if>      
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<!-- CONTINGENCIA -->   
										<td>
											<xsl:call-template name="DetallesEncabezado2"/>
										</td>	  
									</xsl:otherwise>
								</xsl:choose>



							</xsl:if>

						</tr>
						<tr>
							<td >
								<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
									<tbody>
										<tr>
											<td colspan="2">
												<!--solo factura exportacion-->	
												<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
													<xsl:if test="//cbc:UBLVersionID='2.0'">
														<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='0'">
															<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="2" heigth="100%" borderColor="#000000">
																<body>
																	<tr>
																		<td>
																			<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%" borderColor="#000000">
																				<body>
																					<!--primer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--segundo bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--tercer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																				</body>
																			</table>
																		</td>
																	</tr>
																</body>
															</table>
														</xsl:if>
														<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='2'">
															<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="2" heigth="100%" borderColor="#000000">
																<body>
																	<tr>
																		<td>
																			<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%" borderColor="#000000">
																				<body>
																					<!--primer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--segundo bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--tercer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																				</body>
																			</table>
																		</td>
																	</tr>
																</body>
															</table>
														</xsl:if>
														<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='4'">
															<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="2" heigth="100%" borderColor="#000000">
																<body>
																	<tr>
																		<td>
																			<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%" borderColor="#000000">
																				<body>
																					<!--primer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--segundo bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--tercer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																				</body>
																			</table>
																		</td>
																	</tr>
																</body>
															</table>
														</xsl:if>
														<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='A'">
															<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="2" heigth="100%" borderColor="#000000">
																<body>
																	<tr>
																		<td>
																			<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%" borderColor="#000000">
																				<body>
																					<!--primer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--segundo bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--tercer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																				</body>
																			</table>
																		</td>
																	</tr>
																</body>
															</table>
														</xsl:if>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">
															<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="2" heigth="100%" borderColor="#000000">
																<body>
																	<tr>
																		<td>
																			<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%" borderColor="#000000">
																				<body>
																					<!--primer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--segundo bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--tercer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																				</body>
																			</table>
																		</td>
																	</tr>
																</body>
															</table>
														</xsl:if>
														<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '2'">
															<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="2" heigth="100%" borderColor="#000000">
																<body>
																	<tr>
																		<td>
																			<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%" borderColor="#000000">
																				<body>
																					<!--primer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--segundo bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--tercer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																				</body>
																			</table>
																		</td>
																	</tr>
																</body>
															</table>
														</xsl:if>
														<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">
															<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="2" heigth="100%" borderColor="#000000">
																<body>
																	<tr>
																		<td>
																			<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%" borderColor="#000000">
																				<body>
																					<!--primer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--segundo bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--tercer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																				</body>
																			</table>
																		</td>
																	</tr>
																</body>
															</table>
														</xsl:if>
														<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">
															<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="2" heigth="100%" borderColor="#000000">
																<body>
																	<tr>
																		<td>
																			<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%" borderColor="#000000">
																				<body>
																					<!--primer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--segundo bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--tercer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																				</body>
																			</table>
																		</td>
																	</tr>
																</body>
															</table>
														</xsl:if>
														<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'D' or //cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'C'">
															<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="2" heigth="100%" borderColor="#000000">
																<body>
																	<tr>
																		<td>
																			<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%" borderColor="#000000">
																				<body>
																					<!--primer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='39'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--segundo bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='40'">
																							<xsl:variable name="l1c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l1c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l2c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<!--tabla sub_total-->
																							<xsl:if test="$l1c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l1c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l2c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l2c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<!--tercer bloque-->
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																						<xsl:if test="pe:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																						<xsl:if test="pe1:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
																						<xsl:if test="pe2:Codigo='60'">
																							<xsl:variable name="l3c1">
																								<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto1">
																								<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l3c2">
																								<xsl:value-of select="substring-before($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto2">
																								<xsl:value-of select="substring-after($resto1,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c1">
																								<xsl:value-of select="substring-before($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto3">
																								<xsl:value-of select="substring-after($resto2,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l4c2">
																								<xsl:value-of select="substring-before($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto4">
																								<xsl:value-of select="substring-after($resto3,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c1">
																								<xsl:value-of select="substring-before($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto5">
																								<xsl:value-of select="substring-after($resto4,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l5c2">
																								<xsl:value-of select="substring-before($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto6">
																								<xsl:value-of select="substring-after($resto5,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c1">
																								<xsl:value-of select="substring-before($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="resto7">
																								<xsl:value-of select="substring-after($resto6,'*')"/>
																							</xsl:variable>
																							<xsl:variable name="l6c2">
																								<xsl:value-of select="substring-before($resto7,'*')"/>
																							</xsl:variable>

																							<!--tabla sub_total-->
																							<xsl:if test="$l3c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l3c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l4c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l4c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l5c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l5c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																							<xsl:if test="$l6c1!='-'">
																								<tr>
																									<td width="88%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c1"/>
																										</font>
																									</td>
																									<td width="12%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">&#160;<xsl:value-of select="$l6c2"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:if>
																					</xsl:for-each>
																				</body>
																			</table>
																		</td>
																	</tr>
																</body>
															</table>
														</xsl:if>
													</xsl:if>
												</xsl:if>

												<!--Indicador que permite validar si el documento es de campaña o no- variable 83-->
												<!--factura y boleta-->
												<xsl:if test="$CAMPA�A_FINAL!='CU'">
													<!--ESTE VALOR INDICA QUE ES LA ULTIMA FACTURA Y NO DEBE DE MOSTRAR EL RECUADRO DE CAMPA�A INFERIOR-->
													<xsl:if test="$CAMPA�A='CA'">
														<xsl:if test="//cbc:UBLVersionID='2.0'">
															<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='1'">
																<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%" borderColor="#000000">
																	<body>
																		<tr>
																			<td>
																				<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="1" heigth="100%" borderColor="#000000">
																					<body>
																						<tr bgColor="#A4A4A4" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
																							<td align="center" colspan="10">
																								<font face="Arial, Helvetica, sans-serif" size="1">
																									<strong>DETALLE DE SOLICITUD DE COMPRA</strong>
																								</font>
																							</td>
																						</tr>
																					</body>
																				</table>
																			</td>
																		</tr>
																		<tr>
																			<td/>
																		</tr>
																		<tr>
																			<td>
																				<table  rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
																					<body>
																						<!--variable 71-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='71'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 72-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='72'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 73-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='73'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 74-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='74'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 75-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='75'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 76-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='76'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 77-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='77'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 78-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='78'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 79-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='79'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 80-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='80'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 81-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='81'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 82-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='82'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 86-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='86'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 87-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='87'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 88-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='88'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 89-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='89'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 90-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='90'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 91-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='91'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 92-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='92'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 93-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='93'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 94-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='94'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 95-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='95'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 96-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='96'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 97-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='97'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 98-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='98'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																					</body>
																				</table>
																			</td>
																		</tr>
																		<tr>
																			<td/>
																		</tr>
																		<tr>
																			<td>
																				<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
																					<body>
																						<tr>
																							<td align="right">
																								<font face="Arial, Helvetica, sans-serif" size="1" >
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																										<xsl:if test="pe:Codigo='99'">
																											<font face="Arial, Helvetica, sans-serif" size="1" >
																												<strong>TOTAL VAL. VTA SC</strong>
																											</font>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
																											<xsl:value-of select="pe:Valor"/>
																										</xsl:if>
																									</xsl:for-each>
																								</font>
																							</td>
																						</tr>
																					</body>
																				</table>
																			</td>
																		</tr>
																	</body>
																</table>
															</xsl:if>
															<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='6'">
																<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%" borderColor="#000000">
																	<body>
																		<tr>
																			<td>
																				<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="1" heigth="100%" borderColor="#000000">
																					<body>
																						<tr bgColor="#A4A4A4" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
																							<td align="center" colspan="10">
																								<font face="Arial, Helvetica, sans-serif" size="1">
																									<strong>DETALLE DE SOLICITUD DE COMPRA</strong>
																								</font>
																							</td>
																						</tr>
																					</body>
																				</table>
																			</td>
																		</tr>
																		<tr>
																			<td/>
																		</tr>
																		<tr>
																			<td>
																				<table  rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
																					<body>
																						<!--variable 71-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='71'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 72-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='72'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 73-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='73'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 74-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='74'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 75-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='75'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 76-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='76'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 77-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='77'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 78-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='78'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 79-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='79'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 80-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='80'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 81-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='81'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 82-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='82'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 86-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='86'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 87-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='87'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 88-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='88'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 89-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='89'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 90-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='90'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 91-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='91'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 92-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='92'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 93-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='93'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 94-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='94'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 95-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='95'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 96-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='96'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 97-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='97'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 98-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='98'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																					</body>
																				</table>
																			</td>
																		</tr>
																		<tr>
																			<td/>
																		</tr>
																		<tr>
																			<td>
																				<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
																					<body>
																						<tr>
																							<td align="right">
																								<font face="Arial, Helvetica, sans-serif" size="1" >
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																										<xsl:if test="pe:Codigo='99'">
																											<font face="Arial, Helvetica, sans-serif" size="1" >
																												<strong>TOTAL VAL. VTA SC</strong>
																											</font>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
																											<xsl:value-of select="pe:Valor"/>
																										</xsl:if>
																									</xsl:for-each>
																								</font>
																							</td>
																						</tr>
																					</body>
																				</table>
																			</td>
																		</tr>
																	</body>
																</table>
															</xsl:if>
														</xsl:if>
														<xsl:if test="//cbc:UBLVersionID='2.1'">
															<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">
																<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%" borderColor="#000000">
																	<body>
																		<tr>
																			<td>
																				<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="1" heigth="100%" borderColor="#000000">
																					<body>
																						<tr bgColor="#A4A4A4" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
																							<td align="center" colspan="10">
																								<font face="Arial, Helvetica, sans-serif" size="1">
																									<strong>DETALLE DE SOLICITUD DE COMPRA</strong>
																								</font>
																							</td>
																						</tr>
																					</body>
																				</table>
																			</td>
																		</tr>
																		<tr>
																			<td/>
																		</tr>
																		<tr>
																			<td>
																				<table  rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
																					<body>
																						<!--variable 71-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='71'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 72-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='72'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 73-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='73'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 74-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='74'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 75-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='75'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 76-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='76'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 77-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='77'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 78-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='78'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 79-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='79'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 80-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='80'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 81-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='81'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 82-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='82'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 86-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='86'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 87-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='87'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 88-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='88'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 89-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='89'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 90-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='90'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 91-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='91'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 92-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='92'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 93-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='93'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 94-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='94'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 95-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='95'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 96-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='96'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 97-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='97'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 98-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='98'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																					</body>
																				</table>
																			</td>
																		</tr>
																		<tr>
																			<td/>
																		</tr>
																		<tr>
																			<td>
																				<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
																					<body>
																						<tr>
																							<td align="right">
																								<font face="Arial, Helvetica, sans-serif" size="1" >
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																										<xsl:if test="pe:Codigo='99'">
																											<font face="Arial, Helvetica, sans-serif" size="1" >
																												<strong>TOTAL VAL. VTA SC</strong>
																											</font>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
																											<xsl:value-of select="pe:Valor"/>
																										</xsl:if>
																									</xsl:for-each>
																								</font>
																							</td>
																						</tr>
																					</body>
																				</table>
																			</td>
																		</tr>
																	</body>
																</table>
															</xsl:if>
															<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">
																<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%" borderColor="#000000">
																	<body>
																		<tr>
																			<td>
																				<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="1" heigth="100%" borderColor="#000000">
																					<body>
																						<tr bgColor="#A4A4A4" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
																							<td align="center" colspan="10">
																								<font face="Arial, Helvetica, sans-serif" size="1">
																									<strong>DETALLE DE SOLICITUD DE COMPRA</strong>
																								</font>
																							</td>
																						</tr>
																					</body>
																				</table>
																			</td>
																		</tr>
																		<tr>
																			<td/>
																		</tr>
																		<tr>
																			<td>
																				<table  rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
																					<body>
																						<!--variable 71-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='71'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 72-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='72'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 73-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='73'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 74-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='74'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 75-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='75'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 76-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='76'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 77-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='77'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 78-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='78'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 79-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='79'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 80-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='80'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 81-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='81'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 82-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='82'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 86-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='86'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 87-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='87'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 88-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='88'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 89-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='89'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 90-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='90'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 91-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='91'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 92-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='92'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 93-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='93'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 94-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='94'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 95-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='95'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 96-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='96'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 97-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='97'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																						<!--variable 98-->
																						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
																							<xsl:if test="pe:Codigo='98'">
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
																								<tr>
																									<td width="6%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea1"/>
																										</font>
																									</td>
																									<td width="34%" align="left">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea2"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea3"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea4"/>
																										</font>
																									</td>
																									<td width="5%" align="center">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea5"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea6"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea7"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea8"/>
																										</font>
																									</td>
																									<td width="5%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea9"/>
																										</font>
																									</td>
																									<td width="9%" align="right">
																										<font face="Arial, Helvetica, sans-serif" size="1">
																											<xsl:value-of select="$linea10"/>
																										</font>
																									</td>
																								</tr>
																							</xsl:if>
																						</xsl:for-each>
																					</body>
																				</table>
																			</td>
																		</tr>

																		<tr>
																			<td>
																				<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
																					<body>
																						<tr>
																							<td align="right">
																								<font face="Arial, Helvetica, sans-serif" size="1" >
																									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																										<xsl:if test="pe:Codigo='99'">
																											<font face="Arial, Helvetica, sans-serif" size="1" >
																												<strong>TOTAL VAL. VTA SC</strong>
																											</font>
																											<xsl:value-of select="pe:Valor"/>
																										</xsl:if>
																									</xsl:for-each>
																								</font>
																							</td>
																						</tr>
																					</body>
																				</table>
																			</td>
																		</tr>
																	</body>
																</table>
															</xsl:if>
														</xsl:if>
													</xsl:if>
												</xsl:if>
											</td>
										</tr>
										<tr>
											<td width="50%" align="left" colspan="2">	
												<xsl:call-template name="son-pesos"/>
											</td>

										</tr>
										<tr>
											<td vAlign="top" width="70%" align="left">
												<xsl:call-template name="Referencia"/>
											</td>
											<td vAlign="top" width="30%" align="right">
												<xsl:call-template name="Total"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>


						<tr width="100%">
							<td>
								<xsl:call-template name="bottom_hash"/>
							</td>
						</tr>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
							<xsl:if test="pe:Codigo='38'">
								<xsl:variable name="sem1">
									<xsl:value-of select="pe:Valor"/>
								</xsl:variable>
								<xsl:if test="$sem1='P'">
									<tr>
										<td>
											<xsl:call-template name="produss"/>
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
							<xsl:if test="pe1:Codigo='38'">
								<xsl:variable name="sem1">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:variable>
								<xsl:if test="$sem1='P'">
									<tr>
										<td>
											<xsl:call-template name="produss"/>
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
							<xsl:if test="pe2:Codigo='38'">
								<xsl:variable name="sem1">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:variable>
								<xsl:if test="$sem1='P'">
									<tr>
										<td>
											<xsl:call-template name="produss"/>
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
					</tbody>
				</table>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
</metaInformation>
-->