<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="son-pesos">
		<table border="0" width="65%">
			<tr>
				<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>SON :</strong>

						<xsl:variable name="son">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='03'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='03'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='03'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>

						<xsl:choose>
							<xsl:when test="//cbc:Note[@languageLocaleID='1000']">
								<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']"/>
							</xsl:when>

							<xsl:otherwise>
								<xsl:value-of select="$son"/>
							</xsl:otherwise>
						</xsl:choose>
					</font>
				</td>
			</tr>
			<tr>
				<td>
					<font face="Arial, Helvetica, sans-serif" size="1">
						<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
							<xsl:if test="cbc:ID='2001'">
								<b>"BIENES TRANSFERIDOS EN LA AMAZONÍA PARA SER CONSUMIDOS EN LA MISMA"</b>
							</xsl:if>
						</xsl:for-each>-->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='10'">
								<b>
									<xsl:value-of select="pe:Valor"/>
								</b>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='10'">
								<b>
									<xsl:value-of select="pe1:Valor"/>
								</b>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='10'">
								<b>
									<xsl:value-of select="pe2:Valor"/>
								</b>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>

			<tr>
				<td align="left" width="100%">
					<!--<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">-->
					<xsl:variable name="DatoAdicional4">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='04'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</xsl:variable>
					<xsl:if test="$DatoAdicional4 != '' and $DatoAdicional4 !='-' ">
						<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" rules="none">
							<tbody>
								<tr>
									<td width="65%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='04'">
													<xsl:if test="pe:Valor !='-'">
														<xsl:value-of select="substring-before(pe:Valor,'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='04'">
												<xsl:if test="pe2:Valor !='-'">
													 <xsl:value-of select="substring-before(pe2:Valor,'|')"/> 
											    </xsl:if>
											</xsl:if>
										</xsl:for-each>	-->
										</font>
									</td>
								</tr>
								<tr>
									<td width="65%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='04'">
													<xsl:if test="pe:Valor !='-'">
														<xsl:value-of select="substring-after(pe:Valor,'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='04'">
												<xsl:if test="pe2:Valor !='-'">
													 <xsl:value-of select="substring-after(pe2:Valor,'|')"/> 
												 
												</xsl:if>
											</xsl:if>
										</xsl:for-each>	-->
										</font>
									</td>
								</tr>
								<tr>

									<td width="65%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='05'">
													<xsl:if test="pe:Valor !='-'">
														<xsl:value-of select="substring-before(pe:Valor,'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											   <xsl:if test="pe2:Codigo='05'">
													<xsl:if test="pe2:Valor !='-'">
														<xsl:value-of select="substring-before(pe2:Valor,'|')"/> 
													</xsl:if>
												</xsl:if>
										</xsl:for-each>-->
										</font>
									</td>
								</tr>
								<tr>

									<td width="65%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='05'">
													<xsl:if test="pe:Valor !='-'">
														<xsl:value-of select="substring-before(substring-after(pe:Valor,'|'),'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo='05'">
														<xsl:if test="pe2:Valor !='-'">
															 <xsl:value-of select="substring-before(substring-after(pe2:Valor,'|'),'|')"/> 
														</xsl:if>
													</xsl:if>
											</xsl:for-each>	-->
										</font>
									</td>
								</tr>
								<tr>

									<td width="65%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='05'">
													<xsl:if test="pe:Valor !='-'">
														<xsl:value-of select="substring-after(substring-after(pe:Valor,'|'),'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												 <xsl:if test="pe2:Codigo='05'">
													<xsl:if test="pe2:Valor !='-'">
															<xsl:value-of select="substring-after(substring-after(pe2:Valor,'|'),'|')"/>  
													</xsl:if>
												 </xsl:if>
											</xsl:for-each>	-->
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<!--</xsl:for-each>-->
					<xsl:variable name="DatoAdicional04">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='04'">
								<xsl:if test="pe2:Valor !='-'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
					</xsl:variable>
					<xsl:if test="$DatoAdicional04 != '' and $DatoAdicional04 !='-' ">
						<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" rules="none">
							<tbody>
								<tr>
									<td width="65%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='04'">
													<xsl:if test="pe2:Valor !='-'">
														<xsl:value-of select="substring-before(pe2:Valor,'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="65%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='04'">
													<xsl:if test="pe2:Valor !='-'">
														<xsl:value-of select="substring-after(pe2:Valor,'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="65%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='05'">
													<xsl:if test="pe2:Valor !='-'">
														<xsl:value-of select="substring-before(pe2:Valor,'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="65%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='05'">
													<xsl:if test="pe2:Valor !='-'">
														<xsl:value-of select="substring-before(substring-after(pe2:Valor,'|'),'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="65%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='05'">
													<xsl:if test="pe2:Valor !='-'">
														<xsl:value-of select="substring-after(substring-after(pe2:Valor,'|'),'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</td>
			</tr>
		</table>
		<br/>
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

	<xsl:variable name="DescuentoGlobal">
		<xsl:value-of select="0"/>
		<xsl:if test="/pe:Invoice/cac:AllowanceCharge/cbc:Amount!='' and /pe:Invoice/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='02'">
		<!--<xsl:if test="cac:AllowanceCharge/cbc:Amount">-->
			<xsl:value-of select="/pe:Invoice/cac:AllowanceCharge/cbc:Amount"/>
		</xsl:if>
		<xsl:if test="/pe1:CrediNote/cac:AllowanceCharge/cbc:Amount!='' and /pe1:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='02'">
		<!--<xsl:if test="cac:AllowanceCharge/cbc:Amount">-->
			<xsl:value-of select="/pe1:CreditNote/cac:AllowanceCharge/cbc:Amount"/>
		</xsl:if>
	</xsl:variable>

	<xsl:template name="Total">

		<table border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000" heigth="100%">

			<!--TOTAL GRAVADO-->
			<tr>
				<td width="55%" align="left" bgcolor="#C4BD97">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total Gravado</strong>
					</font>
				</td>
				<td width="45%" align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="format-number($OPGravada+$DescuentoGlobal,'###,###,##0.00','pen')"/>&#xA0;
					</font>
				</td>
			</tr>
			<!--TOTAL NO GRAVADO-->
			<tr>
				<td bgcolor="#C4BD97">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total No Gravado</strong>
					</font>
				</td>
				<td align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='1002'">
								<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
						</xsl:for-each>-->

						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1002'">
									<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</xsl:if>

						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
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
						</xsl:if>
					</font>
				</td>
			</tr>
			<!--TOTAL EXONERADO-->
			<tr>
				<td bgcolor="#C4BD97">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total Exonerado</strong>
					</font>
				</td>
				<td align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='1003'">
								<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
						</xsl:for-each>-->

						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1003'">
									<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
						</xsl:if>

						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
							</xsl:for-each>

							<xsl:variable name="Exonerado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								</xsl:for-each>

								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								</xsl:for-each>

								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								</xsl:for-each>
							</xsl:variable>

							<xsl:if test="$Exonerado = ''">0.00&#xA0;</xsl:if>
						</xsl:if>
					</font>
				</td>
			</tr>
			<!--TOTAL DESCUENTO-->
			<tr>
				<td bgcolor="#C4BD97">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total Descuento</strong>
					</font>
				</td>
				<td align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="format-number($DescuentoGlobal,'###,###,##0.00','pen')"/>&#xA0;
					</font>
				</td>
			</tr>
			<!--TOTAL OTROS CARGOS-->
			<tr>
				<td bgcolor="#C4BD97">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Total Otros Cargos</strong>
					</font>
				</td>
				<td align="right">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:choose>
								<xsl:when test="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount!=''">
									<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="format-number('0.00','###,###,##0.00','pen')"/>&#xA0;</xsl:otherwise>
							</xsl:choose>
						</xsl:if>

						<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:variable name="Cargo">
								<xsl:for-each select="//cac:AllowanceCharge">
								<xsl:if test="cbc:ChargeIndicator='true'">
									<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>&#xA0;
								</xsl:if>
								</xsl:for-each>
							</xsl:variable>

							<xsl:if test="$Cargo = ''">0.00</xsl:if>
							<xsl:for-each select="//cac:AllowanceCharge">
							<!--<xsl:choose>-->
								<xsl:if test="cbc:Amount!='' and cbc:AllowanceChargeReasonCode='46'">
									<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
								<!--<xsl:otherwise>
									<xsl:value-of select="format-number('0.00','###,###,##0.00','pen')"/>&#xA0;</xsl:otherwise>-->
							<!--</xsl:choose>-->
							</xsl:for-each>
							
						</xsl:if>
					</font>
				</td>
			</tr>
			<xsl:choose>
				<!--<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">
					<tr>-->
				<xsl:when test="//cbc:Note/@languageLocaleID='1002'">
					<tr>
						<td bgcolor="#C4BD97">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<strong>Total Retiro</strong>
							</font>
						</td>

						<!-- Total Gratuito -->

						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
								<xsl:if test="cbc:ID='1002'">
									<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'or /pe:Invoice/cbc:InvoiceTypeCode='03'">
										<td align="right">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
													<xsl:if test="cbc:ID='1004'">
														<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
												</xsl:for-each>
											</font>
										</td>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="//pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										<!--<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;-->
										<td align="right">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</font>
										</td>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										<td align="right">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</font>
										</td>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="cbc:TaxableAmount!='0.00' or cbc:TaxableAmount!='0'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</tr>
				</xsl:when>
			</xsl:choose>
			<!--TOTAL igv-->
			<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
				<tr>
					<td bgcolor="#C4BD97">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Total IGV 18%</strong>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:if>
								
							<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
								<!--<xsl:choose>
									<xsl:when test="//cbc:Note/@languageLocaleID='1002'">
										<xsl:for-each select="//pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
												<xsl:if test="cbc:TaxAmount!='0.00' or cbc:TaxAmount!='0'">
													<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
									</xsl:otherwise>
								</xsl:choose>-->
							</xsl:if>
							
						</font>
					</td>
				</tr>
			</xsl:for-each>
			<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
				<tr>
					<td bgcolor="#C4BD97">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Total IGV 18%</strong>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:if>

							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:choose>
									<xsl:when test="//cbc:Note/@languageLocaleID='1002'">
										<xsl:for-each select="//pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
												<xsl:if test="cbc:TaxAmount!='0.00' or cbc:TaxAmount!='0'">
													<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</font>
					</td>
				</tr>
			</xsl:for-each>
			<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
				<tr>
					<td bgcolor="#C4BD97">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Total IGV 18%</strong>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:if>

							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:choose>
									<xsl:when test="//cbc:Note/@languageLocaleID='1002'">
										<xsl:for-each select="//pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
												<xsl:if test="cbc:TaxAmount!='0.00' or cbc:TaxAmount!='0'">
													<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</font>
					</td>
				</tr>
			</xsl:for-each>

			<tr>
				<td bgcolor="#C4BD97">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Importe Total</strong>
					</font>
				</td>
				<td align="right">
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:call-template name="SimboloMoneda"/>&#xA0;
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
					</xsl:if>
					<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:call-template name="SimboloMoneda"/>&#xA0;
							<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
					</xsl:if>
				</td>
			</tr>
		</table>

		<table border="0" width="100%" cellpadding="1">
			<tr>
				<td>
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount='0'">
						<center>
							<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
								<b>TRANSFERENCIA GRATUITA</b>
							</font>
						</center>
					</xsl:if>
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0'">
						<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
						</font>
					</xsl:if>
				</td>
			</tr>
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
						<xsl:if test="/pe1:CreditNote">
							<tr>
								<td width="100%" align="left">
									<xsl:call-template name="DocumentoReferencia"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
							<tr>
								<td width="100%" align="left">
									<xsl:call-template name="DocumentoReferencia"/>
								</td>
							</tr>
						</xsl:if>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="DocumentoReferencia">
		<tr>
			<td width="65%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">DOCUMENTO(S) DE REFERENCIA :</font>
			</td>
		</tr>

		<tr>
			<td width="65%">
				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="65%">
					<tbody>
						<tr width="65%">
							<td width="25%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Tipo Documento</strong>
								</font>
							</td>
							<td width="20%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Correlativo</strong>
								</font>
							</td>
							<td width="20%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Fecha Emisión</strong>
								</font>
							</td>
						</tr>
						<xsl:variable name="i" select="1"/>

						<xsl:for-each select="//cac:DespatchDocumentReference">
							<xsl:if test="cbc:DocumentTypeCode != '10'">
								<tr width="65%">
									<td width="25%" align="center">
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
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
							<xsl:if test="cbc:DocumentTypeCode != '10'">
								<tr width="65%">
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
												<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<!--<xsl:call-template name="Dato09">
												<xsl:with-param name="var" select="position()" />
											</xsl:call-template>-->

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
											<!--<xsl:call-template name="Dato09">
												<xsl:with-param name="var" select="position()" />
											</xsl:call-template>-->
										</font>
									</td>
								</tr>
							</xsl:if>
							<!--
							<xsl:variable name="i" select="$i + 1" />-->
						</xsl:for-each>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>&#xA0;</tr>
		<tr>
			<td>
				<xsl:choose>
					<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
						<font size="1" face="Arial, Helvetica, sans-serif"/>
					</xsl:when>
					<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
						<font size="1" face="Arial, Helvetica, sans-serif"></font>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="/pe1:CreditNote">
							<font size="1" face="Arial, Helvetica, sans-serif">
								<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong>
							</font>
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
							<font size="1" face="Arial, Helvetica, sans-serif">
								<strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong>
							</font>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="Dato09">
		<xsl:param name="var"/>

		<xsl:variable name="varvar">
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
				<xsl:if test="pe1:Codigo = '09'">
					<xsl:value-of select="pe1:Valor"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
				<xsl:if test="pe2:Codigo = '09'">
					<xsl:value-of select="pe2:Valor"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>

		<xsl:variable name="linea1">
			<xsl:value-of select="substring-before($varvar, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto1">
			<xsl:value-of select="substring-after($varvar, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea2">
			<xsl:value-of select="substring-before($resto1, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto2">
			<xsl:value-of select="substring-after($resto1, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea3">
			<xsl:value-of select="substring-before($resto2, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto3">
			<xsl:value-of select="substring-after($resto2, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea4">
			<xsl:value-of select="substring-before($resto3, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto4">
			<xsl:value-of select="substring-after($resto3, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea5">
			<xsl:value-of select="substring-before($resto4, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto5">
			<xsl:value-of select="substring-after($resto4, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea6">
			<xsl:value-of select="substring-before($resto5, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto6">
			<xsl:value-of select="substring-after($resto5, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea7">
			<xsl:value-of select="substring-before($resto6, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto7">
			<xsl:value-of select="substring-after($resto6, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea8">
			<xsl:value-of select="substring-before($resto7, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto8">
			<xsl:value-of select="substring-after($resto7, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea9">
			<xsl:value-of select="substring-before($resto8, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto9">
			<xsl:value-of select="substring-after($resto8, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea10">
			<xsl:value-of select="substring-before($resto9, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto10">
			<xsl:value-of select="substring-after($resto9, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea11">
			<xsl:value-of select="substring-before($resto10, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto11">
			<xsl:value-of select="substring-after($resto10, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea12">
			<xsl:value-of select="substring-before($resto11, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto12">
			<xsl:value-of select="substring-after($resto11, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea13">
			<xsl:value-of select="substring-before($resto12, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto13">
			<xsl:value-of select="substring-after($resto12, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea14">
			<xsl:value-of select="substring-before($resto13, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto14">
			<xsl:value-of select="substring-after($resto13, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea15">
			<xsl:value-of select="substring-before($resto14, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto15">
			<xsl:value-of select="substring-after($resto14, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea16">
			<xsl:value-of select="substring-before($resto15, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto16">
			<xsl:value-of select="substring-after($resto15, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea17">
			<xsl:value-of select="substring-before($resto16, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto17">
			<xsl:value-of select="substring-after($resto16, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea18">
			<xsl:value-of select="substring-before($resto17, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto18">
			<xsl:value-of select="substring-after($resto17, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea19">
			<xsl:value-of select="substring-before($resto18, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto19">
			<xsl:value-of select="substring-after($resto18, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea20">
			<xsl:value-of select="substring-before($resto19, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto20">
			<xsl:value-of select="substring-after($resto19, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea21">
			<xsl:value-of select="substring-before($resto20, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto21">
			<xsl:value-of select="substring-after($resto20, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea22">
			<xsl:value-of select="substring-before($resto21, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto22">
			<xsl:value-of select="substring-after($resto21, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea23">
			<xsl:value-of select="substring-before($resto22, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto23">
			<xsl:value-of select="substring-after($resto22, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea24">
			<xsl:value-of select="substring-before($resto23, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto24">
			<xsl:value-of select="substring-after($resto23, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea25">
			<xsl:value-of select="substring-before($resto24, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto25">
			<xsl:value-of select="substring-after($resto24, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea26">
			<xsl:value-of select="substring-before($resto25, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto26">
			<xsl:value-of select="substring-after($resto25, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea27">
			<xsl:value-of select="substring-before($resto26, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto27">
			<xsl:value-of select="substring-after($resto26, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea28">
			<xsl:value-of select="substring-before($resto27, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto28">
			<xsl:value-of select="substring-after($resto27, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea29">
			<xsl:value-of select="substring-before($resto28, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto29">
			<xsl:value-of select="substring-after($resto28, '|')"/>
		</xsl:variable>
		<xsl:variable name="linea30">
			<xsl:value-of select="substring-before($resto29, '|')"/>
		</xsl:variable>
		<xsl:variable name="resto30">
			<xsl:value-of select="substring-after($resto29, '|')"/>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$var = '1'">
				<xsl:value-of select="$linea1"/>
			</xsl:when>
			<xsl:when test="$var = '2'">
				<xsl:value-of select="$linea2"/>
			</xsl:when>
			<xsl:when test="$var = '3'">
				<xsl:value-of select="$linea3"/>
			</xsl:when>
			<xsl:when test="$var = '4'">
				<xsl:value-of select="$linea4"/>
			</xsl:when>
			<xsl:when test="$var = '5'">
				<xsl:value-of select="$linea5"/>
			</xsl:when>
			<xsl:when test="$var = '6'">
				<xsl:value-of select="$linea6"/>
			</xsl:when>
			<xsl:when test="$var = '7'">
				<xsl:value-of select="$linea7"/>
			</xsl:when>
			<xsl:when test="$var = '8'">
				<xsl:value-of select="$linea8"/>
			</xsl:when>
			<xsl:when test="$var = '9'">
				<xsl:value-of select="$linea9"/>
			</xsl:when>
			<xsl:when test="$var = '10'">
				<xsl:value-of select="$linea10"/>
			</xsl:when>
			<xsl:when test="$var = '11'">
				<xsl:value-of select="$linea11"/>
			</xsl:when>
			<xsl:when test="$var = '12'">
				<xsl:value-of select="$linea12"/>
			</xsl:when>
			<xsl:when test="$var = '13'">
				<xsl:value-of select="$linea13"/>
			</xsl:when>
			<xsl:when test="$var = '14'">
				<xsl:value-of select="$linea14"/>
			</xsl:when>
			<xsl:when test="$var = '15'">
				<xsl:value-of select="$linea15"/>
			</xsl:when>
			<xsl:when test="$var = '16'">
				<xsl:value-of select="$linea16"/>
			</xsl:when>
			<xsl:when test="$var = '17'">
				<xsl:value-of select="$linea17"/>
			</xsl:when>
			<xsl:when test="$var = '18'">
				<xsl:value-of select="$linea18"/>
			</xsl:when>
			<xsl:when test="$var = '19'">
				<xsl:value-of select="$linea19"/>
			</xsl:when>
			<xsl:when test="$var = '20'">
				<xsl:value-of select="$linea20"/>
			</xsl:when>
			<xsl:when test="$var = '21'">
				<xsl:value-of select="$linea21"/>
			</xsl:when>
			<xsl:when test="$var = '22'">
				<xsl:value-of select="$linea22"/>
			</xsl:when>
			<xsl:when test="$var = '23'">
				<xsl:value-of select="$linea23"/>
			</xsl:when>
			<xsl:when test="$var = '24'">
				<xsl:value-of select="$linea24"/>
			</xsl:when>
			<xsl:when test="$var = '25'">
				<xsl:value-of select="$linea25"/>
			</xsl:when>
			<xsl:when test="$var = '26'">
				<xsl:value-of select="$linea26"/>
			</xsl:when>
			<xsl:when test="$var = '27'">
				<xsl:value-of select="$linea27"/>
			</xsl:when>
			<xsl:when test="$var = '28'">
				<xsl:value-of select="$linea28"/>
			</xsl:when>
			<xsl:when test="$var = '29'">
				<xsl:value-of select="$linea29"/>
			</xsl:when>
			<xsl:when test="$var = '30'">
				<xsl:value-of select="$linea30"/>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="DatosReferencia">
		<table border="0" width="100%">
			<tbody>
				<tr>
					<td>
						<xsl:choose>
							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"></xsl:when>
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
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="SimboloMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">€</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">€</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">€</xsl:when>
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="20100025591_2013061807F00200001122.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"><block path="table/td/font/xsl:for&#x2D;each" x="410" y="60"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if/=[0]" x="314" y="88"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if" x="360" y="90"/><block path="table/td/font/xsl:for&#x2D;each[1]" x="300" y="30"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="204" y="58"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if" x="250" y="60"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/xsl:value&#x2D;of" x="320" y="90"/><block path="table/td/font/xsl:for&#x2D;each[2]" x="340" y="30"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="84" y="58"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if" x="130" y="60"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/xsl:value&#x2D;of" x="200" y="90"/></template><template name="Total"><block path="table/tr/td[1]/font/xsl:for&#x2D;each" x="340" y="27"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="44" y="55"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="90" y="57"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="160" y="87"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="260" y="27"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="15"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="410" y="17"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="40" y="87"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="20" y="27"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="84" y="15"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="130" y="17"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="200" y="47"/><block path="table/xsl:for&#x2D;each" x="300" y="27"/><block path="table/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="55"/><block path="table/xsl:for&#x2D;each/xsl:if" x="410" y="57"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="314" y="85"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if" x="360" y="87"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="360" y="127"/><block path="table/xsl:if/!=[0]" x="274" y="85"/><block path="table/xsl:if" x="320" y="87"/><block path="table/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="400" y="127"/><block path="table/xsl:for&#x2D;each[1]" x="280" y="87"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="15"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if" x="90" y="17"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="320" y="127"/><block path="table/xsl:for&#x2D;each[2]" x="240" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="95"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if" x="90" y="97"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="280" y="127"/><block path="table/xsl:for&#x2D;each[3]" x="200" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/!=[0]" x="124" y="135"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if" x="170" y="137"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="240" y="127"/><block path="table/tr[3]/td[1]/xsl:if/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if/font/xsl:value&#x2D;of" x="40" y="127"/><block path="table/tr[3]/td[1]/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if[1]" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if[1]/font/xsl:value&#x2D;of" x="360" y="87"/><block path="table[1]/tr/td/xsl:if/=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if" x="360" y="87"/><block path="table[1]/tr/td/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if[1]" x="360" y="87"/></template><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->