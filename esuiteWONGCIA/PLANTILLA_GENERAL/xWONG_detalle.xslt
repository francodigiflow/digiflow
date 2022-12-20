<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
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
	
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes" />

	<xsl:template name="DetallesEncabezado">
		<xsl:param name="titems"/>
		<xsl:param name="tpaginas"/>
		<xsl:param name="pagina"/>
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<!--<tr bgcolor="#FE9A2E">-->
			<tr bgcolor="silver">
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="silver" cellpadding="4" cellspacing="0">
						<tr>
							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>N°</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1" color="#000000">
									<strong>COD. ART.</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANT.</strong>
								</font>
							</td>
							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>U.M.</strong>
								</font>
							</td>
							<td width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCION</strong>
								</font>
							</td>
							
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PREC. UNIT.</strong>
								</font>	
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR UNIT.</strong>
								</font>	
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>V. VENTA</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<xsl:variable name="min">
				<xsl:choose>
					<xsl:when test="$pagina = '1'">0</xsl:when>
					<xsl:when test="$pagina = '2'">48</xsl:when>
					<xsl:when test="$pagina = '3'">96</xsl:when>
					<xsl:when test="$pagina = '4'">144</xsl:when>
					<xsl:when test="$pagina = '5'">192</xsl:when>
					<xsl:when test="$pagina = '6'">240</xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="max">
				<xsl:choose>					
					<xsl:when test="$pagina = '1'">49</xsl:when>
					<xsl:when test="$pagina = '2'">97</xsl:when>
					<xsl:when test="$pagina = '3'">145</xsl:when>
					<xsl:when test="$pagina = '4'">193</xsl:when>
					<xsl:when test="$pagina = '5'">241</xsl:when>
					<xsl:when test="$pagina = '6'">289</xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<tr>
				<td>
					<!--<table rules="cols" border="1" width="100%" bordercolor="silver" cellpadding="3" cellspacing="0">-->
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="3" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
						<xsl:if test="cbc:ID &gt; $min and cbc:ID &lt; $max ">
							<tr>
								<!--ITEM-->
								<td width="5%" align="center" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<!--CODIGO-->
								<td width="10%" align="center" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<!--CANTIDAD-->
								<td width="10%" align="center" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:InvoicedQuantity"/>
									</font>
								</td>
								<!--UNIDAD-->
								<td width="5%" align="center" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="40%" align="left" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
										<xsl:value-of select="cac:Item/cbc:Description"/>										
									</font>
								</td>																
								<!--PREC. CON IGV-->
								<td width="10%" align="right" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0.00'">
											<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
												<xsl:if test=" cbc:PriceTypeCode='01'">
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										<!--TRANSFERENCIA GRATUITA-->
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount='0.00'">
											<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
												<xsl:if test=" cbc:PriceTypeCode='02'">
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</font>
								</td>
								<!--PRECIO SIN IGV-->
								<td width="10%" align="right" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
									</font>
								</td>
								<!--IMPORTE TOTAL-->
								<td width="10%" align="right" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/> &#xA0;
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount/cbc:PriceAmount,'###,###,###.00','pen')"/>-->
									</font>
								</td>
							</tr>
						</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
						<xsl:if test="cbc:ID &gt; $min and cbc:ID &lt; $max ">
							<tr>
								<!--ITEM-->
								<td width="5%" align="center" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<!--CODIGO-->
								<td width="10%" align="center" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<!--CANTIDAD-->
								<td width="10%" align="center" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:CreditedQuantity"/>
									</font>
								</td>
								<!--UNIDAD-->
								<td width="5%" align="center" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="40%" align="left" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
										<!--<xsl:value-of select="cac:Item/cbc:Description"/>-->
										<xsl:value-of select="cac:Item/cbc:Description"/>										
									</font>
								</td>
								
								<!--P. CON IGV-->
								<td width="10%" align="right" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0.00'">
											<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
												<xsl:if test=" cbc:PriceTypeCode='01'">
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										<!--TRANSFERENCIA GRATUITA-->
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount='0.00'">
											<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
												<xsl:if test=" cbc:PriceTypeCode='02'">
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</font>
								</td>
								<!--v.SIN IGV-->
								<td width="10%" align="right" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;
									</font>
								</td>
								<!--IMPORTE TOTAL-->
								<td width="10%" align="right" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/> &#xA0;
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount/cbc:PriceAmount,'###,###,###.00','pen')"/>-->
									</font>
								</td>
							</tr>
						</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
						<xsl:if test="cbc:ID &gt; $min and cbc:ID &lt; $max ">
							<tr>
								<!--ITEM-->
								<td width="5%" align="center" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<!--CODIGO-->
								<td width="10%" align="center" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<!--CANTIDAD-->
								<td width="10%" align="center" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:DebitedQuantity"/>
									</font>
								</td>
								<!--UNIDAD-->
								<td width="5%" align="center" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="40%" align="left" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;
										<!--<xsl:value-of select="cac:Item/cbc:Description"/>-->
										<xsl:value-of select="cac:Item/cbc:Description"/>										
									</font>
								</td>
								
								
								<!--P.CON INGV-->
								<td width="10%" align="right" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0.00'">-->
											<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
												<xsl:if test=" cbc:PriceTypeCode='01'">
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;
												</xsl:if>
											</xsl:for-each>
										<!--</xsl:if>-->
										<!--TRANSFERENCIA GRATUITA-->
										<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount='0.00'">
											<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
												<xsl:if test=" cbc:PriceTypeCode='02'">
													<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</font>
								</td>
								<!--v.sin IGV-->
								<td width="10%" align="right" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;
									</font>
								</td>
								<!--IMPORTE TOTAL-->
								<td width="10%" align="right" vAlign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/> &#xA0;
										<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount/cbc:PriceAmount,'###,###,###.00','pen')"/>-->
									</font>
								</td>
							</tr>
						</xsl:if>
						</xsl:for-each>
						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr>
				<!--ITEM-->
				<td width="5" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<!--CODIGO-->
				<td width="10" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<!--CANTIDAD-->
				<td width="10" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<!--UNIDAD-->
				<td width="5" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<!--DESCRIPCION-->
				<td width="40%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<!--PREC. CON IGV-->
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<!--V. SIN INGV-->
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
				<!--TOTAL-->
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">&#160;
					</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!--<xsl:template name="DetallesEncabezado">
		<table width="100%" cellpadding="1" cellspacing="0" border="0" bordercolor="#000000" rules="cols" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
			<tr>
				<td>
					<table width="100%" cellpadding="2" cellspacing="0" border="1" bordercolor="#000000" rules="cols" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
					<tr bgcolor="silver">
					<td align="center" width="6%">
						<Strong>ITEM</Strong>
					</td>
					<td align="center" width="10%">
						<Strong>CODIGO</Strong>
					</td>
					<td align="center" width="5%">
						<Strong>CANT.</Strong>
					</td>
					<td align="center" width="5%">
						<Strong>UNID.</Strong>
					</td>
					<td align="center" width="38%">
						<Strong>DESCRIPCIÓN</Strong>
					</td>
					<td align="center" width="8%">
						<Strong>VALOR UNITARIO</Strong>
					</td>
					<td align="center" width="8%">
						<Strong>PRECIO UNITARIO</Strong>
					</td>
					<td align="center" width="9%">
						<Strong>PRECIO TOTAL</Strong>
					</td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0" bordercolor="#000000" rules="cols" style="font-family :Arial,Helvetica,sans-serif;font-size:2px;color:#000000">
					<tr>
						<td colspan="6">
							&#160;
						</td>					
					</tr>
				</table>
			</td>
			</tr>
				DETALLE DE FACTURA Y BOLETA
			<tr>
				<td>
				<table width="100%" cellpadding="4" cellspacing="0" border="1" bordercolor="#000000" rules="cols" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
				
					<tr>
						ITEM
						<td valign="top" align="center" width="6%">
								<xsl:value-of select="cbc:ID"/>
						</td>
						CODIGO
						<td valign="top" align="center" width="10%">
								<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</td>
						CANTIDAD
						<td valign="top" align="center" width="5%">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>
						</td>
						UNIDAD
						<td valign="top" align="center" width="5%">
								<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:InvoicedQuantity/@unitCode"/>
								<xsl:call-template name="unidad_medida" />
						</td>
						DESCRIPCIÓN
						<td width="38%">
								<xsl:value-of select="cac:Item/cbc:Description"/>
								<xsl:variable name="Bolivariano">
									<xsl:call-template name="Dato9">
										<xsl:with-param name="var" select="cbc:ID" />
									</xsl:call-template>
								</xsl:variable>
								<xsl:call-template name="SubDato9Bolivariano">
									<xsl:with-param name="var" select="$Bolivariano" />
								</xsl:call-template>				
						</td>					
						VALOR. Unit
						<td valign="top" align="right" width="8%">
															<xsl:choose>
									<xsl:when test="string-length(substring-after(cac:Price/cbc:PriceAmount, '.')) = 3">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after(cac:Price/cbc:PriceAmount, '.')) = 4">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.0000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after(cac:Price/cbc:PriceAmount, '.')) = 5">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.00000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after(cac:Price/cbc:PriceAmount, '.')) = 6">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.000000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after(cac:Price/cbc:PriceAmount, '.')) = 7">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.0000000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after(cac:Price/cbc:PriceAmount, '.')) = 8">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.00000000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after(cac:Price/cbc:PriceAmount, '.')) = 9">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.000000000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after(cac:Price/cbc:PriceAmount, '.')) = 10">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.0000000000', 'pen')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.00', 'pen')"/>
									</xsl:otherwise>
								</xsl:choose>
						</td>
						PRECIO UNITARIO 
						<td valign="top" align="right" width="8%">								
							<xsl:variable name="CTSValor1">
									<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
										<xsl:if test="cbc:PriceTypeCode = '02'">
											<xsl:value-of select="cbc:PriceAmount" />
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>

								<xsl:variable name="CTSValorFinal">
									<xsl:if test="$CTSValor1 = ''">
										<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount" />
									</xsl:if>
									<xsl:if test="$CTSValor1 != ''">
										<xsl:value-of select="$CTSValor1" />
									</xsl:if>
								</xsl:variable>

								<xsl:choose>
									<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 3">
										<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 4">
										<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 5">
										<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 6">
										<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 7">
										<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 8">
										<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 9">
										<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000000', 'pen')"/>
									</xsl:when>
									<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 10">
										<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000000', 'pen')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>
									</xsl:otherwise>
								</xsl:choose>
						</td>					
						Importe
						<td valign="top" align="right" width="9%">
								<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')"/>
						</td>
					</tr>
					<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template>
					<xsl:choose>
						<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">
							<xsl:call-template name="lineaBl1"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">
							<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="/pe1:CreditNote">
							<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>
						</xsl:when>
					</xsl:choose>					
					<xsl:choose>
						<xsl:when test="/pe2:DebitNote">
							<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</table>
				</td>
			</tr>
		</table>
	</xsl:template>-->

	<!--<xsl:template name="lineaBl">
		<xsl:param name="cont" />
		<xsl:if test="$cont &gt; 0">
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>-->

	<!--<xsl:template name="lineaBl1">
		<xsl:param name="cont" />
		<xsl:if test="$cont &gt; 0">
			<tr>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
				<td>&#160;</td>
			</tr>
			<xsl:call-template name="lineaBl1">
				<xsl:with-param name="cont" select="$cont - 1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>-->
	
	<!--<xsl:template name="RetourneValAdItem">
		<xsl:param name="NumLinea"/>
		<xsl:param name="NumAd"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
			<xsl:if test="pe1:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>-->

	<xsl:template name="unidad_medida">
		<xsl:if test="/pe:Invoice">
			<xsl:choose>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'RO'">Rol</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'MTR'">Mt</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'C62'">Pz</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'KT'">Kit</xsl:when>				
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'CMT'">Cm</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'BX'">Caj</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'PK'">Pqt</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'BG'">Bol</xsl:when>
				<xsl:otherwise>Und</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
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
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'GLL'">UGL</xsl:when>
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
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'NIU'">UND</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'SA'">SAC</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'PQ'">PAQ</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'BLL'">BB6</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'GN'">GG6</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'C62'">C62</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'PK'">PAQ</xsl:when>
				<xsl:otherwise>UN</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
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
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'GLL'">UGL</xsl:when>
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
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'NIU'">UND</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'SA'">SAC</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'PQ'">PAQ</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'BLL'">BB6</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'GN'">GG6</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'C62'">C62</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'PK'">PAQ</xsl:when>
				<xsl:otherwise>UN</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="Dato7">
		<xsl:param name="var" />
		<xsl:variable name="varvar">
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
				<xsl:if test="pe:Codigo = '07'"><xsl:value-of select="pe:Valor" /></xsl:if>
			</xsl:for-each>
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
				<xsl:if test="pe1:Codigo = '07'"><xsl:value-of select="pe1:Valor" /></xsl:if>
			</xsl:for-each>
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
				<xsl:if test="pe2:Codigo = '07'"><xsl:value-of select="pe2:Valor" /></xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="linea1">
			<xsl:value-of select="substring-before($varvar, '|')" />
		</xsl:variable>
		<xsl:variable name="resto1">
			<xsl:value-of select="substring-after($varvar, '|')" />
		</xsl:variable>
		<xsl:variable name="linea2">
			<xsl:value-of select="substring-before($resto1, '|')" />
		</xsl:variable>
		<xsl:variable name="resto2">
			<xsl:value-of select="substring-after($resto1, '|')" />
		</xsl:variable>
		<xsl:variable name="linea3">
			<xsl:value-of select="substring-before($resto2, '|')" />
		</xsl:variable>
		<xsl:variable name="resto3">
			<xsl:value-of select="substring-after($resto2, '|')" />
		</xsl:variable>
		<xsl:variable name="linea4">
			<xsl:value-of select="substring-before($resto3, '|')" />
		</xsl:variable>
		<xsl:variable name="resto4">
			<xsl:value-of select="substring-after($resto3, '|')" />
		</xsl:variable>
		<xsl:variable name="linea5">
			<xsl:value-of select="substring-before($resto4, '|')" />
		</xsl:variable>
		<xsl:variable name="resto5">
			<xsl:value-of select="substring-after($resto4, '|')" />
		</xsl:variable>
		<xsl:variable name="linea6">
			<xsl:value-of select="substring-before($resto5, '|')" />
		</xsl:variable>
		<xsl:variable name="resto6">
			<xsl:value-of select="substring-after($resto5, '|')" />
		</xsl:variable>
		<xsl:variable name="linea7">
			<xsl:value-of select="substring-before($resto6, '|')" />
		</xsl:variable>
		<xsl:variable name="resto7">
			<xsl:value-of select="substring-after($resto6, '|')" />
		</xsl:variable>
		<xsl:variable name="linea8">
			<xsl:value-of select="substring-before($resto7, '|')" />
		</xsl:variable>
		<xsl:variable name="resto8">
			<xsl:value-of select="substring-after($resto7, '|')" />
		</xsl:variable>
		<xsl:variable name="linea9">
			<xsl:value-of select="substring-before($resto8, '|')" />
		</xsl:variable>
		<xsl:variable name="resto9">
			<xsl:value-of select="substring-after($resto8, '|')" />
		</xsl:variable>
		<xsl:variable name="linea10">
			<xsl:value-of select="substring-before($resto9, '|')" />
		</xsl:variable>
		<xsl:variable name="resto10">
			<xsl:value-of select="substring-after($resto9, '|')" />
		</xsl:variable>
		<xsl:variable name="linea11">
			<xsl:value-of select="substring-before($resto10, '|')" />
		</xsl:variable>
		<xsl:variable name="resto11">
			<xsl:value-of select="substring-after($resto10, '|')" />
		</xsl:variable>
		<xsl:variable name="linea12">
			<xsl:value-of select="substring-before($resto11, '|')" />
		</xsl:variable>
		<xsl:variable name="resto12">
			<xsl:value-of select="substring-after($resto11, '|')" />
		</xsl:variable>
		<xsl:variable name="linea13">
			<xsl:value-of select="substring-before($resto12, '|')" />
		</xsl:variable>
		<xsl:variable name="resto13">
			<xsl:value-of select="substring-after($resto12, '|')" />
		</xsl:variable>
		<xsl:variable name="linea14">
			<xsl:value-of select="substring-before($resto13, '|')" />
		</xsl:variable>
		<xsl:variable name="resto14">
			<xsl:value-of select="substring-after($resto13, '|')" />
		</xsl:variable>
		<xsl:variable name="linea15">
			<xsl:value-of select="substring-before($resto14, '|')" />
		</xsl:variable>
		<xsl:variable name="resto15">
			<xsl:value-of select="substring-after($resto14, '|')" />
		</xsl:variable>
		<xsl:variable name="linea16">
			<xsl:value-of select="substring-before($resto15, '|')" />
		</xsl:variable>
		<xsl:variable name="resto16">
			<xsl:value-of select="substring-after($resto15, '|')" />
		</xsl:variable>
		<xsl:variable name="linea17">
			<xsl:value-of select="substring-before($resto16, '|')" />
		</xsl:variable>
		<xsl:variable name="resto17">
			<xsl:value-of select="substring-after($resto16, '|')" />
		</xsl:variable>
		<xsl:variable name="linea18">
			<xsl:value-of select="substring-before($resto17, '|')" />
		</xsl:variable>
		<xsl:variable name="resto18">
			<xsl:value-of select="substring-after($resto17, '|')" />
		</xsl:variable>
		<xsl:variable name="linea19">
			<xsl:value-of select="substring-before($resto18, '|')" />
		</xsl:variable>
		<xsl:variable name="resto19">
			<xsl:value-of select="substring-after($resto18, '|')" />
		</xsl:variable>
		<xsl:variable name="linea20">
			<xsl:value-of select="substring-before($resto19, '|')" />
		</xsl:variable>
		<xsl:variable name="resto20">
			<xsl:value-of select="substring-after($resto19, '|')" />
		</xsl:variable>
		<xsl:variable name="linea21">
			<xsl:value-of select="substring-before($resto20, '|')" />
		</xsl:variable>
		<xsl:variable name="resto21">
			<xsl:value-of select="substring-after($resto20, '|')" />
		</xsl:variable>
		<xsl:variable name="linea22">
			<xsl:value-of select="substring-before($resto21, '|')" />
		</xsl:variable>
		<xsl:variable name="resto22">
			<xsl:value-of select="substring-after($resto21, '|')" />
		</xsl:variable>
		<xsl:variable name="linea23">
			<xsl:value-of select="substring-before($resto22, '|')" />
		</xsl:variable>
		<xsl:variable name="resto23">
			<xsl:value-of select="substring-after($resto22, '|')" />
		</xsl:variable>
		<xsl:variable name="linea24">
			<xsl:value-of select="substring-before($resto23, '|')" />
		</xsl:variable>
		<xsl:variable name="resto24">
			<xsl:value-of select="substring-after($resto23, '|')" />
		</xsl:variable>
		<xsl:variable name="linea25">
			<xsl:value-of select="substring-before($resto24, '|')" />
		</xsl:variable>
		<xsl:variable name="resto25">
			<xsl:value-of select="substring-after($resto24, '|')" />
		</xsl:variable>
		<xsl:variable name="linea26">
			<xsl:value-of select="substring-before($resto25, '|')" />
		</xsl:variable>
		<xsl:variable name="resto26">
			<xsl:value-of select="substring-after($resto25, '|')" />
		</xsl:variable>
		<xsl:variable name="linea27">
			<xsl:value-of select="substring-before($resto26, '|')" />
		</xsl:variable>
		<xsl:variable name="resto27">
			<xsl:value-of select="substring-after($resto26, '|')" />
		</xsl:variable>
		<xsl:variable name="linea28">
			<xsl:value-of select="substring-before($resto27, '|')" />
		</xsl:variable>
		<xsl:variable name="resto28">
			<xsl:value-of select="substring-after($resto27, '|')" />
		</xsl:variable>
		<xsl:variable name="linea29">
			<xsl:value-of select="substring-before($resto28, '|')" />
		</xsl:variable>
		<xsl:variable name="resto29">
			<xsl:value-of select="substring-after($resto28, '|')" />
		</xsl:variable>
		<xsl:variable name="linea30">
			<xsl:value-of select="substring-before($resto29, '|')" />
		</xsl:variable>
		<xsl:variable name="resto30">
			<xsl:value-of select="substring-after($resto29, '|')" />
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$var = '1'"><xsl:value-of select="$linea1" /></xsl:when>
			<xsl:when test="$var = '2'"><xsl:value-of select="$linea2" /></xsl:when>
			<xsl:when test="$var = '3'"><xsl:value-of select="$linea3" /></xsl:when>
			<xsl:when test="$var = '4'"><xsl:value-of select="$linea4" /></xsl:when>
			<xsl:when test="$var = '5'"><xsl:value-of select="$linea5" /></xsl:when>
			<xsl:when test="$var = '6'"><xsl:value-of select="$linea6" /></xsl:when>
			<xsl:when test="$var = '7'"><xsl:value-of select="$linea7" /></xsl:when>
			<xsl:when test="$var = '8'"><xsl:value-of select="$linea8" /></xsl:when>
			<xsl:when test="$var = '9'"><xsl:value-of select="$linea9" /></xsl:when>
			<xsl:when test="$var = '10'"><xsl:value-of select="$linea10" /></xsl:when>
			<xsl:when test="$var = '11'"><xsl:value-of select="$linea11" /></xsl:when>
			<xsl:when test="$var = '12'"><xsl:value-of select="$linea12" /></xsl:when>
			<xsl:when test="$var = '13'"><xsl:value-of select="$linea13" /></xsl:when>
			<xsl:when test="$var = '14'"><xsl:value-of select="$linea14" /></xsl:when>
			<xsl:when test="$var = '15'"><xsl:value-of select="$linea15" /></xsl:when>
			<xsl:when test="$var = '16'"><xsl:value-of select="$linea16" /></xsl:when>
			<xsl:when test="$var = '17'"><xsl:value-of select="$linea17" /></xsl:when>
			<xsl:when test="$var = '18'"><xsl:value-of select="$linea18" /></xsl:when>
			<xsl:when test="$var = '19'"><xsl:value-of select="$linea19" /></xsl:when>
			<xsl:when test="$var = '20'"><xsl:value-of select="$linea20" /></xsl:when>
			<xsl:when test="$var = '21'"><xsl:value-of select="$linea21" /></xsl:when>
			<xsl:when test="$var = '22'"><xsl:value-of select="$linea22" /></xsl:when>
			<xsl:when test="$var = '23'"><xsl:value-of select="$linea23" /></xsl:when>
			<xsl:when test="$var = '24'"><xsl:value-of select="$linea24" /></xsl:when>
			<xsl:when test="$var = '25'"><xsl:value-of select="$linea25" /></xsl:when>
			<xsl:when test="$var = '26'"><xsl:value-of select="$linea26" /></xsl:when>
			<xsl:when test="$var = '27'"><xsl:value-of select="$linea27" /></xsl:when>
			<xsl:when test="$var = '28'"><xsl:value-of select="$linea28" /></xsl:when>
			<xsl:when test="$var = '29'"><xsl:value-of select="$linea29" /></xsl:when>
			<xsl:when test="$var = '30'"><xsl:value-of select="$linea30" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="SubDato7Bolivariano">
		<xsl:param name="var" />
		<xsl:if test="string-length(substring-before($var, '[]')) = 0">
			<xsl:value-of select="$var" />
		</xsl:if>
		<xsl:if test="string-length(substring-before($var, '[]')) > 0">
			<xsl:value-of select="substring-before($var, '[]')" />
			<br/>
		</xsl:if>
		<xsl:if test="string-length(substring-after($var, '[]')) > 0">
			<xsl:call-template name="SubDato7Bolivariano">
				<xsl:with-param name="var" select="substring-after($var, '[]')" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Dato8">
		<xsl:param name="var" />
		<xsl:variable name="varvar">
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
				<xsl:if test="pe:Codigo = '15'"><xsl:value-of select="pe:Valor" /></xsl:if>
			</xsl:for-each>
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
				<xsl:if test="pe1:Codigo = '15'"><xsl:value-of select="pe1:Valor" /></xsl:if>
			</xsl:for-each>
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
				<xsl:if test="pe2:Codigo = '15'"><xsl:value-of select="pe2:Valor" /></xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="linea1">
			<xsl:value-of select="substring-before($varvar, '|')" />
		</xsl:variable>
		<xsl:variable name="resto1">
			<xsl:value-of select="substring-after($varvar, '|')" />
		</xsl:variable>
		<xsl:variable name="linea2">
			<xsl:value-of select="substring-before($resto1, '|')" />
		</xsl:variable>
		<xsl:variable name="resto2">
			<xsl:value-of select="substring-after($resto1, '|')" />
		</xsl:variable>
		<xsl:variable name="linea3">
			<xsl:value-of select="substring-before($resto2, '|')" />
		</xsl:variable>
		<xsl:variable name="resto3">
			<xsl:value-of select="substring-after($resto2, '|')" />
		</xsl:variable>
		<xsl:variable name="linea4">
			<xsl:value-of select="substring-before($resto3, '|')" />
		</xsl:variable>
		<xsl:variable name="resto4">
			<xsl:value-of select="substring-after($resto3, '|')" />
		</xsl:variable>
		<xsl:variable name="linea5">
			<xsl:value-of select="substring-before($resto4, '|')" />
		</xsl:variable>
		<xsl:variable name="resto5">
			<xsl:value-of select="substring-after($resto4, '|')" />
		</xsl:variable>
		<xsl:variable name="linea6">
			<xsl:value-of select="substring-before($resto5, '|')" />
		</xsl:variable>
		<xsl:variable name="resto6">
			<xsl:value-of select="substring-after($resto5, '|')" />
		</xsl:variable>
		<xsl:variable name="linea7">
			<xsl:value-of select="substring-before($resto6, '|')" />
		</xsl:variable>
		<xsl:variable name="resto7">
			<xsl:value-of select="substring-after($resto6, '|')" />
		</xsl:variable>
		<xsl:variable name="linea8">
			<xsl:value-of select="substring-before($resto7, '|')" />
		</xsl:variable>
		<xsl:variable name="resto8">
			<xsl:value-of select="substring-after($resto7, '|')" />
		</xsl:variable>
		<xsl:variable name="linea9">
			<xsl:value-of select="substring-before($resto8, '|')" />
		</xsl:variable>
		<xsl:variable name="resto9">
			<xsl:value-of select="substring-after($resto8, '|')" />
		</xsl:variable>
		<xsl:variable name="linea10">
			<xsl:value-of select="substring-before($resto9, '|')" />
		</xsl:variable>
		<xsl:variable name="resto10">
			<xsl:value-of select="substring-after($resto9, '|')" />
		</xsl:variable>
		<xsl:variable name="linea11">
			<xsl:value-of select="substring-before($resto10, '|')" />
		</xsl:variable>
		<xsl:variable name="resto11">
			<xsl:value-of select="substring-after($resto10, '|')" />
		</xsl:variable>
		<xsl:variable name="linea12">
			<xsl:value-of select="substring-before($resto11, '|')" />
		</xsl:variable>
		<xsl:variable name="resto12">
			<xsl:value-of select="substring-after($resto11, '|')" />
		</xsl:variable>
		<xsl:variable name="linea13">
			<xsl:value-of select="substring-before($resto12, '|')" />
		</xsl:variable>
		<xsl:variable name="resto13">
			<xsl:value-of select="substring-after($resto12, '|')" />
		</xsl:variable>
		<xsl:variable name="linea14">
			<xsl:value-of select="substring-before($resto13, '|')" />
		</xsl:variable>
		<xsl:variable name="resto14">
			<xsl:value-of select="substring-after($resto13, '|')" />
		</xsl:variable>
		<xsl:variable name="linea15">
			<xsl:value-of select="substring-before($resto14, '|')" />
		</xsl:variable>
		<xsl:variable name="resto15">
			<xsl:value-of select="substring-after($resto14, '|')" />
		</xsl:variable>
		<xsl:variable name="linea16">
			<xsl:value-of select="substring-before($resto15, '|')" />
		</xsl:variable>
		<xsl:variable name="resto16">
			<xsl:value-of select="substring-after($resto15, '|')" />
		</xsl:variable>
		<xsl:variable name="linea17">
			<xsl:value-of select="substring-before($resto16, '|')" />
		</xsl:variable>
		<xsl:variable name="resto17">
			<xsl:value-of select="substring-after($resto16, '|')" />
		</xsl:variable>
		<xsl:variable name="linea18">
			<xsl:value-of select="substring-before($resto17, '|')" />
		</xsl:variable>
		<xsl:variable name="resto18">
			<xsl:value-of select="substring-after($resto17, '|')" />
		</xsl:variable>
		<xsl:variable name="linea19">
			<xsl:value-of select="substring-before($resto18, '|')" />
		</xsl:variable>
		<xsl:variable name="resto19">
			<xsl:value-of select="substring-after($resto18, '|')" />
		</xsl:variable>
		<xsl:variable name="linea20">
			<xsl:value-of select="substring-before($resto19, '|')" />
		</xsl:variable>
		<xsl:variable name="resto20">
			<xsl:value-of select="substring-after($resto19, '|')" />
		</xsl:variable>
		<xsl:variable name="linea21">
			<xsl:value-of select="substring-before($resto20, '|')" />
		</xsl:variable>
		<xsl:variable name="resto21">
			<xsl:value-of select="substring-after($resto20, '|')" />
		</xsl:variable>
		<xsl:variable name="linea22">
			<xsl:value-of select="substring-before($resto21, '|')" />
		</xsl:variable>
		<xsl:variable name="resto22">
			<xsl:value-of select="substring-after($resto21, '|')" />
		</xsl:variable>
		<xsl:variable name="linea23">
			<xsl:value-of select="substring-before($resto22, '|')" />
		</xsl:variable>
		<xsl:variable name="resto23">
			<xsl:value-of select="substring-after($resto22, '|')" />
		</xsl:variable>
		<xsl:variable name="linea24">
			<xsl:value-of select="substring-before($resto23, '|')" />
		</xsl:variable>
		<xsl:variable name="resto24">
			<xsl:value-of select="substring-after($resto23, '|')" />
		</xsl:variable>
		<xsl:variable name="linea25">
			<xsl:value-of select="substring-before($resto24, '|')" />
		</xsl:variable>
		<xsl:variable name="resto25">
			<xsl:value-of select="substring-after($resto24, '|')" />
		</xsl:variable>
		<xsl:variable name="linea26">
			<xsl:value-of select="substring-before($resto25, '|')" />
		</xsl:variable>
		<xsl:variable name="resto26">
			<xsl:value-of select="substring-after($resto25, '|')" />
		</xsl:variable>
		<xsl:variable name="linea27">
			<xsl:value-of select="substring-before($resto26, '|')" />
		</xsl:variable>
		<xsl:variable name="resto27">
			<xsl:value-of select="substring-after($resto26, '|')" />
		</xsl:variable>
		<xsl:variable name="linea28">
			<xsl:value-of select="substring-before($resto27, '|')" />
		</xsl:variable>
		<xsl:variable name="resto28">
			<xsl:value-of select="substring-after($resto27, '|')" />
		</xsl:variable>
		<xsl:variable name="linea29">
			<xsl:value-of select="substring-before($resto28, '|')" />
		</xsl:variable>
		<xsl:variable name="resto29">
			<xsl:value-of select="substring-after($resto28, '|')" />
		</xsl:variable>
		<xsl:variable name="linea30">
			<xsl:value-of select="substring-before($resto29, '|')" />
		</xsl:variable>
		<xsl:variable name="resto30">
			<xsl:value-of select="substring-after($resto29, '|')" />
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$var = '1'"><xsl:value-of select="$linea1" /></xsl:when>
			<xsl:when test="$var = '2'"><xsl:value-of select="$linea2" /></xsl:when>
			<xsl:when test="$var = '3'"><xsl:value-of select="$linea3" /></xsl:when>
			<xsl:when test="$var = '4'"><xsl:value-of select="$linea4" /></xsl:when>
			<xsl:when test="$var = '5'"><xsl:value-of select="$linea5" /></xsl:when>
			<xsl:when test="$var = '6'"><xsl:value-of select="$linea6" /></xsl:when>
			<xsl:when test="$var = '7'"><xsl:value-of select="$linea7" /></xsl:when>
			<xsl:when test="$var = '8'"><xsl:value-of select="$linea8" /></xsl:when>
			<xsl:when test="$var = '9'"><xsl:value-of select="$linea9" /></xsl:when>
			<xsl:when test="$var = '10'"><xsl:value-of select="$linea10" /></xsl:when>
			<xsl:when test="$var = '11'"><xsl:value-of select="$linea11" /></xsl:when>
			<xsl:when test="$var = '12'"><xsl:value-of select="$linea12" /></xsl:when>
			<xsl:when test="$var = '13'"><xsl:value-of select="$linea13" /></xsl:when>
			<xsl:when test="$var = '14'"><xsl:value-of select="$linea14" /></xsl:when>
			<xsl:when test="$var = '15'"><xsl:value-of select="$linea15" /></xsl:when>
			<xsl:when test="$var = '16'"><xsl:value-of select="$linea16" /></xsl:when>
			<xsl:when test="$var = '17'"><xsl:value-of select="$linea17" /></xsl:when>
			<xsl:when test="$var = '18'"><xsl:value-of select="$linea18" /></xsl:when>
			<xsl:when test="$var = '19'"><xsl:value-of select="$linea19" /></xsl:when>
			<xsl:when test="$var = '20'"><xsl:value-of select="$linea20" /></xsl:when>
			<xsl:when test="$var = '21'"><xsl:value-of select="$linea21" /></xsl:when>
			<xsl:when test="$var = '22'"><xsl:value-of select="$linea22" /></xsl:when>
			<xsl:when test="$var = '23'"><xsl:value-of select="$linea23" /></xsl:when>
			<xsl:when test="$var = '24'"><xsl:value-of select="$linea24" /></xsl:when>
			<xsl:when test="$var = '25'"><xsl:value-of select="$linea25" /></xsl:when>
			<xsl:when test="$var = '26'"><xsl:value-of select="$linea26" /></xsl:when>
			<xsl:when test="$var = '27'"><xsl:value-of select="$linea27" /></xsl:when>
			<xsl:when test="$var = '28'"><xsl:value-of select="$linea28" /></xsl:when>
			<xsl:when test="$var = '29'"><xsl:value-of select="$linea29" /></xsl:when>
			<xsl:when test="$var = '30'"><xsl:value-of select="$linea30" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="SubDato8Bolivariano">
		<xsl:param name="var" />
		<xsl:if test="string-length(substring-before($var, '[]')) = 0">
			<xsl:value-of select="$var" />
		</xsl:if>
		<xsl:if test="string-length(substring-before($var, '[]')) > 0">
			<xsl:value-of select="substring-before($var, '[]')" />
			<br/>
		</xsl:if>
		<xsl:if test="string-length(substring-after($var, '[]')) > 0">
			<xsl:call-template name="SubDato8Bolivariano">
				<xsl:with-param name="var" select="substring-after($var, '[]')" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RetourneValAdItem">
		<xsl:param name="NumLinea"/>
		<xsl:param name="NumAd"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
			<xsl:if test="pe1:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\CCL\xml\20101266819&#x2D;01&#x2D;FZ01&#x2D;00000033.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->