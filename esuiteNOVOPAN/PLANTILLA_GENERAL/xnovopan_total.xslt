<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
	xmlns:ccts="urn:un:unece:uncefact:documentation:2"
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
	exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="TipoDeMoneda_Total">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="son-pesos">
		<table border="0" cellpadding="0" cellspacing="0" >
			<tr>
				<td>
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>SON: </strong>


						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='01'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='01'">
								<xsl:value-of select="pe1:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='01'">
								<xsl:value-of select="pe2:Valor"/>
							</xsl:if>
						</xsl:for-each>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']" />
							</xsl:if>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Total">
		<table border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000" >
			<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode !='00'">
			
			<!--xsl:if test="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount!=''">
				<tr>
					<td width="60%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Descuento Global</strong>
						</font>
					</td>
					<td width="40%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount, '###,###,##0.00', 'pen')"/>&#xA0;
						</font>
					</td>
				</tr>
			</xsl:if-->
			
			<!--xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
				<xsl:if test="cbc:ID='2005'">
					<xsl:if test="cbc:PayableAmount!='0'">
						<tr>
							<td width="60%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Total Descuentos</strong>
								</font>
							</td>
							<td width="40%" align="right">
				<xsl:choose>
				<xsl:when test="//cac:LegalMonetaryTotal/cbc:PrepaidAmount!='0.00'">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>0.00</strong>
								</font>
				</xsl:when>
								<xsl:when test="//cac:LegalMonetaryTotal/cbc:PrepaidAmount!='0'">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>0.00</strong>
								</font>
				</xsl:when>

				<xsl:otherwise>
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
								</font>
				</xsl:otherwise>
				</xsl:choose>
							</td>
						</tr>
					</xsl:if>
				</xsl:if>
			</xsl:for-each-->
			<tr>
							<td width="60%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Total Descuentos</strong>
								</font>
							</td>
							<td width="40%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='2005'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
						</xsl:for-each>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
						
						<xsl:variable name="Todescuento">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='2005'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
						</xsl:for-each>

							</xsl:variable>
 										<xsl:if test="$Todescuento = ''">
										  0.00&#xA0;
										</xsl:if>
						</xsl:if>
						</font>
							</td>
						</tr>
			<tr>
				<td width="60%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total Gravado</strong>
					</font>
				</td>
				<td width="40%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='1001'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
						</xsl:for-each>
						</xsl:if>
						

						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>&#160;
						</xsl:if>
						
						
					</font>
				</td>
			</tr>
			
			<tr>
				<td width="60%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total No Gravado</strong>
					</font>
				</td>
				<td width="40%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						
							<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='1002'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
						</xsl:for-each>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">					
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>					
						<xsl:variable name="Inafecto">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>
							<xsl:value-of select="$Inafecto"/>
 										<!--<xsl:if test="$Inafecto = '' or $Inafecto =0">
										 0.00&#xA0;
										</xsl:if>-->
										<xsl:if test="$Inafecto = '' ">
										 0.00&#xA0;
										</xsl:if>
                    </xsl:if>	
					</font>
				</td>
			</tr>
						<tr>
				<td width="60%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total Anticipo</strong>
					</font>
				</td>
				<td width="40%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:variable name="TotalAnticipo">
							<xsl:value-of select="0" />
							<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:PrepaidAmount" />
						</xsl:variable>

						<xsl:value-of select="format-number($TotalAnticipo, '###,###,##0.00', 'pen')" />&#xA0;
					</font>
				</td>
			</tr>
			<tr>
				<td width="60%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total Exonerado</strong>
					</font>
				</td>
				<td width="40%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='1003'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
						</xsl:for-each>
						</xsl:if>
					<xsl:if test="//cbc:UBLVersionID='2.1'">					
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:variable name="Exonerado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>
								<xsl:value-of select="$Exonerado"/>
 										<xsl:if test="$Exonerado = ''">
										  0.00&#xA0;
										</xsl:if>
                                </xsl:if>	
					</font>
				</td>
			</tr>
			<xsl:if test="//cbc:UBLVersionID='2.0'">	
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
					<xsl:if test="cbc:ID='1004'">
			<tr>
				<td width="60%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total Gratuito</strong>
					</font>
				</td>
				<td width="40%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1004'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;
										</xsl:if>
									</xsl:for-each>
					</font>
				</td>
			</tr>
				</xsl:if>
				</xsl:for-each>
				</xsl:if>
				<!--xsl:if test="//cbc:UBLVersionID='2.1'">	
				<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
				<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
			<tr>
				<td width="60%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total Gratuito</strong>
					</font>
				</td>
				<td width="40%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
		<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
		<xsl:if test="cbc:TaxableAmount!='0.00'">
		<xsl:value-of select="format-number(cbc:TaxableAmount,'###,###,##0.00','pen')"/>&#xA0;
		</xsl:if>
		</xsl:if>
		</xsl:for-each>
		<xsl:variable name="Grati">
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
		<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
		<xsl:if test="cbc:TaxableAmount!='0.00'">
		<xsl:value-of select="format-number(cbc:TaxableAmount,'###,###,##0.00','pen')"/>&#xA0;
		</xsl:if>
		</xsl:if>
		</xsl:for-each>
					</xsl:variable>
				<xsl:if test="$Grati = ''">
										  0.00&#xA0;
										</xsl:if>
		
					</font>
				</td>
			</tr>
				</xsl:if>
				</xsl:for-each>
					
				</xsl:if-->

			<xsl:if test="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount!=''">
			</xsl:if>

			<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
			<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				<tr>
					<td width="60%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Total IGV 18%</strong>
						</font>
					</td>
					<td width="40%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!='0.00'">
										<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
									</xsl:if>
									</xsl:if>
							
									<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
											<xsl:if test="cbc:TaxAmount!='0.00'">
											<xsl:value-of select="format-number(cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
										</xsl:if>
										</xsl:if>
									</xsl:for-each>

									<xsl:variable name="GratiIGV">
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
					<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
					<xsl:if test="cbc:TaxableAmount!='0.00'">
		<xsl:value-of select="format-number(cbc:TaxableAmount,'###,###,##0.00','pen')"/>&#xA0;
		</xsl:if>
		</xsl:if>
		</xsl:for-each>
					</xsl:variable>
				<xsl:if test="$GratiIGV = ''">
										  0.00&#xA0;
										</xsl:if>
						</font>
					</td>
				</tr>
			</xsl:for-each>
			</xsl:if>
			<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
			<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				<tr>
					<td width="60%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Total IGV 18%</strong>
						</font>
					</td>
					<td width="40%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
       								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#160;
									</xsl:if>
								</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#160;
									</font>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#160;
									</font>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:variable name="IGV">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
								<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> -->
									<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> -->
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> -->
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</xsl:variable>


                       <!--<xsl:call-template name="SimboloMoneda"/> -->
					   <xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
						</font>
					</td>
				</tr>
			</xsl:for-each>
			</xsl:if>
		
