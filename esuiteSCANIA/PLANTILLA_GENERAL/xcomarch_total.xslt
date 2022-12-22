<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>



	
	<xsl:template name="tmpImporteLetras">
		<table border="0" width="100%" cellpadding="0" cellspacing="1">
			<tr>
				<td width="100%" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>SON :</strong>

						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
							<xsl:if test="cbc:ID='1000'">
								<xsl:value-of select="cbc:Value"/>
							</xsl:if>
						</xsl:for-each>
						</xsl:if>

						<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']"/>
						</xsl:if>
					</font>
				</td>
				

			</tr>
		</table>
	</xsl:template>
	
	<xsl:template name="tmpTotal">
		<table border="0" width="75%" cellpadding="1" cellspacing="0" align="left">
		
		</table>
		<table border="0" width="25%" cellpadding="1" cellspacing="0" align="right">

			<xsl:variable name="TotalDescuento">
				<xsl:value-of select="0"/>
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
					<xsl:if test="cbc:ID='2005'">
						<xsl:value-of select="cbc:PayableAmount"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>
		
		<tr>
				<td width="70%" align="left"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						Operación gravada
					</font>
				</td>

				<td width="5%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:call-template name="SimboloMoneda"/>
					</font>
				</td>

				<td width="25%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>&#xA0;
					</font>
				</td>

			</tr>
		
	<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
		<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
			<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				<tr>
				<td width="70%" align="left"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
						<font face="Arial, Helvetica, sans-serif" size="1">
							IGV (18%)
						</font>
					</td>
					<td width="5%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:call-template name="SimboloMoneda"/>
					</font>
				</td>
					<td width="25%" align="right"
						style="border: 1px solid #fff !important;
						border-radius: 5px 5px 5px 5px !important;
						-moz-border-radius: 5px 5px 5px 5px !important;
						-webkit-border-radius: 5px 5px 5px 5px !important;"
							>
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
									<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
											<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
									</xsl:if>								
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
							 	<xsl:value-of select="format-number($IGV,'###,###,##0.00','pen')"/>&#xA0;
							</xsl:if> 
						</font>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>	
	</xsl:if>

	<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
				<tr>
				<td width="70%" align="left"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
						<font face="Arial, Helvetica, sans-serif" size="1">
							IGV (18%)
						</font>
					</td>
					<td width="5%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:call-template name="SimboloMoneda"/>
					</font>
				</td>
					<td width="25%" align="right"
						style="border: 1px solid #fff !important;
						border-radius: 5px 5px 5px 5px !important;
						-moz-border-radius: 5px 5px 5px 5px !important;
						-webkit-border-radius: 5px 5px 5px 5px !important;"
							>
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
									<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
											<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
									</xsl:if>								
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
							 	<xsl:value-of select="format-number($IGV,'###,###,##0.00','pen')"/>&#xA0;
							</xsl:if> 
						</font>
					</td>
				</tr>
		</xsl:for-each>	
		<xsl:for-each select="/pe2:DeditNote/cac:TaxTotal">
				<tr>
				<td width="70%" align="left"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
						<font face="Arial, Helvetica, sans-serif" size="1">
							IGV (18%)
						</font>
					</td>
					<td width="5%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:call-template name="SimboloMoneda"/>
					</font>
				</td>
					<td width="25%" align="right"
						style="border: 1px solid #fff !important;
						border-radius: 5px 5px 5px 5px !important;
						-moz-border-radius: 5px 5px 5px 5px !important;
						-webkit-border-radius: 5px 5px 5px 5px !important;"
							>
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
									<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
											<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
									</xsl:if>								
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
							 	<xsl:value-of select="format-number($IGV,'###,###,##0.00','pen')"/>&#xA0;
							</xsl:if> 
						</font>
					</td>
				</tr>
		</xsl:for-each>
	</xsl:if>


			<tr>
				<td width="70%" align="left"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						Operación Inafecta
					</font>
				</td>
				<td width="5%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:call-template name="SimboloMoneda"/>
					</font>
				</td>
				<td width="25%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>&#xA0;
					</font>
				</td>
			</tr>
			<tr>
				<td width="70%" align="left"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						Operación Exonerada
					</font>
				</td>
				<td width="5%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:call-template name="SimboloMoneda"/>
					</font>
				</td>
				<td width="25%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="format-number($OPExonerada,'###,###,##0.00','pen')"/>&#xA0;
					</font>
				</td>
			</tr>		
			<tr>
				<td width="70%" align="left"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						Operación Exportación
					</font>
				</td>
				<td width="5%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:call-template name="SimboloMoneda"/>
					</font>
				</td>
				<td width="25%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="format-number($OPExportacion,'###,###,##0.00','pen')"/>&#xA0; 
					</font>
				</td>
			</tr>
			<tr>
				<td width="70%" align="left" 
					style="border: 1px solid #fff !important;
					border-radius: 5px 5px 5px 5px !important;
					-moz-border-radius: 5px 5px 5px 5px !important;
					-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						Op. Título Gratuito
					</font>
				</td>
				<td width="5%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:call-template name="SimboloMoneda"/>
					</font>
				</td>
				<td width="25%" align="right"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="format-number($OPGratuita, '###,###,##0.00', 'pen')"/>&#xA0;
					</font>
				</td>
			</tr>
			<tr>
				<td width="70%" align="left"
					style="border: 1px solid #fff !important;
					border-radius: 5px 5px 5px 5px !important;
					-moz-border-radius: 5px 5px 5px 5px !important;
					-webkit-border-radius: 5px 5px 5px 5px !important;"
					>
					<font face="Arial, Helvetica, sans-serif" size="1">
						Importe Total
					</font>
				</td>
				<td width="5%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:call-template name="SimboloMoneda"/>
					</font>
				</td>
				<td width="25%" align="right"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;"
				>
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="format-number($Total,'###,###,##0.00','pen')"/>&#xA0;
					</font>
				</td>
			</tr>
		

				
		</table>
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

	<xsl:variable name="OPGravada">
		<xsl:value-of select="0.00"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID = '1001'">
				<xsl:value-of select="cbc:PayableAmount"/>
			</xsl:if>
		</xsl:for-each>
		
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
	
	<!-- Total Exportacion -->
	<!-- EXPORTACION-->
	<!-- <xsl:if test="$tipoDoc = '40'"> -->
		<!-- <xsl:value-of select="format-number($OPExportacion,'###,###,##0.00','pen')"/>&#xA0; -->
	<!-- </xsl:if> -->
	
	<xsl:variable name="OPExportacion">
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
		
	<!-- Total Gratuito -->
	<!-- <xsl:if test="//cbc:Note[@languageLocaleID='1002']!=''"> -->
		<!-- <xsl:value-of select="format-number($OPGratuita, '###,###,##0.00', 'pen')"/>&#xA0; -->
	<!-- </xsl:if> -->
	
	<xsl:variable name="OPGratuita">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID = '1004'">
				<xsl:value-of select="cbc:PayableAmount"/>
			</xsl:if>
		</xsl:for-each>

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
	
	<!-- Total Exonerado -->
	<!-- <xsl:if test="//cbc:UBLVersionID='2.1'"> -->
		<!-- <xsl:value-of select="format-number($OPExonerada,'###,###,##0.00','pen')"/>&#xA0; -->
	<!-- </xsl:if> -->
	
	<xsl:variable name="OPExonerada">
		<xsl:value-of select="0.00"/>
		
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID='1003'">
				<xsl:value-of select="cbc:PayableAmount"/>
			</xsl:if>
		</xsl:for-each>

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
	
	<!-- Total Inafecto -->
	<!-- <xsl:if test="//cbc:UBLVersionID='2.1'"> -->
		<!-- <xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>&#xA0; -->
	<!-- </xsl:if> -->
	
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
		
	<!-- Total Descuento -->
	<!-- <xsl:value-of select="format-number($DescuentoGlobal,'###,###,##0.00','pen')"/>&#xA0; -->
	
	<xsl:variable name="DescuentoGlobal">
		<xsl:value-of select="0"/>
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

	<!-- Total IGV -->	
	<!-- <xsl:if test="//cbc:UBLVersionID='2.1'"> -->
		<!-- <xsl:value-of select="format-number($IGV,'###,###,##0.00','pen')"/>&#xA0; -->
	<!-- </xsl:if> -->
	
	<xsl:variable name="IGV">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	
	<!--Importe Total-->
	<!-- <xsl:if test="//cbc:UBLVersionID='2.1'"> -->
		<!-- <xsl:value-of select="format-number($Total,'###,###,##0.00','pen')"/>&#xA0; -->
	<!-- </xsl:if> -->
	
	<xsl:variable name="Total">
		<xsl:value-of select="0.00"/>

		<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
			<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:PayableAmount"/>
		</xsl:if>
		<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
			<xsl:value-of select="//cac:RequestedMonetaryTotal/cbc:PayableAmount"/>
		</xsl:if>
	</xsl:variable>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20101363008&#x2D;01&#x2D;F999&#x2D;00000001.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="true"/><advancedProp name="bGenerateByteCode" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="xsltVersion" value="2.0"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->