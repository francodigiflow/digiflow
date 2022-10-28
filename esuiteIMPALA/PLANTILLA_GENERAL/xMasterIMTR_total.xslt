<?xml version="1.0" encoding="iso-8859-1"?>
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

<!--##TRAFIGURA##-->
	<xsl:template name="Totales_T">
		<tr>
			<td>
				<xsl:call-template name="Total_T"/>
			</td>
		</tr>

		<tr>
			<td valign="top" width="100%" align="left">
				<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
					<tbody>
						<tr>
							<td valign="top" width="60%" align="left">
								<xsl:call-template name="MontoLiteral_T"/>
							</td>
							<td valign="bottom" width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--TRANSFERENCIA GRATUITA-->
								<xsl:if test="//cbc:UBLVersionID='2.0'">	
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID='1004'">
											<xsl:if test="cbc:PayableAmount != '0'">
												<strong>TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE</strong>
												<br/><br/>
											</xsl:if>
											</xsl:if>
									</xsl:for-each>
								</xsl:if>

									<xsl:if test="//cbc:UBLVersionID='2.1'">	
											<xsl:value-of select="//cbc:Note[@languageLocaleID='1002']" />
									</xsl:if>

									<!--TRANSFERENCIA GRATUITA-->
									
								</font>
							</td>
						</tr>
						<tr>
							<td valign="top" width="100%" align="left" colspan="2">

										<xsl:variable name="REF1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="9"/>
											</xsl:call-template>
										</xsl:variable>

										<xsl:variable name="REF2">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="15"/>
											</xsl:call-template>
										</xsl:variable>

<xsl:if test="($REF1!='' and $REF1!='-') or ($REF2!='' and $REF2!='-')">
<table border="0" width="100%">
			 <!--REFERENCIAS ADMISION TEMPORAL-->
			 <tr>
			 	<td align="left" width="10%" valign="top"><font face="Arial, Helvetica, sans-serif" size="0.5" style="color:#666666"><strong>(Referencia)</strong></font></td>
				<td align="left" width="90%" valign="top"><font face="Arial, Helvetica, sans-serif" size="0.5">
							
						
											<xsl:if test="($REF2!='' and $REF2!='-')">
											<strong>EXP. ADM TEMP</strong>&#160;<br /><xsl:call-template name="REF_ADMTEMP"/>
											<br />
											</xsl:if>

											<xsl:if test="($REF1!='' and $REF1!='-')">
											<strong>GUIAS DE REMISIÓN</strong>&#160;<br /><xsl:call-template name="REF_GUIASREMISION"/>
											</xsl:if>

						
				</font></td>
			</tr>
</table>
</xsl:if>
										
							</td>
						</tr>
						<!--<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<tr heigth="100%">
								<td valign="top" width="50%" align="left">asdasd</td>
							</tr>
						</xsl:if>-->

						<!--xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<tr heigth="100%">
								<td valign="top" width="70%" align="left">
									<xsl:call-template name="Observacion"/>
								</td>
							<td valign="top" width="30%">
								<xsl:call-template name="Total"/>
							</td>
						</tr>
						</xsl:if-->
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="Total_T">
		<table border="0" width="99.9%" cellpadding="2" cellspacing="0">
			<tr>
				<td>
					<table border="0" width="100%" cellspacing="0" rules="none">
						<tbody>
						<tr bgcolor="#999999">
							<td height="20" width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. GRAVADA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. INAFECTA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. EXONERADA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. GRATUITA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>I.G.V. (18%)</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>IMPORTE TOTAL</b>
								</font>
							</td>
						</tr>
						<tr>
							<!--OP. GRAVADA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1001'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
									</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									<!--</xsl:if>-->
								</xsl:if>
							</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						
						<xsl:variable name="Gravado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>
 										<xsl:if test="$Gravado = ''">
										  0.00&#xA0;
										</xsl:if>
						</xsl:if>
								</font>
							</td>
							<!--OP. INAFECTA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1002'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
									</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">					
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									<!--</xsl:if>-->
								</xsl:if>
							</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>


						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						

						
						<xsl:variable name="Inafecto">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
						<!--	  <xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
						<!--	  <xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>

							<!--<xsl:value-of select="$Inafecto"/>-->&#xA0;
							<!--<xsl:value-of select="$Inafecto"/>
 										
										<xsl:if test="$Inafecto = '' ">
										 0.00&#xA0;
										</xsl:if>-->


										<xsl:if test="$Inafecto = '' ">
										0.00&#xA0;
										</xsl:if>
                    </xsl:if>	
								</font>
							</td>
							<!--OP. EXONERADA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:if test="//cbc:UBLVersionID='2.0'">					
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1003'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.1'">					
						<!--<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if></xsl:if>
						</xsl:for-each>-->
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
					<!--<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>-->
						<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>-->
						<xsl:variable name="Exonerado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							 <!-- <xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>
								<!--<xsl:value-of select="$Exonerado"/>-->
 										<xsl:if test="$Exonerado = ''">
										  0.00&#xA0;
										</xsl:if>
                                </xsl:if>
								</font>
							</td>
							<!--OP. GRATUITA-->
							<td  width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1004'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>-->
							<xsl:if test="//cbc:UBLVersionID='2.0'">	
									<xsl:choose>
									<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">

										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID=1004"><!--1004-->
												<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
											</xsl:if>
										</xsl:for-each>

									</xsl:when>

									<xsl:otherwise>0.00&#160;</xsl:otherwise>
									</xsl:choose>
								</xsl:if>

							<xsl:if test="//cbc:UBLVersionID='2.1'">	
						<xsl:for-each select="//pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:if>
									</xsl:if>
									</xsl:for-each>
							<xsl:for-each select="//pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:if>
									</xsl:if>
									</xsl:for-each>

								<xsl:for-each select="//pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:if>
									</xsl:if>
									</xsl:for-each>

			</xsl:if>

			

									<!--<xsl:choose>
									<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">
										<xsl:value-of select="format-number(sac:AdditionalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
									</xsl:when>

									<xsl:otherwise>0.00&#160;</xsl:otherwise>
									</xsl:choose>-->
								</font>
							</td>
							<!--TOTAL DESCUENTOS-->
							<!--<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='2005'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>ggddd&#160;
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>-->
							<!-- IGV -->
							<td width= "14%" align="right">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:for-each select="/pe:Invoice">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
									</font>
								</xsl:for-each>

								<xsl:for-each select="/pe1:CreditNote">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
									</font>
								</xsl:for-each>

								<xsl:for-each select="/pe2:DebitNote">
								<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">-->
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
											<!--<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>-->
									</font>
								</xsl:for-each>
								</xsl:if>

								<xsl:if test="//cbc:UBLVersionID='2.1'">
						<!--<xsl:for-each select="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
								<xsl:if test="cbc:ID='1000'">
									<xsl:value-of select="format-number(cbc:TaxableAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>-->
						<xsl:variable name="IGV">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
								<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</xsl:variable>


                       <!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
					   
