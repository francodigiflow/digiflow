<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:template name="tmpImporteLetras">
		<table style="border: 1px solid black; border-collapse: collapse;" rules="groups" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<thead style="border: 1px solid black;">
			<tr>
				<th align="left" width="100%" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">
						SON :
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
				</th>
			</tr>
			</thead>
		</table>
	</xsl:template>
	<!--<xsl:template name="tmpPieComprobante_FB">-->
		<!--<table border="0" width="100%">
			<tr>
				<td width="100%" valign="top" align="justify">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='08' and pe:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='08' and pe1:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe1:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='08' and pe2:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe2:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td width="100%" valign="top" align="justify">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='09' and pe:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='09' and pe1:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe1:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='09' and pe2:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe2:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
			<tr>-->
				<!--<td width="100%" valign="top" align="justify">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='10' and pe:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='10' and pe1:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe1:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='10' and pe2:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe2:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
				</td>-->
		<!--	</tr>
		</table>-->
	<!--</xsl:template>-->
	<xsl:template name="tmpPieComprobante_NCND">
		<table border="0" width="100%">
			<tr>
				<td width="100%" valign="top" align="justify">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='08' and pe:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='08' and pe1:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe1:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='08' and pe2:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe2:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td width="100%" valign="top" align="justify">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='09' and pe:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='09' and pe1:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe1:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='09' and pe2:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe2:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td width="100%" valign="top" align="justify">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='10' and pe:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='10' and pe1:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe1:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='10' and pe2:Valor!='-'">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="pe2:Valor"/>
							</font>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="tmpTotal">
		<table border="0" width="99%" cellpadding="0" cellspacing="0">
			<td width="48%" align="center" valign="top" >
				<xsl:call-template name="bottom_hash"/>
			</td>
			<td width="12%" align="center" valign="top">
				<table width="100%">
					<tr>
						<td width="10%" rowspan="10">
							<strong>
								<font face="Arial, Helvetica, sans-serif" ></font>
							<img width="135" height="135" align="center" src="data:image/*;base64,[ted_1]" />
								
							</strong>
						</td>
					</tr>
				</table>
			</td>
			<!-- <td width="1%"> -->
			<!-- </td> -->
			<td width="33%" align="center">
				<table style="border: 1px solid black; border-collapse: collapse" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000" heigth="100%">
					<xsl:variable name="TotalDescuento">
						<xsl:value-of select="0"/>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='2005'">
								<xsl:value-of select="cbc:PayableAmount"/>
							</xsl:if>
						</xsl:for-each>
					</xsl:variable>
					<tr>
						<td width="20%" align="left">
							<font color="BLACK" face="Arial, Helvetica, sans-serif" size="1">OPERACIÓN GRAVADA</font>
						</td>
						<td width="5%" align="left">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
							</font>
						</td>
						<td width="20%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID = '1001'">
												<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.1'">
										<xsl:variable name="OpeIGV_FEL">

											<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0.00'">

												<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
													<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
														<xsl:value-of select="format-number(cbc:TaxableAmount,'###,###,##0.00', 'pen')"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>


											<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
													<xsl:value-of select="format-number(cbc:TaxableAmount,'###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:for-each>

											<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
													<xsl:value-of select="format-number(cbc:TaxableAmount,'###,###,##0.00', 'pen')"/>
													<xsl:if test="cbc:TaxableAmount = ''">
														<xsl:value-of select="0.00"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</xsl:variable>
										<xsl:if test="$OpeIGV_FEL=''">0.00</xsl:if>
										<xsl:if test="$OpeIGV_FEL!=0.00">
											<xsl:value-of select="$OpeIGV_FEL"/>&#xA0;
										</xsl:if>
									</xsl:if>
							</font>
						</td>
					</tr>
					<tr>
						<td width="20%" align="left">
							<font color="BLACK" face="Arial, Helvetica, sans-serif" size="1">OPERACIÓN INAFECTA</font>
						</td>
						<td width="5%" align="left">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
							</font>
						</td>
						<td width="20%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1002'">
									<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>

						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:value-of select="format-number($OPInafecta21,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
							</font>
						</td>
					</tr>
					<tr>
						<td width="10%" align="left">
							<font color="BLACK" face="Arial, Helvetica, sans-serif" size="1">OPERACIÓN EXONERADA</font>
						</td>
						<td width="5%" align="left">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
							</font>
						</td>
						<td width="20%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1003'">
									<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:value-of select="format-number($OPExonerada21,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:if>
							</font>
						</td>
					</tr>
					<tr>
						<td width="10%" align="left">
							<font color="BLACK" face="Arial, Helvetica, sans-serif" size="1">OPERACIÓN GRATUITA</font>
						</td>
						<td width="5%" align="left">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
							</font>
						</td>
						<td width="20%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:variable name="TotalGratuito">
									<xsl:value-of select="0.00"/>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1004'">
											<xsl:if test="cbc:PayableAmount!='0.00'">
												<xsl:value-of select="cbc:PayableAmount"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>
								<xsl:value-of select="format-number($TotalGratuito,'###,###,##0.00','pen')"/>

				</xsl:if>
				<xsl:if test="//cbc:UBLVersionID='2.1'">
