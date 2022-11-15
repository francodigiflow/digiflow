<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" exclude-result-prefixes="cac cbc ccts ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Detalle">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" class="redondeo">
					<xsl:if test="/pe:Invoice!=''">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Código</strong>
								</font>
							</td>
							<td width="28%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Und.</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cant.</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Cat</strong><br/>
								</font>
							</td>
							<td width="6%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>% Dscto</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Dscto</strong><br/>
								</font>
							</td>
							
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Uni.</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Total</strong><br/>
								</font>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="/pe1:CreditNote!=''">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Código</strong>
								</font>
							</td>
							<td width="44%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Und.</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cant.</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Cat</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Uni.</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Total</strong><br/>
								</font>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="/pe2:DebitNote!=''">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Código</strong>
								</font>
							</td>
							<td width="44%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Und.</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cant.</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Cat</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Uni.</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Total</strong><br/>
								</font>
							</td>
						</tr>
					</xsl:if>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'26'">
								<tr><!--CODIGO-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="28%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--UNIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>
										</font>
									</td>
									<!--P. CATALOGO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--%DESCUENTO-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional3">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="3"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional3"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--MONTO DESCUENTO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
										</font>
									</td>
									<!--PRECIO UNITARIO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="format-number($ValorAdicional2,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'26'  ">
								<tr><!--CODIGO-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--UNIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0','pen')"/>
										</font>
									</td>
									<!--P. CATALOGO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--PRECIO UNITARIO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(//cac:CreditNoteLine/cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="format-number($ValorAdicional2,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'26'  ">
								<tr><!--CODIGO-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--UNIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0','pen')"/>
										</font>
									</td>
									<!--P. CATALOGO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--PRECIO UNITARIO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(//cac:DebitNoteLine/cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="format-number($ValorAdicional2,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<tr>
									<!-- ITEM -->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--CODIGO-->
									<td width="28%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="8%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<!--Descripcion-->
											
										</font>
									</td>
									<!--Piezas.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											</font>
									</td>
									<!--UNIDAD-->
									<td width="6%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--PRECIO UNIT.-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									
									<!--VALOR VTA.-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">

											</font>
									</td>
									<!--VALOR VTA.-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">

											</font>
									</td>
								</tr>
						<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>
					</table>
				</td>
			</tr>
			<xsl:if test="$TotItems &lt;'26'">
			<tr>
				<td>
					<table border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" style="border:none;border-top:solid 3px black;border-bottom:none">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									TOTAL: 
								</font>
							</td>
							<td width="28%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='10'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='10'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='10'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									SUBTOTALES
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='11'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='11'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='11'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='12'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='12'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='12'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='13'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='13'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='13'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='14'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='14'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='14'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='15'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='15'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='15'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</xsl:if>
		</table>
	</xsl:template>
	
	<xsl:template name="Detalle2">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" class="redondeo">
					<xsl:if test="/pe:Invoice!=''">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Código</strong>
								</font>
							</td>
							<td width="28%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Und.</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cant.</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Cat</strong><br/>
								</font>
							</td>
							<td width="6%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>% Dscto</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Dscto</strong><br/>
								</font>
							</td>
							
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Uni.</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Total</strong><br/>
								</font>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="/pe1:CreditNote!=''">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Código</strong>
								</font>
							</td>
							<td width="44%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Und.</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cant.</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Cat</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Uni.</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Total</strong><br/>
								</font>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="/pe2:DebitNote!=''">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Código</strong>
								</font>
							</td>
							<td width="44%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Und.</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cant.</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Cat</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Uni.</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Total</strong><br/>
								</font>
							</td>
						</tr>
					</xsl:if>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt;'25' and cbc:ID &lt;'51'  ">
								<tr><!--CODIGO-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="28%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--UNIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>
										</font>
									</td>
									<!--P. CATALOGO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--%DESCUENTO-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional3">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="3"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional3"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--MONTO DESCUENTO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
										</font>
									</td>
									<!--PRECIO UNITARIO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="format-number($ValorAdicional2,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:if test="cbc:ID &gt;'25' and cbc:ID &lt;'51'  ">
								<tr><!--CODIGO-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--UNIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>
										</font>
									</td>
									<!--P. CATALOGO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--PRECIO UNITARIO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(//cac:InvoiceLine/cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="format-number($ValorAdicional2,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt;'25' and cbc:ID &lt;'51'  ">
								<tr><!--CODIGO-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--UNIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>
										</font>
									</td>
									<!--P. CATALOGO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--PRECIO UNITARIO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(//cac:InvoiceLine/cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="format-number($ValorAdicional2,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<tr>
									<!-- ITEM -->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--CODIGO-->
									<td width="28%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="8%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<!--Descripcion-->
											
										</font>
									</td>
									<!--Piezas.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											</font>
									</td>
									<!--UNIDAD-->
									<td width="6%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--PRECIO UNIT.-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									
									<!--VALOR VTA.-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">

											</font>
									</td>
									<!--VALOR VTA.-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">

											</font>
									</td>
								</tr>
						<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColB2"/></xsl:call-template>
					</table>
				</td>
			</tr>
			
		<xsl:if test="$TotItems &lt;'51'">
			<tr>
				<td>
					<table border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" style="border:none;border-top:solid 3px black;border-bottom:none">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									TOTAL: 
								</font>
							</td>
							<td width="28%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='10'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='10'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='10'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									SUBTOTALES
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='11'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='11'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='11'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='12'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='12'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='12'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='13'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='13'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='13'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='14'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='14'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='14'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='15'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='15'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='15'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</xsl:if>
		
		</table>
	</xsl:template>
	
		<xsl:template name="Detalle3">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" class="redondeo">
					<xsl:if test="/pe:Invoice!=''">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Código</strong>
								</font>
							</td>
							<td width="28%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Und.</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cant.</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Cat</strong><br/>
								</font>
							</td>
							<td width="6%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>% Dscto</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Dscto</strong><br/>
								</font>
							</td>
							
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Uni.</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Total</strong><br/>
								</font>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="/pe1:CreditNote!=''">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Código</strong>
								</font>
							</td>
							<td width="44%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Und.</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cant.</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Cat</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Uni.</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Total</strong><br/>
								</font>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="/pe2:DebitNote!=''">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Código</strong>
								</font>
							</td>
							<td width="44%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Und.</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cant.</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Cat</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Uni.</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Total</strong><br/>
								</font>
							</td>
						</tr>
					</xsl:if>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt;'50' and cbc:ID &lt;'76'  ">
								<tr><!--CODIGO-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="28%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--UNIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>
										</font>
									</td>
									<!--P. CATALOGO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--%DESCUENTO-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional3">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="3"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional3"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--MONTO DESCUENTO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
										</font>
									</td>
									<!--PRECIO UNITARIO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="format-number($ValorAdicional2,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:if test="cbc:ID &gt;'50' and cbc:ID &lt;'76'  ">
								<tr><!--CODIGO-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--UNIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>
										</font>
									</td>
									<!--P. CATALOGO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--PRECIO UNITARIO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(//cac:InvoiceLine/cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="format-number($ValorAdicional2,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt;'50' and cbc:ID &lt;'76'  ">
								<tr><!--CODIGO-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--UNIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>
										</font>
									</td>
									<!--P. CATALOGO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--PRECIO UNITARIO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(//cac:InvoiceLine/cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="format-number($ValorAdicional2,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<tr>
									<!-- ITEM -->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--CODIGO-->
									<td width="28%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="8%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<!--Descripcion-->
											
										</font>
									</td>
									<!--Piezas.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											</font>
									</td>
									<!--UNIDAD-->
									<td width="6%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--PRECIO UNIT.-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									
									<!--VALOR VTA.-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">

											</font>
									</td>
									<!--VALOR VTA.-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">

											</font>
									</td>
								</tr>
						<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColB3"/></xsl:call-template>
					</table>
				</td>
			</tr>
			
			<xsl:if test="$TotItems &lt;'76'">
			<tr>
				<td>
					<table border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" style="border:none;border-top:solid 3px black;border-bottom:none">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									TOTAL: 
								</font>
							</td>
							<td width="28%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='10'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='10'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='10'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									SUBTOTALES
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='11'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='11'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='11'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='12'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='12'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='12'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='13'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='13'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='13'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='14'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='14'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='14'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='15'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='15'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='15'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</xsl:if>
			
		</table>
	</xsl:template>
	
		<xsl:template name="Detalle4">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" class="redondeo">
					<xsl:if test="/pe:Invoice!=''">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Código</strong>
								</font>
							</td>
							<td width="28%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Und.</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cant.</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Cat</strong><br/>
								</font>
							</td>
							<td width="6%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>% Dscto</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Dscto</strong><br/>
								</font>
							</td>
							
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Uni.</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Total</strong><br/>
								</font>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="/pe1:CreditNote!=''">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Código</strong>
								</font>
							</td>
							<td width="44%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Und.</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cant.</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Cat</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Uni.</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Total</strong><br/>
								</font>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="/pe2:DebitNote!=''">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Código</strong>
								</font>
							</td>
							<td width="44%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Und.</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cant.</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Cat</strong><br/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Uni.</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Precio Total</strong><br/>
								</font>
							</td>
						</tr>
					</xsl:if>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:if test="cbc:ID &gt;'75' and cbc:ID &lt;'101'  ">
								<tr><!--CODIGO-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="28%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--UNIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>
										</font>
									</td>
									<!--P. CATALOGO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--%DESCUENTO-->
									<td width="6%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional3">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="3"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional3"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--MONTO DESCUENTO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
										</font>
									</td>
									<!--PRECIO UNITARIO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(//cac:InvoiceLine/cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="format-number($ValorAdicional2,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:if test="cbc:ID &gt;'75' and cbc:ID &lt;'101'  ">
								<tr><!--CODIGO-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--UNIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>
										</font>
									</td>
									<!--P. CATALOGO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--PRECIO UNITARIO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(//cac:InvoiceLine/cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="format-number($ValorAdicional2,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt;'75' and cbc:ID &lt;'101'  ">
								<tr><!--CODIGO-->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<!--UNIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="8%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>
										</font>
									</td>
									<!--P. CATALOGO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="1"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional1">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="$ValorAdicional1"/>
												</font>
											</xsl:if>
										</font>
									</td>
									<!--PRECIO UNITARIO-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(//cac:InvoiceLine/cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="ValorAdicional2">
												<xsl:call-template name="RetourneValAdItem">

													<xsl:with-param name="NumAd" select="2"/>
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$ValorAdicional2">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="format-number($ValorAdicional2,'###,###,##0.00','pen')"/>
												</font>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						
						<tr>
									<!-- ITEM -->
									<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--CODIGO-->
									<td width="28%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--DESCRIPCION-->
									<td width="8%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;
											<!--Descripcion-->
											
										</font>
									</td>
									<!--Piezas.-->
									<td width="8%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--CANTIDAD-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											</font>
									</td>
									<!--UNIDAD-->
									<td width="6%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									<!--PRECIO UNIT.-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">
											
										</font>
									</td>
									
									<!--VALOR VTA.-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">

											</font>
									</td>
									<!--VALOR VTA.-->
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="0.5">

											</font>
									</td>
								</tr>
						<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColB4"/></xsl:call-template>
					</table>
				</td>
			</tr>

			<xsl:if test="$TotItems &lt;'101'">
			<tr>
				<td>
					<table border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" style="border:none;border-top:solid 3px black;border-bottom:none">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									TOTAL: 
								</font>
							</td>
							<td width="28%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='10'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='10'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='10'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									SUBTOTALES
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='11'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='11'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='11'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='12'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='12'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='12'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='13'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='13'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='13'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='14'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='14'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='14'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='15'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='15'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='15'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</xsl:if>
		
		</table>
	</xsl:template>
	
	
	<xsl:template name="RetourneValAd">
		<xsl:param name="NumAd"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$NumAd">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$NumAd">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$NumAd">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="RetourneValAdItem">
		<xsl:param name="NumLinea"/>
		<xsl:param name="NumAd"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<!--<xsl:if test="pe:Codigo = concat($NumLinea, $NumAd)">-->
            <xsl:if test="pe:Codigo = $NumAd and pe:Linea = $NumLinea">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
			<xsl:if test="pe1:Codigo = $NumAd and pe1:Linea = $NumLinea">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo = $NumAd and pe2:Linea = $NumLinea">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="28%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="8%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="6%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.5">&#xA0;</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>


	<xsl:template name="unidad_medida">
		<xsl:choose>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='C62'">C/U</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='C62'">PZA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PR'">PAR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PK'">PQT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='ST'">HOJ</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='RO'">ROL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='JR'">FCO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PD'">BLK</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SET'">JGO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR'">L</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BX'">CJA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='AV'">CAP</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FOT'">PIE</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE'">TM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='ST'">PGO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BG'">BLS</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CA'">LTA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='STN'">TON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGS'">KGS</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTK'">P2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR'">LBS</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NPT'">EQP</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GRM'">G</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='5B'">LOT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='C62'">C/U</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='C62'">PZA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PR'">PAR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PK'">PQT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='ST'">HOJ</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='RO'">ROL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='JR'">FCO</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PD'">BLK</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='SET'">JGO</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LTR'">L</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BX'">CJA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='AV'">CAP</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='FOT'">PIE</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='TNE'">TM</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='ST'">PGO</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BG'">BLS</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='CA'">LTA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='STN'">TON</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KGS'">KGS</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='FTK'">P2</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LBR'">LBS</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='NPT'">EQP</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='GRM'">G</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='5B'">LOT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='C62'">C/U</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='C62'">PZA</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PR'">PAR</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PK'">PQT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='ST'">HOJ</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='RO'">ROL</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='JR'">FCO</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PD'">BLK</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='SET'">JGO</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='LTR'">L</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='BX'">CJA</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='AV'">CAP</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='FOT'">PIE</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='TNE'">TM</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='ST'">PGO</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='BG'">BLS</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='CA'">LTA</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='STN'">TON</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='KGS'">KGS</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='FTK'">P2</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='LBR'">LBS</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='NPT'">EQP</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='GRM'">G</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='5B'">LOT</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\M&amp;M Trading\DESARROLLO RI\ri_mm_lvm\20386222771&#x2D;01&#x2D;F001&#x2D;00025673.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bGenerateByteCode" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="xsltVersion" value="2.0"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->