<font face="Arial, Helvetica, sans-serif" size="1">

					   <xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
					   </font>
						</xsl:if>
							</td>
							<!--IMPORTE TOTAL-->
							<td  width= "14%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:choose>		

								<xsl:when test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
										<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
								</xsl:when>

								<xsl:when test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''"><!--PARA NOTAS DE DEBITO-->
										<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
								</xsl:when>

								<xsl:otherwise>0.00</xsl:otherwise>

							</xsl:choose>
							</font>
							</td>
						</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="MontoLiteral_T">
		<table border="0">
			<tr>
				<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>SON:</strong>&#160;
						<!-- MONTO LITERAL -->
						<xsl:call-template name="TraeValorVariable">
							<xsl:with-param name="varNumVA" select="04"/>
						</xsl:call-template>
						<br/>
					</font>
				</td>
			</tr>
			<!--<tr>
				<td align="center" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
					      S.E.U.O
					</font>
				</td>
			</tr>-->
		</table>
	</xsl:template>

	
<!--####--><!--REFERENCIA-->
<xsl:template name="REF_ADMTEMP">
<table border="0" width="100%">
			 <!--REFERENCIAS ADMISION TEMPORAL-->
			 <tr>
				<td align="left" width="100%" valign="top"><!--style="padding-left:90px"-->
					<font face="Arial, Helvetica, sans-serif" size="0.5">

						<!--FACTURA/BOLETA-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='15'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='16'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='17'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>
						</xsl:for-each>
						

						<!--NOTA DE CREDITO-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='15'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='16'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='17'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>
						</xsl:for-each>
						
						
						
						<!--NOTA DE DEBITO-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='15'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='16'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='17'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>
						</xsl:for-each>

				   </font>
				</td>
			</tr>

</table></xsl:template>

<xsl:template name="REF_GUIASREMISION">
<table border="0" width="100%">
			<!--REFERENCIAS GUIAS DE REMISION-->
			<tr>
				<td align="left" width="100%"><!--style="padding-left:90px"-->
					<font face="Arial, Helvetica, sans-serif" size="0.5">

						<!--FACTURA/BOLETA-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='9'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='10'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='11'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='12'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='13'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='14'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

						</xsl:for-each>
						

						<!--NOTA DE CREDITO-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='9'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='10'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='11'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='12'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='13'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='14'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>
						</xsl:for-each>
						
						
						
						<!--NOTA DE DEBITO-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='9'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='10'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='11'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='12'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='13'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='14'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>
						</xsl:for-each>

				   </font>
				</td>
			</tr>
</table>
</xsl:template>
<!--####-->
<!--##TRAFIGURA##-->

