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
			<table border="0" width="50%" cellpadding="1" cellspacing="0" align="left">
				</table>
		<table border="1" width="50%" cellpadding="1" cellspacing="0" align="right"
		style="border-collapse:separate;border:solid #2F528F 2px;border-radius:6px;-moz-border-radius:6px;">
		
				<tr>
				<td width="10%" align="left"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>Sub Total de Ventas:</strong>
					</font>
				</td>
				<td width="10%" align="right" style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:call-template name="SimboloMoneda"/>&#xA0;&#xA0;
									<xsl:if test="//cbc:Note[@languageLocaleID='1002']!=''">
									0.00&#160;
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1001'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
									</xsl:if>
										<!--Sub Total de Ventas FACTURA--> 
									<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
									<xsl:choose>
									<xsl:when test="//pe:Invoice/cac:AllowanceCharge!=''">
									<xsl:for-each select="/pe:Invoice/cac:AllowanceCharge">
									<xsl:if test="//cbc:AllowanceChargeReasonCode ='04'">
									<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
										<xsl:value-of select="format-number(cbc:BaseAmount, '###,###,##0.00', 'pen')"/>
										</font>
									</xsl:if>
									</xsl:for-each>
									
									<xsl:for-each select="/pe:Invoice/cac:AllowanceCharge">
									<xsl:if test="//cbc:AllowanceChargeReasonCode ='62'">
									<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
										<xsl:value-of select="format-number(cbc:BaseAmount, '###,###,##0.00', 'pen')"/>
										</font>
									</xsl:if>
									</xsl:for-each>
									</xsl:when>
								<xsl:otherwise>
											
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if></xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if></xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if></xsl:if>
						</xsl:for-each>

						<xsl:variable name="Gravado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if></xsl:if>
						</xsl:for-each>
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>
 										<xsl:if test="$Gravado = ''">
											0.00&#xA0;
										</xsl:if>
										

						</xsl:if>
						</xsl:otherwise>
						</xsl:choose>
						</xsl:if>
						<!--VALOR DE VENTA BOLETAS-->
					<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if></xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if></xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if></xsl:if>
						</xsl:for-each>
						<xsl:variable name="Gravado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if></xsl:if>
						</xsl:for-each>
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>
 										<xsl:if test="$Gravado = ''">
											0.00&#xA0;
										</xsl:if>
						</xsl:if>
				</xsl:if>
						
						<!--Sub Total de Ventas FACTURA CREDITO--> 
						<xsl:if test="/pe1:CreditNote">			
						<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID ='1000'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
							<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID ='9998'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
							<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID ='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
							<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:variable name="Gravado">

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID ='1000'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID ='9998'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID ='9995'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>
 										<xsl:if test="$Gravado = ''">
											0.00&#xA0;
										</xsl:if>
						</xsl:if>

						</xsl:if>
						
						
						<!--Sub Total de Ventas FACTURA DEBITO--> 
							<xsl:if test="/pe2:DebitNote">			
						<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
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
						<xsl:variable name="Gravado">
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							  <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>
 										<xsl:if test="$Gravado = ''">
											0.00&#xA0;
										</xsl:if>
						</xsl:if>
						</xsl:if>
								</font>
							</td>
			</tr>
				<tr>
				<td width="50%" align="left" 
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>Descuento</strong>
					</font>
				</td>
				<td width="50%" align="right"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="2">
				
				<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:call-template name="SimboloMoneda"/>&#xA0;
					<xsl:choose>
					<xsl:when test="//pe:Invoice/cac:AllowanceCharge!=''">
						<xsl:if test="//cbc:AllowanceChargeReasonCode ='02'">
						<xsl:value-of select="format-number(//cbc:Amount, '###,###,##0.00', 'pen')"/>&#xA0;
					</xsl:if>
					</xsl:when>
					<xsl:otherwise>0.00&#160;</xsl:otherwise>
				</xsl:choose>
				
				</xsl:if>
			
					</font>
				</td>
			</tr>
			
			
							<tr>
				<td width="50%" align="left" 
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>Total Impuesto Traslado</strong>
					</font>
				</td>
				<td width="50%" align="right"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:call-template name="SimboloMoneda"/>&#xA0;&#xA0;
						0.00&#160;
			
					</font>
				</td>
			</tr>
		

	<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
					<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
	<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				<tr>
					<td width="50%" align="left"
									style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>Total impuestos Retenidos</strong>
						</font>
					</td>
					<td width="50%" align="right"
									style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
						<font face="Arial, Helvetica, sans-serif" size="2">
						
						
						<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
						<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!='0.00'">
							<xsl:call-template name="SimboloMoneda"/>&#xA0;
							<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
						</xsl:if>
				
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
								<xsl:if test="cbc:TaxAmount!='0.00'">
									<xsl:call-template name="SimboloMoneda"/>&#xA0;
								<xsl:value-of select="format-number(cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>
						</font>
					</td>
				</tr>
			</xsl:for-each>
	</xsl:for-each>	
				</xsl:if>
				
			<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
					<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				<tr>
					<td width="50%" align="left"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>Total impuestos Retenidos</strong>
						</font>
					</td>
					<td width="50%" align="right"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;"
					>
						<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
       								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
										<xsl:call-template name="SimboloMoneda"/>&#xA0;
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#160;
									</xsl:if>
								</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
										<xsl:call-template name="SimboloMoneda"/>&#xA0;
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#160;
									</font>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
										<xsl:call-template name="SimboloMoneda"/>&#xA0;
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#160;
									</font>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:variable name="IGV">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
								<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:call-template name="SimboloMoneda"/>&#xA0;
									<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:call-template name="SimboloMoneda"/>&#xA0;
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:call-template name="SimboloMoneda"/>&#xA0;
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</xsl:variable>


                       <!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
					   	<xsl:call-template name="SimboloMoneda"/>&#xA0;
					   <xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
						</font>
					</td>
				</tr>
			</xsl:for-each>
	</xsl:for-each>	
				</xsl:if>
		
			<tr>
				<td width="50%" align="left"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;"
				>
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong> Total </strong>
					</font>
				</td>
				<td width="50%" align="right"
				style="border: 1px solid #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;"
				>
				<xsl:if test="//cbc:UBLVersionID='2.0'">
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
						</font>
					</xsl:if>
					<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
						</font>
					</xsl:if>
					
					</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
						
							<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
							<font size="2" face="Arial, Helvetica, sans-serif">
								<xsl:call-template name="SimboloMoneda"/>&#xA0;
								<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
							</xsl:if>
							<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
							<font size="2" face="Arial, Helvetica, sans-serif">
							<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
							</xsl:if>	
								</xsl:if>	
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