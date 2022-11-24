<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

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

	<xsl:variable name="DescuentoTotal">
		<xsl:if test="cbc:ID!='1001' or cbc:ID!='1002' or cbc:ID!='1003' or cbc:ID!='2001' or cbc:ID!='2002' or cbc:ID!='2003' or cbc:ID!='2004'">
			<xsl:value-of select="0.00"/>
		</xsl:if>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID='2005'">
				<xsl:if test="cbc:PayableAmount!='0'">
					<xsl:value-of select="cbc:PayableAmount"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:template name="Total">
		<table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#000000">
			<tr bgcolor="silver">
				<td align="center" width="12%">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<Strong>TOTAL BRUTO</Strong>
					</font>
				</td>
				<td align="center" width="12%">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<Strong>TOTAL DESCUENTO</Strong>
					</font>
				</td>
				<td align="center" width="12%">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<Strong>OP. GRAVADA</Strong>
					</font>
				</td>
				<td align="center" width="12%">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<Strong>OP. INAFECTA</Strong>
					</font>
				</td>
				<td align="center" width="10%">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<Strong>OP. EXONERADA</Strong>
					</font>
				</td>
				<!--<td align="center" width="10%">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<Strong>DSCTO GLOBAL</Strong>
					</font>
				</td>-->
				<td align="center" width="10%">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<Strong>I.G.V.</Strong>
					</font>
				</td>
				<td align="center" width="10%">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<Strong>OP. GRATUITA</Strong>
					</font>
				</td>
				<!--<td align="center" width="12%">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<Strong>TOTAL ANTICIPO</Strong>
					</font>
				</td>-->
				<td align="center" width="12%">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<Strong>IMPORTE TOTAL <xsl:call-template name="TipoDeMoneda_Total"/></Strong>
					</font>
				</td>
			</tr>
			<tr>
				<!-- Total Bruto-->
				<td align="right" width="12%">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='15'">
								<!--xsl:value-of select="pe:Valor"/-->
								<xsl:value-of select="format-number(pe:Valor, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='15'">
								<!--xsl:value-of select="pe1:Valor"/-->
								<xsl:value-of select="format-number(pe1:Valor, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='15'">
								<!--xsl:value-of select="pe2:Valor"/-->
								<xsl:value-of select="format-number(pe2:Valor, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
						</xsl:for-each>
					</font>
				</td>
				<!-- Total Descuento-->
				<!--<td align="right" width="12%">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount, '###,###,##0.00', 'pen')"/>
					</font>
				</td>-->

				<td align="right" width="10%">
					<!--<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<xsl:variable name="DsctoGlobal">
							<xsl:value-of select="0" />

							<xsl:for-each select="//pe:Invoice/cac:LegalMonetaryTotal">
								<xsl:value-of select="cbc:AllowanceTotalAmount" />
    						</xsl:for-each>
							<xsl:for-each select="//pe1:CreditNote/cac:LegalMonetaryTotal">
								<xsl:value-of select="cbc:AllowanceTotalAmount" />
    						</xsl:for-each>
							<xsl:for-each select="//pe2:DebitNote/cac:LegalMonetaryTotal">
								<xsl:value-of select="cbc:AllowanceTotalAmount" />
    						</xsl:for-each>
						</xsl:variable>

	                  	<xsl:value-of select="format-number($DsctoGlobal, '###,###,##0.00', 'pen')" />
					</font>-->

					<font face="Arial, Helvetica, sans-serif" size="2">
						<!--<xsl:if test="$DescuentoTotal=''">
							<xsl:value-of select="format-number('0','###,###,##0.00','pen')"/>
						</xsl:if>
						<xsl:if test="$DescuentoTotal!=''">
							<xsl:value-of select="format-number($DescuentoTotal,'###,###,##0.00','pen')"/>
						</xsl:if>-->

						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='31'">
								<!--xsl:value-of select="pe:Valor"/-->
								<xsl:value-of select="format-number(pe:Valor, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='31'">
								<!--xsl:value-of select="pe:Valor"/-->
								<xsl:value-of select="format-number(pe1:Valor, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='31'">
								<!--xsl:value-of select="pe:Valor"/-->
								<xsl:value-of select="format-number(pe2:Valor, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
						</xsl:for-each>
					</font>
				</td>
				<!--Total Grabado-->
				<td align="right" width="12%">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1001'">
									<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
										<!-- JDL-BOLETA  -->
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID='1001'">
												<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
										<!-- JDL-FACTURA  -->
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
									<xsl:if test="/pe1:CreditNote">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
									<xsl:if test="/pe1:DebitNote">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>

						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								<!--</xsl:if>-->
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								<!--</xsl:if>-->
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								<!--</xsl:if>-->
							</xsl:for-each>

							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
									<xsl:if test="cbc:TaxableAmount!='0.00'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
									<xsl:if test="cbc:TaxableAmount!='0.00'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
									<xsl:if test="cbc:TaxableAmount!='0.00'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								</xsl:if>
							</xsl:for-each>

							<!--<xsl:variable name="Gravado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
										<xsl:if test="cbc:TaxableAmount!='0.00'">
										<xsl:call-template name="SimboloMoneda"/> &#xA0;
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;

										</xsl:if></xsl:if>
								</xsl:for-each>
							</xsl:variable>


							<xsl:if test="$Gravado = ''">0.00&#xA0;</xsl:if>-->
						</xsl:if>
					</font>
				</td>
				<!--Total Inafecto-->
				<td align="right" width="12%">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1002'">
									<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
										<!-- JDL-BOLETA  -->
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID='1002'">
												<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
										<!-- JDL-FACTURA  -->
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
									<xsl:if test="/pe1:CreditNote">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
									<xsl:if test="/pe1:DebitNote">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>

						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								<!--</xsl:if>-->
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								<!--</xsl:if>-->
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								<!--</xsl:if>-->
							</xsl:for-each>

							

							<!--<xsl:variable name="Inafecto">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1002'">
										<xsl:if test="cbc:TaxableAmount!='0.00'">
										<xsl:call-template name="SimboloMoneda"/> &#xA0;
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;

										</xsl:if></xsl:if>
								</xsl:for-each>
							</xsl:variable>


							<xsl:if test="$Inafecto = ''">0.00&#xA0;</xsl:if>-->
						</xsl:if>
					</font>
				</td>
				<!--Total Exonerado-->
				<td align="right" width="10%">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1003'">
									<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
										<!-- JDL-BOLETA  -->
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID='1003'">
												<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
										<!-- JDL-FACTURA  -->
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
									<xsl:if test="/pe1:CreditNote">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
									<xsl:if test="/pe1:DebitNote">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>

						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								<!--</xsl:if>-->
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								<!--</xsl:if>-->
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								<!--</xsl:if>-->
							</xsl:for-each>

							

							<!--<xsl:variable name="Exonerado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1003'">
										<xsl:if test="cbc:TaxableAmount!='0.00'">
										<xsl:call-template name="SimboloMoneda"/> &#xA0;
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;

										</xsl:if></xsl:if>
								</xsl:for-each>
							</xsl:variable>


							<xsl:if test="$Exonerado = ''">0.00&#xA0;</xsl:if>-->
						</xsl:if>
					</font>
				</td>
				<!--Descuento global - DPP-->
				<!--<td align="right" width="10%">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<xsl:variable name="DsctoGlobal">
							<xsl:value-of select="0" />

							<xsl:for-each select="//pe:Invoice/cac:LegalMonetaryTotal">
								<xsl:value-of select="cbc:AllowanceTotalAmount" />
    						</xsl:for-each>
							<xsl:for-each select="//pe1:CreditNote/cac:LegalMonetaryTotal">
								<xsl:value-of select="cbc:AllowanceTotalAmount" />
    						</xsl:for-each>
							<xsl:for-each select="//pe2:DebitNote/cac:LegalMonetaryTotal">
								<xsl:value-of select="cbc:AllowanceTotalAmount" />
    						</xsl:for-each>
						</xsl:variable>

	                  	<xsl:value-of select="format-number($DsctoGlobal, '###,###,##0.00', 'pen')" />
					</font>
				</td>-->

				<!--Total IGV-->
				<td align="right" width="10%">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
						<xsl:variable name="IGV">

							<!--<xsl:if test="//cac:TaxTotal/cbc:TaxAmount != ''">
										<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount, '###,###,##0.00', 'pen')" />
									</xsl:if>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')" />
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')" />
								</xsl:if>
							</xsl:for-each>-->
							<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
						</xsl:variable>

						<xsl:value-of select="$IGV"/>
					</font>
				</td>
				<!--OPERACIÓN GRATUITA-->
				<td align="right" width="10%">
					<font color="#000000" size="2" face="Tahoma, Helvetica, sans-serif">
					
							<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID = '1004'">
									<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:for-each>
							</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								<!--</xsl:if>-->
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								<!--</xsl:if>-->
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								<!--</xsl:if>-->
							</xsl:for-each>
							</xsl:if>
					
					</font>
				</td>
				<!--TOTAL ANTICIPO-->
				<!--<td align="right" width="12%">
					<font color="#000000" size="1" face="Tahoma, Helvetica, sans-serif">
						<xsl:variable name="TotalAnticipo">
							<xsl:value-of select="0" />
							<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:PrepaidAmount" />
						</xsl:variable>

						<xsl:value-of select="format-number($TotalAnticipo, '###,###,##0.00', 'pen')" />
					</font>
				</td>-->
				<!--Importe Total-->
				<td align="right" width="12%">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
						<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount != ''">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
						</xsl:if>
						<!--en notas de debito-->
						<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount != ''">
							<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
						</xsl:if>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="son-pesos">
		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>SON:</strong>
						<!--xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
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
						</xsl:for-each-->
							<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']" />
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Transferencia">
		<table border="0" width="100%" cellpadding="2">
			<tr>
				<td>
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount='0.00'">
						<center>
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
								<b>TRANSFERENCIA GRATUITA</b>
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

	<xsl:template name="Leyenda">
		<table border="0" width="20%" cellpadding="1" cellspacing="1">
			<!--<tr>
					<td>&#160;
					</td>
			</tr>	-->
			<!-- LEYENDA SUJETA A PERCEPCION-->
			<!--
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='20'">
									<xsl:if test="pe:Valor!='-'">						
										<tr align="left">
											<td width="60%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='20'">
													<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:for-each>
												
											</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='20'">
									<xsl:if test="pe1:Valor!='-'">						
										<tr align="left">
											<td width="60%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo='20'">
													<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:for-each>
												
											</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
				</xsl:for-each>
			-->
			<!-- TOTAL DE PERCEPCION-->
		</table>
	</xsl:template>

	<xsl:template name="Referencia">
		<!-- DOCUMENTO FINANCIERO-->
		<table border="0"  cellSpacing="0" cellPadding="0" width="50%">
			<tbody>
				<tr>
				</tr>
			</tbody>
		</table>

		<table border="0" cellSpacing="0" cellPadding="1" width="100%">
			<tbody>
				<tr>
					<td>
						<table border="0" cellSpacing="0" cellPadding="0" width="100%">
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
	<!--percepcion-->
	<!--<xsl:template name="Importe_Percepcion">
			<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
				<tr>
					<td align="left" width="15%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<b>Percepción (%):</b>&#xA0;
						</font>
					</td>
					<td align="left" width="15%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="20" /></xsl:call-template>
						</font>
					</td>
					<td align="left" width="15%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<b>Monto Percepción:</b>
						</font>
					</td>
					<td align="left" width="15%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2001'">
									<xsl:if test="cbc:PayableAmount!='0'">
										<xsl:value-of select="cbc:PayableAmount"/>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
					<td align="left" width="15%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<b>Importe a Pagar:</b>
						</font>
					</td>
					<td align="left" width="15%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2001'">
									<xsl:value-of select="sac:TotalAmount"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>	
			</table>
		
	</xsl:template>-->

	<xsl:template name="Exportacion_Total">
		<table width="60%">
			<tr>
				<td width="60%">
					<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
						<tbody>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='62'">
									<xsl:if test="pe:Valor!='-'">
										<tr align="left">
											<!--<td width="30%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>-->
											<td width="70%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="pe:Valor"/>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='62'">
									<xsl:if test="pe1:Valor!='-'">
										<tr align="left">
											<!--<td width="70%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>-->
											<td width="30%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="pe1:Valor"/>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='62'">
									<xsl:if test="pe2:Valor!='-'">
										<tr align="left">
											<!--<td width="70%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>-->
											<td width="30%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="pe2:Valor"/>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<!-- 2 columna -->
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='63'">
									<xsl:if test="pe:Valor!='-'">
										<tr>
											<!--<td width="70%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>-->
											<td width="30%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="pe:Valor"/>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='63'">
									<xsl:if test="pe1:Valor!='-'">
										<tr>
											<!--<td width="70%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>-->
											<td width="30%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="pe1:Valor"/>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='63'">
									<xsl:if test="pe2:Valor!='-'">
										<tr>
											<!--<td width="70%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>-->
											<td width="30%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="pe2:Valor"/>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>

							<!-- 3 columna -->
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='64'">
									<xsl:if test="pe:Valor!='-'">
										<tr>
											<!--<td width="70%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>-->
											<td width="30%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="pe:Valor"/>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='64'">
									<xsl:if test="pe1:Valor!='-'">
										<tr>
											<!--<td width="70%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>-->
											<td width="30%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="pe1:Valor"/>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='64'">
									<xsl:if test="pe2:Valor!='-'">
										<tr>
											<!--<td width="70%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>-->
											<td width="30%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="pe2:Valor"/>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>

							<!-- 4 columna -->
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='67'">
									<xsl:if test="pe:Valor!='-'">
										<tr>
											<!--<td width="70%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>-->
											<td width="50%" align="right">
												<font face="Arial, Helvetica, sans-serif" size="1">
												</font>
											</td>

											<td width="30%" align="right">
												<font face="Arial, Helvetica, sans-serif" size="1">
												</font>
											</td>

											<td width="20%" align="right">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="pe:Valor"/>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='67'">
									<xsl:if test="pe1:Valor!='-'">
										<tr>
											<!--<td width="70%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>-->
											<td width="50%" align="right">
												<font face="Arial, Helvetica, sans-serif" size="1">
												</font>
											</td>

											<td width="30%" align="right">
												<font face="Arial, Helvetica, sans-serif" size="1">
												</font>
											</td>
											<td width="20%" align="right">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="pe1:Valor"/>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='67'">
									<xsl:if test="pe2:Valor!='-'">
										<tr>
											<!--<td width="70%">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong></strong>
												</font>
											</td>-->
											<td width="50%" align="right">
												<font face="Arial, Helvetica, sans-serif" size="1">
												</font>
											</td>

											<td width="30%" align="right">
												<font face="Arial, Helvetica, sans-serif" size="1">
												</font>
											</td>
											<td width="20%" align="right">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:value-of select="pe2:Valor"/>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<tr>
								<!-- adicional 65-->
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='65'">
										<xsl:if test="pe:Valor!='-'">

											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe:Valor,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe:Valor,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'/')"/>
											</xsl:variable>

											<td width="50%" align="left">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:if test="string-length($linea1)&gt;0">
														<xsl:value-of select="$linea1"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea2)&gt;0">
														<xsl:value-of select="$linea2"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea3)&gt;0">
														<xsl:value-of select="$linea3"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea4)&gt;0">
														<xsl:value-of select="$linea4"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea5)&gt;0">
														<xsl:value-of select="$linea5"/>
														<br/>
													</xsl:if>
												</font>
											</td>
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
								<!-- adicional 65 NC-->
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='65'">
										<xsl:if test="pe1:Valor!='-'">

											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe1:Valor,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe1:Valor,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'/')"/>
											</xsl:variable>

											<td width="50%" align="left">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:if test="string-length($linea1)&gt;0">
														<xsl:value-of select="$linea1"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea2)&gt;0">
														<xsl:value-of select="$linea2"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea3)&gt;0">
														<xsl:value-of select="$linea3"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea4)&gt;0">
														<xsl:value-of select="$linea4"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea5)&gt;0">
														<xsl:value-of select="$linea5"/>
														<br/>
													</xsl:if>
												</font>
											</td>
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
								<!-- adicional 65 ND-->
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='65'">
										<xsl:if test="pe2:Valor!='-'">

											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe2:Valor,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe2:Valor,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'/')"/>
											</xsl:variable>

											<td width="50%" align="left">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:if test="string-length($linea1)&gt;0">
														<xsl:value-of select="$linea1"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea2)&gt;0">
														<xsl:value-of select="$linea2"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea3)&gt;0">
														<xsl:value-of select="$linea3"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea4)&gt;0">
														<xsl:value-of select="$linea4"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea5)&gt;0">
														<xsl:value-of select="$linea5"/>
														<br/>
													</xsl:if>
												</font>
											</td>
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
								<!-- adicional 66 -->
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='66'">
										<xsl:if test="pe:Valor!='-'">

											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe:Valor,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe:Valor,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'/')"/>
											</xsl:variable>

											<td width="30%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:if test="string-length($linea1)&gt;0">
														<xsl:value-of select="$linea1"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea2)&gt;0">
														<xsl:value-of select="$linea2"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea3)&gt;0">
														<xsl:value-of select="$linea3"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea4)&gt;0">
														<xsl:value-of select="$linea4"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea5)&gt;0">
														<xsl:value-of select="$linea5"/>
														<br/>
													</xsl:if>
												</font>
											</td>
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
								<!-- adicional 66 NC-->
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='66'">
										<xsl:if test="pe1:Valor!='-'">

											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe1:Valor,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe1:Valor,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'/')"/>
											</xsl:variable>

											<td width="30%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:if test="string-length($linea1)&gt;0">
														<xsl:value-of select="$linea1"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea2)&gt;0">
														<xsl:value-of select="$linea2"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea3)&gt;0">
														<xsl:value-of select="$linea3"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea4)&gt;0">
														<xsl:value-of select="$linea4"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea5)&gt;0">
														<xsl:value-of select="$linea5"/>
														<br/>
													</xsl:if>
												</font>
											</td>
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
								<!-- adicional 66 ND-->
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='66'">
										<xsl:if test="pe2:Valor!='-'">

											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe2:Valor,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe2:Valor,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'/')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'/')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'/')"/>
											</xsl:variable>

											<td width="30%" align="center">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:if test="string-length($linea1)&gt;0">
														<xsl:value-of select="$linea1"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea2)&gt;0">
														<xsl:value-of select="$linea2"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea3)&gt;0">
														<xsl:value-of select="$linea3"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea4)&gt;0">
														<xsl:value-of select="$linea4"/>
														<br/>
													</xsl:if>
													<xsl:if test="string-length($linea5)&gt;0">
														<xsl:value-of select="$linea5"/>
														<br/>
													</xsl:if>
												</font>
											</td>
										</xsl:if>
									</xsl:if>
								</xsl:for-each>


								<td width="20%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
									</font>
								</td>
							</tr>
							<!--<tr>-->

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='62'">
									<xsl:if test="pe:Valor!='-'">
										<tr>
											<td width="60%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>(*) PRECIO PROMEDIO DE LOS DIAS:(PRICE AVERAGE)</strong>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='62'">
									<xsl:if test="pe1:Valor!='-'">
										<tr>
											<td width="60%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>(*) PRECIO PROMEDIO DE LOS DIAS:</strong>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='62'">
									<xsl:if test="pe2:Valor!='-'">
										<tr>
											<td width="60%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>(*) PRECIO PROMEDIO DE LOS DIAS:</strong>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<!--</tr>-->
							<!--adicional 68-->

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='68'">
									<xsl:if test="pe:Valor!='-'">
										<tr>
											<td width="60%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='68'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='68'">
															<xsl:value-of select="pe1:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='68'">
															<xsl:value-of select="pe2:Valor"/>
														</xsl:if>
													</xsl:for-each>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='68'">
									<xsl:if test="pe1:Valor!='-'">
										<tr>
											<td width="60%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='68'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='68'">
															<xsl:value-of select="pe1:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='68'">
															<xsl:value-of select="pe2:Valor"/>
														</xsl:if>
													</xsl:for-each>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='68'">
									<xsl:if test="pe2:Valor!='-'">
										<tr>
											<td width="60%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='68'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='68'">
															<xsl:value-of select="pe1:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='68'">
															<xsl:value-of select="pe2:Valor"/>
														</xsl:if>
													</xsl:for-each>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<!--fin adicional-->
							<!--adicional 69-->

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='69'">
									<xsl:if test="pe:Valor!='-'">
										<tr>
											<td width="60%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<strong>FECHA DE VENCIMIENTO(DUE DATE)</strong>
												</font>
											</td>
										</tr>
										<tr>
											<td width="60%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='69'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='69'">
															<xsl:value-of select="pe1:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='69'">
															<xsl:value-of select="pe2:Valor"/>
														</xsl:if>
													</xsl:for-each>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='69'">
									<xsl:if test="pe1:Valor!='-'">
										<tr>
											<tr>
												<td width="60%" align="left" colspan="3">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>FECHA DE VENCIMIENTO(DUE DATE)</strong>
													</font>
												</td>
											</tr>
											<td width="60%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='69'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='69'">
															<xsl:value-of select="pe1:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='69'">
															<xsl:value-of select="pe2:Valor"/>
														</xsl:if>
													</xsl:for-each>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='69'">
									<xsl:if test="pe2:Valor!='-'">
										<tr>
											<tr>
												<td width="60%" align="left" colspan="3">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>FECHA DE VENCIMIENTO(DUE DATE)</strong>
													</font>
												</td>
											</tr>
											<td width="60%" align="left" colspan="3">
												<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='69'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='69'">
															<xsl:value-of select="pe1:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='69'">
															<xsl:value-of select="pe2:Valor"/>
														</xsl:if>
													</xsl:for-each>
												</font>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<!--fin adicional-->
						</tbody>
					</table>
					<!--fin tabla-->
				</td>
				<!--fin td-->
			</tr>
			<!--fin-->
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
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->