<!--##IMPALA##-->
<xsl:template name="Totales_I">
		<tr>
			<td>
				<xsl:call-template name="Total_I"/>
			</td>
		</tr>

		<tr>
			<td valign="top" width="100%" align="left">
				<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
					<tbody>
						<tr heigth="100%">
							<td valign="top" width="60%" align="left" colspan="2">
								<xsl:call-template name="MontoLiteral_I"/>
							</td>
							<td valign="bottom" width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--TRANSFERENCIA GRATUITA-->
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID='1004'">
											<xsl:if test="cbc:PayableAmount != '0'">
												<strong>TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE</strong>
												<br/><br/>
											</xsl:if>
											</xsl:if>
									</xsl:for-each>
									<!--TRANSFERENCIA GRATUITA-->
									Nro. Voucher: 
									<xsl:call-template name="TraeValorVariable">
										<xsl:with-param name="varNumVA" select="5"/>
									</xsl:call-template>
								</font>
							</td>
						</tr>
						<!--<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<tr heigth="100%">
								<td valign="top" width="50%" align="left">asdasd</td>
							</tr>
						</xsl:if>-->

						<!--xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<tr heigth="100%">
								<td valign="top" width="70%" align="left">
									<xsl:call-template name="Observacion"/>
								</td>
							<td valign="top" width="30%">
								<xsl:call-template name="Total"/>
							</td>
						</tr>
						</xsl:if-->
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="Total_I">
		<table border="0" width="100%" cellpadding="1" cellspacing="0">
			<tr>
				<td>
					<table border="1" width="100%" bordercolor="#000000" cellspacing="0" rules="all">
						<tbody>
						<tr>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. GRAVADA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. INAFECTA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. EXONERADA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. GRATUITA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>I.G.V. (18%)</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>IMPORTE TOTAL</b>
								</font>
							</td>
						</tr>
						<tr>
							<!--OP. GRAVADA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1001'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
									</xsl:if>

											<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									<!--</xsl:if>-->
								</xsl:if>
							</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						
						<xsl:variable name="Gravado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>
 										<xsl:if test="$Gravado = ''">
										  0.00&#xA0;
										</xsl:if>
						</xsl:if>
								</font>
							</td>
							<!--OP. INAFECTA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1002'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
									</xsl:if>

							<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									<!--</xsl:if>-->
								</xsl:if>
							</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									<!--</xsl:if>-->
								</xsl:if>
							</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:variable name="Inafecto">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
						<!--	  <xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
						<!--	  <xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>

 										<xsl:if test="$Inafecto = ''">
										  0.00&#xA0;
										</xsl:if>
						</xsl:if>
								</font>
							</td>
							<!--OP. EXONERADA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1003'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
									</xsl:if>

							<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									<!--</xsl:if>-->
								</xsl:if>
							</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						
						<xsl:variable name="exonerado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>
 										<xsl:if test="$exonerado = ''">
										  0.00&#xA0;
										</xsl:if>
						</xsl:if>
								</font>
							</td>
							<!--OP. GRATUITA-->
							<td  width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1004'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>-->
								<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:choose>
									<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">

										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID=1004"><!--1004-->
												<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
											</xsl:if>
										</xsl:for-each>

									</xsl:when>

									<xsl:otherwise>0.00&#160;</xsl:otherwise>
									</xsl:choose>
</xsl:if>
<xsl:if test="//cbc:UBLVersionID='2.1'">	
						<xsl:for-each select="//pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:if>
									</xsl:if>
									</xsl:for-each>
							<xsl:for-each select="//pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:if>
									</xsl:if>
									</xsl:for-each>

								<xsl:for-each select="//pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:if>
									</xsl:if>
									</xsl:for-each>

			</xsl:if>

			
									<!--<xsl:choose>
									<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">
										<xsl:value-of select="format-number(sac:AdditionalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
									</xsl:when>

									<xsl:otherwise>0.00&#160;</xsl:otherwise>
									</xsl:choose>-->
								</font>
							</td>
							<!--TOTAL DESCUENTOS-->
							<!--<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='2005'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>ggddd&#160;
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>-->
							<!-- IGV -->
							<td width= "14%" align="right">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:for-each select="/pe:Invoice">
									<font face="Arial, Helvetica, sans-serif" size="1">
									
										
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
											
									</font>
								</xsl:for-each>

								<xsl:for-each select="/pe1:CreditNote">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
									</font>
								</xsl:for-each>

								<xsl:for-each select="/pe2:DebitNote">
								<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">-->
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
											<!--<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>-->
									</font>
								</xsl:for-each>
								</xsl:if>

