<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>


	<xsl:template name="DetallesEncabezado">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
							<td style="border-style: solid; border-width: 1px;" colspan="5" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Comprobantes de pago que dan origen a la Retencion</strong>
								</font>
							</td>

							<td width="10%" align="center" rowspan="2">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Fecha de pago</strong>
								</font>
							</td>
							<td width="5%" align="center" rowspan="2">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Número de pago</strong>
								</font>
							</td>
							<td width="10%" align="center" rowspan="2">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Importe de pago (Moneda Origen)</strong>
								</font>
							</td>
							<td width="10%" align="center" rowspan="2">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Tipo de Cambio</strong>
								</font>
							</td>
							<td width="10%" align="center" rowspan="2">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Monto total pagado (S/)</strong>
								</font>
							</td>
							<td style="border-style: solid; border-width: 1px;" colspan="2" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Importe de la Retención (S/)</strong>
								</font>
							</td>
						</tr>
						<tr>
							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2.5">
									<strong>Tipo</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2.5">
									<strong>Comprobante</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2.5">
									<strong>Fecha Emisión</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2.5">
									<strong>Tipo Moneda</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2.5">
									<strong>Importe Total</strong>
								</font>
							</td>
							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Dólares</strong>
								</font>
							</td>
							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Soles</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<xsl:for-each select="//sac:SUNATRetentionDocumentReference">
							<tr>
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID/@schemeID"/>
									</font>
								</td>
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="substring-before(cbc:ID,'-')"/>- 
									<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
									</font>
								</td>
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:IssueDate"/>
									</font>
								</td>

								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:TotalInvoiceAmount/@currencyID"/>
									</font>
								</td>
								<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:TotalInvoiceAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Payment/cbc:PaidDate"/>
									</font>
								</td>
								<td width="6%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Payment/cbc:ID"/>
									</font>
								</td>
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cac:Payment/cbc:PaidAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:if test="cbc:TotalInvoiceAmount/@currencyID = 'USD'">
											<xsl:value-of select="format-number(sac:SUNATRetentionInformation/cac:ExchangeRate/cbc:CalculationRate,'###,###,##0.000','pen')"/>
										</xsl:if>
										<xsl:if test="cbc:TotalInvoiceAmount/@currencyID = 'PEN'">
											1.00
										</xsl:if>
									</font>
								</td>
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(sac:SUNATRetentionInformation/sac:SUNATNetTotalPaid,'###,###,##0.00','pen')"/>										
									</font>
								</td>
								<td width="5%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:variable name="linea1">
												<xsl:value-of select="substring-before($AdicionalDetalleTotal,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after($AdicionalDetalleTotal,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto5">
												<xsl:value-of select="substring-after($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea6">
												<xsl:value-of select="substring-before($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto6">
												<xsl:value-of select="substring-after($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea7">
												<xsl:value-of select="substring-before($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto7">
												<xsl:value-of select="substring-after($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea8">
												<xsl:value-of select="substring-before($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto8">
												<xsl:value-of select="substring-after($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea9">
												<xsl:value-of select="substring-before($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto9">
												<xsl:value-of select="substring-after($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea10">
												<xsl:value-of select="substring-before($resto9,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto10">
												<xsl:value-of select="substring-after($resto9,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea11">
												<xsl:value-of select="substring-before($resto10,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto11">
												<xsl:value-of select="substring-after($resto10,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea12">
												<xsl:value-of select="substring-before($resto11,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto12">
												<xsl:value-of select="substring-after($resto11,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea13">
												<xsl:value-of select="substring-before($resto12,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto13">
												<xsl:value-of select="substring-after($resto12,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea14">
												<xsl:value-of select="substring-before($resto13,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto14">
												<xsl:value-of select="substring-after($resto13,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea15">
												<xsl:value-of select="substring-before($resto14,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto15">
												<xsl:value-of select="substring-after($resto14,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea16">
												<xsl:value-of select="substring-before($resto15,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto16">
												<xsl:value-of select="substring-after($resto15,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea17">
												<xsl:value-of select="substring-before($resto16,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto17">
												<xsl:value-of select="substring-after($resto16,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea18">
												<xsl:value-of select="substring-before($resto17,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto18">
												<xsl:value-of select="substring-after($resto17,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea19">
												<xsl:value-of select="substring-before($resto18,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto19">
												<xsl:value-of select="substring-after($resto18,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea20">
												<xsl:value-of select="substring-before($resto19,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto20">
												<xsl:value-of select="substring-after($resto19,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea21">
												<xsl:value-of select="substring-before($resto20,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto21">
												<xsl:value-of select="substring-after($resto20,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea22">
												<xsl:value-of select="substring-before($resto21,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto22">
												<xsl:value-of select="substring-after($resto21,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea23">
												<xsl:value-of select="substring-before($resto22,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto23">
												<xsl:value-of select="substring-after($resto22,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea24">
												<xsl:value-of select="substring-before($resto23,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto24">
												<xsl:value-of select="substring-after($resto23,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea25">
												<xsl:value-of select="substring-before($resto24,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto25">
												<xsl:value-of select="substring-after($resto24,'|')"/>
											</xsl:variable>
											<xsl:if test="$linea1!=''">
												<xsl:value-of select="$linea1"/><br/>
											</xsl:if>
											<xsl:if test="$linea2!=''">
												<xsl:value-of select="$linea2"/><br/>
											</xsl:if>
											<xsl:if test="$linea3!=''">
												<xsl:value-of select="$linea3"/><br/>
											</xsl:if>
											<xsl:if test="$linea4!=''">
												<xsl:value-of select="$linea4"/><br/>
											</xsl:if>
											<xsl:if test="$linea5!=''">
												<xsl:value-of select="$linea5"/><br/>
											</xsl:if>
											<xsl:if test="$linea6!=''">
												<xsl:value-of select="$linea6"/><br/>
											</xsl:if>
											<xsl:if test="$linea7!=''">
												<xsl:value-of select="$linea7"/><br/>
											</xsl:if>
											<xsl:if test="$linea8!=''">
												<xsl:value-of select="$linea8"/><br/>
											</xsl:if>
											<xsl:if test="$linea9!=''">
												<xsl:value-of select="$linea9"/><br/>
											</xsl:if>
											<xsl:if test="$linea10!=''">
												<xsl:value-of select="$linea10"/><br/>
											</xsl:if>
											<xsl:if test="$linea11!=''">
												<xsl:value-of select="$linea11"/><br/>
											</xsl:if>
											<xsl:if test="$linea12!=''">
												<xsl:value-of select="$linea12"/><br/>
											</xsl:if>
											<xsl:if test="$linea13!=''">
												<xsl:value-of select="$linea13"/><br/>
											</xsl:if>
											<xsl:if test="$linea14!=''">
												<xsl:value-of select="$linea14"/><br/>
											</xsl:if>
											<xsl:if test="$linea15!=''">
												<xsl:value-of select="$linea15"/><br/>
											</xsl:if>
											<xsl:if test="$linea16!=''">
												<xsl:value-of select="$linea16"/><br/>
											</xsl:if>
											<xsl:if test="$linea17!=''">
												<xsl:value-of select="$linea17"/><br/>
											</xsl:if>
											<xsl:if test="$linea18!=''">
												<xsl:value-of select="$linea18"/><br/>
											</xsl:if>
											<xsl:if test="$linea19!=''">
												<xsl:value-of select="$linea19"/><br/>
											</xsl:if>
											<xsl:if test="$linea20!=''">
												<xsl:value-of select="$linea20"/><br/>
											</xsl:if>
											<xsl:if test="$linea21!=''">
												<xsl:value-of select="$linea21"/><br/>
											</xsl:if>
											<xsl:if test="$linea22!=''">
												<xsl:value-of select="$linea22"/><br/>
											</xsl:if>
											<xsl:if test="$linea23!=''">
												<xsl:value-of select="$linea23"/><br/>
											</xsl:if>
											<xsl:if test="$linea24!=''">
												<xsl:value-of select="$linea24"/><br/>
											</xsl:if>
											<xsl:if test="$linea25!=''">
												<xsl:value-of select="$linea25"/><br/>
											</xsl:if>
									</font>
								</td>
								<td width="5%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(sac:SUNATRetentionInformation/sac:SUNATRetentionAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
						</xsl:for-each>

						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<!-- <table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table> -->
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
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
			<xsl:otherwise>UNI
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="TipoDeMoneda_Total">
		<xsl:choose>
			<xsl:when test="//sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/@currencyID='PEN'">S/</xsl:when>
			<xsl:when test="//sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/@currencyID='USD'">$</xsl:when>
			<!-- <xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when> -->
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->