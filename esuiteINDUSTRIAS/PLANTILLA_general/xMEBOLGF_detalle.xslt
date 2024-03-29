<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="tmpDetalle">
	<table class="redondeo_deta" bordercolor="#000000" rules="groups" width="100%" cellpadding="2" cellspacing="0">
		<thead style="border: 1px solid black;display: table-header-group">
			<tr>
				<th width="4%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
					<b>
						<font face="Arial, Helvetica, sans-serif" size="1">ITEM</font>
					</b>
				</th>
				<th width="13%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
					<b>
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="$tipoDoc = '40'">CODE<br/></xsl:if>C�DIGO
						</font>
					</b>
				</th>
				<th width="36%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
					<b>
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="$tipoDoc = '40'">DESCRIPTION<br/></xsl:if>DESCRIPCI�N
						</font>
					</b>
				</th>
				<th width="8%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
					<b>
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="$tipoDoc = '40'">QUANTITY <br/></xsl:if>CANTIDAD
						</font>
					</b>
				</th>
				<th width="5%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
					<b>
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="$tipoDoc = '40'">UNIT <br/></xsl:if>U.M.
						</font>
					</b>
				</th>
				<th width="10%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
					<b>
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="$tipoDoc = '40'">UNIT. PRICE <br/></xsl:if>PRECIO UNITARIO
						</font>
					</b>
				</th>
				<xsl:choose>
					<xsl:when test="$tipoDoc = '40'"></xsl:when>
					<xsl:otherwise>
					<th width="7%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
						<b>
							<font face="Arial, Helvetica, sans-serif" size="1">DSCTO.</font>
						</b>
					</th>
					<th width="7%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
						<b>
							<font face="Arial, Helvetica, sans-serif" size="1">I.G.V.</font>
						</b>
					</th>
					</xsl:otherwise>
				</xsl:choose>
				<th width="10%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
					<b>
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="$tipoDoc = '40'">VALUE SALE <br/></xsl:if>VALOR VENTA
						</font>
					</b>
				</th>
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
						<td width="4%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="cbc:ID"/>
							</font>
						</td>
						<td width="13%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
							</font>
						</td>
						<td width="37%" align="left" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="cac:Item/cbc:Description"/>
								<xsl:choose>
									<xsl:when test="$tipoDoc = '40'"><br/>
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
													<xsl:with-param name="item" select="cbc:ID" />
													<xsl:with-param name="adicional" select="1" />
										</xsl:call-template><br/>
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
													<xsl:with-param name="item" select="cbc:ID" />
													<xsl:with-param name="adicional" select="2" />
										</xsl:call-template><br/>
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
													<xsl:with-param name="item" select="cbc:ID" />
													<xsl:with-param name="adicional" select="3" /> 
										</xsl:call-template>
										<br/><br/>
										<!-- Descripcion del item por medio items - Desglosado de Nombre de ITEM -->
										<!--<xsl:variable name="name" select="substring-before(cac:Item/cbc:Description,'/')"/>
										<xsl:variable name="nombre" select="substring-before(substring-after(cac:Item/cbc:Description,'/'),'/')"/>
										<xsl:variable name="presentacion" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'/'),'/'),'/')"/>
										<xsl:variable name="PA" select="substring-after(substring-after(substring-after(cac:Item/cbc:Description,'/'),'/'),'/')"/>
										<xsl:value-of select="$name"/><br/>
										<xsl:value-of select="$nombre"/><br/>
										<xsl:value-of select="$presentacion"/><br/>
										<xsl:value-of select="$PA"/><br/>-->
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="substring-before(substring-after(cac:Item/cbc:Description,'/'),'/')"/>
										<!--<xsl:value-of select="cac:Item/cbc:Description"/>-->
									</xsl:otherwise>
								</xsl:choose>
							</font>
						</td>
						<td width="8%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.00','pen')"/>
							</font>
						</td>
						<td width="5%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:call-template name="unidad_medida"/>
							</font>
						</td>
						<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>
							</font>
						</td>
						<xsl:choose>
							<xsl:when test="$tipoDoc = '40'"></xsl:when>
							<xsl:otherwise>
								<td width="7%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number($Descuento,'###,###,##0.00','pen')"/>
									</font>
								</td>
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
									<td width="7%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
						<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
							</font>
						</td>
					</tr>
				</xsl:for-each>

				<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
					<xsl:variable name="Descuento1">
						<xsl:value-of select="0"/>
						<xsl:if test="cac:AllowanceCharge/cbc:Amount">
							<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
						</xsl:if>
					</xsl:variable>

					<tr>
						<td width="4%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="cbc:ID"/>
							</font>
						</td>
						<td width="13%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
							</font>
						</td>
						<td width="36%" align="left" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="cac:Item/cbc:Description"/>
							</font>
						</td>
						<td width="8%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>
							</font>
						</td>
						<td width="5%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<!--<xsl:value-of select="cbc:CreditedQuantity/@unitCode"/>-->
								<xsl:call-template name="unidad_medida"/>
							</font>
						</td>

						<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">

								<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>
							</font>
						</td>
						<!--									<td width="8%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>-->
						<td width="7%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">

								<xsl:value-of select="format-number($Descuento1,'###,###,##0.00','pen')"/>
							</font>
						</td>
						<td width="7%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">

								<xsl:value-of select="format-number(cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
							</font>
						</td>
						<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
							</font>
						</td>
					</tr>
				</xsl:for-each>

				<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
					<xsl:variable name="Descuento1">
						<xsl:value-of select="0"/>
						<xsl:if test="cac:AllowanceCharge/cbc:Amount">
							<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
						</xsl:if>
					</xsl:variable>

					<tr>
						<td width="4%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="cbc:ID"/>
							</font>
						</td>
						<td width="13%" align="center" valign="top">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
							</font>
						</td>
						<td width="36%" align="left" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="cac:Item/cbc:Description"/>
							</font>
						</td>
						<td width="8%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>
							</font>
						</td>
						<td width="5%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<!--<xsl:value-of select="cbc:DebitedQuantity/@unitCode"/>-->
								<xsl:call-template name="unidad_medida"/>
							</font>
						</td>

						<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">

								<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>
							</font>
						</td>
						<!--									<td width="8%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>-->
						<td width="7%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="format-number($Descuento1,'###,###,##0.00','pen')"/>
							</font>
						</td>
						<td width="7%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="format-number(cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
							</font>
						</td>
						<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
							</font>
						</td>
					</tr>
				</xsl:for-each>

				<xsl:call-template name="lineaBl">
					<xsl:with-param name="cont" select="$numColBl"/>
				</xsl:call-template>
			</tbody>
			<xsl:if test="$tipoDoc = '40'">
				<!--<xsl:if test="//ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional[pe:Codigo='03' and pe:Valor='E']">-->
				<tfoot style="border:none;display: table-header-group">
					<tr>
						<th width="4%" colspan="4" align="left">
							<b>
								<font face="Arial, Helvetica, sans-serif" size="2">&#xA0; Se acoge al r�gimen de restituci�n de derechos arancelarios D.S. 104-95 EF</font>
							</b>
						</th>
						<th width="5%" style="border: 1px solid black" colspan="2">
							<b>
								<font face="Arial, Helvetica, sans-serif" size="1">TOTAL DE VENTA</font>
							</b>
						</th>
						<th width="10%">
							<b>
								<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</font>
								</xsl:if>
								<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</font>
								</xsl:if>
							</b>
						</th>
					</tr>
				</tfoot>
			</xsl:if>
		</table>
	</xsl:template>

	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr>
				<td width="4%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1">
					</font>
				</td>
				<td width="13%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1">
					</font>
				</td>
				<td width="36%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1">
					</font>
				</td>
				<td width="8%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1">
					</font>
				</td>
				<td width="5%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1">
					</font>
				</td>
				<td width="10%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1">
					</font>
				</td>
				<xsl:choose>
					<xsl:when test="$tipoDoc = '40'"></xsl:when>
					<xsl:otherwise>
					<td width="7%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
						<font face="Arial, Helvetica, sans-serif" size="1"></font>
					</td>
					<td width="7%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
						<font face="Arial, Helvetica, sans-serif" size="1"></font>
					</td>
					</xsl:otherwise>
				</xsl:choose>
				<td width="10%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1"></font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="unidad_medida">
		<xsl:choose>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PL' or cbc:CreditedQuantity/@unitCode='PL' or cbc:DebitedQuantity/@unitCode='PL'">BAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D64' or cbc:CreditedQuantity/@unitCode='D64' or cbc:DebitedQuantity/@unitCode='D64'">BLK</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BG' or cbc:CreditedQuantity/@unitCode='BG' or cbc:DebitedQuantity/@unitCode='BG'">BOL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BO' or cbc:CreditedQuantity/@unitCode='BO' or cbc:DebitedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BX' or cbc:CreditedQuantity/@unitCode='BX' or cbc:DebitedQuantity/@unitCode='BX'">CAJ</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CY' or cbc:CreditedQuantity/@unitCode='CY' or cbc:DebitedQuantity/@unitCode='CY'">CIL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CLT' or cbc:CreditedQuantity/@unitCode='CLT' or cbc:DebitedQuantity/@unitCode='CLT'">CL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CMT' or cbc:CreditedQuantity/@unitCode='CMT' or cbc:DebitedQuantity/@unitCode='CMT'">CM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CJ' or cbc:CreditedQuantity/@unitCode='CJ' or cbc:DebitedQuantity/@unitCode='CJ'">CON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='DLT' or cbc:CreditedQuantity/@unitCode='DLT' or cbc:DebitedQuantity/@unitCode='DLT'">DL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL' or cbc:CreditedQuantity/@unitCode='GLL' or cbc:DebitedQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GRM' or cbc:CreditedQuantity/@unitCode='GRM' or cbc:DebitedQuantity/@unitCode='GRM'">GR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='HUR' or cbc:CreditedQuantity/@unitCode='HUR' or cbc:DebitedQuantity/@unitCode='HUR'">HRA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KT' or cbc:CreditedQuantity/@unitCode='KT' or cbc:DebitedQuantity/@unitCode='KT'">JGO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM' or cbc:CreditedQuantity/@unitCode='KGM' or cbc:DebitedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KWT' or cbc:CreditedQuantity/@unitCode='KWT' or cbc:DebitedQuantity/@unitCode='KWT'">KW</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR' or cbc:CreditedQuantity/@unitCode='LBR' or cbc:DebitedQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR' or cbc:CreditedQuantity/@unitCode='LTR' or cbc:DebitedQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTR' or cbc:CreditedQuantity/@unitCode='MTR' or cbc:DebitedQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK' or cbc:CreditedQuantity/@unitCode='MTK' or cbc:DebitedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTQ' or cbc:CreditedQuantity/@unitCode='MTQ' or cbc:DebitedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MIL' or cbc:CreditedQuantity/@unitCode='MIL' or cbc:DebitedQuantity/@unitCode='MIL'">MIL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D61' or cbc:CreditedQuantity/@unitCode='D61' or cbc:DebitedQuantity/@unitCode='D61'">MIN</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MLT' or cbc:CreditedQuantity/@unitCode='MLT' or cbc:DebitedQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MMT' or cbc:CreditedQuantity/@unitCode='MMT' or cbc:DebitedQuantity/@unitCode='MMT'">MM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NPR' or cbc:CreditedQuantity/@unitCode='NPR' or cbc:DebitedQuantity/@unitCode='NPR'">PAR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTK' or cbc:CreditedQuantity/@unitCode='FTK' or cbc:DebitedQuantity/@unitCode='FTK'">PI2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTQ' or cbc:CreditedQuantity/@unitCode='FTQ' or cbc:DebitedQuantity/@unitCode='FTQ'">PI3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PA' or cbc:CreditedQuantity/@unitCode='PA' or cbc:DebitedQuantity/@unitCode='PA'">PQT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='INH' or cbc:CreditedQuantity/@unitCode='INH' or cbc:DebitedQuantity/@unitCode='INH'">PUL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NRL' or cbc:CreditedQuantity/@unitCode='NRL' or cbc:DebitedQuantity/@unitCode='NRL'">ROL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE' or cbc:CreditedQuantity/@unitCode='TNE' or cbc:DebitedQuantity/@unitCode='TNE'">TON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NIU' or cbc:CreditedQuantity/@unitCode='NIU' or cbc:DebitedQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SA' or cbc:CreditedQuantity/@unitCode='SA' or cbc:DebitedQuantity/@unitCode='SA'">SAC</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='JR' or cbc:CreditedQuantity/@unitCode='JR' or cbc:DebitedQuantity/@unitCode='JR'">FC</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SO' or cbc:CreditedQuantity/@unitCode='SO' or cbc:DebitedQuantity/@unitCode='SO'">SO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='JE' or cbc:CreditedQuantity/@unitCode='JE' or cbc:DebitedQuantity/@unitCode='JE'">JER</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PS' or cbc:CreditedQuantity/@unitCode='PS' or cbc:DebitedQuantity/@unitCode='PS'">POTE</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="tmpDatosAdicionalesDetalle">
		<xsl:param name="item"/>
		<xsl:param name="adicional"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($item, $adicional)">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
			<xsl:if test="pe1:Codigo = concat($item, $adicional)">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo = concat($item, $adicional)">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20601199557&#x2D;01&#x2D;F002&#x2D;00000007.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->