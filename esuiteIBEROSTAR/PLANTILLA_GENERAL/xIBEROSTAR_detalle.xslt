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
		<table width="100%" cellpadding="0" cellspacing="0" border="0"  style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
			<tr>
				<td>
					
					<table width="100%" cellpadding="5" cellspacing="0" border="1" bordercolor="#FFFFFF" rules="cols" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
					
					<tr bgcolor="#2F4968">
						<td align="center" width="10%" style="color:WHITE">
							<Strong>Cantidad</Strong>
						</td>
						<td align="center" width="10%" style="color:WHITE">
							<Strong>Unidad</Strong>
						</td>
						<td align="center" width="10%" style="color:WHITE">
							<Strong>C�digo</Strong>
						</td>
						<td align="center" width="46%" style="color:WHITE">
							<Strong>Descripci�n</Strong>
						</td>
						<td align="center" width="12%" style="color:WHITE">
							<Strong>Valor unitario</Strong>
						</td>
						<td align="center" width="12%" style="color:WHITE">
							<Strong>Importe</Strong>
						</td>					
					</tr>
					
					</table>
				</td>
			</tr>
			<!--DETALLE DE FACTURA Y BOLETA-->
			<tr>
				<td>
				<table width="100%" cellpadding="4" cellspacing="0" border="0" bordercolor="#9BA0A6"  style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
				<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
					<tr>
						<!--CANTIDAD-->
						<td valign="top" align="center" width="10%">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>					
						</td>
						<!--UNIDAD-->
						<td valign="top" align="center" width="10%">
								<!--<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:InvoicedQuantity/@unitCode"/>-->
							<xsl:call-template name="unidad_medida" />
						</td>
						<!--CODIGO-->
						<td valign="top" align="center" width="10%">
								<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</td>
						<!--DESCRIPCIÓN-->
						<td width="46%">
								<xsl:value-of select="cac:Item/cbc:Description"/>	
						</td>
						<!--VALOR. Unit-->
						<td valign="top" align="right" width="12%">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.00', 'pen')"/>&#160;&#160;
						</td>
						<!--Importe-->
						<td valign="top" align="right" width="12%">
							<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')"/>&#160;&#160;&#160;&#160;
						</td>
					</tr>
				</xsl:for-each>
				
				<!--DETALLE DE NOTA DE CREDITO-->
				<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
					<tr>
						<!--Cantidad-->
						<td valign="top" align="center" width="10%">
								<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.00','pen')"/>								
						</td>
						<!--Unidad Medida-->
						<td valign="top" align="center" width="10%">
								<xsl:call-template name="unidad_medida" />
						</td>
						<!--CODIGO-->
						<td valign="top" align="center" width="10%">
							<!--<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">-->
								<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
							<!--</font>-->
						</td>
						<!--Descripcion-->
						<td width="46%">
							<!-- Detalle descripción-->
							<xsl:value-of select="cac:Item/cbc:Description"/><br/>
						</td>
						<!--Precio Vta. Unit-->
						<td valign="top" align="right" width="12%">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.00', 'pen')"/>&#160;&#160;
						</td>
						<!--Importe-->
						<td valign="top" align="right" width="12%">
							<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')"/>&#160;&#160;&#160;&#160;
						</td>		
					</tr>
				</xsl:for-each>
				<!--DETALLE DE NOTA DE DEBITO-->
				<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
					<tr>
						<!--Cantidad-->
						<td valign="top" align="center" width="10%">
								<xsl:value-of select="format-number(cbc:DebitedQuantity, '###,###,##0.00', 'pen')"/>								
						</td>
						<!--Unidad Medida-->
						<td valign="top" align="center" width="10%">
							<xsl:call-template name="unidad_medida" />
						</td>
						<!--Codigo-->
						<td valign="top" align="center" width="10%">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</td>
						<!--Descripcion-->
						<td width="46%">
							<xsl:value-of select="cac:Item/cbc:Description"/>