</xsl:if>


<!-- JDL OCULTA LOS RESUMENES SOLO BOLETA -->
			<xsl:if test="/pe1:CreditNote  or  /pe2:DebitNote">
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID='2005'">
			<xsl:if test="cbc:PayableAmount!='0'">
			
			<tr>
					<td width="60%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Descuento Global</strong>
						</font>
					</td>
					<td width="40%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount, '###,###,##0.00', 'pen')"/>&#xA0;
						</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:if>
			</xsl:for-each>
			
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
				<xsl:if test="cbc:ID='2005'">
					<xsl:if test="cbc:PayableAmount!='0'">
						<tr>
							<td width="60%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Total Descuentos</strong>
								</font>
							</td>
							<td width="40%" align="right">
				<xsl:choose>
				<xsl:when test="//cac:LegalMonetaryTotal/cbc:PrepaidAmount!='0.00'">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>0.00</strong>
								</font>
				</xsl:when>
								<xsl:when test="//cac:LegalMonetaryTotal/cbc:PrepaidAmount!='0'">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>0.00</strong>
								</font>
				</xsl:when>

				<xsl:otherwise>
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</font>
				</xsl:otherwise>
				</xsl:choose>
							</td>
						</tr>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			
			<tr>
				<td width="60%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total Gravado</strong>
					</font>
				</td>
				<td width="40%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='1001'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
						</xsl:for-each>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:if test="cbc:TaxableAmount!='0.00'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
						<!--<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
						
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>-->
						
						
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>
						
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						
								<xsl:variable name="Gravado">
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
						<xsl:if test="cbc:TaxableAmount!='0.00'">
						<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
						</xsl:if>
						</xsl:if>
						</xsl:for-each>

								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>
							<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
							  <xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:call-template name="SimboloMoneda"/> 
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								
							</xsl:if>
							</xsl:if>
							</xsl:for-each>-->
							</xsl:variable>
 									<xsl:value-of select="$Gravado"/>
 									
							<xsl:if test="$Gravado = ''">
										  0.00&#xA0;
										</xsl:if>
						</xsl:if>
					</font>
				</td>
			</tr>
			
			<tr>
				<td width="60%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total No Gravado</strong>
					</font>
				</td>
				<td width="40%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='1002'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
						</xsl:for-each>
						</xsl:if>
				<xsl:if test="//cbc:UBLVersionID='2.1'">					
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>--></xsl:if>
						</xsl:for-each>
						<!--xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
							</xsl:if>
						</xsl:for-each-->
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
								<xsl:if test="cbc:TaxableAmount!='0.00'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if></xsl:if>
						</xsl:for-each>
						
						<!--xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
							</xsl:if>
							</xsl:if>
						</xsl:for-each-->
						 <xsl:variable name="Inafecto">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> -->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
								<xsl:if test="cbc:TaxableAmount!='0.00'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if></xsl:if>
						</xsl:for-each>
						
							</xsl:variable>
 										<xsl:if test="$Inafecto = ''">
											0.00&#xA0;
										</xsl:if>

                                </xsl:if>		
					</font>
				</td>
			</tr>
						<tr>
				<td width="60%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total Anticipo</strong>
					</font>
				</td>
				<td width="40%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:variable name="TotalAnticipo">
							<xsl:value-of select="0" />
							<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:PrepaidAmount" />
						</xsl:variable>

						<xsl:value-of select="format-number($TotalAnticipo, '###,###,##0.00', 'pen')" />&#xA0;
					</font>
				</td>
			</tr>
			<tr>
				<td width="60%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total Exonerado</strong>
					</font>
				</td>
				<td width="40%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='1003'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
						</xsl:for-each>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">					
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>--></xsl:if>
						</xsl:for-each>
                       
					   
					   <!--
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:if test="cbc:TaxableAmount='0.00'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:if test="cbc:TaxableAmount='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
							</xsl:if>
							</xsl:if>
						</xsl:for-each>-->
						 <xsl:variable name="Exonerado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> -->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>


 										<xsl:if test="$Exonerado = ''">
											0.00&#xA0;
										</xsl:if>

                                </xsl:if>
					</font>
				</td>
			</tr>

			<xsl:if test="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount!=''">
				<tr>
					<td width="60%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Total Otros Cargos</strong>
						</font>
					</td>
					<td width="40%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount, '###,###,##0.00', 'pen')"/>&#xA0;
						</font>
					</td>
				</tr>
			</xsl:if>

			<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				<tr>
					<td width="60%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Total IGV 18%</strong>
						</font>
					</td>
					<td width="40%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
								<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
						</font>
					</td>
				</tr>
			</xsl:for-each>

			<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
				<tr>
					<td width="60%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Total IGV 18%</strong>
						</font>
					</td>
					<td width="40%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:variable name="IGV">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
								<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> -->
									<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> -->
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> -->
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</xsl:variable>


                       <!--<xsl:call-template name="SimboloMoneda"/> -->
					   <xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
						
						</font>
					</td>
				</tr>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine/cac:TaxTotal">
				<tr>
					<td width="60%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Total IGV 18%</strong>
						</font>
					</td>
					<td width="40%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
		<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:variable name="IGV">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
								<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> -->
									<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> -->
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> -->
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</xsl:variable>


                       <!--<xsl:call-template name="SimboloMoneda"/> -->
					   <xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
						</font>
					</td>
				</tr>
			</xsl:for-each>
