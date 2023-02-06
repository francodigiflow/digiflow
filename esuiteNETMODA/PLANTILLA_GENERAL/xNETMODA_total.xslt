<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
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
				<!-- MONTO DE DETRACCIÓN --> 
			<tr>
				<td width="100%" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">		  
    <xsl:variable name="DetraMonto">
	       <xsl:if test="//cac:PaymentMeans/cbc:ID='Detraccion'">
             <xsl:value-of select="//cac:PaymentTerms/cbc:Amount"/>
		   </xsl:if>
    </xsl:variable>  
    <xsl:variable name="DetraPorcentaje">
	<xsl:if test="//cac:PaymentMeans/cbc:ID='Detraccion'">
            <xsl:value-of select="//cac:PaymentTerms/cbc:PaymentPercent"/>
			</xsl:if>
    </xsl:variable>  
    <xsl:variable name="DetraBBYSS">
	<xsl:if test="//cac:PaymentTerms/cbc:ID='Detraccion'">
        <xsl:value-of select="//cac:PaymentTerms/cbc:PaymentMeansID[@schemeName='Codigo de detraccion']"/>
		</xsl:if>
    </xsl:variable>
    <xsl:variable name="DetraCuenta">
	<xsl:if test="//cac:PaymentMeans/cbc:ID='Detraccion'">
            <xsl:value-of select="//cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID"/>
			</xsl:if>
		
    </xsl:variable>
    
						<xsl:if test="//cbc:Note[@languageLocaleID='2006']">
								<!--<b>Operación Sujeta a Sistema de Pago de Obligaciones Tributarias con el Gobierno Central D. Leg. 940</b>
                                <br/><b>Código de BB y SS Sujetos A:</b> <xsl:value-of select="$DetraBBYSS"/>
								<br/><b>Numero de Cta. En el BN :</b> <xsl:value-of select="$DetraCuenta"/>
								<br/><b>Monto Detracción:</b> <xsl:value-of select="format-number($DetraMonto,'###,###,###.00','pen')"/> (<xsl:value-of select="$DetraPorcentaje"/>%)-->
						</xsl:if>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="tmpPieComprobante_FB">
		<table width="100%"  border="0">

			<tr>
					<td align="left" width="100%" colspan="3">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='2003' and cbc:PayableAmount!='0.00'">
								OPERACIÓN SUJETA AL SISTEMA DE PAGO DE OBLIGACIONES TRIBUTARIAS
							</xsl:if>
						</xsl:for-each>
						<br/>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
							<xsl:if test="cbc:ID='3001' and cbc:Value!=''">
								CUENTA DE DETRACCIÓN BANCO DE LA NACIÓN: <xsl:value-of select="cbc:Value"/>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>

			<tr>
				<td width="40%">
					<!--xsl:if test="//cac:PrepaidPayment/cbc:PaidAmount!=''">	
						<xsl:call-template name="tmpAnticipo"/>
					</xsl:if-->
				</td>
				<td width="20%">
				</td>
				<td width="40%">
					<xsl:if test="//cbc:UBLVersionID='2.0'">
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount!=''">
					<xsl:call-template name="tmpDetalleRecargosFB"/>
					</xsl:if>
					</xsl:if>

					<xsl:if test="//cbc:UBLVersionID='2.1'">
					<xsl:if test="//ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional[pe:Codigo='27' and pe:Valor!='0.00']">
					<xsl:call-template name="tmpDetalleRecargosFB"/>
					</xsl:if>
					</xsl:if>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="tmpPieComprobante_NCND">
		<table border="0" width="100%">
			<tr>
				<td width="40%" valign="top">
					<table width="100%">
						<tr>
							<td width="100%" valign="top" align="justify">

								
							</td>
						</tr>
					</table>
				</td>
				<td width="15%"/>
				<td width="40%" valign="top">
					
				</td>
			</tr>
		</table>
	</xsl:template>
	
		<xsl:template name="observacionesnew">
		<table  borderColor="#000000" cellSpacing="0" cellPadding="1" width="50%" border="0px">
			<tr width="100%">
				<td width="100%" align="left" >
					<font size="1" face="Arial, Helvetica, sans-serif">
						<strong>Observaciones:</strong>
						
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="09"/></xsl:call-template>
						</font>&#160;&#160;
					</font>
				</td>
			</tr>
			</table>
				</xsl:template>
	<xsl:template name="tmpMotivoAnulación">
		<table  borderColor="#000000" cellSpacing="0" cellPadding="1" width="50%" border="0px">
			<tr width="100%">
				<td width="100%" align="left" >
					<font size="1" face="Arial, Helvetica, sans-serif">
						<strong>Motivo o Sustento : </strong><xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
					</font>
				</td>
			</tr>
				</table>
	</xsl:template>

	<xsl:template name="tmpTotal">
			<table border="0" width="70%" cellpadding="3" cellspacing="0" align="left">
			<tr>
			<td vAlign="middle">
						<xsl:if test="//pe:Invoice/cac:AllowanceCharge!=''">
		<!--<xsl:for-each select="//cac:PrepaidPayment">-->
		
	<!--<font color="#666666" size="1" face="Arial, Helvetica, sans-serif">[</font>-->
	<xsl:if test="//pe:Invoice/cac:AllowanceCharge!=''">							
	<xsl:for-each select="/pe:Invoice/cac:AllowanceCharge">
	<xsl:if test="//cbc:AllowanceChargeReasonCode ='04'">
	<font color="#666666" size="1" face="Arial, Helvetica, sans-serif">	
	[<xsl:value-of select="format-number(cbc:Amount, '###,###,##0.00', 'pen')"/>	] ANTICIPO VENTA </font>
	</xsl:if>
	</xsl:for-each>
	</xsl:if><!--<font color="#666666" size="1" face="Arial, Helvetica, sans-serif">	] ANTICIPO VENTA [</font>-->
	

		<!--</xsl:for-each>-->
		<xsl:for-each select="//cac:AdditionalDocumentReference">
	<xsl:if test="not(cbc:ID=000)">
	<font color="#666666" size="1" face="Arial, Helvetica, sans-serif">	[<xsl:value-of select="cbc:ID"/>]</font>
	</xsl:if>
	
	</xsl:for-each>
	<!--<font color="#666666" size="1" face="Arial, Helvetica, sans-serif">]</font>-->
			</xsl:if>
				<xsl:call-template name="DatosCredito"/>
				<xsl:if test="/pe:Invoice">
						<xsl:call-template name="observacionesnew"/>
						</xsl:if>
				<xsl:if test="/pe1:CreditNote">
				<xsl:call-template name="Observacion" /><br/>
				<xsl:call-template name="DocumentoReferencia"/><br/>
					<xsl:call-template name="tmpMotivoAnulación"/>
					<xsl:call-template name="observacionesnew"/>
					
					
				</xsl:if>
				
				<xsl:if test="/pe2:DebitNote">
				<xsl:call-template name="Observacion" /><br/>
				<xsl:call-template name="DocumentoReferencia"/><br/>
					<xsl:call-template name="tmpMotivoAnulación"/>
						<xsl:call-template name="observacionesnew"/>
						
				</xsl:if>
			</td>

			</tr>
				</table>
		<table border="0" width="30%" cellpadding="3" cellspacing="0" align="right">