<!--								<xsl:call-template name="SubDato7Bolivariano">
									<xsl:with-param name="var" select="$Bolivariano" />
								</xsl:call-template>-->
						</td>
						<!--Precio Vta. Unit-->
						<td valign="top" align="right" width="12%">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.00', 'pen')"/>&#160;&#160;
						</td>
						<!--Importe-->
						<td valign="top" align="right" width="12%">
								<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')"/>&#160;&#160;&#160;&#160;
						</td>
					</tr>
				</xsl:for-each>
					
					<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>
				</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			
			<xsl:if test="/pe1:CreditNote/cac:CreditNoteLine">
			<tr>
				<td valign="top" align="center" width="10%">
							<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--UNIDAD-->
						<td valign="top" align="center" width="10%">
								<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--CODIGO-->
						<td valign="top" align="center" width="10%">
								<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--DESCRIPCIÓN-->
						<td width="46%">
								<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--VALOR. Unit-->
						<td valign="top" align="right" width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--Importe-->
						<td valign="top" align="right" width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
			</tr>
			</xsl:if>
			
			<xsl:if test="/pe2:DebitNote/cac:DebitNoteLine">
			<tr>
				<td valign="top" align="center" width="10%">
							<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--UNIDAD-->
						<td valign="top" align="center" width="10%">
								<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--CODIGO-->
						<td valign="top" align="center" width="10%">
								<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--DESCRIPCIÓN-->
						<td width="46%">
								<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--VALOR. Unit-->
						<td valign="top" align="right" width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--Importe-->
						<td valign="top" align="right" width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
			</tr>
			</xsl:if>
			
			<tr>
						<td valign="top" align="center" width="10%">
							<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--UNIDAD-->
						<td valign="top" align="center" width="10%">
								<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--CODIGO-->
						<td valign="top" align="center" width="10%">
								<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--DESCRIPCIÓN-->
						<td width="46%">
								<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--VALOR. Unit-->
						<td valign="top" align="right" width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
						<!--Importe-->
						<td valign="top" align="right" width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
			</tr>
	
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	

	<xsl:template name="lineaBl1">
		<xsl:param name="cont" />
		<xsl:if test="$cont &gt; 0">
			<tr>
				<!-- <td>&#160;</td> -->
				<!-- <td>&#160;</td> -->
				<!-- <td>&#160;</td> -->
				<!-- <td>&#160;</td> -->
				<!-- <td>&#160;</td> -->
				<!-- <td>&#160;</td> -->
				<!-- <td>&#160;</td> -->
			</tr>
			<xsl:call-template name="lineaBl1">
				<xsl:with-param name="cont" select="$cont - 1" />
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

	<xsl:template name="unidad_medida">
		<xsl:if test="/pe:Invoice">
			<xsl:choose>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'ONZ'">OZ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'BJ'">BDN</xsl:when>
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
				<xsl:when test="cbc:InvoicedQuantity/@unitCode = 'GLI'">UGL</xsl:when>
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
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
			<xsl:choose>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'ONZ'">OZ</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'BJ'">BDN</xsl:when>
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
				<xsl:when test="cbc:CreditedQuantity/@unitCode = 'GLI'">UGL</xsl:when>
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
				
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
			<xsl:choose>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'ONZ'">OZ</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'BJ'">BDN</xsl:when>
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
				<xsl:when test="cbc:DebitedQuantity/@unitCode = 'GLI'">UGL</xsl:when>
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
				<xsl:otherwise></xsl:otherwise>
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

	<!--descripción-->
	<!--<xsl:template name="Dato9">
		<xsl:param name="var" />
		<xsl:variable name="varvar">
			<xsl:for-each select="cac:Item/cbc:Description"/>
				<xsl:value-of select="cac:Item/cbc:Description"/>
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
	<xsl:template name="SubDato9Bolivariano">
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
	</xsl:template>								-->

</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\CCL\xml\20101266819&#x2D;01&#x2D;FZ01&#x2D;00000033.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->