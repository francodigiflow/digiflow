<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" 
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
				exclude-result-prefixes="cac cbc ccts ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

<!--##TRAFIGURA##-->
	<xsl:template name="Detalle_T">
		<table border="0" width="99.9%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="0" width="100%" cellpadding="0" cellspacing="0" rules="none">
						<tr bgcolor="#999999">
							<td width="10%" align="center" height="20">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>

							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UNIDAD</strong>
								</font>
							</td>
							
							<td width="50%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR UNIT.</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PRECIO<br/>UNIT.</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR<br/>VENTA</strong>
								</font>
							</td>
							

						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="0" width="100%" cellpadding="0" cellspacing="0" rules="none">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<tr>
								<!--CANTIDAD-->
								<td width="10%" height="14" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ -->
									</font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="50%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>

								<!-- VALOR UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">-->
											
												<!--<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">-->
												
													<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												<!--</xsl:if>-->
											
										<!--</xsl:for-each>-->
									</font>
								</td>
								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>--><!--&#160;-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
								
								
							</tr>
						</xsl:for-each>

<tr>
								<!--CANTIDAD-->
								<td width="10%" height="14" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ -->
									</font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="50%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<br/>
								<xsl:for-each select="//cac:AdditionalDocumentReference">
								<xsl:if test="cbc:ID!='000'">
								DCTO. ANTICIPO: <xsl:value-of select="cbc:ID"/></xsl:if>
								<br/>
							    </xsl:for-each>
									</font>
								</td>

								<!-- VALOR UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										
									</font>
								</td>
								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<br/>
								<xsl:for-each select="//cac:PrepaidPayment">
									- <xsl:value-of select="format-number(cbc:PaidAmount,'###,###,##0.00','pen')"/>
									<br/>
								</xsl:for-each>
									</font>
								</td>
								
								
							</tr>


						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<tr>
								<!--CANTIDAD-->
								<td width="10%" height="14" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>&#160;
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="50%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#160;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								
								<!--VALOR UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
										<!--<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>-->

										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;-->
									</font>
								</td>

								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;-->
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#160;
										</font>
								</td>
								
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<tr>
								<!--CANTIDAD-->
								<td width="10%" height="14" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>&#160;
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="50%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#160;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								
								<!--VALOR UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
										<!--<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.0000','pen')"/>&#160;-->
										</font>
								</td>

								
								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;-->
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#160;
										</font>
								</td>
								
							</tr>
						</xsl:for-each>

						<!-- <xsl:call-template name="lineaBl_T"> -->
							<!-- <xsl:with-param name="cont" select="$T_numColBl"/> -->
							<!-- <table> -->
								<!-- <tr> -->
									<!-- <td align="center" valign="top" width="15%"> -->
										<!-- <font face="Arial, Helvetica, sans-serif" size="1"> -->
											<!-- <xsl:call-template name="total"/> -->
										<!-- </font> -->
									<!-- </td> -->
								<!-- </tr> -->
							<!-- </table> -->
						<!-- </xsl:call-template> -->
						
						<xsl:call-template name="lineaBl_T"><xsl:with-param name="cont" select="$T_numColBl"/></xsl:call-template>
						
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="lineaBl_T">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="50%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl_T">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
<!--##TRAFIGURA##-->