<!--xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode !='00'"-->
<xsl:if test="/pe:Invoice">
			<tr>
				<td  width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong >OP. GRAVADAS</strong>
					</font>
				</td>
				<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:call-template name="SimboloMoneda"/>
					
						
						<xsl:choose>
							<xsl:when test="//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode=02">
								<xsl:variable name="DsctoGlobal1">
									<xsl:for-each select="//pe:Invoice/cac:AllowanceCharge">
										<xsl:value-of select="cbc:BaseAmount" />
									</xsl:for-each>
									<xsl:for-each select="//pe1:CreditNote/cac:AllowanceCharge">
										<xsl:value-of select="format-number(cbc:BaseAmount,'###.###.##0,00','pen')" />
									</xsl:for-each>
									<xsl:for-each select="//pe2:DebitNote/cac:AllowanceCharge">
										<xsl:value-of select="format-number(cbc:BaseAmount,'###.###.##0,00','pen')" />
									</xsl:for-each>
								</xsl:variable>

								<xsl:if test="/pe:Invoice">
									<xsl:value-of select="format-number($DsctoGlobal1, '###,###,##0.00', 'pen')" />&#xA0;
								</xsl:if>

								<xsl:if test="/pe1:CreditNote">
			                  		<xsl:value-of select="format-number($DsctoGlobal1, '###,###,##0.00', 'pen')" />&#xA0;
								</xsl:if>
								
								<xsl:if test="/pe2:DebitNote">
			                  		<xsl:value-of select="format-number($DsctoGlobal1, '###,###,##0.00', 'pen')" />&#xA0;
								</xsl:if>
							</xsl:when>
							<xsl:when test="//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='04'">
								<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:LineExtensionAmount"/>&#xA0;
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
										<xsl:value-of select="format-number(cbc:TaxableAmount,'###,###,##0.00','pen')"/>&#xA0;
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">					
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
										<xsl:value-of select="format-number(cbc:TaxableAmount,'###.###.##0,00','pen')"/>&#xA0;
									</xsl:if>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:variable name="Gravado">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
						  			<xsl:value-of select="cbc:TaxableAmount"/>&#xA0;
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:value-of select="cbc:TaxableAmount"/>&#xA0;
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
						  			<xsl:value-of select="cbc:TaxableAmount"/>&#xA0;
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>
 						
						<xsl:if test="$Gravado = '' ">
							0.00&#xA0;
						</xsl:if>
					</font>
				</td>
			</tr>
			
			<tr>
				<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>OP. EXONERADA</strong>
					</font>
				</td>
				<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
	                	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
	                    <xsl:if test="cbc:ID = '1003'">
						<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#160;
					 	</xsl:if>
	                  	</xsl:for-each>
						</xsl:if>
						<xsl:variable name="OPExonerada">
						<xsl:value-of select="0.00"/>
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
								<xsl:value-of select="cbc:TaxableAmount"/>
							</xsl:if>
						</xsl:for-each>
					</xsl:variable>
					<xsl:call-template name="SimboloMoneda"/>
					<xsl:value-of select="format-number($OPExonerada,'###,###,##0.00','pen')"/>&#xA0;
					</font>
				</td>
			</tr>
					
					<xsl:if test="/pe:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='30'">
				<tr>
				<td width="60%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>OPERACIÓN INAFECTA</strong>
					</font>
				</td>
				<td width="40%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
	                	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
	                    	<xsl:if test="cbc:ID = '1002'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#160;
					 		</xsl:if>
	                  	</xsl:for-each> 
						</xsl:if>
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
					</xsl:variable>
					<xsl:call-template name="SimboloMoneda"/>
					<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>&#xA0;
					</font>
				</td>
			</tr>
				</xsl:if>
				<tr>
				<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>OP. EXPORTACIÓN</strong>
					</font>
				</td>
				<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
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
				<xsl:call-template name="SimboloMoneda"/>
				<xsl:value-of select="format-number($OPExport,'###,###,##0.00','pen')"/>&#160;
					
					</font>
				</td>
			</tr>
			
		

			<!--<xsl:if test="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount!=''">-->
				<tr>
					<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>TOTAL OP. GRATUITA</strong>
						</font>
					</td>
					<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
						<font face="Arial, Helvetica, sans-serif" size="1">
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
		<xsl:call-template name="SimboloMoneda"/>
	<xsl:value-of select="format-number($OpeGrat,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
				</tr>
				<xsl:if test="//pe:Invoice/cac:AllowanceCharge!=''">
					<!--xsl:if test="//cbc:AllowanceChargeReasonCode ='02'"-->
					<xsl:if test="//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode = '02' or //cac:AllowanceCharge/cbc:AllowanceChargeReasonCode = '03'">
				<tr>
				<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>DSCTOS TOTALES</strong>
					</font>
				</td>
				<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
				<xsl:variable name="DsctoGlobal">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
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
						</xsl:if>

						<xsl:if test="//cbc:UBLVersionID='2.1'">		
						<xsl:value-of select="0"/>
						<xsl:if test="//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode = '02' or //cac:AllowanceCharge/cbc:AllowanceChargeReasonCode = '03'">
						<xsl:value-of select="//cac:AllowanceCharge/cbc:Amount"/>
						</xsl:if>		
						</xsl:if>
						</xsl:variable>
							<xsl:call-template name="SimboloMoneda"/>
	                  	<xsl:value-of select="format-number($DsctoGlobal, '###,###,##0.00', 'pen')" />&#xA0;
					</font>
				</td>
			</tr>
		</xsl:if></xsl:if>
			
			<xsl:if test="//pe:Invoice/cac:AllowanceCharge!=''">
				<xsl:if test="//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode = '04'">
				
						<tr>
				<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>DCTO. ANTICIPO</strong>
					</font>
				</td>
				<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
									<!--xsl:if test="//cbc:UBLVersionID='2.1'">
					<xsl:if test="//pe:Invoice/cac:AllowanceCharge!=''">
						<xsl:call-template name="SimboloMoneda"/>
					<xsl:choose>
					<xsl:when test="//pe:Invoice/cac:AllowanceCharge!=''">
						<xsl:if test="//cbc:AllowanceChargeReasonCode ='04'">
						<xsl:value-of select="format-number(//cbc:Amount, '###,###,##0.00', 'pen')"/>&#xA0;
					</xsl:if>
					</xsl:when>
				</xsl:choose>
				</xsl:if>
				</xsl:if-->
				
				<xsl:variable name="DsctoAnticipo">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
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
						</xsl:if>

						<xsl:if test="//cbc:UBLVersionID='2.1'">		
						<xsl:value-of select="0"/>
						<xsl:if test="//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode = '04'">
						<xsl:value-of select="//cac:AllowanceCharge/cbc:Amount"/>
						</xsl:if>		
						</xsl:if>
						</xsl:variable>
							<xsl:call-template name="SimboloMoneda"/>
	                  	<xsl:value-of select="format-number($DsctoAnticipo, '###,###,##0.00', 'pen')" />&#xA0;
					</font>
				</td>
			</tr>
			</xsl:if></xsl:if>
	<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
					<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
	<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				<tr>
					<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>TOTAL IGV 18%</strong>
						</font>
					</td>
					<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
						<font face="Arial, Helvetica, sans-serif" size="1">
						
						
						<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
						<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!='0.00'">
							<xsl:call-template name="SimboloMoneda"/>
							<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
						</xsl:if>
				
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
								<xsl:if test="cbc:TaxAmount!='0.00'">
									<xsl:call-template name="SimboloMoneda"/>
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
					<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>TOTAL IGV 18%</strong>
						</font>
					</td>
					<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
						<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
       								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
										<xsl:call-template name="SimboloMoneda"/>
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#160;
									</xsl:if>
								</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										<xsl:call-template name="SimboloMoneda"/>
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#160;
									</font>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										<xsl:call-template name="SimboloMoneda"/>
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
										<xsl:call-template name="SimboloMoneda"/>
									<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:call-template name="SimboloMoneda"/>
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:call-template name="SimboloMoneda"/>
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</xsl:variable>


                       <!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
					   	<xsl:call-template name="SimboloMoneda"/>
					   <xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
						</font>
					</td>
				</tr>
			</xsl:for-each>
	</xsl:for-each>	
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="/pe1:CreditNote  or  /pe2:DebitNote">
			<tr>
				<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>OP. GRAVADAS</strong>
					</font>
				</td>
				<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:call-template name="SimboloMoneda"/>
						<xsl:choose>
				<xsl:when test="//cac:AllowanceCharge/cbc:Amount!=0.00">
							<xsl:variable name="DsctoGlobal1">
							
							<xsl:for-each select="//pe1:CreditNote/cac:AllowanceCharge">
								<xsl:value-of select="format-number(cbc:BaseAmount,'###.###.##0,00','pen')" />
							</xsl:for-each>


							<xsl:for-each select="//pe2:DebitNote/cac:AllowanceCharge">
								<xsl:value-of select="format-number(cbc:BaseAmount,'###.###.##0,00','pen')" />
							</xsl:for-each>
						</xsl:variable>

						<xsl:if test="/pe1:CreditNote">
	                  <xsl:value-of select="format-number($DsctoGlobal1, '###,###,##0.00', 'pen')" />&#xA0;
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
	                  	<xsl:value-of select="format-number($DsctoGlobal1, '###,###,##0.00', 'pen')" />&#xA0;
						</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					
					<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
					<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">					
					<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
					</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
					<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
					<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
					</xsl:if>
					</xsl:for-each>
					
						<!--xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
						</xsl:if>
						</xsl:for-each-->
				</xsl:otherwise>
				</xsl:choose>

						<xsl:variable name="Gravado">
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  			<xsl:value-of select="cbc:TaxableAmount"/>&#xA0;
										<!--<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;-->
									</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  			<xsl:value-of select="cbc:TaxableAmount"/>&#xA0;
										<!--<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;-->
									</xsl:if>
							</xsl:for-each>
							</xsl:variable>
 										<xsl:if test="$Gravado = '' ">
											0.00&#xA0;
										</xsl:if>
					</font>
					<!--font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:variable name="v_TotalGravado">

						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID = '1001'">
									<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">

								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>

							</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</xsl:variable>
						<xsl:if test="$v_TotalGravado != '0' or $v_TotalGravado!='0.00'">
						<xsl:call-template name="SimboloMoneda"/>
									<xsl:value-of select="$v_TotalGravado"/>
								</xsl:if>
								<xsl:if test="$v_TotalGravado = ''">
								<xsl:call-template name="SimboloMoneda"/>
									<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
								</xsl:if>
					</font-->
				</td>
			</tr>
			
			<tr>
				<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>OP. EXONERADA</strong>
					</font>
				</td>
				<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
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
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:call-template name="SimboloMoneda"/>
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
							<!--</xsl:if>--></xsl:if>
						</xsl:for-each>
                       
					   
					   <!--
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:if test="cbc:TaxableAmount='0.00'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:if test="cbc:TaxableAmount='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>-->
						 <xsl:variable name="Exonerado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>

							<xsl:call-template name="SimboloMoneda"/>
 										<xsl:if test="$Exonerado = ''">
											0.00&#xA0;
										</xsl:if>

                                </xsl:if>
					</font>
				</td>
			</tr>
			
			<!--tr>
				<td width="60%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>OP. INAFECTA</strong>
					</font>
				</td>
				<td width="40%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:if test="//cbc:UBLVersionID='2.0'">					
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID = '1002'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
						</xsl:for-each>
						</xsl:if>
					<xsl:if test="//cbc:UBLVersionID='2.1'">					
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
								<xsl:if test="cbc:TaxableAmount!='0.00'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if></xsl:if>
						</xsl:for-each>
						 <xsl:variable name="Inafecto">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
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
			</tr-->

			<!--<xsl:if test="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount!=''">-->
				<tr>
					<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>TOTAL OP. GRATUITAS</strong>
						</font>
					</td>
					<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<!--<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount, '###,###,##0.00', 'pen')"/>-->
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
	<xsl:call-template name="SimboloMoneda"/>
						<xsl:value-of select="format-number($OpeGrat, '###,###,##0.00', 'pen')" />&#xA0;


						</font>
					</td>
				</tr>
