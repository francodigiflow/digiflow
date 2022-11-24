<?xml version='1.0'?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" 
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" 
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" 
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
	xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
	xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="60%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="top" width="40%">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru">
		<p>
		<table cellSpacing="2" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td width="54%" align="center">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td width="100%">
									<xsl:variable name="Valida_Fecha_Emision"><xsl:call-template name="Fecha_emision"/></xsl:variable>
										<!--MAYOR IGUAL-->
										<xsl:if test="$Valida_Fecha_Emision &gt;'20220710'"><img src="logo_Ardiles.jpg"/></xsl:if>
										<!--MENOR-->
										<xsl:if test="$Valida_Fecha_Emision &lt;= '20220710'"><img src="logo_Ardiles_20220710.jpg"/></xsl:if>
									</td>
								</tr>
								<tr>
									<td width="100%">
										<font color="#000000" size="3" face="Arial,Helvetica,sans-serif">
											<br/>DISTRIBUCIÓN FERRETERA A NIVEL NACIONAL
										</font>
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										</font>			
									</td>
								</tr>
								<tr>
									<td width="100%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<br/>
											<br/>Av. Santa Maria N° 230 - Urb. La Aurora -Ate-Lima-Perú
										</font>
									</td>
									<!--TElefono &#160;&#160;-->
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='02'">
											<xsl:if test="pe:Valor!='-'">
												<tr>
													<td  width="85%">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:if test="pe:Codigo='02'">
																	<xsl:value-of select="pe:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:if test="pe1:Codigo='02'">
																<xsl:value-of select="pe1:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																	<xsl:if test="pe2:Codigo='02'">
																	<xsl:value-of select="pe2:Valor"/>
																	</xsl:if>
															</xsl:for-each>
														</font>
													</td>
												</tr>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='02'">
											<xsl:if test="pe1:Valor!='-'">
												<tr>
													<td  width="85%">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:if test="pe:Codigo='02'">
																	<xsl:value-of select="pe:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:if test="pe1:Codigo='02'">
																	<xsl:value-of select="pe1:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
															<xsl:if test="pe2:Codigo='02'">
																<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>
														</font>
													</td>
												</tr>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='02'">
											<xsl:if test="pe2:Valor!='-'">
												<tr>
													<td  width="85%">
														<font face="Arial, Helvetica, sans-serif" size="2">
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:if test="pe:Codigo='02'">
																	<xsl:value-of select="pe:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:if test="pe1:Codigo='02'">
																<xsl:value-of select="pe1:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
															<xsl:if test="pe2:Codigo='02'">
																<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>
														</font>
													</td>
												</tr>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<!--email-->
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='03'">
											<xsl:if test="pe:Valor!='-'">
												<tr>
													<td  width="85%" >
														<font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:if test="pe:Codigo='03'">
																	<xsl:value-of select="pe:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:if test="pe1:Codigo='03'">
																	<xsl:value-of select="pe1:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																	<xsl:if test="pe2:Codigo='03'">
																<xsl:value-of select="pe2:Valor"/>
																	</xsl:if>
															</xsl:for-each>
														</font>
													</td>
												</tr>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='03'">
											<xsl:if test="pe1:Valor!='-'">
												<tr>
													<td  width="85%">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:if test="pe:Codigo='03'">
																	<xsl:value-of select="pe:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:if test="pe1:Codigo='03'">
																	<xsl:value-of select="pe1:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
															<xsl:if test="pe2:Codigo='03'">
															<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>
														</font>
													</td>
												</tr>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='03'">
											<xsl:if test="pe2:Valor!='-'">
												<tr>
													<td  width="85%">
														<font face="Arial, Helvetica, sans-serif" size="2">
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:if test="pe:Codigo='03'">
																	<xsl:value-of select="pe:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:if test="pe1:Codigo='03'">
																	<xsl:value-of select="pe1:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
															<xsl:if test="pe2:Codigo='03'">
																<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>
														</font>
													</td>
												</tr>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<!--web-->
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='04'">
											<xsl:if test="pe:Valor!='-'">
												<tr>
													<td  width="85%" >
														<font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:if test="pe:Codigo='04'">
																	<xsl:value-of select="pe:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:if test="pe1:Codigo='04'">
																	<xsl:value-of select="pe1:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																	<xsl:if test="pe2:Codigo='04'">
																<xsl:value-of select="pe2:Valor"/>
																	</xsl:if>
															</xsl:for-each>
														</font>
													</td>
												</tr>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='04'">
											<xsl:if test="pe1:Valor!='-'">
												<tr>
													<td  width="85%">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:if test="pe:Codigo='04'">
																	<xsl:value-of select="pe:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:if test="pe1:Codigo='04'">
																	<xsl:value-of select="pe1:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
															<xsl:if test="pe2:Codigo='04'">
																<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>
														</font>
													</td>
												</tr>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='04'">
											<xsl:if test="pe2:Valor!='-'">
												<tr>
													<td  width="85%">
														<font face="Arial, Helvetica, sans-serif" size="2">
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:if test="pe:Codigo='04'">
																	<xsl:value-of select="pe:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																<xsl:if test="pe1:Codigo='04'">
																	<xsl:value-of select="pe1:Valor"/>
																</xsl:if>
															</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
															<xsl:if test="pe2:Codigo='04'">
																<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>
														</font>
													</td>
												</tr>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
								
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</p>
</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tbody>
			<tr>
				<td>
					<table borderColor="#000000" cellSpacing="0" cellPadding="5" width="100%" border="1">
						<tbody>
							<tr>
								<td vAlign="top" width="100%" align="center">
									<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
										<strong>R.U.C.: 
											<xsl:value-of select="format-number($v_RucEmisor,'###########','pen')"/>
											<br/>
											<br/>
											<xsl:call-template name="tipodocu"/>
											<br/>
											<xsl:call-template name="NFolio"/>
										</strong>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center">
					<font size="1" face="Arial, Helvetica, sans-serif"><!-- <strong>SUNAT- CENTRO LIMA</strong> --></font>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

	<xsl:template name="tipodocu">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">FACTURA ELECTRÓNICA</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRÓNICA</font>
			</xsl:when>
			<xsl:otherwise>
		        <xsl:if test="/pe1:CreditNote">
					<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">NOTA DE CRÉDITO ELECTRÓNICA</font>
				</xsl:if>
		        <xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">NOTA DE DÉBITO ELECTRÓNICA</font>
				</xsl:if>
	      </xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="NFolio">
		<br/>Nº 
		<!--<xsl:value-of select="/pe:Invoice/cbc:ID"/>-->
		<!--<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>-->
		<xsl:if test="/pe:Invoice">
		<xsl:value-of select="substring-before(/pe:Invoice/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe:Invoice/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
		<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe1:CreditNote/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
		<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe2:DebitNote/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<!--<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>-->
		<br/>
	</xsl:template>

	<xsl:template match="/">
		<html><head></head>
			<body/>
		</html>
	</xsl:template>
	
	<xsl:template name="Fecha_emision">
		<xsl:if test="/pe:Invoice">
			<xsl:variable name="date1" select="substring-before(/pe:Invoice/cbc:IssueDate,'-')"/>
			<xsl:variable name="date2" select="substring-before(substring-after(/pe:Invoice/cbc:IssueDate,'-'),'-')"/>
			<xsl:variable name="date3" select="substring-after(substring-after(/pe:Invoice/cbc:IssueDate,'-'),'-')"/>
			<xsl:value-of select="concat($date1,$date2,$date3)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
			<xsl:variable name="date1" select="substring-before(/pe1:CreditNote/cbc:IssueDate,'-')"/>
			<xsl:variable name="date2" select="substring-before(substring-after(/pe1:CreditNote/cbc:IssueDate,'-'),'-')"/>
			<xsl:variable name="date3" select="substring-after(substring-after(/pe1:CreditNote/cbc:IssueDate,'-'),'-')"/>
			<xsl:value-of select="concat($date1,$date2,$date3)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
			<xsl:variable name="date1" select="substring-before(/pe2:DebitNote/cbc:IssueDate,'-')"/>
			<xsl:variable name="date2" select="substring-before(substring-after(/pe2:DebitNote/cbc:IssueDate,'-'),'-')"/>
			<xsl:variable name="date3" select="substring-after(substring-after(/pe2:DebitNote/cbc:IssueDate,'-'),'-')"/>
			<xsl:value-of select="concat($date1,$date2,$date3)"/>
		</xsl:if>
	</xsl:template>

	

</xsl:stylesheet>
