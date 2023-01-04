<?xml version="1.0" encoding="iso-8859-1"?>
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
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<!--<tr bgcolor="#FE9A2E">-->
			<tr bgcolor="#ffffff">
				<td>
					<!-- <table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0"> -->
					
					<table style="border: 1px solid black; border-collapse: collapse;" rules="groups" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
					<thead style="border: 1px solid black;">			
						
						<tr bgcolor="#9D9D9D">
							
							<td width="6%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif"  color="#FFFFFF" size="2">
									<strong>N°</strong>
								</font>
							</td>
							<td width="8%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" color="#FFFFFF" size="2">
									<strong>Código</strong>
								</font>
							</td>
							<td width="32%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" color="#FFFFFF" size="2">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" color="#FFFFFF" size="2">
									<strong>Und.</strong>
								</font>	
							</td>
							<td width="8%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" color="#FFFFFF" size="2">
									<strong>Cantidad</strong>
								</font>
							</td>
							<td width="10%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" color="#FFFFFF" size="2">
									<strong>V. Unitario</strong>
								</font>
							</td>
							<td width="10%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" color="#FFFFFF" size="2">
									<strong>P. Unitario</strong>
								</font>
							</td>
							<td width="8%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" color="#FFFFFF" size="2">
									<strong>Descuento (Afecto al IGV)</strong>
								</font>	
							</td>
							<td width="10%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" color="#FFFFFF" size="2">
									<strong>Valor de Venta</strong>
								</font>
							</td>
						</tr>					
					
			</thead>
			
			<tbody>  
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
						<xsl:variable name="Descuento">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:Amount">
										<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
									</xsl:if>
						</xsl:variable>
						<tr>
							<!--NÚMERO-->
								<td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>&#xA0;
									</font>
								</td>
								<!--CODIGO-->
								<td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>&#xA0;
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="60%" align="left" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>&#xA0;
									</font>
								</td>
								<!--CANTIDAD-->
								<td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:InvoicedQuantity"/>
									</font>
								</td>
								<!--V. UNITARIO-->
								<td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
									</font>
								</td>
								<!--P.VENTA-->
								<td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
									</font>
								</td>
								<!--DESCUENTO-->
								<td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number($Descuento,'###,###,##0.00','pen')"/>&#xA0;									
									</font>
								</td>
								<!--IMPORTE TOTAL-->
								<td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;
									</font>
								</td>
						
						</tr>
						</xsl:for-each>
										
						
						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:variable name="Descuento">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:Amount">
										<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>&#xA0;
									</xsl:if>
							</xsl:variable>
							<tr>
							<!--NÚMERO-->
								<td width="6%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>&#xA0;
									</font>
								</td>
								<!--CODIGO-->
								<td width="8%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>&#xA0;
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="32%" align="left" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<!--UNIDAD-->
								<td width="8%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>&#xA0;
									</font>
								</td>
								<!--CANTIDAD-->
								<td width="8%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:InvoicedQuantity"/>
									</font>
								</td>
								<!--V. UNITARIO-->
								<td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
									</font>
								</td>
								<!--P.VENTA-->
								<td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
									</font>
								</td>
								<!--DESCUENTO-->
								<td width="8%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number($Descuento,'###,###,##0.00','pen')"/>&#xA0;									
									</font>
								</td>
								<!--IMPORTE TOTAL-->
								<td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;
									</font>
								</td>
						
							</tr>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:variable name="Descuento">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:Amount">
										<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
									</xsl:if>
							</xsl:variable>
							
							<tr>
							<!--NÚMERO-->
								<td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>&#xA0;
									</font>
								</td>
								<!--CODIGO-->
								<td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>&#xA0;
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="60%" align="left" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<!--UNIDAD-->
								<td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>&#xA0;
									</font>
								</td>
								<!--CANTIDAD-->
								<td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:InvoicedQuantity"/>
									</font>
								</td>
								<!--V. UNITARIO-->
								<td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
									</font>
								</td>
								<!--P.VENTA-->
								<td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
									</font>
								</td>
								<!--DESCUENTO-->
								<td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number($Descuento,'###,###,##0.00','pen')"/>&#xA0;									
									</font>
								</td>
								<!--IMPORTE TOTAL-->
								<td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;
									</font>
								</td>
						
							</tr>
						</xsl:for-each>
						<!-- <xsl:call-template name="lineaBl"> -->
							<!-- <xsl:with-param name="cont" select="$numColBl"/> -->
							<!-- <table> -->
								<!-- <tr> -->
									<!-- <td align="center" valign="top" width="15%"> -->
										<!-- <font face="Arial, Helvetica, sans-serif" size="2"> -->
											<!-- <xsl:call-template name="total"/> -->
										<!-- </font> -->
									<!-- </td> -->
								<!-- </tr> -->
							<!-- </table> -->
						<!-- </xsl:call-template> -->
						<!-- <xsl:call-template name="lineaBl"> -->
						<!-- <xsl:with-param name="cont" select="$numColBl"/> -->
						<!-- </xsl:call-template> -->
						</tbody>
					</table>

				</td>
			</tr>
		</table>
	</xsl:template>
	
	<!-- <xsl:template name="lineaBl"> -->
		<!-- <xsl:param name="cont"/> -->
		<!-- <xsl:if test="$cont&gt;0"> -->
			
			<!-- <xsl:if test="/pe1:CreditNote/cac:CreditNoteLine"> -->
			<!-- <tr> -->
				<!-- <td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="60%" align="left" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font>								 -->
				<!-- </td> -->
			<!-- </tr> -->
			
			<!-- </xsl:if> -->
			
			<!-- <xsl:if test="/pe2:DebitNote/cac:DebitNoteLine"> -->
			<!-- <tr> -->
				<!-- <td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="60%" align="left" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font>								 -->
				<!-- </td> -->
			<!-- </tr> -->
			<!-- </xsl:if> -->
			<!-- <tr> -->
				<!-- <td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="60%" align="left" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="center" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font> -->
				<!-- </td> -->
				<!-- <td width="10%" align="right" vAlign="top" style="border:solid 1px black;border-top:none;border-bottom:none"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2">&#160; -->
					<!-- </font>								 -->
				<!-- </td> -->
			<!-- </tr> -->
			<!-- <xsl:call-template name="lineaBl"> -->
				<!-- <xsl:with-param name="cont" select="$cont - 1"/> -->
			<!-- </xsl:call-template> -->
		<!-- </xsl:if> -->
	<!-- </xsl:template> -->

	<xsl:template name="unidad_medida">
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
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'GLL'">UGL</xsl:when>
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
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'NIU'">UND</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'SA'">SAC</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'PQ'">PAQ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'BLL'">BB6</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'GN'">GG6</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'C62'">C62</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'PK'">PAQ</xsl:when>
				<xsl:otherwise>UN</xsl:otherwise>
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


	<xsl:template name="RetourneValAdItem">
		<xsl:param name="NumLinea"/>
		<xsl:param name="NumAd"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<!-- xsl:if test="pe:Codigo=concat($NumLinea,$NumAd)" -->
			    <xsl:if test="pe:Linea=$NumLinea and pe:Codigo=$NumAd">
				    <xsl:value-of select="pe:Valor"/>
		        </xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
			<xsl:if test="pe1:Codigo=$NumLinea">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo=$NumLinea">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>


</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\20107695584&#x2D;03&#x2D;B136&#x2D;00000022.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->