<tr>
				<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>DSCTOS TOTALES</strong>
					</font>
				</td>
				<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<!--<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount, '###,###,##0.00', 'pen')"/>-->

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
							<xsl:call-template name="SimboloMoneda"/>
	                  	<xsl:value-of select="format-number($DsctoGlobal, '###,###,##0.00', 'pen')" />&#xA0;

						</font>
					</font>
				</td>
			</tr>
			<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
				<tr>
					<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>TOTAL IGV 18%</strong>
						</font>
					</td>
					<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
						<font face="Arial, Helvetica, sans-serif" size="1">
						<!--	<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
								<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/> </xsl:if>
						-->
							<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:variable name="IGV">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
								<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:call-template name="SimboloMoneda"/>
									<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:call-template name="SimboloMoneda"/>
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:call-template name="SimboloMoneda"/>
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</xsl:variable>


                       <!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
					   	<xsl:call-template name="SimboloMoneda"/>
					   <xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
						</font>
					</td>
				</tr>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
				<tr>
					<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#A5A5A5; color:#fff;">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>TOTAL IGV 18%</strong>
						</font>
					</td>
					<td width="50%" align="right" style="
				border: solid 1px #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<!--xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
								<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
							</xsl:if-->
							
								<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:variable name="IGV">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
								<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:call-template name="SimboloMoneda"/>
									<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:call-template name="SimboloMoneda"/>
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
										<xsl:call-template name="SimboloMoneda"/>
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</xsl:variable>


                       <!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
					   	<xsl:call-template name="SimboloMoneda"/>
					   <xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
						</font>
					</td>
				</tr>
			</xsl:for-each>

			</xsl:if>
			
			<!--</xsl:if>-->

		

			<tr>
				<td width="50%" align="center" style="
				border: solid 1px #fff !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;
				background-color:#0092cf; color:#fff;">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>TOTAL </strong>
					</font>
				</td>
				<td width="50%" align="right" style="
				border: solid 1px #0092cf !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
				<xsl:if test="//cbc:UBLVersionID='2.0'">
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
						</font>
					</xsl:if>
					<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
						</font>
					</xsl:if>
					
					</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
						
							<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
							<font color="#0092cf" size="1" face="Arial, Helvetica, sans-serif">
								<xsl:call-template name="SimboloMoneda"/>
								<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
							</xsl:if>
							<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
							<font color="#0092cf" size="1" face="Arial, Helvetica, sans-serif">
							<xsl:call-template name="SimboloMoneda"/>
							<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
							</xsl:if>	
							<!--<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
							<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
							</xsl:if>	-->
						</xsl:if>	
				</td>
			</tr>
			<xsl:if test="/pe:Invoice">
				<tr>
					<td width="50%" align="center" style="
						border: solid 1px #fff !important;
						border-radius: 5px 5px 5px 5px !important;
						-moz-border-radius: 5px 5px 5px 5px !important;
						-webkit-border-radius: 5px 5px 5px 5px !important;
						background-color:#A5A5A5; color:#fff;">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong> <xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="04"/></xsl:call-template> </strong>
						</font>
					</td>
					<td width="50%" align="right" style="
						border: solid 1px #a7a7a7 !important;
						border-radius: 5px 5px 5px 5px !important;
						-moz-border-radius: 5px 5px 5px 5px !important;
						-webkit-border-radius: 5px 5px 5px 5px !important;">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="05"/></xsl:call-template>
						</font>
					</td>
				</tr>

				<xsl:if test="$ValorPago2!='' and $ValorPago2!='-'">
					<tr>
						<td width="50%" align="center" style="
							border: solid 1px #fff !important;
							border-radius: 5px 5px 5px 5px !important;
							-moz-border-radius: 5px 5px 5px 5px !important;
							-webkit-border-radius: 5px 5px 5px 5px !important;
							background-color:#A5A5A5; color:#fff;">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<strong> <xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="14"/></xsl:call-template> </strong>
							</font>
						</td>
						<td width="50%" align="right" style="
							border: solid 1px #a7a7a7 !important;
							border-radius: 5px 5px 5px 5px !important;
							-moz-border-radius: 5px 5px 5px 5px !important;
							-webkit-border-radius: 5px 5px 5px 5px !important;">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="15"/></xsl:call-template>
							</font>
						</td>
					</tr>
				</xsl:if>

				<xsl:if test="$ValorPago3!='' and $ValorPago3!='-'">
					<tr>
						<td width="50%" align="center" style="
							border: solid 1px #fff !important;
							border-radius: 5px 5px 5px 5px !important;
							-moz-border-radius: 5px 5px 5px 5px !important;
							-webkit-border-radius: 5px 5px 5px 5px !important;
							background-color:#A5A5A5; color:#fff;">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<strong> <xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="16"/></xsl:call-template> </strong>
							</font>
						</td>
						<td width="50%" align="right" style="
							border: solid 1px #a7a7a7 !important;
							border-radius: 5px 5px 5px 5px !important;
							-moz-border-radius: 5px 5px 5px 5px !important;
							-webkit-border-radius: 5px 5px 5px 5px !important;">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="17"/></xsl:call-template>
							</font>
						</td>
					</tr>
				</xsl:if>
			</xsl:if>
		</table>
	</xsl:template>

	<xsl:variable name="ValorPago2">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="15"/>	
		</xsl:call-template>			
	</xsl:variable>

	<xsl:variable name="ValorPago3">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="17"/>	
		</xsl:call-template>			
	</xsl:variable>

	<xsl:template name="Referencia">
		
						<table border="0" cellSpacing="0" cellPadding="0" width="100%">
							<tbody>
								
								<tr>
									<td width="100%" align="left">
										<xsl:choose>
											<xsl:when test="/pe:Invoice">
												<xsl:call-template name="tmpPieComprobante_FB"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="tmpPieComprobante_NCND"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								
							</tbody>
						</table>
							
					
				
				<table border="0" width="100%" cellpadding="3" cellspacing="0" align="center">
				
							
									<td width="100%" align="left" style="border: 1px solid #a7a7a7 !important;
				border-radius: 5px 5px 5px 5px !important;
				-moz-border-radius: 5px 5px 5px 5px !important;
				-webkit-border-radius: 5px 5px 5px 5px !important;">
										<xsl:call-template name="tmpImporteLetras"/>
									</td>
								
						</table>
			<!--</tbody>
		</table>-->
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
	<xsl:template name="Observacion">
		<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="1" width="50%">
			<tbody>
			
				<tr><td>
			<font face="Arial, Helvetica, sans-serif" size="1">
			<!--xsl:if test="//cac:PaymentTerms/cbc:ID='FormaPago' and //cac:PaymentTerms/cbc:PaymentMeansID='Credito'"-->
								
			<xsl:if test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode ='01' 
			or pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode ='02'
			or pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode ='03'
			or pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode ='04'
			or pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode ='05'
			or pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode ='06'
			or pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode ='07'
			or pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode ='08'
			or pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode ='09'
			or pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode ='10'
			or pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode ='11'
			or pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode ='12'
			or pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode ='13'
			or pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='01'
			or pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='02'
			or pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='03'
			or pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='11'
			or pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='12'
			or pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='13'
			">
			<b>	Tipo de Nota : </b>
			<xsl:call-template name="MotivoNotaElectronica"/>
			</xsl:if>
			<!--/xsl:if-->
			
			</font>
			</td></tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="DocumentoReferencia">
	<font size="1" face="Arial, Helvetica, sans-serif">
	<strong>DOCUMENTO QUE MODIFICA:</strong></font>
	<table borderColor="#000000" cellSpacing="0" cellPadding="1" width="30%" 
						style="border-collapse:separate;
    		border:solid #A5A5A5 1px;
   			 border-radius:6px;
 		   -moz-border-radius:6px;">
		<tbody>
			<tr>
				<td width="40%" align="center" style="border-left:solid #A5A5A5 1px;
    		border-top:solid #A5A5A5 1px;background-color: #A5A5A5;
   		 border-top: none;">
					<font size="1" face="Arial, Helvetica, sans-serif">
						<strong>TIPO DOCUMENTO</strong>
					</font>
				</td>
				<td width="30%" align="center" style="border-left:solid #A5A5A5 1px;
    			border-top:solid #A5A5A5 1px;background-color: #A5A5A5;border-top: none;">
					<font size="1" face="Arial, Helvetica, sans-serif">
						<strong>CORRELATIVO</strong>
					</font>
				</td>
				<td width="30%" align="center" style="border-left:solid #A5A5A5 1px;
    			border-top:solid #A5A5A5 1px;background-color: #A5A5A5;border-top: none;">
					<font size="1" face="Arial, Helvetica, sans-serif">
						<strong>FECHA</strong>
					</font>
				</td>
			</tr>
			<xsl:for-each select="//cac:DespatchDocumentReference">
								<xsl:if test="cbc:DocumentTypeCode != '10' ">
									<tr>
										<td width="50%" align="center" style="border:solid 1px #A5A5A5">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:choose>
													<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
													<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA ELE.</xsl:when>
													<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
													<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
													<xsl:otherwise>Documento NN</xsl:otherwise>
												</xsl:choose>
											</font>
										</td>
										<td width="30%" align="center" style="border:solid 1px #A5A5A5">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:value-of select="cbc:ID"/>
											</font>
										</td>
										<td width="20%" align="center" style="border:solid 1px #A5A5A5">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="RetourneValAd">
													<xsl:with-param name="NumAd" select="31"/>
												</xsl:call-template>
											</font>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
			<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
				<xsl:if test="cbc:DocumentTypeCode != '10'">
				<xsl:variable name="TdocReference">
						<xsl:value-of select="substring(cbc:ID,1,1)"/>
				</xsl:variable>
					<tr>
						<td width="40%" align="center" style="border:solid 1px #A5A5A5;border-top:none;border-bottom:none;border-left: none;">
							<font size="1" face="Arial, Helvetica, sans-serif">
								<xsl:choose>
									<xsl:when test="cbc:DocumentTypeCode='01'">
										<xsl:if test="$TdocReference='F'">FACTURA ELECTRONICA</xsl:if>										
										<xsl:if test="$TdocReference='0'">FACTURA</xsl:if>
									</xsl:when>
									<xsl:when test="cbc:DocumentTypeCode='03'">
										<xsl:if test="$TdocReference='B'">BOLETA DE VENTA ELECTRONICA</xsl:if>										
										<xsl:if test="$TdocReference='0'">BOLETA DE VENTA</xsl:if>
									</xsl:when>
									<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO ELECTRÓNICA</xsl:when>
									<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO ELECTRÓNICA</xsl:when>
									<xsl:otherwise>Documento NN</xsl:otherwise>
								</xsl:choose>
							</font>
						</td>
						<td width="30%" align="center" style="border:solid 1px #A5A5A5;border-top:none;border-bottom:none;border-left: none;border-right: none;">
							<font size="1" face="Arial, Helvetica, sans-serif">
								<xsl:value-of select="cbc:ID"/>
							</font>
						</td>
						<td width="30%" align="center" style="border:solid 1px #A5A5A5;border-top:none;border-bottom:none;border-right: none;">
							<font size="1" face="Arial, Helvetica, sans-serif">
								<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="06"/></xsl:call-template>
							</font>
						</td>

						<!--<td width="30%" align="center" style="border-top: #A5A5A5 1px solid; border-right: #A5A5A5 1px solid; border-bottom: #A5A5A5 1px solid; border-left: #A5A5A5 1px solid">
							<font size="1" face="Arial, Helvetica, sans-serif">
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
						</td>-->
					</tr>
				</xsl:if>
			</xsl:for-each>
		</tbody>
	</table>