<!--##IMPALA##-->
	<xsl:template name="Detalle_I">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="cols">
						<tr>
							<td width="5%" align="center" height="20">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANT.</strong>
								</font>
							</td>

							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UNID.</strong>
								</font>
							</td>
							
							<td width="42%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD<br/>TOTAL</strong>
								</font>
							</td>
							<td width="14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>TARIFA</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PRECIO<br/>UNITARIO</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR<br/>VENTA</strong>
								</font>
							</td>
							

						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="cols">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<tr>
								<!--CANTIDAD-->
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
								</td>
								<!--UNIDAD-->
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="42%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>

								<!--CANTIDAD TOTAL-->
								<td width="14%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">

									<xsl:if test="cbc:ID='1'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='1'">
												<xsl:variable name="pclinea1"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea1"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='2'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='2'">
												<xsl:variable name="pclinea2"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea2"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='3'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='3'">
												<xsl:variable name="pclinea3"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea3"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='4'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='4'">
												<xsl:variable name="pclinea4"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea4"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='5'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='5'">
												<xsl:variable name="pclinea5"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea5"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='6'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='6'">
												<xsl:variable name="pclinea6"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea6"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='7'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='7'">
												<xsl:variable name="pclinea7"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea7"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='8'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='8'">
												<xsl:variable name="pclinea8"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea8"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='9'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='9'">
												<xsl:variable name="pclinea9"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea9"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='10'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='10'">
												<xsl:variable name="pclinea10"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea10"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='11'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='11'">
												<xsl:variable name="pclinea11"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea11"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='12'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='12'">
												<xsl:variable name="pclinea12"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea12"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='13'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='13'">
												<xsl:variable name="pclinea13"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea13"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='14'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='14'">
												<xsl:variable name="pclinea14"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea14"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='15'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='15'">
												<xsl:variable name="pclinea15"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea15"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='16'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='16'">
												<xsl:variable name="pclinea16"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea16"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='17'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='17'">
												<xsl:variable name="pclinea17"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea17"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='18'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='18'">
												<xsl:variable name="pclinea18"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea18"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='19'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='19'">
												<xsl:variable name="pclinea19"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea19"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='20'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='20'">
												<xsl:variable name="pclinea20"><xsl:value-of select="substring-before(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$pclinea20"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									
									</font>
								</td>

								<!-- TARIFA-->
								<td width="14%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:if test="cbc:ID='1'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
										<xsl:if test="pe:Linea='1'">
											<xsl:variable name="ptlinea1"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
												<xsl:value-of select="$ptlinea1"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='2'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='2'">
												<xsl:variable name="ptlinea2"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea2"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='3'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='3'">
												<xsl:variable name="ptlinea3"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea3"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='4'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='4'">
												<xsl:variable name="ptlinea4"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea4"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='5'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='5'">
												<xsl:variable name="ptlinea5"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea5"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='6'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='6'">
												<xsl:variable name="ptlinea6"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea6"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='7'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='7'">
												<xsl:variable name="ptlinea7"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea7"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='8'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='8'">
												<xsl:variable name="ptlinea8"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea8"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='9'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='9'">
												<xsl:variable name="ptlinea9"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea9"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='10'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='10'">
												<xsl:variable name="ptlinea10"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea10"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='11'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='11'">
												<xsl:variable name="ptlinea11"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea11"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='12'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='12'">
												<xsl:variable name="ptlinea12"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea12"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='13'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='13'">
												<xsl:variable name="ptlinea13"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea13"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='14'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='14'">
												<xsl:variable name="ptlinea14"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea14"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='15'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='15'">
												<xsl:variable name="ptlinea15"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea15"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='16'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='16'">
												<xsl:variable name="ptlinea16"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea16"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='17'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='17'">
												<xsl:variable name="ptlinea17"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea17"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='18'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='18'">
												<xsl:variable name="ptlinea18"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea18"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='19'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='19'">
												<xsl:variable name="ptlinea19"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea19"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='20'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">	
											<xsl:if test="pe:Linea='20'">
												<xsl:variable name="ptlinea20"><xsl:value-of select="substring-after(pe:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$ptlinea20"/>
											</xsl:if>
									</xsl:for-each>
									</xsl:if>
									</font>
								</td>
								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>--><!--&#160;-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
										</font>
								</td>
								
								
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<tr>
								<!--CANTIDAD-->
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>&#160;
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
								</td>
								<!--UNIDAD-->
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="42%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#160;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<!-- CANTIDAD TOTAL-->
								<td width="14%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:if test="cbc:ID='1'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
										<xsl:if test="pe1:Linea='1'">
											<xsl:variable name="p1clinea1"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
												<xsl:value-of select="$p1clinea1"/>
										</xsl:if>
									
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='2'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
										<xsl:if test="pe1:Linea='2'">
											<xsl:variable name="p1clinea2"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
												<xsl:value-of select="$p1clinea2"/>
										</xsl:if>
									
									</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='3'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='3'">
												<xsl:variable name="p1clinea3"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea3"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='4'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='4'">
												<xsl:variable name="p1clinea4"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea4"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='5'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='5'">
												<xsl:variable name="p1clinea5"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea5"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='6'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='6'">
												<xsl:variable name="p1clinea6"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea6"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='7'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='7'">
												<xsl:variable name="p1clinea7"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea7"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='8'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='8'">
												<xsl:variable name="p1clinea8"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea8"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='9'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='9'">
												<xsl:variable name="p1clinea9"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea9"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='10'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='10'">
												<xsl:variable name="p1clinea10"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea10"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='11'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='11'">
												<xsl:variable name="p1clinea11"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea11"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='12'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='12'">
												<xsl:variable name="p1clinea12"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea12"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='13'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='13'">
												<xsl:variable name="p1clinea13"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea13"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='14'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='14'">
												<xsl:variable name="p1clinea14"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea14"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='15'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='15'">
												<xsl:variable name="p1clinea15"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea15"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='16'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='16'">
												<xsl:variable name="p1clinea16"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea16"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='17'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='17'">
												<xsl:variable name="p1clinea17"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea17"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='18'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='18'">
												<xsl:variable name="p1clinea18"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea18"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='19'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='19'">
												<xsl:variable name="p1clinea19"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea19"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='20'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='20'">
												<xsl:variable name="p1clinea20"><xsl:value-of select="substring-before(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1clinea20"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>
									</font>
								</td>
								<!-- TARIFA-->
								<td width="14%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										
									<xsl:if test="cbc:ID='1'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='1'">
												<xsl:variable name="p1tlinea1"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea1"/>
												</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='2'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='2'">
												<xsl:variable name="p1tlinea2"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea2"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='3'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='3'">
												<xsl:variable name="p1tlinea3"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea3"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='4'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='4'">
												<xsl:variable name="p1tlinea4"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea4"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='5'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='5'">
												<xsl:variable name="p1tlinea5"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea5"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='6'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='6'">
												<xsl:variable name="p1tlinea6"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea6"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='7'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='7'">
												<xsl:variable name="p1tlinea7"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea7"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='8'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='8'">
												<xsl:variable name="p1tlinea8"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea8"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='9'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='9'">
												<xsl:variable name="p1tlinea9"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea9"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='10'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='10'">
												<xsl:variable name="p1tlinea10"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea10"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='11'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='11'">
												<xsl:variable name="p1tlinea11"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea11"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='12'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='12'">
												<xsl:variable name="p1tlinea12"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea12"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='13'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='13'">
												<xsl:variable name="p1tlinea13"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea13"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='14'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='14'">
												<xsl:variable name="p1tlinea14"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea14"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='15'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='15'">
												<xsl:variable name="p1tlinea15"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea15"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='16'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='16'">
												<xsl:variable name="p1tlinea16"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea16"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='17'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='17'">
												<xsl:variable name="p1tlinea17"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea17"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='18'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='18'">
												<xsl:variable name="p1tlinea18"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea18"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='19'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='19'">
												<xsl:variable name="p1tlinea19"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea19"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									<xsl:if test="cbc:ID='20'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
									
											<xsl:if test="pe1:Linea='20'">
												<xsl:variable name="p1tlinea20"><xsl:value-of select="substring-after(pe1:Valor,'*')"/></xsl:variable>
													<xsl:value-of select="$p1tlinea20"/>
											</xsl:if>
									
										</xsl:for-each>
									</xsl:if>

									
									</font>
								</td>
								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;-->
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#160;
										</font>
								</td>
								
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<tr>
								<!--CANTIDAD-->
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>&#160;
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
								</td>
								<!--UNIDAD-->
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="42%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#160;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<!--CANTIDAD TOTAL-->
								<td width="14%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="cbc:ID='1'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='1'">
													<xsl:variable name="p2clinea1"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea1"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='2'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='2'">
													<xsl:variable name="p2clinea2"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea2"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='3'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='3'">
													<xsl:variable name="p2clinea3"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea3"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='4'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='4'">
													<xsl:variable name="p2clinea4"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea4"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='5'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='5'">
													<xsl:variable name="p2clinea5"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea5"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='6'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='6'">
													<xsl:variable name="p2clinea6"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea6"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='7'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='7'">
													<xsl:variable name="p2clinea7"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea7"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='8'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='8'">
													<xsl:variable name="p2clinea8"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea8"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='9'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='9'">
													<xsl:variable name="p2clinea9"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea9"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='10'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='10'">
													<xsl:variable name="p2clinea10"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea10"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='11'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='11'">
													<xsl:variable name="p2clinea11"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea11"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='12'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='12'">
													<xsl:variable name="p2clinea12"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea12"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='13'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='13'">
													<xsl:variable name="p2clinea13"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea13"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='14'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='14'">
													<xsl:variable name="p2clinea14"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea14"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='15'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='15'">
													<xsl:variable name="p2clinea15"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea15"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='16'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='16'">
													<xsl:variable name="p2clinea16"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea16"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='17'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='17'">
													<xsl:variable name="p2clinea17"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea17"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='18'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='18'">
													<xsl:variable name="p2clinea18"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea18"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='19'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='19'">
													<xsl:variable name="p2clinea19"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea19"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='20'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='20'">
													<xsl:variable name="p2clinea20"><xsl:value-of select="substring-before(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2clinea20"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</font>
								</td>
								<!-- TARIFA-->
								<td width="14%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="cbc:ID='1'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='1'">
													<xsl:variable name="p2tlinea1"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea1"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='2'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='2'">
													<xsl:variable name="p2tlinea2"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea2"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='3'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='3'">
													<xsl:variable name="p2tlinea3"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea3"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='4'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='4'">
													<xsl:variable name="p2tlinea4"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea4"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='5'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='5'">
													<xsl:variable name="p2tlinea5"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea5"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='6'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='6'">
													<xsl:variable name="p2tlinea6"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea6"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='7'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='7'">
													<xsl:variable name="p2tlinea7"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea7"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='8'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='8'">
													<xsl:variable name="p2tlinea8"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea8"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='9'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='9'">
													<xsl:variable name="p2tlinea9"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea9"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='10'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='10'">
													<xsl:variable name="p2tlinea10"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea10"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='11'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='11'">
													<xsl:variable name="p2tlinea11"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea11"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='12'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='12'">
													<xsl:variable name="p2tlinea12"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea12"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='13'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='13'">
													<xsl:variable name="p2tlinea13"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea13"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='14'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='14'">
													<xsl:variable name="p2tlinea14"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea14"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='15'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='15'">
													<xsl:variable name="p2tlinea15"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea15"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='16'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='16'">
													<xsl:variable name="p2tlinea16"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea16"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='17'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='17'">
													<xsl:variable name="p2tlinea17"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea17"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='18'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='18'">
													<xsl:variable name="p2tlinea18"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea18"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='19'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='19'">
													<xsl:variable name="p2tlinea19"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea19"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>

										<xsl:if test="cbc:ID='20'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">	
												<xsl:if test="pe2:Linea='20'">
													<xsl:variable name="p2tlinea20"><xsl:value-of select="substring-after(pe2:Valor,'*')"/></xsl:variable>
														<xsl:value-of select="$p2tlinea20"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#160;
										</font>
								</td>
								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;-->
									</font>
								</td>
								
							</tr>
						</xsl:for-each>

						<!-- <xsl:call-template name="lineaBl_I"> -->
							<!-- <xsl:with-param name="cont" select="$I_numColBl"/> -->
							<!-- <table> -->
								<!-- <tr> -->
									<!-- <td align="center" valign="top" width="15%"> -->
										<!-- <font face="Arial, Helvetica, sans-serif" size="1"> -->
											<!-- <xsl:call-template name="total"/> -->
										<!-- </font> -->
									<!-- </td> -->
								<!-- </tr> -->
							<!-- </table> -->
						<!-- </xsl:call-template> -->
						<xsl:call-template name="lineaBl_I"><xsl:with-param name="cont" select="$I_numColBl"/></xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="lineaBl_I">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
				<td width="5%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="5%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="42%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="14%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="14%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl_I">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
