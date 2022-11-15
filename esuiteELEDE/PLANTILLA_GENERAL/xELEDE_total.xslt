<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

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
	
	<xsl:variable name="OPExport">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>	
	
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
	
	<xsl:variable name="TotDesc">
		<xsl:value-of select="0.00"/>
		<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount"/>
	</xsl:variable>
	
	<xsl:variable name="TotAmticipos">
		<xsl:choose>
			<xsl:when test="//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='04'">
				<xsl:for-each select="//cac:AllowanceCharge">
					<xsl:if test="cbc:AllowanceChargeReasonCode='04'">
						<xsl:value-of select="format-number(cbc:Amount, '###,###,##0.00', 'pen')"/>&#xA0;
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PrepaidAmount,'###,###,##0.00','pen')"/>
			</xsl:otherwise>
		</xsl:choose>	
	</xsl:variable>


	<xsl:template name="Totales">
		<table border="0" width="100%" cellspacing="0" cellPadding="4"  class="redondeo">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="0" width="100%" cellSpacing="0" cellPadding="2">
							<tbody>
								<tr>
									<td valign="top" align="left" width="58%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:if test="/pe1:CreditNote!=''">
												<br/><b><u>Documento que Modifica:</u></b>
												<br/>	
													<xsl:call-template name="Folio_Ref"/>
												<br/><br/><b><u>Código y Descripción del Motivo de la Nota:</u></b>
												<br/>	
												<xsl:value-of select="//cac:DiscrepancyResponse/cbc:ResponseCode"/>&#xA0;&#xA0;<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description" />
											</xsl:if>
											<xsl:if test="/pe2:DebitNote!=''">
												<br/><b><u>Documento que Modifica:</u></b>
												<br/>	
													<xsl:call-template name="Folio_Ref"/>
												<br/><br/><b><u>Código y Descripción del Motivo de la Nota:</u></b>
												<br/>	
												<xsl:value-of select="//cac:DiscrepancyResponse/cbc:ResponseCode"/>&#xA0;&#xA0;<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description" />
											</xsl:if>
										
											<br/>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='16'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='16'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='16'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>	
											<br/>
											<br/>
											<strong>
											Convenios de Recaudo:
											</strong>
											<br/><br/>
											<xsl:variable name="VAdicional17">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='17'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo='17'">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo='17'">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>	
											</xsl:variable>
											<!-- <xsl:value-of select="$VAdicional17"/> -->
											<xsl:if test="$VAdicional17">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<!--<xsl:value-of select="$ValorAdicional3"/>-->
													<xsl:value-of select="substring-before($VAdicional17,'|')"/>

													<br/>
													<xsl:call-template name="descripcion_glosa">
														<xsl:with-param name="resto" select="substring-after($VAdicional17,'|')"/>
													</xsl:call-template>
												</font>
											</xsl:if>
											<xsl:variable name="VAdicional05">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='05'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo='05'">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo='05'">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>	
											</xsl:variable>
											<xsl:if test="$VAdicional05 !='-'">
												<xsl:if test="$VAdicional05 !=''">
												<br/><xsl:value-of select="$VAdicional05"/>
												</xsl:if>
											</xsl:if>
											<br/><br/><strong>Son: </strong> <xsl:value-of select="//cbc:Note[@languageLocaleID='1000']"/>
										</font>
									</td>
										<td valign="top" align="left" width="2%"  >
										<font face="Arial, Helvetica, sans-serif" size="2">
										
										</font>
									</td>
									<td valign="top" align="left" width="40%"  >
										<table border="0" width="100%" cellSpacing="0" cellPadding="2">
											<tr>
												<br/>
												<br/>
											</tr>
											<tr>
												<td valign="top" align="left" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<b>Valor de Venta de Operaciones Gratuitas :</b>
													</font>
												</td>
												<td valign="top" align="right" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:call-template name="SimboloMoneda"/>
														<xsl:value-of select="format-number($OpeGrat,'###,###,##0.00','pen')"/>&#xA0;
													</font>
												</td>
											</tr>
											<xsl:if test="$OPExonerada >'1'">
											<tr>
												<td valign="top" align="left" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<b>Valor de Venta Inafectas :</b>
													</font>
												</td>
												<td valign="top" align="right" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:call-template name="SimboloMoneda"/>
														<xsl:value-of select="format-number($OPExonerada,'###,###,##0.00','pen')"/>&#xA0;
													</font>
												</td>
											</tr>
											</xsl:if>
											<xsl:if test="$OPInafecta >'1'">
											<tr>
												<td valign="top" align="left" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<b>Valor de Venta Exonerada :</b>
													</font>
												</td>
												<td valign="top" align="right" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:call-template name="SimboloMoneda"/>
														<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>&#xA0;
													</font>
												</td>
											</tr>
											</xsl:if>
											<xsl:if test="$TotDesc >'1'">
											<tr>
												<td valign="top" align="left" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<b>Valor Total de Descuentos:</b>
													</font>
												</td>
												<td valign="top" align="right" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:call-template name="SimboloMoneda"/>
														<xsl:value-of select="format-number($TotDesc,'###,###,##0.00','pen')"/>&#xA0;
													</font>
												</td>
											</tr>
											</xsl:if>
											<xsl:if test="$TotAmticipos >'1'">
											<tr>
												<td valign="top" align="left" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<b>Valor Total de Anticipos:</b>
													</font>
												</td>
												<td valign="top" align="right" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:call-template name="SimboloMoneda"/>
														<xsl:value-of select="format-number($TotAmticipos,'###,###,##0.00','pen')"/>&#xA0;
													</font>
												</td>
											</tr>
											</xsl:if>
											<tr>
												<td valign="top" align="left" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<b>Valor de Venta :</b>
													</font>
												</td>
												<td valign="top" align="right" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:call-template name="SimboloMoneda"/>
														<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>&#xA0;
													</font>
												</td>
											</tr>
											<tr>
												<td valign="top" align="left" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<b>I.G.V. :</b>
													</font>
												</td>
												<td valign="top" align="right" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:call-template name="SimboloMoneda"/>
														<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
													</font>
												</td>
											</tr>
											<tr>
												<td valign="top" align="left" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<b>Precio Total :</b>
													</font>
												</td>
												<td valign="top" align="right" width="58%"  >
													<font face="Arial, Helvetica, sans-serif" size="2">
														<xsl:call-template name="SimboloMoneda"/>
														<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
															<font face="Arial, Helvetica, sans-serif" size="2">
																<strong>
																<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;
																</strong>
															</font>
														</xsl:if>
														<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
															<font face="Arial, Helvetica, sans-serif" size="2">
															<strong>
																<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;
															</strong>
															</font>
														</xsl:if>
													</font>
												</td>
											</tr>
											<tr>
												<td valign="top" align="left" width="58%"  colspan="2">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<br/>
												<br/>
														<b>FECHA LIMITE DE PAGO : &#xA0;
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
															<xsl:if test="pe:Codigo='18'">
																<xsl:value-of select="pe:Valor"/>
															</xsl:if>
														</xsl:for-each>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
															<xsl:if test="pe1:Codigo='18'">
																<xsl:value-of select="pe1:Valor"/>
															</xsl:if>
														</xsl:for-each>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
															<xsl:if test="pe2:Codigo='18'">
																<xsl:value-of select="pe2:Valor"/>
															</xsl:if>
														</xsl:for-each>
														</b>
													</font>
												</td>
											</tr>
										</table>
									</td>
									
								</tr>								
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="descripcion_glosa">

		<xsl:param name="resto"/>
		<xsl:value-of select="substring-before($resto,'|')"/>
		<br/>
		<xsl:variable name="res" select="substring-after($resto,'|')"/>

		<xsl:if test="$res!=''">
			<xsl:call-template name="descripcion_glosa">
				<xsl:with-param name="resto" select="$res"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>


	<xsl:template name="MontoLiteral">
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td align="left" width="100%" colspan="2">
						<font face="Arial, Helvetica, sans-serif" size="0.5">
							<strong>SON:</strong>&#xA0;
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
								<xsl:if test="cbc:ID='1000'">
									<xsl:value-of select="cbc:Value"/>
								</xsl:if>
							</xsl:for-each>

							<!--<xsl:value-of select="//cbc:Note"/>-->
							<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']"/>
						</font>
					</td>

					<td align="left" width="50%">
						<font face="Arial, Helvetica, sans-serif" size="0.5">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2001'">
									<strong>COMPROBANTE DE PERCEPCION</strong>Monto de Percepción: <xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/> 
							Total a Pagar: <xsl:value-of select="format-number(sac:TotalAmount,'###,###,##0.00','pen')"/></xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td align="left" width="100%" colspan="2">
					<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
						<font face="Arial, Helvetica, sans-serif" size="0.5">
							<strong><xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='88'">
												<xsl:if test="pe:Valor !='-' and pe:Valor !=''" >
													<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='88'">
												<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''" >
													<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='88'">
												<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''" >
													<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each></strong>
						</font>
						</xsl:if>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="DetalleDetraccion">
		<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
			<tbody>
				<tr>
					<td width="50%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Detracción</strong>&#xA0;
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:value-of select="format-number(cbc:Percent,'###,###,##0.00','pen')"/>%</xsl:if>
							</xsl:for-each>
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode/@listID = '1001'">
								<xsl:value-of select="format-number(//cac:PaymentTerms/cbc:PaymentPercent,'###,###,##0.00','pen')"/>%</xsl:if>
							<!--	<xsl:value-of select="//cac:PaymentTerms/cbc:PaymentPercent"/>%</xsl:if>-->
						</font>
					</td>
					<td width="50%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Monto</strong>&#xA0;
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode/@listID = '1001'">
								<xsl:value-of select="format-number(//cac:PaymentTerms/cbc:Amount,'###,###,##0.00','pen')"/>
							</xsl:if>
						</font>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<font face="Calibri" size="1">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
								<xsl:if test="cbc:ID='3001' and cbc:Value!=''">OPERACIÓN SUJETA A DETRACCIÓN CUENTA BANCO DE LA NACIÓN<strong><xsl:value-of select="cbc:Value"/></strong></xsl:if>
							</xsl:for-each>
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode/@listID = '1001'">OPERACIÓN SUJETA A DETRACCIÓN CUENTA BANCO DE LA NACIÓN<strong><xsl:value-of select="//cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID"/></strong></xsl:if>
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="Folio_Ref">
	<xsl:if test="/pe1:CreditNote">
		<xsl:value-of select="substring-before(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID, '-')"/>-
		<xsl:value-of select="format-number(substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'),'00000000')"/>
	</xsl:if>
	<xsl:if test="/pe2:DebitNote">
		<xsl:value-of select="substring-before(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID, '-')"/>-
		<xsl:value-of select="format-number(substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-'),'00000000')"/>
	</xsl:if>
</xsl:template>

	<xsl:template name="SimboloMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\xml\Facturas\20101266819&#x2D;01&#x2D;FF14&#x2D;11000010.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="true"/><advancedProp name="bGenerateByteCode" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="xsltVersion" value="2.0"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->