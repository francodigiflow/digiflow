<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	 <xsl:template name="DatosCredito">
		<table width="100%" border="0" cellpadding="1" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
			<tr>
				<td>
				<strong>CUOTAS: </strong>
				</td>				
			</tr>
			<tr>
				<td align="center">
						<table width="50%" border="1" cellSpacing="0" borderColor="#000000" cellPadding="2" style="font-family :Arial,Helvetica,sans-serif;font-size:11px;color:#000000">
							<tr>
								<td width="10%" align="center" size="1">
										<strong>N° de Cuota</strong>
								</td>
								<td width="15%" align="center" size="1">
										<strong>Fecha de Vencimiento</strong>
								</td>
								<td width="15%" align="center" size="1">
										<strong>Tipo de Moneda</strong>
								</td>
								<td width="15%" align="center" size="1">
										<strong>Monto de Cuota</strong>
								</td>
								
							</tr>
							<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
							<xsl:if test="cbc:ID !='Detraccion'">
								<xsl:if test="cbc:PaymentMeansID !='Credito'">	
									<tr>
											
											<td width= "10%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
													<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
												</font>							
											</td>
											<td width= "15%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
												<xsl:value-of select="cbc:PaymentDueDate"/>
												</font>
											</td>
											<td width= "15%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
												<xsl:call-template name="LetraMoneda"/>
												</font>
											</td>
											<td width= "15%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
													<!--<xsl:value-of select="cbc:Amount"/>-->
													<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
												</font>
											</td>
											
									</tr>
								</xsl:if>
							</xsl:if>
							</xsl:for-each>
							
							<xsl:for-each select="/pe1:CreditNote/cac:PaymentTerms">
							<xsl:if test="cbc:ID !='Detraccion'">
								<xsl:if test="cbc:PaymentMeansID !='Credito'">	
									<tr>
											<td width= "10%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
													<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
												</font>							
											</td>
											<td width= "15%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
												<xsl:value-of select="cbc:PaymentDueDate"/>
												</font>
											</td>
											<td width= "15%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
												<xsl:call-template name="LetraMoneda"/>
												</font>
											</td>
											<td width= "15%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
													<!--<xsl:value-of select="cbc:Amount"/>-->
													<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
												</font>
											</td>
										</tr>
								</xsl:if>
							</xsl:if>
							</xsl:for-each>				

						</table>
				</td>
			</tr>
		</table>

	</xsl:template>

	 <xsl:template name="Adicionales">
		<table width="100%" border="0" cellpadding="1" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
			<tr>
				<td>
				<strong>Información Adicional: </strong>
				</td>				
			</tr>
			<tr>
				<td align="center">
						<table width="100%" border="1" cellSpacing="0" borderColor="#000000" cellPadding="2" style="font-family :Arial,Helvetica,sans-serif;font-size:11px;color:#000000">
							<tr>
								<td width="8%" align="center" size="1">
										<strong>1</strong>
								</td>
								<td width="15%" align="center" size="1">
										<strong>Observación</strong>
								</td>
								<td width="77%" align="left" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='03'">
											<xsl:if test="pe:Valor !='-'">
												<xsl:value-of select="pe:Valor"/> 
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
								</td>
								
							</tr>
						</table>
				</td>
			</tr>
			<tr>
				<td>
				 Autorizado a ser emisor electrónico mediante R.I. SUNAT N° 340050004781
				</td>				
			</tr>
		</table>

	</xsl:template>


	<xsl:template name="tipodocu_">
		<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode ='01'">FACTURA</xsl:if>
		<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode ='03'">BOLETA</xsl:if>
		<xsl:if test="/pe1:CreditNote">NOTA DE CRÉDITO</xsl:if>
		<xsl:if test="/pe2:DebitNote">NOTA DE DÉBITOS</xsl:if>
	</xsl:template>

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:template name="son-pesos">
		<table border="0" cellpadding="1" cellspacing="1" width="100%">
			<tr>
				<td width="100%" colspan="4">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong> SON:</strong>
						
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							&#xA0;<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']"/>
						</xsl:if>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="SimboloMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$ </xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">? </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$ </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">? </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$ </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">? </xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
		<xsl:template name="LetraMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">Soles </xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">Dolares </xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">Euros </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">Soles </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">Dolares </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">Euros </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">Soles </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">Dolares </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">Euros </xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
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


	<xsl:template name="Total">

		<table border="0" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000" heigth="100%">
			<tr>
				<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<!--OPERACIÃ“N GRATUITA-->
				<tr>
					<td valign="top" width="60%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>OP. GRATUITA&#160;
						</strong>
					</font>
					</td>
					<td align="left" >
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>
								<xsl:call-template name="SimboloMoneda"/>
							</strong>
						</font>
					</td>
					<td align="right" width="12.5%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:value-of select="format-number($OpeGrat,'###,###,##0.00','pen')"/>&#xA0;
					</font>
					</td>
				</tr>
			<!--OPERACIÃ“N EXONERADAS-->	
				<tr>
					<td valign="top" width="60%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="2">						
						<strong>OP. EXONERADAS&#160;
						</strong>
					</font>
					</td>
					<td align="left" >
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>
								<xsl:call-template name="SimboloMoneda"/>
							</strong>
						</font>
					</td>
					<!--> Total Exonerado<-->
					<td width="40%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:value-of select="format-number($OPExonerada,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
					</font>
					</td>
				</tr>
			<!--OPERACIÃ“N INAFECTA-->	
				<tr>
					<td valign="top" width="60%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<Strong>OP. INAFECTA&#160;
						</Strong>
					</font>
					</td>
					<td align="left" >
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>
								<xsl:call-template name="SimboloMoneda"/>
							</strong>
						</font>
					</td>
					<!--> Total Gravado<-->
					<td width="40%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="2">
						
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
					</font>
					</td>
				</tr>	
			<!--OPERACIÃ“N GRAVADA-->
				<tr>
					<td valign="top" width="60%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<Strong>OP. GRAVADA&#160;
							</Strong>
						</font>
					</td>
					<td align="left" >
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>
								<xsl:call-template name="SimboloMoneda"/>
							</strong>
						</font>
					</td>
					<!--> Total Gravado<-->
					<td width="40%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>&#xA0;
							</xsl:if>
							
						</font>
					</td>
				</tr>	
			<!--TOT. DSCTO-->
				<tr>
					<td valign="top" width="60%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">	
							<Strong>TOT. DSCTO&#160;
							</Strong>
						</font>
					</td>
					<td align="left" >
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>
								<xsl:call-template name="SimboloMoneda"/>
							</strong>
						</font>
					</td>
					<!-- DESC. GLOBAL -->
					<td width="40%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="2">	
						
					<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:variable name="OpeDesc">
	
							<xsl:if test="/pe:Invoice">
							<xsl:for-each select="/pe:Invoice/cac:AllowanceCharge">
							<xsl:if test="cbc:AllowanceChargeReasonCode='02'">
							<xsl:value-of select="cbc:Amount"/>&#160;
							</xsl:if>
							</xsl:for-each>
							</xsl:if>

							<xsl:if test="/pe1:CreditNote">
							<xsl:for-each select="/pe1:CreditNote/cac:AllowanceCharge">
							<xsl:if test="cbc:AllowanceChargeReasonCode='02'">
							<xsl:value-of select="cbc:Amount"/>&#160;
							</xsl:if>
							</xsl:for-each>
							</xsl:if>

							<xsl:if test="/pe2:DebitNote">
							<xsl:for-each select="/pe2:DebitNote/cac:AllowanceCharge">
							<xsl:if test="cbc:AllowanceChargeReasonCode='02'">
							<xsl:value-of select="cbc:Amount"/>&#160;
							</xsl:if>
							</xsl:for-each>
							</xsl:if>

						</xsl:variable>

		                <xsl:if test="$OpeDesc!=''">
							<xsl:value-of select="format-number($OpeDesc, '###,###,##0.00', 'pen')"/>&#xA0;
						</xsl:if>
						<xsl:if test="$OpeDesc=''">
							<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>&#xA0;
						</xsl:if>
					</xsl:if>
						
					</font>
					</td>
				</tr>
			<!--TOT. ADELANTOS-->
				<tr>
					<td valign="top" width="60%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<Strong>ADELANTOS&#160;
						</Strong>
					</font>
					</td>
					<td align="left" >
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>
								<xsl:call-template name="SimboloMoneda"/>
							</strong>
						</font>
					</td>
					<!--	ANTICIPOS-->
					<td align="right" width="12.5%">
					<font face="Arial, Helvetica, sans-serif" size="2">
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
						
					</font>
					</td>
				</tr>
				<!--ISC-->
				<!-- <tr> -->
					<!-- <td valign="top" width="60%" align="left"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2"> -->
						<!-- <Strong>ISC&#160; -->
						<!-- </Strong> -->
					<!-- </font> -->
					<!-- </td> -->
					<!-- <td align="left" > -->
						<!-- <font face="Arial, Helvetica, sans-serif" size="2"> -->
							<!-- <strong> -->
								<!-- <xsl:call-template name="SimboloMoneda"/> -->
							<!-- </strong> -->
						<!-- </font> -->
					<!-- </td> -->

					<!-- <td align="right" width="12.5%"> -->
					<!-- <font face="Arial, Helvetica, sans-serif" size="2"> -->
						
						<!-- <xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>&#xA0; -->
						
					<!-- </font> -->
					<!-- </td> -->
				<!-- </tr> -->
				<!-- IGV-->
				<tr>
					<td valign="top" width="60%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<Strong>I.G.V.</Strong>&#160;
					</font>
					</td>
					<td align="left" >
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>
								<xsl:call-template name="SimboloMoneda"/>
							</strong>
						</font>
					</td>
					<!--Total IGV-->
					<td align="right" width="12.5%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
		                    	<xsl:if test="cbc:ID = '1003'">
									<xsl:variable name="IGV">
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
											 <xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
												<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#160;
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
											<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
												<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#160;
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
											<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
												<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#160;
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
							<xsl:value-of select="$IGV" />
						 		</xsl:if>
		                  	</xsl:for-each>
						</xsl:if>
							
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
					</font>
					</td>
				</tr>	
				<tr>
				<td align="left" >
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>IMPORTE TOTAL</strong>
					</font>
				</td>
				<td align="left" >
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>
							<xsl:call-template name="SimboloMoneda"/>
						</strong>
					</font>
				</td>
				<td align="right" >
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
				</td>
			</tr>
				</table>
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

	<xsl:template name="CTSTrullinQuiereElSimbolo">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'PEN'">S/.</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'USD'">USD</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'EUR'">EUR</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'PEN'">S/.</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'USD'">USD</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'EUR'">EUR</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'PEN'">S/.</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'USD'">USD</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'EUR'">EUR</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!--FECHA para el simbolo-->
	<xsl:template name="SIMBOLO2">
		<xsl:variable name="ValorDate">
			<xsl:call-template name="Fecha_Simbolo"/>
		</xsl:variable>
		
		<!--MENOR-->
		<xsl:if test="$ValorDate &lt;= '20171231'">
			<xsl:call-template name="CTSTrullinQuiereElSimbolo"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="Fecha_Simbolo">
		<xsl:if test="/pe:Invoice">
			<xsl:variable name="date1" select="substring-before(/pe:Invoice/cbc:IssueDate,'-')"/>
			<xsl:variable name="date2" select="substring-before(substring-after(/pe:Invoice/cbc:IssueDate,'-'),'-')"/>
			<xsl:variable name="date3" select="substring-after(substring-after(/pe:Invoice/cbc:IssueDate,'-'),'-')"/>
			<xsl:value-of select="concat($date1,$date2,$date3)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
			<xsl:variable name="date1" select="substring-before(/pe1:CreditNote/cbc:IssueDate,'-')"/>
			<xsl:variable name="date2" select="substring-before(substring-after(/pe1:CreditNote/cbc:IssueDate,'-'),'-')"/>
			<xsl:variable name="date3" select="substring-after(substring-after(/pe1:CreditNote/cbc:IssueDate,'-'),'-')"/>
			<xsl:value-of select="concat($date1,$date2,$date3)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
			<xsl:variable name="date1" select="substring-before(/pe2:DebitNote/cbc:IssueDate,'-')"/>
			<xsl:variable name="date2" select="substring-before(substring-after(/pe2:DebitNote/cbc:IssueDate,'-'),'-')"/>
			<xsl:variable name="date3" select="substring-after(substring-after(/pe2:DebitNote/cbc:IssueDate,'-'),'-')"/>
			<xsl:value-of select="concat($date1,$date2,$date3)"/>
		</xsl:if>
	</xsl:template>


	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20102256558&#x2D;03&#x2D;BN01&#x2D;00000743.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20520929658&#x2D;01&#x2D;FF11&#x2D;99900001.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"></template><template name="Total"><block path="table/tr/td[1]/font/xsl:for&#x2D;each" x="340" y="27"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="44" y="55"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="90" y="57"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="160" y="87"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="260" y="27"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="15"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="410" y="17"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="40" y="87"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="20" y="27"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="84" y="15"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="130" y="17"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="200" y="47"/><block path="table/xsl:for&#x2D;each" x="300" y="27"/><block path="table/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="55"/><block path="table/xsl:for&#x2D;each/xsl:if" x="410" y="57"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="314" y="85"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if" x="360" y="87"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="360" y="127"/><block path="table/xsl:if/!=[0]" x="274" y="85"/><block path="table/xsl:if" x="320" y="87"/><block path="table/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="400" y="127"/><block path="table/xsl:for&#x2D;each[1]" x="280" y="87"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="15"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if" x="90" y="17"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="320" y="127"/><block path="table/xsl:for&#x2D;each[2]" x="240" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="95"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if" x="90" y="97"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="280" y="127"/><block path="table/xsl:for&#x2D;each[3]" x="200" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/!=[0]" x="124" y="135"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if" x="170" y="137"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="240" y="127"/><block path="table/tr[3]/td[1]/xsl:if/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if/font/xsl:value&#x2D;of" x="40" y="127"/><block path="table/tr[3]/td[1]/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if[1]" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if[1]/font/xsl:value&#x2D;of" x="360" y="87"/><block path="table[1]/tr/td/xsl:if/=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if" x="360" y="87"/><block path="table[1]/tr/td/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if[1]" x="360" y="87"/></template><template match="/"></template><template name="AdicionaDatosEmp"><block path="table/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/=[0]" x="340" y="16"/><block path="table/xsl:for&#x2D;each/xsl:if" x="386" y="18"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="290" y="46"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if" x="336" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="0" y="38"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="16" y="40"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="36" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="340" y="56"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="386" y="58"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="56" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="180" y="56"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="226" y="58"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="60" y="56"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="106" y="58"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]" x="316" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="180" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if" x="226" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/=[0]" x="250" y="46"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if" x="296" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]" x="156" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="60" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if" x="106" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/=[0]" x="130" y="46"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if" x="176" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/td/table/tr/td/xsl:for&#x2D;each" x="276" y="0"/><block path="table/td/table/tr/td/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/td/table/tr/td/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/td/table/tr/td/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="290" y="46"/><block path="table/td/table/tr/td/xsl:for&#x2D;each/xsl:if/xsl:if" x="336" y="48"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each" x="276" y="0"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="290" y="46"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each/xsl:if/xsl:if" x="336" y="48"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->