<!--##IMPALA##-->

<!--##URION##-->
	<xsl:template name="Detalle_U">
		<table border="0" width="99.9%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="0" width="100%" cellpadding="0" cellspacing="0" rules="none">
						<tr bgcolor="#88AAD8">
							<td width="10%" align="center" height="20">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>

							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UNIDAD</strong>
								</font>
							</td>
							
							<td width="50%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR UNIT.</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PRECIO<br/>UNIT.</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR<br/>VENTA</strong>
								</font>
							</td>
							

						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="0" width="100%" cellpadding="0" cellspacing="0" rules="none">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<tr>
								<!--CANTIDAD-->
								<td width="10%" height="14" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ -->
									</font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="50%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>

								<!-- VALOR UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">-->
											
												<!--<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">-->
												
													<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												<!--</xsl:if>-->
											
										<!--</xsl:for-each>-->
									</font>
								</td>
								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>--><!--&#160;-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
								
								
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<tr>
								<!--CANTIDAD-->
								<td width="10%" height="14" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>&#160;
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="50%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#160;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								
								<!--VALOR UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>-->
										
									<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>

									</font>
								</td>

								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;-->
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#160;
										</font>
								</td>
								
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<tr>
								<!--CANTIDAD-->
								<td width="10%" height="14" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>&#160;
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="50%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#160;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								
								<!--VALOR UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										<!--<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.0000','pen')"/>&#160;-->
										</font>
								</td>

								
								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;-->
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#160;
										</font>
								</td>
								
							</tr>
						</xsl:for-each>

						<!-- <xsl:call-template name="lineaBl_U"> -->
							<!-- <xsl:with-param name="cont" select="$T_numColBl"/> -->
							<!-- <table> -->
								<!-- <tr> -->
									<!-- <td align="center" valign="top" width="15%"> -->
										<!-- <font face="Arial, Helvetica, sans-serif" size="1"> -->
											<!-- <xsl:call-template name="total"/> -->
										<!-- </font> -->
									<!-- </td> -->
								<!-- </tr> -->
							<!-- </table> -->
						<!-- </xsl:call-template> -->
						<xsl:call-template name="lineaBl_U"><xsl:with-param name="cont" select="$T_numColBl"/></xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="lineaBl_U">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="50%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl_U">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
