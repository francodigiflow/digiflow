<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="tmpDetalle">		
					<!--<table style="border: 1px solid black;border-collapse: collapse;" rules="groups" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">-->
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
										<font face="Arial, Helvetica, sans-serif" size="1">CÓDIGO</font>
									</b>
								</th>
								<th width="36%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">DESCRIPCIÓN</font>
									</b>
								</th>
								<th width="8%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">CANTIDAD</font>
									</b>
								</th>
								<th width="5%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">U.M.</font>
									</b>
								</th>
								<th width="10%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">PRECIO UNITARIO</font>
									</b>
								</th>
<!--								<th width="8%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">VALOR UNITARIO</font>
									</b>
								</th>-->
								<th width="7%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">DESCTO.</font>
									</b>
								</th>
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe1:CreditNote/cac:CreditNoteLine or /pe2:DebitNote/cac:DebitNoteLine">
								<th width="7%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">I.G.V.</font>
									</b>
								</th>
								</xsl:if>
								<th width="10%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">VALOR VENTA</font>
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
										</font>
									</td>
									<td width="8%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>
										</font>
									</td>
									<td width="5%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>

									<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
										</font>
									</td>
<!--									<td width="8%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											VALOR UNIT......................................................................................................
											<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>-->
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
					</table>
	</xsl:template>
	
	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
	<xsl:if test="$cont>0">
	
			<tr>
				<!--<td width="17%" align="center" valign="top">
           			<font face="Arial, Helvetica, sans-serif" size="1">&#160;</font>
           		</td>-->
				<td width="4%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="13%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="36%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="8%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="5%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="10%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
<!--				<td width="8%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>-->
				<td width="7%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe1:CreditNote/cac:CreditNoteLine or /pe2:DebitNote/cac:DebitNoteLine">
				<td width="7%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				</xsl:if>
				<td width="10%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
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
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->