<xsl:if test="//cbc:UBLVersionID='2.1'">
						<!--<xsl:for-each select="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
								<xsl:if test="cbc:ID='1000'">
									<xsl:value-of select="format-number(cbc:TaxableAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>-->
						<xsl:variable name="IGV">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
								<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
									
									<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</font>
									</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
									<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</font>
									</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
									<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</font>
									</xsl:if>
							</xsl:for-each>
						</xsl:variable>


                       <!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
					   <font face="Arial, Helvetica, sans-serif" size="1">
					   <xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
					   </font>
						</xsl:if>
								
							</td>
							<!--IMPORTE TOTAL-->
							<td  width= "14%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:choose>		

								<xsl:when test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
										<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
								</xsl:when>

								<xsl:when test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''"><!--PARA NOTAS DE DEBITO-->
										<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
								</xsl:when>

								<xsl:otherwise>0.00</xsl:otherwise>

							</xsl:choose>
							</font>
							</td>
						</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="MontoLiteral_I">
		<table border="0">
			<tr>
				<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>SON:</strong>&#160;
						<!-- MONTO LITERAL -->
						<xsl:call-template name="TraeValorVariable">
							<xsl:with-param name="varNumVA" select="01"/>
						</xsl:call-template>
						<br/>
					</font>
				</td>
			</tr>
			<tr>
				<td align="center" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
					      S.E.U.O
					</font>
				</td>
			</tr>
			<!--REFERENCIA-->
			<tr>
				<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<!--<b>REFERENCIA:<br/>--><br/>

						<!--FACTURA/BOLETA-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='4'">	
									<xsl:if test="pe:Valor!='-'">
									  <br/><br/>
									  <strong>REF.:</strong><xsl:value-of select="pe:Valor"/>&#160;
									  <br/><br/>
								</xsl:if>
						 </xsl:if>
						</xsl:for-each>
						

						<!--NOTA DE CREDITO-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='4'">	
									<xsl:if test="pe1:Valor!='-'">
									  <br/><br/>
									  <strong>REF.:</strong>&#160;<xsl:value-of select="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>&#160;<xsl:value-of select="pe1:Valor"/>&#160;
									  <br/><br/>
								</xsl:if>
						 </xsl:if>
						</xsl:for-each>
						
						
						
						<!--NOTA DE DEBITO-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='4'">	
									<xsl:if test="pe2:Valor!='-'">
									  <br/><br/>
									  <strong>REF.:</strong>&#160;<xsl:value-of select="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>&#160;<xsl:value-of select="pe2:Valor"/>&#160;
									  <br/><br/>
								</xsl:if>
						 </xsl:if>
						</xsl:for-each>

				   </font>
				</td>
			</tr>
		</table>
	</xsl:template>
<!--##IMPALA##-->

<!--##URION##-->
	<xsl:template name="Totales_U">
		<tr>
			<td>
				<xsl:call-template name="Total_U"/>
			</td>
		</tr>

		<tr>
			<td valign="top" width="100%" align="left">
				<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
					<tbody>
						<tr>
							<td valign="top" width="60%" align="left">
								<xsl:call-template name="MontoLiteral_T"/>
							</td>
							<td valign="bottom" width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--TRANSFERENCIA GRATUITA-->
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID='1004'">
											<xsl:if test="cbc:PayableAmount != '0'">
												<strong>TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE</strong>
												<br/><br/>
											</xsl:if>
											</xsl:if>
									</xsl:for-each>
									<!--TRANSFERENCIA GRATUITA-->

									<!--DETRACCIONES-->
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID='2003'">
											<xsl:if test="cbc:PayableAmount != '0'">
												<strong>OPERACIÓN SUJETA AL SPOT <xsl:value-of select="cbc:Percent"/></strong>
												<br/>
											</xsl:if>
											</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
											<xsl:if test="cbc:ID='3001'">
											
												<strong>Nro. Cuenta Banco de la Nación: <xsl:value-of select="cbc:Value"/></strong>
												<br/>
											
											</xsl:if>
									</xsl:for-each>-->
									<!--DETRACCIONES-->
									
								</font>
							</td>
						</tr>
						<tr>
							<td valign="top" width="100%" align="left" colspan="2">

										<xsl:variable name="REF1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="9"/>
											</xsl:call-template>
										</xsl:variable>

										<xsl:variable name="REF2">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="15"/>
											</xsl:call-template>
										</xsl:variable>

<xsl:if test="($REF1!='' and $REF1!='-') or ($REF2!='' and $REF2!='-')">
<table border="0" width="100%">
			 <!--REFERENCIAS ADMISION TEMPORAL-->
			 <tr>
			 	<td align="left" width="10%" valign="top"><font face="Arial, Helvetica, sans-serif" size="0.5" style="color:#666666"><strong>(Referencia)</strong></font></td>
				<td align="left" width="90%" valign="top"><font face="Arial, Helvetica, sans-serif" size="0.5">
							
						
											<xsl:if test="($REF2!='' and $REF2!='-')">
											<strong>EXP. ADM TEMP</strong>&#160;<br /><xsl:call-template name="REF_ADMTEMP"/>
											<br />
											</xsl:if>

											<xsl:if test="($REF1!='' and $REF1!='-')">
											<strong>GUIAS DE REMISIÓN</strong>&#160;<br /><xsl:call-template name="REF_GUIASREMISION"/>
											</xsl:if>

						
				</font></td>
			</tr>
