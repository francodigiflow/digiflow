<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN="0.00"/>

	<xsl:variable name="fechaDocModif">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo = '07'">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo = '07'">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo = '07'">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:template name="fecha_ddmmaa_formato">
		<xsl:param name="FechaFormateada"/>
		<xsl:variable name="aa">
			<xsl:value-of select="substring-before($FechaFormateada,'-')"/>
		</xsl:variable>
		<xsl:variable name="mmdd">
			<xsl:value-of select="substring-after($FechaFormateada,'-')"/>
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


	<xsl:variable name="numColBl">
		<xsl:if test="/pe:Invoice != ''">
			<xsl:value-of select="25 - count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote != ''">
			<xsl:value-of select="20 - count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote != ''">
			<xsl:value-of select="20 - count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>
	<xsl:include href="xWONG_encab.xslt"/>
	<xsl:include href="xWONG_detalle.xslt"/>
	<xsl:include href="xWONG_bottom.xslt"/>
	<xsl:include href="xWONG_datos.xslt"/>
	<xsl:include href="xWONG_total.xslt"/>

	<xsl:template match="/">
		<html xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		      xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
		      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
		      xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
		      xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
		      xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2">
			<head>
				<style>div.saltar-pagina {page-break-after: always;  }
				body {
		        margin-top: 20px;
		        margin-bottom: 20px;
		        margin-right: 20px;
		        margin-left: 20px; 
		        }</style>

				<title>Comprobante Electrónico</title>
			</head>
			<xsl:variable name="totalitems">
				<!--<xsl:value-of select="count(/pe:Invoice/cac:InvoiceLine/cbc:ID)"/>-->
				<xsl:if test="/pe:Invoice != ''">
					<xsl:value-of select="count(/pe:Invoice/cac:InvoiceLine)"/>
				</xsl:if>
				<xsl:if test="/pe1:CreditNote != ''">
					<xsl:value-of select="count(/pe1:CreditNote/cac:CreditNoteLine)"/>
				</xsl:if>
				<xsl:if test="/pe2:DebitNote != ''">
					<xsl:value-of select="count(/pe2:DebitNote/cac:DebitNoteLine)"/>
				</xsl:if>
			</xsl:variable>

			<xsl:variable name="totalpag">
				<xsl:if test="$totalitems &lt; '35'">
					<xsl:value-of select="1"/>
				</xsl:if>
				<xsl:if test="$totalitems &gt;'35' and $totalitems &lt;'48'">
					<xsl:value-of select="2"/>
				</xsl:if>
				<xsl:if test="$totalitems &gt;'47'">
					<xsl:value-of select="ceiling($totalitems div 48)"/>
				</xsl:if>
			</xsl:variable>

			<xsl:variable name="goultpag">
				<xsl:value-of select="$totalitems - ($totalitems mod 48)"/>
			</xsl:variable>
			<body>
				<h1>
					<table cellSpacing="1" width="100%" border="0" rules="none">
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
									<xsl:call-template name="DatosExportacion"/>
								</td>
							</tr>
							<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
								<tr>
									<td>
										<xsl:call-template name="Referencia-up"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<xsl:call-template name="DetallesEncabezado">
										<xsl:with-param name="titems" select="$totalitems"/>
										<xsl:with-param name="tpaginas" select="$totalpag"/>
										<xsl:with-param name="pagina" select="1"/>
									</xsl:call-template>
								</td>
							</tr>
							<xsl:if test="$totalpag=1">
								<tr>
									<td>
										<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
											<tr>
												<td vAlign="top" width="71%" align="left">
													<table border="0" width="100%" cellpadding="0" cellspacing="0">
														<tr>
															<td>
																<xsl:call-template name="son-pesos"/>
															</td>
														</tr>
														<tr>
															<td>
																<xsl:call-template name="observacion"/>
															</td>
														</tr>
														<xsl:if test="//cac:PrepaidPayment/cbc:PaidAmount !='0.00'">
															<tr>
																<td width="100%">
																	<xsl:call-template name="anticipo"/>
																</td>
															</tr>
														</xsl:if>
														<tr>
															<td>
																<br/>
																<xsl:call-template name="firmabottom"/>
															</td>
														</tr>
													</table>
												</td>
												<!--</tr>
									<tr>-->
												<td vAlign="top" width="29%" align="left">
													<xsl:call-template name="Total"/>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<xsl:call-template name="Transferencia"/>
													<!--<td colspan="2"><xsl:call-template name="DatosReferencia"/>-->
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td width="100%">
										<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="left">
											<tr>
												<td width="50%">
													<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
														<xsl:call-template name="RetourneValAd">
															<xsl:with-param name="NumAd" select="00"/>
														</xsl:call-template>
													</font>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>&#xA0;</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<div align="right">
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pág 1/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
					</div>
				</h1>

				<!--Condición para que aparezca la 2da pagina-->
				<xsl:if test="$totalpag &gt;'1'">
					<!--Función para realizar el salto de línea-->
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$i"/>-->
					</div>
					<!--Construcción de la 2da Pagina-->
					<h2>
						<table cellSpacing="1" width="100%" border="0" rules="none">
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
										<xsl:call-template name="DatosExportacion"/>
									</td>
								</tr>
								<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
									<tr>
										<td>
											<xsl:call-template name="Referencia-up"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado">
											<xsl:with-param name="titems" select="$totalitems"/>
											<xsl:with-param name="tpaginas" select="$totalpag"/>
											<xsl:with-param name="pagina" select="2"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:if test="$totalpag=2">
									<tr>
										<td>
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
												<tr>
													<td vAlign="top" width="71%" align="left">
														<table border="0" width="100%" cellpadding="0" cellspacing="0">
															<tr>
																<td>
																	<xsl:call-template name="son-pesos"/>
																</td>
															</tr>
															<tr>
																<td>
																	<xsl:call-template name="observacion"/>
																</td>
															</tr>
															<xsl:if test="//cac:PrepaidPayment/cbc:PaidAmount !='0.00'">
																<tr>
																	<td width="100%">
																		<xsl:call-template name="anticipo"/>
																	</td>
																</tr>
															</xsl:if>
															<tr>
																<td>
																	<br/>
																	<xsl:call-template name="firmabottom"/>
																</td>
															</tr>
														</table>
													</td>
													<td vAlign="top" width="29%" align="left">
														<xsl:call-template name="Total"/>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<xsl:call-template name="Transferencia"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td width="100%">
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="left">
												<tr>
													<td width="50%">
														<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
															<xsl:call-template name="RetourneValAd">
																<xsl:with-param name="NumAd" select="00"/>
															</xsl:call-template>
														</font>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>&#xA0;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<div align="right">
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pág 2/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
						</div>
					</h2>
				</xsl:if>

				<!-- Tercera 3ra Pagina -->
				<xsl:if test="$totalpag &gt;'2'">
					<!--Función para realizar el salto de línea-->
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$i"/>-->
					</div>
					<!--Construcción de la 2da Pagina-->
					<h3>
						<table cellSpacing="1" width="100%" border="0" rules="none">
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
										<xsl:call-template name="DatosExportacion"/>
									</td>
								</tr>
								<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
									<tr>
										<td>
											<xsl:call-template name="Referencia-up"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado">
											<xsl:with-param name="titems" select="$totalitems"/>
											<xsl:with-param name="tpaginas" select="$totalpag"/>
											<xsl:with-param name="pagina" select="3"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:if test="$totalpag=3">
									<tr>
										<td>
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
												<tr>
													<td vAlign="top" width="71%" align="left">
														<table border="0" width="100%" cellpadding="0" cellspacing="0">
															<tr>
																<td>
																	<xsl:call-template name="son-pesos"/>
																</td>
															</tr>
															<tr>
																<td>
																	<xsl:call-template name="observacion"/>
																</td>
															</tr>
															<xsl:if test="//cac:PrepaidPayment/cbc:PaidAmount !='0.00'">
																<tr>
																	<td width="100%">
																		<xsl:call-template name="anticipo"/>
																	</td>
																</tr>
															</xsl:if>
															<tr>
																<td>
																	<br/>
																	<xsl:call-template name="firmabottom"/>
																</td>
															</tr>
														</table>
													</td>
													<td vAlign="top" width="29%" align="left">
														<xsl:call-template name="Total"/>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<xsl:call-template name="Transferencia"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td width="100%">
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="left">
												<tr>
													<td width="50%">
														<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
															<xsl:call-template name="RetourneValAd">
																<xsl:with-param name="NumAd" select="00"/>
															</xsl:call-template>
														</font>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>&#xA0;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<div align="right">
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pág 3/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
						</div>
					</h3>
				</xsl:if>

				<!-- Cuarta 4ta pagina -->
				<xsl:if test="$totalpag &gt;'3'">
					<!--Función para realizar el salto de línea-->
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$i"/>-->
					</div>
					<!--Construcción de la 2da Pagina-->
					<h4>
						<table cellSpacing="1" width="100%" border="0" rules="none">
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
										<xsl:call-template name="DatosExportacion"/>
									</td>
								</tr>
								<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
									<tr>
										<td>
											<xsl:call-template name="Referencia-up"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado">
											<xsl:with-param name="titems" select="$totalitems"/>
											<xsl:with-param name="tpaginas" select="$totalpag"/>
											<xsl:with-param name="pagina" select="4"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:if test="$totalpag=4">
									<tr>
										<td>
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
												<tr>
													<td vAlign="top" width="71%" align="left">
														<table border="0" width="100%" cellpadding="0" cellspacing="0">
															<tr>
																<td>
																	<xsl:call-template name="son-pesos"/>
																</td>
															</tr>
															<tr>
																<td>
																	<xsl:call-template name="observacion"/>
																</td>
															</tr>
															<xsl:if test="//cac:PrepaidPayment/cbc:PaidAmount !='0.00'">
																<tr>
																	<td width="100%">
																		<xsl:call-template name="anticipo"/>
																	</td>
																</tr>
															</xsl:if>
															<tr>
																<td>
																	<br/>
																	<xsl:call-template name="firmabottom"/>
																</td>
															</tr>
														</table>
													</td>
													<td vAlign="top" width="29%" align="left">
														<xsl:call-template name="Total"/>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<xsl:call-template name="Transferencia"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td width="100%">
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="left">
												<tr>
													<td width="50%">
														<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
															<xsl:call-template name="RetourneValAd">
																<xsl:with-param name="NumAd" select="00"/>
															</xsl:call-template>
														</font>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>&#xA0;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<div align="right">
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pág 4/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
						</div>
					</h4>
				</xsl:if>

				<!-- quinta 5ta pagina -->
				<xsl:if test="$totalpag &gt;'4'">
					<!--Función para realizar el salto de línea-->
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$i"/>-->
					</div>
					<!--Construcción de la 2da Pagina-->
					<h5>
						<table cellSpacing="1" width="100%" border="0" rules="none">
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
										<xsl:call-template name="DatosExportacion"/>
									</td>
								</tr>
								<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
									<tr>
										<td>
											<xsl:call-template name="Referencia-up"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado">
											<xsl:with-param name="titems" select="$totalitems"/>
											<xsl:with-param name="tpaginas" select="$totalpag"/>
											<xsl:with-param name="pagina" select="5"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:if test="$totalpag=5">
									<tr>
										<td>
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
												<tr>
													<td vAlign="top" width="71%" align="left">
														<table border="0" width="100%" cellpadding="0" cellspacing="0">
															<tr>
																<td>
																	<xsl:call-template name="son-pesos"/>
																</td>
															</tr>
															<tr>
																<td>
																	<xsl:call-template name="observacion"/>
																</td>
															</tr>
															<xsl:if test="//cac:PrepaidPayment/cbc:PaidAmount !='0.00'">
																<tr>
																	<td width="100%">
																		<xsl:call-template name="anticipo"/>
																	</td>
																</tr>
															</xsl:if>
															<tr>
																<td>
																	<br/>
																	<xsl:call-template name="firmabottom"/>
																</td>
															</tr>
														</table>
													</td>
													<td vAlign="top" width="29%" align="left">
														<xsl:call-template name="Total"/>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<xsl:call-template name="Transferencia"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td width="100%">
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="left">
												<tr>
													<td width="50%">
														<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
															<xsl:call-template name="RetourneValAd">
																<xsl:with-param name="NumAd" select="00"/>
															</xsl:call-template>
														</font>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>&#xA0;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<div align="right">
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pág 5/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
						</div>
					</h5>
				</xsl:if>

				<!-- Sexta Pagina -->
				<!-- quinta 5ta pagina -->
				<xsl:if test="$totalpag &gt;'5'">
					<!--Función para realizar el salto de línea-->
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$i"/>-->
					</div>
					<!--Construcción de la 2da Pagina-->
					<h6>
						<table cellSpacing="1" width="100%" border="0" rules="none">
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
										<xsl:call-template name="DatosExportacion"/>
									</td>
								</tr>
								<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
									<tr>
										<td>
											<xsl:call-template name="Referencia-up"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado">
											<xsl:with-param name="titems" select="$totalitems"/>
											<xsl:with-param name="tpaginas" select="$totalpag"/>
											<xsl:with-param name="pagina" select="6"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:if test="$totalpag=6">
									<tr>
										<td>
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
												<tr>
													<td vAlign="top" width="71%" align="left">
														<table border="0" width="100%" cellpadding="0" cellspacing="0">
															<tr>
																<td>
																	<xsl:call-template name="son-pesos"/>
																</td>
															</tr>
															<tr>
																<td>
																	<xsl:call-template name="observacion"/>
																</td>
															</tr>
															<xsl:if test="//cac:PrepaidPayment/cbc:PaidAmount !='0.00'">
																<tr>
																	<td width="100%">
																		<xsl:call-template name="anticipo"/>
																	</td>
																</tr>
															</xsl:if>
															<tr>
																<td>
																	<br/>
																	<xsl:call-template name="firmabottom"/>
																</td>
															</tr>
														</table>
													</td>
													<td vAlign="top" width="29%" align="left">
														<xsl:call-template name="Total"/>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<xsl:call-template name="Transferencia"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td width="100%">
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="left">
												<tr>
													<td width="50%">
														<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
															<xsl:call-template name="RetourneValAd">
																<xsl:with-param name="NumAd" select="00"/>
															</xsl:call-template>
														</font>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>&#xA0;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<div align="right">
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pág 6/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
						</div>
					</h6>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="no" name="FACTURA_EXP" userelativepaths="yes" externalpreview="yes" url="..\..\GELAFRUT\XML\XML\20102256558&#x2D;01&#x2D;FE01&#x2D;00103881.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="FACTURA_NORAML" userelativepaths="yes" externalpreview="yes" url="..\20267196746_2018041201F0X900000003.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="nc" userelativepaths="yes" externalpreview="yes" url="..\20267196746_2018041207F00100000002.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="GRATUITA" userelativepaths="yes" externalpreview="yes" url="..\..\..\esuite\out\html\20507179411&#x2D;01&#x2D;F0Z4&#x2D;00100820.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="bOLGRATUITA" userelativepaths="yes" externalpreview="yes" url="..\..\..\esuite\out\html\20507179411&#x2D;03&#x2D;B0Z4&#x2D;00100820.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="JOMATUR" userelativepaths="yes" externalpreview="yes" url="..\..\DRESDEN\20101266819&#x2D;01&#x2D;F0X8&#x2D;00000021.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="wong&#x2D;fox1" userelativepaths="yes" externalpreview="yes" url="20267196746&#x2D;01&#x2D;F0X1&#x2D;00000001.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="Anticipo" userelativepaths="yes" externalpreview="yes" url="..\ANTICIPO\20267196746_2018050201F00300000003.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="anticipo2" userelativepaths="yes" externalpreview="yes" url="..\ANTICIPO\20267196746_2018050201F0X300000003.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="multi" userelativepaths="yes" externalpreview="yes" url="..\MULTI&#x2D;20267196746&#x2D;01&#x2D;F017&#x2D;00000001.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="multi2" userelativepaths="yes" externalpreview="yes" url="..\MULTI&#x2D;20267196746&#x2D;01&#x2D;F017&#x2D;00000001&#x2D;MOD.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="yes" name="multi3" userelativepaths="yes" externalpreview="yes" url="..\..\esuiteNETMODA\XML\20553255881&#x2D;01&#x2D;F201&#x2D;00014214.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="..\xml\20262996329&#x2D;07&#x2D;FF11&#x2D;00000055.xml" srcSchemaRoot="CreditNote" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="166" y="60"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/table/tr/td/xsl:call&#x2D;template" x="66" y="65"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="106" y="65"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="186" y="65"/><block path="html/body/table/tbody/tr[5]/td/xsl:call&#x2D;template" x="126" y="60"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->