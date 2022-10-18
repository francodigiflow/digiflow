<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="son-pesos">
		<table border="0" width="100%">
			<tr>
				<td align="left" width="100%">
					<table border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000">
						<tr>
							<td>
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>SON:</strong>
									<xsl:for-each select="//sac:AdditionalProperty">

										<xsl:if test="cbc:ID='1000'">

											<xsl:value-of select="cbc:Value"/>
										</xsl:if>
									</xsl:for-each>
									<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']"/>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<!--<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='19' and pe:Valor!='DEFAULT'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='19' and pe1:Valor!='DEFAULT'">
								<xsl:value-of select="pe1:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='19' and pe2:Valor!='DEFAULT'">
								<xsl:value-of select="pe2:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>-->
			</tr>
			<tr>
				<td>
					<xsl:choose>
						<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<!--<xsl:for-each select="//cac:PrepaidPayment">-->
							<xsl:if test="//cac:PrepaidPayment/cbc:PaidAmount&gt;0">
								<xsl:call-template name="DocumentoReferenciaAnti"/>
							</xsl:if>
							<!--</xsl:for-each>-->
						</xsl:when>
						<xsl:when test="/pe1:CreditNote">
							<xsl:call-template name="DocumentoReferencia"/>
						</xsl:when>
						<xsl:when test="/pe2:DebitNote">
							<xsl:call-template name="DocumentoReferencia"/>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td>
					<!--<xsl:choose>
						<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'or /pe:Invoice/cbc:InvoiceTypeCode='03'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:call-template name="DetalleDetraccion"/>
								</xsl:if>
							</xsl:for-each>-->
					<!--<xsl:call-template name="DetalleDetraccion"/>-->
					<!--</xsl:when>
						<xsl:when test="/pe1:CreditNote">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:call-template name="DetalleDetraccion"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="/pe2:DebitNote">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:call-template name="DetalleDetraccion"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
					</xsl:choose>-->
					<xsl:choose>
						<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'or /pe:Invoice/cbc:InvoiceTypeCode='03'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:call-template name="DetalleDetraccion"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="/pe1:CreditNote">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:call-template name="DetalleDetraccion"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="/pe2:DebitNote">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:call-template name="DetalleDetraccion"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
					</xsl:choose>

					<xsl:choose>
						<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'or /pe:Invoice/cbc:InvoiceTypeCode='03'">
							
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode/@listID = '1001'">
								<xsl:call-template name="DetalleDetraccion"/>
							</xsl:if>
						</xsl:when>
						<xsl:when test="/pe1:CreditNote">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:call-template name="DetalleDetraccion"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="/pe2:DebitNote">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<xsl:call-template name="DetalleDetraccion"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>

						<!--<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode/@listID = '1001'">
					<xsl:call-template name="DetalleDetraccion"/>
				</xsl:if>-->
						<xsl:otherwise>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<br/>
	</xsl:template>

	<xsl:template name="Total">
		<table border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000">
			<tbody>
				<tr>
					<td width="55%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>Total Gravado</strong>
						</font>
					</td>

					<xsl:variable name="v_TotalGravado">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1001'">

									<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
									<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
									<xsl:if test="/pe1:CreditNote">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
									<xsl:if test="/pe2:DebitNote">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">

								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</xsl:variable>

					<td width="45%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:if test="$v_TotalGravado != '0' or $v_TotalGravado!='0.00'">
								<xsl:value-of select="$v_TotalGravado"/>
							</xsl:if>
							<xsl:if test="$v_TotalGravado = ''">
								<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
							</xsl:if>
						</font>
					</td>
				</tr>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>Total Inafecto</strong>
						</font>
					</td>

					<xsl:variable name="v_TotalNoGravado">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1002'">
									<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</xsl:variable>

					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:if test="$v_TotalNoGravado != '0' or $v_TotalNoGravado!='0.00'">
								<xsl:value-of select="$v_TotalNoGravado"/>
							</xsl:if>
							<xsl:if test="$v_TotalNoGravado = ''">
								<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
							</xsl:if>
						</font>
					</td>
				</tr>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>Total Exonerado</strong>
						</font>
					</td>

					<xsl:variable name="v_TotalExonerado">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1003'">
									<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</xsl:variable>

					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:if test="$v_TotalExonerado != '0' or $v_TotalExonerado!='0.00'">
								<xsl:value-of select="$v_TotalExonerado"/>
							</xsl:if>
							<xsl:if test="$v_TotalExonerado = ''">
								<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
							</xsl:if>
						</font>
					</td>
				</tr>
				<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
					<tr>
						<td>
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>Total Exportación</strong>
							</font>
						</td>

						<xsl:variable name="v_TotalExonerado">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
									<xsl:if test="cbc:ID='1003'">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
									</xsl:if>
								</xsl:for-each>
							</xsl:if>
						</xsl:variable>

						<!--EXPORTACION-->
						<xsl:variable name="v_TotalExportacion">
							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
									</xsl:if>
								</xsl:for-each>
							</xsl:if>
						</xsl:variable>

						<td align="right">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:if test="$v_TotalExportacion != '0' or $v_TotalExportacion!='0.00'">
									<xsl:value-of select="$v_TotalExportacion"/>
								</xsl:if>
								<xsl:if test="$v_TotalExportacion = ''">
									<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</font>
						</td>
					</tr>
				</xsl:if>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">

							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<!--<strong>Total <xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name"/> (18%)</strong>-->
								<!-- Total IGV Boletas -->
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
									<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
										<strong>
											<xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name"/>(18%)</strong>
									</xsl:for-each>
								</xsl:if>
								<!-- Total IGV Facturas -->
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode ='01'">
									<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
										<strong>
											<xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name"/>(18%)</strong>
									</xsl:for-each>
								</xsl:if>

								<!-- Total IGV Nota Credito -->
								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
									<strong>Total <xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name"/> (18%)</strong>
								</xsl:for-each>

								<!-- Total IGV Nota Debito -->
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
									<strong>Total <xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name"/> (18%)</strong>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<!--<xsl:for-each select="//pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">-->
								<!--<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:Name='IGV' or cac:TaxCategory/cac:TaxScheme/cbc:Name='ISC' or cac:TaxCategory/cac:TaxScheme/cbc:Name='EXP'">-->
								<strong>
									<!--<xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>-->IGV(18%)</strong>
								<!--</xsl:if>-->
								<!--</xsl:for-each>-->
								<!--<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">-->
								<!--<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:Name='IGV' or cac:TaxCategory/cac:TaxScheme/cbc:Name='ISC' or cac:TaxCategory/cac:TaxScheme/cbc:Name='EXP'">-->
								<!--<strong>Total-->
								<!--<xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>-->
								<!--IGV(18%)</strong>-->
								<!--</xsl:if>-->
								<!--</xsl:for-each>-->
								<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">-->
								<!--<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:Name='IGV' or cac:TaxCategory/cac:TaxScheme/cbc:Name='ISC' or cac:TaxCategory/cac:TaxScheme/cbc:Name='EXP'">-->
								<!--<strong>Total-->
								<!--<xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>-->
								<!--IGV(18%)</strong>-->
								<!--</xsl:if>-->
								<!--</xsl:for-each>-->
							</xsl:if>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
										<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
									</xsl:if>
								</xsl:for-each>

								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
										<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
									</xsl:if>
								</xsl:for-each>

								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
										<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
									</xsl:if>
								</xsl:for-each>
							</xsl:if>

							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:variable name="IGV">
									<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
										<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '1000'">
											<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
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
								<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
							</xsl:if>
						</font>
					</td>
				</tr>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>Total

								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">PEN</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">NUEVOS SOLES</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
									<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
								</xsl:choose>
							</strong>
						</font>
					</td>
					<td align="right">
						<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
							</font>
						</xsl:if>
						<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
							</font>
						</xsl:if>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="Referencia">
		<table border="0" rules="cols" cellSpacing="0" cellPadding="1" width="100%">
			<tr>
				<td>
					<table border="0" cellSpacing="0" cellPadding="0" width="100%">
						<tr>
							<td width="100%" align="left">
								<xsl:call-template name="son-pesos"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="100%" align="left">
					<xsl:call-template name="LeyendaReten"/>
				</td>
			</tr>
			<tr>
				<td width="100%" align="left">
					<xsl:call-template name="LeyendaLey"/>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="DocumentoReferencia">
		<tr>
			<td width="100%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="2">DOCUMENTO(S) DE REFERENCIA :</font>
			</td>
		</tr>

		<tr>
			<td width="70%">
				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="70%">
					<tbody>
						<tr width="70%">
							<td width="25%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Tipo Documento</strong>
								</font>
							</td>
							<td width="25%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Correlativo</strong>
								</font>
							</td>
							<td width="20%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Fecha Emisión</strong>
								</font>
							</td>
						</tr>
						<xsl:for-each select="//cac:DespatchDocumentReference">
							<xsl:if test="cbc:DocumentTypeCode != '10'">
								<tr width="70%">
									<td width="250%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA ELE.</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='07'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>

											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='07'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
							<xsl:if test="cbc:DocumentTypeCode != '10'">
								<tr width="70%">
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA ELECT.</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA ELECT.</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO ELECT.</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO ELECT.</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="substring-before(cbc:ID,'-')"/>-
											<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">

											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='19' and pe1:Valor!='DEFAULT'">
													<!--<xsl:value-of select="pe1:Valor"/>-->
													<xsl:variable name="dt" select="pe1:Valor"/>
													<xsl:value-of select="concat(substring($dt,9,2),'-',substring($dt,6,2),'-',substring($dt,1,4))"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='19' and pe2:Valor!='DEFAULT'">
													<!--<xsl:value-of select="pe2:Valor"/>-->
													<xsl:variable name="dt" select="pe2:Valor"/>
													<xsl:value-of select="concat(substring($dt,9,2),'-',substring($dt,6,2),'-',substring($dt,1,4))"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<xsl:choose>
					<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
						<font size="2" face="Arial, Helvetica, sans-serif"/>
					</xsl:when>
					<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
						<font size="2" face="Arial, Helvetica, sans-serif"></font>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="/pe1:CreditNote">
							<font size="2" face="Arial, Helvetica, sans-serif">
								<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong>
							</font>
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
							<font size="2" face="Arial, Helvetica, sans-serif">
								<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong>
							</font>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="DescripcionAdicional_BottomEquifax">
		<xsl:param name="resto"/>
		<xsl:variable name="adicional" select="substring-before($resto,'*')"/>
		<xsl:variable name="adicional1" select="substring-after($resto,'*')"/>
		<tr>
			<td width="20%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="2">
					<b>
						<xsl:value-of select="$adicional"/>
					</b>
				</font>
			</td>
		</tr>
		<xsl:variable name="res" select="$adicional1"/>
		<xsl:if test="$res!=''">
			<xsl:call-template name="DescripcionAdicional_BottomEquifax">
				<xsl:with-param name="resto" select="$res"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="equifax">
		<xsl:param name="varNumVA"/>
		<table border="0" width="100%" cellpadding="1" cellspacing="0" heigth="100%">
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
				<xsl:if test="pe:Codigo='08' and pe:Valor != '-' ">
					<xsl:variable name="adicional" select="substring-before(pe:Valor,'*')"/>
					<xsl:variable name="adicional1" select="substring-after(pe:Valor,'*')"/>
					<tr>
						<td width="20%" align="left">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<b>
									<xsl:value-of select="$adicional"/>
								</b>
							</font>
						</td>
					</tr>
					<xsl:call-template name="DescripcionAdicional_BottomEquifax">
						<xsl:with-param name="resto" select="$adicional1"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
		</table>
	</xsl:template>

	<xsl:template name="Datosadicionales">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'  ">
					<tr>
						<td width="50%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>CONTRATO :</strong>
							</font>
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='08' and pe:Valor != '-' ">
										<xsl:call-template name="equifax">
											<xsl:with-param name="varNumVA" select="08"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:for-each>
							</font>
						</td>
					</tr>
				</xsl:if>

				<tr width="100%">

					<td width="50%">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>DOCUMENTO INTERNO :</strong>
						</font>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='09'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='09'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='09'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
					<td width="50%">
					</td>
				</tr>
				<tr width="100%">
					<td width="50%">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>DOCUMENTO SGC :</strong>
						</font>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='10'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='10'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='10'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr width="100%">
					<td width="60%">
						<br/>
						<br/>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='04'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='04'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='04'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
					<td width="40%">
					</td>
				</tr>
				<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'  ">
					<tr width="100%">
						<td width="55%">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="2">
							</font>
						</td>
						<td width="45%">
						</td>
					</tr>
				</xsl:if>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="DatosadicionalesCom">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>

				<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='05'">
							<!-- <xsl:param name="adicional" select="substring-before(pe:Valor,'*')"/> -->
							<!-- <xsl:param name="adicional1" select="substring-after(pe:Valor,':')"/> -->
							<tr>
								<td width="55%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:value-of select="substring-before($adicional,':')"/> -->
									</font>
								</td>
								<td width="45%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:value-of select="substring-after($adicional,':')"/> -->
									</font>
								</td>
							</tr>
							<xsl:call-template name="DescripcionAdicionalCom">
								<!-- <xsl:with-param name="resto" select="substring-after($adicional1,'*')"/> -->
							</xsl:call-template>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='05'">
							<!-- <xsl:param name="adicional" select="substring-before(pe1:Valor,'*')"/> -->
							<!-- <xsl:param name="adicional1" select="substring-after(pe1:Valor,':')"/> -->
							<tr>
								<td width="55%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:value-of select="substring-before($adicional,':')"/> -->
									</font>
								</td>

								<td width="45%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:value-of select="substring-after($adicional,':')"/> -->
									</font>
								</td>
							</tr>
							<xsl:call-template name="DescripcionAdicionalCom">
								<!-- <xsl:with-param name="resto" select="substring-after($adicional1,'*')"/> -->
							</xsl:call-template>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='05'">
							<!-- <xsl:param name="adicional" select="substring-before(pe2:Valor,'*')"/> -->
							<!-- <xsl:param name="adicional1" select="substring-after(pe2:Valor,':')"/> -->
							<tr>
								<td width="55%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:value-of select="substring-before($adicional,':')"/> -->
									</font>
								</td>

								<td width="45%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:value-of select="substring-after($adicional,':')"/> -->
									</font>
								</td>
							</tr>
							<xsl:call-template name="DescripcionAdicionalCom">
								<!-- <xsl:with-param name="resto" select="substring-after($adicional1,'*')"/> -->
							</xsl:call-template>
						</xsl:if>
					</xsl:for-each>
				</font>
				<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
					<tr>
						<td>
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>
									<xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name"/>/Taxes</strong>
							</font>
						</td>
						<td align="right">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</font>
						</td>
					</tr>
				</xsl:for-each>

				<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
					<tr>
						<td>
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>
									<xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name"/>/Taxes</strong>
							</font>
						</td>
						<td align="right">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</font>
						</td>
					</tr>
				</xsl:for-each>
				<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
					<tr>
						<td>
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>
									<xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name"/>/Taxes</strong>
							</font>
						</td>
						<td align="right">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</font>
						</td>
					</tr>
				</xsl:for-each>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>Total</strong>
						</font>
					</td>
					<td align="right">
						<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
							</font>
						</xsl:if>
						<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
							</font>
						</xsl:if>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td>
					<font face="Arial, Helvetica, sans-serif" size="2">SAY: <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='06'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if></xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='06'">
								<xsl:value-of select="pe1:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='06'">
								<xsl:value-of select="pe2:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>
			<tr>
				<td>
					<font face="Arial, Helvetica, sans-serif" size="2">SON:
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='07'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='07'">
								<xsl:value-of select="pe1:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='07'">
								<xsl:value-of select="pe2:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>
		</table>
		<br/>
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>

				<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='08'">
							<!-- <xsl:param name="adicional" select="substring-before(pe:Valor,'*')"/> -->
							<!-- <xsl:param name="adicional1" select="substring-after(pe:Valor,':')"/> -->
							<tr>
								<td width="55%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:value-of select="substring-before($adicional,':')"/> -->
									</font>
								</td>

								<td width="45%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:value-of select="substring-after($adicional,':')"/> -->
									</font>
								</td>
							</tr>
							<xsl:call-template name="DescripcionAdicionalCom">
								<!-- <xsl:with-param name="resto" select="substring-after($adicional1,'*')"/> -->
							</xsl:call-template>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='08'">
							<!-- <xsl:param name="adicionalx" select="substring-before(pe1:Valor,'*')"/> -->
							<!-- <xsl:param name="adicionaly" select="substring-after(pe1:Valor,':')"/> -->
							<tr>
								<td width="55%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:value-of select="substring-before($adicionalx,':')"/> -->
									</font>
								</td>

								<td width="45%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:value-of select="substring-after($adicionalx,':')"/> -->
									</font>
								</td>
							</tr>
							<xsl:call-template name="DescripcionAdicionalCom">
								<!-- <xsl:with-param name="resto" select="substring-after($adicionaly,'*')"/> -->
							</xsl:call-template>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='08'">
							<!-- <xsl:param name="adicional" select="substring-before(pe2:Valor,'*')"/> -->
							<!-- <xsl:param name="adicional1" select="substring-after(pe2:Valor,':')"/> -->
							<tr>
								<td width="55%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:value-of select="substring-before($adicional,':')"/> -->
									</font>
								</td>

								<td width="45%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:value-of select="substring-after($adicional,':')"/> -->
									</font>
								</td>
							</tr>
							<xsl:call-template name="DescripcionAdicionalCom">
								<!-- <xsl:with-param name="resto" select="substring-after($adicional1,'*')"/> -->
							</xsl:call-template>
						</xsl:if>
					</xsl:for-each>
				</font>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="DescripcionAdicionalCom">
		<xsl:param name="resto"/>
		<xsl:param name="adicionalx" select="substring-before($resto,'*')"/>
		<xsl:param name="adicionaly" select="substring-after($resto,':')"/>
		<tr>
			<td width="55%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="2">

					<xsl:value-of select="substring-before($adicionalx,':')"/>
				</font>
			</td>

			<td width="45%" align="right">
				<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:value-of select="substring-after($adicionalx,':')"/>
				</font>
			</td>
		</tr>
		<xsl:variable name="res" select="substring-after($adicionaly,'*')"/>
		<xsl:if test="$res!=''">

			<xsl:call-template name="DescripcionAdicionalCom">
				<xsl:with-param name="resto" select="$res"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>

	<xsl:template name="DetalleDetraccion">
		<tr>
			<td colspan="2" align="left">
				<font face="Arial, Helvetica, sans-serif" size="2">DETALLE DETRACCION :</font>
			</td>
		</tr>
		<tr>
			<td width="70%">
				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="70%">
					<tr>
						<td width="25%" align="center">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>% Detracción</strong>
							</font>
						</td>
						<td width="20%" align="center">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>Monto</strong>
							</font>
						</td>
					</tr>
					<tr>
						<td width="50%" align="center">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<!--<strong>Detracción</strong>&#xA0;-->
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
								<!--<strong>Monto</strong>&#xA0;-->
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
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:if test="//cbc:UBLVersionID='2.0'">
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
									<xsl:if test="cbc:ID='3001' and cbc:Value!=''">OPERACIÓN SUJETA A DETRACCIÓN CUENTA BANCO DE LA NACIÓN&#xA0;<xsl:value-of select="cbc:Value"/>&#xA0;EXCEPTO NO OPERADORES DE COMERCIO EXTERIOR IMPORTADOR/EXPORTADOR (RS 158-2012)</xsl:if>
								</xsl:for-each>-->
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='2003'">OPERACION SUJETA A DETRACCIÓN BANCO DE LA NACIÓN CUENTA:
											<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20109969452'"><b>00-000-720240</b></xsl:if>
											<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20345286081'"><b>00-000-720232</b></xsl:if>
											<br/>EXCEPTO NO OPERADORES DE COMERCIO EXTERIOR (RS 158-2012)</xsl:if>
									</xsl:for-each>
								</xsl:if>

								<xsl:if test="//cbc:UBLVersionID='2.1'">
									<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode/@listID = '1001'">OPERACIÓN SUJETA A DETRACCIÓN CUENTA BANCO DE LA NACIÓN&#xA0;<b><xsl:value-of select="//cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID"/></b>&#xA0;EXCEPTO NO OPERADORES DE COMERCIO EXTERIOR IMPORTADOR/EXPORTADOR (RS 158-2012)</xsl:if>
								</xsl:if>
							</font>
						</td>
					</tr>
					<!--</tbody>-->
				</table>
			</td>
		</tr>
		<!--<tr>-->
		<td>
		</td>
		<!--</tr>-->
	</xsl:template>

	<!--<xsl:template name="DetalleDetraccion">
		<tr>
			<td width="100%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="2">DETALLE DETRACCION :</font>
			</td>
		</tr>
		<tr>
			<td width="70%">
				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="70%">
					<tbody>
						<tr width="70%">-->
	<!--<td width="25%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Descripción</strong>
								</font>
							</td>-->
	<!--<td width="25%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>% Detracción</strong>
								</font>
							</td>
							<td width="20%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Monto</strong>
								</font>
							</td>
						</tr>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='2003'">
								<tr width="70%">-->
	<!--<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='09'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='09'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='09'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>-->
	<!--<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="format-number(cbc:Percent,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="25%" colspan="3" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">OPERACION SUJETA A DETRACCIÓN BANCO DE LA NACIÓN CUENTA:-->
	<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20109969452'">00-000-720240</xsl:if>-->
	<!--<xsl:if test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID = '20109969452'">00-000-720240</xsl:if>-->

	<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='20'">
													<xsl:value-of select="pe:Valor"/>-->
	<!--</xsl:if>-->
	<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20345286081'">00-000-720232</xsl:if>-->
	<!--<xsl:if test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID = '20345286081'">00-000-720232</xsl:if>-->
	<!--</xsl:for-each>-->
	<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='20'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='20'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>-->

	<xsl:template name="RefExportacion">
		<tr>
			<td width="70%">
				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="70%">
					<tbody>
						<tr width="70%">
							<td width="25%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>INCOTERMS</strong>
								</font>
							</td>
							<td width="25%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='13' and pe:Valor!='DEFAULT'">
											<xsl:value-of select="pe:Valor"/>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='13' and pe2:Valor!='DEFAULT'">
											<xsl:value-of select="pe2:Valor"/>
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>
						</tr>

						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='2003'">
								<tr width="70%">
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">

											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='20'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='20'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>

									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="format-number(cbc:Percent,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<tr>
							<td colspan="3">
								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>SON:</strong>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='19'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='19'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='19'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
										<font size="2" face="Arial, Helvetica, sans-serif"></font>
									</xsl:when>
									<xsl:otherwise>
										<xsl:if test="/pe1:CreditNote">
											<font size="2" face="Arial, Helvetica, sans-serif">
												<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong>
											</font>
										</xsl:if>
										<xsl:if test="/pe2:DebitNote">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>SON:</strong>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='19'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo='19'">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo='19'">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</font>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="DocumentoReferenciaAnti">
		<tr>
			<td width="100%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="2">DOCUMENTO(S) DE REFERENCIA :</font>
			</td>
		</tr>
		<tr>
			<!--<td width="70%">
				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="70%">
					<tbody>
						<tr width="70%">
							<td width="25%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Tipo Documento</strong>
								</font>
							</td>
							<td width="25%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Correlativo</strong>
								</font>
							</td>
						</tr>

						<xsl:for-each select="//cac:PrepaidPayment">
							<xsl:if test="//cbc:InvoiceTypeCode = '01'">
								<tr width="70%">
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="//cbc:InvoiceTypeCode='01'">FACTURA ELECT.</xsl:when>
												<xsl:when test="//cbc:InvoiceTypeCode='03'">BOLETA DE VENTA ELECT.</xsl:when>
												<xsl:when test="//cbc:InvoiceTypeCode='07'">NOTA DE CREDITO ELECT.</xsl:when>
												<xsl:when test="//cbc:InvoiceTypeCode='08'">NOTA DE DEBITO ELECT.</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="substring-before(cbc:ID,'-')"/>-
											<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</tbody>
				</table>
			</td>-->
			<td>
				<xsl:for-each select="//cac:PrepaidPayment">
					<xsl:if test="//cbc:InvoiceTypeCode!='10'">
						<table width="70%" border="0" rules="none" bgcolor="#C4BD97">
							<tbody>
								<tr>
									<xsl:if test="//cac:PrepaidPayment/cbc:ID/@schemeID='02'">
										<td width="30%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>Anticipo</strong>:

												<xsl:value-of select="substring-before(cbc:ID,'-')"/>-
												<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
											</font>
										</td>
									</xsl:if>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</xsl:for-each>

				<xsl:if test="//cbc:DocumentTypeCode='02'">
					<table width="70%" border="0" rules="none" bgcolor="#C4BD97">
						<tbody>
							<td width="100%">
								<table width="100%">
									<tbody>

										<xsl:for-each select="//cac:AdditionalDocumentReference">
											<xsl:if test="//cbc:InvoiceTypeCode!='10'">
												<tr>
													<td width="30%" align="left">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<strong>Anticipo</strong>:
															<xsl:value-of select="cbc:ID"/>
														</font>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
									</tbody>
								</table>
							</td>
						</tbody>
					</table>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td>
				<xsl:choose>
					<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
						<font size="2" face="Arial, Helvetica, sans-serif"/>
					</xsl:when>
					<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
						<font size="2" face="Arial, Helvetica, sans-serif"></font>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="/pe1:CreditNote">
							<font size="2" face="Arial, Helvetica, sans-serif">
								<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong>
							</font>
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
							<font size="2" face="Arial, Helvetica, sans-serif">
								<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong>
							</font>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="LeyendaLey">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo='12'">
				<xsl:variable name="varPDN" select="pe:Valor"/>
				<xsl:if test="$varPDN='1'">
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tbody>
							<tr>
								<td>
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='13'">
												<xsl:variable name="varPdNTxT" select="pe:Valor"/>
												<xsl:call-template name="split">
													<xsl:with-param name="pText" select="$varPdNTxT"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe1:Codigo='13'">
												<xsl:variable name="varPdNTxT" select="pe1:Valor"/>
												<xsl:call-template name="split">
													<xsl:with-param name="pText" select="$varPdNTxT"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe2:Codigo='13'">
												<xsl:variable name="varPdNTxT" select="pe2:Valor"/>
												<xsl:call-template name="split">
													<xsl:with-param name="pText" select="$varPdNTxT"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="OtrosDatos">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo='10'">
				<xsl:variable name="varPDN" select="pe:Valor"/>
				<xsl:if test="$varPDN='1'">
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tbody>
							<tr>
								<td>
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='11'">
												<xsl:variable name="varPdNTxT" select="pe:Valor"/>
												<xsl:call-template name="split">
													<xsl:with-param name="pText" select="$varPdNTxT"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='14' and pe:Valor=1">
									<tr>
										<td colspan="5">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='15'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</font>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='16' and pe:Valor=1">
									<tr>
										<td colspan="5">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='17'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</font>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo='10'">
				<xsl:variable name="varPDN" select="pe1:Valor"/>
				<xsl:if test="$varPDN='1'">
					<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tbody>
							<tr>
								<td>
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='11'">
												<xsl:variable name="varPdNTxT" select="pe1:Valor"/>
												<xsl:call-template name="split">
													<xsl:with-param name="pText" select="$varPdNTxT"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='14' and pe1:Valor=1">
									<tr>
										<td colspan="5">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo='15'">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</font>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='16' and pe1:Valor=1">
									<tr>
										<td colspan="5">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo='17'">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</font>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo='10'">
				<xsl:variable name="varPDN" select="pe2:Valor"/>
				<xsl:if test="$varPDN='1'">
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tbody>
							<tr>
								<td>
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='11'">
												<xsl:variable name="varPdNTxT" select="pe2:Valor"/>
												<xsl:call-template name="split">
													<xsl:with-param name="pText" select="$varPdNTxT"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='14' and pe2:Valor=1">
									<tr>
										<td colspan="5">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo='15'">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</font>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='16' and pe2:Valor=1">
									<tr>
										<td colspan="5">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo='17'">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</font>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<!--<xsl:template name="OtrosDatos2">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo='16'">
				<xsl:variable name="varPDN" select="pe:Valor"/>
				<xsl:if test="$varPDN='1'">

					<table rules="cols" border="0" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tbody>
							<tr>
								<td>
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='17'">
												<xsl:variable name="varPdNTxT" select="pe:Valor"/>
												<xsl:call-template name="split">
													<xsl:with-param name="pText" select="$varPdNTxT"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe1:Codigo='17'">
												<xsl:variable name="varPdNTxT" select="pe1:Valor"/>
												<xsl:call-template name="split">
													<xsl:with-param name="pText" select="$varPdNTxT"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe2:Codigo='17'">
												<xsl:variable name="varPdNTxT" select="pe2:Valor"/>
												<xsl:call-template name="split">
													<xsl:with-param name="pText" select="$varPdNTxT"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>-->

	<xsl:template name="LeyendaReten">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo='8'">
				<xsl:variable name="varPDN" select="pe:Valor"/>
				<xsl:if test="$varPDN='1'">
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tbody>
							<tr>
								<td>
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='9'">
												<xsl:variable name="varPdNTxT" select="pe:Valor"/>
												<xsl:call-template name="split">
													<xsl:with-param name="pText" select="$varPdNTxT"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo='8'">
				<xsl:variable name="varPDN" select="pe1:Valor"/>
				<xsl:if test="$varPDN='1'">
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tbody>
							<tr>
								<td>
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='9'">
												<xsl:variable name="varPdNTxT" select="pe1:Valor"/>
												<xsl:call-template name="split">
													<xsl:with-param name="pText" select="$varPdNTxT"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo='8'">
				<xsl:variable name="varPDN" select="pe2:Valor"/>
				<xsl:if test="$varPDN='1'">
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tbody>
							<tr>
								<td>
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='9'">
												<xsl:variable name="varPdNTxT" select="pe2:Valor"/>
												<xsl:call-template name="split">
													<xsl:with-param name="pText" select="$varPdNTxT"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\2.1" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"><block path="table/td/font/xsl:for&#x2D;each" x="410" y="60"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if/=[0]" x="314" y="88"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if" x="360" y="90"/><block path="table/td/font/xsl:for&#x2D;each[1]" x="300" y="30"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="204" y="58"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if" x="250" y="60"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/xsl:value&#x2D;of" x="320" y="90"/><block path="table/td/font/xsl:for&#x2D;each[2]" x="340" y="30"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="84" y="58"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if" x="130" y="60"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/xsl:value&#x2D;of" x="200" y="90"/></template><template name="Total"><block path="table/tr/td[1]/font/xsl:for&#x2D;each" x="340" y="27"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="44" y="55"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="90" y="57"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="160" y="87"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="260" y="27"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="15"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="410" y="17"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="40" y="87"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="20" y="27"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="84" y="15"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="130" y="17"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="200" y="47"/><block path="table/xsl:for&#x2D;each" x="300" y="27"/><block path="table/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="55"/><block path="table/xsl:for&#x2D;each/xsl:if" x="410" y="57"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="314" y="85"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if" x="360" y="87"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="360" y="127"/><block path="table/xsl:if/!=[0]" x="274" y="85"/><block path="table/xsl:if" x="320" y="87"/><block path="table/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="400" y="127"/><block path="table/xsl:for&#x2D;each[1]" x="280" y="87"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="15"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if" x="90" y="17"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="320" y="127"/><block path="table/xsl:for&#x2D;each[2]" x="240" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="95"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if" x="90" y="97"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="280" y="127"/><block path="table/xsl:for&#x2D;each[3]" x="200" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/!=[0]" x="124" y="135"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if" x="170" y="137"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="240" y="127"/><block path="table/tr[3]/td[1]/xsl:if/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if/font/xsl:value&#x2D;of" x="40" y="127"/><block path="table/tr[3]/td[1]/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if[1]" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if[1]/font/xsl:value&#x2D;of" x="360" y="87"/><block path="table[1]/tr/td/xsl:if/=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if" x="360" y="87"/><block path="table[1]/tr/td/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if[1]" x="360" y="87"/></template><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->