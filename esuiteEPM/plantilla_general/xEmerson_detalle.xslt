<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" exclude-result-prefixes="cac cbc ccts ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<!-- <xsl:variable name="OpeGrat"> -->
		<!-- <xsl:value-of select="0.00"/> -->

		<!-- <xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal"> -->
			<!-- <xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'"> -->
				<!-- <xsl:value-of select="cbc:TaxableAmount"/> -->
			<!-- </xsl:if> -->
		<!-- </xsl:for-each> -->

		<!-- <xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal"> -->
			<!-- <xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'"> -->
				<!-- <xsl:value-of select="cbc:TaxableAmount"/> -->
			<!-- </xsl:if> -->
		<!-- </xsl:for-each> -->
		<!-- <xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal"> -->
			<!-- <xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'"> -->
				<!-- <xsl:value-of select="cbc:TaxableAmount"/> -->
			<!-- </xsl:if> -->
		<!-- </xsl:for-each> -->
	<!-- </xsl:variable> -->

	<xsl:template name="Detalle">

			<table rules="all" width="100%" cellpadding="0" cellspacing="0" border="1" class="tipo2">
			<tbody>
			<tr>
							<td width="7%" align="center">
								
									<strong>Item</strong>
								
							</td>
							
							<td width="7%" align="center">
								
									<strong>Cant.</strong>
								
							</td>
							<td width="7%" align="center">
								
									<strong>Unid.</strong>
								
							</td>
							<td width="51%" align="center">
								
									<strong>Descripción</strong>
								
							</td>
							
			
							<td width="14%" align="center">
									<strong>Precio<br/>
									Unitario</strong>
							</td>

							<td width="14%" align="center">
									<strong>Valor<br/>
									Venta</strong>
								
							</td>
			</tr>