<!--##URION##-->


<!--##TRAFIGURA TRADING##-->
	<xsl:template name="Detalle_TT">
		<table border="0" width="99.9%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="0" width="100%" cellpadding="0" cellspacing="0" rules="none">
						<tr bgcolor="#88AAD8">
							<td width="10%" align="center" height="20">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>

							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UNIDAD</strong>
								</font>
							</td>
							
							<td width="50%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR UNIT.</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PRECIO<br/>UNIT.</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR<br/>VENTA</strong>
								</font>
							</td>
							

						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="0" width="100%" cellpadding="0" cellspacing="0" rules="none">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<tr>
								<!--CANTIDAD-->
								<td width="10%" height="14" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ -->
									</font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="50%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cbc:Description"/>
 									
									</font>
								</td>

								<!-- VALOR UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">-->
											
												<!--<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">-->
												
													<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												<!--</xsl:if>-->
											
										<!--</xsl:for-each>-->
									</font>
								</td>
								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>--><!--&#160;-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
								
								
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<tr>
								<!--CANTIDAD-->
								<td width="10%" height="14" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>&#160;
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="50%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#160;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								
								<!--VALOR UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>-->
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
										
									</font>
								</td>

								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;-->
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#160;
										</font>
								</td>
								
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<tr>
								<!--CANTIDAD-->
								<td width="10%" height="14" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>&#160;
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="50%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#160;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								
								<!--VALOR UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
										
										</font>
								</td>

								
								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;-->
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#160;
										</font>
								</td>
								
							</tr>
						</xsl:for-each>

	
						<!-- <xsl:call-template name="lineaBl_TT"> -->
							<!-- <xsl:with-param name="cont" select="$T_numColBl"/> -->
							<!-- <table> -->
								<!-- <tr> -->
									<!-- <td align="center" valign="top" width="15%"> -->
										<!-- <font face="Arial, Helvetica, sans-serif" size="1"> -->
											<!-- <xsl:call-template name="total"/> -->
										<!-- </font> -->
									<!-- </td> -->
								<!-- </tr> -->
							<!-- </table> -->
						<!-- </xsl:call-template> -->
						
						<xsl:call-template name="lineaBl_TT"><xsl:with-param name="cont" select="$T_numColBl"/></xsl:call-template>
						
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="lineaBl_TT">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="50%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl_U">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
<!--##TRAFIGURA TRADING##-->

