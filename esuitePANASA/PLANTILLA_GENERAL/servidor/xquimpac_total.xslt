<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
<!-- <xsl:decimal-format name="clp" decimal-separator="," grouping-separator="."/> -->
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>


	<xsl:template name="Totales">
		<tr>
			<td>
				<xsl:call-template name="Total"/>
			</td>
		</tr>

		<tr>
			<td valign="top" width="100%" align="left">
				<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
					<tbody>
						<tr>
							<td valign="top" width="100%" align="left" colspan="2">
								<xsl:call-template name="MontoLiteral"/>
							</td>
						</tr>
						<!--
						<tr>
							<td width="100%">&#xA0;</td>
						</tr>
						-->
						<!--
						<tr>
							<td width="100%">&#xA0;</td>
						</tr>
						-->
						<tr>
							<td width="100%" align="center">
								<xsl:variable name="varVALOR">
									<xsl:call-template name="TraeValorVariable">
										<xsl:with-param name="varNumVA" select="24"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:if test="$varVALOR='01'">
									<font face="Arial, Helvetica, sans-serif" size="2">
										   ______________________________<br/>
										<b>CANCELADO/CANJEADO</b>&#xA0;
										<br/>&#xA0;
										<br/>&#xA0;
								
									</font>
								</xsl:if>
							</td>
						</tr>
						<!-- xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<tr heigth="100%">
								<td valign="top" width="50%" align="left"></td>
							</tr>
						</xsl:if -->

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

						<!-- xsl:if test="/pe1:CreditNote">
							<tr heigth="100%">
								<td valign="top" width="60%" align="left">
									<xsl:call-template name="Referencia"/>
								</td>
								<td valign="top" width="30%" rowspan="2">
								<xsl:call-template name="Total"/>
							</td>
							</tr>
						</xsl:if -->
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="Total">

		<xsl:variable name="OpeGrat">
						
			<xsl:value-of select="0"/>
			<xsl:if test="//cbc:UBLVersionID='2.0'">	
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
				<xsl:if test="cbc:ID='1004'">
					<xsl:value-of select="cbc:PayableAmount"/>
				</xsl:if>
			</xsl:for-each>
			</xsl:if>
			<xsl:if test="//cbc:UBLVersionID='2.1'">	
						<xsl:for-each select="//pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
							
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:if>
									</xsl:if>
									</xsl:for-each>

			</xsl:if>
		</xsl:variable>

		<xsl:variable name="ISC">
			<xsl:value-of select="0"/>
			<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
					<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
				</xsl:if> 
			</xsl:for-each>
			<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
				<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
					<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
				<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
					<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
			</xsl:for-each>
		</xsl:variable>


		
		
		<xsl:variable name="IGV">

	<xsl:if test="//cbc:UBLVersionID='2.0'">
	<xsl:choose>
	
		<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID !='0'">
			<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				 <xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
					<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
				</xsl:if>
			</xsl:for-each>
			
			<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
				<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
					c<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
				<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
					<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
				</xsl:if>
			</xsl:for-each>

		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='-' "> 
			
			<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
		</xsl:if>
			
		</xsl:when>

			<xsl:otherwise>0.00</xsl:otherwise>

  
 
	</xsl:choose>
</xsl:if>


	<xsl:if test="//cbc:UBLVersionID='2.1'">
	<xsl:choose>
	
		<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID !='0'">
			<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				 <xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
					<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
				</xsl:if>
			</xsl:for-each>
			
			<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
				<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
					<xsl:value-of select="format-number(cbc:TaxAmount,'###,###,##0.00','pen')"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
				<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
					<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
				</xsl:if>
			</xsl:for-each>

		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='-' "> 
			
			<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
		</xsl:if>
		
		</xsl:when>

			<xsl:otherwise>0.00</xsl:otherwise>

  
 
	</xsl:choose>
 <xsl:variable name="IGV1">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;--><xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>


 										<xsl:if test="$IGV1 = ''">
											0.00&#xA0;
										</xsl:if>
