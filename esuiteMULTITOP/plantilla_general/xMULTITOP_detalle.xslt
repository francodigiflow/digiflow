<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">
	
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes" />
	
	
	<!-- Template encargado de crear y contener las tablas/objetos que componen el sector de Detalle -->
	<xsl:template name="DetallesEncabezadoMultipagina">
		<xsl:param name="titems"/>
		<xsl:param name="tpaginas"/>
		<xsl:param name="pagina"/>
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<!--Primera Fila de la tabla General del Detalle-->
			<tr bgcolor="6083f3" color="white">
				<!--Primera Columna-->
				<td>
					<!--Tabla con encabezados de los detalles-->
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
						<!--Primera Fila-->
						<xsl:if test="/pe:Invoice">
						<tr>
							<!--CANTIDAD DEL PRODUCTO-->
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>LOCAL</strong>
								</font>
							</td>
							<!--Segunda Columna-->
							<!--UNIDAD DE MEDIDA DEL PRODUCTO -->
							<td width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<!--PRECIO UNITARIO DEL PRODUCTO-->
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>U.M.</strong>
								</font>
							</td>
							<!--Primera Columna-->
							<!--CODIGO DEL PRODUCTO O SERVICIO-->
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							
							<!--Setima Columna-->
							<!--PRECIO UNITARIO DEL PRODUCTO-->
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>PRECIO</strong>
								</font>
							</td>
							<!--DSCTO UNITARIO DEL PRODUCTO-->
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>DESCUENTO</strong>
								</font>
							</td>
							
							<!--Novena Columna-->
							<!--PRECIO UNITARIO DEL PRODUCTO-->
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>IMPORTE TOTAL</strong>
								</font>
							</td>
						</tr>
						</xsl:if>
						<xsl:if test="/pe1:CreditNote">
						<tr>
							<!--CANTIDAD DEL PRODUCTO-->
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>LOCAL</strong>
								</font>
							</td>
							<!--Segunda Columna-->
							<!--UNIDAD DE MEDIDA DEL PRODUCTO -->
							<td width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<!--PRECIO UNITARIO DEL PRODUCTO-->
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>U.M.</strong>
								</font>
							</td>
							<!--Primera Columna-->
							<!--CODIGO DEL PRODUCTO O SERVICIO-->
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<!--Setima Columna-->
							<!--PRECIO UNITARIO DEL PRODUCTO-->
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>PRECIO</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>DESCUENTO</strong>
								</font>
							</td>
							<!--Novena Columna-->
							<!--PRECIO UNITARIO DEL PRODUCTO-->
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>IMPORTE TOTAL</strong>
								</font>
							</td>
						</tr>
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
						<tr>
							<!--CANTIDAD DEL PRODUCTO-->
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>LOCAL</strong>
								</font>
							</td>
							<!--Segunda Columna-->
							<!--UNIDAD DE MEDIDA DEL PRODUCTO -->
							<td width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<!--PRECIO UNITARIO DEL PRODUCTO-->
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>U.M.</strong>
								</font>
							</td>
							<!--Primera Columna-->
							<!--CODIGO DEL PRODUCTO O SERVICIO-->
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<!--Setima Columna-->
							<!--PRECIO UNITARIO DEL PRODUCTO-->
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>PRECIO</strong>
								</font>
							</td>
							
							<!--Novena Columna-->
							<!--PRECIO UNITARIO DEL PRODUCTO-->
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2" color="white">
									<strong>IMPORTE TOTAL</strong>
								</font>
							</td>
						</tr>
						</xsl:if>
					</table>
					<!--Final de la tabla de encabezados de los detalles -->
				</td>
			</tr>
			<xsl:variable name="min">
				<xsl:choose>
					<xsl:when test="$pagina = '1'">0</xsl:when>
					<xsl:when test="$pagina = '2'">23</xsl:when>
					<xsl:when test="$pagina = '3'">46</xsl:when>
					<xsl:when test="$pagina = '4'">69</xsl:when>
					<xsl:when test="$pagina = '5'">92</xsl:when>
					<xsl:when test="$pagina = '6'">115</xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="max">
				<xsl:choose>					
					<xsl:when test="$pagina = '1'">24</xsl:when>
					<xsl:when test="$pagina = '2'">47</xsl:when>
					<xsl:when test="$pagina = '3'">70</xsl:when>
					<xsl:when test="$pagina = '4'">93</xsl:when>
					<xsl:when test="$pagina = '5'">116</xsl:when>
					<xsl:when test="$pagina = '6'">139</xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<tr>
				<!--Primera Columna-->
				<td>
					<!--Tabla con cuerpo del detalle -->
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<!--Se valida si es Boleta/Factura o Notas Credito/Debito-->
						<!-- FACTURA O BOLETA -->
						<!--Creacion del area de detalles para Factura y Boleta-->
						<!--Creacion del FOR para imprimir cada linea por cada producto de la Factura o Boleta-->
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<!--De ser Factura/Boleta-->
							<!--Primera Fila-->
							<xsl:if test="cbc:ID &gt; $min and cbc:ID &lt; $max ">
							<xsl:variable name="Descuento">
								<xsl:value-of select="0"/>
								<xsl:for-each select="cac:AllowanceCharge">
								<xsl:if test="cbc:ChargeIndicator = 'false'">
									<xsl:value-of select="cbc:Amount"/>
								</xsl:if>
								</xsl:for-each>
							</xsl:variable>
							<tr>
								<!-- Local -->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="1" />
										</xsl:call-template>	
									</font>
								</td>
								<!--Segunda Columna-->
								<!--Factura/Boleta - Detalle-->
								<td width="40%" align="left" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Description" />									
									</font>
								</td>
								<!--Factura/Boleta - Unidad-->
								<td width="8%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!--<xsl:call-template name="unidad_medida"/>-->
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="2" />
										</xsl:call-template>	
									</font>
								</td>
								<!--Primera Columna-->
								<!--Factura/Boleta - Detalle de Cantidad-->
								<td width="10%" valign="top" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!--<xsl:value-of select="cbc:InvoicedQuantity"/>-->
										<!--<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/> -->
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="6" />
										</xsl:call-template>	
									</font>
								</td>				
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
									<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="5" />
										</xsl:call-template>
									</font>
								</td>

								<!--Factura/Boleta - Descuento-->		
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!--<xsl:value-of select="format-number($Descuento,'###,###,##0.00','pen')"/>-->
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="3" />
										</xsl:call-template>

									</font>
								</td>								<!--Octavo Columna-->
								
								<!--Novena Columna-->
								<!--Factura/Boleta - Valor Venta-->		
								<td width="12%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">


										<!--<xsl:variable name="Gravada_JP">
											<xsl:value-of select="0"/>
											<xsl:value-of select="cbc:LineExtensionAmount"/>
										</xsl:variable>
										
										<xsl:variable name="Gratuita_JP">
											<xsl:value-of select="0"/>
											<xsl:value-of select="cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount"/>
										</xsl:variable>

										
										<xsl:if test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000' or cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9998' or cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
											<xsl:value-of select="format-number($Gravada_JP,'###,###,##0.00','pen')"/>
										</xsl:if>

										<xsl:if test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
												<xsl:value-of select="format-number($Gratuita_JP,'###,###,##0.00','pen')"/>
										</xsl:if>-->
										
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="4" />
										</xsl:call-template>

										
									</font>
								</td>
							</tr>
							</xsl:if>
						</xsl:for-each>
						
						<!-- NOTA DE CRÉDITO -->
						<!--Creacion del area de detalles para Nota de Credito-->
						<!--Creacion del FOR para imprimir cada linea por cada producto de la Nota de Creadito-->
						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<!--De ser Nota de Credito-->
							<!--Primera Fila-->
							<xsl:if test="cbc:ID &gt; $min and cbc:ID &lt; $max ">
							<tr>
								<!-- Local -->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="1" />
										</xsl:call-template>	
									</font>
								</td>
								<!--Descipcion-->
								<td width="40%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Description" />															
									</font>
								</td>
								<!--Unidad-->
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!--<xsl:call-template name="unidad_medida"/>-->
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="2" />
										</xsl:call-template>	
									</font>
								</td>
								<!--Cantidad-->
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">									
										<!--<xsl:value-of select="cbc:CreditedQuantity"/>-->
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="6" />
										</xsl:call-template>
									</font>
								</td>
								<!--Precio Unitario-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
									<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="5" />
										</xsl:call-template>
									</font>
								</td>
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!--<xsl:value-of select="format-number($Descuento,'###,###,##0.00','pen')"/>-->
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="3" />
										</xsl:call-template>

									</font>
								</td>		
								<!--valor de venta-->
								<td width="12%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!--<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>-->
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="4" />
										</xsl:call-template>
									</font>
								</td>
							</tr>
							</xsl:if>
						</xsl:for-each>

						<!-- NOTA DE DEBITO -->
						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:if test="cbc:ID &gt; $min and cbc:ID &lt; $max ">
							<tr>
								
								<!-- Local -->
								<td width="12%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="1" />
										</xsl:call-template>	
									</font>
								</td>
								<!--Descripción-->
								<td width="40%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Description" />

										<xsl:variable name="posicion">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
												<xsl:with-param name="NumAd" select="1"/>
											</xsl:call-template>
										</xsl:variable>

										<xsl:if test="$posicion!=''">																															
											<xsl:variable name="vline1">
												<xsl:call-template name="descripcionline">
												<xsl:with-param name="line" select="$posicion" />
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="vline2">
												<xsl:call-template name="descripcionline2">
												<xsl:with-param name="line" select="$posicion" />
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="vline3">
												<xsl:call-template name="descripcionline3">
												<xsl:with-param name="line" select="$posicion" />
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="vline4">
												<xsl:call-template name="descripcionline4">
												<xsl:with-param name="line" select="$posicion" />
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="vline5">
												<xsl:call-template name="descripcionline5">
												<xsl:with-param name="line" select="$posicion" />
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="vline6">
												<xsl:call-template name="descripcionline6">
												<xsl:with-param name="line" select="$posicion" />
												</xsl:call-template>
											</xsl:variable>
											
											<xsl:if test="$vline1!=''">
												<br/>
												<xsl:value-of select="$vline1"/>
											</xsl:if>

											<xsl:if test="$vline2!=''">
												<br/>
												<xsl:value-of select="$vline2"/>
											</xsl:if>
											<xsl:if test="$vline3!=''">
												<br/>
												<xsl:value-of select="$vline3"/>
											</xsl:if>
											<xsl:if test="$vline4!=''">
												<br/>
												<xsl:value-of select="$vline4"/>
											</xsl:if>
											<xsl:if test="$vline5!=''">
												<br/>
												<xsl:value-of select="$vline5"/>
											</xsl:if>
											<xsl:if test="$vline6!=''">
												<br/>
												<xsl:value-of select="$vline6"/>
											</xsl:if>
																				
										</xsl:if>			
									</font>
								</td>
								<!--Unidad de medida-->
								<td width="12%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!--<xsl:call-template name="unidad_medida" />-->
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="2" />
										</xsl:call-template>	
									</font>
								</td>
								<!--Codigo-->
								<td width="12%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">									
										<!--<xsl:value-of select="cbc:DebitedQuantity"/>-->
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="6" />
										</xsl:call-template>
									</font>
								</td>
								
								<!--Precio Unitario-->
								<td width="12%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>-->
									<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="5" />
										</xsl:call-template>
									</font>
								</td>
								
								<!--valor de venta-->
								<td width="12%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!--<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>-->
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="4" />
										</xsl:call-template>
									</font>
								</td>
							</tr>
							</xsl:if>
						</xsl:for-each>
						

						<!--<xsl:call-template name="lineaB2">
							<xsl:with-param name="cont" select="$numColBl"/>
						</xsl:call-template>-->
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	

	<xsl:template name="lineaB2">
		<xsl:param name="cont" />
		<xsl:if test="$cont&gt;0">
			<xsl:if test="/pe:Invoice">
			<tr>
				<td width="6%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="6%" align="right" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="9%" align="left" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="34%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				
				
				
				<td width="9%" align="right" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="9%" align="right" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="9%" align="right" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="9%" align="right" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="9%" align="right" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
			</tr>
			</xsl:if>
			<xsl:if test="not(/pe:Invoice)">
			<tr>
				<td width="6%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="6%" align="right" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="12%" align="left" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="31%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				
				
				
				<td width="9%" align="right" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="9%" align="right" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				<td width="9%" align="right" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
				
				<td width="9%" align="right" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
			</tr>
			</xsl:if>
			<xsl:call-template name="lineaB2">
				<xsl:with-param name="cont" select="$cont - 1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<!-- Template encargado de devolver la unidad de medida segun el codigo "cbc:InvoicedQuantity/@unitCode" -->
	<xsl:template name="unidad_medida">
		<!--Si se trata de una Factura/Boleta-->
		<xsl:if test="/pe:Invoice">
			<xsl:choose>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'PL'">BAL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'D64'">BLK</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'BG'">BOL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'BO'">BOT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'BX'">CAJ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'CY'">CIL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'CLT'">CL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'CMT'">CM</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'CJ'">CON</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'DLT'">DL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'GLL'">GAL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'GRM'">GR</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'HUR'">HRA</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'KT'">JGO</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'KGM'">KG</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'KWT'">KW</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'LBR'">LB</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'LTR'">LT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MTR'">M</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MTK'">M2</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MTQ'">M3</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MIL'">MIL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'D61'">MIN</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MLT'">ML</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MMT'">MM</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'NPR'">PAR</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'FTK'">PI2</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'FTQ'">PI3</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'PA'">PQT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'INH'">PUL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'NRL'">ROL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'TNE'">TON</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'NIU'">UNI</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'SA'">SAC</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'PQ'">PAQ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MLD'">MILL</xsl:when>
				<xsl:otherwise>NIU</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<!--Si se trata de una Nota de Credito-->
		<xsl:if test="/pe1:CreditNote" >
			<xsl:choose>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'PL'">BAL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'D64'">BLK</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'BG'">BOL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'BO'">BOT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'BX'">CAJ</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'CY'">CIL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'CLT'">CL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'CMT'">CM</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'CJ'">CON</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'DLT'">DL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'GLL'">GAL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'GRM'">GR</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'HUR'">HRA</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'KT'">JGO</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'KGM'">KG</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'KWT'">KW</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'LBR'">LB</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'LTR'">LT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'MTR'">M</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'MTK'">M2</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'MTQ'">M3</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'MIL'">MIL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'D61'">MIN</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'MLT'">ML</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'MMT'">MM</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'NPR'">PAR</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'FTK'">PI2</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'FTQ'">PI3</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'PA'">PQT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'INH'">PUL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'NRL'">ROL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'TNE'">TON</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'NIU'">UNI</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'SA'">SAC</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'PQ'">PAQ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MLD'">MILL</xsl:when>
				<xsl:otherwise>NIU</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<!--Si se trata de una Nota de Debito-->
		<xsl:if test="/pe2:DebitNote">
			<xsl:choose>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'PL'">BAL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'D64'">BLK</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'BG'">BOL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'BO'">BOT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'BX'">CAJ</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'CY'">CIL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'CLT'">CL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'CMT'">CM</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'CJ'">CON</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'DLT'">DL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'GLL'">GAL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'GRM'">GR</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'HUR'">HRA</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'KT'">JGO</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'KGM'">KG</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'KWT'">KW</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'LBR'">LB</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'LTR'">LT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'MTR'">M</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'MTK'">M2</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'MTQ'">M3</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'MIL'">MIL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'D61'">MIN</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'MLT'">ML</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'MMT'">MM</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'NPR'">PAR</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'FTK'">PI2</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'FTQ'">PI3</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'PA'">PQT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'INH'">PUL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'NRL'">ROL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'TNE'">TON</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'NIU'">UNI</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'SA'">SAC</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'PQ'">PAQ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MLD'">MILL</xsl:when>
				<xsl:otherwise>NIU</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="tmpDatosAdicionalesDetalle">
		<xsl:param name="item" />
		<xsl:param name="adicional" />


		<xsl:for-each select="//pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($item, $adicional)">

				<xsl:value-of select="pe:Valor" />

			</xsl:if>
		</xsl:for-each>


		<xsl:for-each select="//pe1:DatosAdicionales/pe1:LineaDetalle">
	

			<xsl:if test="pe1:Codigo = concat($item, $adicional)">


	<xsl:value-of select="pe1:Valor" />

			</xsl:if>
		</xsl:for-each>


		<xsl:for-each select="//pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo = concat($item, $adicional)">
				<xsl:value-of select="pe2:Valor" />
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<!-- Template encargado de recuperar los datos en el tag adicionales para items -->
	<xsl:template name="RetourneValAdItem">
		<!-- Se especifica el numero de linea y adicional para su ubicacion y extraccion -->
		<xsl:param name="NumLinea"/>
		<xsl:param name="NumAd"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe:Valor" />
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
			<xsl:if test="pe1:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe1:Valor" />
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe2:Valor" />
			</xsl:if>
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="descripcionline">		
		<xsl:param name="line"/>
		<xsl:value-of select="substring-before($line, '|')"/>		
	</xsl:template>
	<xsl:template name="descripcionline2">		
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:value-of select="substring-before($line2, '|')"/>		
	</xsl:template>
	<xsl:template name="descripcionline3">
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:variable name="line3" select="substring-after($line2,'|')"/>
		<xsl:value-of select="substring-before($line3, '|')"/>		
	</xsl:template>
	<xsl:template name="descripcionline4">
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:variable name="line3" select="substring-after($line2,'|')"/>
		<xsl:variable name="line4" select="substring-after($line3,'|')"/>
		<xsl:value-of select="substring-before($line4, '|')"/>		
	</xsl:template>
	<xsl:template name="descripcionline5">
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:variable name="line3" select="substring-after($line2,'|')"/>
		<xsl:variable name="line4" select="substring-after($line3,'|')"/>
		<xsl:variable name="line5" select="substring-after($line4,'|')"/>
		<xsl:value-of select="substring-before($line5, '|')"/>		
	</xsl:template>	
	<xsl:template name="descripcionline6">
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:variable name="line3" select="substring-after($line2,'|')"/>
		<xsl:variable name="line4" select="substring-after($line3,'|')"/>
		<xsl:variable name="line5" select="substring-after($line4,'|')"/>
		<xsl:variable name="line6" select="substring-after($line5,'|')"/>
		<xsl:value-of select="substring-before($line6, '|')"/>		
	</xsl:template>	
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20100020361&#x2D;07&#x2D;FF11&#x2D;00000006.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="true"/><advancedProp name="bGenerateByteCode" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="xsltVersion" value="2.0"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->