<!--##TRAFIGURA METALES BÁSICOS##-->
	<xsl:template name="Detalle_TM">
		<table border="0" width="99.9%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="0" width="100%" cellpadding="0" cellspacing="0" rules="none">
						<tr bgcolor="#999999">
							<td width="10%" align="center" height="20">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>

							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UNIDAD</strong>
								</font>
							</td>
							
							<td width="50%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR UNIT.</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PRECIO<br/>UNIT.</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR<br/>VENTA</strong>
								</font>
							</td>
							

						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="0" width="100%" cellpadding="0" cellspacing="0" rules="none">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<tr>
								<!--CANTIDAD-->
								<td width="10%" height="14" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ -->
									</font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="50%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>

								<!-- VALOR UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">-->
											
												<!--<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">-->
												
													<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												<!--</xsl:if>-->
											
										<!--</xsl:for-each>-->
									</font>
								</td>
								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>--><!--&#160;-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
								
								
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<tr>
								<!--CANTIDAD-->
								<td width="10%" height="14" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>&#160;
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="50%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#160;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								
								<!--VALOR UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
									</font>
								</td>

								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;-->
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#160;
										</font>
								</td>
								
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<tr>
								<!--CANTIDAD-->
								<td width="10%" height="14" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>&#160;
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="50%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">&#160;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								
								<!--VALOR UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										<!--<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.0000','pen')"/>&#160;-->
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#160;
										</font>
								</td>

								
								<!--PRECIO UNITARIO-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
											
												<xsl:if test="cbc:PriceTypeCode = $varCodTipoPrecUnit">
												
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>
												
												</xsl:if>
											
										</xsl:for-each>
										<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;-->
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#160;
										</font>
								</td>
								
							</tr>
						</xsl:for-each>

						<!-- <xsl:call-template name="lineaBl_T"> -->
							<!-- <xsl:with-param name="cont" select="$T_numColBl"/> -->
							<!-- <table> -->
								<!-- <tr> -->
									<!-- <td align="center" valign="top" width="15%"> -->
										<!-- <font face="Arial, Helvetica, sans-serif" size="1"> -->
											<!-- <xsl:call-template name="total"/> -->
										<!-- </font> -->
									<!-- </td> -->
								<!-- </tr> -->
							<!-- </table> -->
						<!-- </xsl:call-template> -->
						<xsl:call-template name="lineaBl_T"><xsl:with-param name="cont" select="$T_numColBl"/></xsl:call-template>
						
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="lineaBl_TM">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="50%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl_TM">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
<!--##TRAFIGURA##-->



	<xsl:template name="unidad_medida">

		<xsl:choose>
			<!--FACTURA Y BOLETA-->
			<xsl:when test="cbc:InvoicedQuantity/@unitCode!=''">
				<xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/>
			</xsl:when>
			
			<!--NOTA DE CREDITO-->
			<xsl:when test="cbc:CreditedQuantity/@unitCode!=''">
				<xsl:value-of select="cbc:CreditedQuantity/@unitCode"/>
			</xsl:when>

			<!--NOTA DE DEBITO-->
			<xsl:when test="cbc:DebitedQuantity/@unitCode!=''">
				<xsl:value-of select="cbc:DebitedQuantity/@unitCode"/>
			</xsl:when>
		
		<!--<xsl:choose>-->
			<!--FACTURAS y BOLETAS-->
			<!--<xsl:when test="cbc:InvoicedQuantity/@unitCode='C62'">C/U</xsl:when>
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
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='ZZ'">ZZ</xsl:when>-->

			<!--NOTA DE CREDITO-->
			<!--<xsl:when test="cbc:CreditedQuantity/@unitCode='C62'">C/U</xsl:when>
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
			<xsl:when test="cbc:CreditedQuantity/@unitCode='ZZ'">ZZ</xsl:when>-->

			<!--NOTA DE DEBITO-->
			<!--<xsl:when test="cbc:DebitedQuantity/@unitCode='C62'">C/U</xsl:when>
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
			<xsl:when test="cbc:DebitedQuantity/@unitCode='ZZ'">ZZ</xsl:when>-->

			<!--<xsl:otherwise>UNI</xsl:otherwise>-->
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\XML\20503840121-01-F050-00000012.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->