<xsl:variable name="OpeGrat">
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

										<!--<xsl:if select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
				<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
			</xsl:if>
		</xsl:if>-->

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

									<xsl:value-of select="format-number($OpeGrat, '###,###,##0.00', 'pen')"/>&#xA0;
									</xsl:if>

							</font>
						</td>
					</tr>
					<tr>
						<td width="10%" align="left">
							<font color="BLACK" face="Arial, Helvetica, sans-serif" size="1">DETRACCIÓN</font>
						</td>
						<td width="5%" align="left">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								
							</font>
						</td>
						<td width="20%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:variable name="Detraccion">
									<xsl:value-of select="0.00"/>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='2003'">
											<xsl:if test="cbc:PayableAmount!='0.00'">
												<xsl:value-of select="cbc:PayableAmount"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>
								<xsl:value-of select="format-number($Detraccion,'###,###,##0.00','pen')"/>

								</xsl:if>
								<xsl:if test="//cbc:UBLVersionID='2.1'">
									<!-- MONTO DE DETRACCIÓN -->
				<xsl:variable name="DetraMonto">

				<xsl:variable name="Porcentaje">
					<xsl:value-of select="format-number(//cac:PaymentTerms/cbc:PaymentPercent,'###,###,###0.00','pen')"/>
				</xsl:variable> <!--div 100-->
				<xsl:variable name="Total">
				<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:PayableAmount"/>
				<!--<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,###0.00','pen')"/>-->
					</xsl:variable><!--$Porcentaje*-->
					<!--<xsl:value-of select="format-number($Total,'###,###,##0.00','pen')"/>-->
					<xsl:value-of select="$Total*$Porcentaje div 100"/>
					<!--<xsl:value-of select="format-number($Total,'###,###,###.00','pen')"/>-->
					<!--<xsl:value-of select="format-number(12 * //cac:LegalMonetaryTotal/cbc:PayableAmount div 100,'###,###,###.00','pen')"/>-->
					
				</xsl:variable>
					<xsl:choose>
						<xsl:when test="/pe:Invoice">
							<xsl:if test="$DetraMonto=''">0.00</xsl:if>
							<xsl:value-of select="format-number($DetraMonto,'###,###,###.00','pen')"/>&#xA0;

						</xsl:when>
						<xsl:when test="/pe1:CreditNote">
							0.00&#xA0;
						</xsl:when>
						<xsl:otherwise>
							0.00&#xA0;
						</xsl:otherwise>
					</xsl:choose>
				
				<!--<choose>
				<xsl:when test="$DetraMonto=''">0.00</xsl:when>
				<xsl:when test="$DetraMonto='NaN'">0.00</xsl:when>
				<xsl:otherwise><xsl:value-of select="format-number($DetraMonto,'###,###,###.00','pen')"/>&#xA0;</xsl:otherwise>
				</choose>-->

			</xsl:if>

							</font>
						</td>
					</tr>
					<tr>
						<td width="10%" align="left">
							<font color="BLACK" face="Arial, Helvetica, sans-serif" size="1">PERCEPCIÓN</font>
						</td>
						<td width="5%" align="left">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
							</font>
						</td>
						<td width="20%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:variable name="Percepcion">
									<xsl:value-of select="0.00"/>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID = '2001'">
											<xsl:if test="cbc:PayableAmount!='0.00'">
												<xsl:value-of select="cbc:PayableAmount"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>
								<xsl:value-of select="format-number($Percepcion,'###,###,##0.00','pen')"/>&#xA0;
							</font>
						</td>
					</tr>
