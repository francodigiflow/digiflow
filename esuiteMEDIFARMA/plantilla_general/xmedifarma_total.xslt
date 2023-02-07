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
	<xsl:output method="html"
	            indent="yes"
	            encoding="ISO-8859-1"
	            omit-xml-declaration="yes"/>
	<!-- INDICADOR TIPO DE FACTURA -->
	<xsl:variable name="varTipoFactura0">
		<xsl:call-template name="TraeValorVariablex">
			<xsl:with-param name="varNumVA"
			                select="12"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VALOR SEGUN NRO DE VARAIBLE -->
	<xsl:template name="TraeValorVariablex">
		<xsl:param name="varNumVA"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA">
				<xsl:if test="pe:Valor!='-'">
					<xsl:value-of select="pe:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$varNumVA">
				<xsl:if test="pe1:Valor!='-'">
					<xsl:value-of select="pe1:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$varNumVA">
				<xsl:if test="pe2:Valor!='-'">
					<xsl:value-of select="pe2:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- TEMPLATE PARA MOSTRAR EL MONTO LITERAL -->
	<xsl:template name="son-pesos">
		<table border="0">
			<tr>
				<td align="left"
				    width="100%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<strong>SON :</strong>&#xA0;
						<xsl:call-template name="TraeValorVariable">
							<xsl:with-param name="varNumVA"
							                select="6"/>
						</xsl:call-template>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- TEMPLATE PARA MOSTRAR EL MONTO LITERAL -->
	<xsl:template name="ope-detraccion">
		<table border="0">
			<tr>
				<td align="left"
				    width="100%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">												
						**OPERACIÓN SUJETA A DETRACCIÓN. Tasa : &#xA0;									
						<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
							<xsl:value-of select="cbc:PaymentPercent"/>
						</xsl:for-each>%  	&#xA0;&#xA0; *Monto Detracción : &#xA0; 
						<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
							<xsl:if test="cbc:PaymentPercent != '' ">
								<xsl:value-of select="cbc:Amount"/>
							</xsl:if>
						</xsl:for-each>
						<br/>											
						**Número cuenta Banco de la nación: &#xA0;
						<xsl:for-each select="/pe:Invoice/cac:PaymentMeans">
							<xsl:if test="cbc:PaymentMeansCode = '999'">
								<xsl:value-of select="cac:PayeeFinancialAccount/cbc:ID"/>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- CREO LA VARIABLE Tipo_Fact Y LE ASIGNO EL VALOR DE LEYENDA SEGUN CATALOGO 15 -->
	<xsl:variable name="Tipo_Fact">
		<!--		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento">
			<xsl:value-of select="substring(pe:Nombre,18,3)"/>
		</xsl:for-each>-->
		<!-- HACE REFERENCIA AL CATALOGO 15-->
		<!-- xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty" -->
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID='1003'">
				<!-- xsl:if test="cbc:Value!=''" -->
				<xsl:if test="cbc:PayableAmount!=''">
					<!-- xsl:value-of select="substring(cbc:Value,1,22)"/ -->
					<xsl:value-of select="'EXPORTACION'"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="DescuentoTotal">
		<xsl:if test="cbc:ID!='1001' or cbc:ID!='1002' or cbc:ID!='1003' or cbc:ID!='2001' or cbc:ID!='2002' or cbc:ID!='2003' or cbc:ID!='2004'">
			<xsl:value-of select="0.00"/>
		</xsl:if>
		<xsl:if test="$Tipo_Fact='TRANSFERENCIA GRATUITA'">
			<xsl:value-of select="0.00"/>
		</xsl:if>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID='2005'">
				<xsl:if test="cbc:PayableAmount!='0'">
					<xsl:value-of select="cbc:PayableAmount"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="ISC">
		<xsl:value-of select="0.00"/>
		<!--		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID='2000'">
				<xsl:value-of select="cbc:PayableAmount"/>
			</xsl:if>
		</xsl:for-each>-->
		<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
			<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
				<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
					<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
			<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
				<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
					<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
			<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
				<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
					<xsl:value-of select="cac:TaxSubtotal/cbc:TaxAmount"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:template name="Total">
		<xsl:variable name="VersionUbl">
			<xsl:value-of select="0"/>
			<xsl:choose>
				<!-- UBL2.0  -->
				<xsl:when test="//cbc:UBLVersionID != '2.1'">
					<xsl:value-of select="0"/>
				</xsl:when>
				<!-- UBL2.1  -->
				<xsl:when test="//cbc:UBLVersionID = '2.1'">
					<xsl:value-of select="1"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<table border="1"
		       width="100%"
		       cellpadding="1"
		       cellspacing="0"
		       bordercolor="#000000">
			<xsl:choose>
				<xsl:when test="//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='04' or //cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='05' or //cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='06'">
					<tr bgcolor="#D8D8D8">
						<td align="center"
						    valign="top"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">VALOR BRUTO</font>
						</td>
						<td align="center"
						    valign="top"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">DSCTO TOTAL</font>
						</td>
						<!--<xsl:for-each select="//cac:AllowanceCharge">-->
						<td align="center"
						    valign="middle"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
						ANTICIPO
					</font>
						</td>
						<!--</xsl:for-each>-->
						<td align="center"
						    valign="top"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">TOTAL
						<br/>GRAVADO</font>
						</td>
						<td align="center"
						    valign="top"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">TOTAL
						<br/>INAFECTO</font>
						</td>
						<td align="center"
						    valign="top"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">TOTAL
						<br/>EXONERADO</font>
						</td>
						<td align="center"
						    valign="top"
						    width="11%">&#xA0;
					&#xA0;&#xA0;&#xA0;<font face="Arial, Helvetica, sans-serif"
							      size="1">ISC</font>&#xA0;&#xA0;&#xA0;&#xA0;</td>
						<td align="center"
						    valign="top"
						    width="11%">&#xA0;
					&#xA0;&#xA0;&#xA0;<font face="Arial, Helvetica, sans-serif"
							      size="1">IGV</font>&#xA0;&#xA0;&#xA0;&#xA0;</td>
						<td align="center"
						    valign="top"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">IMPORTE TOTAL</font>
						</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr bgcolor="#D8D8D8">
						<td align="center"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">VALOR BRUTO</font>
						</td>
						<td align="center"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">DSCTO TOTAL</font>
						</td>
						<!--<xsl:for-each select="//cac:AllowanceCharge">-->
						<!--</xsl:for-each>-->
						<td align="center"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">TOTAL
						<br/>GRAVADO</font>
						</td>
						<td align="center"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">TOTAL
						<br/>INAFECTO</font>
						</td>
						<td align="center"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">TOTAL
						<br/>EXONERADO</font>
						</td>
						<td align="center"
						    valign="top"
						    width="12.5%">&#xA0;
					&#xA0;&#xA0;&#xA0;<font face="Arial, Helvetica, sans-serif"
							      size="1">ISC</font>&#xA0;&#xA0;&#xA0;&#xA0;</td>
						<td align="center"
						    valign="top"
						    width="12.5%">&#xA0;
					&#xA0;&#xA0;&#xA0;<font face="Arial, Helvetica, sans-serif"
							      size="1">IGV</font>&#xA0;&#xA0;&#xA0;&#xA0;</td>
						<td align="center"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">IMPORTE TOTAL</font>
						</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='04' or //cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='05' or //cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='06'">
					<tr>
						<!-- Valor Bruto -->
						<td align="right"
						    valign="top"
						    width="11%">
							<!-- Bruto x exo -->
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:choose>
									<xsl:when test="$varTipoFactura0='1'">
										<xsl:variable name="exonera">
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
										<xsl:variable name="exporta">
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
										<xsl:if test="$VersionUbl='01'">
											<xsl:variable name="OPExonerada">
												<xsl:value-of select="0.00"/>
												<xsl:if test="$exonera != '0.00'">
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
												</xsl:if>
												<xsl:if test="$exonera = '0.00' or $varTipoFactura=1">
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
												</xsl:if>
											</xsl:variable>
											<xsl:value-of select="format-number($OPExonerada, '###,###,##0.00', 'pen')"/>
											<!--<xsl:value-of select="$exonera"/>-->
										</xsl:if>
										<xsl:if test="$VersionUbl!='01'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
												<xsl:if test="cbc:ID='1003'">
													<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="format-number($varValBruto,'###,###,##0.00','pen')"/>
									</xsl:otherwise>
								</xsl:choose>
							</font>
							<!--<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="format-number($varValBruto,'###,###,##0.00','pen')"/>
					</font>-->
						</td>
						<!-- descuento -->
						<td align="right"
						    valign="top"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:variable name="dsctototal">
									<xsl:value-of select="0.00"/>
									<xsl:if test="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount!=''">
										<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount"/>
									</xsl:if>
								</xsl:variable>
								<!--<xsl:if test="$varDscTotal=''">
							<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
						</xsl:if>
						<xsl:if test="$varDscTotal!=''">
							<xsl:value-of select="format-number($varDscTotal,'###,###,##0.00','pen')"/>
						</xsl:if>-->
								<xsl:choose>
									<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">
										<xsl:value-of select="format-number($varDscTotal,'###,###,##0.00','pen')"/>
									</xsl:when>
									<xsl:when test="$dsctototal &gt; '0'">
										<xsl:value-of select="format-number($dsctototal,'###,###,##0.00','pen')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
									</xsl:otherwise>
								</xsl:choose>
							</font>
						</td>
						<!--Anticipo-->
						<!--<xsl:for-each select="//cac:AllowanceCharge">-->
						<td align="right"
						    valign="top"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<!--<xsl:for-each select="//cac:AllowanceCharge">-->
								<xsl:choose>
									<xsl:when test="//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='04'">
										<xsl:value-of select="format-number(//cac:AllowanceCharge/cbc:Amount,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:when>
									<xsl:when test="//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='05'">
										<xsl:value-of select="format-number(//cac:AllowanceCharge/cbc:Amount,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:when>
									<xsl:when test="//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode='06'">
										<xsl:value-of select="format-number(//cac:AllowanceCharge/cbc:Amount,'###,###,##0.00','pen')"/>&#xA0;
						</xsl:when>
									<xsl:otherwise>0.00</xsl:otherwise>
								</xsl:choose>
								<!--</xsl:for-each>-->
							</font>
						</td>
						<!--</xsl:for-each>-->
						<!-- gravado -->
						<td align="right"
						    valign="top"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:if test="$VersionUbl='01'">
									<!-- tOTAL GRAVADO -REVISAR BOLETA-->
									<!--<xsl:if test="$varTipoFactura1='0'">												
								<xsl:variable name="OPGravada">
									<xsl:value-of select="0.00"/>
									<xsl:if test="//cac:LegalMonetaryTotal/cbc:LineExtensionAmount!=''">						
										<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:LineExtensionAmount"/>
									</xsl:if>
								</xsl:variable>
								<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>																			
							</xsl:if>
							<xsl:if test="$varTipoFactura1!='0'">	-->
									<xsl:variable name="OPGravada">
										<xsl:value-of select="0.00"/>
										<!-- <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID = '1001'">
											<xsl:value-of select="cbc:PayableAmount"/>&#xA0;</xsl:if>
									</xsl:for-each>  -->
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
											<xsl:value-of select="cbc:TaxableAmount"/>
										</xsl:if>
									</xsl:for-each>-->
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
											<xsl:value-of select="cbc:TaxableAmount"/>
										</xsl:if>
									</xsl:for-each>-->
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
											<xsl:value-of select="cbc:TaxableAmount"/>
										</xsl:if>
									</xsl:for-each>-->
									</xsl:variable>
									<xsl:variable name="OpISC">
										<xsl:value-of select="0.00"/>
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cbc:TaxableAmount &gt; '0'">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:Name='ISC'">
													<xsl:value-of select="cbc:TaxableAmount"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="$OpISC &gt; '0'">
											<xsl:value-of select="format-number($OpISC,'###,###,##0.00','pen')"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1001'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</font>
						</td>
						<!-- inafecto -->
						<td align="right"
						    valign="top"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:if test="$VersionUbl='01'">
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
										<!--<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
										<xsl:value-of select="cbc:TaxableAmount"/>
									</xsl:if>
								</xsl:for-each>-->
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
										<xsl:value-of select="cbc:TaxableAmount"/>
									</xsl:if>
								</xsl:for-each>-->
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
										<xsl:value-of select="cbc:TaxableAmount"/>
									</xsl:if>
								</xsl:for-each>-->
									</xsl:variable>
									<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1002'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</font>
						</td>
						<!-- exonerado -->
						<td align="right"
						    valign="top"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:variable name="exonera">
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
								<xsl:variable name="exporta">
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
								<xsl:if test="$VersionUbl='01'">
									<xsl:variable name="OPExonerada">
										<xsl:value-of select="0.00"/>
										<xsl:if test="$exonera != '0.00'">
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
										</xsl:if>
										<xsl:if test="$exonera = '0.00' or $varTipoFactura=1">
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
										</xsl:if>
									</xsl:variable>
									<xsl:value-of select="format-number($OPExonerada, '###,###,##0.00', 'pen')"/>
									<!--<xsl:value-of select="$exonera"/>-->
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1003'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</font>
						</td>
						<!-- ISC -->
						<td align="right"
						    valign="top"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:if test="$VersionUbl='01'">
									<xsl:variable name="ISC">
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
												<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
												<xsl:if test="cbc:TaxAmount!='0.00'">
													<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
												<xsl:if test="cbc:TaxAmount!='0.00'">
													<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:if test="$ISC!=''">
										<xsl:value-of select="$ISC"/>&#xA0;</xsl:if>
									<xsl:if test="$ISC=''">
										<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:value-of select="format-number($ISC,'###,###,##0.00','pen')"/>
								</xsl:if>
							</font>
						</td>
						<!-- IGV -->
						<td align="right"
						    valign="top"
						    width="11%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:if test="$VersionUbl='01'">
									<xsl:variable name="IGV">
										<xsl:value-of select="0.00"/>
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:value-of select="format-number($IGV, '###,###,##0.00', 'pen')"/>
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:if test="$varIGVTotal!=''">
										<xsl:value-of select="$varIGVTotal"/>
									</xsl:if>
									<xsl:if test="$varIGVTotal=''">
										<xsl:value-of select="'0.00'"/>
									</xsl:if>
								</xsl:if>
								<!-- xsl:for-each select="/pe:Invoice/cac:TaxTotal">
							<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
							<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
							<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:if>
						</xsl:for-each -->
							</font>
						</td>
						<!-- importe total -->
						<td align="right"
						    valign="top"
						    width="11%">
							<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
							</xsl:if>
							<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
							</xsl:if>
						</td>
					</tr>
				</xsl:when>
				<xsl:when test="$varTipoFactura=1 and $varTotalGratExporta &gt; 0 and $varTotalExonerado ='0.00'">
					<tr>
						<!-- Valor Bruto -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<!-- Bruto x exo -->
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:choose>
									<xsl:when test="$varTipoFactura0='1'">
										<xsl:variable name="exonera">
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
										<xsl:variable name="exporta">
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
										<xsl:if test="$VersionUbl='01'">
											<xsl:variable name="OPExonerada">
												<xsl:value-of select="0.00"/>
												<xsl:if test="$exonera != '0.00'">
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
												</xsl:if>
												<xsl:if test="$exonera = '0.00' or $varTipoFactura=1">
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
												</xsl:if>
											</xsl:variable>
											<xsl:value-of select="format-number($OPExonerada, '###,###,##0.00', 'pen')"/>
											<!--<xsl:value-of select="$exonera"/>-->
										</xsl:if>
										<xsl:if test="$VersionUbl!='01'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
												<xsl:if test="cbc:ID='1003'">
													<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="format-number($varValBruto,'###,###,##0.00','pen')"/>
									</xsl:otherwise>
								</xsl:choose>
							</font>
							<!--<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="format-number($varValBruto,'###,###,##0.00','pen')"/>
					</font>-->
						</td>
						<!-- descuento -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:variable name="dsctototal">
									<xsl:value-of select="0.00"/>
									<xsl:if test="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount!=''">
										<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount"/>
									</xsl:if>
								</xsl:variable>
								<!--<xsl:if test="$varDscTotal=''">
							<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
						</xsl:if>
						<xsl:if test="$varDscTotal!=''">
							<xsl:value-of select="format-number($varDscTotal,'###,###,##0.00','pen')"/>
						</xsl:if>-->
								<xsl:choose>
									<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">
										<xsl:value-of select="format-number($varDscTotal,'###,###,##0.00','pen')"/>
									</xsl:when>
									<xsl:when test="$dsctototal &gt; '0'">
										<xsl:value-of select="format-number($dsctototal,'###,###,##0.00','pen')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
									</xsl:otherwise>
								</xsl:choose>
							</font>
						</td>
						<!--Anticipo-->
						<!--<xsl:for-each select="//cac:AllowanceCharge">-->
						<!--</xsl:for-each>-->
						<!-- gravado -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:if test="$VersionUbl='01'">
									<!-- tOTAL GRAVADO -REVISAR BOLETA-->
									<!--<xsl:if test="$varTipoFactura1='0'">												
								<xsl:variable name="OPGravada">
									<xsl:value-of select="0.00"/>
									<xsl:if test="//cac:LegalMonetaryTotal/cbc:LineExtensionAmount!=''">						
										<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:LineExtensionAmount"/>
									</xsl:if>
								</xsl:variable>
								<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>																			
							</xsl:if>
							<xsl:if test="$varTipoFactura1!='0'">	-->
									<xsl:variable name="OPGravada">
										<xsl:value-of select="0.00"/>
										<!-- <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID = '1001'">
											<xsl:value-of select="cbc:PayableAmount"/>&#xA0;</xsl:if>
									</xsl:for-each>  -->
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
											<xsl:value-of select="cbc:TaxableAmount"/>
										</xsl:if>
									</xsl:for-each>-->
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
											<xsl:value-of select="cbc:TaxableAmount"/>
										</xsl:if>
									</xsl:for-each>-->
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
											<xsl:value-of select="cbc:TaxableAmount"/>
										</xsl:if>
									</xsl:for-each>-->
									</xsl:variable>
									<xsl:variable name="OpISC">
										<xsl:value-of select="0.00"/>
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cbc:TaxableAmount &gt; '0'">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:Name='ISC'">
													<xsl:value-of select="cbc:TaxableAmount"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="$OpISC &gt; '0'">
											<xsl:value-of select="format-number($OpISC,'###,###,##0.00','pen')"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1001'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</font>
						</td>
						<!-- inafecto -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:if test="$VersionUbl='01'">
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
										<!--<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
										<xsl:value-of select="cbc:TaxableAmount"/>
									</xsl:if>
								</xsl:for-each>-->
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
										<xsl:value-of select="cbc:TaxableAmount"/>
									</xsl:if>
								</xsl:for-each>-->
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
										<xsl:value-of select="cbc:TaxableAmount"/>
									</xsl:if>
								</xsl:for-each>-->
									</xsl:variable>
									<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1002'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</font>
						</td>
						<!-- exonerado -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:variable name="exonera">
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
								<xsl:variable name="exporta">
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
								<xsl:if test="$VersionUbl='01'">
									<xsl:variable name="OPExonerada">
										<xsl:value-of select="0.00"/>
										<xsl:if test="$exonera != '0.00'">
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
										</xsl:if>
										<xsl:if test="$exonera = '0.00' or $varTipoFactura=1">
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
										</xsl:if>
									</xsl:variable>
									<xsl:value-of select="format-number($OPExonerada, '###,###,##0.00', 'pen')"/>
									<!--<xsl:value-of select="$exonera"/>-->
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1003'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</font>
						</td>
						<!-- ISC -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:if test="$VersionUbl='01'">
									<xsl:variable name="ISC">
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
												<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
												<xsl:if test="cbc:TaxAmount!='0.00'">
													<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
												<xsl:if test="cbc:TaxAmount!='0.00'">
													<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:if test="$ISC!=''">
										<xsl:value-of select="$ISC"/>&#xA0;</xsl:if>
									<xsl:if test="$ISC=''">
										<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:value-of select="format-number($ISC,'###,###,##0.00','pen')"/>
								</xsl:if>
							</font>
						</td>
						<!-- IGV -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:if test="$VersionUbl='01'">
									<xsl:variable name="IGV">
										<xsl:value-of select="0.00"/>
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:value-of select="format-number($IGV, '###,###,##0.00', 'pen')"/>
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:if test="$varIGVTotal!=''">
										<xsl:value-of select="$varIGVTotal"/>
									</xsl:if>
									<xsl:if test="$varIGVTotal=''">
										<xsl:value-of select="'0.00'"/>
									</xsl:if>
								</xsl:if>
								<!-- xsl:for-each select="/pe:Invoice/cac:TaxTotal">
							<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
							<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
							<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:if>
						</xsl:for-each -->
							</font>
						</td>
						<!-- importe total -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<!--<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="format-number(0,'###,###,##0.00','pen')"/>&#xA0;</font>
					</xsl:if>
					<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="format-number(0,'###,###,##0.00','pen')"/>&#xA0;</font>
					</xsl:if>-->
							<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
							</xsl:if>
							<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
							</xsl:if>
						</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<!-- Valor Bruto -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<!-- Bruto x exo -->
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:choose>
									<xsl:when test="$varTipoFactura0='1'">
										<xsl:variable name="exonera">
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
										<xsl:variable name="exporta">
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
										<xsl:if test="$VersionUbl='01'">
											<xsl:variable name="OPExonerada">
												<xsl:value-of select="0.00"/>
												<xsl:if test="$exonera != '0.00'">
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
												</xsl:if>
												<xsl:if test="$exonera = '0.00' or $varTipoFactura=1">
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
												</xsl:if>
											</xsl:variable>
											<xsl:value-of select="format-number($OPExonerada, '###,###,##0.00', 'pen')"/>
											<!--<xsl:value-of select="$exonera"/>-->
										</xsl:if>
										<xsl:if test="$VersionUbl!='01'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
												<xsl:if test="cbc:ID='1003'">
													<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="format-number($varValBruto,'###,###,##0.00','pen')"/>
									</xsl:otherwise>
								</xsl:choose>
							</font>
							<!--<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="format-number($varValBruto,'###,###,##0.00','pen')"/>
					</font>-->
						</td>
						<!-- descuento -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:variable name="dsctototal">
									<xsl:value-of select="0.00"/>
									<xsl:if test="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount!=''">
										<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount"/>
									</xsl:if>
								</xsl:variable>
								<!--<xsl:if test="$varDscTotal=''">
							<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
						</xsl:if>
						<xsl:if test="$varDscTotal!=''">
							<xsl:value-of select="format-number($varDscTotal,'###,###,##0.00','pen')"/>
						</xsl:if>-->
								<xsl:choose>
									<xsl:when test="$varDscTotal!='' and $varDscTotal &gt; '0' ">
										<xsl:value-of select="format-number($varDscTotal,'###,###,##0.00','pen')"/>
									</xsl:when>
									<xsl:when test="$dsctototal &gt; '0'">
										<xsl:value-of select="format-number($dsctototal,'###,###,##0.00','pen')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
									</xsl:otherwise>
								</xsl:choose>
							</font>
						</td>
						<!--Anticipo-->
						<!--<xsl:for-each select="//cac:AllowanceCharge">-->
						<!--</xsl:for-each>-->
						<!-- gravado -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:if test="$VersionUbl='01'">
									<!-- tOTAL GRAVADO -REVISAR BOLETA-->
									<!--<xsl:if test="$varTipoFactura1='0'">												
								<xsl:variable name="OPGravada">
									<xsl:value-of select="0.00"/>
									<xsl:if test="//cac:LegalMonetaryTotal/cbc:LineExtensionAmount!=''">						
										<xsl:value-of select="//cac:LegalMonetaryTotal/cbc:LineExtensionAmount"/>
									</xsl:if>
								</xsl:variable>
								<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>																			
							</xsl:if>
							<xsl:if test="$varTipoFactura1!='0'">	-->
									<xsl:variable name="OPGravada">
										<xsl:value-of select="0.00"/>
										<!-- <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID = '1001'">
											<xsl:value-of select="cbc:PayableAmount"/>&#xA0;</xsl:if>
									</xsl:for-each>  -->
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
											<xsl:value-of select="cbc:TaxableAmount"/>
										</xsl:if>
									</xsl:for-each>-->
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
											<xsl:value-of select="cbc:TaxableAmount"/>
										</xsl:if>
									</xsl:for-each>-->
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
											<xsl:value-of select="cbc:TaxableAmount"/>
										</xsl:if>
									</xsl:for-each>-->
									</xsl:variable>
									<xsl:variable name="OpISC">
										<xsl:value-of select="0.00"/>
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cbc:TaxableAmount &gt; '0'">
												<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:Name='ISC'">
													<xsl:value-of select="cbc:TaxableAmount"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="$OpISC &gt; '0'">
											<xsl:value-of select="format-number($OpISC,'###,###,##0.00','pen')"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1001'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</font>
						</td>
						<!-- inafecto -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:if test="$VersionUbl='01'">
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
										<!--<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
										<xsl:value-of select="cbc:TaxableAmount"/>
									</xsl:if>
								</xsl:for-each>-->
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
										<xsl:value-of select="cbc:TaxableAmount"/>
									</xsl:if>
								</xsl:for-each>-->
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
												<xsl:value-of select="cbc:TaxableAmount"/>
											</xsl:if>
										</xsl:for-each>
										<!--<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
										<xsl:value-of select="cbc:TaxableAmount"/>
									</xsl:if>
								</xsl:for-each>-->
									</xsl:variable>
									<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1002'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</font>
						</td>
						<!-- exonerado -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:variable name="exonera">
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
								<xsl:variable name="exporta">
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
								<xsl:if test="$VersionUbl='01'">
									<xsl:variable name="OPExonerada">
										<xsl:value-of select="0.00"/>
										<xsl:if test="$exonera != '0.00'">
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
										</xsl:if>
										<xsl:if test="$exonera = '0.00' or $varTipoFactura=1">
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
										</xsl:if>
									</xsl:variable>
									<xsl:value-of select="format-number($OPExonerada, '###,###,##0.00', 'pen')"/>
									<!--<xsl:value-of select="$exonera"/>-->
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1003'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</font>
						</td>
						<!-- ISC -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:if test="$VersionUbl='01'">
									<xsl:variable name="ISC">
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
												<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
												<xsl:if test="cbc:TaxAmount!='0.00'">
													<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:if>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='2000'">
												<xsl:if test="cbc:TaxAmount!='0.00'">
													<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:if test="$ISC!=''">
										<xsl:value-of select="$ISC"/>&#xA0;</xsl:if>
									<xsl:if test="$ISC=''">
										<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:value-of select="format-number($ISC,'###,###,##0.00','pen')"/>
								</xsl:if>
							</font>
						</td>
						<!-- IGV -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:if test="$VersionUbl='01'">
									<xsl:variable name="IGV">
										<xsl:value-of select="0.00"/>
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
											<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
												<xsl:value-of select="cbc:TaxAmount"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:value-of select="format-number($IGV, '###,###,##0.00', 'pen')"/>
								</xsl:if>
								<xsl:if test="$VersionUbl!='01'">
									<xsl:if test="$varIGVTotal!=''">
										<xsl:value-of select="$varIGVTotal"/>
									</xsl:if>
									<xsl:if test="$varIGVTotal=''">
										<xsl:value-of select="'0.00'"/>
									</xsl:if>
								</xsl:if>
								<!-- xsl:for-each select="/pe:Invoice/cac:TaxTotal">
							<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
							<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
							<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
								<xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#xA0;</xsl:if>
							</xsl:if>
						</xsl:for-each -->
							</font>
						</td>
						<!-- importe total -->
						<td align="right"
						    valign="top"
						    width="12.5%">
							<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
							</xsl:if>
							<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
							</xsl:if>
						</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<table>
			<tr>
				<td align="left"
				    width="7%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:if test="$varTipoFactura!='2'">
							<strong>GR &#xA0;&#xA0;&#xA0;:</strong>
						</xsl:if>
						<xsl:if test="$varTipoFactura ='2'">
							<strong>GI &#xA0;&#xA0;&#xA0;:</strong>
						</xsl:if>
					</font>
				</td>
				<td width="93%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:call-template name="TraeValorVariable">
							<xsl:with-param name="varNumVA"
							                select="4"/>
						</xsl:call-template>
					</font>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td align="center"
				    width="100%"
				    valign="top">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.2">**MEDIFARMA S.A ES AGENTE DE RETENCION - R.S. 037-2002/SUNAT** / "MEDIFARMA ES AGENTE DE PERCEPCIÓN IGV VENTA INTERNA D.S.091-2013"</font>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="Transferencia_Gratuita">
		<table border="0"
		       width="100%"
		       cellpadding="1"
		       cellspacing="0">
			<tr>
				<td align="right"
				    valign="top"
				    width="100%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<strong>TRANSFERENCIA GRATUITA</strong>
					</font>&#xA0;
					&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
					&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
					&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</td>
			</tr>
		</table>
		<!-- Nota de credito Gratuita-->
		<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03'">
		<table border="0"
		       width="100%"
		       cellpadding="1"
		       cellspacing="0">
			<tr>
				<td align="left"
				    valign="top"
				    width="100%">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.2">VALOR COMERCIAL REFERENCIAL ART. N°. B RS 007-99/SUNAT</font>
				</td>
			</tr>
		</table>
		<table border="1"
		       width="100%"
		       cellpadding="1"
		       cellspacing="0"
		       bordercolor="#000000">
			<tr>
				<td align="center"
				    valign="top"
				    width="12.5%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">V.B.</font>
				</td>
				<td align="center"
				    valign="top"
				    width="12.5%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">V.D.</font>
				</td>
				<td align="center"
				    valign="top"
				    width="12.5%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">V.V.</font>
				</td>
				<td align="center"
				    valign="top"
				    width="12.5%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">ISC</font>
				</td>
				<td align="center"
				    valign="top"
				    width="12.5%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">IGV</font>
				</td>
				<td align="center"
				    valign="top"
				    width="12.5%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">TOT</font>
				</td>
			</tr>
			<tr>
				<!-- V.B. -->
				<td align="right"
				    valign="top"
				    width="12.5%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:value-of select="format-number($varTGVB,'###,###,##0.00','pen')"/>
					</font>
				</td>
				<!-- V.D. -->
				<td align="right"
				    valign="top"
				    width="12.5%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:value-of select="format-number($varTGVD,'###,###,##0.00','pen')"/>
					</font>
				</td>
				<!-- V.V. -->
				<td align="right"
				    valign="top"
				    width="12.5%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:value-of select="format-number($varTGVV,'###,###,##0.00','pen')"/>
					</font>
				</td>
				<!-- ISC -->
				<td align="right"
				    valign="top"
				    width="12.5%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:value-of select="format-number($varTGISC,'###,###,##0.00','pen')"/>
					</font>
				</td>
				<!-- IGV -->
				<td align="right"
				    valign="top"
				    width="12.5%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:value-of select="format-number($varTGIGV,'###,###,##0.00','pen')"/>
					</font>
				</td>
				<!-- TOT -->
				<td align="right"
				    valign="top"
				    width="12.5%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:value-of select="format-number($varTGTOT,'###,###,##0.00','pen')"/>
						<!--<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
								<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:value-of select="cbc:TaxableAmount"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>-->
					</font>
				</td>
			</tr>
		</table>
		</xsl:if>
		<!--Fin Nota credito Gratuita-->
	</xsl:template>
	<xsl:template name="FactGuia">
		<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">-->
		<table border="1"
		       width="100%"
		       cellpadding="1"
		       cellspacing="0"
		       bordercolor="#000000">
			<tr>
				<!-- PUNTO DE PARTIDA -->
				<td align="left"
				    valign="top"
				    width="25%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<strong>PUNTO DE PARTIDA</strong>
					</font>
				</td>
				<!-- PUNTO DE LLEGADA -->
				<td align="left"
				    valign="top"
				    width="75%"
				    bordercolor="#000000">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:value-of select="//cac:OriginAddress/cbc:StreetName"/>
						<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional/cac:OriginAddress/cbc:StreetName"/></xsl:for-each>	-->
						<!--<xsl:value-of select="/pe:Invoice/cac:OriginAddress/cbc:StreetName"/>-->
						<!--<xsl:value-of select="$varPuntoPartida"/>-->
					</font>
				</td>
			</tr>
			<tr>
				<!-- PUNTO DE LLEGADA -->
				<td align="left"
				    valign="top"
				    width="25%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<strong>PUNTO DE LLEGADA</strong>
					</font>
				</td>
				<!-- PUNTO DE LLEGADA-->
				<td align="left"
				    valign="top"
				    width="75%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<!--<xsl:value-of select="$varPuntoLlegada"/>-->
						<!--<xsl:value-of select="//cac:DeliveryAddress/cbc:StreetName" />-->
						<xsl:value-of select="//cac:DeliveryAddress/cbc:StreetName"/>
					</font>
				</td>
			</tr>
		</table>

		<!--</xsl:for-each>	-->
	</xsl:template>
	<xsl:template name="FactGuia1">
		<table border="1"
		       width="100%"
		       cellpadding="1"
		       cellspacing="0"
		       bordercolor="#000000">
			<tr>
				<!-- TRAMO1 -->
				<td align="center"
				    valign="top"
				    width="8%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">TRAMO1</font>
				</td>
				<!-- PUNTO DE PARTIDA TRAMO1 -->
				<td align="left"
				    valign="top"
				    width="46%"
				    bordercolor="#000000">
					<!--<xsl:if test="$varFacturaGuia!='-'">	
						<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="//cac:OriginAddress/cbc:StreetName"/>
						</font>-->
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:value-of select="//cac:OriginAddress/cbc:StreetName"/>
					</font>
					<!--</xsl:if>
					<xsl:if test="$varFacturaGuia='-'">	
						<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
					</xsl:if>-->
				</td>
				<!-- PUNTO DE LLEGADA TRAMO1 -->
				<td align="left"
				    valign="top"
				    width="46%"
				    bordercolor="#000000">
					<xsl:if test="$varFacturaGuia!=''">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">
							<xsl:value-of select="$varpartidaTramo2"/>
						</font>
					</xsl:if>
					<xsl:if test="$varFacturaGuia='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">&#xA0;</font>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<!-- TRAMO2 -->
				<td align="center"
				    valign="top"
				    width="8%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">TRAMO2</font>
				</td>
				<!-- PUNTO DE PARTIDA TRAMO2 -->
				<td align="left"
				    valign="top"
				    width="46%">
					<xsl:if test="$varFacturaGuia!=''">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">
							<xsl:value-of select="$varpartidaTramo2"/>
						</font>
					</xsl:if>
					<xsl:if test="$varFacturaGuia='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">&#xA0;</font>
					</xsl:if>
				</td>
				<!-- PUNTO DE LLEGADA TRAMO2 -->
				<td align="left"
				    valign="top"
				    width="46%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:value-of select="//cac:DeliveryAddress/cbc:StreetName"/>
					</font>
					<!--<xsl:if test="$varFacturaGuia!='-'">	
						<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$varpartidaTramo2"/></font>
					</xsl:if>
					<xsl:if test="$varFacturaGuia='-'">	
						<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
					</xsl:if>-->
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="FactGuia2">
		<table border="1"
		       width="100%"
		       cellpadding="1"
		       cellspacing="0"
		       bordercolor="#000000">
			<tr>
				<!-- TRAMO1 -->
				<td align="center"
				    valign="top"
				    width="8%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">TRAMO1</font>
				</td>
				<!-- PUNTO DE PARTIDA TRAMO1 -->
				<td align="left"
				    valign="top"
				    width="46%"
				    bordercolor="#000000">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:value-of select="//cac:OriginAddress/cbc:StreetName"/>
					</font>
					<!--<xsl:if test="$varTerminos!='-'">	
						<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:value-of select="$varpartidaTramo2"/></font>
					</xsl:if>
					<xsl:if test="$varTerminos='-'">	
						<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
					</xsl:if>-->
				</td>
				<!-- PUNTO DE LLEGADA TRAMO1 -->
				<td align="left"
				    valign="top"
				    width="46%"
				    bordercolor="#000000">
					<xsl:if test="$varFacturaGuia!=''">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">
							<xsl:value-of select="$varpartidaTramo2"/>
						</font>
					</xsl:if>
					<xsl:if test="$varFacturaGuia='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">&#xA0;</font>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<!-- TRAMO2 -->
				<td align="center"
				    valign="top"
				    width="8%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">TRAMO2</font>
				</td>
				<!-- PUNTO DE PARTIDA TRAMO2 -->
				<td align="left"
				    valign="top"
				    width="46%">
					<xsl:if test="$varFacturaGuia!=''">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">
							<xsl:value-of select="$varpartidaTramo2"/>
						</font>
					</xsl:if>
					<xsl:if test="$varFacturaGuia='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">&#xA0;</font>
					</xsl:if>
				</td>
				<!-- PUNTO DE LLEGADA TRAMO2 -->
				<td align="left"
				    valign="top"
				    width="46%">
					<xsl:if test="$varFacturaGuia!='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">
							<xsl:value-of select="$varFinalTramo2"/>
						</font>
					</xsl:if>
					<xsl:if test="$varFacturaGuia='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">&#xA0;</font>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<!-- TRAMO3 -->
				<td align="center"
				    valign="top"
				    width="8%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">TRAMO3</font>
				</td>
				<!-- PUNTO DE PARTIDA TRAMO3 -->
				<td align="left"
				    valign="top"
				    width="46%">
					<xsl:if test="$varFacturaGuia!='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">
							<xsl:value-of select="$varFinalTramo2"/>
						</font>
					</xsl:if>
					<xsl:if test="$varFacturaGuia='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">&#xA0;</font>
					</xsl:if>
				</td>
				<!-- PUNTO DE PARTIDA TRAMO3 -->
				<td align="left"
				    valign="top"
				    width="46%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:value-of select="//cac:DeliveryAddress/cbc:StreetName"/>
					</font>
					<!--<xsl:if test="$varTerminos!='-'">	
						<font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="$varpartidaTramo2"/></font>
					</xsl:if>
					<xsl:if test="$varTerminos='-'">	
						<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
					</xsl:if>-->
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="Transport">
		<table border="1"
		       width="100%"
		       cellpadding="0"
		       cellspacing="0"
		       bordercolor="#000000">
			<tr width="100%">
				<!-- TRANSPORTISTA-->
				<th align="left"
				    valign="top"
				    width="6%"
				    bgcolor="#D8D8D8"
				    bordercolor="#000000">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">TRANSPORTISTA</font>
				</th>
				<!--<td  width="47%">
				<table border="0" width="47%" cellpadding="2" cellspacing="0" bordercolor="#000000">-->
				<!-- INFORMACIÓN DEL TRANSPORTISTA -->
				<td align="left"
				    valign="top"
				    width="42%"
				    colspan="3">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:if test="$varTransportista!='-'">
							<xsl:value-of select="//cac:PartyLegalEntity/cbc:RegistrationName"/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
							<!--<xsl:value-of select="$varTransportista"/>-->
						</xsl:if>
						<xsl:if test="$varTransportista='-'">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<xsl:if test="$varTransportista=''">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<!--<xsl:value-of select="//cac:PartyLegalEntity/cbc:RegistrationName"/>-->
					</font>
				</td>
				<!--</table>
				</td>-->
				<!--<td  width="52%">

				<table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#000000">-->
				<!-- RUC TRANSPORTISTA -->
				<td align="center"
				    valign="top"
				    width="8%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">RUC TRANS.</font>
				</td>
				<!-- TRAER INFORMACIÓN DEL RUC TRANSPORTISTA -->
				<td align="center"
				    valign="top"
				    width="7%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:if test="$varRucTransport!='-'">
							<xsl:value-of select="//cbc:CustomerAssignedAccountID"/>
							<!--<xsl:value-of select="$varRucTransport"/>-->
						</xsl:if>
						<xsl:if test="$varRucTransport='-'">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<!--<xsl:value-of select="//cbc:CustomerAssignedAccountID"/>-->
					</font>
				</td>
				<!-- PLACA -->
				<td align="center"
				    valign="top"
				    width="7%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">PLACA</font>
				</td>
				<!-- TRAER INFORMACIÓN DE PLACA -->
				<td align="center"
				    valign="top"
				    width="10%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:if test="$varPlacaTransport!='-'">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<xsl:value-of select="//cbc:LicencePlateID"/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
							<!--<xsl:value-of select="$varPlacaTransport"/>-->
						</xsl:if>
						<xsl:if test="$varPlacaTransport='-'">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<xsl:if test="$varPlacaTransport=''">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<!--<xsl:value-of select="//cbc:LicencePlateID"/>-->
					</font>
				</td>
				<!-- LICENCIA -->
				<td align="center"
				    valign="top"
				    width="10%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">LICENCIA</font>
				</td>
				<!-- TRAER INFORMACIÓN DE LICENCIA-->
				<td align="center"
				    valign="top"
				    width="10%"
				    colspan="0">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:if test="$varLicTransport!='-'">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<xsl:value-of select="//cac:PartyIdentification/cbc:ID"/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
							<!--<xsl:value-of select="$varLicTransport"/>-->
						</xsl:if>
						<xsl:if test="$varLicTransport='-'">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<xsl:if test="$varLicTransport=''">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<!--<xsl:value-of select="//cac:PartyIdentification/cbc:ID" />-->
					</font>
				</td>
				<!--</table>
				</td>-->
			</tr>
		</table>
	</xsl:template>
	<!--</tr>-->
	<xsl:template name="Transport1">
		<table border="1"
		       width="100%"
		       cellpadding="0"
		       cellspacing="0"
		       bordercolor="#000000">
			<tr width="100%">
				<!-- MOTIVO DE TRASLADO-->
				<th align="left"
				    valign="top"
				    width="8%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">MOT. TRAS.</font>
				</th>
				<!--<td  width="42%">
				<table border="0" width="100%" cellpadding="2" cellspacing="0" bordercolor="#000000">-->
				<!-- INFORMACIÓN DEL TRANSPORTISTA -->
				<td align="left"
				    valign="top"
				    width="27%"
				    border="1">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:if test="$varMotTransp!='-'">
							<xsl:value-of select="$varMotTransp"/>&#xA0;&#xA0;</xsl:if>
						<xsl:if test="$varMotTransp='-'">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<xsl:if test="$varMotTransp=''">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<!--<xsl:value-of select="$varMotTransp"/>-->
					</font>
				</td>
				<!-- NUMERO DE BULTOS -->
				<td align="left"
				    valign="top"
				    width="7%"
				    bgcolor="#D8D8D8"
				    bordercolor="#000000"
				    border="1">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">NÂ° BULTOS</font>
				</td>
				<!-- VALOR DEL BULTO -->
				<td align="center"
				    valign="top"
				    width="6%"
				    bordercolor="#000000">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:if test="$varNroBult!='-'">&#xA0;&#xA0;&#xA0;<xsl:value-of select="$varNroBult"/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<xsl:if test="$varNroBult='-'">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<xsl:if test="$varNroBult=''">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
					</font>
				</td>
				<!--</table>
				</td>-->
				<!--<td  width="48%">
				<table border="1" width="100%" cellpadding="2" cellspacing="0" bordercolor="#000000">-->
				<!-- PESO -->
				<td align="center"
				    valign="top"
				    width="8%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">PESO</font>
				</td>
				<!-- VALOR DEL PESO -->
				<td align="center"
				    valign="top"
				    width="7%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:if test="$varPeso!='-'">&#xA0;&#xA0;<xsl:value-of select="$varPeso"/>&#xA0;&#xA0;</xsl:if>
						<xsl:if test="$varPeso='-'">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<xsl:if test="$varPeso=''">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<!--<xsl:value-of select="$varPeso"/>-->
					</font>
				</td>
				<!-- MARCA -->
				<td align="center"
				    valign="top"
				    width="7%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">MARCA</font>
				</td>
				<!-- VALOR DE LA MARCA -->
				<td align="center"
				    valign="top"
				    width="10%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:if test="$varMarTransport!='-'">
							<xsl:value-of select="//cbc:BrandName"/>
							<!--<xsl:value-of select="$varMarTransport"/>-->
						</xsl:if>
						<xsl:if test="$varMarTransport='-'">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<!--<xsl:value-of select="//cbc:BrandName"/>-->
					</font>
				</td>
				<!-- INICIA LA FECHA DEL TRASLADO-->
				<td align="center"
				    valign="top"
				    width="10%"
				    bgcolor="#D8D8D8">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">INI.FEC.TRAS.</font>
				</td>
				<!-- TRAER INFORMACIÓN DE LICENCIA -->
				<td align="center"
				    valign="top"
				    width="10%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">
						<xsl:if test="$varFechIni!='-'">&#xA0;&#xA0;<xsl:value-of select="$varFechIni"/>&#xA0;&#xA0;</xsl:if>
						<xsl:if test="$varFechIni='-'">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<xsl:if test="$varFechIni=''">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:if>
						<!--<xsl:value-of select="$varFechIni"/>-->
					</font>
				</td>
				<!--
				</table>
				</td>-->
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="Exportacion">
		<table border="1"
		       width="100%"
		       cellpadding="1"
		       cellspacing="0"
		       bordercolor="#000000">
			<tr>
				<!-- EXW -->
				<td align="center"
				    valign="top"
				    width="14%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">EXW</font>
				</td>
				<!-- GASTO AL FOB -->
				<td align="center"
				    valign="top"
				    width="14%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">GASTO AL FOB</font>
				</td>
				<!-- FOB -->
				<td align="center"
				    valign="top"
				    width="14%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">FOB</font>
				</td>
				<!-- FLETE -->
				<td align="center"
				    valign="top"
				    width="14%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">FLETE</font>
				</td>
				<!-- SEGURO -->
				<td align="center"
				    valign="top"
				    width="14%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">SEGURO</font>
				</td>
				<!-- CIF / CPT / CFR -->
				<td align="center"
				    valign="top"
				    width="14%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">CIF / CPT / CFR</font>
				</td>
				<!-- TÉRMINOS -->
				<td align="center"
				    valign="top"
				    width="16%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">TÉRMINOS</font>
				</td>
			</tr>
			<xsl:choose>
				<xsl:when test="$varTerminos='FOB' and $varGtoFob>'0.00'">
					<tr>
						<!-- EXW = POS 3-->
						<td align="center"
						    valign="top"
						    width="14%">
							<xsl:if test="$varFob!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number($varFob,'###,###,##0.00', 'pen')"/>
								</font>
							</xsl:if>
							<xsl:if test="$varFob='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
						<!-- GASTO AL FOB = POS 2-->
						<td align="center"
						    valign="top"
						    width="14%">
							<xsl:if test="$varGtoFob!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number($varGtoFob,'###,###,##0.00', 'pen')"/>
								</font>
							</xsl:if>
							<xsl:if test="$varGtoFob='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
						<!-- VALOR FOB = POS 6 -->
						<td align="center"
						    valign="top"
						    width="14%">
							<xsl:if test="$varCifCptCfr!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number($varCifCptCfr,'###,###,##0.00', 'pen')"/>
								</font>
							</xsl:if>
							<xsl:if test="$varCifCptCfr='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
						<!-- FLETE -->
						<td align="center"
						    valign="top"
						    width="14%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">0.00 &#xA0;</font>
						</td>
						<!-- SEGURO -->
						<td align="center"
						    valign="top"
						    width="14%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">0.00 &#xA0;</font>
						</td>
						<!-- CIF / CPT / CFR -->
						<td align="center"
						    valign="top"
						    width="14%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">0.00 &#xA0;</font>
						</td>
						<!-- TÉRMINOS -->
						<td align="center"
						    valign="top"
						    width="16%">
							<!--<xsl:variable name="delimiter">
								    <xsl:text>*</xsl:text>
								</xsl:variable>-->
							<xsl:if test="$varTerminos!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="$varTerminos"/>
								</font>
							</xsl:if>
							<xsl:if test="$varTerminos='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
					</tr>
				</xsl:when>
				<xsl:when test="($varTerminos='FOB' or $varTerminos='FCA') and $varGtoFob='0.00'">
					<tr>
						<!-- EXW -->
						<td align="center"
						    valign="top"
						    width="14%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">0.00 &#xA0;</font>
						</td>
						<!-- GASTO AL FOB = POS 2-->
						<td align="center"
						    valign="top"
						    width="14%">
							<xsl:if test="$varGtoFob!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number($varGtoFob,'###,###,##0.00', 'pen')"/>
								</font>
							</xsl:if>
							<xsl:if test="$varGtoFob='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
						<!-- VALOR FOB = POS3 -->
						<td align="center"
						    valign="top"
						    width="14%">
							<xsl:if test="$varFob!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number($varFob,'###,###,##0.00', 'pen')"/>
								</font>
							</xsl:if>
							<xsl:if test="$varFob='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
						<!-- FLETE -->
						<td align="center"
						    valign="top"
						    width="14%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">0.00 &#xA0;</font>
						</td>
						<!-- SEGURO -->
						<td align="center"
						    valign="top"
						    width="14%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">0.00 &#xA0;</font>
						</td>
						<!-- CIF / CPT / CFR -->
						<td align="center"
						    valign="top"
						    width="14%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">0.00 &#xA0;</font>
						</td>
						<!-- TÉRMINOS -->
						<td align="center"
						    valign="top"
						    width="16%">
							<!--<xsl:variable name="delimiter">
								    <xsl:text>*</xsl:text>
								</xsl:variable>-->
							<xsl:if test="$varTerminos!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="$varTerminos"/>
								</font>
							</xsl:if>
							<xsl:if test="$varTerminos='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
					</tr>
				</xsl:when>
				<xsl:when test="$varTerminos='EXW'">
					<tr>
						<!-- EXW = POS 3 -->
						<td align="center"
						    valign="top"
						    width="14%">
							<xsl:if test="$varFob!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number($varFob,'###,###,##0.00', 'pen')"/>
								</font>
							</xsl:if>
							<xsl:if test="$varFob='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
						<!-- GASTO AL FOB -->
						<td align="center"
						    valign="top"
						    width="14%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">0.00 &#xA0;</font>
						</td>
						<!-- VALOR FOB -->
						<td align="center"
						    valign="top"
						    width="14%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">0.00 &#xA0;</font>
						</td>
						<!-- FLETE -->
						<td align="center"
						    valign="top"
						    width="14%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">0.00 &#xA0;</font>
						</td>
						<!-- SEGURO -->
						<td align="center"
						    valign="top"
						    width="14%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">0.00 &#xA0;</font>
						</td>
						<!-- CIF / CPT / CFR -->
						<td align="center"
						    valign="top"
						    width="14%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">0.00 &#xA0;</font>
						</td>
						<!-- TÉRMINOS -->
						<td align="center"
						    valign="top"
						    width="16%">
							<!--<xsl:variable name="delimiter">
								    <xsl:text>*</xsl:text>
								</xsl:variable>-->
							<xsl:if test="$varTerminos!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="$varTerminos"/>
								</font>
							</xsl:if>
							<xsl:if test="$varTerminos='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<!-- EXW -->
						<td align="center"
						    valign="top"
						    width="14%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">0.00 &#xA0;</font>
						</td>
						<!-- GASTO AL FOB = POS 2 -->
						<td align="center"
						    valign="top"
						    width="14%">
							<xsl:if test="$varGtoFob!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number($varGtoFob,'###,###,##0.00', 'pen')"/>
								</font>
							</xsl:if>
							<xsl:if test="$varGtoFob='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
						<!-- VALOR FOB = POS 3 -->
						<td align="center"
						    valign="top"
						    width="14%">
							<xsl:if test="$varFob!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number($varFob,'###,###,##0.00', 'pen')"/>
								</font>
							</xsl:if>
							<xsl:if test="$varFob='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
						<!-- FLETE = POS 4 -->
						<td align="center"
						    valign="top"
						    width="14%">
							<xsl:if test="$varFlete!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number($varFlete,'###,###,##0.00', 'pen')"/>
								</font>
							</xsl:if>
							<xsl:if test="$varFlete='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
						<!-- SEGURO = POS 5-->
						<td align="center"
						    valign="top"
						    width="14%">
							<xsl:if test="$varSeguro!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number($varSeguro,'###,###,##0.00', 'pen')"/>
								</font>
							</xsl:if>
							<xsl:if test="$varSeguro='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
						<!-- CIF / CPT / CFR  = POS 6 -->
						<td align="center"
						    valign="top"
						    width="14%">
							<xsl:if test="$varCifCptCfr!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="format-number($varCifCptCfr,'###,###,##0.00', 'pen')"/>
								</font>
							</xsl:if>
							<xsl:if test="$varCifCptCfr='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
						<!-- TÉRMINOS -->
						<td align="center"
						    valign="top"
						    width="16%">
							<!--<xsl:variable name="delimiter">
								    <xsl:text>*</xsl:text>
								</xsl:variable>-->
							<xsl:if test="$varTerminos!='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:value-of select="$varTerminos"/>
								</font>
							</xsl:if>
							<xsl:if test="$varTerminos='-'">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">&#xA0;</font>
							</xsl:if>
						</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<p/>
		<table border="1"
		       width="100%"
		       cellpadding="1"
		       cellspacing="0"
		       bordercolor="#000000">
			<tr>
				<!-- VIA -->
				<td align="center"
				    valign="top"
				    width="20%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">VÍA</font>
				</td>
				<!-- PUERTO SALIDA -->
				<td align="center"
				    valign="top"
				    width="20%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">PUERTO SALIDA</font>
				</td>
				<!-- INCOTERM -->
				<td align="center"
				    valign="top"
				    width="14%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">INCOTERM</font>
				</td>
				<!-- OBSERVACIONES -->
				<td align="center"
				    valign="top"
				    width="46%">
					<font face="Arial, Helvetica, sans-serif"
					      size="1">OBSERVACIONES</font>
				</td>
			</tr>
			<tr>
				<!-- VÍA -->
				<td align="center"
				    valign="top"
				    width="20%">
					<xsl:if test="$varVia!='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">
							<xsl:value-of select="$varVia"/>
						</font>
					</xsl:if>
					<xsl:if test="$varVia='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">&#xA0;</font>
					</xsl:if>
				</td>
				<!-- PUERTO SALIDA -->
				<td align="center"
				    valign="top"
				    width="20%">
					<xsl:if test="$varPtoSalida!='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">
							<xsl:value-of select="$varPtoSalida"/>
						</font>
					</xsl:if>
					<xsl:if test="$varPtoSalida='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">&#xA0;</font>
					</xsl:if>
				</td>
				<!-- INCOTERM -->
				<td align="center"
				    valign="top"
				    width="14%">
					<xsl:if test="$varIncoterm!='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">
							<xsl:value-of select="$varIncoterm"/>
						</font>
					</xsl:if>
					<xsl:if test="$varIncoterm='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">&#xA0;</font>
					</xsl:if>
				</td>
				<!-- OBSERVACIONES -->
				<td align="left"
				    valign="top"
				    width="46%">
					<xsl:if test="$varObs!='-'">&#xA0;
						<font face="Arial, Helvetica, sans-serif"
						      size="1">
							<xsl:value-of select="$varObs"/>
						</font>
					</xsl:if>
					<xsl:if test="$varObs='-'">
						<font face="Arial, Helvetica, sans-serif"
						      size="1">&#xA0;</font>
					</xsl:if>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="Importe_Percepcion">
		<xsl:if test="$Tipo_Fact!='TRANSFERENCIA GRATUITA'">
			<xsl:if test="$varTipoFactura!=1">
				<table border="0"
				       cellSpacing="0"
				       borderColor="#000000"
				       cellPadding="1"
				       width="100%">
					<tr>
						
						<td align="left"
						    width="50%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<b>Percepción (%):</b>&#xA0;</font>
						</td>
						<td align="left"
						    width="10%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='08' or pe:Codigo='8'">
										<xsl:if test="pe:Valor !='-'">
											<xsl:value-of select="substring-before(pe:Valor,'*')"/>&#xA0;
											<br/>
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='08' or pe1:Codigo='8'">
										<xsl:if test="pe1:Valor!='-'">
											<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='08' or pe2:Codigo='8'">
										<xsl:if test="pe2:Valor!='-'">
											<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
							</font>
						</td>
						
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='12'">
								<xsl:if test="substring-before(pe:Valor,'*')='2003'">
									<td colspan="2"
									    align="right"
									    width="55%">
										<font face="Arial, Helvetica, sans-serif"
										      size="1">
											<b>BN - Cta. Cte de Detracción:</b>00-000-382159</font>
									</td>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='12'">
								<xsl:if test="substring-before(pe1:Valor,*)='2003'">
									<td colspan="2"
									    align="right"
									    width="55%">
										<font face="Arial, Helvetica, sans-serif"
										      size="1">
											<b>BN - Cta. Cte de Detracción:</b>00-000-382159</font>
									</td>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='12'">
								<xsl:if test="substring-before(pe2:Valor,*)='2003'">
									<td colspan="2"
									    align="right"
									    width="55%">
										<font face="Arial, Helvetica, sans-serif"
										      size="1">
											<b>BN - Cta. Cte de Detracción:</b>00-000-382159</font>
									</td>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
					</tr>
					<tr>
						
						<td align="left"
						    width="55%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<b>Monto Percepción:</b>
							</font>
						</td>
						<td align="left"
						    width="10%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
									<xsl:if test="cbc:ID='2001'">
										<xsl:if test="cbc:PayableAmount!='0'">
											<xsl:value-of select="cbc:PayableAmount"/>
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='08' or pe:Codigo='8'">
										<xsl:if test="pe:Valor !='-'">
											<xsl:value-of select="substring-before(substring-after(pe:Valor,'*'),'*')"/>&#xA0;
											<br/>
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='08' or pe1:Codigo='8'">
										<xsl:if test="pe1:Valor!='-'">
											<xsl:value-of select="substring-before(substring-after(pe1:Valor,'*'),'*')"/>&#xA0;
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='08' or pe2:Codigo='8'">
										<xsl:if test="pe2:Valor!='-'">
											<xsl:value-of select="substring-before(substring-after(pe2:Valor,'*'),'*')"/>&#xA0;
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
							</font>
						</td>
					</tr>
					<tr>
						
						<td align="left"
						    width="50%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<b>Importe a Pagar:</b>
							</font>
						</td>
						<td align="left"
						    width="15%">
							<font face="Arial, Helvetica, sans-serif"
							      size="1">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
									<xsl:if test="cbc:ID='2001'">
										<xsl:value-of select="sac:TotalAmount"/>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='08' or pe:Codigo='8'">
										<xsl:if test="pe:Valor !='-'">
											<xsl:value-of select="substring-before(substring-after(substring-after(pe:Valor,'*'),'*'),'*')"/>&#xA0;
											<br/>
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='08' or pe1:Codigo='8'">
										<xsl:if test="pe1:Valor!='-'">
											<xsl:value-of select="substring-before(substring-after(substring-after(pe1:Valor,'*'),'*'),'*')"/>&#xA0;
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='08' or pe2:Codigo='8'">
										<xsl:if test="pe2:Valor!='-'">
											<xsl:value-of select="substring-before(substring-after(substring-after(pe2:Valor,'*'),'*'),'*')"/>&#xA0;
										</xsl:if>
									</xsl:if>
								</xsl:for-each>
							</font>
						</td>
						<!--<td align="left"
						    width="35%">&#xA0;</td>
						<td align="left"
						    width="20%">&#xA0;</td>-->
					</tr>
				</table>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Observacion">
	</xsl:template>
	<xsl:template name="DESPACIO">
		<table border="0"
		       cellSpacing="0"
		       borderColor="#000000"
		       cellPadding="1"
		       width="50%">
			<tr>
				<td align="left"
				    width="100%"
				    valign="top">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.2"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="DFORMAPAGO">
		<!--<xsl:if test="$Tipo_Fact!='TRANSFERENCIA GRATUITA'">-->
		<!--<xsl:if test="//cbc:Note/@languageLocaleID[1]!='1002'">-->
		<!--<xsl:if test="$varTipoFactura!=1">  varImporteTotalGrat -->
		<table border="0"
		       cellSpacing="0"
		       borderColor="#000000"
		       cellPadding="1"
		       width="70%">
			<tr>
				<td align="left"
				    width="70%"
				    valign="top">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.2">INFORMACIÓN DEL CRÉDITO</font>
				</td>
				<td align="right"
				    width="30%"
				    valign="top">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.2"/>
				</td>
			</tr>
			<tr>
				<td align="left"
				    width="70%"
				    valign="top">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.2">Importe pendiente de pago :</font>
				</td>
				<td align="right"
				    width="30%"
				    valign="top">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.2">
						<xsl:for-each select="//cac:PaymentTerms">
							<!--<xsl:if test="position()=1">							
										<xsl:value-of select="cbc:Amount"/>&#xA0;										
									</xsl:if>-->
							<xsl:if test="cbc:PaymentMeansID='Credito' or cbc:PaymentMeansID='Contado'">
								<xsl:value-of select="cbc:Amount"/>&#xA0;										
									</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>
			<tr>
				<td align="left"
				    width="70%"
				    valign="top">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.2">Total de cuotas</font>
				</td>
				<td align="right"
				    width="30%"
				    valign="top">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.2">
						<xsl:for-each select="//cac:PaymentTerms">
							<!--<xsl:if test="position()=2">							
										<xsl:value-of select="substring(cbc:PaymentMeansID,6,3)"/>
									</xsl:if>-->
							<xsl:if test="substring(cbc:PaymentMeansID,1,5) = 'Cuota'">
								<xsl:value-of select="substring(cbc:PaymentMeansID,6,3)"/>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>
		</table>
		<table border="0"
		       cellSpacing="0"
		       borderColor="#000000"
		       cellPadding="1"
		       width="50%">
			<tr>
				<td width="100%"
				    align="left">
					<table border="1"
					       cellSpacing="0"
					       borderColor="#000000"
					       cellPadding="1"
					       width="100%">
						<tr>
							<td align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>Nro Cuota</strong>
								</font>
							</td>
							<td align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>Fec. Venc.</strong>
								</font>
							</td>
							<td align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>Monto</strong>
								</font>
							</td>
						</tr>
						<tr>
							<td align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:for-each select="//cac:PaymentTerms">
										<xsl:if test="substring(cbc:PaymentMeansID,1,5) = 'Cuota'">
											<xsl:value-of select="cbc:PaymentMeansID"/>&#xA0;										
											</xsl:if>
									</xsl:for-each>
								</font>
							</td>
							<td align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:for-each select="//cac:PaymentTerms">
										<xsl:if test="cbc:PaymentDueDate!=''">
											<xsl:value-of select="cbc:PaymentDueDate"/>&#xA0;										
											</xsl:if>
									</xsl:for-each>
								</font>
							</td>
							<td align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<xsl:for-each select="//cac:PaymentTerms">
										<xsl:if test="substring(cbc:PaymentMeansID,1,5) = 'Cuota'">
											<xsl:value-of select="cbc:Amount"/>&#xA0;										
											</xsl:if>
									</xsl:for-each>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<!--</xsl:if>-->
		<!--</xsl:if>-->
	</xsl:template>
	<xsl:template name="Referencia">
		<xsl:if test="/pe1:CreditNote!='' or /pe2:DebitNote!=''">
			<xsl:choose>
				<xsl:when test="/pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='13'">
					<table border="0"
					       cellSpacing="0"
					       borderColor="#000000"
					       cellPadding="1"
					       width="50%">
						<tr>
							<td>
								<table border="0"
								       cellSpacing="0"
								       borderColor="#000000"
								       cellPadding="0"
								       width="100%">
									<tr>
										<td width="100%"
										    align="left">
											<font face="Arial, Helvetica, sans-serif"
											      size="1">DOCUMENTO DE REFERENCIA :</font>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="100%"
							    align="left">
								<table border="1"
								       cellSpacing="0"
								       borderColor="#000000"
								       cellPadding="1"
								       width="100%">
									<tr>
										<td align="center">
											<font face="Arial, Helvetica, sans-serif"
											      size="1">
												<strong>Tipo de Documento</strong>
											</font>
										</td>
										<td align="center">
											<font face="Arial, Helvetica, sans-serif"
											      size="1">
												<strong>Correlativo</strong>
											</font>
										</td>
										<td align="center">
											<font face="Arial, Helvetica, sans-serif"
											      size="1">
												<strong>F. Emisión</strong>
											</font>
										</td>
										<td align="center">
											<font face="Arial, Helvetica, sans-serif"
											      size="1">
												<strong>N. Fecha Vcto</strong>
											</font>
										</td>
									</tr>
									<xsl:for-each select="//cac:DespatchDocumentReference">
										<xsl:if test="cbc:DocumentTypeCode != '10'">
											<tr>
												<td align="center">
													<font face="Arial, Helvetica, sans-serif"
													      size="1">
														<xsl:choose>
															<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
															<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
															<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
															<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
															<xsl:otherwise>Documento NN</xsl:otherwise>
														</xsl:choose>
													</font>
												</td>
												<td align="center">
													<font face="Arial, Helvetica, sans-serif"
													      size="1">
														<xsl:value-of select="cbc:ID"/>
													</font>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
										<xsl:if test="cbc:DocumentTypeCode != '10'">
											<tr>
												<td width="25%"
												    align="center">
													<font face="Arial, Helvetica, sans-serif"
													      size="1">
														<xsl:choose>
															<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
															<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
															<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
															<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
															<xsl:otherwise>Documento NN</xsl:otherwise>
														</xsl:choose>
													</font>
												</td>
												<td width="25%"
												    align="center">
													<font face="Arial, Helvetica, sans-serif"
													      size="1">
														<xsl:value-of select="cbc:ID"/>
													</font>
												</td>
												<td width="25%"
												    align="center">
													<font face="Arial, Helvetica, sans-serif"
													      size="1">
														<xsl:call-template name="TraeValorVariable">
															<xsl:with-param name="varNumVA"
															                select="16"/>
														</xsl:call-template>
													</font>
												</td>
												<td width="25%"
												    align="center">
													<font face="Arial, Helvetica, sans-serif"
													      size="1">
														<xsl:if test="//cac:PaymentTerms/cbc:ID='FormaPago' and //cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
															<xsl:for-each select="/pe1:CreditNote/cac:PaymentTerms">
																<xsl:value-of select="cbc:PaymentDueDate"/>
															</xsl:for-each>
														</xsl:if>
													</font>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</table>
							</td>
						</tr>
						<tr>
							<td>&#xA0;</td>
						</tr>
						<tr>
							<td width="100%"
							    align="left"
							    colspan="2">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">SUSTENTO :&#xA0;
							<xsl:value-of select="pe1:CreditNote/cac:DiscrepancyResponse/cbc:Description"/>
									<xsl:value-of select="pe2:DebitNote/cac:DiscrepancyResponse/cbc:Description"/>
								</font>
							</td>
						</tr>
					</table>
				</xsl:when>
				<xsl:otherwise>
					<table border="0"
					       cellSpacing="0"
					       borderColor="#000000"
					       cellPadding="1"
					       width="94%">
						<tr>
							<td>
								<table border="0"
								       cellSpacing="0"
								       borderColor="#000000"
								       cellPadding="0"
								       width="100%">
									<tr>
										<td width="100%"
										    align="left">
											<font face="Arial, Helvetica, sans-serif"
											      size="1">DOCUMENTO DE REFERENCIA :</font>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="100%"
							    align="left">
								<!--<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
							<tr>
								<td align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Tipo de Documento</strong>
									</font>
								</td>
								<td align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Correlativo</strong>
									</font>
								</td>
							</tr>
							<xsl:for-each select="//cac:DespatchDocumentReference">
								<xsl:if test="cbc:DocumentTypeCode != '10'">
									<tr>
										<td align="center">
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
										<td align="center">
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
										<td width="50%" align="center">
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
										<td width="50%" align="center">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:value-of select="cbc:ID"/>
											</font>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</table>-->
								<table border="1"
								       cellSpacing="0"
								       borderColor="#000000"
								       cellPadding="0"
								       width="100%">
									<tr>
										<td>
											<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
												<xsl:if test="cbc:DocumentTypeCode != '10'">
													<font face="Arial, Helvetica, sans-serif"
													      size="1">
														<xsl:value-of select="cbc:ID"/> /
												</font>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>&#xA0;</td>
						</tr>
						<tr>
							<td width="100%"
							    align="left"
							    colspan="2">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">SUSTENTO :&#xA0;
							<xsl:value-of select="pe1:CreditNote/cac:DiscrepancyResponse/cbc:Description"/>
									<xsl:value-of select="pe2:DebitNote/cac:DiscrepancyResponse/cbc:Description"/>
								</font>
							</td>
						</tr>
					</table>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Datosadicionales">
		<table cellSpacing="0"
		       cellPadding="0"
		       width="100%"
		       border="1">
			<tbody>
				<tr>
					<td width="50%">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='2001'">
								<xsl:if test="cbc:PayableAmount!='0'">
									<font face="Arial, Helvetica, sans-serif"
									      size="1">
										<strong>OPERACION SUJETA A PERCEPCIÓN DEL IGV (2%)</strong>
									</font>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
					</td>
					<td width="12%"
					    align="right">
						<font color="#000000"
						      size="1"
						      face="Arial, Helvetica, sans-serif">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2001'">
									<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
					<td width="11%">
					</td>
					<td width="47%">
						<font color="#000000"
						      size="1"
						      face="Arial, Helvetica, sans-serif">
							<strong>Por. Resol. SUNAT 013-2006. Somos agentes de Percepción</strong>
						</font>
					</td>
				</tr>
				<tr>
					<td width="30%">
						<font color="#000000"
						      size="1"
						      face="Arial, Helvetica, sans-serif">
							<!--
							CION:-->
						</font>
					</td>
					<td width="12%"
					    align="right">
						<font color="#000000"
						      size="1"
						      face="Arial, Helvetica, sans-serif">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='10'">
									<xsl:value-of select="format-number(pe:Valor,'###,###,##0.##','pen')"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='10'">
									<xsl:value-of select="format-number(pe1:Valor,'###,###,##0.##','pen')"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='10'">
									<xsl:value-of select="format-number(pe2:Valor,'###,###,##0.##','pen')"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
					<td width="11%">
					</td>
					<td width="47%">
						<font color="#000000"
						      size="1"
						      face="Arial, Helvetica, sans-serif">
							<strong>AGENTE DE RETENCIÓN DEL IGV R.S. 037-2002 / SUNAT</strong>
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Datos_Sunat">
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
	<xsl:template name="descripcionLeyenda">
		<xsl:param name="leye"/>
		<xsl:value-of select="substring-before($leye,'*')"/>
		<br/>
		<xsl:variable name="ley"
		              select="substring-after($leye,'*')"/>
		<xsl:if test="$ley!=''">
			<xsl:call-template name="descripcionLeyenda">
				<xsl:with-param name="leye"
				                select="$ley"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="lineaB3">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr>
				<td align="left"
				    valign="top"
				    width="100%">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.2">
					</font>
				</td>
			</tr>
			<xsl:call-template name="lineaB3">
				<xsl:with-param name="cont"
				                select="$cont - 2"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\out\20100018625&#x2D;01&#x2D;F007&#x2D;00106424.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="..\xml\20520929658&#x2D;01&#x2D;FF11&#x2D;66000002.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"></template><template name="Total"><block path="table/tr[1]/td/font/xsl:for&#x2D;each" x="213" y="5"/><block path="table/tr[1]/td/font/xsl:for&#x2D;each/xsl:if/=[0]" x="277" y="33"/><block path="table/tr[1]/td/font/xsl:for&#x2D;each/xsl:if" x="323" y="35"/><block path="table/tr[1]/td/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="273" y="65"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="260" y="27"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="15"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="410" y="17"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="40" y="87"/><block path="table/tr[1]/td[2]/font/xsl:for&#x2D;each" x="93" y="5"/><block path="table/tr[1]/td[2]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="0" y="33"/><block path="table/tr[1]/td[2]/font/xsl:for&#x2D;each/xsl:if" x="43" y="35"/><block path="table/tr[1]/td[2]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="113" y="65"/><block path="table/tr[1]/td[3]/font/xsl:for&#x2D;each" x="323" y="75"/><block path="table/tr[1]/td[3]/font/xsl:for&#x2D;each/xsl:value&#x2D;of" x="273" y="65"/><block path="table/tr[1]/td[4]/font/xsl:for&#x2D;each" x="53" y="85"/><block path="table/tr[1]/td[4]/font/xsl:for&#x2D;each/xsl:if/!=[0]" x="117" y="73"/><block path="table/tr[1]/td[4]/font/xsl:for&#x2D;each/xsl:if" x="163" y="75"/><block path="table/tr[1]/td[4]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="273" y="65"/><block path="table/tr[1]/td[4]/font/xsl:for&#x2D;each[1]" x="13" y="85"/><block path="table/tr[1]/td[4]/font/xsl:for&#x2D;each[1]/xsl:if/!=[0]" x="197" y="33"/><block path="table/tr[1]/td[4]/font/xsl:for&#x2D;each[1]/xsl:if" x="243" y="35"/><block path="table/tr[1]/td[4]/font/xsl:for&#x2D;each[1]/xsl:if/xsl:value&#x2D;of" x="273" y="65"/><block path="table/tr[1]/td[4]/font/xsl:for&#x2D;each[2]" x="213" y="5"/><block path="table/tr[1]/td[4]/font/xsl:for&#x2D;each[2]/xsl:if/!=[0]" x="197" y="33"/><block path="table/tr[1]/td[4]/font/xsl:for&#x2D;each[2]/xsl:if" x="243" y="35"/><block path="table/tr[1]/td[4]/font/xsl:for&#x2D;each[2]/xsl:if/xsl:value&#x2D;of" x="273" y="65"/><block path="table/tr[1]/td[5]/xsl:if/!=[0]" x="227" y="63"/><block path="table/tr[1]/td[5]/xsl:if" x="273" y="65"/><block path="table/tr[1]/td[5]/xsl:if/font/xsl:value&#x2D;of" x="273" y="65"/><block path="table/tr[1]/td[5]/xsl:if[1]/!=[0]" x="227" y="63"/><block path="table/tr[1]/td[5]/xsl:if[1]" x="273" y="65"/><block path="table/tr[1]/td[5]/xsl:if[1]/font/xsl:value&#x2D;of" x="273" y="65"/><block path="table/tr[1]/td[6]/font/xsl:for&#x2D;each" x="213" y="5"/><block path="table/tr[1]/td[6]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="197" y="33"/><block path="table/tr[1]/td[6]/font/xsl:for&#x2D;each/xsl:if" x="243" y="35"/><block path="table/tr[1]/td[6]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="273" y="65"/><block path="table/tr[1]/td[7]/font/xsl:for&#x2D;each" x="213" y="5"/><block path="table/tr[1]/td[7]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="197" y="33"/><block path="table/tr[1]/td[7]/font/xsl:for&#x2D;each/xsl:if" x="243" y="35"/><block path="table/tr[1]/td[7]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="273" y="65"/></template><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->