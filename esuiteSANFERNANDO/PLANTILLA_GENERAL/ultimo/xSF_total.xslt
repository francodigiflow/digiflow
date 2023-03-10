<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="son-pesos">
		<table border="0">
			<td align="left" width="70%">
				<font face="Arial, Helvetica, sans-serif" size="2">

					<strong>SON :</strong>
					<xsl:variable name="Serie">
						<xsl:value-of select="substring-before(/pe:Invoice/cbc:ID, '-')"/>
						<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:ID, '-')"/>
						<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:ID, '-')"/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="not(number($Serie))">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='01'">
									<xsl:if test="pe:Valor !='S'">

										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='17'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='17'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='17'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="pe:Valor ='S'">

										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='06'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
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
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='01'">
									<xsl:if test="pe1:Valor !='S'">

										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='17'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='17'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='17'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="pe1:Valor ='S'">

										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='06'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
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
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='01'">
									<xsl:if test="pe2:Valor !='S'">

										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='17'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='17'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='17'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="pe2:Valor ='S'">

										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='06'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
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
									</xsl:if>
								</xsl:if>
							</xsl:for-each>    

						</xsl:when>
						<xsl:otherwise>
							<!-- Para Contingencia -->   
<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']"/>			
						</xsl:otherwise>
					</xsl:choose>



				</font>
			</td>
		</table>
	</xsl:template>
	<xsl:variable name="CAMPAÑA1">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo='65'">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:template name="Total">
		<table border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000" heigth="100%">
			<!--Muestra Total Exportacion-->
			<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
				<tr>
					<td valign="top" width="70%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>TOTAL EXPORTACIÓN</strong>
						</font>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:choose>
								<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
								<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
								<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
								<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
							</xsl:choose>
						</font>
					</td>
					<xsl:variable name="v_TotalExportacion">
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')" />
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')" />
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')" />
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</xsl:variable>
					<!--> Total Exportacion<-->
						<td valign="top" width="30%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
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
					<td valign="top" width="70%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>TOTAL GRAVADO</strong>
						</font>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:choose>
								<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
								<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
								<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
								<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
							</xsl:choose>
						</font>
					</td>
					<xsl:variable name="v_TotalGravado">

						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID = '1001'">
									<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
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
					<!--> Total Gravado<-->
						<td valign="top" width="30%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
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
						<td valign="top" width="70%" align="left">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>TOTAL NO GRAVADO</strong>
							</font>
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
							</font>
						</td>
						<!--> Total No gravado<-->
							<xsl:variable name="v_TotalNoGravado">
								<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID = '1002'">
											<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
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
							<td valign="top" width="30%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
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
							<td valign="top" width="70%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>TOTAL EXONERADO</strong>
								</font>
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
									</xsl:choose>
								</font>
							</td>
							<!--> Total Exonerado<-->
								<xsl:variable name="v_TotalExonerado">
									<xsl:if test="//cbc:UBLVersionID='2.0'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID = '1003'">
												<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
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
								<td valign="top" width="30%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
										<xsl:if test="$v_TotalExonerado != '0' or $v_TotalExonerado!='0.00'">
											<xsl:value-of select="$v_TotalExonerado"/>
										</xsl:if>
										<xsl:if test="$v_TotalExonerado = ''">
											<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
										</xsl:if>	
									</font>
								</td>
							</tr>
							<tr>
								<!--> Total Descuento & Anticipo<-->
									<td valign="top" width="70%" align="left">
										<xsl:if test="$CAMPAÑA1!='CU' and //cac:TaxCategory/cbc:TaxExemptionReasonCode!='40'" >
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>TOTAL DSCTOS.GLOBALES</strong>
											</font>
										</xsl:if>
										<xsl:if test="$CAMPAÑA1!='CU' and //cac:TaxCategory/cbc:TaxExemptionReasonCode='40'">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>TOTAL CARGOS</strong>
											</font>
										</xsl:if>
										<xsl:if test="$CAMPAÑA1='CU'">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>TOTAL ANTICIPOS</strong>
											</font>
										</xsl:if>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
												<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
												<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
												<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
												<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
												<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
											</xsl:choose>
										</font>
									</td>
									<!--> Total Dscto<-->
										<xsl:variable name="Descuento2">
											<!--xsl:value-of select="0.00"/>
											<xsl:if test="cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount">
											<xsl:value-of select="cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount"/>
											</xsl:if-->
											<xsl:value-of select="0.00"/>
												<xsl:if test="$CAMPAÑA1!='CU' and //cac:TaxCategory/cbc:TaxExemptionReasonCode!='40'" >
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
													<xsl:if test="cbc:ID='2005'">
														<xsl:if test="cbc:PayableAmount!='0'">
															<xsl:value-of select="cbc:PayableAmount"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="$CAMPAÑA1!='CU'">
											<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">-->
													<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount"/>
											<!--</xsl:for-each>-->
											</xsl:if>
											<xsl:if test="$CAMPAÑA1='CU'">
												<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:PrepaidAmount"/>
											</xsl:if>
										</xsl:variable>

										<td width="30%" valign="top" align="right">
											<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
												<xsl:value-of select="format-number($Descuento2,'###,###,##0.00','pen')"/>
												<!--xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
                					<xsl:if test="cbc:ID='2005'">
                    					<xsl:if test="cbc:PayableAmount!='0'">
                            				<xsl:value-of select="format-number(cbc:PayableAmount,'###.###.##0,00','pen')"/>&#160; 
                    					</xsl:if>
                					</xsl:if>
            				  </xsl:for-each-->
											</font>
										</td>
									</tr>


									<!--tr>
				<td valign="top" width="70%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2"><strong>BASE IMP. I.G.V.	</strong>
						</font>
						<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:choose>
     						<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
     						<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
							<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
							<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
     						<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
							<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
						</xsl:choose>
						</font>
				</td>
				
				<td valign="top" width="30%" align="right">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='49'">					
											<font face="Arial, Helvetica, sans-serif" size="2"><xsl:value-of select="pe:Valor"/></font>
									</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='49'">						
											<font face="Arial, Helvetica, sans-serif" size="2"><xsl:value-of select="pe1:Valor"/></font>
									</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='49'">					
											<font face="Arial, Helvetica, sans-serif" size="2"><xsl:value-of select="pe2:Valor"/></font>
									</xsl:if>
							</xsl:for-each>
				</td>
			</tr-->
									<tr>
										<td valign="top" width="70%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>TOTAL I.G.V.</strong>
											</font>
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:choose>
													<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
													<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
													<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
													<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
													<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
													<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
												</xsl:choose>
											</font>
										</td>
										<!--> Total IGV<-->
											<!--<xsl:for-each select="/pe:Invoice/cac:TaxTotal">-->
											<xsl:variable name="v_TotalIGV">
												<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
												<xsl:if test="//cbc:UBLVersionID='2.0'">
													<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
														<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
													</xsl:if>
												</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
												<xsl:if test="//cbc:UBLVersionID='2.0'">
													<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
														<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
													</xsl:if>
												</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
												<xsl:if test="//cbc:UBLVersionID='2.0'">
													<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
														<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
													</xsl:if>
												</xsl:if>
												</xsl:for-each>
												<xsl:if test="//cbc:UBLVersionID='2.1'">
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
											
											</xsl:variable>
											<td valign="top" width="30%" align="right">
												<font face="Arial, Helvetica, sans-serif" size="2">
													<xsl:if test="$v_TotalIGV != '0' or $v_TotalIGV!='0.00'">
														<xsl:value-of select="$v_TotalIGV"/>
													</xsl:if>
													<xsl:if test="$v_TotalIGV = ''">
														<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')"/>
													</xsl:if>
												</font>
											</td>
											
											<!--</xsl:for-each>-->
											<!--IGV_VARIABLE PARA NC-->

											<!--<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">

					<td valign="top" width="30%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
								<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
						</font>
					</td>
				</xsl:for-each>-->


											<!--IGV_VARIABLE PARA ND-->

											<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
					<td valign="top" width="30%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
								<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
						</font>
					</td>
				</xsl:for-each>-->
										</tr>
										<!-- Gratuita para factura-->
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='43'">
												<xsl:if test="pe:Valor!='-'">
													<tr>
														<td valign="top" width="70%" align="left">
															<font face="Arial, Helvetica, sans-serif" size="2">
																<strong>TOTAL.V.VTA.OP.GRATUITAS</strong>
															</font>
															<font face="Arial, Helvetica, sans-serif" size="2">
																<xsl:choose>
																	<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
																	<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
																	<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
																	<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
																	<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
																	<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
																</xsl:choose>
															</font>
														</td>
														<!--> Total Op.Gratuita<-->
															<td width="30%" valign="top" align="right">
																<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
																	<xsl:if test="//cbc:UBLVersionID='2.0'">
																		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
																			<xsl:if test="cbc:ID='1004'">
																				<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
																			</xsl:if>
																		</xsl:for-each>
																	</xsl:if>
																	<xsl:if test="//cbc:UBLVersionID='2.1'">
																		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
																			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
																				<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
																			</xsl:if>
																		</xsl:for-each>
																		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
																			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
																				<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
																			</xsl:if>
																		</xsl:for-each>
																		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
																			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
																				<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
																			</xsl:if>
																		</xsl:for-each>
																	</xsl:if>
																</font>
															</td>
														</tr>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='43'">
													<xsl:if test="pe1:Valor!='-'">
														<tr>
															<td valign="top" width="70%" align="left">
																<font face="Arial, Helvetica, sans-serif" size="2">
																	<strong>TOTAL.V.VTA.OP.GRATUITAS</strong>
																</font>
																<font face="Arial, Helvetica, sans-serif" size="2">
																	<xsl:choose>
																		<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
																		<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
																		<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
																		<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
																		<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
																		<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
																	</xsl:choose>
																</font>
															</td>
															<!--> Total Op.Gratuita<-->
																<td width="30%" valign="top" align="right">
																	<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
																		<xsl:if test="//cbc:UBLVersionID='2.0'">
																			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
																				<xsl:if test="cbc:ID='1004'">
																					<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
																				</xsl:if>
																			</xsl:for-each>
																		</xsl:if>
																		<xsl:if test="//cbc:UBLVersionID='2.1'">
																			<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
																				<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
																					<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
																				</xsl:if>
																			</xsl:for-each>
																			<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
																				<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
																					<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
																				</xsl:if>
																			</xsl:for-each>
																			<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
																				<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
																					<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
																				</xsl:if>
																			</xsl:for-each>
																		</xsl:if>
																	</font>
																</td>
															</tr>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												<tr>
													<td valign="top" width="70%" align="left">
														<font face="Arial, Helvetica, sans-serif" size="2">
															<strong>IMPORTE TOTAL</strong>
														</font>
														<font face="Arial, Helvetica, sans-serif" size="2">
															<xsl:choose>
																<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
																<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
																<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
																<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
																<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
																<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
															</xsl:choose>
														</font>
													</td>
													<!--> Importe Total<-->
														<td valign="top" width="30%" align="right">
															<!--font face="Arial, Helvetica, sans-serif" size="2">&#160;<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###.###.##0,00','pen')"/>
			   	</font-->
															<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
																<font face="Arial, Helvetica, sans-serif" size="2">
																	<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
																</font>
															</xsl:if>
															<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
																<font face="Arial, Helvetica, sans-serif" size="2">
																	<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
															</xsl:if>
														</td>
													</tr>
												</table>
											</xsl:template>

											<xsl:template name="Referencia">
												<table border="0" cellSpacing="3" borderColor="#000000" cellPadding="1" width="100%">
													<tbody>
														<tr>
															<td>
																<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
																	<tbody>
																		<xsl:if test="//cbc:UBLVersionID='2.0'">
																			<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='1'">


																				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																					<xsl:if test="pe:Codigo='01'">
																						<xsl:if test="pe:Valor !='S'">

																							<tr>
																								<td COLSPAN="2">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																									</font>
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																											<xsl:if test="pe:Codigo='18'">
																												<xsl:value-of select="pe:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																											<xsl:if test="pe1:Codigo='18'">
																												<xsl:value-of select="pe1:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																											<xsl:if test="pe2:Codigo='18'">
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
																					<xsl:if test="pe1:Codigo='01'">
																						<xsl:if test="pe1:Valor !='S'">

																							<tr>
																								<td COLSPAN="2">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																									</font>
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																											<xsl:if test="pe:Codigo='18'">
																												<xsl:value-of select="pe:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																											<xsl:if test="pe1:Codigo='18'">
																												<xsl:value-of select="pe1:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																											<xsl:if test="pe2:Codigo='18'">
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
																					<xsl:if test="pe2:Codigo='01'">
																						<xsl:if test="pe2:Valor !='S'">

																							<tr>
																								<td COLSPAN="2">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																									</font>
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																											<xsl:if test="pe:Codigo='18'">
																												<xsl:value-of select="pe:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																											<xsl:if test="pe1:Codigo='18'">
																												<xsl:value-of select="pe1:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																											<xsl:if test="pe2:Codigo='18'">
																												<xsl:value-of select="pe2:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																									</font>
																								</td>
																							</tr>
																						</xsl:if>
																					</xsl:if>
																				</xsl:for-each>


																				<tr>
																					<td>
																						<xsl:choose>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:if test="/pe1:CreditNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																								<xsl:if test="/pe2:DebitNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</tr>
																			</xsl:if>
																			<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='6'">

																				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																					<xsl:if test="pe:Codigo='01'">
																						<xsl:if test="pe:Valor !='S'">

																							<tr>
																								<td COLSPAN="2">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																									</font>
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																											<xsl:if test="pe:Codigo='18'">
																												<xsl:value-of select="pe:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																											<xsl:if test="pe1:Codigo='18'">
																												<xsl:value-of select="pe1:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																											<xsl:if test="pe2:Codigo='18'">
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
																					<xsl:if test="pe1:Codigo='01'">
																						<xsl:if test="pe1:Valor !='S'">

																							<tr>
																								<td COLSPAN="2">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																									</font>
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																											<xsl:if test="pe:Codigo='18'">
																												<xsl:value-of select="pe:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																											<xsl:if test="pe1:Codigo='18'">
																												<xsl:value-of select="pe1:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																											<xsl:if test="pe2:Codigo='18'">
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
																					<xsl:if test="pe2:Codigo='01'">
																						<xsl:if test="pe2:Valor !='S'">

																							<tr>
																								<td COLSPAN="2">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																									</font>
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																											<xsl:if test="pe:Codigo='18'">
																												<xsl:value-of select="pe:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																											<xsl:if test="pe1:Codigo='18'">
																												<xsl:value-of select="pe1:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																											<xsl:if test="pe2:Codigo='18'">
																												<xsl:value-of select="pe2:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																									</font>
																								</td>
																							</tr>
																						</xsl:if>
																					</xsl:if>
																				</xsl:for-each>

																				<tr>
																					<td>
																						<xsl:choose>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:if test="/pe1:CreditNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																								<xsl:if test="/pe2:DebitNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</tr>
																			</xsl:if>
																			<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='0'">
																				<tr>
																					<td COLSPAN="2">
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																						</font>
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																								<xsl:if test="pe:Codigo='18'">
																									<xsl:value-of select="pe:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																								<xsl:if test="pe1:Codigo='18'">
																									<xsl:value-of select="pe1:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																								<xsl:if test="pe2:Codigo='18'">
																									<xsl:value-of select="pe2:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																						</font>
																					</td>
																				</tr>
																				<tr>
																					<td>
																						<xsl:choose>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:if test="/pe1:CreditNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																								<xsl:if test="/pe2:DebitNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</tr>
																			</xsl:if>
																			<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='4'">
																				<tr>
																					<td COLSPAN="2">
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																						</font>
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																								<xsl:if test="pe:Codigo='18'">
																									<xsl:value-of select="pe:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																								<xsl:if test="pe1:Codigo='18'">
																									<xsl:value-of select="pe1:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																								<xsl:if test="pe2:Codigo='18'">
																									<xsl:value-of select="pe2:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																						</font>
																					</td>
																				</tr>
																				<tr>
																					<td>
																						<xsl:choose>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:if test="/pe1:CreditNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																								<xsl:if test="/pe2:DebitNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</tr>
																			</xsl:if>
																			<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='7'">
																				<tr>
																					<td COLSPAN="2">
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																						</font>
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																								<xsl:if test="pe:Codigo='18'">
																									<xsl:value-of select="pe:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																								<xsl:if test="pe1:Codigo='18'">
																									<xsl:value-of select="pe1:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																								<xsl:if test="pe2:Codigo='18'">
																									<xsl:value-of select="pe2:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																						</font>
																					</td>
																				</tr>
																				<tr>
																					<td>
																						<xsl:choose>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:if test="/pe1:CreditNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																								<xsl:if test="/pe2:DebitNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</tr>
																			</xsl:if>
																		</xsl:if>
																		<xsl:if test="//cbc:UBLVersionID='2.1'">
																			<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">


																				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																					<xsl:if test="pe:Codigo='01'">
																						<xsl:if test="pe:Valor !='S'">

																							<tr>
																								<td COLSPAN="2">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																									</font>
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																											<xsl:if test="pe:Codigo='18'">
																												<xsl:value-of select="pe:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																											<xsl:if test="pe1:Codigo='18'">
																												<xsl:value-of select="pe1:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																											<xsl:if test="pe2:Codigo='18'">
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
																					<xsl:if test="pe1:Codigo='01'">
																						<xsl:if test="pe1:Valor !='S'">

																							<tr>
																								<td COLSPAN="2">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																									</font>
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																											<xsl:if test="pe:Codigo='18'">
																												<xsl:value-of select="pe:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																											<xsl:if test="pe1:Codigo='18'">
																												<xsl:value-of select="pe1:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																											<xsl:if test="pe2:Codigo='18'">
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
																					<xsl:if test="pe2:Codigo='01'">
																						<xsl:if test="pe2:Valor !='S'">

																							<tr>
																								<td COLSPAN="2">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																									</font>
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																											<xsl:if test="pe:Codigo='18'">
																												<xsl:value-of select="pe:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																											<xsl:if test="pe1:Codigo='18'">
																												<xsl:value-of select="pe1:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																											<xsl:if test="pe2:Codigo='18'">
																												<xsl:value-of select="pe2:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																									</font>
																								</td>
																							</tr>
																						</xsl:if>
																					</xsl:if>
																				</xsl:for-each>


																				<tr>
																					<td>
																						<xsl:choose>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:if test="/pe1:CreditNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																								<xsl:if test="/pe2:DebitNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</tr>
																			</xsl:if>
																			<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">

																				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																					<xsl:if test="pe:Codigo='01'">
																						<xsl:if test="pe:Valor !='S'">

																							<tr>
																								<td COLSPAN="2">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																									</font>
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																											<xsl:if test="pe:Codigo='18'">
																												<xsl:value-of select="pe:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																											<xsl:if test="pe1:Codigo='18'">
																												<xsl:value-of select="pe1:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																											<xsl:if test="pe2:Codigo='18'">
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
																					<xsl:if test="pe1:Codigo='01'">
																						<xsl:if test="pe1:Valor !='S'">

																							<tr>
																								<td COLSPAN="2">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																									</font>
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																											<xsl:if test="pe:Codigo='18'">
																												<xsl:value-of select="pe:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																											<xsl:if test="pe1:Codigo='18'">
																												<xsl:value-of select="pe1:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																											<xsl:if test="pe2:Codigo='18'">
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
																					<xsl:if test="pe2:Codigo='01'">
																						<xsl:if test="pe2:Valor !='S'">

																							<tr>
																								<td COLSPAN="2">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																									</font>
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																											<xsl:if test="pe:Codigo='18'">
																												<xsl:value-of select="pe:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																											<xsl:if test="pe1:Codigo='18'">
																												<xsl:value-of select="pe1:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																											<xsl:if test="pe2:Codigo='18'">
																												<xsl:value-of select="pe2:Valor"/>
																											</xsl:if>
																										</xsl:for-each>
																									</font>
																								</td>
																							</tr>
																						</xsl:if>
																					</xsl:if>
																				</xsl:for-each>

																				<tr>
																					<td>
																						<xsl:choose>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:if test="/pe1:CreditNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																								<xsl:if test="/pe2:DebitNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</tr>
																			</xsl:if>
																			<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">
																				<tr>
																					<td COLSPAN="2">
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																						</font>
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																								<xsl:if test="pe:Codigo='18'">
																									<xsl:value-of select="pe:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																								<xsl:if test="pe1:Codigo='18'">
																									<xsl:value-of select="pe1:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																								<xsl:if test="pe2:Codigo='18'">
																									<xsl:value-of select="pe2:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																						</font>
																					</td>
																				</tr>
																				<tr>
																					<td>
																						<xsl:choose>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:if test="/pe1:CreditNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																								<xsl:if test="/pe2:DebitNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</tr>
																			</xsl:if>
																			<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">
																				<tr>
																					<td COLSPAN="2">
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																						</font>
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																								<xsl:if test="pe:Codigo='18'">
																									<xsl:value-of select="pe:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																								<xsl:if test="pe1:Codigo='18'">
																									<xsl:value-of select="pe1:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																								<xsl:if test="pe2:Codigo='18'">
																									<xsl:value-of select="pe2:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																						</font>
																					</td>
																				</tr>
																				<tr>
																					<td>
																						<xsl:choose>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:if test="/pe1:CreditNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																								<xsl:if test="/pe2:DebitNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</tr>
																			</xsl:if>
																			<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">
																				<tr>
																					<td COLSPAN="2">
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																						</font>
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																								<xsl:if test="pe:Codigo='18'">
																									<xsl:value-of select="pe:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																								<xsl:if test="pe1:Codigo='18'">
																									<xsl:value-of select="pe1:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																								<xsl:if test="pe2:Codigo='18'">
																									<xsl:value-of select="pe2:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																						</font>
																					</td>
																				</tr>
																				<tr>
																					<td>
																						<xsl:choose>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:if test="/pe1:CreditNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																								<xsl:if test="/pe2:DebitNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</tr>
																			</xsl:if>
																			<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'C'">
																				<tr>
																					<td COLSPAN="2">
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																						</font>
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																								<xsl:if test="pe:Codigo='18'">
																									<xsl:value-of select="pe:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																								<xsl:if test="pe1:Codigo='18'">
																									<xsl:value-of select="pe1:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																								<xsl:if test="pe2:Codigo='18'">
																									<xsl:value-of select="pe2:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																						</font>
																					</td>
																				</tr>
																				<tr>
																					<td>
																						<xsl:choose>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:if test="/pe1:CreditNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																								<xsl:if test="/pe2:DebitNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</tr>
																			</xsl:if>
																			<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'D'">
																				<tr>
																					<td COLSPAN="2">
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<strong>&#xA0;CÓDIGO SAP:&#xA0;</strong>
																						</font>
																						<font face="Arial, Helvetica, sans-serif" size="2">
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																								<xsl:if test="pe:Codigo='18'">
																									<xsl:value-of select="pe:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																								<xsl:if test="pe1:Codigo='18'">
																									<xsl:value-of select="pe1:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																								<xsl:if test="pe2:Codigo='18'">
																									<xsl:value-of select="pe2:Valor"/>
																								</xsl:if>
																							</xsl:for-each>
																						</font>
																					</td>
																				</tr>
																				<tr>
																					<td>
																						<xsl:choose>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
																								<font size="2" face="Arial, Helvetica, sans-serif"/>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:if test="/pe1:CreditNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																								<xsl:if test="/pe2:DebitNote">
																									<font size="1" face="Arial, Helvetica, sans-serif">
																										<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
																										</strong>
																									</font>
																								</xsl:if>
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</tr>
																			</xsl:if>
																		</xsl:if>
																		<xsl:if test="/pe1:CreditNote">
																			<tr>
																				<td>
																					<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="50%">
																						<tbody>
																							<tr>
																								<td width="60%" align="center">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>Tipo Documento Referencia</strong>
																									</font>
																								</td>
																								<td width="40%" align="center">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>Correlativo</strong>
																									</font>
																								</td>
																							</tr>
																							<xsl:for-each select="//cac:DespatchDocumentReference">
																								<xsl:if test="cbc:DocumentTypeCode != '10'">
																									<tr>
																										<td width="30%" align="center">
																											<font face="Arial, Helvetica, sans-serif" size="2">
																												<xsl:choose>
																													<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
																													<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
																													<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
																													<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
																													<xsl:otherwise>Documento NN</xsl:otherwise>
																												</xsl:choose>
																											</font>
																										</td>
																										<td width="15%" align="center">
																											<font face="Arial, Helvetica, sans-serif" size="2">
																												<!--xsl:value-of select="cbc:ID"/-->
																												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																													<xsl:if test="pe1:Codigo='67'">
																														<xsl:value-of select="pe1:Valor"/>
																													</xsl:if>
																												</xsl:for-each>
																											</font>
																										</td>
																									</tr>
																								</xsl:if>
																							</xsl:for-each>
																							<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
																								<xsl:if test="cbc:DocumentTypeCode != '10'">
																									<tr>
																										<td width="30%" align="center">
																											<font face="Arial, Helvetica, sans-serif" size="2">
																												<xsl:choose>
																													<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
																													<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
																													<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
																													<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
																													<xsl:otherwise>Documento NN</xsl:otherwise>
																												</xsl:choose>
																											</font>
																										</td>
																										<td width="15%" align="center">
																											<font face="Arial, Helvetica, sans-serif" size="2">
																												<!--xsl:value-of select="cbc:ID"/-->
																												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																													<xsl:if test="pe1:Codigo='67'">
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
																				</td>
																			</tr>
																		</xsl:if>
																		<xsl:if test="/pe2:DebitNote">
																			<tr>
																				<td COLSPAN="2">
																					<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="80%">
																						<tbody>
																							<tr>
																								<td width="40%" align="center">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>Tipo Documento Referencia</strong>
																									</font>
																								</td>
																								<td width="60%" align="center">
																									<font face="Arial, Helvetica, sans-serif" size="2">
																										<strong>Correlativo</strong>
																									</font>
																								</td>
																							</tr>
																							<xsl:for-each select="//cac:DespatchDocumentReference">
																								<xsl:if test="cbc:DocumentTypeCode != '10'">
																									<tr>
																										<td width="30%" align="center">
																											<font face="Arial, Helvetica, sans-serif" size="2">
																												<xsl:choose>
																													<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
																													<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
																													<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
																													<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
																													<xsl:otherwise>Documento NN</xsl:otherwise>
																												</xsl:choose>
																											</font>
																										</td>
																										<td width="15%" align="center">
																											<font face="Arial, Helvetica, sans-serif" size="2">
																												<!--xsl:value-of select="cbc:ID"/-->
																												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																													<xsl:if test="pe2:Codigo='67'">
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
																									<tr>
																										<td width="30%" align="center">
																											<font face="Arial, Helvetica, sans-serif" size="2">
																												<xsl:choose>
																													<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
																													<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
																													<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
																													<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
																													<xsl:otherwise>Documento NN</xsl:otherwise>
																												</xsl:choose>
																											</font>
																										</td>
																										<td width="15%" align="center">
																											<font face="Arial, Helvetica, sans-serif" size="2">
																												<!--xsl:value-of select="cbc:ID"/-->
																												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																													<xsl:if test="pe2:Codigo='67'">
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
																		</xsl:if>
																		<tr>
																			<td/>
																		</tr>

																		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																			<xsl:if test="pe:Codigo='01'">
																				<xsl:if test="pe:Valor !='S'">

																					<tr>
																						<td>
																							<font face="Arial, Helvetica, sans-serif" size="2">
																								<strong>Mensaje al Cliente:</strong></font>
																						</td>
																					</tr>
																					<tr>
																						<td COLSPAN="2" align="left">
																							<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="90%">
																								<body>
																									<tr>
																										<td>
																											
																											<!--CAMPO TEXTO-->
																											<!--Variable 37-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='37'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="1">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='37'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='37'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 19-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='19'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="1">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='19'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='19'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--variable 20-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='20'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="1">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='20'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='20'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<!--variable 23-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='23'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="1">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='23'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='20'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<!--variable 47-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='47'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="1">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='47'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='47'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--variable 48-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='48'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="1">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='48'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='48'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 43-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='43'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='43'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='43'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 44-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='44'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="1">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='44'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="1">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='44'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="1">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 45-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='45'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='45'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='45'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 46-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='46'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='46'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='46'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 68-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='68'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='68'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='68'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 71-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='71'">
																													<xsl:if test="pe:Valor!='-'">
																														<xsl:variable name="linea1">
																															<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																														</xsl:variable>
																														<xsl:variable name="resto1">
																															<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																														</xsl:variable>
																														<xsl:variable name="linea2">
																															<xsl:value-of select="substring-before($resto1,'*')"/>
																														</xsl:variable>
																														<xsl:variable name="resto2">
																															<xsl:value-of select="substring-after($resto1,'*')"/>
																														</xsl:variable>
																														<xsl:variable name="linea3">
																															<xsl:value-of select="substring-before($resto2,'*')"/>
																														</xsl:variable>
																														<xsl:variable name="resto3">
																															<xsl:value-of select="substring-after($resto2,'*')"/>
																														</xsl:variable>
																														<xsl:variable name="linea4">
																															<xsl:value-of select="substring-before($resto3,'*')"/>
																														</xsl:variable>
																														<xsl:variable name="resto4">
																															<xsl:value-of select="substring-after($resto3,'*')"/>
																														</xsl:variable>
																														<xsl:variable name="linea5">
																															<xsl:value-of select="substring-before($resto4,'*')"/>
																														</xsl:variable>
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:if test="$linea1!='-'"><xsl:value-of select="$linea1"/>
																																<br/>
																															</xsl:if>
																															<xsl:if test="$linea2!='-'"><xsl:value-of select="$linea2"/>
																															</xsl:if>
																															<xsl:if test="$linea3!='-'"><xsl:value-of select="$linea3"/>
																															</xsl:if>
																															<xsl:if test="$linea4!='-'"><xsl:value-of select="$linea4"/>
																															</xsl:if>
																															<xsl:if test="$linea5!='-'"><xsl:value-of select="$linea5"/>
																															</xsl:if>
																														</font>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--variable 84_ Guias de campaÃ±as-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='84'">
																													<xsl:variable name="guia1">
																														<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="resto1">
																														<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="guia2">
																														<xsl:value-of select="substring-before($resto1,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="resto2">
																														<xsl:value-of select="substring-after($resto1,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="guia3">
																														<xsl:value-of select="substring-before($resto2,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="resto3">
																														<xsl:value-of select="substring-after($resto2,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="guia4">
																														<xsl:value-of select="substring-before($resto3,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="resto4">
																														<xsl:value-of select="substring-after($resto3,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="guia5">
																														<xsl:value-of select="substring-before($resto4,'*')"/>
																													</xsl:variable>

																													<font face="Arial, Helvetica, sans-serif" size="2">
																														<xsl:if test="$guia1!='-'"><xsl:value-of select="$guia1"/>
																															<br/>
																														</xsl:if>
																														<xsl:if test="$guia2!='-'"><xsl:value-of select="$guia2"/>
																															<br/>
																														</xsl:if>
																														<xsl:if test="$guia3!='-'"><xsl:value-of select="$guia3"/>
																															<br/>
																														</xsl:if>
																														<xsl:if test="$guia4!='-'"><xsl:value-of select="$guia4"/>
																															<br/>
																														</xsl:if>
																														<xsl:if test="$guia5!='-'"><xsl:value-of select="$guia5"/>
																														</xsl:if>
																													</font>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Glosa de percepcion-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
																												<xsl:if test="cbc:ID='2001'">
																													<xsl:if test="cbc:PayableAmount!='0'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<strong>OPERACION SUJETA A PERCEPCIÓN DEL IGV</strong>
																														</font>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<br/></td>
																									</tr>
																								</body>
																							</table>
																						</td>
																					</tr>
																				</xsl:if>
																			</xsl:if>
																		</xsl:for-each>


																		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																			<xsl:if test="pe1:Codigo='01'">
																				<xsl:if test="pe1:Valor !='S'">

																					<tr>
																						<td>
																							<font face="Arial, Helvetica, sans-serif" size="2">
																								<strong>Mensaje al Cliente:</strong>;</font>
																						</td>
																					</tr>
																					<tr>
																						<td COLSPAN="2" align="left">
																							<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="75%" style="word-wrap: break-word;table-layout: fixed;">
																								<body>
																									<tr>
																										<td>

																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='37'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='37'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='37'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 19-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='19'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='19'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='19'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--variable 20-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='20'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='20'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='20'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<!--variable 23-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='23'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='23'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='20'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<!--variable 47-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='47'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='47'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='47'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--variable 48-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='48'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='48'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='48'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 43-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='43'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='43'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='43'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 44-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='44'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='44'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='44'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 45-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='45'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='45'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='45'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 46-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='46'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='46'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='46'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 68-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='68'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='68'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='68'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<!--variable 84_ Guias de campaÃ±as-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='84'">
																													<xsl:variable name="guia1">
																														<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="resto1">
																														<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="guia2">
																														<xsl:value-of select="substring-before($resto1,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="resto2">
																														<xsl:value-of select="substring-after($resto1,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="guia3">
																														<xsl:value-of select="substring-before($resto2,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="resto3">
																														<xsl:value-of select="substring-after($resto2,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="guia4">
																														<xsl:value-of select="substring-before($resto3,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="resto4">
																														<xsl:value-of select="substring-after($resto3,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="guia5">
																														<xsl:value-of select="substring-before($resto4,'*')"/>
																													</xsl:variable>

																													<font face="Arial, Helvetica, sans-serif" size="2">
																														<xsl:if test="$guia1!='-'"><xsl:value-of select="$guia1"/>
																															<br/>
																														</xsl:if>
																														<xsl:if test="$guia2!='-'"><xsl:value-of select="$guia2"/>
																															<br/>
																														</xsl:if>
																														<xsl:if test="$guia3!='-'"><xsl:value-of select="$guia3"/>
																															<br/>
																														</xsl:if>
																														<xsl:if test="$guia4!='-'"><xsl:value-of select="$guia4"/>
																															<br/>
																														</xsl:if>
																														<xsl:if test="$guia5!='-'"><xsl:value-of select="$guia5"/>
																														</xsl:if>
																													</font>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Glosa de percepcion-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
																												<xsl:if test="cbc:ID='2001'">
																													<xsl:if test="cbc:PayableAmount!='0'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<strong>OPERACION SUJETA A PERCEPCIÓN DEL IGV</strong>
																														</font>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											</td>
																									</tr>
																								</body>
																							</table>
																						</td>
																					</tr>
																				</xsl:if>
																			</xsl:if>
																		</xsl:for-each>

																		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																			<xsl:if test="pe2:Codigo='01'">
																				<xsl:if test="pe2:Valor !='S'">

																					<tr>
																						<td>
																							<font face="Arial, Helvetica, sans-serif" size="2">
																								<strong>Mensaje al Cliente:</strong></font>
																						</td>
																					</tr>
																					<tr>
																						<td COLSPAN="2" align="left">
																							<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="90%">
																								<body>
																									<tr>
																										<td>
																											
																											<!--CAMPO TEXTO-->
																											<!--Variable 37-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='37'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="1">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='37'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='37'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 19-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='19'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='19'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='19'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--variable 20-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='20'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='20'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='20'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<!--variable 23-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='23'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='23'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='20'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<!--variable 47-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='47'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='47'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='47'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--variable 48-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='48'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='48'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='48'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 43-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='43'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='43'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='43'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 44-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='44'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='44'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='44'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 45-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='45'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='45'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='45'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 46-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='46'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='46'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='46'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Variable 68-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='68'">
																													<xsl:if test="pe:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='68'">
																													<xsl:if test="pe1:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe1:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='68'">
																													<xsl:if test="pe2:Valor!='-'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<xsl:value-of select="pe2:Valor"/>
																														</font>
																														<br/>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																											<!--variable 84_ Guias de campaÃ±as-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='84'">
																													<xsl:variable name="guia1">
																														<xsl:value-of select="substring-before(pe:Valor,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="resto1">
																														<xsl:value-of select="substring-after(pe:Valor,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="guia2">
																														<xsl:value-of select="substring-before($resto1,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="resto2">
																														<xsl:value-of select="substring-after($resto1,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="guia3">
																														<xsl:value-of select="substring-before($resto2,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="resto3">
																														<xsl:value-of select="substring-after($resto2,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="guia4">
																														<xsl:value-of select="substring-before($resto3,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="resto4">
																														<xsl:value-of select="substring-after($resto3,'*')"/>
																													</xsl:variable>
																													<xsl:variable name="guia5">
																														<xsl:value-of select="substring-before($resto4,'*')"/>
																													</xsl:variable>

																													<font face="Arial, Helvetica, sans-serif" size="2">
																														<xsl:if test="$guia1!='-'"><xsl:value-of select="$guia1"/>
																															<br/>
																														</xsl:if>
																														<xsl:if test="$guia2!='-'"><xsl:value-of select="$guia2"/>
																															<br/>
																														</xsl:if>
																														<xsl:if test="$guia3!='-'"><xsl:value-of select="$guia3"/>
																															<br/>
																														</xsl:if>
																														<xsl:if test="$guia4!='-'"><xsl:value-of select="$guia4"/>
																															<br/>
																														</xsl:if>
																														<xsl:if test="$guia5!='-'"><xsl:value-of select="$guia5"/>
																														</xsl:if>
																													</font>
																												</xsl:if>
																											</xsl:for-each>

																											<!--Glosa de percepcion-->
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
																												<xsl:if test="cbc:ID='2001'">
																													<xsl:if test="cbc:PayableAmount!='0'">
																														<font face="Arial, Helvetica, sans-serif" size="2">
																															<strong>OPERACION SUJETA A PERCEPCIÓN DEL IGV</strong>
																														</font>
																													</xsl:if>
																												</xsl:if>
																											</xsl:for-each>
																										</td>
																									</tr>
																								</body>
																							</table>
																						</td>
																					</tr>
																				</xsl:if>
																			</xsl:if>
																		</xsl:for-each>
																		<!--<tr>
									<td COLSPAN="2">&#xA0;</td>
								</tr>-->
																		<tr>
																			<td align="left">
																				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
																					<xsl:if test="cbc:ID='2001'">

																						<xsl:if test="cbc:PayableAmount!='0'">
																							<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="70%">
																								<body>
																									<tr>
																										<td align="center">
																											<font face="Arial, Helvetica, sans-serif" size="2">
																												<strong>Total</strong>
																											</font>
																										</td>
																										<td align="center">
																											<font face="Arial, Helvetica, sans-serif" size="2">
																												<strong>Percepción</strong>
																											</font>
																										</td>
																										<td align="center">
																											<font face="Arial, Helvetica, sans-serif" size="2">
																												<strong>%</strong>
																											</font>
																										</td>
																										<td align="center">
																											<font face="Arial, Helvetica, sans-serif" size="2">
																												<strong>Total mas Percep.</strong>
																											</font>
																										</td>
																									</tr>
																									<tr>
																										<td align="center">
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='21'">
																													<font face="Arial, Helvetica, sans-serif" size="2">
																														<xsl:value-of select="pe:Valor"/>
																													</font>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='21'">
																													<font face="Arial, Helvetica, sans-serif" size="2">
																														<xsl:value-of select="pe1:Valor"/>
																													</font>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='21'">
																													<font face="Arial, Helvetica, sans-serif" size="2">
																														<xsl:value-of select="pe2:Valor"/>
																													</font>
																												</xsl:if>
																											</xsl:for-each>
																										</td>
																										<td align="center">
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
																												<xsl:if test="cbc:ID='2001'">
																													<font face="Arial, Helvetica, sans-serif" size="2">
																														<xsl:value-of select="cbc:PayableAmount "/>
																													</font>
																												</xsl:if>
																											</xsl:for-each>
																										</td>
																										<td align="center">
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																												<xsl:if test="pe:Codigo='22'">
																													<font face="Arial, Helvetica, sans-serif" size="2">
																														<xsl:value-of select="pe:Valor"/>
																													</font>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																												<xsl:if test="pe1:Codigo='22'">
																													<font face="Arial, Helvetica, sans-serif" size="2">
																														<xsl:value-of select="pe1:Valor"/>
																													</font>
																												</xsl:if>
																											</xsl:for-each>
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																												<xsl:if test="pe2:Codigo='22'">
																													<font face="Arial, Helvetica, sans-serif" size="2">
																														<xsl:value-of select="pe2:Valor"/>
																													</font>
																												</xsl:if>
																											</xsl:for-each>
																										</td>
																										<td align="center">
																											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
																												<xsl:if test="cbc:ID='2001'">
																													<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
																														<xsl:value-of select="sac:TotalAmount "/>
																													</font>
																												</xsl:if>
																											</xsl:for-each>
																										</td>
																									</tr>
																								</body>
																							</table>
																						</xsl:if>
																					</xsl:if>
																				</xsl:for-each>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</td>
														</tr>
													</tbody>
												</table>
											</xsl:template>

											<xsl:template name="Datosadicionales">
												<table cellSpacing="0" cellPadding="0" width="100%" border="1">
													<tbody>
														<tr>
															<td width="30%">
																<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
																	<xsl:if test="cbc:ID='2001'">
																		<xsl:if test="cbc:PayableAmount!='0'">
																			<font face="Arial, Helvetica, sans-serif" size="2">
																				<strong>OPERACION SUJETA A PERCEPCIÓN DEL IGV (2%)</strong>
																			</font>
																		</xsl:if>
																	</xsl:if>
																</xsl:for-each>
															</td>

															<td width="12%" align="right">
																<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
																		<xsl:if test="cbc:ID='2001'">
																			<xsl:value-of select="format-number(cbc:PayableAmount,'###.###.##0,00','pen')"/>
																		</xsl:if>
																	</xsl:for-each>
																</font>
															</td>

															<td width="11%">
															</td>
															<td width="47%">
																<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
																	<strong>Por. Resol. SUNAT 013-2006. Somos agentes de Percepción</strong>
																</font>
															</td>
														</tr>

														<tr>
															<td width="30%">
																<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
																	<!--DETRACCION:-->
																</font>
															</td>
															<td width="12%" align="right">
																<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																		<xsl:if test="pe:Codigo='10'">
																			<xsl:value-of select="format-number(pe:Valor,'###.###.###,##','pen')"/>
																		</xsl:if>
																	</xsl:for-each>
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
																		<xsl:if test="pe1:Codigo='10'">
																			<xsl:value-of select="format-number(pe1:Valor,'###.###.###,##','pen')"/>
																		</xsl:if>
																	</xsl:for-each>
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
																		<xsl:if test="pe2:Codigo='10'">
																			<xsl:value-of select="format-number(pe2:Valor,'###.###.###,##','pen')"/>
																		</xsl:if>
																	</xsl:for-each>
																</font>
															</td>
															<td width="11%">
															</td>

															<td width="47%">
																<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
																	<strong>Por. Resol. SUNAT 307-2002. Somos agentes de Retención. No somos afectos al 6%</strong>
																</font>
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
													<head/>
													<body/>
												</html>
											</xsl:template>
										</xsl:stylesheet>
										<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="ff12_xml\20261180937&#x2D;07&#x2D;FF12&#x2D;00000084.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"><block path="table/td/font/xsl:for&#x2D;each" x="410" y="60"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if/=[0]" x="314" y="88"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if" x="360" y="90"/><block path="table/td/font/xsl:for&#x2D;each[1]" x="300" y="30"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="204" y="58"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if" x="250" y="60"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/xsl:value&#x2D;of" x="320" y="90"/><block path="table/td/font/xsl:for&#x2D;each[2]" x="340" y="30"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="84" y="58"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if" x="130" y="60"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/xsl:value&#x2D;of" x="200" y="90"/></template><template name="Total"><block path="table/tr/td[1]/font/xsl:for&#x2D;each" x="340" y="27"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="44" y="55"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="90" y="57"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="160" y="87"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="260" y="27"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="15"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="410" y="17"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="40" y="87"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="20" y="27"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="84" y="15"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="130" y="17"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="200" y="47"/><block path="table/xsl:for&#x2D;each" x="300" y="27"/><block path="table/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="55"/><block path="table/xsl:for&#x2D;each/xsl:if" x="410" y="57"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="314" y="85"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if" x="360" y="87"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="360" y="127"/><block path="table/xsl:if/!=[0]" x="274" y="85"/><block path="table/xsl:if" x="320" y="87"/><block path="table/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="400" y="127"/><block path="table/xsl:for&#x2D;each[1]" x="280" y="87"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="15"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if" x="90" y="17"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="320" y="127"/><block path="table/xsl:for&#x2D;each[2]" x="240" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="95"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if" x="90" y="97"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="280" y="127"/><block path="table/xsl:for&#x2D;each[3]" x="200" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/!=[0]" x="124" y="135"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if" x="170" y="137"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="240" y="127"/><block path="table/tr[3]/td[1]/xsl:if/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if/font/xsl:value&#x2D;of" x="40" y="127"/><block path="table/tr[3]/td[1]/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if[1]" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if[1]/font/xsl:value&#x2D;of" x="360" y="87"/><block path="table[1]/tr/td/xsl:if/=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if" x="360" y="87"/><block path="table[1]/tr/td/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if[1]" x="360" y="87"/></template><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->