<tr>
<td width="10%" align="left">
							<font color="BLACK" face="Arial, Helvetica, sans-serif" size="1">DESCUENTO GLOBAL</font>
						</td>
						<td width="5%" align="left">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
							</font>
						</td>
<td width="10%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:choose>
							<xsl:when test="string(number(//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount)) = 'NaN'">0.00</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount">
									<xsl:if test="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount!='0.00'">
										<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount,'###,###,##0.00','pen')"/>&#xA0;
									</xsl:if>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
					</font>
				</td>
				</tr>
					<tr>
						<td width="10%" align="left">
							<font color="BLACK" face="Arial, Helvetica, sans-serif" size="1">DESCUENTO TOTAL</font>
						</td>
						<td width="5%" align="left">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
							</font>
						</td>
						<td width="20%" align="right">
							<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:value-of select="format-number($TotalDescuento,'###,###,##0.00','pen')"/>
				</xsl:if>

				<xsl:if test="//cbc:UBLVersionID='2.1'">

								<xsl:variable name="bc">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='10'">
									<xsl:if test="pe:Valor != '-' or pe:Valor != ''">
										<xsl:value-of select="pe:Valor"/>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='10'">
									<xsl:if test="pe1:Valor != '-' or pe1:Valor != ''">
										<xsl:value-of select="pe1:Valor"/>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='10'">
									<xsl:if test="pe2:Valor != '-' or pe2:Valor != ''">
										<xsl:value-of select="pe2:Valor"/>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>

						<xsl:if test="$bc= '-' or $bc=''">0.00&#xA0;</xsl:if>

						<xsl:if test="$bc >'0.00'">
							<xsl:value-of select="format-number($bc, '###,###,##0.00', 'pen')"/>&#xA0;
						</xsl:if>
			</xsl:if>
							</font>
						</td>
					</tr>
					<tr>
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
							<td width="10%" align="left">
								<font color="black" face="Arial, Helvetica, sans-serif" size="1">
									TOTAL IGV 18%
								</font>
							</td>
							<td width="5%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
									</xsl:choose>
								</font>
							</td>
							<td width="20%" align="right">
								<xsl:variable name="TotalIGV">
									<xsl:value-of select="0"/>
									<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
											<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
											<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
											<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:variable name="IGV">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
									 <xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')" />&#160;
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')" />&#160;
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
									<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
										<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')" />&#160;
									</xsl:if>
								</xsl:for-each>
							</xsl:variable>
							<xsl:value-of select="$IGV" />
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">

						<xsl:variable name="OpeIGVF">
						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:value-of select="format-number(cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:value-of select="format-number(cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:value-of select="format-number(cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
						</xsl:for-each>
					</xsl:variable>
					<xsl:if test="$OpeIGVF=''">0.00&#xA0;</xsl:if>
					<xsl:if test="$OpeIGVF!=0.00">
						<xsl:value-of select="$OpeIGVF"/>
					</xsl:if>
						</xsl:if>
								</font>
							</td>
						</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
							<td width="10%" align="left">
								<font color="BLACK" face="Arial, Helvetica, sans-serif" size="1">
									<!--<xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name"/>-->
									IGV
								</font>
							</td>
							<td width="5%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
									</xsl:choose>
								</font>
							</td>
							<td width="20%" align="right">
								<xsl:variable name="TotalIGV">
									<xsl:value-of select="0"/>
									<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
											<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
											<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
											<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:variable name="IGV">
									<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
										<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID= '1000'">
											<xsl:value-of select="format-number(//cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
											<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
											<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>
								<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
									<!--<xsl:value-of select="format-number($TotalIGV,'###,###,##0.00','pen')"/>-->
								</font>
							</td>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
							<td width="10%" align="left">
								<font color="black" face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
								</font>
							</td>
							<td width="5%" align="left">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
										<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
										<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
										<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
									</xsl:choose>
								</font>
							</td>
							<td width="20%" align="right">
								<xsl:variable name="TotalIGV">
									<xsl:value-of select="0"/>
									<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
											<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
											<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
										<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
											<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="format-number($TotalIGV,'###,###,##0.00','pen')"/>
								</font>
							</td>
						</xsl:for-each>
					</tr>
					<tr>
						<td width="10%" align="left">
							<font color="BLACK" face="Arial, Helvetica, sans-serif" size="1">IMPORTE TOTAL</font>
						</td>
						<td width="5%" align="left">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
									<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
								</xsl:choose>
							</font>
						</td>
						<td width="20%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount != ''">
						<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')" />&#160;
					</xsl:if>
					<!--en notas de debito-->
					<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount != ''">
						<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')" />&#160;
				    </xsl:if>
</font>
						</td>
					</tr>
				</table>
			</td>
		</table>
		
	</xsl:template>





	<xsl:template name="Referencia">
		<!--<table border="0" rules="cols" cellSpacing="0" cellPadding="0" width="100%">-->
		<table width="100%">
			<tbody>
				<tr>
					<td>
						<!--<table border="0" cellSpacing="0" cellPadding="0" width="100%">-->
						<table width="100%">
							<tbody>
								<tr>
									<td width="100%" align="left">
										<xsl:call-template name="tmpImporteLetras"/>
									</td>
								</tr>
								<tr>
									<td width="100%" align="left">
										<br/>
										<xsl:call-template name="tmpMensaje"/>
									</td>
								</tr>
								<tr>
									<td width="100%" align="left">
										<xsl:choose>
											<xsl:when test="/pe:Invoice">
											</xsl:when>
										</xsl:choose>
										<!--<xsl:call-template name="tmpPieComprobante_FB"/>-->
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
	<xsl:template name="DocumentoReferencia">
		<tr width="100%">
			<td width="100%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">DOCUMENTO(S) DE REFERENCIA :</font>
			</td>
		</tr>
		<tr width="100%">
			<td width="100%">
				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1">
					<tbody>
						<tr>
							<td width="60%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>TIPO DOCUMENTO</strong>
								</font>
							</td>
							<td width="40%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CORRELATIVO</strong>
								</font>
							</td>
						</tr>
						<xsl:for-each select="//cac:DespatchDocumentReference">
							<xsl:if test="cbc:DocumentTypeCode != '10' ">
								<tr>
									<td width="60%" align="center">
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
									<td width="40%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
							<xsl:if test="cbc:DocumentTypeCode != '10'">
								<tr>
									<td width="60%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
												<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA ELECT.</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA ELECT.</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO ELECT.</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO ELECT.</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="40%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="tmpMensaje">
		<table border="0" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000" heigth="100%">
			<tr>
				<td width="30%" valign="top">
					
						<b><font face="Arial, Helvetica, sans-serif" size="1">SIRVASE ABONAR A NUESTRA CUENTA CORRIENTE</font></b>
					
				</td>
			</tr>
			<tr>
				<td>
					
						<b><font face="Arial, Helvetica, sans-serif" size="1">CTA BCP $</font></b>
					
				</td>
				<td>
					
						<b><font face="Arial, Helvetica, sans-serif" size="1">193-1183179-1-11</font></b>
					
				</td>
				<td>
					
						<b><font face="Arial, Helvetica, sans-serif" size="1">CCI BCP $</font></b>
					
				</td>
				<td>
					
						<b><font face="Arial, Helvetica, sans-serif" size="1">002-193-001183179111-13</font></b>
				
				</td>
			</tr>
			<tr>
				<td>
					
						<b><font face="Arial, Helvetica, sans-serif" size="1">CTA BCP S/</font></b>
					
				</td>
				<td>
					
						<b><font face="Arial, Helvetica, sans-serif" size="1">193-1179690-0-59</font></b>
					
				</td>
				<td>
					
						<b><font face="Arial, Helvetica, sans-serif" size="1">CCI BCP S/</font></b>
					
				</td>
				<td>
					
						<b><font face="Arial, Helvetica, sans-serif" size="1">002-193-001179690059-12</font></b>
					
				</td>
			</tr>
			<tr>
				<td>
					
						<b><font face="Arial, Helvetica, sans-serif" size="1">CTA BCO NACION</font></b>
					
				</td>
				<td>
					
						<b><font face="Arial, Helvetica, sans-serif" size="1">00-005-157501</font></b>
					
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="DatoAdicional_Detraccion_Retencion">
		<!--<table border="0" width="43%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none" class="tipo2">-->
		
		<table width="50%">
	
			<td align="center" width="100%" colspan="2">
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
					<xsl:if test="pe:Codigo='8' and pe:Valor='D'">
	<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
						<table align="center" style="border: 1px solid black; border-collapse: collapse;" rules="groups" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<thead style="border: 1px solid black;">
							<th align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='2003' and cbc:PayableAmount!='0.00'">
										
											<strong>OPERACIÓN SUJETA A DETRACCIÓN BANCO DE LA NACIÓN</strong>
										</xsl:if>
									</xsl:for-each>
									<br/>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
							
										<xsl:if test="cbc:ID='3001' and cbc:Value!=''">
											<strong>CUENTA: <xsl:value-of select="cbc:Value"/></strong>
										</xsl:if>
									</xsl:for-each>
							

										<xsl:if test="//cbc:UBLVersionID='2.1'">
										<font face="Arial, Helvetica, sans-serif" size="2">
										Operación sujeta a detracción
						<!--<xsl:value-of select="//cbc:Note[@languageLocaleID='2006']"/> --><!--<xsl:value-of select="substring-after(//cbc:Note[@languageLocaleID='2006'],':')"/>-->
							</font>
							</xsl:if>
					<br>	</br>
						
							<xsl:if test="//cbc:UBLVersionID='2.1'" >
						<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode!='01'">
							<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>CUENTA: <xsl:value-of select="//cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID"/></strong>
							</font>
							</xsl:if>
							</xsl:if>

							
								</font>


							</th>
							</thead>
						
						</table>
</xsl:if>
						
					</xsl:if>
				</xsl:for-each>
			</td>
			<tr>
			</tr>
			<td align="center" width="100%" colspan="2">
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
					<xsl:if test="pe:Codigo='40' and pe:Valor='R'">
						<br/>
						<table style="border: 1px solid black; border-collapse: collapse;" rules="groups" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<thead style="border: 1px solid black;">
							<th align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>HEMOS SIDO DESIGNADOS AGENTES DE RETENCION POR R.S. 228-2012/SUNAT</strong><br/><strong>NO RETENER</strong>
									<br/>
								</font>
							</th>
							</thead>
						</table>
					</xsl:if>
				</xsl:for-each>
			</td>
		</table>
	</xsl:template>
	
	
	<xsl:template name="referencias">
		<!--<table border="1" width="43%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none" class="tipo2">-->
		<table width="50%">
			<tbody>
				<tr/>
				<tr>
					<td width="100%" align="center">
										
					<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							
								<xsl:if test="cbc:ID='1004'">
									<table align="center" style="border: 1px solid black; border-collapse: collapse;" rules="groups" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
									<thead style="border: 1px solid black;">
										<th align="center">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>TRANSFERENCIA A TITULO GRATUITO</strong>
											</font>
										</th>

									</thead>
									</table>
									
									
								</xsl:if>
								<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount='0.00'">
									<center>
										<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
											<b>TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE</b>
										</font>
									</center>
								</xsl:if>
								<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0'">
									<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
										<br/>
									</font>
								</xsl:if>
						</xsl:for-each>
						</xsl:if>
						
					<xsl:if test="//cbc:UBLVersionID='2.1'">
							
							
								<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount='0.00'">
									<table align="center" style="border: 1px solid black; border-collapse: collapse;" rules="groups" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
									<thead style="border: 1px solid black;">
										<th align="center">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>TRANSFERENCIA A TITULO GRATUITO</strong>
											</font>
										</th>

									</thead>
									</table>
									<br/>
								
								</xsl:if>
								
						
						</xsl:if>


						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:SUNATTransaction">
							<xsl:if test="cbc:ID='02'">
								<table align="center" style="border: 1px solid black; border-collapse: collapse;" rules="groups" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<thead style="border: 1px solid black;">
									<th align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>EXPORTACION</strong>
										</font>
									</th>
									</thead>
								</table>
								<br/>
								
							</xsl:if>
						</xsl:for-each>
						<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
							<table align="center" style="border: 1px solid black; border-collapse: collapse;" rules="groups" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<thead style="border: 1px solid black;">
								<th width="100%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>MOTIVO/SUSTENTO:</strong>
									</font>
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>
											<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
										</strong>
									</font>
								</th>
								</thead>
							</table>
						</xsl:if>
						<br/>
						<br/>
						<xsl:if test="/pe2:DebitNote">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<b/>Operación (CIIU 7421) Sujeta al Sistema de Pago de Detracciones <xsl:value-of select="cbc:Percent"/>%
										<br/>D. LEG. N° 940 R. DE SUPERINTENDENCIA N° 056-2006/SUNAT (02-04-2006)
										<br/>BANCO DE LA NACIÓN CTA. CTE. N° XXXX
										<br/>
										<br/>
									</font>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Swift">
		<!--<table border="0" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000" heigth="100%">-->
		<table width="100%">
			<tr>
				<td width="10%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">COMPANY</font>
					
				</td>
				<td width="90%">
					
						
						<font face="Arial, Helvetica, sans-serif" size="1">
							BELLTECH PERU S.A.C.
						
						</font>
					
				</td>
				</tr>
				<tr>
				<td width="10%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">Account US$</font>
					
				</td>
				<td width="90%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">
							193-1183179-1-11
						</font>
					
				</td>
			</tr>
			<tr>
				<td width="10%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">SWIFT</font>
					
				</td>
				<td width="90%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">
							BCPLPEPL
						</font>
					
				</td>
				</tr>
				<tr>
				<td width="10%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">BANK</font>
					
				</td>
				<td width="90%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">
							BANCO DE CRÉDITO DEL PERU
						</font>
					
				</td>
			</tr>
			<tr>
				<td width="10%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">ADDRESS</font>
					
				</td>
				<td width="90%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">
							Av. Las Camelias 750 San Isidro L27 Lima
						</font>
					
				</td>
			</tr>
			<tr>
				<td width="10%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">PHONE</font>
					
				</td>
				<td width="90%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">
							+51 1 311-9999
						</font>
					
				</td>
			</tr>
			<tr>
				<td width="10%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">CONTACT BANK</font>
					
				</td>
				<td width="90%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">
							Eva Zapata Alarcón
						</font>
					
				</td>
			</tr>
			
		</table>
		<br/>
	</xsl:template>

<xsl:variable name="OPGravada21">

		<xsl:value-of select="0.00"/>

		<!--xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID = '1001'">
				<xsl:value-of select="cbc:PayableAmount"/>&#xA0;</xsl:if>
		</xsl:for-each-->

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
<xsl:variable name="OPExonerada21">
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
<xsl:variable name="OPInafecta21">
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
	<xsl:template name="descripcion_datos">
        <xsl:param name="resto"/> 
         <br/><xsl:value-of select="substring-before($resto,'|')"/>
         <xsl:variable name="res" select="substring-after($resto,'|')"/>
        <xsl:if test="$res!=''">
            <xsl:call-template name="descripcion_datos">
                <xsl:with-param name="resto" select="$res"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template> 
	<xsl:template name="detalle_cantidad">
        <xsl:param name="resto"/> 
         <br/><xsl:value-of select="substring-before($resto,'|')"/>
         <xsl:variable name="res" select="substring-after($resto,'|')"/>
        <xsl:if test="$res!=''">
            <xsl:call-template name="detalle_cantidad">
                <xsl:with-param name="resto" select="$res"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template> 
	<xsl:template name="detalle_descripcion">
        <xsl:param name="resto"/> 
         <br/><xsl:value-of select="substring-before($resto,'|')"/>
         <xsl:variable name="res" select="substring-after($resto,'|')"/>
        <xsl:if test="$res!=''">
            <xsl:call-template name="detalle_descripcion">
                <xsl:with-param name="resto" select="$res"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template> 
<xsl:template name="detalle_precio">
        <xsl:param name="resto"/> 
         <br/><xsl:value-of select="substring-before($resto,'|')"/>
         <xsl:variable name="res" select="substring-after($resto,'|')"/>
        <xsl:if test="$res!=''">
            <xsl:call-template name="detalle_precio">
                <xsl:with-param name="resto" select="$res"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template> 
	<xsl:template name="detalle_valor">
        <xsl:param name="resto"/> 
         <br/><xsl:value-of select="substring-before($resto,'|')"/>
         <xsl:variable name="res" select="substring-after($resto,'|')"/>
        <xsl:if test="$res!=''">
            <xsl:call-template name="detalle_valor">
                <xsl:with-param name="resto" select="$res"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template> 
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20504747981&#x2D;07&#x2D;F002&#x2D;00000113.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->