</table>
</xsl:if>
										
							</td>
						</tr>
						<!--<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<tr heigth="100%">
								<td valign="top" width="50%" align="left">asdasd</td>
							</tr>
						</xsl:if>-->

						<!--xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<tr heigth="100%">
								<td valign="top" width="70%" align="left">
									<xsl:call-template name="Observacion"/>
								</td>
							<td valign="top" width="30%">
								<xsl:call-template name="Total"/>
							</td>
						</tr>
						</xsl:if-->
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="Total_U">
		<table border="0" width="99.9%" cellpadding="2" cellspacing="0">
			<tr>
				<td>
					<table border="0" width="100%" cellspacing="0" rules="none">
						<tbody>
						<tr bgcolor="#88AAD8">
							<td height="20" width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. GRAVADA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. INAFECTA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. EXONERADA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. GRATUITA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>I.G.V. (18%)</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>IMPORTE TOTAL</b>
								</font>
							</td>
						</tr>
						<tr>
							<!--OP. GRAVADA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1001'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>
							<!--OP. INAFECTA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1002'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>
							<!--OP. EXONERADA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1003'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>
							<!--OP. GRATUITA-->
							<td  width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1004'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>-->

									<xsl:choose>
									<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">

										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID=1004"><!--1004-->
												<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
											</xsl:if>
										</xsl:for-each>

									</xsl:when>

									<xsl:otherwise>0.00&#160;</xsl:otherwise>
									</xsl:choose>

									<!--<xsl:choose>
									<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">
										<xsl:value-of select="format-number(sac:AdditionalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
									</xsl:when>

									<xsl:otherwise>0.00&#160;</xsl:otherwise>
									</xsl:choose>-->
								</font>
							</td>
							<!--TOTAL DESCUENTOS-->
							<!--<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='2005'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>ggddd&#160;
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>-->
							<!-- IGV -->
							<td width= "14%" align="right">
								<xsl:for-each select="/pe:Invoice">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
									</font>
								</xsl:for-each>

								<xsl:for-each select="/pe1:CreditNote">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
									</font>
								</xsl:for-each>

								<xsl:for-each select="/pe2:DebitNote">
								<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">-->
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
											<!--<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>-->
									</font>
								</xsl:for-each>
							</td>
							<!--IMPORTE TOTAL-->
							<td  width= "14%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:choose>		

								<xsl:when test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
										<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
								</xsl:when>

								<xsl:when test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''"><!--PARA NOTAS DE DEBITO-->
										<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
								</xsl:when>

								<xsl:otherwise>0.00</xsl:otherwise>

							</xsl:choose>
							</font>
							</td>
						</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="MontoLiteral_U">
		<table border="0">
			<tr>
				<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>SON:</strong>&#160;
						<!-- MONTO LITERAL -->
						<xsl:call-template name="TraeValorVariable">
							<xsl:with-param name="varNumVA" select="04"/>
						</xsl:call-template>
						<br/>
					</font>
				</td>
			</tr>
			<tr>
				<td align="center" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
					      S.E.U.O
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>
<!--####-->
<!--##URION##-->

<!--##TRAFIGURA TRADING##-->
	<xsl:template name="Totales_TT">
		<tr>
			<td>
				<xsl:call-template name="Total_TT"/>
			</td>
		</tr>

		<tr>
			<td valign="top" width="100%" align="left">
				<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
					<tbody>
						<tr>
							<td valign="top" width="60%" align="left">
								<xsl:call-template name="MontoLiteral_TT"/>
							</td>
							<td valign="bottom" width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--TRANSFERENCIA GRATUITA-->
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID='1004'">
											<xsl:if test="cbc:PayableAmount != '0'">
												<strong>TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE</strong>
												<br/><br/>
											</xsl:if>
											</xsl:if>
									</xsl:for-each>
									<!--TRANSFERENCIA GRATUITA-->

									<!--DETRACCIONES-->
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID='2003'">
											<xsl:if test="cbc:PayableAmount != '0'">
												<strong>OPERACIÓN SUJETA AL SPOT <xsl:value-of select="cbc:Percent"/></strong>
												<br/>
											</xsl:if>
											</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
											<xsl:if test="cbc:ID='3001'">
											
												<strong>Nro. Cuenta Banco de la Nación: <xsl:value-of select="cbc:Value"/></strong>
												<br/>
											
											</xsl:if>
									</xsl:for-each>-->
									<!--DETRACCIONES-->
									
								</font>
							</td>
						</tr>
						<tr>
							<td valign="top" width="100%" align="left" colspan="2">

										<xsl:variable name="REF1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="9"/>
											</xsl:call-template>
										</xsl:variable>

										<xsl:variable name="REF2">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="15"/>
											</xsl:call-template>
										</xsl:variable>

