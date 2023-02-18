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
<xsl:variable name="subTotalVenta">

					</xsl:variable>							
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
	
	
	<xsl:template name="son-pesos">
		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>SON: </strong>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='1' or pe:Codigo='01'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='1' or pe:Codigo='01'">
								<xsl:value-of select="pe1:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='1' or pe:Codigo='01'">
								<xsl:value-of select="pe2:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Total">
		<table border="2" borderColor="#000000" width="100%" cellpadding="1" cellspacing="0" style="border: double">

			<xsl:variable name="ValorDate">
				<xsl:call-template name="Fecha"/>
			</xsl:variable>
									
			<xsl:if test="$ValorDate &gt;'20230203'">
				<tr>
				<td width="48%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>SUB TOTAL</strong>
					</font>
				</td>
				<td width="52%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:call-template name="TipoDeMoneda_Total" />&#160;

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
									<xsl:value-of select="format-number($DsctoGlobal1, '###,###,##0.00', 'pen')" />
								</xsl:if>

								<xsl:if test="/pe1:CreditNote">
			                  		<xsl:value-of select="format-number($DsctoGlobal1, '###,###,##0.00', 'pen')" />
								</xsl:if>
								
								<xsl:if test="/pe2:DebitNote">
			                  		<xsl:value-of select="format-number($DsctoGlobal1, '###,###,##0.00', 'pen')" />
								</xsl:if>
							</xsl:when>
							<xsl:when test="//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='04'">
								<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:LineExtensionAmount"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
										<xsl:value-of select="format-number(cbc:TaxableAmount,'###,###,##0.00','pen')"/>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">					
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
										<xsl:value-of select="format-number(cbc:TaxableAmount,'###.###.##0,00','pen')"/>
									</xsl:if>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:variable name="Gravado">
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
 						
						<xsl:if test="$Gravado = '' ">
							0.00
						</xsl:if>
					</font>
				</td>
			</tr>

				<tr>
				<td width="48%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>DESCUENTO</strong>
					</font>
				</td>
				<td width="52%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="2">
					
				<xsl:call-template name="TipoDeMoneda_Total" />&#160;
					
						<!--<xsl:choose>
							<xsl:when test="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount!=''">
								<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount, '###,###,##0.00', 'pen')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
							</xsl:otherwise>
						</xsl:choose>-->
							<xsl:choose>
											<xsl:when test="//cac:AllowanceCharge/cbc:Amount!=''">
												<xsl:value-of select="format-number(//cac:AllowanceCharge/cbc:Amount, '###,###,##0.00', 'pen')"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
											</xsl:otherwise>
										</xsl:choose>
					</font>
				</td>
			</tr>
			</xsl:if>
			<tr>
				<td width="48%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>OP. GRAVADA</strong>
					</font>
				</td>
				<td width="52%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:call-template name="TipoDeMoneda_Total" />&#160;
					<xsl:if test="//cbc:UBLVersionID='2.0'">
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
					<xsl:if test="cbc:ID='1001'">
						<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
					</xsl:if>
				</xsl:for-each>
					</xsl:if>
				
				<xsl:if test="//cbc:UBLVersionID='2.1'">
                  <xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>
				</xsl:if>

					</font>
				</td>
			</tr>
			
			<tr>
				<td width="48%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>OP. INAFECTA</strong>
					</font>
				</td>
				<td width="52%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:call-template name="TipoDeMoneda_Total" />&#160;
					<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='1002'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>
					</xsl:if>
					</font>
				</td>
			</tr>
			
			<tr>
				<td width="48%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>OP. EXONERADO</strong>
					</font>
				</td>
				<td width="52%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:call-template name="TipoDeMoneda_Total" />&#160;
					<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='1003'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
						
					<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:value-of select="format-number($OPExonerada,'###,###,##0.00','pen')"/>
					</xsl:if>

					</font>
				</td>
			</tr>
			<tr>
				<td width="48%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>OP. GRATUITA</strong>
					</font>
				</td>
				<td width="52%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:call-template name="TipoDeMoneda_Total" />&#160;
					<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:variable name="Grat">
							<xsl:value-of select="0" />
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID = '1004'">
									<xsl:value-of select="cbc:PayableAmount" />
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>
						<xsl:value-of select="format-number($Grat, '###,###,##0.00', 'pen')" />
					</xsl:if>
						
					<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:value-of select="format-number($OpeGrat,'###,###,##0.00','pen')"/>
      				</xsl:if>
					</font>
				</td>
			</tr>
						<xsl:if test="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount!=''">
				<tr>
					<td width="48%">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>OTROS CARGOS</strong>
						</font>
					</td>
					<td width="52%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:call-template name="TipoDeMoneda_Total" />&#160;
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount, '###,###,##0.00', 'pen')"/>
						</font>
					</td>
				</tr>
			</xsl:if>



			<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				<tr>
					<td width="48%">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong> IGV </strong>
						</font>
					</td>
					<td width="52%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:call-template name="TipoDeMoneda_Total" />&#160;
						  <xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
								<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
							</xsl:if>
							
							</xsl:if>
							
					<xsl:if test="//cbc:UBLVersionID='2.1'">
                         

                                    <!--IGV GARAVADA FACTURA-->
                      <xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <!--<xsl:if test="cbc:TaxAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
								<!--</xsl:if>-->
							</xsl:if>
							</xsl:for-each>

                            
						<xsl:variable name="Gravado">
								
                                              <xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<!--<xsl:if test="cbc:TaxAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
								<!--</xsl:if>-->
										</xsl:if>
							</xsl:for-each>

                        
						



							
							</xsl:variable>


 										<xsl:if test="$Gravado = ''">
											0.00
										</xsl:if>

							  </xsl:if>
						</font>
					</td>
				</tr>
			</xsl:for-each>

			<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
				<tr>
					<td width="48%">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong> IGV </strong>
						</font>
					</td>
					<td width="52%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:call-template name="TipoDeMoneda_Total" />&#160;
						  <xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
								<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/> </xsl:if>
								</xsl:if>
									  <xsl:if test="//cbc:UBLVersionID='2.1'">
                       
					   <xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<!--<xsl:if test="cbc:TaxAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>

                            
						<xsl:variable name="Gravado">
							                      
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
						<!--<xsl:if test="cbc:TaxAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
														
							</xsl:variable>


 										<xsl:if test="$Gravado = ''">
											0.00
										</xsl:if>

							  </xsl:if>
						</font>
					</td>
				</tr>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
				<tr>
					<td width="48%">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>IGV </strong>
						</font>
					</td>
					<td width="52%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:call-template name="TipoDeMoneda_Total" />&#160;
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
								<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
							</xsl:if>
							</xsl:if>
							
										  <xsl:if test="//cbc:UBLVersionID='2.1'">
                  

				
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<!--<xsl:if test="cbc:TaxAmount!='0.00'">-->
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>

						
						
						<!--<xsl:if test="//cbc:Note[@languageLocaleID='1002']">
							0.00&#xA0;
						</xsl:if>-->



						<xsl:variable name="Gravado">
								
                                         

                 
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							 <xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
								
							
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>


 										<xsl:if test="$Gravado = ''">
											0.00
										</xsl:if>
	

                </xsl:if>
							
							

						</font>
					</td>
				</tr>
			</xsl:for-each>



			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
				<xsl:if test="cbc:ID = '2004'">
					<xsl:if test="cbc:PayableAmount!='0'">

			<tr>
				<td width="48%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>TOTAL BONIFICACIÓN</strong>
					</font>
				</td>
				<td width="52%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:call-template name="TipoDeMoneda_Total" />&#160;
						<xsl:variable name="OpeGrat">
							<xsl:value-of select="0" />
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID = '2004'">
									<xsl:value-of select="cbc:PayableAmount" />
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>
						<xsl:value-of select="format-number($OpeGrat, '###,###,##0.00', 'pen')" />
					</font>
				</td>
			</tr>
			
					</xsl:if>
				</xsl:if>
			</xsl:for-each>

			<tr>
				<td width="48%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>TOTAL </strong>
					</font>
				</td>
				<td width="52%" align="right">
				<font face="Arial, Helvetica, sans-serif" size="2">
				<xsl:call-template name="TipoDeMoneda_Total" />
					</font>
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
				</td>
			</tr>


			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
				<xsl:if test="cbc:ID='2001'">
					<xsl:if test="cbc:PayableAmount!='0'">

			<tr>
				<td width="48%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>IMP. PERCEPCIÓN</strong>
					</font>
				</td>
				<td width="52%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:call-template name="TipoDeMoneda_Total" />&#160;
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='2001'">
								<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,###0.00','pen')"/>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>

			<tr>
				<td width="48%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>MONTO TOTAL </strong>
					</font>
				</td>
				<td width="52%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:call-template name="TipoDeMoneda_Total" />&#160;
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='2001'">
								<xsl:value-of select="format-number(sac:TotalAmount,'###,###,##0.00','pen')"/>
							</xsl:if>
						</xsl:for-each>
					</font>

				</td>
			</tr>

					</xsl:if>
				</xsl:if>
			</xsl:for-each>

		</table>
	</xsl:template>

	<xsl:template name="Transferencia">
		<table border="0" width="100%" cellpadding="1">
			<tr>
				<td>
				<xsl:if test="//pe:Invoice">
					<xsl:if test="//cbc:Note[@languageLocaleID='1002']">
						<center>
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
								<b>TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE</b>
							</font>
						</center>
					</xsl:if>
				
				</xsl:if>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Detraccion">
		<table width="100%" cellpadding="0" cellspacing="0" border="0" bordercolor="#000000">
		<xsl:if test="$varCtsPorcenDetra!=''">
		<tbody>
			<tr>
				<td align="center" width="100%">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
					<br/>Operación sujeta al Sistema de Pago de Obligaciones Tributarias con el Gobierno Central.
					<br/>Cta. Cte. N°<xsl:value-of select="$varCtaBN"/> - Banco de la Nación | Detracción: <xsl:value-of select="format-number($varCtsPorcenDetra,'###,###,##0','pen')"/>%
					<!--<br/>No afecto a Retención de IGV - Agente de Retención según R.S. 037-2002/SUNAT<br/>-->
					</font>
				</td>
			</tr>
			</tbody>
			</xsl:if>
		</table>
	</xsl:template>
	
	<xsl:template name="Leyenda">
		<!--<table border="0" width="100%" cellpadding="1" cellspacing="1">
			<tr>
					<td>&#160;
					</td>
			</tr>
			<tr>
 				<td width="42%" colspan="2">
					<font face="Arial, Helvetica, sans-serif" size="1">DE NO SER PAGADO EL VALOR DE ESTA
						<xsl:choose>
							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">FACTURA ELECTRÓNICA</xsl:when>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">BOLETA DE VENTA ELECTRÓNICA</xsl:when>
								<xsl:otherwise>
									<xsl:if test="/pe2:DebitNote">NOTA DE DÉBITO ELECTRÓNICA</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						<br/>A SU VENCIMIENTO EL DEUDOR SE OBLIGA A PAGAR A CAMARA DE COMERCIO LA TASA MÁXIMA
						<br/>DE INTERÉS COMPENSATORIO Y LA TASA MÁXIMA DE INTERÉS MORATORIO Y LOS GASTOS
						<br/>ADMINISTRATIVOS PERMITIDOS POR LEY
					</font>
				</td>
			</tr>
		</table>-->
	</xsl:template>
	
		<xsl:template name="DetalleDetraccion">	
				<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">

					<tbody>
					<tr>
						<td align="left" width="100%">
							<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
								<br/>OPERACIÓN SUJETA AL SISTEMA DE PAGO DE OBLIGACIONES TRIBUTARIAS CON EL GOBIERNO CENTRAL.
								
								<strong><br/>BANCO DE LA NACIÓN - CTA. CTE. N°&#160;</strong>
				<!--Nro. Cuenta de Banco-->
								<xsl:for-each select="//pe:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount">
						    	<xsl:value-of select="cbc:ID"/> 
						   	</xsl:for-each>
																	
							<xsl:for-each select="//pe1:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount">
						     	<xsl:value-of select="cbc:ID"/> 
						   	</xsl:for-each>

							<xsl:for-each select="//pe2:DebitNote/cac:PaymentMeans/cac:PayeeFinancialAccount">
						     	<xsl:value-of select="cbc:ID"/> 
						   	</xsl:for-each> &#160; &#160;
							
				<!--PORCENTAJE--> 
							
							<strong><br/>PORCENTAJE DE DETRACCIÓN :</strong>
							<xsl:for-each select="//pe:Invoice/cac:PaymentTerms">
						     	<xsl:value-of select="cbc:PaymentPercent"/>
						   	</xsl:for-each>
																	
							<xsl:for-each select="//pe1:CreditNote/cac:PaymentTerms">
						    	<xsl:value-of select="cbc:PaymentPercent"/> 
						   	</xsl:for-each>

							<xsl:for-each select="//pe2:DebitNote/cac:PaymentTerms">
						     	<xsl:value-of select="cbc:PaymentPercent"/> 
						   	</xsl:for-each>
							%
							<!--<br/>&#160;DETRACCIÓN : &#160;-->
							
				<!--Monto de detracción-->
						
							<strong><br/>MONTO DE DETRACCIÓN :</strong>
							<xsl:call-template name="TipoDeMoneda_Total" />&#160;
							<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
							<xsl:if test="cbc:ID ='Detraccion'">
						     	<xsl:value-of select="cbc:Amount"/> 
							</xsl:if>
						   	</xsl:for-each>
																	
							<xsl:for-each select="//pe1:CreditNote/cac:PaymentTerms">
							<xsl:if test="cbc:ID ='Detraccion'">
						    	<xsl:value-of select="cbc:Amount"/> 
							</xsl:if>	
						   	</xsl:for-each>

							<xsl:for-each select="//pe2:DebitNote/cac:PaymentTerms">
							<xsl:if test="cbc:ID ='Detraccion'">
						     	<xsl:value-of select="cbc:Amount"/> 
							</xsl:if>
						   	</xsl:for-each>  &#160; &#160;

						<br/><br/></font>
					</td>
				</tr>
			</tbody>

					<!--<tbody>
						<tr width="70%">
							
							<td width="25%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>% Detracción</strong>
								</font>
							</td>
							<td width="20%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Monto</strong>
								</font>
							</td>
						</tr>
						<tr width="70%">
							<td width="25%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="format-number(cbc:Percent,'###,###,##0.00','pen')"/>
								</font>
							</td>
							<td width="20%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
								</font>
							</td>
						</tr>
						<tr>
							<td width="25%" colspan="3" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">OPERACION SUJETA A DETRACCIÓN BANCO DE LA NACIÓN CUENTA:
									<xsl:for-each select="//pe:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount">
						    			<xsl:value-of select="cbc:ID"/> 
						  		 	</xsl:for-each>								
								</font>
							</td>
						</tr>
					</tbody>-->
				</table>
	</xsl:template>

	

	<xsl:template name="Observaciones">
		<xsl:if test="/pe:Invoice">
		<table border="0" bordercolor="#000001" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>NOTA: </strong>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='7' or pe:Codigo='07'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>
			
					<tr>
					<td width="100%" align="left">
					<xsl:if test="//cac:PaymentTerms/cbc:ID ='Detraccion'">
						<xsl:call-template name="DetalleDetraccion"/>
					</xsl:if>
					<xsl:if test="//cac:PaymentTerms/cbc:ID='FormaPago' and //cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
					<font face="Arial, Helvetica, sans-serif" size="2">
					<br/><strong> &#xA0;Forma Pago:</strong> Credito
					</font>
					</xsl:if>
					<xsl:if test="//cac:PaymentTerms/cbc:ID='FormaPago' and //cac:PaymentTerms/cbc:PaymentMeansID='Contado'">
					<font face="Arial, Helvetica, sans-serif" size="2">
					<br/><strong> &#xA0;Forma Pago:</strong> Contado
					</font>
					</xsl:if>
							<xsl:call-template name="DatosCredito"/>
						</td>
							<td vAlign="middle" align="left">
							
						</td>
					</tr>
		</table>
		</xsl:if>
	</xsl:template>

	<xsl:template name="Referencia">
		   		<table border="1" borderColor="#ffffff" rules="cols" cellSpacing="0" cellPadding="1" width="100%">
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
	                                    		<td width="40%" align="center">
	                                       			<font face="Arial, Helvetica, sans-serif" size="1">
	                                          			<strong>TIPO DOCUMENTO</strong>
	                                       			</font>
	                                    		</td>
	                                    		<td width="20%" align="center">
	                                       			<font face="Arial, Helvetica, sans-serif" size="1">
	                                          			<strong>SERIE</strong>
	                                       			</font>
	                                    		</td>
												<td width="25%" align="center">
	                                       			<font face="Arial, Helvetica, sans-serif" size="1">
	                                          			<strong>CORRELATIVO</strong>
	                                       			</font>
	                                    		</td>
												<!--<td width="15%" align="center">
		                                       		<font face="Arial, Helvetica, sans-serif" size="1">
		                                          		<strong>FECHA</strong>
		                                       		</font>
		                                    	</td>-->
	                              			</tr>
	                                    	<xsl:for-each select="//cac:DespatchDocumentReference">
	                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
	                                       			<tr>
	                                           			<td width="40%" align="center">
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

														<td width="25%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="1">
	                                               				<!--<xsl:value-of select="cbc:ID"/>-->
																<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
	                                               			</font>
	                                           			</td>
														<!--<td width="15%" align="center">
															<font face="Arial, Helvetica, sans-serif" size="1">
														        <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																	<xsl:if test="pe1:Codigo='3' or pe1:Codigo='03'">
																		<xsl:if test="pe1:Valor!='-' and pe1:Valor!='0'">
																			<xsl:value-of select="concat(substring(pe1:Valor,9,2),'/',substring(pe1:Valor,6,2),'/',substring(pe1:Valor,1,4))"/>
																		</xsl:if>
																	</xsl:if>
																</xsl:for-each>
															</font>
														</td>-->
	                                       			</tr>
	                                    		</xsl:if>
	                                    	</xsl:for-each>
	                                    	<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
	                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
	                                        		<tr>
	                                           			<td width="40%" align="center">
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
														<td width="25%" align="center">
	                                                		<font face="Arial, Helvetica, sans-serif" size="1">
	                                                			<!--<xsl:value-of select="substring-after(cbc:ID,'-')"/>-->
																<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
	                                                		</font>
	                                             		</td>
	                                             		<!--<td width="15%" align="center">
	                                           				<font face="Arial, Helvetica, sans-serif" size="1">
																<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																	<xsl:if test="pe1:Codigo='3' or pe1:Codigo='03'">
																		<xsl:if test="pe1:Valor!='-' and pe1:Valor!='0'">
																			<xsl:value-of select="concat(substring(pe1:Valor,9,2),'/',substring(pe1:Valor,6,2),'/',substring(pe1:Valor,1,4))"/>
																		</xsl:if>
																	</xsl:if>
																</xsl:for-each>
															</font>
	                                           			</td>-->
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
                                    		<td width="40%" align="center">
	                                       		<font face="Arial, Helvetica, sans-serif" size="1">
	                                          		<strong>TIPO DOCUMENTO</strong>
	                                       		</font>
	                                    	</td>
	                                    	<td width="20%" align="center">
	                                       		<font face="Arial, Helvetica, sans-serif" size="1">
	                                          		<strong>SERIE</strong>
	                                       		</font>
	                                    	</td>
											<td width="25%" align="center">
	                                       		<font face="Arial, Helvetica, sans-serif" size="1">
	                                          		<strong>CORRELATIVO</strong>
	                                       		</font>
	                                    	</td>
											<!--<td width="15%" align="center">
		                                       	<font face="Arial, Helvetica, sans-serif" size="1">
		                                          	<strong>FECHA</strong>
		                                       	</font>
		                                    </td>-->
                              			</tr>
                                    	<xsl:for-each select="//cac:DespatchDocumentReference">
                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
                                       			<tr>
                                           			<td width="40%" align="center">
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
													<td width="25%" align="center">
                                                		<font face="Arial, Helvetica, sans-serif" size="1">
                                                			<!--<xsl:value-of select="substring-after(cbc:ID,'-')"/>-->
															<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
                                                		</font>
                                             		</td>
                                             		<!--<td width="15%" align="center">
	                                           			<font face="Arial, Helvetica, sans-serif" size="1">
														    <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																<xsl:if test="pe2:Codigo='3' or pe2:Codigo='03'">
																	<xsl:if test="pe2:Valor!='-' and pe2:Valor!='0'">
																		<xsl:value-of select="concat(substring(pe2:Valor,9,2),'/',substring(pe2:Valor,6,2),'/',substring(pe2:Valor,1,4))"/>
																	</xsl:if>
																</xsl:if>
															</xsl:for-each>
														</font>
	                                           		</td>-->
                                       			</tr>
                                    		</xsl:if>
                                    	</xsl:for-each>
                                    	<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
                                        		<tr>
                                           			<td width="40%" align="center">
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
													<td width="25%" align="center">
                                                		<font face="Arial, Helvetica, sans-serif" size="1">
                                                			<!--<xsl:value-of select="substring-after(cbc:ID,'-')"/>-->
															<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
                                                		</font>
                                             		</td>
                                             		<!--<td width="15%" align="center">
	                                           			<font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																<xsl:if test="pe2:Codigo='3' or pe2:Codigo='03'">
																	<xsl:if test="pe2:Valor!='-' and pe2:Valor!='0'">
																		<xsl:value-of select="concat(substring(pe2:Valor,9,2),'/',substring(pe2:Valor,6,2),'/',substring(pe2:Valor,1,4))"/>
																	</xsl:if>
																</xsl:if>
															</xsl:for-each>
														</font>
	                                           		</td>-->
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
	<xsl:template name="DatosCredito">
	<table width="100%" border="0" cellpadding="1" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
		<xsl:if test="//cac:PaymentTerms/cbc:ID='FormaPago' and //cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
		
		<tr>
		<td>
		<strong>Monto Neto Pendiente de Pago: </strong> 
		<xsl:call-template name="TipoDeMoneda_Total" />&#160;
		<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
				<xsl:if test="cbc:ID !='Detraccion'">
	         	<xsl:if test="substring-before(cbc:PaymentMeansID,'0') !='Cuota'">
	<xsl:if test="cbc:PaymentMeansID !='037'">     
		<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
	</xsl:if>
	</xsl:if>
	</xsl:if>
	</xsl:for-each>
			<!--xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
		<xsl:if test="cbc:PaymentMeansID ='Credito'">  
		<xsl:value-of select="/cbc:Amount"/>
		</xsl:if>
		</xsl:for-each-->
		</td>
		</tr>
	
	<br/>
	<tr>
	<td>
	<strong>Datos de Cuota: </strong>
	</td>                                                  
	</tr>
	<tr>
	<td>
	<table width="50%" border="1" cellSpacing="0" borderColor="#000000" cellPadding="2" style="font-family :Arial,Helvetica,sans-serif;font-size:11px;color:#000000">
	<tr>
	<td width="15%" align="center" size="1">
	<strong>N° DE CUOTA</strong>
	</td>
	<td width="15%" align="center" size="1">
	<strong>MONTO</strong>
	</td>
	<td width="15%" align="center" size="1">
	<strong>FECHA VENCIMIENTO</strong>
	</td>
	</tr>

	<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
	<xsl:if test="cbc:ID !='Detraccion'">
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
	<!--<xsl:value-of select="cbc:Amount"/>-->
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="xml\20100128218&#x2D;01&#x2D;FE51&#x2D;00000001.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20520929658&#x2D;01&#x2D;FF11&#x2D;99900001.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"></template><template name="Total"><block path="table/tr/td[1]/font/xsl:for&#x2D;each" x="340" y="27"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="44" y="55"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="90" y="57"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="160" y="87"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="260" y="27"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="15"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="410" y="17"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="40" y="87"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="20" y="27"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="84" y="15"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="130" y="17"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="200" y="47"/><block path="table/xsl:for&#x2D;each" x="300" y="27"/><block path="table/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="55"/><block path="table/xsl:for&#x2D;each/xsl:if" x="410" y="57"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="314" y="85"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if" x="360" y="87"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="360" y="127"/><block path="table/xsl:if/!=[0]" x="274" y="85"/><block path="table/xsl:if" x="320" y="87"/><block path="table/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="400" y="127"/><block path="table/xsl:for&#x2D;each[1]" x="280" y="87"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="15"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if" x="90" y="17"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="320" y="127"/><block path="table/xsl:for&#x2D;each[2]" x="240" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="95"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if" x="90" y="97"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="280" y="127"/><block path="table/xsl:for&#x2D;each[3]" x="200" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/!=[0]" x="124" y="135"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if" x="170" y="137"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="240" y="127"/><block path="table/tr[3]/td[1]/xsl:if/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if/font/xsl:value&#x2D;of" x="40" y="127"/><block path="table/tr[3]/td[1]/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if[1]" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if[1]/font/xsl:value&#x2D;of" x="360" y="87"/><block path="table[1]/tr/td/xsl:if/=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if" x="360" y="87"/><block path="table[1]/tr/td/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if[1]" x="360" y="87"/></template><template match="/"></template><template name="AdicionaDatosEmp"><block path="table/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/=[0]" x="340" y="16"/><block path="table/xsl:for&#x2D;each/xsl:if" x="386" y="18"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="290" y="46"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if" x="336" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="0" y="38"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="16" y="40"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="36" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="340" y="56"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="386" y="58"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="56" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="180" y="56"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="226" y="58"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="60" y="56"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="106" y="58"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]" x="316" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="180" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if" x="226" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/=[0]" x="250" y="46"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if" x="296" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]" x="156" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="60" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if" x="106" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/=[0]" x="130" y="46"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if" x="176" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/td/table/tr/td/xsl:for&#x2D;each" x="276" y="0"/><block path="table/td/table/tr/td/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/td/table/tr/td/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/td/table/tr/td/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="290" y="46"/><block path="table/td/table/tr/td/xsl:for&#x2D;each/xsl:if/xsl:if" x="336" y="48"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each" x="276" y="0"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="290" y="46"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each/xsl:if/xsl:if" x="336" y="48"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->