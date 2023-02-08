<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
                xmlns:ccts="urn:un:unece:uncefact:documentation:2"
                exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html"
	            indent="yes"
	            encoding="ISO-8859-1"
	            omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen"
	                    decimal-separator="."
	                    grouping-separator=","
	                    NaN=""/>
	<xsl:variable name="numColBl">
		<xsl:if test="/pe:Invoice!=''">
			<xsl:value-of select="30-count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote!=''">
			<xsl:value-of select="40-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote!=''">
			<xsl:value-of select="40-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="v_ItemPorPagina">
		<xsl:value-of select="30"/>
	</xsl:variable>
	<xsl:variable name="varPagRestoSeccionesFinales">
		<xsl:value-of select="30 div $v_ItemPorPagina"/>
	</xsl:variable>
	<xsl:variable name="v_ItemPorPagina1">
		<xsl:value-of select="30"/>
	</xsl:variable>
	<xsl:variable name="v_CantidadRestoPagina">
		<xsl:value-of select="$v_ItemTotal - $v_ItemPorPagina1"/>
	</xsl:variable>
	<xsl:variable name="v_CantidadTotalPagina">
		<xsl:if test="$v_ItemTotal &lt; 30">
			<xsl:value-of select="ceiling($v_ItemTotal div $v_ItemPorPagina)"/>
		</xsl:if>
		<xsl:if test="$v_ItemTotal &gt; 38">
			<xsl:value-of select="ceiling($v_ItemTotal div $v_ItemPorPagina) + 1"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="v_ItemTotal">
		<xsl:value-of select="count(/pe:Invoice/cac:InvoiceLine)"/>
		<!--</xsl:if>-->
		<xsl:value-of select="count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		<!--</xsl:if>-->
		<xsl:value-of select="count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		<!--</xsl:if>-->
	</xsl:variable>
	<xsl:variable name="numitems">
		<xsl:value-of select="count(/pe:Invoice/cac:InvoiceLine)"/>
		<xsl:value-of select="count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		<!--</xsl:if>-->
		<xsl:value-of select="count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		<!--</xsl:if>-->
	</xsl:variable>
	<xsl:variable name="totalitems">
		<xsl:value-of select="count(/pe:Invoice/cac:InvoiceLine)"/>
		<!--</xsl:if>-->
	</xsl:variable>
	<xsl:variable name="totalpag1">
		<xsl:if test="$totalitems &lt; '30'">
			<xsl:value-of select="1"/>
		</xsl:if>
		<xsl:if test="$totalitems &gt; '30' and $totalitems &lt;'61'">
			<xsl:value-of select="2"/>
		</xsl:if>
		<xsl:if test="$totalitems &gt; '60' and $totalitems &lt;'91'">
			<xsl:value-of select="3"/>
		</xsl:if>
		<xsl:if test="$totalitems &gt; '90' and $totalitems &lt;'121'">
			<xsl:value-of select="4"/>
		</xsl:if>
		<xsl:if test="$totalitems &gt; '120' and $totalitems &lt;'151'">
			<xsl:value-of select="5"/>
		</xsl:if>
		<xsl:if test="$totalitems &gt; '150' and $totalitems &lt;'181'">
			<xsl:value-of select="6"/>
		</xsl:if>
		<xsl:if test="$totalitems &gt; '180' and $totalitems &lt;'211'">
			<xsl:value-of select="7"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="totalpag">
		<xsl:if test="($numitems) &lt;'30'">
			<xsl:value-of select="1"/>
		</xsl:if>
		<xsl:if test="($numitems) &gt;'30'  and ($numitems) &lt;'61' ">
			<xsl:value-of select="2"/>
		</xsl:if>
		<xsl:if test="($numitems) &gt;'60'  and ($numitems) &lt;'91' ">
			<xsl:value-of select="3"/>
		</xsl:if>
		<xsl:if test="($numitems) &gt;'90'  and ($numitems) &lt;'121' ">
			<xsl:value-of select="4"/>
		</xsl:if>
		<xsl:if test="($numitems) &gt;'120'  and ($numitems) &lt;'151' ">
			<xsl:value-of select="5"/>
		</xsl:if>
		<xsl:if test="($numitems) &gt;'200'  and ($numitems) &lt;'240' ">
			<xsl:value-of select="6"/>
		</xsl:if>
		<xsl:if test="($numitems) &gt;'240' ">
			<xsl:value-of select="7"/>
		</xsl:if>
	</xsl:variable>
	<!-- ExportaciÃ³n Gratuita -->
	<xsl:variable name="varTotalGratExporta">
		<xsl:if test="//cbc:UBLVersionID='2.1'">
			<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
				<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
					<xsl:value-of select="cbc:TaxableAmount"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:variable>
	<!-- ExportaciÃ³n Gratuita -->
	<xsl:variable name="varTotalExonerado">
		<xsl:if test="//cbc:UBLVersionID='2.1'">
			<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
				<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
					<xsl:value-of select="cbc:TaxableAmount"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:variable>
	<xsl:include href="xmedifarma_encab.xslt"/>
	<xsl:include href="xmedifarma_datos.xslt"/>
	<xsl:include href="xmedifarma_detalle.xslt"/>
	<xsl:include href="xmedifarma_total.xslt"/>
	<xsl:include href="xmedifarma_bottom.xslt"/>
	<xsl:template match="/">
		<html xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2"
		      xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
		      xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2"
		      xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
		      xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
		      xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
		      xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
		      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		      xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
		      xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
		      xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
		      xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		      xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
		      xmlns:ccts="urn:un:unece:uncefact:documentation:2">
			<style>body {
			  margin-top:40px;
			  margin-bottom: 30px;
			  margin-right: 20px;
			  margin-left: 20px;
			  }</style>
			<head>
				<title>Documento Electrónico</title>
				<style>div.saltar-pagina {page-break-after: always;  }</style>
			</head>
			<body>
				<xsl:variable name="FF">
					<xsl:value-of select="count(/pe:Invoice/cac:InvoiceLine/cbc:ID)"/>
				</xsl:variable>
				<xsl:variable name="FC">
					<xsl:value-of select="count(/pe1:CreditNote/cac:CreditNoteLine/cbc:ID)"/>
				</xsl:variable>
				<xsl:variable name="FD">
					<xsl:value-of select="count(/pe2:DebitNote/cac:DebitNoteLine/cbc:ID)"/>
				</xsl:variable>
				<h1>
					<table cellSpacing="1"
					       width="100%"
					       border="0">
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
							<tr>
								<td>
									<xsl:call-template name="DatosReceptor_1"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:if test="$varTipoFactura='0'">
										<xsl:call-template name="DetallesEncabezado1"/>
									</xsl:if>
									<xsl:if test="$varTipoFactura='1'">
										<xsl:choose>
											<xsl:when test="$varTotalGratExporta &gt; 0 and $varTotalExonerado ='0.00'">
												<xsl:call-template name="DetallesEncabezado4_export_exone1"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="DetallesEncabezado2_other"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="$varTipoFactura='2'">
										<xsl:call-template name="DetallesEncabezado3_fact"/>
									</xsl:if>
								</td>
							</tr>
							<xsl:if test="$FF &lt;'30' or $FC &lt;'30' or $FD &lt;'30'">
								<tr>
									<td valign="top"
									    width="100%"
									    align="left">
										<xsl:call-template name="Total"/>
									</td>
								</tr>
								<tr>
									<td align="left">
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="left"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr heigth="100%">
													<td valign="top"
													    width="100%"
													    align="left"
													    colspan="2">
														<xsl:call-template name="son-pesos"/>
													</td>
												</tr>
												<xsl:if test="//cbc:UBLVersionID='2.1'">
													<xsl:if test="//cbc:Note/@languageLocaleID='2006'">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="ope-detraccion"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='0'">
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='1'">
													<xsl:choose>
														<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
														<xsl:when test="$varTotalGratExporta &gt; 0 and $varTotalExonerado ='0.00'">
												
												</xsl:when>
														<xsl:otherwise>
															<xsl:if test="$varImporteTotalGrat!=''">
																<tr heigth="100%">
																	<td valign="top"
																	    width="100%"
																	    align="left"
																	    colspan="2">
																		<xsl:call-template name="Transferencia_Gratuita"/>
																	</td>
																</tr>
															</xsl:if>
															<xsl:if test="//cbc:UBLVersionID='2.1'">
																<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
																	<tr heigth="100%">
																		<td valign="top"
																		    width="100%"
																		    align="left"
																		    colspan="2">
																			<xsl:call-template name="Transferencia_Gratuita"/>
																		</td>
																	</tr>
																</xsl:if>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="$varTipoFactura='2'">
													<!-- SECCION TRANSFERENCIA GRATUITA -->
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA UN SOLO TRAMO-->
												<xsl:if test="$varValFactGuia=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA DOS TRAMOS -->
												<xsl:if test="$varValFactGuia=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA TRES TRAMOS-->
												<xsl:if test="$varValFactGuia=3">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia2"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE EXPORTACION -->
												<xsl:if test="$varTipoFactura=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Exportacion"/>
														</td>
													</tr>
												</xsl:if>
												<!-- xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'" -->
												<tr heigth="100%">
													<xsl:if test="/pe1:CreditNote!=''">
														<td valign="top"
														    width="25%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote!=''">
														<td valign="top"
														    width="25%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe:Invoice!=''">
														<xsl:choose>
														
															<xsl:when test="//cbc:Note/@languageLocaleID='1002'">
												
													</xsl:when>
															<xsl:otherwise>
																<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
																	<td valign="top"
																	    width="50%"
																	    align="left">
																		<xsl:call-template name="DFORMAPAGO"/>
																	</td>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:if>
													<xsl:if test="$varFranjaRefGrat=''">
														<td valign="top"
														    width="50%"
														    align="right">
															<xsl:call-template name="Importe_Percepcion"/>
														</td>
													</xsl:if>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="center"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr>
													<td valign="top"
													    width="100%"
													    align="left">
														<xsl:call-template name="Datos_Sunat"/>
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
								<tr>
									<td align="right"
									    valign="top">
										<font face="Arial, Helvetica, sans-serif"
										      size="1">
											<xsl:value-of select="concat('PÁGINA 1' ,' de ', ceiling($totalpag1) )"/>
										</font>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
				</h1>
				<!--Condición para que aparezca la 2da pagina-->
				<xsl:if test="$FF &gt;'30' or $FC &gt;'30' or $FD &gt;'30'">
					<!--Función para realizar el salto de lÃ­nea-->
					<div class="saltar-pagina">&#xA0;</div>
					<!--Construcción de la 2da Pagina-->
					<h2>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
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
								<tr>
									<td>
										<xsl:call-template name="DatosReceptor_1"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
												<xsl:call-template name="DetallesEncabezado2"/>
											</xsl:when>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
												<xsl:call-template name="DetallesEncabezado2"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="/pe1:CreditNote">
													<xsl:call-template name="DetallesEncabezado2"/>
												</xsl:if>
												<xsl:if test="/pe2:DebitNote">
													<xsl:call-template name="DetallesEncabezado2"/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td valign="top"
									    width="100%"
									    align="left">
										<xsl:call-template name="Total"/>
									</td>
								</tr>
								<tr>
									<td align="left">
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="left"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr heigth="100%">
													<td valign="top"
													    width="100%"
													    align="left"
													    colspan="2">
														<xsl:call-template name="son-pesos"/>
													</td>
												</tr>
												<xsl:if test="//cbc:UBLVersionID='2.1'">
													<xsl:if test="//cbc:Note/@languageLocaleID='2006'">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="ope-detraccion"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='0'">
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='1'">
													<xsl:choose>
														<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
														<xsl:when test="$varTotalGratExporta &gt; 0 and $varTotalExonerado ='0.00'">
												
												</xsl:when>
														<xsl:otherwise>
															<xsl:if test="$varImporteTotalGrat!=''">
																<tr heigth="100%">
																	<td valign="top"
																	    width="100%"
																	    align="left"
																	    colspan="2">
																		<xsl:call-template name="Transferencia_Gratuita"/>
																	</td>
																</tr>
															</xsl:if>
															<xsl:if test="//cbc:UBLVersionID='2.1'">
																<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
																	<tr heigth="100%">
																		<td valign="top"
																		    width="100%"
																		    align="left"
																		    colspan="2">
																			<xsl:call-template name="Transferencia_Gratuita"/>
																		</td>
																	</tr>
																</xsl:if>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="$varTipoFactura='2'">
													<!-- SECCION TRANSFERENCIA GRATUITA -->
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA UN SOLO TRAMO-->
												<xsl:if test="$varValFactGuia=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA DOS TRAMOS -->
												<xsl:if test="$varValFactGuia=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA TRES TRAMOS-->
												<xsl:if test="$varValFactGuia=3">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia2"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE EXPORTACION -->
												<xsl:if test="$varTipoFactura=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Exportacion"/>
														</td>
													</tr>
												</xsl:if>
												<!-- xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'" -->
												<tr heigth="100%">
													<xsl:if test="/pe1:CreditNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe:Invoice!=''">
														<xsl:choose>
															<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
															<xsl:when test="//cbc:Note/@languageLocaleID='1002'">
												
													</xsl:when>
															<xsl:otherwise>
																<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
																	<td valign="top"
																	    width="50%"
																	    align="left">
																		<xsl:call-template name="DFORMAPAGO"/>
																	</td>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:if>
													<xsl:if test="$varFranjaRefGrat=''">
														<td valign="top"
														    width="50%"
														    align="right">
															<xsl:call-template name="Importe_Percepcion"/>
														</td>
													</xsl:if>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="center"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr>
													<td valign="top"
													    width="100%"
													    align="left">
														<xsl:call-template name="Datos_Sunat"/>
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
								<tr>
									<td align="right"
									    valign="top">
										<font face="Arial, Helvetica, sans-serif"
										      size="1">
											<!-- PÁGINA 2 -->
											<xsl:value-of select="concat('PÁGINA 2',' de ', ceiling($totalpag1) )"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</h2>
				</xsl:if>
				<!--Condición para que aparezca la 3ra pagina-->
				<!--<xsl:if test="$LI3 &gt;'25' and $LI3 &lt;'51'">-->
				<xsl:if test="$FF &gt;'60' or $FC &gt;'60' or $FD &gt;'60'">
					<!--Función para realizar el salto de lÃ­nea-->
					<div class="saltar-pagina">&#xA0;</div>
					<!--Construcción de la 3ra Pagina-->
					<h3>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
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
								<tr>
									<td>
										<xsl:call-template name="DatosReceptor_1"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
												<xsl:call-template name="DetallesEncabezado3"/>
											</xsl:when>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
												<xsl:call-template name="DetallesEncabezado3"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="/pe1:CreditNote">
													<xsl:call-template name="DetallesEncabezado3"/>
												</xsl:if>
												<xsl:if test="/pe2:DebitNote">
													<xsl:call-template name="DetallesEncabezado3"/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td valign="top"
									    width="100%"
									    align="left">
										<xsl:call-template name="Total"/>
									</td>
								</tr>
								<tr>
									<td align="left">
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="left"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr heigth="100%">
													<td valign="top"
													    width="100%"
													    align="left"
													    colspan="2">
														<xsl:call-template name="son-pesos"/>
													</td>
												</tr>
												<xsl:if test="//cbc:UBLVersionID='2.1'">
													<xsl:if test="//cbc:Note/@languageLocaleID='2006'">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="ope-detraccion"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='0'">
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='1'">
													<xsl:choose>
														<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
														<xsl:when test="$varTotalGratExporta &gt; 0 and $varTotalExonerado ='0.00'">
												
												</xsl:when>
														<xsl:otherwise>
															<xsl:if test="$varImporteTotalGrat!=''">
																<tr heigth="100%">
																	<td valign="top"
																	    width="100%"
																	    align="left"
																	    colspan="2">
																		<xsl:call-template name="Transferencia_Gratuita"/>
																	</td>
																</tr>
															</xsl:if>
															<xsl:if test="//cbc:UBLVersionID='2.1'">
																<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
																	<tr heigth="100%">
																		<td valign="top"
																		    width="100%"
																		    align="left"
																		    colspan="2">
																			<xsl:call-template name="Transferencia_Gratuita"/>
																		</td>
																	</tr>
																</xsl:if>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="$varTipoFactura='2'">
													<!-- SECCION TRANSFERENCIA GRATUITA -->
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA UN SOLO TRAMO-->
												<xsl:if test="$varValFactGuia=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA DOS TRAMOS -->
												<xsl:if test="$varValFactGuia=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA TRES TRAMOS-->
												<xsl:if test="$varValFactGuia=3">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia2"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE EXPORTACION -->
												<xsl:if test="$varTipoFactura=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Exportacion"/>
														</td>
													</tr>
												</xsl:if>
												<!-- xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'" -->
												<tr heigth="100%">
													<xsl:if test="/pe1:CreditNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe:Invoice!=''">
														<xsl:choose>
															<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
															<xsl:when test="//cbc:Note/@languageLocaleID='1002'">
												
													</xsl:when>
															<xsl:otherwise>
																<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
																	<td valign="top"
																	    width="50%"
																	    align="left">
																		<xsl:call-template name="DFORMAPAGO"/>
																	</td>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:if>
													<xsl:if test="$varFranjaRefGrat=''">
														<td valign="top"
														    width="90%"
														    align="left">
															<xsl:call-template name="Importe_Percepcion"/>
														</td>
													</xsl:if>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="center"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr>
													<td valign="top"
													    width="100%"
													    align="left">
														<xsl:call-template name="Datos_Sunat"/>
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
								<tr>
									<td align="right"
									    valign="top">
										<font face="Arial, Helvetica, sans-serif"
										      size="1">
											<!-- PÁGINA 3 -->
											<xsl:value-of select="concat('PÁGINA 3',' de ', ceiling($totalpag1) )"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</h3>
				</xsl:if>
				<!--Condición para que aparezca la 4ta pagina-->
				<xsl:if test="$FF &gt;'90' or $FC &gt;'90' or $FD &gt;'90'">
					<!--Función para realizar el salto de lÃ­nea-->
					<div class="saltar-pagina">&#xA0;</div>
					<!--Construcción de la 4ta Pagina-->
					<h4>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
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
								<tr>
									<td>
										<xsl:call-template name="DatosReceptor_1"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
												<xsl:call-template name="DetallesEncabezado4"/>
											</xsl:when>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
												<xsl:call-template name="DetallesEncabezado4"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="/pe1:CreditNote">
													<xsl:call-template name="DetallesEncabezado4"/>
												</xsl:if>
												<xsl:if test="/pe2:DebitNote">
													<xsl:call-template name="DetallesEncabezado4"/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td valign="top"
									    width="100%"
									    align="left">
										<xsl:call-template name="Total"/>
									</td>
								</tr>
								<tr>
									<td align="left">
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="left"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr heigth="100%">
													<td valign="top"
													    width="100%"
													    align="left"
													    colspan="2">
														<xsl:call-template name="son-pesos"/>
													</td>
												</tr>
												<xsl:if test="//cbc:UBLVersionID='2.1'">
													<xsl:if test="//cbc:Note/@languageLocaleID='2006'">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="ope-detraccion"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='0'">
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='1'">
													<xsl:choose>
														<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
														<xsl:when test="$varTotalGratExporta &gt; 0 and $varTotalExonerado ='0.00'">
												
												</xsl:when>
														<xsl:otherwise>
															<xsl:if test="$varImporteTotalGrat!=''">
																<tr heigth="100%">
																	<td valign="top"
																	    width="100%"
																	    align="left"
																	    colspan="2">
																		<xsl:call-template name="Transferencia_Gratuita"/>
																	</td>
																</tr>
															</xsl:if>
															<xsl:if test="//cbc:UBLVersionID='2.1'">
																<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
																	<tr heigth="100%">
																		<td valign="top"
																		    width="100%"
																		    align="left"
																		    colspan="2">
																			<xsl:call-template name="Transferencia_Gratuita"/>
																		</td>
																	</tr>
																</xsl:if>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="$varTipoFactura='2'">
													<!-- SECCION TRANSFERENCIA GRATUITA -->
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA UN SOLO TRAMO-->
												<xsl:if test="$varValFactGuia=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA DOS TRAMOS -->
												<xsl:if test="$varValFactGuia=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA TRES TRAMOS-->
												<xsl:if test="$varValFactGuia=3">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia2"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE EXPORTACION -->
												<xsl:if test="$varTipoFactura=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Exportacion"/>
														</td>
													</tr>
												</xsl:if>
												<!-- xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'" -->
												<tr heigth="100%">
													<xsl:if test="/pe1:CreditNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe:Invoice!=''">
														<xsl:choose>
															<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
															<xsl:when test="//cbc:Note/@languageLocaleID='1002'">
												
													</xsl:when>
															<xsl:otherwise>
																<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
																	<td valign="top"
																	    width="50%"
																	    align="left">
																		<xsl:call-template name="DFORMAPAGO"/>
																	</td>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:if>
													<xsl:if test="$varFranjaRefGrat=''">
														<td valign="top"
														    width="90%"
														    align="left">
															<xsl:call-template name="Importe_Percepcion"/>
														</td>
													</xsl:if>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="center"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr>
													<td valign="top"
													    width="100%"
													    align="left">
														<xsl:call-template name="Datos_Sunat"/>
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
								<tr>
									<td align="right"
									    valign="top">
										<font face="Arial, Helvetica, sans-serif"
										      size="1">
											<!-- PÁGINA 4 -->
											<xsl:value-of select="concat('PÁGINA 4',' de ', ceiling($totalpag1) )"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</h4>
				</xsl:if>
				<!--Condición para que aparezca la 5ta pagina-->
				<xsl:if test="$FF &gt;'120' or $FC &gt;'120' or $FD &gt;'120'">
					<!--Función para realizar el salto de lÃ­nea-->
					<div class="saltar-pagina">&#xA0;</div>
					<!--Construcción de la 5ta Pagina-->
					<h4>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
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
								<tr>
									<td>
										<xsl:call-template name="DatosReceptor_1"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
												<xsl:call-template name="DetallesEncabezado5"/>
											</xsl:when>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
												<xsl:call-template name="DetallesEncabezado5"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="/pe1:CreditNote">
													<xsl:call-template name="DetallesEncabezado5"/>
												</xsl:if>
												<xsl:if test="/pe2:DebitNote">
													<xsl:call-template name="DetallesEncabezado5"/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td valign="top"
									    width="100%"
									    align="left">
										<xsl:call-template name="Total"/>
									</td>
								</tr>
								<tr>
									<td align="left">
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="left"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr heigth="100%">
													<td valign="top"
													    width="100%"
													    align="left"
													    colspan="2">
														<xsl:call-template name="son-pesos"/>
													</td>
												</tr>
												<xsl:if test="//cbc:UBLVersionID='2.1'">
													<xsl:if test="//cbc:Note/@languageLocaleID='2006'">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="ope-detraccion"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='0'">
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='1'">
													<xsl:choose>
														<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
														<xsl:when test="$varTotalGratExporta &gt; 0 and $varTotalExonerado ='0.00'">
												
												</xsl:when>
														<xsl:otherwise>
															<xsl:if test="$varImporteTotalGrat!=''">
																<tr heigth="100%">
																	<td valign="top"
																	    width="100%"
																	    align="left"
																	    colspan="2">
																		<xsl:call-template name="Transferencia_Gratuita"/>
																	</td>
																</tr>
															</xsl:if>
															<xsl:if test="//cbc:UBLVersionID='2.1'">
																<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
																	<tr heigth="100%">
																		<td valign="top"
																		    width="100%"
																		    align="left"
																		    colspan="2">
																			<xsl:call-template name="Transferencia_Gratuita"/>
																		</td>
																	</tr>
																</xsl:if>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="$varTipoFactura='2'">
													<!-- SECCION TRANSFERENCIA GRATUITA -->
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA UN SOLO TRAMO-->
												<xsl:if test="$varValFactGuia=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA DOS TRAMOS -->
												<xsl:if test="$varValFactGuia=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA TRES TRAMOS-->
												<xsl:if test="$varValFactGuia=3">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia2"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE EXPORTACION -->
												<xsl:if test="$varTipoFactura=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Exportacion"/>
														</td>
													</tr>
												</xsl:if>
												<!-- xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'" -->
												<tr heigth="100%">
													<xsl:if test="/pe1:CreditNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe:Invoice!=''">
														<xsl:choose>
															<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
															<xsl:when test="//cbc:Note/@languageLocaleID='1002'">
												
													</xsl:when>
															<xsl:otherwise>
																<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
																	<td valign="top"
																	    width="50%"
																	    align="left">
																		<xsl:call-template name="DFORMAPAGO"/>
																	</td>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:if>
													<xsl:if test="$varFranjaRefGrat=''">
														<td valign="top"
														    width="90%"
														    align="left">
															<xsl:call-template name="Importe_Percepcion"/>
														</td>
													</xsl:if>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="center"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr>
													<td valign="top"
													    width="100%"
													    align="left">
														<xsl:call-template name="Datos_Sunat"/>
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
								<tr>
									<td align="right"
									    valign="top">
										<font face="Arial, Helvetica, sans-serif"
										      size="1">
											<!-- PÁGINA 5 -->
											<xsl:value-of select="concat('PÁGINA 5',' de ', ceiling($totalpag1) )"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</h4>
				</xsl:if>
				<!--Condición para que aparezca la 6ta pagina-->
				<xsl:if test="$FF &gt;'150' or $FC &gt;'150' or $FD &gt;'150'">
					<!--Función para realizar el salto de lÃ­nea-->
					<div class="saltar-pagina">&#xA0;</div>
					<!--Construcción de la 6ta Pagina-->
					<h5>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
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
								<tr>
									<td>
										<xsl:call-template name="DatosReceptor_1"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
												<xsl:call-template name="DetallesEncabezado6"/>
											</xsl:when>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
												<xsl:call-template name="DetallesEncabezado6"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="/pe1:CreditNote">
													<xsl:call-template name="DetallesEncabezado6"/>
												</xsl:if>
												<xsl:if test="/pe2:DebitNote">
													<xsl:call-template name="DetallesEncabezado6"/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td valign="top"
									    width="100%"
									    align="left">
										<xsl:call-template name="Total"/>
									</td>
								</tr>
								<tr>
									<td align="left">
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="left"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr heigth="100%">
													<td valign="top"
													    width="100%"
													    align="left"
													    colspan="2">
														<xsl:call-template name="son-pesos"/>
													</td>
												</tr>
												<xsl:if test="//cbc:UBLVersionID='2.1'">
													<xsl:if test="//cbc:Note/@languageLocaleID='2006'">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="ope-detraccion"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='0'">
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='1'">
													<xsl:choose>
														<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
														<xsl:when test="$varTotalGratExporta &gt; 0 and $varTotalExonerado ='0.00'">
												
												</xsl:when>
														<xsl:otherwise>
															<xsl:if test="$varImporteTotalGrat!=''">
																<tr heigth="100%">
																	<td valign="top"
																	    width="100%"
																	    align="left"
																	    colspan="2">
																		<xsl:call-template name="Transferencia_Gratuita"/>
																	</td>
																</tr>
															</xsl:if>
															<xsl:if test="//cbc:UBLVersionID='2.1'">
																<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
																	<tr heigth="100%">
																		<td valign="top"
																		    width="100%"
																		    align="left"
																		    colspan="2">
																			<xsl:call-template name="Transferencia_Gratuita"/>
																		</td>
																	</tr>
																</xsl:if>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="$varTipoFactura='2'">
													<!-- SECCION TRANSFERENCIA GRATUITA -->
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA UN SOLO TRAMO-->
												<xsl:if test="$varValFactGuia=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA DOS TRAMOS -->
												<xsl:if test="$varValFactGuia=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA TRES TRAMOS-->
												<xsl:if test="$varValFactGuia=3">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia2"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE EXPORTACION -->
												<xsl:if test="$varTipoFactura=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Exportacion"/>
														</td>
													</tr>
												</xsl:if>
												<!-- xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'" -->
												<tr heigth="100%">
													<xsl:if test="/pe1:CreditNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe:Invoice!=''">
														<xsl:choose>
															<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
															<xsl:when test="//cbc:Note/@languageLocaleID='1002'">
												
													</xsl:when>
															<xsl:otherwise>
																<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
																	<td valign="top"
																	    width="50%"
																	    align="left">
																		<xsl:call-template name="DFORMAPAGO"/>
																	</td>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:if>
													<xsl:if test="$varFranjaRefGrat=''">
														<td valign="top"
														    width="90%"
														    align="left">
															<xsl:call-template name="Importe_Percepcion"/>
														</td>
													</xsl:if>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="center"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr>
													<td valign="top"
													    width="100%"
													    align="left">
														<xsl:call-template name="Datos_Sunat"/>
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
								<tr>
									<td align="right"
									    valign="top">
										<font face="Arial, Helvetica, sans-serif"
										      size="1">
											<!-- PÁGINA 6 -->
											<xsl:value-of select="concat('PÁGINA 6',' de ', ceiling($totalpag1) )"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</h5>
				</xsl:if>
				<!--Condición para que aparezca la 7ta pagina-->
				<xsl:if test="$FF &gt;'180' or $FC &gt;'180' or $FD &gt;'180'">
					<!--Función para realizar el salto de lÃ­nea-->
					<div class="saltar-pagina">&#xA0;</div>
					<!--Construcción de la 7ta Pagina-->
					<h6>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
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
								<tr>
									<td>
										<xsl:call-template name="DatosReceptor_1"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
												<xsl:call-template name="DetallesEncabezado7"/>
											</xsl:when>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
												<xsl:call-template name="DetallesEncabezado7"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="/pe1:CreditNote">
													<xsl:call-template name="DetallesEncabezado7"/>
												</xsl:if>
												<xsl:if test="/pe2:DebitNote">
													<xsl:call-template name="DetallesEncabezado7"/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td valign="top"
									    width="100%"
									    align="left">
										<xsl:call-template name="Total"/>
									</td>
								</tr>
								<tr>
									<td align="left">
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="left"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr heigth="100%">
													<td valign="top"
													    width="100%"
													    align="left"
													    colspan="2">
														<xsl:call-template name="son-pesos"/>
													</td>
												</tr>
												<xsl:if test="//cbc:UBLVersionID='2.1'">
													<xsl:if test="//cbc:Note/@languageLocaleID='2006'">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="ope-detraccion"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='0'">
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='1'">
													<xsl:choose>
														<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
														<xsl:when test="$varTotalGratExporta &gt; 0 and $varTotalExonerado ='0.00'">
												
												</xsl:when>
														<xsl:otherwise>
															<xsl:if test="$varImporteTotalGrat!=''">
																<tr heigth="100%">
																	<td valign="top"
																	    width="100%"
																	    align="left"
																	    colspan="2">
																		<xsl:call-template name="Transferencia_Gratuita"/>
																	</td>
																</tr>
															</xsl:if>
															<xsl:if test="//cbc:UBLVersionID='2.1'">
																<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
																	<tr heigth="100%">
																		<td valign="top"
																		    width="100%"
																		    align="left"
																		    colspan="2">
																			<xsl:call-template name="Transferencia_Gratuita"/>
																		</td>
																	</tr>
																</xsl:if>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="$varTipoFactura='2'">
													<!-- SECCION TRANSFERENCIA GRATUITA -->
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA UN SOLO TRAMO-->
												<xsl:if test="$varValFactGuia=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA DOS TRAMOS -->
												<xsl:if test="$varValFactGuia=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA TRES TRAMOS-->
												<xsl:if test="$varValFactGuia=3">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia2"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE EXPORTACION -->
												<xsl:if test="$varTipoFactura=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Exportacion"/>
														</td>
													</tr>
												</xsl:if>
												<!-- xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'" -->
												<tr heigth="100%">
													<xsl:if test="/pe1:CreditNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe:Invoice!=''">
														<xsl:choose>
															<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
															<xsl:when test="//cbc:Note/@languageLocaleID='1002'">
												
													</xsl:when>
															<xsl:otherwise>
																<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
																	<td valign="top"
																	    width="50%"
																	    align="left">
																		<xsl:call-template name="DFORMAPAGO"/>
																	</td>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:if>
													<xsl:if test="$varFranjaRefGrat=''">
														<td valign="top"
														    width="90%"
														    align="left">
															<xsl:call-template name="Importe_Percepcion"/>
														</td>
													</xsl:if>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="center"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr>
													<td valign="top"
													    width="100%"
													    align="left">
														<xsl:call-template name="Datos_Sunat"/>
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
								<tr>
									<td align="right"
									    valign="top">
										<font face="Arial, Helvetica, sans-serif"
										      size="1">
											<!-- PÁGINA 7 -->
											<xsl:value-of select="concat('PÁGINA 7',' de ', ceiling($totalpag1) )"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</h6>
				</xsl:if>
				<!--Condición para que aparezca la 8ta pagina-->
				<xsl:if test="$FF &gt;'210' or $FC &gt;'210' or $FD &gt;'210'">
					<!--Función para realizar el salto de lÃ­nea-->
					<div class="saltar-pagina">&#xA0;</div>
					<!--Construcción de la 8ta Pagina-->
					<h7>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
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
								<tr>
									<td>
										<xsl:call-template name="DatosReceptor_1"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
												<xsl:call-template name="DetallesEncabezado8"/>
											</xsl:when>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
												<xsl:call-template name="DetallesEncabezado8"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="/pe1:CreditNote">
													<xsl:call-template name="DetallesEncabezado8"/>
												</xsl:if>
												<xsl:if test="/pe2:DebitNote">
													<xsl:call-template name="DetallesEncabezado8"/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td valign="top"
									    width="100%"
									    align="left">
										<xsl:call-template name="Total"/>
									</td>
								</tr>
								<tr>
									<td align="left">
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="left"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr heigth="100%">
													<td valign="top"
													    width="100%"
													    align="left"
													    colspan="2">
														<xsl:call-template name="son-pesos"/>
													</td>
												</tr>
												<xsl:if test="//cbc:UBLVersionID='2.1'">
													<xsl:if test="//cbc:Note/@languageLocaleID='2006'">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="ope-detraccion"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='0'">
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<xsl:if test="$varTipoFactura='1'">
													<xsl:choose>
														<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
														<xsl:when test="$varTotalGratExporta &gt; 0 and $varTotalExonerado ='0.00'">
												
												</xsl:when>
														<xsl:otherwise>
															<xsl:if test="$varImporteTotalGrat!=''">
																<tr heigth="100%">
																	<td valign="top"
																	    width="100%"
																	    align="left"
																	    colspan="2">
																		<xsl:call-template name="Transferencia_Gratuita"/>
																	</td>
																</tr>
															</xsl:if>
															<xsl:if test="//cbc:UBLVersionID='2.1'">
																<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
																	<tr heigth="100%">
																		<td valign="top"
																		    width="100%"
																		    align="left"
																		    colspan="2">
																			<xsl:call-template name="Transferencia_Gratuita"/>
																		</td>
																	</tr>
																</xsl:if>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
												<xsl:if test="$varTipoFactura='2'">
													<!-- SECCION TRANSFERENCIA GRATUITA -->
													<xsl:if test="$varImporteTotalGrat!=''">
														<tr heigth="100%">
															<td valign="top"
															    width="100%"
															    align="left"
															    colspan="2">
																<xsl:call-template name="Transferencia_Gratuita"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="//cbc:UBLVersionID='2.1'">
														<xsl:if test="//cbc:Note/@languageLocaleID='1002'">
															<tr heigth="100%">
																<td valign="top"
																    width="100%"
																    align="left"
																    colspan="2">
																	<xsl:call-template name="Transferencia_Gratuita"/>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA UN SOLO TRAMO-->
												<xsl:if test="$varValFactGuia=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA DOS TRAMOS -->
												<xsl:if test="$varValFactGuia=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE FACTURA GUIA PARA TRES TRAMOS-->
												<xsl:if test="$varValFactGuia=3">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="FactGuia2"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION VALORES DE PLACA Y MARCA DE FACTURA GUIA-->
												<xsl:if test="$varTipoFactura=2">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Transport1"/>
														</td>
													</tr>
												</xsl:if>
												<!-- SECCION FRANJAS DE EXPORTACION -->
												<xsl:if test="$varTipoFactura=1">
													<tr heigth="100%">
														<td valign="top"
														    width="100%"
														    align="left"
														    colspan="2">
															<xsl:call-template name="Exportacion"/>
														</td>
													</tr>
												</xsl:if>
												<!-- xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'" -->
												<tr heigth="100%">
													<xsl:if test="/pe1:CreditNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe2:DebitNote!=''">
														<td valign="top"
														    width="10%"
														    align="left">
															<xsl:call-template name="Referencia"/>
														</td>
													</xsl:if>
													<xsl:if test="/pe:Invoice!=''">
														<xsl:choose>
															<!--<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">-->
															<xsl:when test="//cbc:Note/@languageLocaleID='1002'">
												
													</xsl:when>
															<xsl:otherwise>
																<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
																	<td valign="top"
																	    width="50%"
																	    align="left">
																		<xsl:call-template name="DFORMAPAGO"/>
																	</td>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:if>
													<xsl:if test="$varFranjaRefGrat=''">
														<td valign="top"
														    width="90%"
														    align="left">
															<xsl:call-template name="Importe_Percepcion"/>
														</td>
													</xsl:if>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table cellSpacing="2"
										       cellPadding="0"
										       width="100%"
										       align="center"
										       border="0"
										       heigth="100%">
											<tbody>
												<tr>
													<td valign="top"
													    width="100%"
													    align="left">
														<xsl:call-template name="Datos_Sunat"/>
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
								<tr>
									<td align="right"
									    valign="top">
										<font face="Arial, Helvetica, sans-serif"
										      size="1">
											<!-- PÁGINA 8 -->
											<xsl:value-of select="concat('PÁGINA 8',' de ', ceiling($totalpag1) )"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</h7>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<!-- TIPO DE DOCUMENTO DEL RECEPTOR -->
	<xsl:template name="TipoDeDocumento">
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='-' or //cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'">NO DOMICILIADO</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">DNI</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">CARNET EXTR.</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">R.U.C.</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">PASAPORTE</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">CED. DIP. IDENT.</xsl:if>
	</xsl:template>
	<!-- FORMA DE PAGO -->
	<xsl:template name="tformapago">
		<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">CRÉDITO</xsl:if>
		<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Contado'">CONTADO</xsl:if>
	</xsl:template>
	<!-- Tipo de moneda -->
	<xsl:template name="TipoDeMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">
				<xsl:if test="number(20151215) &gt; number(concat(substring($varFechEmis,1,4),substring($varFechEmis,6,2),substring($varFechEmis,9,2)))">NUEVOS</xsl:if>SOLES</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='BRL'">REALES BRASILEIROS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">
				<xsl:if test="number(20151215) &gt; number(concat(substring($varFechEmis,1,4),substring($varFechEmis,6,2),substring($varFechEmis,9,2)))">NUEVOS</xsl:if>SOLES</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='BRL'">REALES BRASILEIROS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">
				<xsl:if test="number(20151215) &gt; number(concat(substring($varFechEmis,1,4),substring($varFechEmis,6,2),substring($varFechEmis,9,2)))">NUEVOS</xsl:if>SOLES</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='BRL'">REALES BRASILEIROS</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- SIMBOLO MONETARIO -->
	<xsl:template name="SimboloMonetario">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/<xsl:if test="number(20151215) &gt; number(concat(substring($varFechEmis,1,4),substring($varFechEmis,6,2),substring($varFechEmis,9,2)))">.</xsl:if>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">USD$</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">â‚¬</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/<xsl:if test="number(20151215) &gt; number(concat(substring($varFechEmis,1,4),substring($varFechEmis,6,2),substring($varFechEmis,9,2)))">.</xsl:if>
			</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">USD$</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">â‚¬</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/<xsl:if test="number(20151215) &gt; number(concat(substring($varFechEmis,1,4),substring($varFechEmis,6,2),substring($varFechEmis,9,2)))">.</xsl:if>
			</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">USD$</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">â‚¬</xsl:when>
			<xsl:otherwise>.</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- UNIDADES DE MEDIDA -->
	<xsl:template name="unidad_medida">
		<xsl:choose>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='AM'">AM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='AR'">AR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='AV'">AV</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BG'">BG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BX'">BX</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CH'">CH</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CLT'">CL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CMT'">CM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CJ'">CON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CQ'">CQ</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CV'">CV</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CY'">CY</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D61'">MIN</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D64'">BLK</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='DI'">DI</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='DLT'">DL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='DR'">DR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='EA'">EA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='EV'">EV</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTK'">PI2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTQ'">PI3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL'">GLL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GRM'">GRM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='HUR'">HRA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='INH'">PUL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='JG'">JG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='JR'">JR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KT'">KT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM'">KGM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KWT'">KW</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR'">LBR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR'">LTR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MIL'">MIL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MLD'">MLD</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MLT'">MLT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MMT'">MM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTQ'">MTQ</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTR'">MTR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NPR'">PAR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NRL'">ROL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PL'">BAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PA'">PQT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PK'">PK</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PR'">PR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='RM'">RM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='RO'">RO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SA'">SA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SET'">SET</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SR'">SR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TN'">TN</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE'">TON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TU'">TU</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='U2'">U2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='VI'">VI</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='AM'">AM</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='AR'">AR</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='AV'">AV</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='BG'">BG</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='BX'">BX</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='CH'">CH</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='CLT'">CL</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='CMT'">CM</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='CJ'">CON</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='CQ'">CQ</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='CV'">CV</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='CY'">CY</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='D61'">MIN</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='D64'">BLK</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='DI'">DI</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='DLT'">DL</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='DR'">DR</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='EA'">EA</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='EV'">EV</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='FTK'">PI2</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='FTQ'">PI3</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='GLL'">GLL</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='GRM'">GRM</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='HUR'">HRA</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='INH'">PUL</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='JG'">JG</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='JR'">JR</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='KT'">KT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='KGM'">KGM</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='KWT'">KW</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='LBR'">LBR</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='LTR'">LTR</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MIL'">MIL</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MLD'">MLD</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MLT'">MLT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MMT'">MM</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MTQ'">MTQ</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MTR'">MTR</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='NPR'">PAR</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='NRL'">ROL</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PL'">BAL</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PA'">PQT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PK'">PK</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PR'">PR</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='RM'">RM</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='RO'">RO</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='SA'">SA</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='SET'">SET</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='SR'">SR</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='TN'">TN</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='TNE'">TON</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='TU'">TU</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='U2'">U2</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='VI'">VI</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='AM'">AM</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='AR'">AR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='AV'">AV</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BG'">BG</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BX'">BX</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='CH'">CH</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='CLT'">CL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='CMT'">CM</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='CJ'">CON</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='CQ'">CQ</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='CV'">CV</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='CY'">CY</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='D61'">MIN</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='D64'">BLK</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='DI'">DI</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='DLT'">DL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='DR'">DR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='EA'">EA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='EV'">EV</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='FTK'">PI2</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='FTQ'">PI3</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='GLL'">GLL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='GRM'">GRM</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='HUR'">HRA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='INH'">PUL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='JG'">JG</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='JR'">JR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KT'">KT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KGM'">KGM</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KWT'">KW</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LBR'">LBR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LTR'">LTR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MIL'">MIL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MLD'">MLD</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MLT'">MLT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MMT'">MM</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTQ'">MTQ</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTR'">MTR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='NPR'">PAR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='NRL'">ROL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PL'">BAL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PA'">PQT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PK'">PK</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PR'">PR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='RM'">RM</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='RO'">RO</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='SA'">SA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='SET'">SET</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='SR'">SR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='TN'">TN</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='TNE'">TON</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='TU'">TU</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='U2'">U2</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='VI'">VI</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- VALOR SEGUN NRO DE VARAIBLE -->
	<xsl:template name="TraeValorVariable">
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
	<!-- MONTO:GRAV='1001',INAF='1002',EXON='1003',GRAT='1004',STOT='1005',PRCP='2001',RETN='2002',DETR='2003',BONI='2004',DSCT='2005',FISE='3001' -->
	<xsl:template name="TraerTotalGraInaExo">
		<xsl:param name="varTotGIE"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID=$varTotGIE">
				<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- MONTO:TOTIGV='1000',TOTISC='2000',TOTOTR='9999' -->
	<xsl:template name="TraerTotalImpuesto">
		<xsl:param name="varTotImp"/>
		<!-- xsl:for-each select="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme" -->
		<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
			<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=$varTotImp">
				<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
			<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=$varTotImp">
				<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
			<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=$varTotImp">
				<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- FECHA DE EMISION -->
	<xsl:variable name="varFechEmis">
		<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
		<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
		<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
	</xsl:variable>
	<!-- VARIABLE TOTAL IMPORTE REFERENCIAL -->
	<xsl:variable name="varImporteTotalGrat">
		<xsl:call-template name="TraerTotalGraInaExo">
			<xsl:with-param name="varTotGIE"
			                select="1004"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="varIGVTotal">
		<!-- PARA LOS TOTALES: TOTIGV='1000' -->
		<xsl:call-template name="TraerTotalImpuesto">
			<xsl:with-param name="varTotImp"
			                select="1000"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- NOMBRE COMERCIAL -->
	<xsl:variable name="varNomComercial">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="13"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- CICLO DE VENTA -->
	<xsl:variable name="varCicloVta">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="14"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VALOR BRUTO -->
	<xsl:variable name="varValBruto">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="11"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VALOR DSCTO TOTAL -->
	<xsl:variable name="varDscTotal">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="20"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- INDICADOR TIPO DE FACTURA -->
	<xsl:variable name="varTipoFactura">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="12"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- INDICADOR NRO DOC TRIB NO DOMICILIADO SIN RUC -->
	<xsl:variable name="varDocTribNoDomSinRuc">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="15"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- DATOS REFERENCIALES -->
	<!-- xsl:variable name="varDatosReferenciales">
		<xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="7" /></xsl:call-template>
	</xsl:variable -->
	<!-- VALORES DE LA VARAIBLE DE LA SECCION MONTOS REFERENCIALES GRATUITAS -->
	<xsl:variable name="varFranjaRefGrat">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="7"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- TRANSF. GRAT. V.B. -->
	<xsl:variable name="varTGVB">
		<xsl:value-of select="substring-before($varFranjaRefGrat,'*')"/>
	</xsl:variable>
	<!-- TRANSF. GRAT. V.D. -->
	<xsl:variable name="varTGVD">
		<xsl:value-of select="substring-before(substring-after($varFranjaRefGrat,'*'),'*')"/>
	</xsl:variable>
	<!-- TRANSF. GRAT. V.V. -->
	<xsl:variable name="varTGVV">
		<xsl:value-of select="substring-before(substring-after(substring-after($varFranjaRefGrat,'*'),'*'),'*')"/>
	</xsl:variable>
	<!-- TRANSF. GRAT. ISC. -->
	<xsl:variable name="varTGISC">
		<xsl:value-of select="substring-before(substring-after(substring-after(substring-after($varFranjaRefGrat,'*'),'*'),'*'),'*')"/>
	</xsl:variable>
	<!-- TRANSF. GRAT. IGV. -->
	<xsl:variable name="varTGIGV">
		<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after($varFranjaRefGrat,'*'),'*'),'*'),'*'),'*')"/>
	</xsl:variable>
	<!-- TRANSF. GRAT. TOTAL -->
	<xsl:variable name="varTGTOT">
		<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after($varFranjaRefGrat,'*'),'*'),'*'),'*'),'*'),'*')"/>
		<!--<xsl:value-of select="$varImporteTotalGrat"/>-->
	</xsl:variable>
	<!-- VALORES DE LA VARAIBLE DE LA FRANJA EXPORTACION 1 -->
	<xsl:variable name="varFranjaExport1">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="9"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- EXW -->
	<xsl:variable name="varExw">
		<xsl:value-of select="substring-before($varFranjaExport1,'*')"/>
	</xsl:variable>
	<!-- GASTO AL FOB -->
	<xsl:variable name="varGtoFob">
		<xsl:value-of select="substring-before(substring-after($varFranjaExport1,'*'),'*')"/>
	</xsl:variable>
	<!-- FOB -->
	<xsl:variable name="varFob">
		<xsl:value-of select="substring-before(substring-after(substring-after($varFranjaExport1,'*'),'*'),'*')"/>
	</xsl:variable>
	<!-- FLETE -->
	<xsl:variable name="varFlete">
		<xsl:value-of select="substring-before(substring-after(substring-after(substring-after($varFranjaExport1,'*'),'*'),'*'),'*')"/>
	</xsl:variable>
	<!-- SEGURO -->
	<xsl:variable name="varSeguro">
		<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after($varFranjaExport1,'*'),'*'),'*'),'*'),'*')"/>
	</xsl:variable>
	<!-- CIF / CPT / CFR -->
	<xsl:variable name="varCifCptCfr">
		<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after($varFranjaExport1,'*'),'*'),'*'),'*'),'*'),'*')"/>
	</xsl:variable>
	<!-- TERMINOS -->
	<xsl:variable name="varTerminos">
		<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($varFranjaExport1,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
	</xsl:variable>
	<!-- VALORES DE LA VARAIBLE DE LA FRANJA EXPORTACION 2 -->
	<xsl:variable name="varFranjaExport2">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="10"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- SEGURO -->
	<xsl:variable name="varVia">
		<xsl:value-of select="substring-before($varFranjaExport2,'*')"/>
	</xsl:variable>
	<!-- FLETE -->
	<xsl:variable name="varPtoSalida">
		<xsl:value-of select="substring-before(substring-after($varFranjaExport2,'*'),'*')"/>
	</xsl:variable>
	<!-- INCOTERM -->
	<xsl:variable name="varIncoterm">
		<xsl:value-of select="substring-before(substring-after(substring-after($varFranjaExport2,'*'),'*'),'*')"/>
	</xsl:variable>
	<!-- OBSERVACIONES -->
	<xsl:variable name="varObs">
		<xsl:value-of select="substring-before(substring-after(substring-after(substring-after($varFranjaExport2,'*'),'*'),'*'),'*')"/>
	</xsl:variable>
	<!-- FECHA DE EXPIRACIÃ’N DEL PRODUCTO DEL DETALLE (IR) -->
	<xsl:variable name="FechExp">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="16"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- AÃ‘ADE COLUMNA DESCUENTOS POR ITEM EN DETALLE -->
	<xsl:template name="FechaExpir">
		<xsl:param name="FechExp1"/>
		<xsl:param name="FechExp2"/>
		<xsl:choose>
			<xsl:when test="$FechExp1 = 1">
				<xsl:value-of select="substring-before($FechExp2, '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 2">
				<xsl:value-of select="substring-before(substring-after($FechExp2, '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 3">
				<xsl:value-of select="substring-before(substring-after(substring-after($FechExp2, '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 4">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 5">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 6">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 7">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 8">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 9">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 10">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 11">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 12">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 13">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 14">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 15">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 16">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 17">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 18">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 19">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 20">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 21">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 22">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 23">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 24">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 25">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 26">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 27">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 28">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 29">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 30">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 31">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 32">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 33">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 34">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 35">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:when test="$FechExp1 = 36">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($FechExp2, '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*'), '*')"/>
			</xsl:when>
			<xsl:otherwise>No existe...</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- VALORES DE LA VARIABLE DE LA SECCION DE FACTURAS GUIA-->
	<xsl:variable name="varFacturaGuia">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="17"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- PARTIDA TRAMO2 -->
	<xsl:variable name="varpartidaTramo2">
		<xsl:value-of select="substring-before($varFacturaGuia,'*')"/>
	</xsl:variable>
	<!--  FINAL DEL TRAMO2-->
	<xsl:variable name="varFinalTramo2">
		<xsl:value-of select="substring-before(substring-after($varFacturaGuia,'*'),'*')"/>
	</xsl:variable>
	<!--  VALORES FACTURA GUÃA-->
	<xsl:variable name="varValFactGuia">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="18"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- PUNTO DE PARTIDA -->
	<xsl:variable name="varPuntoPartida">
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional/cac:OriginAddress/cbc:StreetName"/>
	</xsl:variable>
	<!-- PUNTO DE PARTIDA -->
	<xsl:variable name="varPuntoLlegada">
		<!--<xsl:value-of select="pe:Invoice/cac:OriginAddress/cbc:StreetName"/>-->
		<!--<xsl:value-of select="/pe:Invoice/sac:SUNATEmbededDespatchAdvice/cac:OriginAddress/cbc:StreetName"/>-->
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/cac:OriginAddress/cbc:StreetName"/>
		<!--<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional/cac:DeliveryAddress/cbc:StreetName"/>-->
		<!--</xsl:for-each>	-->
	</xsl:variable>
	<!-- VALORES DE LA VARAIBLE DE LA SECCION FACTURA GUÃA -->
	<xsl:variable name="varFranjaTransport">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="19"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- MOTIVO DE TRANSPORTE -->
	<xsl:variable name="varMotTransp">
		<xsl:value-of select="substring-before($varFranjaTransport,'*')"/>
	</xsl:variable>
	<!-- NRO DE BULTOS -->
	<xsl:variable name="varNroBult">
		<xsl:value-of select="substring-before(substring-after($varFranjaTransport,'*'),'*')"/>
	</xsl:variable>
	<!-- PESO -->
	<xsl:variable name="varPeso">
		<xsl:value-of select="substring-before(substring-after(substring-after($varFranjaTransport,'*'),'*'),'*')"/>
	</xsl:variable>
	<!-- FECHA INCIO -->
	<xsl:variable name="varFechIni">
		<xsl:value-of select="substring-before(substring-after(substring-after(substring-after($varFranjaTransport,'*'),'*'),'*'),'*')"/>
	</xsl:variable>
	<!-- NOMBRE DEL TRANSPORTISTA -->
	<xsl:variable name="varTransportista">
		<xsl:value-of select="//cac:PartyLegalEntity/cbc:RegistrationName"/>
	</xsl:variable>
	<!-- RUC DEL TRASNPORTE -->
	<xsl:variable name="varRucTransport">
		<xsl:value-of select="//cbc:CustomerAssignedAccountID"/>
	</xsl:variable>
	<!-- PLACA DEL TRANSPORTE -->
	<xsl:variable name="varPlacaTransport">
		<xsl:value-of select="//cbc:LicencePlateID"/>
	</xsl:variable>
	<!-- LICENCIA DEL TRANSPORTISTA -->
	<xsl:variable name="varLicTransport">
		<xsl:value-of select="//cac:PartyIdentification/cbc:ID"/>
	</xsl:variable>
	<!-- MARCA DEL TRANSPORTE -->
	<xsl:variable name="varMarTransport">
		<xsl:value-of select="//cbc:BrandName"/>
	</xsl:variable>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="no" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\..\DBNet\20100018625&#x2D;01&#x2D;F0X2&#x2D;44634.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="Scenario2" userelativepaths="yes" externalpreview="yes" url="..\..\out\html\20100018625&#x2D;01&#x2D;F001&#x2D;00066351.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="Scenario3" userelativepaths="yes" externalpreview="yes" url="..\..\out\html\20100018625&#x2D;07&#x2D;F095&#x2D;00025014.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="Exportacion" userelativepaths="yes" externalpreview="yes" url="..\..\20100018625&#x2D;01&#x2D;FZ13&#x2D;521.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="exportacion_grat" userelativepaths="yes" externalpreview="yes" url="..\..\xml_pruebas\20100018625&#x2D;01&#x2D;F013&#x2D;528.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="exporta_484" userelativepaths="yes" externalpreview="yes" url="..\..\xml_pruebas\20100018625&#x2D;01&#x2D;F014&#x2D;484.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="yes" name="Detraccion" userelativepaths="yes" externalpreview="yes" url="..\..\esuiteSYNLAB\xml\20304706211&#x2D;01&#x2D;F002&#x2D;00047503&#x2D;45items.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="gratuita_01" userelativepaths="yes" externalpreview="yes" url="..\..\xml_pruebas\20100018625&#x2D;01&#x2D;F004&#x2D;8738.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="gratuita_02" userelativepaths="yes" externalpreview="yes" url="..\..\xml_pruebas\20100018625&#x2D;01&#x2D;F004&#x2D;8449.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="percepcion" userelativepaths="yes" externalpreview="yes" url="..\..\xml_pruebas\20100018625&#x2D;07&#x2D;F0X5&#x2D;00025913.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="formapago" userelativepaths="yes" externalpreview="yes" url="..\..\xml_pruebas\20100018625&#x2D;01&#x2D;F001&#x2D;75730.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="detraccion2" userelativepaths="yes" externalpreview="yes" url="20100018625&#x2D;01&#x2D;FS05&#x2D;00000067.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="GRATUITA" userelativepaths="yes" externalpreview="yes" url="..\..\xml_pruebas\20100018625&#x2D;01&#x2D;F004&#x2D;00009023.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="FORM_NEO" userelativepaths="yes" externalpreview="yes" url="..\..\PLANTILLAS\20100018625&#x2D;01&#x2D;F001&#x2D;00077777.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="321" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="201" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="161" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="281" y="69"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->