</tbody>
</table>

			<table rules="cols" cellpadding="0" cellspacing="0" width="100%" border="1" class="tipo2">
				
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
                           
							<tr>
								<!-- ITEM -->
								
								<td width="7%" align="center" valign="top">
								<br/>
									<xsl:value-of select="cbc:ID"/>
									
								</td>
								
								<!--CANTIDAD-->
								<td width="7%" align="right" valign="top">
								<br/>
										<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>&#xA0;
										
								</td>
								
								<!--UNIDAD-->
								<td width="7%" align="center" valign="top">	
								<br/>						
									<xsl:call-template name="unidad_medida"/>
									
								</td>
								
								<!--DESCRIPCION-->
								<td width="51%" align="left" valign="top">
								<br/>
										<xsl:value-of select="cac:Item/cbc:Description"/>
										
										<!--<br/>-->
										<xsl:variable name="ValorAdicional1"><!--substring(cbc:ID,3,1)-->
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
												<xsl:with-param name="NumAd" select="1"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:variable name="ValorAdicional2">
											<xsl:if test="$ValorAdicional1 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="2"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>
										<xsl:variable name="ValorAdicional3">
											<xsl:if test="$ValorAdicional2 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="3"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>
										
										<xsl:variable name="ValorAdicional4">
											<xsl:if test="$ValorAdicional3 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="4"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional5">
											<xsl:if test="$ValorAdicional4 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="5"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional6">
											<xsl:if test="$ValorAdicional5 != ''">
												<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="6"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional7">
											<xsl:if test="$ValorAdicional6 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="7"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional8">
											<xsl:if test="$ValorAdicional7 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="8"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional9">
											<xsl:if test="$ValorAdicional8 != ''">
												<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="9"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional10">
											<xsl:if test="$ValorAdicional9 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="10"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional11">
											<xsl:if test="$ValorAdicional10 != ''">
												<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="11"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional12">
											<xsl:if test="$ValorAdicional11 != ''">
												<xsl:call-template name="RetourneValAdItem">
												    <xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="12"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional13">
											<xsl:if test="$ValorAdicional12 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="13"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional14">
											<xsl:if test="$ValorAdicional13 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="14"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional15">
											<xsl:if test="$ValorAdicional14 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="15"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional16">
											<xsl:if test="$ValorAdicional15 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="16"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional17">
											<xsl:if test="$ValorAdicional16 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="17"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional18">
											<xsl:if test="$ValorAdicional17 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="18"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional19">
											<xsl:if test="$ValorAdicional18 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="19"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional20">
											<xsl:if test="$ValorAdicional19 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="20"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 !='-' ">
											<br/><xsl:value-of select="$ValorAdicional1"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional2 != '' and $ValorAdicional2 !='-'">
											<br/><xsl:value-of select="$ValorAdicional2"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional3 != '' and $ValorAdicional3 !='-'">
											<br/><xsl:value-of select="$ValorAdicional3"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional4 != '' and $ValorAdicional4 !='-'">
											<br/><xsl:value-of select="$ValorAdicional4"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional5 != '' and $ValorAdicional5 !='-'">
											<br/><xsl:value-of select="$ValorAdicional5"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional6 != '' and $ValorAdicional6 !='-'">
											<br/><xsl:value-of select="$ValorAdicional6"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional7 != '' and $ValorAdicional7 !='-'">
											<br/><xsl:value-of select="$ValorAdicional7"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional8 != '' and $ValorAdicional8 !='-'">
											<br/><xsl:value-of select="$ValorAdicional8"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional9 != '' and $ValorAdicional9 !='-'">
											<br/><xsl:value-of select="$ValorAdicional9"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional10 != '' and $ValorAdicional10 !='-'">
											<br/><xsl:value-of select="$ValorAdicional10"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional11 != '' and $ValorAdicional11 !='-'">
											<br/><xsl:value-of select="$ValorAdicional11"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional12 != '' and $ValorAdicional12 !='-'">
											<br/><xsl:value-of select="$ValorAdicional12"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional13 != '' and $ValorAdicional13 !='-'">
											<br/><xsl:value-of select="$ValorAdicional13"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional14 != '' and $ValorAdicional14 !='-'">
											<br/><xsl:value-of select="$ValorAdicional14"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional15 != '' and $ValorAdicional15 !='-'">
											<br/><xsl:value-of select="$ValorAdicional15"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional16 != '' and $ValorAdicional16 !='-'">
											<br/><xsl:value-of select="$ValorAdicional16"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional17 != '' and $ValorAdicional17 !='-'">
											<br/><xsl:value-of select="$ValorAdicional17"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional18 != '' and $ValorAdicional18 !='-'">
											<br/><xsl:value-of select="$ValorAdicional18"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional19 != '' and $ValorAdicional19 !='-'">
											<br/><xsl:value-of select="$ValorAdicional19"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional20 != '' and $ValorAdicional20 !='-'">
											<br/><xsl:value-of select="$ValorAdicional20"/>
										</xsl:if>
								</td>
								
							<xsl:if test="$OpeGrat=0">
								<!-- PRECIO UNIT.-->
								<td width="14%" align="right" valign="top">
								<br/>
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
										
								</td>

								<!--VALOR VTA.-->
								<td width="14%" align="right" valign="top">
								<br/>
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
										&#xA0;
										
								</td>
							</xsl:if>

							<xsl:if test="$OpeGrat>'0'">
								<!-- PRECIO UNIT.-->
								<td width="14%" align="right" valign="top">
								<br/>
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount*1.18,'###,###,##0.00','pen')"/>&#xA0;
										
								</td>

								<!--VALOR VTA.-->
								<td width="14%" align="right" valign="top">
								<br/>
										<xsl:value-of select="format-number(cbc:LineExtensionAmount*1.18,'###,###,##0.00','pen')"/>
										&#xA0;
										
								</td>
							</xsl:if>
										
								
							</tr>
						
						</xsl:for-each>
															

						<xsl:for-each select="//pe:Invoice/cac:PrepaidPayment">
							
							<tr>
								<!-- ITEM -->
								<td width="7%" align="center">
															
										<!--<xsl:value-of select="count(//pe:Invoice/cac:InvoiceLine) + 1"/>-->
										
								</td>
								
								<!--CANTIDAD-->
								<td width="7%" align="right">
										
								</td>
								
								<!--UNIDAD-->
								<td width="7%" align="center">
										
								</td>
								
								<!--DESCRIPCION-->
								<td width="51%" align="left">
								<br/>
										<xsl:value-of select="cbc:ID"/> : &#xA0; DCTO. POR ANTICIPO
								</td>
								
								<!-- PRECIO UNIT.-->
								<td width="14%" align="right">
								<br/>
										
								</td>

								<!--VALOR VTA.-->
								<td width="14%" align="right">
								<br/>
									<xsl:value-of select="format-number(cbc:PaidAmount,'###,###,##0.00','pen')"/>&#xA0;
										&#xA0;
								</td>
							
								
								
							</tr>
							
						</xsl:for-each>

						
						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<tr>
								<!-- ITEM -->
								<td width="7%" align="center">
								<!--<br/>-->
										<xsl:value-of select="cbc:ID"/>
								</td>
								
								<!--CANTIDAD-->
								<td width="7%" align="right">
								<!--<br/>-->
										<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>&#xA0;
								</td>
								<!--UNIDAD-->
								<td width="7%" align="center">
								<!--<br/>-->
										<xsl:call-template name="unidad_medida"/>
								</td>
								<!--DESCRIPCION-->
								<td width="51%" align="left">
								<!--<br/>-->
										<xsl:value-of select="cac:Item/cbc:Description"/>
								</td>
								
								<!-- PRECIO UNIT.-->
								<td width="14%" align="right">
								<!--<br/>-->
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
								</td>

								<td width="14%" align="right">
								<!--<br/>-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
										&#xA0;
								</td>
								
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<tr>
								<!-- ITEM -->
								<td width="7%" align="center">
								<!--<br/>-->
										<xsl:value-of select="cbc:ID"/>
								</td>
							
								<!--CANTIDAD-->
								<td width="7%" align="right">
								<!--<br/>-->
										<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>&#xA0;
								</td>
								<!--UNIDAD-->
								<td width="7%" align="center">
								<!--<br/>-->
									<xsl:call-template name="unidad_medida"/>
								</td>
								<!--DESCRIPCION-->
								<td width="51%" align="left">
								<!--<br/>-->
										<xsl:value-of select="cac:Item/cbc:Description"/>
								</td>
								
																				
								<!-- PRECIO UNIT.-->
								<td width="14%" align="right">
								<!--<br/>-->
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;
								</td>

								<td width="14%" align="right">
								<!--<br/>-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
										&#xA0;
								</td>


							</tr>
						</xsl:for-each>

						<tr>
								<!-- ITEM -->
								<td width="7%" align="center">
									
								</td>
								
								<!--CANTIDAD-->
								<td width="7%" align="right">
										
								</td>
								
								<!--UNIDAD-->
								<td width="7%" align="center">							
									
								</td>
								
								<!--DESCRIPCION-->
								<td width="51%" align="left">
								<br/>
										<xsl:call-template name="TraeValorVariable">
     										<xsl:with-param name="varNumVA" select="03"/>
										</xsl:call-template>
								</td>
								
								<!-- VALOR UNIT.-->
								<td width="14%" align="right">
										
								</td>

								<!--VALOR VTA.-->
								<td width="14%" align="right">
										
								</td>
							</tr>

						<!-- <xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>			                        
									<td align="center" valign="top" width="15%">
										<xsl:call-template name="total"/>
									</td>
								</tr>
							</table>
						</xsl:call-template> -->
						<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>
		</table>
	</xsl:template>

	
	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		
		<xsl:if test="$cont&gt;0">
			<tr>
				<td width="7%" align="center" valign="top">
					<font face="Consolas" size="0.5">&#xA0;</font>
				</td>
				<td width="7%" align="center" valign="top">
					<font face="Consolas" size="0.5">&#xA0;</font>
				</td>
				<td width="7%" align="center" valign="top">
					<font face="Consolas" size="0.5">&#xA0;</font>
				</td>
				<td width="51%" align="center">
					<font face="Consolas" size="0.5">&#xA0;</font>
				</td>
				<td width="14%" align="center" valign="top">
					<font face="Consolas" size="0.5">&#xA0;</font>
				</td>
				<td width="14%" align="center" valign="top">
					<font face="Consolas" size="0.5">&#xA0;</font>
				</td>
				
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="unidad_medida">
	<xsl:if test="/pe:Invoice">
		<xsl:choose>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='C62'">C/U</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='C62'">PZA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PR'">PAR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PK'">PQT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTR'">MTR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='ST'">HOJ</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='RO'">ROL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='JR'">FCO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PD'">BLK</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SET'">JGO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR'">L</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BX'">CJA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='AV'">CAP</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FOT'">PIE</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE'">TM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='ST'">PGO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BG'">BLS</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CA'">LTA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='STN'">TON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGS'">KGS</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTK'">P2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR'">LBS</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NPT'">EQP</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GRM'">G</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='5B'">LOT</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
		</xsl:if>
		
		<xsl:if test="/pe1:CreditNote" >		
		<xsl:choose>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='C62'">C/U</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='C62'">PZA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PR'">PAR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PK'">PQT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTR'">MTR</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='ST'">HOJ</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='RO'">ROL</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='JR'">FCO</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PD'">BLK</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='SET'">JGO</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LTR'">L</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BX'">CJA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='AV'">CAP</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='FOT'">PIE</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='TNE'">TM</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='ST'">PGO</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BG'">BLS</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='CA'">LTA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTQ'">M3</xsl:when>	
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTK'">M2</xsl:when>			
			<xsl:when test="cbc:CreditedQuantity/@unitCode='STN'">TON</xsl:when>			
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KGS'">KGS</xsl:when>			
			<xsl:when test="cbc:CreditedQuantity/@unitCode='FTK'">P2</xsl:when>			
			<xsl:when test="cbc:CreditedQuantity/@unitCode='LBR'">LBS</xsl:when>			
			<xsl:when test="cbc:CreditedQuantity/@unitCode='NPT'">EQP</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='GRM'">G</xsl:when>			
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MLT'">ML</xsl:when>			
			<xsl:when test="cbc:CreditedQuantity/@unitCode='5B'">LOT</xsl:when>			
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
		</xsl:if>
	</xsl:template>

    <xsl:template name="RetourneValAdItem">
		<xsl:param name="NumLinea"/>
		<xsl:param name="NumAd"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
			<xsl:if test="pe1:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\Install\EMERSON\20100020361&#x2D;01&#x2D;F011&#x2D;00000156.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->