</xsl:template>



<xsl:template name="tmpDetalleRecargosFB">
	<table   borderColor="#000000" cellSpacing="0" cellPadding="1" width="50%" style="border-top: black 1px solid; border-right: black 1px solid; border-collapse: collapse; border-bottom: black 1px solid; border-left: black 1px solid;">
		
		<tr>
			<td  style="border:solid 1px black;background-color:#C0C0C0" align="center" colspan="3">
				<b>
					<font  face="Arial, Helvetica, sans-serif" size="1">TRASLADO</font>
				</b>
			</td>
		</tr>
		<tr>
			<td width="78%" style="border:solid 1px black;background-color:#C0C0C0" align="center">
				<b>
					<font  face="Arial, Helvetica, sans-serif" size="1">MOTIVO</font>
				</b>
			</td>
			<td width="22%" style="border:solid 1px black;background-color:#C0C0C0" align="center">
				<b>
					<font  face="Arial, Helvetica, sans-serif" size="1">IMPORTE</font>
				</b>
			</td>
		</tr>
		<xsl:if test="//ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional[pe:Codigo='16' and pe:Valor!='-']">
		<tr>
			<td width="78%" style="border:solid 1px" align="center">
				
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='16'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
				</font>
			</td>
			<td width="22%" style="border:solid 1px" align="right">

				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='27'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
				</font>
			</td>
		</tr>
		</xsl:if>
		<xsl:if test="//ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional[pe:Codigo='17' and pe:Valor!='-']">
		<tr>
			<td width="78%" style="border:solid 1px" align="center">
				
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='17'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
					</xsl:for-each>
				</font>
			</td>
			<td width="22%" style="border:solid 1px" align="right">

				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='22'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
				</font>
			</td>
		</tr>
		</xsl:if>
		<xsl:if test="//ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional[pe:Codigo='18' and pe:Valor!='-']">
		<tr>
			<td width="78%" style="border:solid 1px" align="center">
				
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='18'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
				</font>
			</td>
			<td width="22%" style="border:solid 1px" align="right">

				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='23'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
				</font>
			</td>
		</tr>
		</xsl:if>
				<xsl:if test="//ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional[pe:Codigo='19' and pe:Valor!='-']">
		<tr>
			<td width="78%" style="border:solid 1px" align="center">
				
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='19'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
				</font>
			</td>
			<td width="22%" style="border:solid 1px" align="right">

				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='24'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
				</font>
			</td>
		</tr>
		</xsl:if>
				<xsl:if test="//ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional[pe:Codigo='20' and pe:Valor!='-']">
		<tr>
			<td width="78%" style="border:solid 1px" align="center">
				
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='20'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
				</font>
			</td>
			<td width="22%" style="border:solid 1px" align="right">

				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='25'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
				</font>
			</td>
		</tr>
		</xsl:if>
	</table>
