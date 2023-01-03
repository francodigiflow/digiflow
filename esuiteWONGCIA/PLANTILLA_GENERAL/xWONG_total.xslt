<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:template name="son-pesos">
		<table border="0" cellpadding="1" cellspacing="1" width="100%" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
			<tr>
				<td width="100%" colspan="4">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>SON:</strong>
						<xsl:call-template name="RetourneValAd">
							<xsl:with-param name="NumAd" select="01"/>
						</xsl:call-template>
					</font>
				</td>
			</tr>
			<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
				<tr>
					<td>

						<table borderColor="#000000" cellSpacing="0" cellPadding="1" width="40%" style="border-top: black 1px solid; border-right: black 1px solid; border-collapse: collapse; border-bottom: black 1px solid; border-left: black 1px solid;">
							<tbody>
								<tr width="100%">
									<td colSpan="4" width="100%" align="center" style="border:solid 1px black">
										<font size="1" face="Arial, Helvetica, sans-serif">
											<strong>PAGO DE CUOTAS</strong>
										</font>
									</td>
								</tr>
								<tr width="100%">
									<td colSpan="4" width="100%" align="left" style="border:solid 1px black">
										<font size="1" face="Arial, Helvetica, sans-serif">
											<strong>Monto Neto Pendiente Pago: </strong>
											<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
												<xsl:if test="cbc:ID !='Detraccion'">
													<xsl:if test="substring-before(cbc:PaymentMeansID,'0') !='Cuota'">
														<xsl:if test="cbc:PaymentMeansID !='037'">
															<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
														</xsl:if>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="20%" align="center" style="border:solid 1px black">
										<font size="1" face="Arial, Helvetica, sans-serif">
											<strong>Nro. de Cuotas</strong>
										</font>
									</td>
									<td width="15%" align="center" style="border:solid 1px black">
										<font size="1" face="Arial, Helvetica, sans-serif">
											<strong>Fecha Vencimiento</strong>
										</font>
									</td>
									<td width="15%" align="center" style="border:solid 1px black">
										<font size="1" face="Arial, Helvetica, sans-serif">
											<strong>Monto de Cuota</strong>
										</font>
									</td>
								</tr>
								<xsl:for-each select="//cac:PaymentTerms">
									<xsl:if test="cbc:PaymentMeansID !='Credito' and cbc:ID !='Detraccion' ">
										<tr>

											<td width="20%" align="center" style="border:solid 1px black">
												<font size="1" face="Arial, Helvetica, sans-serif">

													<xsl:value-of select="substring(substring-before(cbc:PaymentMeansID, '0'),1,5)"/>&#xA0;
													<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota')"/>
												</font>
											</td>
											<td width="15%" align="center" style="border:solid 1px black">
												<font size="1" face="Arial, Helvetica, sans-serif">
													<xsl:value-of select="concat(substring(cbc:PaymentDueDate,9,2),'/',substring(cbc:PaymentDueDate,6,2),'/',substring(cbc:PaymentDueDate,1,4))"/>
												</font>
											</td>

											<td width="15%" align="center" style="border:solid 1px black">
												<font size="1" face="Arial, Helvetica, sans-serif">
													<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>&#xA0;</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>

	<xsl:template name="anticipo18">
		<table width="100%" cellpadding="2" cellspacing="2" border="1" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000" rules="none">
			<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Detalles Anticipo</font>
			<tr>
				<td>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="observacion">
		<table border="0" cellpadding="1" cellspacing="1" width="100%" rules="none">
			<tr>
				<td width="60%">
					<table border="0" cellSpacing="0" borderColor="#FFFFFF" cellPadding="1" width="100%" rules="none">
						<tbody>
							<tr>
								<td width="85%" align="left">
									<!--<xsl:call-template name="RetourneValAd">
								<xsl:with-param name="NumAd" select="08" />
							</xsl:call-template>	-->
									<!--   ******************************************* -->

									<xsl:variable name="tcurva">
										<xsl:call-template name="RetourneValAd">
											<xsl:with-param name="NumAd" select="08"/>
										</xsl:call-template>
									</xsl:variable>
									<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
										<xsl:if test="substring-before($tcurva,'|')!=''">
											<xsl:value-of select="substring-before($tcurva,'|')"/>
											<br/>
											<xsl:value-of select="substring-before(substring-after($tcurva,'|'),'|')"/>
											<xsl:if test="substring-before(substring-after(substring-after($tcurva,'|'),'|'),'|')!=''">
												<br/>
												<xsl:value-of select="substring-before(substring-after(substring-after($tcurva,'|'),'|'),'|')"/>
												<br/>
												<xsl:value-of select="substring-before(substring-after(substring-after(substring-after($tcurva,'|'),'|'),'|'),'|')"/>
												<xsl:if test="substring-before(substring-after(substring-after(substring-after(substring-after($tcurva,'|'),'|'),'|'),'|'),'|')!=''">
													<br/>
													<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after($tcurva,'|'),'|'),'|'),'|'),'|')"/>
													<br/>
													<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after($tcurva,'|'),'|'),'|'),'|'),'|'),'|')"/>
													<br/>
													<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($tcurva,'|'),'|'),'|'),'|'),'|'),'|'),'|')"/>
												</xsl:if>
											</xsl:if>
										</xsl:if>
										<xsl:if test="substring-before($tcurva,'|')=''">
											<br/>
											<xsl:value-of select="$tcurva"/>
										</xsl:if>
									</font>


									<!--   ******************************************* -->
								</td>
								<td width="15%">&#xA0;&#xA0;&#xA0;&#xA0;</td>
							</tr>
						</tbody>
					</table>
				</td>
				<td width="50%" align="right">

					<!--&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;-->
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount = '0.00'">
						<xsl:if test="//cac:LegalMonetaryTotal/cbc:PrepaidAmount = '0.00'">
							<strong>TRANSFERENCIA GRATUITA</strong>
						</xsl:if>
					</xsl:if>
				</td>
				<td>
				</td>
			</tr>

			<xsl:variable name="spot">
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
					<xsl:if test="pe:Codigo = '09'">
						<xsl:value-of select="pe:Valor"/>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
					<xsl:if test="pe1:Codigo = '09'">
						<xsl:value-of select="pe1:Valor"/>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
					<xsl:if test="pe2:Codigo = '09'">
						<xsl:value-of select="pe2:Valor"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>

			<xsl:if test="$spot = 'SERVICIO'">
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="1">Operación sujeta al sistema de pago de obligaciones tributarias - SPOT,
							<br/>con el gobierno central D-Leg. N°90 G/N Nación %12.00 Cod Serv. 022</font>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>

	<xsl:template name="observacionboleta">
		<table border="0" cellpadding="1" cellspacing="1" width="100%" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000" rules="none">
			<tr>
				<td width="100%">
					<table border="0" cellSpacing="0" borderColor="#FFFFFF" cellPadding="1" width="100%" rules="none">
						<tbody>
							<tr>
								<td width="50%">
									<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
										<tbody>
											<tr>
												<td align="center">

													<font face="Arial, Helvetica, sans-serif" size="1">
														<br/>SI LA BOLETA NO ES CANCELADA EN LA
										FECHA ACORDADA, GENERARA INTERES
										DE ACUERDO A LEY.<br/><br/></font>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="50%" align="right">
									<!--&#160;&#160;&#160;&#160;	-->
									<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount = '0.00'">
										<strong>TRANSFERENCIA GRATUITA</strong>
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>


	<xsl:template name="Total">

		<xsl:if test="//cbc:UBLVersionID='2.0'">
			<table border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="silver" heigth="100%">
				<xsl:variable name="DsctoGlobal">
					<!--<xsl:value-of select="0" />-->
					<xsl:for-each select="//pe:Invoice/cac:LegalMonetaryTotal">
						<xsl:value-of select="cbc:AllowanceTotalAmount"/>
					</xsl:for-each>
					<xsl:for-each select="//pe1:CreditNote/cac:LegalMonetaryTotal">
						<xsl:value-of select="cbc:AllowanceTotalAmount"/>
					</xsl:for-each>
					<xsl:for-each select="//pe2:DebitNote/cac:LegalMonetaryTotal">
						<xsl:value-of select="cbc:AllowanceTotalAmount"/>
					</xsl:for-each>
				</xsl:variable>

				<xsl:if test="$DsctoGlobal !=''">
					<tr>
						<td bgcolor="silver">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>DSCTO. GLOBAL</strong>
							</font>
						</td>
						<td bgcolor="silver">
							<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
								<xsl:call-template name="TipoDeMoneda_Total"/>
							</font>
						</td>
						<td align="right">
							<font face="Arial, Helvetica, sans-serif" size="2">

								<xsl:value-of select="format-number($DsctoGlobal, '###,###,##0.00', 'pen')"/>&#xA0;</font>
						</td>
					</tr>
				</xsl:if>
				<!--TOTAL GRAVADO-->
				<tr>
					<td width="65%" align="left" bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>OP. GRAVADA</strong>
						</font>
					</td>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
							<xsl:call-template name="TipoDeMoneda_Total"/>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID = '1001'">
									<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<!--TOTAL NO GRAVADO-->
				<tr>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>OP. INAFECTA</strong>
						</font>
					</td>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
							<xsl:call-template name="TipoDeMoneda_Total"/>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID = '1002'">
									<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<!--TOTAL EXONERADO-->
				<tr>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>OP. EXONERADA</strong>
						</font>
					</td>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
							<xsl:call-template name="TipoDeMoneda_Total"/>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID = '1003'">
									<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>

				<tr>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>TOTAL ANTICIPO</strong>
						</font>
					</td>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
							<xsl:call-template name="TipoDeMoneda_Total"/>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:variable name="TotalAnticipo">
								<xsl:value-of select="0"/>
								<!--<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:PrepaidAmount" /> -->
								<xsl:value-of select="//cac:PrepaidPayment/cbc:PaidAmount"/>
							</xsl:variable>
							<xsl:value-of select="format-number($TotalAnticipo, '###,###,##0.00', 'pen')"/>&#xA0;</font>
					</td>
				</tr>

				<!--TOTAL igv-->
				<tr>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>TOTAL IGV<xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name"/>&#xA0;18%</strong>
						</font>
					</td>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2" color="#00000">
							<xsl:call-template name="TipoDeMoneda_Total"/>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:variable name="IGV">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								</xsl:for-each>
							</xsl:variable>
							<xsl:value-of select="$IGV"/>
						</font>
					</td>
				</tr>

				<!--<xsl:variable name="OpeGrat">
								<xsl:value-of select="0" />
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
									<xsl:if test="cbc:ID = '1004'">
										<xsl:value-of select="cbc:PayableAmount" />
									</xsl:if>
								</xsl:for-each>
			</xsl:variable>
			<xsl:if test="$OpeGrat !='0'">-->
				<xsl:variable name="PERC">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
						<xsl:if test="cbc:ID = '2001'">
							<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:if test="$PERC != ''">
					<tr>
						<td bgcolor="#C4BD97">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>PERCEPCION</strong>
							</font>
						</td>
						<td bgcolor="silver">
							<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
								<xsl:call-template name="TipoDeMoneda_Total"/>
							</font>
						</td>
						<td align="right">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="$PERC"/>
							</font>
						</td>
					</tr>
				</xsl:if>
				<xsl:variable name="OpeGrat">
					<!--<xsl:value-of select="0" />-->
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
						<xsl:if test="cbc:ID = '1004'">
							<xsl:value-of select="cbc:PayableAmount"/>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:if test="$OpeGrat != ''">
					<tr>
						<td bgcolor="silver">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>TOTAL GRATUITO</strong>
							</font>
						</td>
						<td bgcolor="silver">
							<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
								<xsl:call-template name="TipoDeMoneda_Total"/>
							</font>
						</td>
						<td align="right">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number($OpeGrat, '###,###,##0.00', 'pen')"/>&#xA0;</font>
						</td>
					</tr>
				</xsl:if>
				<!--</xsl:if>-->
				<!--<tr>
				<td bgcolor="#C4BD97">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>TOTAL ANTICIPO</strong>
					</font>
				</td>
				<td align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PrepaidAmount, '###,###,##0.00', 'pen')"/>&#160;
				     </font>
				</td>
			</tr>-->

				<tr>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>IMPORTE TOTAL</strong>
						</font>
					</td>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2" color="#00000000">
							<xsl:call-template name="TipoDeMoneda_Total"/>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount != ''">
								<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							<!--en notas de debito-->
							<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount != ''">
								<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
						</font>
					</td>
				</tr>
			</table>
		</xsl:if>

		<xsl:if test="//cbc:UBLVersionID='2.1'">
			<table border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="silver" heigth="100%">
				<xsl:variable name="DsctoGlobal">
					<!--<xsl:value-of select="0" />-->
					<xsl:for-each select="//pe:Invoice/cac:LegalMonetaryTotal">
						<xsl:value-of select="cbc:AllowanceTotalAmount"/>
					</xsl:for-each>
					<xsl:for-each select="//pe1:CreditNote/cac:LegalMonetaryTotal">
						<xsl:value-of select="cbc:AllowanceTotalAmount"/>
					</xsl:for-each>
					<xsl:for-each select="//pe2:DebitNote/cac:LegalMonetaryTotal">
						<xsl:value-of select="cbc:AllowanceTotalAmount"/>
					</xsl:for-each>
				</xsl:variable>

				<xsl:if test="$DsctoGlobal !=''">
					<tr>
						<td bgcolor="silver">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>DSCTO. GLOBAL</strong>
							</font>
						</td>
						<td bgcolor="silver">
							<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
								<xsl:call-template name="TipoDeMoneda_Total"/>
							</font>
						</td>
						<td align="right">
							<font face="Arial, Helvetica, sans-serif" size="2">

								<xsl:value-of select="format-number($DsctoGlobal, '###,###,##0.00', 'pen')"/>&#xA0;</font>
						</td>
					</tr>
				</xsl:if>
				<!--TOTAL GRAVADO-->
				<tr>
					<td width="65%" align="left" bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>OP. GRAVADA</strong>
						</font>
					</td>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
							<xsl:call-template name="TipoDeMoneda_Total"/>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
				<!--TOTAL NO GRAVADO-->
				<tr>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>OP. INAFECTA</strong>
						</font>
					</td>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
							<xsl:call-template name="TipoDeMoneda_Total"/>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>&#xA0;
							<!--<xsl:value-of select="$OPInafecta"/>&#160;--></font>
					</td>
				</tr>

				<!--TOTAL EXONERADO-->
				<tr>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>OP. EXONERADA</strong>
						</font>
					</td>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
							<xsl:call-template name="TipoDeMoneda_Total"/>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number($OPExonerada,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>

				<tr>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>TOTAL ANTICIPO</strong>
						</font>
					</td>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
							<xsl:call-template name="TipoDeMoneda_Total"/>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:variable name="TotalAnticipo">
								<xsl:value-of select="0"/>
								<!--<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:PrepaidAmount" /> -->
								<xsl:value-of select="//cac:PrepaidPayment/cbc:PaidAmount"/>
							</xsl:variable>
							<xsl:value-of select="format-number($TotalAnticipo, '###,###,##0.00', 'pen')"/>&#xA0;</font>
					</td>
				</tr>

				<!--TOTAL igv-->
				<tr>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>TOTAL IGV<xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name"/>&#xA0;18%</strong>
						</font>
					</td>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2" color="#00000">
							<xsl:call-template name="TipoDeMoneda_Total"/>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:variable name="IGV">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								</xsl:for-each>
							</xsl:variable>

							<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>

				<!--<xsl:variable name="OpeGrat">
								<xsl:value-of select="0" />
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
									<xsl:if test="cbc:ID = '1004'">
										<xsl:value-of select="cbc:PayableAmount" />
									</xsl:if>
								</xsl:for-each>
			</xsl:variable>
			<xsl:if test="$OpeGrat !='0'">-->
				<xsl:variable name="PERC">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
						<xsl:if test="cbc:ID = '2001'">
							<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:if test="$PERC != ''">
					<tr>
						<td bgcolor="#C4BD97">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>PERCEPCION</strong>
							</font>
						</td>
						<td bgcolor="silver">
							<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
								<xsl:call-template name="TipoDeMoneda_Total"/>
							</font>
						</td>
						<td align="right">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="$PERC"/>
							</font>
						</td>
					</tr>
				</xsl:if>
				<xsl:variable name="OpeGrat">
					<!--<xsl:value-of select="0" />-->
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
						<xsl:if test="cbc:ID = '1004'">
							<xsl:value-of select="cbc:PayableAmount"/>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:if test="$OpeGrat != ''">
					<tr>
						<td bgcolor="silver">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>TOTAL GRATUITO</strong>
							</font>
						</td>
						<td bgcolor="silver">
							<font face="Arial, Helvetica, sans-serif" size="2" color="#000000">
								<xsl:call-template name="TipoDeMoneda_Total"/>
							</font>
						</td>
						<td align="right">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number($OpeGrat, '###,###,##0.00', 'pen')"/>&#xA0;</font>
						</td>
					</tr>
				</xsl:if>
				<!--</xsl:if>-->
				<!--<tr>
				<td bgcolor="#C4BD97">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>TOTAL ANTICIPO</strong>
					</font>
				</td>
				<td align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PrepaidAmount, '###,###,##0.00', 'pen')"/>&#160;
				     </font>
				</td>
			</tr>-->

				<tr>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>IMPORTE TOTAL</strong>
						</font>
					</td>
					<td bgcolor="silver">
						<font face="Arial, Helvetica, sans-serif" size="2" color="#00000000">
							<xsl:call-template name="TipoDeMoneda_Total"/>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount != ''">
								<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							<!--en notas de debito-->
							<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount != ''">
								<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
						</font>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>

	<xsl:variable name="OPGravada">
		<xsl:value-of select="0.00"/>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="OPInafecta">
		<xsl:value-of select="0.00"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID='1002'">
				<xsl:value-of select="cbc:PayableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<!--<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
			<xsl:if test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:LineExtensionAmount"/>
			</xsl:if>
		</xsl:for-each>-->
		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<!--		<xsl:for-each select="/pe1:CreditNote/cac:InvoiceLine">
			<xsl:if test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:LineExtensionAmount"/>
			</xsl:if>
		</xsl:for-each>-->
		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<!--		<xsl:for-each select="/pe2:DebitNote/cac:InvoiceLine">
			<xsl:if test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:LineExtensionAmount"/>
			</xsl:if>
		</xsl:for-each>-->
	</xsl:variable>

	<xsl:variable name="OPExonerada">
		<xsl:value-of select="0.00"/>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<!-- <xsl:variable name="OPExport"> -->
	<!-- <xsl:value-of select="0.00"/> -->

	<!-- </xsl:variable>	 -->

	<xsl:variable name="OpeGrat">
		<xsl:value-of select="0.00"/>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>



	<xsl:template name="DatosReferencia">
		<table width="100%" border="0" cellpadding="1" rules="none" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
			<tr>
				<td width="65%">
					<table border="0" width="100%" style="font-family :Arial,Helvetica,sans-serif;font-size:10px;color:#000000">
						<tr>
							<td width="30%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='05'">
											<xsl:if test="pe:Valor !='-'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='05'">
											<xsl:if test="pe1:Valor !='-'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='05'">
											<xsl:if test="pe2:Valor !='-'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>
						</tr>
						<!--<tr>
							<td width="30%" align="left">
									<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="00"/></xsl:call-template>
							</td>
						</tr>
						<tr>
							<td width="30%" align="left">
									<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="00"/></xsl:call-template>
							</td>
						</tr>-->
					</table>
				</td>
			</tr>
			<!--<tr>
				<td>
						<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount = '0.00'">
							TRANSFERENCIA GRATUITA
						</xsl:if>
				</td>
			</tr>-->
		</table>
	</xsl:template>
	<xsl:template name="Transferencia">
		<table border="0" width="100%" cellpadding="1">
			<tr>
				<td>
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount='0.00'">
						<center>
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
								<b>TRANSFERENCIA A TITULO GRATUITO</b>
							</font>
						</center>
					</xsl:if>
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0'">
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
							<br/>
						</font>
					</xsl:if>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="fecha_ddmmaa_ref">
		<xsl:variable name="aa">
			<xsl:value-of select="substring-before(FchRef, '-')"/>
		</xsl:variable>
		<xsl:variable name="mmdd">
			<xsl:value-of select="substring-after(FchRef, '-')"/>
		</xsl:variable>
		<xsl:variable name="mm">
			<xsl:value-of select="substring-before($mmdd, '-')"/>
		</xsl:variable>
		<xsl:variable name="dd">
			<xsl:value-of select="substring-after($mmdd, '-')"/>
		</xsl:variable>
		<xsl:value-of select="concat($dd, '-', $mm, '-' , $aa)"/>
	</xsl:template>

	<xsl:template name="CTSJuanchoQuiereElSimbolo">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'PEN'">(S/)</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'USD'">(USD)</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'EUR'">(EUR)</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'PEN'">(S/)</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'USD'">(USD)</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'EUR'">(EUR)</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'PEN'">(S/)</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'USD'">(USD)</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'EUR'">(EUR)</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="firmabottom">
		<table border="0" cellpadding="1" cellspacing="1" width="100%" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
			<tr>
				<td width="50%">
					<table border="0" cellSpacing="0" borderColor="#ffffff" cellPadding="1" width="100%" rules="none">
						<tbody>
							<tr>
								<td width="70%">
									<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
										<tbody>
											<tr>
												<td align="left">
													<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
														<!-- <img width="20%"><xsl:attribute name="src"><xsl:call-template name="timbre"/></xsl:attribute></img>-->
														<img width="100" height="100" align="center" src="data:image/*;base64,[ted_1]"/>
														<br/>
														<br/>Representación impresa de la
														<xsl:choose>
															<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">Factura Electrónica</xsl:when>
															<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">Boleta de Venta Electrónica</xsl:when>
															<xsl:when test="/pe1:CreditNote">Nota de Crédito Electrónica</xsl:when>
															<xsl:when test="/pe2:DebitNote">Nota de Dédito Electrónica</xsl:when>
															<xsl:otherwise></xsl:otherwise>
														</xsl:choose>
														<br/>Podrá ser consultada en: <a href="http://ecomprobantes.pe/">www.ecomprobantes.pe/WONGCIA</a>
														<br/>
													</font>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="30%">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Referencia-up">
		<table width="100%" cellpadding="2" cellspacing="2" border="1" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000" rules="none">
			<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
				<tr>
					<td>
						<table width="100%" cellpadding="2" cellspacing="0" border="0" bordercolor="#ffffff" rules="none" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
							<tr>
								<td width="20%" align="left">
									<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										<strong>Motivo de modificación</strong>
									</font>
								</td>
								<td width="40%">
									<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										<strong>:</strong>
										<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
									</font>
								</td>
								<!--  
								<xsl:if test="$tipoDoc='5'">
										<strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional"><xsl:if test="pe:Codigo = '44'"><xsl:value-of select="pe:Valor" /></xsl:if></xsl:for-each>
										</strong>
									</xsl:if>
								-->
								<!-- condiciones para NC exportacion Uva/Bannano -->
								<!--<xsl:if test="$tipoExport='40' and /pe1:CreditNote != ''">-->
								<!--
								<xsl:if test="$tipoExport='40'">
									<xsl:if test="/pe:Invoice != ''">
										<td width="16%">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>Tipo de Cambio</strong>
											</font>
										</td>
										<td width="24%">
											<font face="Arial, Helvetica, sans-serif" size="2">								
		                        				<strong>: </strong>												
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo = '12'"><xsl:value-of select="pe:Valor" /></xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo = '12'"><xsl:value-of select="pe1:Valor" /></xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo = '12'"><xsl:value-of select="pe2:Valor" /></xsl:if>
												</xsl:for-each>		
											</font>
										</td>
									</xsl:if>
									<xsl:if test="/pe1:CreditNote != '' or /pe2:DebitNote != ''">
										<td width="16%">
											<font face="Arial, Helvetica, sans-serif" size="2">								
											</font>
										</td>
										<td width="24%">
											<font face="Arial, Helvetica, sans-serif" size="2">								
											</font>
										</td>
									</xsl:if>
								</xsl:if>
								<xsl:if test="$tipoExport!='40'">
									<td width="16%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Tipo de Cambio</strong>
										</font>
									</td>
									<td width="24%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>: </strong>												
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo = '12'"><xsl:value-of select="pe:Valor" /></xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo = '12'"><xsl:value-of select="pe1:Valor" /></xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo = '12'"><xsl:value-of select="pe2:Valor" /></xsl:if>
											</xsl:for-each>		
										</font>
									</td>
								</xsl:if>  -->
								<!--  Fin de NC -->
							</tr>
							<tr>
								<td width="20%" align="left">
									<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										<strong>Documento que modifica</strong>
									</font>
								</td>
								<td width="40%">
									<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										<strong>:</strong>
										<xsl:variable name="CTSTipoCPE">
											<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
												<xsl:if test="cbc:DocumentTypeCode != '10'">
													<xsl:choose>
														<xsl:when test="cbc:DocumentTypeCode = '01'">FACTURA*</xsl:when>
														<xsl:when test="cbc:DocumentTypeCode = '03'">BOLETA*</xsl:when>
														<xsl:when test="cbc:DocumentTypeCode = '07'">NOTA DE CRÉDITO*</xsl:when>
														<xsl:when test="cbc:DocumentTypeCode = '08'">NOTA DE DÉBITO*</xsl:when>
														<xsl:otherwise>Documento NN</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
											</xsl:for-each>
										</xsl:variable>
										<xsl:value-of select="substring-before($CTSTipoCPE, '*')"/>
										<xsl:variable name="CTSValorMultireferencia">
											<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
												<xsl:if test="cbc:DocumentTypeCode != '10'">
													<!--<xsl:value-of select="cbc:ID"/>-->
													<xsl:variable name="serie" select="substring-before(cbc:ID, '-')"/>
													<xsl:variable name="correlativo" select="substring-after(cbc:ID, '-')"/>
													<xsl:variable name="Ceros" select="concat(substring('00000000', 1, (7 - string-length($correlativo))), $correlativo)"/>
													<xsl:value-of select="concat(concat($serie, '-'), $Ceros, ' / ')"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:variable>&#xA0;
										<xsl:value-of select="substring($CTSValorMultireferencia, 1, string-length($CTSValorMultireferencia) - 3)"/>
									</font>
								</td>
								<!-- FECHA DE MODIFICACION -->
								<!--<xsl:if test="$tipoDoc!='5'">-->
								<td width="16%" align="left">
									<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										<strong>Fecha Doc. Modf.</strong>
									</font>
								</td>
								<td width="24%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>:</strong>
										<xsl:if test="$fechaDocModif != '-' or $fechaDocModif != '_'">
											<xsl:call-template name="fecha_ddmmaa_formato">
												<xsl:with-param name="FechaFormateada" select="$fechaDocModif"/>
											</xsl:call-template>
										</xsl:if>
									</font>
								</td>
								<!--</xsl:if>-->
								<!--<xsl:if test="/pe2:DebitNote != ''">
							<xsl:if test="$tipoDoc='5'">								
								<td width="16%" align="left">
									<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
										<strong>Fecha Doc. Modf.</strong>
									</font>
								</td>
								<td width="24%" align="left">
		                          	<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>: </strong>
										<xsl:if test="$fechaDocModif != '-' or $fechaDocModif != '_'">
					                        <xsl:call-template name="fecha_ddmmaa_formato">
					                            <xsl:with-param name="FechaFormateada" select="$fechaDocModif"/>
					                        </xsl:call-template> 
										</xsl:if>
									</font>
								</td>
								</xsl:if>
							</xsl:if>-->
							</tr>
						</table>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<xsl:template name="TipoDeMoneda_Total">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="IMP\20267196746_2018050301F01500000001.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bGenerateByteCode" value="true"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="sInitialMode" value=""/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="20520929658-01-FF11-99900001.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template name="son-pesos"></template>
			<template name="Total">
				<block path="table/tr/td[1]/font/xsl:for-each" x="340" y="27"/>
				<block path="table/tr/td[1]/font/xsl:for-each/xsl:if/=[0]" x="44" y="55"/>
				<block path="table/tr/td[1]/font/xsl:for-each/xsl:if" x="90" y="57"/>
				<block path="table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:value-of" x="160" y="87"/>
				<block path="table/tr[1]/td[1]/font/xsl:for-each" x="260" y="27"/>
				<block path="table/tr[1]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="364" y="15"/>
				<block path="table/tr[1]/td[1]/font/xsl:for-each/xsl:if" x="410" y="17"/>
				<block path="table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:value-of" x="40" y="87"/>
				<block path="table/tr[2]/td[1]/font/xsl:for-each" x="20" y="27"/>
				<block path="table/tr[2]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="84" y="15"/>
				<block path="table/tr[2]/td[1]/font/xsl:for-each/xsl:if" x="130" y="17"/>
				<block path="table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:value-of" x="200" y="47"/>
				<block path="table/xsl:for-each" x="300" y="27"/>
				<block path="table/xsl:for-each/xsl:if/=[0]" x="364" y="55"/>
				<block path="table/xsl:for-each/xsl:if" x="410" y="57"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/!=[0]" x="314" y="85"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if" x="360" y="87"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/tr/td[1]/font/xsl:value-of" x="360" y="127"/>
				<block path="table/xsl:if/!=[0]" x="274" y="85"/>
				<block path="table/xsl:if" x="320" y="87"/>
				<block path="table/xsl:if/tr/td[1]/font/xsl:value-of" x="400" y="127"/>
				<block path="table/xsl:for-each[1]" x="280" y="87"/>
				<block path="table/xsl:for-each[1]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="15"/>
				<block path="table/xsl:for-each[1]/tr/td[1]/font/xsl:if" x="90" y="17"/>
				<block path="table/xsl:for-each[1]/tr/td[1]/font/xsl:if/xsl:value-of" x="320" y="127"/>
				<block path="table/xsl:for-each[2]" x="240" y="87"/>
				<block path="table/xsl:for-each[2]/tr/td/font/strong/xsl:value-of" x="360" y="87"/>
				<block path="table/xsl:for-each[2]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="95"/>
				<block path="table/xsl:for-each[2]/tr/td[1]/font/xsl:if" x="90" y="97"/>
				<block path="table/xsl:for-each[2]/tr/td[1]/font/xsl:if/xsl:value-of" x="280" y="127"/>
				<block path="table/xsl:for-each[3]" x="200" y="87"/>
				<block path="table/xsl:for-each[3]/tr/td/font/strong/xsl:value-of" x="360" y="87"/>
				<block path="table/xsl:for-each[3]/tr/td[1]/font/xsl:if/!=[0]" x="124" y="135"/>
				<block path="table/xsl:for-each[3]/tr/td[1]/font/xsl:if" x="170" y="137"/>
				<block path="table/xsl:for-each[3]/tr/td[1]/font/xsl:if/xsl:value-of" x="240" y="127"/>
				<block path="table/tr[3]/td[1]/xsl:if/!=[0]" x="314" y="85"/>
				<block path="table/tr[3]/td[1]/xsl:if" x="360" y="87"/>
				<block path="table/tr[3]/td[1]/xsl:if/font/xsl:value-of" x="40" y="127"/>
				<block path="table/tr[3]/td[1]/xsl:if[1]/!=[0]" x="314" y="85"/>
				<block path="table/tr[3]/td[1]/xsl:if[1]" x="360" y="87"/>
				<block path="table/tr[3]/td[1]/xsl:if[1]/font/xsl:value-of" x="360" y="87"/>
				<block path="table[1]/tr/td/xsl:if/=[0]" x="314" y="85"/>
				<block path="table[1]/tr/td/xsl:if" x="360" y="87"/>
				<block path="table[1]/tr/td/xsl:if[1]/!=[0]" x="314" y="85"/>
				<block path="table[1]/tr/td/xsl:if[1]" x="360" y="87"/>
			</template>
			<template match="/"></template>
			<template name="AdicionaDatosEmp">
				<block path="table/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each/xsl:if/=[0]" x="340" y="16"/>
				<block path="table/xsl:for-each/xsl:if" x="386" y="18"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/!=[0]" x="290" y="46"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if" x="336" y="48"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/=[0]" x="0" y="38"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if" x="16" y="40"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="36" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="340" y="56"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="386" y="58"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="56" y="48"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="180" y="56"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="226" y="58"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="60" y="56"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="106" y="58"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/xsl:for-each[1]" x="316" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/=[0]" x="180" y="16"/>
				<block path="table/xsl:for-each[1]/xsl:if" x="226" y="18"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/=[0]" x="250" y="46"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if" x="296" y="48"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/xsl:for-each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/xsl:for-each[2]" x="156" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/=[0]" x="60" y="16"/>
				<block path="table/xsl:for-each[2]/xsl:if" x="106" y="18"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/=[0]" x="130" y="46"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if" x="176" y="48"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each" x="186" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="170" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if" x="216" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/=[0]" x="200" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if" x="246" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each" x="276" y="0"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/xsl:for-each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for-each/xsl:if/xsl:if/xsl:for-each/xsl:if/xsl:value-of" x="336" y="48"/>
				<block path="table/td/table/tr/td/xsl:for-each" x="276" y="0"/>
				<block path="table/td/table/tr/td/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/td/table/tr/td/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/td/table/tr/td/xsl:for-each/xsl:if/xsl:if/=[0]" x="290" y="46"/>
				<block path="table/td/table/tr/td/xsl:for-each/xsl:if/xsl:if" x="336" y="48"/>
				<block path="table/td/table/tr[1]/td/xsl:for-each" x="276" y="0"/>
				<block path="table/td/table/tr[1]/td/xsl:for-each/xsl:if/=[0]" x="260" y="16"/>
				<block path="table/td/table/tr[1]/td/xsl:for-each/xsl:if" x="306" y="18"/>
				<block path="table/td/table/tr[1]/td/xsl:for-each/xsl:if/xsl:if/=[0]" x="290" y="46"/>
				<block path="table/td/table/tr[1]/td/xsl:for-each/xsl:if/xsl:if" x="336" y="48"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->