</xsl:if>
	 
			
		<!--	<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				 <xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
					<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
				<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
					<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
				<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
					<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
				</xsl:if>
			</xsl:for-each>
		-->	
			
		<!--</xsl:if>-->
			
		
				
		</xsl:variable>

		
		


		<table border="1" width="100%" bordercolor="#000000" rules="all">
			<tbody>
				<tr>
					<td width="12.5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<b>OP.<br/>
									GRAVADA</b>
						</font>
					</td>
					<td width="12.5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<b>OP.<br/>
									EXONERADA</b>
						</font>
					</td>
					<td width="12.5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">

							<!--<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">-->
						
						<xsl:if test="//cbc:UBLVersionID='2.0'">
									<b>OP.<br/>
									INAFECTA</b>
						</xsl:if>
						
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:choose>

							<xsl:when test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
									<xsl:if test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									EXPORTACIÓN</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<xsl:if test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<xsl:if test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:if test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							
							</xsl:choose>
	                             
										
							<xsl:choose>

									<xsl:when test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
									<xsl:if test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									EXPORTACIÓN</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<xsl:if test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<xsl:if test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:if test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
</xsl:choose>
							<xsl:choose>

							
							<xsl:when test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
									<xsl:if test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									EXPORTACIÓN</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<xsl:if test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<xsl:if test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:if test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>

							</xsl:choose>
							
							</xsl:if>
						</font>
					</td>
					<td width="12.5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<b>OP.<br/>
									GRATUITA</b>
						</font>
					</td>
					<td width="12.5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<b>OTROS<br/>
									CARGOS</b>
						</font>
					</td>
					<td width="12.5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<b>I.S.C.</b>
						</font>
					</td>
					<td width="12.5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<b>I.G.V.</b>
						</font>
					</td>
					<td width="12.5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<b>IMPORTE<br/>
									TOTAL</b>
									<xsl:choose>
	                                    <xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">     (S/)</xsl:when>
	                                    <xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">      ($)</xsl:when>
	                                    <xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">    (S/)</xsl:when>
	                                    <xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">    ($)</xsl:when>
	                                    <xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">    (S/)</xsl:when>
	                                    <xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">    ($)</xsl:when>
	                             	   <xsl:otherwise> </xsl:otherwise>
                       				 </xsl:choose>
						</font>
					</td>
				</tr>
				<tr>
					<td width="12.5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1001'">
									<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;
								</xsl:if>
							</xsl:for-each>
							
							</xsl:if>
							
							
							<xsl:if test="//cbc:UBLVersionID='2.1'">
                					<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:if test="cbc:TaxAmount!='0.00'">
											<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(cbc:TaxableAmount,  '###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
										</xsl:otherwise>
										</xsl:choose>
								<!--<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;-->
							</xsl:if>
							</xsl:if>
						            </xsl:for-each>
												<!--<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;-->
											<!--</xsl:if>
										</xsl:if>-->
							<!--</xsl:for-each>-->




						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<xsl:if test="cbc:TaxAmount!='0.00'">
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<xsl:if test="cbc:TaxAmount!='0.00'">
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>

						
						
						<!--<xsl:if test="//cbc:Note[@languageLocaleID='1002']">
							0.00&#xA0;
						</xsl:if>-->



						<xsl:variable name="Gravado">
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
							</xsl:variable>


 										<xsl:if test="$Gravado = ''">
											<!--0.00&#xA0;-->
										<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
											0&#xA0;
										</xsl:when>
										
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
											0&#xA0;
										</xsl:when>
										
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
											0&#xA0;
										</xsl:when>
										
										<xsl:otherwise>
											0.00&#xA0;
										</xsl:otherwise>
										</xsl:choose>	
											
										</xsl:if>
										
									
										


						</xsl:if>
							
						</font>
					</td>
					
					
					<td width="12.5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
						
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
									<xsl:if test="cbc:ID='1003'">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;
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
							<!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						
						
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<!--<xsl:if test="cbc:TaxableAmount='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>-->
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


 										<xsl:if test="$Exonerado = ''">
																			
	<!--OP EXONERADA-->
										<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
											0&#xA0;
										</xsl:when>
										
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
											0&#xA0;
										</xsl:when>
										
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
											0&#xA0;
										</xsl:when>
										
										<xsl:otherwise>
											0.00&#xA0;
										</xsl:otherwise>
										</xsl:choose>	
										<!-- -->

										
																						
										</xsl:if>

					   
                                </xsl:if>
							
						
						</font>
					</td>
					
					
					<!--OP EXPORTACION-->
					
					<td width="12.5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1002'">
									<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;
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
                       
					   <xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>--></xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								X <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
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

						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
							<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(cbc:TaxableAmount,  '###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
										</xsl:otherwise>
										</xsl:choose>
								<!--<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;-->
							</xsl:if>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:choose>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(cbc:TaxableAmount, '###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
										</xsl:otherwise>
										</xsl:choose>
								<!--<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;-->
							</xsl:if>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
							<xsl:choose>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(cbc:TaxableAmount, '###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
										</xsl:otherwise>
										</xsl:choose>
								<!--<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;-->
							</xsl:if>
							</xsl:if>
						</xsl:for-each>


					<!--	 <xsl:variable name="Inafecto">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							  <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>


 										<xsl:if test="$Inafecto = ''">
											0.00&#xA0;
										</xsl:if>-->

                                </xsl:if>
							
							
						</font>
					</td>
					<!--OP GRATUITA-->
					<td width="12.5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							

							<xsl:if test="//cbc:UBLVersionID='2.0'">	
							<xsl:value-of select="format-number($OpeGrat,'###,###,##0.00','pen')"/>&#xA0;
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
				<xsl:if test="cbc:ID='1004'">
					<xsl:value-of select="cbc:PayableAmount"/>
				</xsl:if>
			</xsl:for-each>
			</xsl:if>
			<xsl:if test="//cbc:UBLVersionID='2.1'">	
						<xsl:for-each select="//pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										
								<!-- <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0; -->
										
									<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
										<xsl:value-of select="format-number(cbc:TaxableAmount,'###.###.##0','clp')"/>&#xA0;
									</xsl:when>																	
									<xsl:otherwise>
										<xsl:value-of select="format-number(cbc:TaxableAmount,'###,###,##0.00','pen')"/>&#xA0;
									</xsl:otherwise>
								    </xsl:choose>
												
										
										
										
									</xsl:if>
									</xsl:if>
									</xsl:for-each>
							<xsl:for-each select="//pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										<!-- OK   OP GRATUITA NC <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0; -->
									 <xsl:choose>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
										<xsl:value-of select="format-number(cbc:TaxableAmount,'###.###.##0','clp')"/>&#xA0;
									</xsl:when>									
									<xsl:otherwise>
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:otherwise>
								    </xsl:choose>
									</xsl:if>
									
								</xsl:if>
							</xsl:for-each>

								<xsl:for-each select="//pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
								    <!-- OK   OP GRATUITA ND <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0; -->
									
									<xsl:choose>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(cbc:TaxableAmount,'###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="format-number(cbc:TaxableAmount,'###,###,##0.00','pen')"/>&#xA0;
										</xsl:otherwise>
									</xsl:choose>
									
										
									</xsl:if>
									</xsl:if>
									</xsl:for-each>

			</xsl:if>

			
			<!--</xsl:if>-->

						</font>
					</td>
					<!-- OTROS CARGOS-->
					<td width="12.5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:if test="//cbc:UBLVersionID='2.0'">	
							<xsl:choose>
								<xsl:when test="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount!=''">
									<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount,'###,###,##0.00','pen')"/>&#xA0;
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="format-number('0.00','###,###,##0.00','pen')"/>&#xA0;
								</xsl:otherwise>
							</xsl:choose>
							</xsl:if>

							<xsl:if test="//cbc:UBLVersionID='2.1'">	
								<xsl:choose>
								<xsl:when test="//cac:AllowanceCharge/cbc:Amount!=''">
										<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(//cac:AllowanceCharge/cbc:Amount,'###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(//cac:AllowanceCharge/cbc:Amount,'###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
	
											<xsl:value-of select="format-number(//cac:AllowanceCharge/cbc:Amount,'###.###.##0','clp')"/>&#xA0;
																				
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="format-number(//cac:AllowanceCharge/cbc:Amount,'###,###,##0.00','pen')"/>&#xA0;
										</xsl:otherwise>
										</xsl:choose>
									<!--<xsl:value-of select="format-number(//cac:AllowanceCharge/cbc:Amount,'###,###,##0.00','pen')"/>&#xA0;-->
								</xsl:when>

								<xsl:otherwise>
									<!-- X<xsl:value-of select="format-number('0.00','###,###,##0.00','pen')"/>&#xA0; -->
									
									<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(0.00,'###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(0.00,'###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
	
											<xsl:value-of select="format-number(0.00,'###.###.##0','clp')"/>&#xA0;
																				
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>&#xA0;
										</xsl:otherwise>
										</xsl:choose>
									
									
									
									
									
									
								</xsl:otherwise>
							    </xsl:choose>



							</xsl:if>
						</font>
					</td>
					<!-- ISC -->
					<td width="12.5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<!--<xsl:value-of select="format-number($ISC,'###,###,##0.00','pen')"/>&#xA0; -->
							<xsl:choose>
							<xsl:when test="$ISC >='0'">
							
								<!-- OK <xsl:value-of select="format-number($ISC,'###,###,##0.00','pen')"/>&#xA0;-->

								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
										<xsl:value-of select="format-number($ISC,'###.###.##0','clp')"/>&#xA0;
									</xsl:when>
									
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
										<xsl:value-of select="format-number($ISC,'###.###.##0','clp')"/>&#xA0;
									</xsl:when>
									
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
										<xsl:value-of select="format-number($ISC,'###.###.##0','clp')"/>&#xA0;
									</xsl:when>				
									
									<xsl:otherwise>
										<xsl:value-of select="format-number($ISC,'###,###,##0.00','pen')"/>&#xA0;
									</xsl:otherwise>
								</xsl:choose>
															

								
							</xsl:when>
							<xsl:otherwise>0.00</xsl:otherwise>
							</xsl:choose>
							
							
						</font>

					</td>

					<!-- IGV -->

					    <td width="12.5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">

							<xsl:if test="//cbc:UBLVersionID='2.0'">
							
							<!--<xsl:value-of select="format-number($IGV,'###,###,##0.00','pen')"/>&#xA0; -->
							<!--<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0; 
							<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/> 
							--><xsl:value-of select="$IGV"/>&#xA0; 
							<!--<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
								<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
								</xsl:if>-->
								</xsl:if>
								<xsl:if test="//cbc:UBLVersionID='2.1'">
								<!-- OK <xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0; -->
								
								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
										<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###.###.##0','clp')"/>&#xA0;
									</xsl:when>
									
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
										<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###.###.##0','clp')"/>&#xA0;
									</xsl:when>									
																	
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
										<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###.###.##0','clp')"/>&#xA0;
									</xsl:when>
									
									<xsl:otherwise>
										<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
									</xsl:otherwise>
								</xsl:choose>
								
								
								<!--<xsl:if test="//cbc:Note[@languageLocaleID='1002']">
										0.00&#xA0;
								</xsl:if>-->

								</xsl:if>
							
							
						</font>
			
					</td>


					<td width="12.5%" align="right"><!-- IMPORTE TOTAL -->
					

					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
					
						<font face="Arial, Helvetica, sans-serif" size="1">
						
  
    						<!--<xsl:value-of select="format-number(26825.8, '#.###,00', 'euro')"/>-->
  
										<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;
										</xsl:otherwise>
										</xsl:choose>
										
										

										</font>
							<!--<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;-->
					</xsl:if>
					<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<!-- ok <xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font> -->
										<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###.###.##0','clp')"/>&#xA0;
											
										</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='CLP'">
											<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###.###.##0','clp')"/>&#xA0;
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;
											
										</xsl:otherwise>
										</xsl:choose></font>							
							
					</xsl:if>



					</td>
					
					
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="MontoLiteral">
		<table border="0">
			<td align="left" width="100%">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>SON:</strong>&#xA0;
					<!-- MONTO LITERAL -->
					<xsl:call-template name="TraeValorVariable">
						<xsl:with-param name="varNumVA" select="23"/>
					</xsl:call-template>
					<br/>
				</font>
			</td>
		</table>
		
	</xsl:template>

	<xsl:template name="DescripcionAdicional_BottomVolcan">
		<xsl:param name="resto"/>
		<xsl:variable name="adicional" select="substring-before($resto,'|')"/>
		<xsl:variable name="adicional1" select="substring-after($resto,'|')"/>
		<tr>
			<td width="20%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<b>
						<xsl:value-of select="$adicional"/>
					</b>
				</font>
			</td>
	
		</tr>
		<xsl:variable name="res" select="$adicional1"/>
		<xsl:if test="$res!=''">

			<xsl:call-template name="DescripcionAdicional_BottomVolcan">
				<xsl:with-param name="resto" select="$res"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>


<xsl:template name="quimpac">
	<xsl:param name="varNumVA"/>
		<table border="0" width="100%" cellpadding="1" cellspacing="0" heigth="100%">
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='27' and pe:Valor != '-' ">
								<xsl:variable name="adicional" select="substring-before(pe:Valor,'|')"/>
								<xsl:variable name="adicional1" select="substring-after(pe:Valor,'|')"/> 
								<tr>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>
												<xsl:value-of select="$adicional"/>
											</b>
										</font>
									</td>
								</tr>
								<xsl:call-template name="DescripcionAdicional_BottomVolcan">
									<xsl:with-param name="resto" select="$adicional1"/>
								</xsl:call-template>
							</xsl:if>
				</xsl:for-each>
		</table>
	</xsl:template>


<xsl:template name="Observacion">
			<table  >
				<tr>
					<td width="50%" align="left" cellSpacing="0" border= "0">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='28'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='28'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='28'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				  </tr>
				
				</table>


		
		<font face="Arial, Helvetica, sans-serif" size="1">
			<strong>OBSERVACIONES:</strong>
		</font>
		<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" rules="none">
			<tbody>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="1">
							<!-- OBSERVACIÓN -->

						 <xsl:choose>
							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
								
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='24' and pe:Valor != '-' ">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="24"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='29' and pe:Valor != '-' ">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="29"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
							</xsl:when>

							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='24' and pe:Valor != '-' ">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="24"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='29' and pe:Valor != '-' ">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="29"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
							</xsl:when>
			<xsl:otherwise>
			<!--nota de debito-->
			<xsl:if test="/pe2:DebitNote">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='24' and pe2:Valor != '-' ">
									<xsl:call-template name="TraeValorVariable">
										<xsl:with-param name="varNumVA" select="24"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='29' and pe2:Valor != '-' ">
									<xsl:call-template name="TraeValorVariable">
										<xsl:with-param name="varNumVA" select="29"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:for-each>
			</xsl:if>      

<!-- CREDITO NOTE --> 
			<xsl:if test="/pe1:CreditNote">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='24' and pe1:Valor != '-' ">
									<xsl:call-template name="TraeValorVariable">
										<xsl:with-param name="varNumVA" select="24"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='29' and pe1:Valor != '-' ">
									<xsl:call-template name="TraeValorVariable">
										<xsl:with-param name="varNumVA" select="29"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:for-each>
			</xsl:if>      
	</xsl:otherwise>
</xsl:choose>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='27' and pe:Valor != '-' ">

									<xsl:call-template name="quimpac">
										<xsl:with-param name="varNumVA" select="27"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
							
				<xsl:call-template name="lineaBl_Obs">
					<xsl:with-param name="cont_obs" select="'2'"/>
					<table>
						<tr>
							<td align="center" valign="top" width="15%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="Observacion"/>
									
								</font>
							</td>
						</tr>
					</table>
				</xsl:call-template>

			</tbody>
		</table>
<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" rules="none">
<!-- CUOTAS NORMATIVA -->
	<xsl:for-each select="//cac:PaymentTerms">
	<xsl:if test="cbc:PaymentMeansID ='Credito'">
			<tr>
				<td width="50%">
					<font color="#000000" size="1" face="Tahoma, Helvetica, sans-serif">
					<br/>
						<xsl:call-template name="DocumentoReferencia_cuota"/>
					</font>
				</td>
			</tr>
	</xsl:if>
	</xsl:for-each>
</table>
	<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'  or //cac:AccountingCustomerParty/cbc:AdditionalAccountID='-' ">

		<font face="Arial, Helvetica, sans-serif" size="1">
			<strong>GUÍA DE REMISIÓN:</strong>
		</font>
		<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" rules="none">
			<tbody>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='31' and pe:Valor != '-' ">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="31"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='31' and pe1:Valor != '-' ">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="31"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>	
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='31' and pe2:Valor != '-' ">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="31"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>	
	
	<!-- variable 32 --> 

	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='32' and pe:Valor != '-' ">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="32"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='32' and pe1:Valor != '-' ">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="32"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>	
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='32' and pe2:Valor != '-' ">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="32"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>	
		<!-- variable 32 --> 
						</font>
					</td>
				</tr>
				
			</tbody>
		</table>

	</xsl:if>

	</xsl:template>
<xsl:template name="DocumentoReferencia_cuota">
		<table borderColor="#000000" cellSpacing="0" cellPadding="1" width="100%" style="border-top: black 1px solid; border-right: black 1px solid; border-collapse: collapse; border-bottom: black 1px solid; border-left: black 1px solid;">
			<tbody>
				<tr width="100%">
					<td colSpan="3" width="100%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
						<font size="1" face="Arial, Helvetica, sans-serif">
							<strong>INFORMACION ADICIONAL</strong>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
						<font size="1" face="Arial, Helvetica, sans-serif">
							<strong>N°CUOTA</strong>
						</font>
					</td>
					<td width="15%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
						<font size="1" face="Arial, Helvetica, sans-serif">
							<strong>MONTO</strong>
						</font>
					</td>
					<td width="15%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
						<font size="1" face="Arial, Helvetica, sans-serif">
							<strong>FECHA VENC</strong>
						</font>
					</td>
				</tr>
				<xsl:for-each select="//cac:PaymentTerms">
				<xsl:if test="cbc:PaymentMeansID !='Credito' and cbc:ID !='Detraccion' ">
						<tr>
							
							<td width="20%" align="center" style="border:solid 1px black">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="cbc:PaymentMeansID"/>
								</font>
							</td>
							<td width="15%" align="center" style="border:solid 1px black">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="cbc:Amount"/>
								</font>
							</td>
							<td width="15%" align="center" style="border:solid 1px black">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="cbc:PaymentDueDate"/>
								</font>
							</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="lineaBl_Obs">
		<xsl:param name="cont_obs"/>
		<xsl:if test="$cont_obs&gt;0">
			<tr>
				<td width="100%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl_Obs">
				<xsl:with-param name="cont_obs" select="$cont_obs - 1"/>
			</xsl:call-template>
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\Emusa\20536733419&#x2D;01&#x2D;FP01&#x2D;10036374.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->