</xsl:template>
<xsl:template name="DatosCredito">
	<table width="100%" border="0" cellpadding="1" 
	style="font-family :Arial,Helvetica,sans-serif;font-size:13px;">
		<xsl:if test="//cac:PaymentTerms/cbc:ID='FormaPago' and //cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
	<tr>
	<td>
	<font face="Arial, Helvetica, sans-serif" size="1">
	<strong>DATOS DE CUOTA: </strong>
	</font>
	</td>                                                  
	</tr>
	
		<xsl:if test="//cbc:AllowanceChargeReasonCode='62'">
<tr>
<td>
	<font face="Arial, Helvetica, sans-serif" size="1">
	<strong>MONTO PEND. DE PAGO </strong>
	</font>
<xsl:for-each select="/pe:Invoice/cac:AllowanceCharge">
<xsl:if test="//cbc:AllowanceChargeReasonCode ='62'">
<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>:</strong><xsl:call-template name="SimboloMoneda"/>&#xA0;</font>
<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
	<xsl:value-of select="format-number(cbc:BaseAmount, '###,###,##0.00', 'pen')"/>
	</font>
</xsl:if>
</xsl:for-each>
	</td>                                                  
	</tr>	
	<tr>
	<td>
		<font face="Arial, Helvetica, sans-serif" size="1">
	<strong>MONTO DE RETENCIÓN </strong>
	</font>
	<xsl:for-each select="/pe:Invoice/cac:AllowanceCharge">
<xsl:if test="//cbc:AllowanceChargeReasonCode ='62'">
<font face="Arial, Helvetica, sans-serif" size="1">
						 <strong>:</strong>
						</font>
<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
<xsl:call-template name="SimboloMoneda"/>&#160;
	<xsl:value-of select="format-number(cbc:Amount, '###,###,##0.00', 'pen')"/>
	</font>