<xsl:if test="($REF1!='' and $REF1!='-') or ($REF2!='' and $REF2!='-')">
<table border="0" width="100%">
			 <!--REFERENCIAS ADMISION TEMPORAL-->
			 <tr>
			 	<td align="left" width="10%" valign="top"><font face="Arial, Helvetica, sans-serif" size="0.5" style="color:#666666"><strong>(Referencia)</strong></font></td>
				<td align="left" width="90%" valign="top"><font face="Arial, Helvetica, sans-serif" size="0.5">
							
						
											<xsl:if test="($REF2!='' and $REF2!='-')">
											<strong>EXP. ADM TEMP</strong>&#160;<br /><xsl:call-template name="REF_ADMTEMP"/>
											<br />
											</xsl:if>

											<xsl:if test="($REF1!='' and $REF1!='-')">
											<strong>GUIAS DE REMISIÓN</strong>&#160;<br /><xsl:call-template name="REF_GUIASREMISION"/>
											</xsl:if>

						
				</font></td>
			</tr>
</table>
</xsl:if>
										
							</td>
						</tr>
						<!--<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<tr heigth="100%">
								<td valign="top" width="50%" align="left">asdasd</td>
							</tr>
						</xsl:if>-->

						<!--xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<tr heigth="100%">
								<td valign="top" width="70%" align="left">
									<xsl:call-template name="Observacion"/>
								</td>
							<td valign="top" width="30%">
								<xsl:call-template name="Total"/>
							</td>
						</tr>
						</xsl:if-->
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="Total_TT">
		<table border="0" width="99.9%" cellpadding="2" cellspacing="0">
			<tr>
				<td>
					<table border="0" width="100%" cellspacing="0" rules="none">
						<tbody>
						<tr bgcolor="#88AAD8">
							<td height="20" width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. GRAVADA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. INAFECTA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. EXONERADA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. GRATUITA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>I.G.V. (18%)</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>IMPORTE TOTAL</b>
								</font>
							</td>
						</tr>
						<tr>
							<!--OP. GRAVADA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1001'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>
							<!--OP. INAFECTA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1002'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>
							<!--OP. EXONERADA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1003'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>
							<!--OP. GRATUITA-->
							<td  width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1004'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>-->

									<xsl:choose>
									<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">

										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID=1004"><!--1004-->
												<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
											</xsl:if>
										</xsl:for-each>

									</xsl:when>

									<xsl:otherwise>0.00&#160;</xsl:otherwise>
									</xsl:choose>

									<!--<xsl:choose>
									<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">
										<xsl:value-of select="format-number(sac:AdditionalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
									</xsl:when>

									<xsl:otherwise>0.00&#160;</xsl:otherwise>
									</xsl:choose>-->
								</font>
							</td>
							<!--TOTAL DESCUENTOS-->
							<!--<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='2005'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>ggddd&#160;
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>-->
							<!-- IGV -->
							<td width= "14%" align="right">
								<xsl:for-each select="/pe:Invoice">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
									</font>
								</xsl:for-each>

								<xsl:for-each select="/pe1:CreditNote">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
									</font>
								</xsl:for-each>

								<xsl:for-each select="/pe2:DebitNote">
								<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">-->
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
											<!--<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>-->
									</font>
								</xsl:for-each>
							</td>
							<!--IMPORTE TOTAL-->
							<td  width= "14%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:choose>		

								<xsl:when test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
										<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
								</xsl:when>

								<xsl:when test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''"><!--PARA NOTAS DE DEBITO-->
										<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
								</xsl:when>

								<xsl:otherwise>0.00</xsl:otherwise>

							</xsl:choose>
							</font>
							</td>
						</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="MontoLiteral_TT">
		<table border="0">
			<tr>
				<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>SON:</strong>&#160;
						<!-- MONTO LITERAL -->
						<xsl:call-template name="TraeValorVariable">
							<xsl:with-param name="varNumVA" select="04"/>
						</xsl:call-template>
						<br/>
					</font>
				</td>
			</tr>
			<tr>
				<td align="center" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
					      S.E.U.O
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<!--####-->
<!--##trafigura trading##-->



	<!-- CODIGO DEL TIPO DE PRECIO UNITARIO 01 ONEROSO | 02 TRANSF GRATUITO-->
	<xsl:variable name="varCodTipoPrecUnit">
		<xsl:if test="$varImporteTotalGrat=''" ><xsl:value-of select="'01'"/></xsl:if>
		<xsl:if test="$varImporteTotalGrat!=''" ><xsl:value-of select="'02'"/></xsl:if>
	</xsl:variable>

<!-- VARIABLE TOTAL IMPORTE REFERENCIAL -->
	<xsl:variable name="varImporteTotalGrat">
		<!-- PARA LOS TOTALES: 	IMPORTE TOTAL GRATUITO='1004' -->
		<!--<xsl:call-template name="TraerTotalGraInaExo">
			<xsl:with-param name="varTotGIE" select="1004" />
		</xsl:call-template>-->

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
				<xsl:if test="cbc:ID='1004'">
					<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:template match="/">
		<html>
			<head></head>
		
			<body/>
		</html>
	</xsl:template>


