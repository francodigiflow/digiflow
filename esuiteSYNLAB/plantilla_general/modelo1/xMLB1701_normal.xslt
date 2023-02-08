<?xml version="1.0" encoding="utf-8"?>
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

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

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

	<xsl:variable name="tipo_factura">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:SUNATTransaction">
			<xsl:value-of select="cbc:ID"/>
		</xsl:for-each>
	</xsl:variable>
	
	<xsl:include href="xMLB1701_encab.xslt"/>
	<xsl:include href="xMLB1701_detalle.xslt"/>
	<xsl:include href="xMLB1701_bottom.xslt"/>
	<xsl:include href="xMLB1701_datos.xslt"/>
	<xsl:include href="xMLB1701_total.xslt"/>
	
	<xsl:template match="/">
		<html xmlns:ccts="urn:un:unece:uncefact:documentation:2"
			xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
			xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		    xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
			xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
			xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
			xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
			xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
			xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
			xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2"
			xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
			xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2">

			<head>
				<style>div.saltar-pagina {page-break-after: always;}</style>
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
				<xsl:if test="$totalitems &lt; '28'">
					<xsl:value-of select="1"/>
				</xsl:if>
				<xsl:if test="$totalitems &gt;'28'">
					<xsl:value-of select="ceiling($totalitems div 30)"/>
				</xsl:if>
			</xsl:variable>

			<body>
				<h1>
					<table cellSpacing="1" width="100%" border="0">
						<tbody>
							<tr><td><xsl:call-template name="Encabezado"/></td></tr>
							<tr><td><xsl:call-template name="DatosReceptor"/></td></tr>
							<tr>
								<td>
									<xsl:call-template name="DetallesEncabezado">
										<xsl:with-param name="titems" select="$totalitems"/>
										<xsl:with-param name="tpaginas" select="$totalpag"/>
										<xsl:with-param name="pagina" select="1"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--<xsl:if test="$totalpag=1">-->
								<tr>
									<td>
										<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
											<tbody>
												<tr>
													<td colspan="2">
														<table border="1" bordercolor="#000001" width="100%" cellpadding="1" cellspacing="0">
															<tr><td><xsl:call-template name="son-pesos"/></td></tr>
														</table>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<br/>
														</font>
													</td>
												</tr>
												<tr>
													<td width="65%"><xsl:call-template name="Observaciones"/></td>
													<td width="35%"><xsl:call-template name="Total"/></td>
												</tr>											
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center">
										<xsl:if test="$valPercepcion!=''">
											<font face="Arial, Helvetica, sans-serif" size="1">Comprobante de Percepción - Venta Interna</font>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:if test="$varCtsPorcenDetra!=''">
											<xsl:call-template name="Detraccion"/>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td colspan="2"><xsl:call-template name="Transferencia"/>
									</td>
								</tr>							
								<tr>
									<td>
										<table border="0" cellSpacing="2" cellPadding="0" width="100%" align="center" heigth="100%">
											<tbody>
												<tr heigth="100%">
													<td vAlign="top" width="65%" align="left">
														<xsl:call-template name="Referencia"/>
													</td>
													<td vAlign="top" width="35%"></td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'"><font size="1" face="Arial, Helvetica, sans-serif"/></xsl:when>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font size="2" face="Arial, Helvetica, sans-serif"></font></xsl:when>
											<xsl:otherwise>
										    	<xsl:if test="/pe1:CreditNote"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>
										    	<xsl:if test="/pe2:DebitNote"> <font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>      
								    		</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>												
								<tr width="100%">
									<td>
										<xsl:call-template name="bottom_hash"/>
									</td>
								</tr>						
							<!--</xsl:if>-->
						</tbody>
					</table>
					<div align="right">
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pág 1/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
					</div>
				</h1>	
								
				<xsl:if test="$totalpag &gt;'1'">					
					<div class="saltar-pagina"></div>
					<h2>
						<table cellSpacing="1" width="100%" border="0">
							<tbody>
								<tr><td><xsl:call-template name="Encabezado"/></td></tr>
								<tr><td><xsl:call-template name="DatosReceptor"/></td></tr>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado">
											<xsl:with-param name="titems" select="$totalitems"/>
											<xsl:with-param name="tpaginas" select="$totalpag"/>
											<xsl:with-param name="pagina" select="2"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--<xsl:if test="$totalpag=2">-->
									<tr>
										<td>
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
												<tbody>
													<tr>
														<td colspan="2">
															<table border="1" bordercolor="#000001" width="100%" cellpadding="1" cellspacing="0">
																<tr><td><xsl:call-template name="son-pesos"/></td></tr>
															</table>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<font face="Arial, Helvetica, sans-serif" size="1">
																<br/>
															</font>
														</td>
													</tr>
													<tr>
														<td width="65%"><xsl:call-template name="Observaciones"/></td>
														<td width="35%"><xsl:call-template name="Total"/></td>
													</tr>											
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center">
											<xsl:if test="$valPercepcion!=''">
												<font face="Arial, Helvetica, sans-serif" size="1">Comprobante de Percepción - Venta Interna</font>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:if test="$varCtsPorcenDetra!=''">
												<xsl:call-template name="Detraccion"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td colspan="2"><xsl:call-template name="Transferencia"/>
										</td>
									</tr>							
									<tr>
										<td>
											<table border="0" cellSpacing="2" cellPadding="0" width="100%" align="center" heigth="100%">
												<tbody>
													<tr heigth="100%">
														<td vAlign="top" width="65%" align="left">
															<xsl:call-template name="Referencia"/>
														</td>
														<td vAlign="top" width="35%"></td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'"><font size="1" face="Arial, Helvetica, sans-serif"/></xsl:when>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font size="2" face="Arial, Helvetica, sans-serif"></font></xsl:when>
												<xsl:otherwise>
											    	<xsl:if test="/pe1:CreditNote"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>
											    	<xsl:if test="/pe2:DebitNote"> <font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>      
									    		</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>												
									<tr width="100%">
										<td>
											<xsl:call-template name="bottom_hash"/>
										</td>
									</tr>						
								<!--</xsl:if>-->
							</tbody>
						</table>
						<div align="right">
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pág 2/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
						</div>
					</h2>
				</xsl:if>
			
				<xsl:if test="$totalpag &gt;'2'">					
					<div class="saltar-pagina"></div>
					<h2>
						<table cellSpacing="1" width="100%" border="0">
							<tbody>
								<tr><td><xsl:call-template name="Encabezado"/></td></tr>
								<tr><td><xsl:call-template name="DatosReceptor"/></td></tr>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado">
											<xsl:with-param name="titems" select="$totalitems"/>
											<xsl:with-param name="tpaginas" select="$totalpag"/>
											<xsl:with-param name="pagina" select="3"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--<xsl:if test="$totalpag=3">-->
									<tr>
										<td>
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
												<tbody>
													<tr>
														<td colspan="2">
															<table border="1" bordercolor="#000001" width="100%" cellpadding="1" cellspacing="0">
																<tr><td><xsl:call-template name="son-pesos"/></td></tr>
															</table>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<font face="Arial, Helvetica, sans-serif" size="1">
																<br/>
															</font>
														</td>
													</tr>
													<tr>
														<td width="65%"><xsl:call-template name="Observaciones"/></td>
														<td width="35%"><xsl:call-template name="Total"/></td>
													</tr>											
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center">
											<xsl:if test="$valPercepcion!=''">
												<font face="Arial, Helvetica, sans-serif" size="1">Comprobante de Percepción - Venta Interna</font>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:if test="$varCtsPorcenDetra!=''">
												<xsl:call-template name="Detraccion"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td colspan="2"><xsl:call-template name="Transferencia"/>
										</td>
									</tr>							
									<tr>
										<td>
											<table border="0" cellSpacing="2" cellPadding="0" width="100%" align="center" heigth="100%">
												<tbody>
													<tr heigth="100%">
														<td vAlign="top" width="65%" align="left">
															<xsl:call-template name="Referencia"/>
														</td>
														<td vAlign="top" width="35%"></td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'"><font size="1" face="Arial, Helvetica, sans-serif"/></xsl:when>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font size="2" face="Arial, Helvetica, sans-serif"></font></xsl:when>
												<xsl:otherwise>
											    	<xsl:if test="/pe1:CreditNote"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>
											    	<xsl:if test="/pe2:DebitNote"> <font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>      
									    		</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>												
									<tr width="100%">
										<td>
											<xsl:call-template name="bottom_hash"/>
										</td>
									</tr>						
								<!--</xsl:if>-->
							</tbody>
						</table>
						<div align="right">
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pág 3/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
						</div>
					</h2>
				</xsl:if>
				
				<xsl:if test="$totalpag &gt;'3'">					
					<div class="saltar-pagina"></div>
					<h2>
						<table cellSpacing="1" width="100%" border="0">
							<tbody>
								<tr><td><xsl:call-template name="Encabezado"/></td></tr>
								<tr><td><xsl:call-template name="DatosReceptor"/></td></tr>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado">
											<xsl:with-param name="titems" select="$totalitems"/>
											<xsl:with-param name="tpaginas" select="$totalpag"/>
											<xsl:with-param name="pagina" select="4"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--<xsl:if test="$totalpag=4">-->
									<tr>
										<td>
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
												<tbody>
													<tr>
														<td colspan="2">
															<table border="1" bordercolor="#000001" width="100%" cellpadding="1" cellspacing="0">
																<tr><td><xsl:call-template name="son-pesos"/></td></tr>
															</table>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<font face="Arial, Helvetica, sans-serif" size="1">
																<br/>
															</font>
														</td>
													</tr>
													<tr>
														<td width="65%"><xsl:call-template name="Observaciones"/></td>
														<td width="35%"><xsl:call-template name="Total"/></td>
													</tr>											
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center">
											<xsl:if test="$valPercepcion!=''">
												<font face="Arial, Helvetica, sans-serif" size="1">Comprobante de Percepción - Venta Interna</font>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:if test="$varCtsPorcenDetra!=''">
												<xsl:call-template name="Detraccion"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td colspan="2"><xsl:call-template name="Transferencia"/>
										</td>
									</tr>							
									<tr>
										<td>
											<table border="0" cellSpacing="2" cellPadding="0" width="100%" align="center" heigth="100%">
												<tbody>
													<tr heigth="100%">
														<td vAlign="top" width="65%" align="left">
															<xsl:call-template name="Referencia"/>
														</td>
														<td vAlign="top" width="35%"></td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'"><font size="1" face="Arial, Helvetica, sans-serif"/></xsl:when>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font size="2" face="Arial, Helvetica, sans-serif"></font></xsl:when>
												<xsl:otherwise>
											    	<xsl:if test="/pe1:CreditNote"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>
											    	<xsl:if test="/pe2:DebitNote"> <font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>      
									    		</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>												
									<tr width="100%">
										<td>
											<xsl:call-template name="bottom_hash"/>
										</td>
									</tr>						
								<!--</xsl:if>-->
							</tbody>
						</table>
						<div align="right">
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pág 4/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
						</div>
					</h2>
				</xsl:if>

				<xsl:if test="$totalpag &gt;'4'">					
					<div class="saltar-pagina"></div>
					<h2>
						<table cellSpacing="1" width="100%" border="0">
							<tbody>
								<tr><td><xsl:call-template name="Encabezado"/></td></tr>
								<tr><td><xsl:call-template name="DatosReceptor"/></td></tr>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado">
											<xsl:with-param name="titems" select="$totalitems"/>
											<xsl:with-param name="tpaginas" select="$totalpag"/>
											<xsl:with-param name="pagina" select="5"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--<xsl:if test="$totalpag=5">-->
									<tr>
										<td>
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
												<tbody>
													<tr>
														<td colspan="2">
															<table border="1" bordercolor="#000001" width="100%" cellpadding="1" cellspacing="0">
																<tr><td><xsl:call-template name="son-pesos"/></td></tr>
															</table>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<font face="Arial, Helvetica, sans-serif" size="1">
																<br/>
															</font>
														</td>
													</tr>
													<tr>
														<td width="65%"><xsl:call-template name="Observaciones"/></td>
														<td width="35%"><xsl:call-template name="Total"/></td>
													</tr>											
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center">
											<xsl:if test="$valPercepcion!=''">
												<font face="Arial, Helvetica, sans-serif" size="1">Comprobante de Percepción - Venta Interna</font>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:if test="$varCtsPorcenDetra!=''">
												<xsl:call-template name="Detraccion"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td colspan="2"><xsl:call-template name="Transferencia"/>
										</td>
									</tr>							
									<tr>
										<td>
											<table border="0" cellSpacing="2" cellPadding="0" width="100%" align="center" heigth="100%">
												<tbody>
													<tr heigth="100%">
														<td vAlign="top" width="65%" align="left">
															<xsl:call-template name="Referencia"/>
														</td>
														<td vAlign="top" width="35%"></td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'"><font size="1" face="Arial, Helvetica, sans-serif"/></xsl:when>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font size="2" face="Arial, Helvetica, sans-serif"></font></xsl:when>
												<xsl:otherwise>
											    	<xsl:if test="/pe1:CreditNote"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>
											    	<xsl:if test="/pe2:DebitNote"> <font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>      
									    		</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>												
									<tr width="100%">
										<td>
											<xsl:call-template name="bottom_hash"/>
										</td>
									</tr>						
								<!--</xsl:if>-->
							</tbody>
						</table>
						<div align="right">
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pág 5/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
						</div>
					</h2>
				</xsl:if>

				<xsl:if test="$totalpag &gt;'5'">					
					<div class="saltar-pagina"></div>
					<h2>
						<table cellSpacing="1" width="100%" border="0">
							<tbody>
								<tr><td><xsl:call-template name="Encabezado"/></td></tr>
								<tr><td><xsl:call-template name="DatosReceptor"/></td></tr>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado">
											<xsl:with-param name="titems" select="$totalitems"/>
											<xsl:with-param name="tpaginas" select="$totalpag"/>
											<xsl:with-param name="pagina" select="6"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--<xsl:if test="$totalpag=6">-->
									<tr>
										<td>
											<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
												<tbody>
													<tr>
														<td colspan="2">
															<table border="1" bordercolor="#000001" width="100%" cellpadding="1" cellspacing="0">
																<tr><td><xsl:call-template name="son-pesos"/></td></tr>
															</table>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<font face="Arial, Helvetica, sans-serif" size="1">
																<br/>
															</font>
														</td>
													</tr>
													<tr>
														<td width="65%"><xsl:call-template name="Observaciones"/></td>
														<td width="35%"><xsl:call-template name="Total"/></td>
													</tr>											
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center">
											<xsl:if test="$valPercepcion!=''">
												<font face="Arial, Helvetica, sans-serif" size="1">Comprobante de Percepción - Venta Interna</font>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:if test="$varCtsPorcenDetra!=''">
												<xsl:call-template name="Detraccion"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td colspan="2"><xsl:call-template name="Transferencia"/>
										</td>
									</tr>							
									<tr>
										<td>
											<table border="0" cellSpacing="2" cellPadding="0" width="100%" align="center" heigth="100%">
												<tbody>
													<tr heigth="100%">
														<td vAlign="top" width="65%" align="left">
															<xsl:call-template name="Referencia"/>
														</td>
														<td vAlign="top" width="35%"></td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'"><font size="1" face="Arial, Helvetica, sans-serif"/></xsl:when>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font size="2" face="Arial, Helvetica, sans-serif"></font></xsl:when>
												<xsl:otherwise>
											    	<xsl:if test="/pe1:CreditNote"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>
											    	<xsl:if test="/pe2:DebitNote"> <font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>      
									    		</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>												
									<tr width="100%">
										<td>
											<xsl:call-template name="bottom_hash"/>
										</td>
									</tr>						
								<!--</xsl:if>-->
							</tbody>
						</table>
						<div align="right">
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pág 6/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
						</div>
					</h2>
				</xsl:if>

			</body>
		</html>
	</xsl:template>

		<!-- TRAE EL PROCENTAJE DE DETRACCIÓN -->
	<xsl:variable name="varCtsPorcenDetra">
	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
		<xsl:if test="cbc:ID='2003'">
		<xsl:value-of select="cbc:Percent"/>
		</xsl:if>
	</xsl:for-each>
	</xsl:variable>
	<!-- DATOS ADICIONALES DE DETRACCION BBySS  -->
	<xsl:variable name="varCodBBySS">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
		<xsl:if test="cbc:ID='3000'">
			<xsl:value-of select="cbc:Value"/>
		</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<!-- DATOS ADICIONALES DE DETRACCION CUENTA BN  -->
	<xsl:variable name="varCtaBN">
	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
		<xsl:if test="cbc:ID='3001'">
			<xsl:value-of select="cbc:Value"/>
		</xsl:if>
	</xsl:for-each>
	</xsl:variable>

	<!-- DATOS ADICIONALES MONTO DE LA DETRACCION  -->
	<!--Revisar el Anexo D Sunat-Catalogo N°15 codigos de elementos adicionales en la factura o bv-->
	<xsl:variable name="varMontoDetra">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
		<xsl:if test="cbc:ID='2003'">
			<xsl:value-of select="cbc:PayableAmount"/>
		</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="valPercepcion">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID='2001'">
				<xsl:if test="cbc:PayableAmount!='0'">
					<xsl:value-of select="cbc:PayableAmount"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\xml\20304706211&#x2D;01&#x2D;F001&#x2D;00022140.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20124148970&#x2D;08&#x2D;BB11&#x2D;30000011.xml" srcSchemaRoot="DebitNote" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="166" y="60"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="246" y="20"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/xsl:call&#x2D;template" x="166" y="20"/><block path="html/body/table/tbody/tr[4]/td/xsl:choose" x="86" y="60"/><block path="html/body/table/tbody/tr[4]/td/xsl:choose/=[0]" x="40" y="54"/><block path="html/body/table/tbody/tr[4]/td/xsl:choose/=[1]" x="40" y="82"/><block path="html/body/table/tbody/tr[4]/td/xsl:choose/xsl:otherwise/xsl:if" x="46" y="60"/><block path="html/body/table/tbody/tr[4]/td/xsl:choose/xsl:otherwise/xsl:if[1]" x="206" y="20"/><block path="html/body/table/tbody/tr[5]/td/xsl:call&#x2D;template" x="126" y="60"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->