</xsl:if>
</xsl:for-each>
	</td>                                                  
	</tr>
	</xsl:if>
	
	<tr>
	<td>
	<table width="50%" border="1" cellSpacing="0"  cellPadding="2" 
	style="font-family :Arial,Helvetica,sans-serif;font-size:11px;color:#000000;
	border-collapse: collapse;
					  border-radius: 1em;
					  border: 1px solid #A5A5A5;
					  ">
	<tr>
	<td width="15%" align="center" size="1" 
	style="
	border: solid 1px #fff !important;
								border-radius: 5px 0px 5px 0px !important;
								-moz-border-radius: 5px 0px 5px 0px !important;
								-webkit-border-radius: 5px 0px 5px 0px !important;
								background-color:#A5A5A5; color:#fff; ">
	<strong>N° DE CUOTA</strong>
	</td>
	<td width="15%" align="center" size="1" 
	style="border: solid 1px #fff !important;
								border-radius: 0px 0px 0px 0px !important;
								background-color:#A5A5A5; color:#fff;">
	<strong>MONTO</strong>
	</td>
	<td width="15%" align="center" size="1" 
	style="border: solid 1px #fff !important;
								border-radius: 0px 5px 5px 0px !important;
								-moz-border-radius: 0px 5px 5px 0px !important;
								-webkit-border-radius: 0px 5px 5px 0px !important;
								background-color:#A5A5A5; color:#fff;">
	<strong>FECHA VENCIMIENTO</strong>
	</td>
	</tr>							
	<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
	<xsl:if test="cbc:ID !='Detraccion'">
	<xsl:if test="cbc:PaymentMeansID !='Credito'">              
	<xsl:if test="cbc:PaymentMeansID !='037'">
	<tr>
	<td width= "7%" align="center" style="border:solid 1px #A5A5A5;">
	<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
	<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
	</font>                                                                                             
	</td>

	<td width= "12%" align="center" style="border:solid 1px #A5A5A5;">
	<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
	<!--<xsl:value-of select="cbc:Amount"/>-->
	<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
	</font>
	</td>

	<td width= "10%" align="center" style="border:solid 1px #A5A5A5;">
	<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
	<xsl:value-of select="cbc:PaymentDueDate"/>
	</font>
	</td>
	</tr>
	</xsl:if>
	</xsl:if>
	</xsl:if>
	</xsl:for-each>

	<xsl:for-each select="/pe1:CreditNote/cac:PaymentTerms">
	<xsl:if test="cbc:PaymentMeansID !='Credito'">              
	<xsl:if test="cbc:PaymentMeansID !='037'">
	<tr>
	<td width= "7%" align="center">
	<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
	<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
	</font>                                                                                             
	</td>

	<td width= "12%" align="center">
	<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
	<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
	</font>
	</td>

	<td width= "10%" align="center">
	<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
	<xsl:value-of select="cbc:PaymentDueDate"/>
	</font>
	</td>
	</tr>
	</xsl:if>
	</xsl:if>
	</xsl:for-each>

	<xsl:for-each select="/pe2:DebitNote/cac:PaymentTerms">
	<xsl:if test="cbc:PaymentMeansID !='Credito'">
	<xsl:if test="cbc:PaymentMeansID !='037'">
	<tr>
	<td width= "7%" align="center">
	<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
	<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
	</font>                                                                                             
	</td>

	<td width= "12%" align="center">
	<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
	<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
	</font>
	</td>
	
	<td width= "10%" align="center">
	<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
	<xsl:value-of select="cbc:PaymentDueDate"/>
	</font>
	</td>
	</tr>
	</xsl:if>
	</xsl:if>
	</xsl:for-each>
	</table>
	</td>
	</tr>
	</xsl:if>
	</table>
	</xsl:template>
	<!--xsl:template name="tmpSimboloMoneda">
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
   <xsl:otherwise> </xsl:otherwise>
  </xsl:choose>
 </xsl:template-->
 
 		<xsl:template name="MotivoNotaElectronica">
		<xsl:choose>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='01'">ANULACION DE LA OPERACION</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='02'">ANULACION POR ERROR EN EL RUC</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='03'">CORRECCION POR ERROR EN LA DESCRIPCION</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='04'">DESCUENTO GLOBAL</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='05'">DESCUENTO POR ITEM</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='06'">DEVOLUCION TOTAL</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='07'">DEVOLUCION POR ITEM</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='08'">BONIFICACION</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='09'">DISMINUCION EN EL VALOR</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='10'">OTROS CONCEPTOS</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='11'">AJUSTES DE OPERACIONES DE EXPORTACION</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='12'">AJUSTES AFECTOS AL IVAP</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='13'">CORRECCIÓN DEL MONTO NETO PENDIENTE DE PAGO Y/O LA(S) FECHAS(S) DE VENCIMIENTO DEL PAGO ÚNICO O DE LAS CUOTAS Y/O MONTOS CORRESPONDIENTES A CADA CUOTA, DE SER EL CASO.</xsl:when>
			<xsl:when test="pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='01'">INTERESES POR MORA</xsl:when>
			<xsl:when test="pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='02'">AUMENTO EN EL VALOR</xsl:when>
			<xsl:when test="pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='03'">PENALIDADES / OTROS CONCEPTOS</xsl:when>
			<xsl:when test="pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='11'">AJUSTES DE OPERACIONES DE EXPORTACION</xsl:when>
			<xsl:when test="pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='12'">AJUSTES AFECTOS AL IVAP</xsl:when>
			<xsl:when test="pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='13'">CORRECCIÓN DEL MONTO NETO PENDIENTE DE PAGO Y/O LA(S) FECHAS(S) DE VENCIMIENTO DEL PAGO ÚNICO O DE LAS CUOTAS Y/O MONTOS CORRESPONDIENTES A CADA CUOTA, DE SER EL CASO.</xsl:when>
			<xsl:otherwise>MOTIVO DE NOTA INEXISTENTE</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="SimboloMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">USD </xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUR </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">USD </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUR </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">USD </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUR </xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Plantilla_General" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="REVISIONES\20138651917_2019082801FH3600004931.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="tmpImporteLetras"></template><template name="tmpTotal"><block path="table/thead/tr/xsl:for&#x2D;each" x="302" y="129"/><block path="table/thead/tr/xsl:for&#x2D;each/td/b/font/xsl:if/=[0]" x="226" y="97"/><block path="table/thead/tr/xsl:for&#x2D;each/td/b/font/xsl:if" x="272" y="99"/><block path="" x="302" y="129"/><block path="table/thead/tr/xsl:for&#x2D;each/td/b/font/xsl:if[1]/=[0]" x="226" y="97"/><block path="table/thead/tr/xsl:for&#x2D;each/td/b/font/xsl:if[1]" x="272" y="99"/><block path="table/thead/tr/xsl:for&#x2D;each[1]" x="302" y="129"/><block path="table/thead/tr/xsl:for&#x2D;each[1]/td/b/font/xsl:if/=[0]" x="226" y="97"/><block path="table/thead/tr/xsl:for&#x2D;each[1]/td/b/font/xsl:if" x="272" y="99"/><block path="table/thead/tr/xsl:for&#x2D;each[1]/td/b/font/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/thead/tr/xsl:for&#x2D;each[1]/td/b/font/xsl:if[1]/=[0]" x="226" y="97"/><block path="table/thead/tr/xsl:for&#x2D;each[1]/td/b/font/xsl:if[1]" x="272" y="99"/><block path="table/thead/tr/xsl:for&#x2D;each[2]" x="302" y="129"/><block path="table/thead/tr/xsl:for&#x2D;each[2]/td/b/font/xsl:if/=[0]" x="226" y="97"/><block path="table/thead/tr/xsl:for&#x2D;each[2]/td/b/font/xsl:if" x="272" y="99"/><block path="table/thead/tr/xsl:for&#x2D;each[2]/td/b/font/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/thead/tr/xsl:for&#x2D;each[2]/td/b/font/xsl:if[1]/=[0]" x="226" y="97"/><block path="table/thead/tr/xsl:for&#x2D;each[2]/td/b/font/xsl:if[1]" x="272" y="99"/><block path="table/tr/td/font/xsl:choose" x="152" y="99"/><block path="table/tr/td/font/xsl:choose/xsl:when/xsl:call&#x2D;template" x="222" y="129"/><block path="table/tr/td/font/xsl:choose/xsl:when/xsl:value&#x2D;of" x="102" y="129"/><block path="table/tr/td/font/xsl:choose/xsl:otherwise/xsl:call&#x2D;template" x="62" y="129"/><block path="table/tr/td[1]/font/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[1]/font/xsl:if" x="242" y="69"/><block path="table/tr/td[1]/font/xsl:if/xsl:choose" x="352" y="59"/><block path="table/tr/td[1]/font/xsl:if/xsl:choose/xsl:when/xsl:call&#x2D;template" x="302" y="89"/><block path="table/tr/td[1]/font/xsl:if/xsl:choose/xsl:when/xsl:value&#x2D;of" x="102" y="89"/><block path="table/tr/td[1]/font/xsl:if/xsl:choose/xsl:otherwise/xsl:call&#x2D;template" x="62" y="89"/><block path="table/tr/td[1]/font/xsl:if[1]/=[0]" x="146" y="57"/><block path="table/tr/td[1]/font/xsl:if[1]" x="192" y="59"/><block path="table/tr/td[1]/font/xsl:if[1]/xsl:call&#x2D;template" x="302" y="49"/><block path="table/tr/td[1]/font/xsl:if[1]/xsl:value&#x2D;of" x="142" y="49"/><block path="table/tr/td[1]/font/xsl:if[1]/xsl:if/=[0]" x="306" y="17"/><block path="table/tr/td[1]/font/xsl:if[1]/xsl:if" x="352" y="19"/><block path="table/tr/td[2]/font/xsl:if/=[0]" x="0" y="37"/><block path="table/tr/td[2]/font/xsl:if" x="12" y="39"/><block path="table/tr/td[2]/font/xsl:if/xsl:for&#x2D;each" x="162" y="149"/><block path="table/tr/td[2]/font/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="186" y="17"/><block path="table/tr/td[2]/font/xsl:if/xsl:for&#x2D;each/xsl:if" x="232" y="19"/><block path="table/tr/td[2]/font/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:call&#x2D;template" x="62" y="49"/><block path="table/tr/td[2]/font/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="302" y="169"/><block path="table/tr/td[2]/font/xsl:if[1]/=[0]" x="256" y="7"/><block path="table/tr/td[2]/font/xsl:if[1]" x="302" y="9"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each" x="172" y="199"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/=[0]" x="196" y="187"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if" x="242" y="189"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="146" y="17"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/xsl:if" x="192" y="19"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:call&#x2D;template" x="342" y="169"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:value&#x2D;of" x="102" y="169"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[1]" x="12" y="199"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if" x="242" y="69"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/xsl:if/!=[0]" x="266" y="217"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/xsl:if" x="312" y="219"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/xsl:if/xsl:call&#x2D;template" x="62" y="169"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/xsl:if/xsl:value&#x2D;of" x="102" y="209"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[2]" x="212" y="39"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if" x="242" y="69"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/xsl:if/!=[0]" x="306" y="217"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/xsl:if" x="352" y="219"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/xsl:if/xsl:call&#x2D;template" x="62" y="209"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:if/=[0]" x="226" y="97"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:if" x="272" y="99"/><block path="table/tr/td[2]/font/xsl:if[1]/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[3]/font/xsl:if/=[0]" x="166" y="37"/><block path="table/tr/td[3]/font/xsl:if" x="212" y="39"/><block path="table/tr/td[3]/font/xsl:if/xsl:for&#x2D;each" x="242" y="69"/><block path="table/tr/td[3]/font/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="226" y="97"/><block path="table/tr/td[3]/font/xsl:if/xsl:for&#x2D;each/xsl:if" x="272" y="99"/><block path="table/tr/td[3]/font/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[3]/font/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[3]/font/xsl:if[1]/=[0]" x="96" y="7"/><block path="table/tr/td[3]/font/xsl:if[1]" x="142" y="9"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each" x="212" y="39"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if" x="242" y="69"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[1]" x="212" y="39"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if" x="242" y="69"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[2]" x="212" y="39"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if" x="242" y="69"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:if/=[0]" x="226" y="97"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:if" x="272" y="99"/><block path="table/tr/td[3]/font/xsl:if[1]/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each" x="212" y="39"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each/xsl:if" x="242" y="69"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[1]" x="212" y="39"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[1]/xsl:if" x="242" y="69"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[1]/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[1]/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[1]/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[1]/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[2]" x="212" y="39"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[2]/xsl:if" x="242" y="69"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[2]/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[2]/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[2]/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[4]/font/xsl:for&#x2D;each[2]/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[4]/font/xsl:if/=[0]" x="226" y="97"/><block path="table/tr/td[4]/font/xsl:if" x="272" y="99"/><block path="table/tr/td[4]/font/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[5]/font/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[5]/font/xsl:if" x="242" y="69"/><block path="table/tr/td[5]/font/xsl:if/xsl:choose" x="272" y="99"/><block path="table/tr/td[5]/font/xsl:if/xsl:choose/=[0]" x="226" y="93"/><block path="table/tr/td[5]/font/xsl:if/xsl:choose/=[0]/string[0]" x="180" y="87"/><block path="table/tr/td[5]/font/xsl:if/xsl:choose/=[0]/string[0]/number[0]" x="134" y="85"/><block path="table/tr/td[5]/font/xsl:if/xsl:choose/xsl:when/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[5]/font/xsl:if/xsl:choose/xsl:otherwise/xsl:for&#x2D;each" x="242" y="69"/><block path="table/tr/td[5]/font/xsl:if/xsl:choose/xsl:otherwise/xsl:for&#x2D;each/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[5]/font/xsl:if/xsl:choose/xsl:otherwise/xsl:for&#x2D;each/xsl:if" x="272" y="99"/><block path="table/tr/td[5]/font/xsl:if/xsl:choose/xsl:otherwise/xsl:for&#x2D;each/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[5]/font/xsl:if/xsl:choose/xsl:otherwise/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[5]/font/xsl:if[1]/=[0]" x="196" y="67"/><block path="table/tr/td[5]/font/xsl:if[1]" x="242" y="69"/><block path="table/tr/td[5]/font/xsl:if[1]/xsl:choose" x="272" y="99"/><block path="table/tr/td[5]/font/xsl:if[1]/xsl:choose/or[0]" x="226" y="93"/><block path="table/tr/td[5]/font/xsl:if[1]/xsl:choose/or[0]/=[0]" x="180" y="87"/><block path="table/tr/td[5]/font/xsl:if[1]/xsl:choose/or[0]/=[1]" x="180" y="115"/><block path="table/tr/td[5]/font/xsl:if[1]/xsl:choose/xsl:when/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[5]/font/xsl:if[1]/xsl:choose/!=[1]" x="226" y="121"/><block path="table/tr/td[5]/font/xsl:if[1]/xsl:choose/xsl:when[1]/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[5]/font/xsl:if[1]/xsl:choose/xsl:when[1]/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[5]/font/xsl:if[1]/xsl:choose/xsl:otherwise/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[6]/font/xsl:if/=[0]" x="226" y="97"/><block path="table/tr/td[6]/font/xsl:if" x="272" y="99"/><block path="table/tr/td[6]/font/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[6]/font/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[6]/font/xsl:if[1]/=[0]" x="226" y="97"/><block path="table/tr/td[6]/font/xsl:if[1]" x="272" y="99"/><block path="table/tr/td[6]/font/xsl:if[1]/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[6]/font/xsl:if[1]/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[6]/font/xsl:if[1]/xsl:if/=[0]" x="226" y="97"/><block path="table/tr/td[6]/font/xsl:if[1]/xsl:if" x="272" y="99"/><block path="table/tr/td[7]/font/xsl:if/=[0]" x="166" y="37"/><block path="table/tr/td[7]/font/xsl:if" x="212" y="39"/><block path="table/tr/td[7]/font/xsl:if/xsl:for&#x2D;each" x="242" y="69"/><block path="table/tr/td[7]/font/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="226" y="97"/><block path="table/tr/td[7]/font/xsl:if/xsl:for&#x2D;each/xsl:if" x="272" y="99"/><block path="table/tr/td[7]/font/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if[1]/=[0]" x="56" y="7"/><block path="table/tr/td[7]/font/xsl:if[1]" x="102" y="9"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each" x="212" y="39"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if" x="242" y="69"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[1]" x="212" y="39"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if" x="242" y="69"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[1]/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[2]" x="212" y="39"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if" x="242" y="69"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[2]/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[3]" x="212" y="39"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[3]/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[3]/xsl:if" x="242" y="69"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[3]/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[3]/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[3]/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[3]/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[4]" x="212" y="39"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[4]/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[4]/xsl:if" x="242" y="69"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[4]/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[4]/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[4]/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[4]/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[5]" x="212" y="39"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[5]/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[5]/xsl:if" x="242" y="69"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[5]/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[5]/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[5]/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:for&#x2D;each[5]/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:if/=[0]" x="226" y="97"/><block path="table/tr/td[7]/font/xsl:if[1]/xsl:if" x="272" y="99"/><block path="table/tr/xsl:for&#x2D;each" x="302" y="129"/><block path="table/tr/xsl:for&#x2D;each/td/font/xsl:if/!=[0]" x="196" y="67"/><block path="table/tr/xsl:for&#x2D;each/td/font/xsl:if" x="242" y="69"/><block path="table/tr/xsl:for&#x2D;each/td/font/xsl:if/xsl:if/=[0]" x="226" y="97"/><block path="table/tr/xsl:for&#x2D;each/td/font/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/xsl:for&#x2D;each/td/font/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/xsl:for&#x2D;each/td/font/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/xsl:for&#x2D;each/td/font/xsl:if/xsl:if[1]/=[0]" x="196" y="67"/><block path="table/tr/xsl:for&#x2D;each/td/font/xsl:if/xsl:if[1]" x="242" y="69"/><block path="table/tr/xsl:for&#x2D;each/td/font/xsl:if/xsl:if[1]/xsl:if/>[0]" x="226" y="97"/><block path="table/tr/xsl:for&#x2D;each/td/font/xsl:if/xsl:if[1]/xsl:if" x="272" y="99"/><block path="table/tr/xsl:for&#x2D;each/td/font/xsl:if/xsl:if[1]/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/xsl:for&#x2D;each/td/font/xsl:if/xsl:if[1]/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/xsl:for&#x2D;each[1]" x="342" y="129"/><block path="table/tr/xsl:for&#x2D;each[1]/td/font/xsl:if/!=[0]" x="196" y="67"/><block path="table/tr/xsl:for&#x2D;each[1]/td/font/xsl:if" x="242" y="69"/><block path="table/tr/xsl:for&#x2D;each[1]/td/font/xsl:if/xsl:if/=[0]" x="226" y="97"/><block path="table/tr/xsl:for&#x2D;each[1]/td/font/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/xsl:for&#x2D;each[1]/td/font/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/xsl:for&#x2D;each[1]/td/font/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/xsl:for&#x2D;each[1]/td/font/xsl:if/xsl:if[1]/=[0]" x="226" y="97"/><block path="table/tr/xsl:for&#x2D;each[1]/td/font/xsl:if/xsl:if[1]" x="272" y="99"/><block path="table/tr/xsl:for&#x2D;each[1]/td/font/xsl:if/xsl:if[1]/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/xsl:for&#x2D;each[1]/td/font/xsl:if/xsl:if[1]/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/xsl:for&#x2D;each[2]" x="262" y="129"/><block path="table/tr/xsl:for&#x2D;each[2]/td/font/xsl:if/!=[0]" x="196" y="67"/><block path="table/tr/xsl:for&#x2D;each[2]/td/font/xsl:if" x="242" y="69"/><block path="table/tr/xsl:for&#x2D;each[2]/td/font/xsl:if/xsl:if/=[0]" x="226" y="97"/><block path="table/tr/xsl:for&#x2D;each[2]/td/font/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/xsl:for&#x2D;each[2]/td/font/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/xsl:for&#x2D;each[2]/td/font/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/xsl:for&#x2D;each[2]/td/font/xsl:if/xsl:if[1]/=[0]" x="226" y="97"/><block path="table/tr/xsl:for&#x2D;each[2]/td/font/xsl:if/xsl:if[1]" x="272" y="99"/><block path="table/tr/xsl:for&#x2D;each[2]/td/font/xsl:if/xsl:if[1]/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/xsl:for&#x2D;each[2]/td/font/xsl:if/xsl:if[1]/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each" x="212" y="39"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each/xsl:if" x="242" y="69"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[1]" x="212" y="39"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[1]/xsl:if" x="242" y="69"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[1]/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[1]/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[1]/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[1]/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[2]" x="212" y="39"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="196" y="67"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[2]/xsl:if" x="242" y="69"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[2]/xsl:if/xsl:if/!=[0]" x="226" y="97"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[2]/xsl:if/xsl:if" x="272" y="99"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[2]/xsl:if/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[8]/font/xsl:for&#x2D;each[2]/xsl:if/xsl:if/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[8]/font/xsl:if/=[0]" x="226" y="97"/><block path="table/tr/td[8]/font/xsl:if" x="272" y="99"/><block path="table/tr/td[8]/font/xsl:if/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[9]/xsl:if/!=[0]" x="256" y="127"/><block path="table/tr/td[9]/xsl:if" x="302" y="129"/><block path="table/tr/td[9]/xsl:if/font/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[9]/xsl:if/font/xsl:value&#x2D;of" x="302" y="129"/><block path="table/tr/td[9]/xsl:if[1]/!=[0]" x="256" y="127"/><block path="table/tr/td[9]/xsl:if[1]" x="302" y="129"/><block path="table/tr/td[9]/xsl:if[1]/font/xsl:call&#x2D;template" x="302" y="129"/><block path="table/tr/td[9]/xsl:if[1]/font/xsl:value&#x2D;of" x="302" y="129"/><block path="table[1]/tr/td/center/font/b/xsl:for&#x2D;each" x="272" y="99"/><block path="table[1]/tr/td/center/font/b/xsl:for&#x2D;each/xsl:if/and[0]" x="256" y="127"/><block path="table[1]/tr/td/center/font/b/xsl:for&#x2D;each/xsl:if/and[0]/=[0]" x="210" y="121"/><block path="table[1]/tr/td/center/font/b/xsl:for&#x2D;each/xsl:if/and[0]/!=[1]" x="210" y="149"/><block path="table[1]/tr/td/center/font/b/xsl:for&#x2D;each/xsl:if" x="302" y="129"/><block path="table[1]/tr/td/xsl:if/!=[0]" x="256" y="127"/><block path="table[1]/tr/td/xsl:if" x="302" y="129"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->