</xsl:if>


			<tr>
				<td width="60%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total <xsl:call-template name="TipoDeMoneda_Total" /></strong>
					</font>
				</td>
				<td width="40%" align="right">
				<xsl:if test="//cbc:UBLVersionID='2.0'">
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
						</font>
					</xsl:if>
					<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
						</font>
					</xsl:if>
					</xsl:if>
					<xsl:if test="//cbc:UBLVersionID='2.1'">
						
							<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
							<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
							</xsl:if>
							<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
							<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
							<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
							</xsl:if>	
							<!--<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
							<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/></font>
							</xsl:if>	-->
								</xsl:if>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Transferencia">
		<table border="0" width="100%" cellpadding="1">
			<tr>
				<td>
					
			<xsl:choose>
				<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">
						<center>
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
								<b>TRANSFERENCIA GRATUITA</b>
							</font>
						</center>
				</xsl:when>
				<xsl:otherwise>
				
				</xsl:otherwise>
				</xsl:choose>
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0'">
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><br/></font>
					</xsl:if>
				

				
				</td>
				
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template name="Leyenda">
		<table border="0" width="100%" cellpadding="1" cellspacing="1">
			<tr>
					<td>&#160;
					</td>
			</tr>
			<tr>
 				<td width="60%" colspan="2">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:choose>
							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">FACTURA ELECTRÓNICA</xsl:when>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">BOLETA DE VENTA ELECTRÓNICA</xsl:when>
								<xsl:otherwise>
									<xsl:if test="/pe2:DebitNote">NOTA DE DÉBITO ELECTRÓNICA</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="PreparadoPor"> 
		<table border="0" width="100%" cellpadding="1" cellspacing="1">
			<tr>
					<td>&#160;
					</td>
			</tr>
			<!--<tr>
 				<td width="60%" colspan="2">
					<font face="Arial, Helvetica, sans-serif" size="1">DE NO SER PAGADO EL VALOR DE ESTA
						<xsl:choose>
							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">FACTURA ELECTRÓNICA</xsl:when>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">BOLETA DE VENTA ELECTRÓNICA</xsl:when>
								<xsl:otherwise>
									<xsl:if test="/pe2:DebitNote">NOTA DE DÉBITO ELECTRÓNICA</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						<br/>A SU VENCIMIENTO EL DEUDOR SE OBLIGA A PAGAR A PETROPERU S.A. LA TASA MÁXIMA
						<br/>DE INTERÉS COMPENSATORIO Y LA TASA MÁXIMA DE INTERÉS MORATORIO Y LOS GASTOS
						<br/>ADMINISTRATIVOS PERMITIDOS POR LEY
					</font>
				</td>
			</tr>-->
			<tr>
				<td width="10%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong></strong>
					</font>
				</td>
				<td width="80%" align="left" size="1">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong></strong>

					</font>
				</td>
				
			</tr>
			<tr>
				<td width="10%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong></strong>
					</font>
				</td>
				<td width="30%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong></strong>
						<!--<font face="Arial, Helvetica, sans-serif" size="1"></font>-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='14'">
														<xsl:value-of select="pe:Valor"/>
												</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='14'">
														<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='14'">
														<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>
		</table>
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

	<xsl:template name="Referencia">
		   		<table border="0" rules="cols" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
		      		<tbody>
		         		<tr>
		            		<td>
		               			<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
		                  		<tbody>
				  			
							<xsl:if test="/pe1:CreditNote">
								<tr>
                        		<td width="100%" align="left">
                           			<font face="Arial, Helvetica, sans-serif" size="1">DOCUMENTO(S) DE REFERENCIA :</font>
                        		</td>
                     		</tr>
                     			<tr>
	                        		<td>
	                           			<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="50%">
	                              		<tbody>
	                                 		<tr>
	                                    		<td width="20%" align="center">
	                                       			<font face="Arial, Helvetica, sans-serif" size="1">
	                                          			<strong>Tipo Documento</strong>
	                                       			</font>
	                                    		</td>
	                                    		<td width="40%" align="center">
	                                       			<font face="Arial, Helvetica, sans-serif" size="1">
	                                          			<strong>Serie</strong>
	                                       			</font>
	                                    		</td>
												<td width="40%" align="center">
	                                       			<font face="Arial, Helvetica, sans-serif" size="1">
	                                          			<strong>Número</strong>
	                                       			</font>
	                                    		</td>
										
	                              			</tr>
	                                    	<xsl:for-each select="//cac:DespatchDocumentReference">
	                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
	                                       			<tr>
	                                           			<td width="30%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="1">  
	                                               				<xsl:choose>
	                                                  				<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
	                                                   				<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
	                                                   				<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
	                                                   				<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
	                                                   				<xsl:otherwise>Documento NN</xsl:otherwise>
	                                               				</xsl:choose>
	                                               			</font>
	                                           			</td>
													
	                                           			<td width="20%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="1">
	                                               				<!--<xsl:value-of select="cbc:ID"/>-->
																<xsl:value-of select="substring-before(cbc:ID,'-')"/>
	                                               			</font>
	                                           			</td>

														<td width="30%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="1">
	                                               				<!--<xsl:value-of select="cbc:ID"/>-->
																<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
	                                               			</font>
	                                           			</td>
													
	                                       			</tr>
	                                    		</xsl:if>
	                                    	</xsl:for-each>
	                                    	<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
	                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
	                                        		<tr>
	                                           			<td width="30%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="1">  
	                                               				<xsl:choose>
			                                                    	<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
			                                                    	<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
			                                                    	<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
			                                                    	<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
			                                                    	<xsl:otherwise>Documento NN</xsl:otherwise>
			                                                 	</xsl:choose>
	        		                                    	</font>
	                		                			</td>
													
	                                             		<td width="20%" align="center">
	                                                		<font face="Arial, Helvetica, sans-serif" size="1">
	                                                			<!--<xsl:value-of select="cbc:ID"/>-->
																<xsl:value-of select="substring-before(cbc:ID,'-')"/>
	                                                		</font>
	                                             		</td>
														<td width="30%" align="center">
	                                                		<font face="Arial, Helvetica, sans-serif" size="1">
	                                                			<!--<xsl:value-of select="substring-after(cbc:ID,'-')"/>-->
																<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
	                                                		</font>
	                                             		</td>
	                                          		</tr>
	                                       		</xsl:if>
	                                    	</xsl:for-each>
	                              		</tbody>
	                           			</table>
	                        		</td>

                     		</tr>

							</xsl:if>
            				<xsl:if test="/pe2:DebitNote">				

							<tr>
                        		<td width="100%" align="left">
                           			<font face="Arial, Helvetica, sans-serif" size="1">DOCUMENTO(S) DE REFERENCIA :</font>
                        		</td>
                     		</tr>
                     		<tr>
                        		<td>
                           			<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="50%">
                              		<tbody>
                                 		<tr>
                                    		<td width="20%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="1">
                                          			<strong>Tipo Documento</strong>
                                       			</font>
                                    		</td>
                                    		<td width="40%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="1">
                                          			<strong>Serie</strong>
                                       			</font>
                                    		</td>
											<td width="40%" align="center">
	                                       			<font face="Arial, Helvetica, sans-serif" size="1">
	                                          			<strong>Número</strong>
	                                       			</font>
	                                    	</td>
                              			</tr>
                                    	<xsl:for-each select="//cac:DespatchDocumentReference">
                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
                                       			<tr>
                                           			<td width="30%" align="center">
                                              			<font face="Arial, Helvetica, sans-serif" size="1">  
                                               				<xsl:choose>
                                                  				<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
                                                   				<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
                                                   				<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
                                                   				<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
                                                   				<xsl:otherwise>Documento NN</xsl:otherwise>
                                               				</xsl:choose>
                                               			</font>
                                           			</td>
                                           			<td width="20%" align="center">
                                              			<font face="Arial, Helvetica, sans-serif" size="1">
                                               				<!--<xsl:value-of select="cbc:ID"/>-->
															<xsl:value-of select="substring-before(cbc:ID,'-')"/>
                                               			</font>
                                           			</td>
													<td width="30%" align="center">
                                                		<font face="Arial, Helvetica, sans-serif" size="1">
                                                			<!--<xsl:value-of select="substring-after(cbc:ID,'-')"/>-->
															<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
                                                		</font>
                                             		</td>
                                       			</tr>
                                    		</xsl:if>
                                    	</xsl:for-each>
                                    	<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
                                        		<tr>
                                           			<td width="30%" align="center">
                                              			<font face="Arial, Helvetica, sans-serif" size="1">  
                                               				<xsl:choose>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
		                                                    	<xsl:otherwise>Documento NN</xsl:otherwise>
		                                                 	</xsl:choose>
        		                                    	</font>
                		                			</td>
                                             		<td width="20%" align="center">
                                                		<font face="Arial, Helvetica, sans-serif" size="1">
                                                			<!--<xsl:value-of select="cbc:ID"/>-->
															<xsl:value-of select="substring-before(cbc:ID,'-')"/>
                                                		</font>
                                             		</td>
													<td width="30%" align="center">
                                                		<font face="Arial, Helvetica, sans-serif" size="1">
                                                			<!--<xsl:value-of select="substring-after(cbc:ID,'-')"/>-->
															<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
                                                		</font>
                                             		</td>
                                          		</tr>
                                       		</xsl:if>
                                    	</xsl:for-each>
                              		</tbody>
                           			</table>
                        		</td>

                     		</tr>

							</xsl:if> 

							
                  		</tbody>
               			</table>
            		</td>
        		</tr>
      		</tbody>
   		</table>
	</xsl:template>
	<xsl:template name="fecha_ddmmaa_ref">
		<xsl:variable name="aa">
			<xsl:value-of select="substring-before(FchRef,'-')"/>
		</xsl:variable>
		<xsl:variable name="mmdd">
			<xsl:value-of select="substring-after(FchRef,'-')"/>
		</xsl:variable>
		<!--prefijo Fecha Emision Mes -->
		<xsl:variable name="mm">
			<xsl:value-of select="substring-before($mmdd,'-')"/>
		</xsl:variable>
		<xsl:variable name="dd">
			<xsl:value-of select="substring-after($mmdd,'-')"/>
		</xsl:variable>
		<!-- MES -Nombre -->
		<xsl:value-of select="concat($dd,'-', $mm, '-' , $aa)"/>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->