<!--##TRAFIGURA METALES BÁSICOS##-->
	<xsl:template name="Totales_TM">
		<tr>
			<td>
				<xsl:call-template name="Total_TM"/>
			</td>
		</tr>

		<tr>
			<td valign="top" width="100%" align="left">
				<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
					<tbody>
						<tr>
							<td valign="top" width="60%" align="left">
								<xsl:call-template name="MontoLiteral_TM"/>
							</td>
							<td valign="bottom" width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--TRANSFERENCIA GRATUITA-->
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID='1004'">
											<xsl:if test="cbc:PayableAmount != '0'">
												<strong>TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE</strong>
												<br/><br/>
											</xsl:if>
											</xsl:if>
									</xsl:for-each>
									<!--TRANSFERENCIA GRATUITA-->
									
								</font>
							</td>
						</tr>
						<tr>
							<td valign="top" width="100%" align="left" colspan="2">

										<xsl:variable name="REF1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="9"/>
											</xsl:call-template>
										</xsl:variable>

										<xsl:variable name="REF2">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="15"/>
											</xsl:call-template>
										</xsl:variable>

<xsl:if test="($REF1!='' and $REF1!='-') or ($REF2!='' and $REF2!='-')">
<table border="0" width="100%">
			 <!--REFERENCIAS ADMISION TEMPORAL-->
			 <tr>
			 	<td align="left" width="10%" valign="top"><font face="Arial, Helvetica, sans-serif" size="0.5" style="color:#666666"><strong>(Referencia)</strong></font></td>
				<td align="left" width="90%" valign="top"><font face="Arial, Helvetica, sans-serif" size="0.5">
							
						
											<xsl:if test="($REF2!='' and $REF2!='-')">
											<strong>EXP. ADM TEMP</strong>&#160;<br /><xsl:call-template name="REF_ADMTEMP_TM"/>
											<br />
											</xsl:if>

											<xsl:if test="($REF1!='' and $REF1!='-')">
											<strong>GUIAS DE REMISIÓN</strong>&#160;<br /><xsl:call-template name="REF_GUIASREMISION_TM"/>
											</xsl:if>

						
				</font></td>
			</tr>
</table>
</xsl:if>
										
							</td>
						</tr>
						<!--<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<tr heigth="100%">
								<td valign="top" width="50%" align="left">asdasd</td>
							</tr>
						</xsl:if>-->

						<!--xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<tr heigth="100%">
								<td valign="top" width="70%" align="left">
									<xsl:call-template name="Observacion"/>
								</td>
							<td valign="top" width="30%">
								<xsl:call-template name="Total"/>
							</td>
						</tr>
						</xsl:if-->
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="Total_TM">
		<table border="0" width="99.9%" cellpadding="2" cellspacing="0">
			<tr>
				<td>
					<table border="0" width="100%" cellspacing="0" rules="none">
						<tbody>
						<tr bgcolor="#999999">
							<td height="20" width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. GRAVADA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. INAFECTA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. EXONERADA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>OP. GRATUITA</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>I.G.V. (18%)</b>
								</font>
							</td>
							<td width= "14%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<b>IMPORTE TOTAL</b>
								</font>
							</td>
						</tr>

<tr>
							<!--OP. GRAVADA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1001'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
									</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									<!--</xsl:if>-->
								</xsl:if>
							</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						
						<xsl:variable name="Gravado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>
 										<xsl:if test="$Gravado = ''">
										  0.00&#xA0;
										</xsl:if>
						</xsl:if>
								</font>
							</td>
							<!--OP. INAFECTA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1002'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
									</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">					
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									<!--</xsl:if>-->
								</xsl:if>
							</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>


						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						

						
							<xsl:variable name="Inafecto">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
						<!--	  <xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
						<!--	  <xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>


							<!--<xsl:value-of select="$Inafecto"/>-->&#xA0;
							<!--<xsl:value-of select="$Inafecto"/>
 										
										<xsl:if test="$Inafecto = '' ">
										 0.00&#xA0;
										</xsl:if>-->


										<xsl:if test="$Inafecto = '' ">
										0.00&#xA0;
										</xsl:if>
                    </xsl:if>	
								</font>
							</td>
							<!--OP. EXONERADA-->
							<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:if test="//cbc:UBLVersionID='2.0'">					
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1003'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.1'">					
						<!--<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if></xsl:if>
						</xsl:for-each>-->
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
					<!--<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>-->
						<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>-->
						<xsl:variable name="Exonerado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							 <!-- <xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							  <!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>
								<!--<xsl:value-of select="$Exonerado"/>-->
 										<xsl:if test="$Exonerado = ''">
										  0.00&#xA0;
										</xsl:if>
                                </xsl:if>
								</font>
							</td>
							<!--OP. GRATUITA-->
							<td  width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1004'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
										</xsl:if>
									</xsl:for-each>-->
							<xsl:if test="//cbc:UBLVersionID='2.0'">	
									<xsl:choose>
									<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">

										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID=1004"><!--1004-->
												<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
											</xsl:if>
										</xsl:for-each>

									</xsl:when>

									<xsl:otherwise>0.00&#160;</xsl:otherwise>
									</xsl:choose>
								</xsl:if>

							<xsl:if test="//cbc:UBLVersionID='2.1'">	
						<xsl:for-each select="//pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:if>
									</xsl:if>
									</xsl:for-each>
							<xsl:for-each select="//pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:if>
									</xsl:if>
									</xsl:for-each>

								<xsl:for-each select="//pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:if>
									</xsl:if>
									</xsl:for-each>

			</xsl:if>

			

									<!--<xsl:choose>
									<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">
										<xsl:value-of select="format-number(sac:AdditionalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
									</xsl:when>

									<xsl:otherwise>0.00&#160;</xsl:otherwise>
									</xsl:choose>-->
								</font>
							</td>
							<!--TOTAL DESCUENTOS-->
							<!--<td width= "14%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='2005'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>ggddd&#160;
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>-->
							<!-- IGV -->
							<td width= "14%" align="right">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:for-each select="/pe:Invoice">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
									</font>
								</xsl:for-each>

								<xsl:for-each select="/pe1:CreditNote">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
									</font>
								</xsl:for-each>

								<xsl:for-each select="/pe2:DebitNote">
								<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">-->
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
											<!--<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>-->
									</font>
								</xsl:for-each>
								</xsl:if>

								<xsl:if test="//cbc:UBLVersionID='2.1'">
						<!--<xsl:for-each select="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
								<xsl:if test="cbc:ID='1000'">
									<xsl:value-of select="format-number(cbc:TaxableAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>-->
						<xsl:variable name="IGV">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
								<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</xsl:variable>


                       <!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
					   
<font face="Arial, Helvetica, sans-serif" size="1">

					   <xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
					   </font>
						</xsl:if>
							</td>
							<!--IMPORTE TOTAL-->
							<td  width= "14%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:choose>		

								<xsl:when test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
										<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
								</xsl:when>

								<xsl:when test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''"><!--PARA NOTAS DE DEBITO-->
										<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
								</xsl:when>

								<xsl:otherwise>0.00</xsl:otherwise>

							</xsl:choose>
							</font>
							</td>
						</tr>


						
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="MontoLiteral_TM">
		<table border="0">
			<tr>
				<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>SON:</strong>&#160;
						<!-- MONTO LITERAL -->
						<xsl:call-template name="TraeValorVariable">
							<xsl:with-param name="varNumVA" select="04"/>
						</xsl:call-template>
						<br/>
					</font>
				</td>
			</tr>
			<!--<tr>
				<td align="center" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
					      S.E.U.O
					</font>
				</td>
			</tr>-->
		</table>
	</xsl:template>

	
<!--####--><!--REFERENCIA-->
<xsl:template name="REF_ADMTEMP_TM">
<table border="0" width="100%">
			 <!--REFERENCIAS ADMISION TEMPORAL-->
			 <tr>
				<td align="left" width="100%" valign="top"><!--style="padding-left:90px"-->
					<font face="Arial, Helvetica, sans-serif" size="0.5">

						<!--FACTURA/BOLETA-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='15'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='16'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='17'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>
						</xsl:for-each>
						

						<!--NOTA DE CREDITO-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='15'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='16'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='17'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>
						</xsl:for-each>
						
						
						
						<!--NOTA DE DEBITO-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='15'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='16'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='17'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>
						</xsl:for-each>

				   </font>
				</td>
			</tr>

</table></xsl:template>

<xsl:template name="REF_GUIASREMISION_TM">
<table border="0" width="100%">
			<!--REFERENCIAS GUIAS DE REMISION-->
			<tr>
				<td align="left" width="100%"><!--style="padding-left:90px"-->
					<font face="Arial, Helvetica, sans-serif" size="0.5">

						<!--FACTURA/BOLETA-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='9'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='10'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='11'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='12'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='13'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe:Codigo='14'">	
									<xsl:if test="pe:Valor!='-'">
									  <xsl:value-of select="pe:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

						</xsl:for-each>
						

						<!--NOTA DE CREDITO-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='9'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='10'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='11'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='12'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='13'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe1:Codigo='14'">	
									<xsl:if test="pe1:Valor!='-'">
									  <xsl:value-of select="pe1:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>
						</xsl:for-each>
						
						
						
						<!--NOTA DE DEBITO-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='9'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='10'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='11'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='12'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='13'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>

							<xsl:if test="pe2:Codigo='14'">	
									<xsl:if test="pe2:Valor!='-'">
									  <xsl:value-of select="pe2:Valor"/>&#160;
									</xsl:if>
						 	</xsl:if>
						</xsl:for-each>

				   </font>
				</td>
			</tr>
</table>
</xsl:template>
<!--####-->
<!--##TRAFIGURA METALES BÁSICOS##-->



</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="file:///c:/Users/nrios/Downloads/20555286831-01-F021-80000015.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->