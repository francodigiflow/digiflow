<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
	xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
	xmlns:ccts="urn:un:unece:uncefact:documentation:2"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Detalle">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="cols">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1.7">
									<strong>COD. ART.</strong>
								</font>
							</td>
							<td width="45%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1.7">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1.7">
									<strong>UNID.</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1.7">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1.7">
									<strong>VALOR<br/>
									VTA. UNIT.</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1.7">
									<strong>PRECIO<br/>
									 VTA. UNIT.</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1.7">
									<strong>VALOR<br/>
									VENTA</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0" rules="cols">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<tr>
								<!--COD. ART.-->
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1.7">&#xA0;
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="45%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1.7">&#xA0;
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<!--UNIDAD-->
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--CANTIDAD-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.000','pen')"/>&#xA0;
										<!-- xsl:value-of select="cbc:InvoicedQuantity"/ --></font>
								</td>
								<!--VALOR VTA UNIT-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<!-- xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'" -->
										
											<!--<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;-->
											<xsl:value-of select="cac:Price/cbc:PriceAmount"/>&#xA0;
										

											
										<!--/xsl:if>
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
									<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount!='0'">
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;
                        			</xsl:if>
									<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount='0'">		
										<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
                                    		<xsl:if test=" cbc:PriceTypeCode='02'">
                                           		<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160; 
                                    		</xsl:if>
                                		</xsl:for-each>
									</xsl:if>
								</xsl:if --></font>
								</td>
								<!--PRECIO VTA UNIT-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<!-- xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
                     				<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;
                        		</xsl:if>
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
									<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount!='0'" -->
										
									
									<!--<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#xA0;-->
									<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount"/>&#xA0;
									



										<!-- /xsl:if>
									<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount='0'">		
										<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
                                    		<xsl:if test=" cbc:PriceTypeCode='02'">
                                           		<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160; 
                                    		</xsl:if>
                                		</xsl:for-each>
									</xsl:if>
								</xsl:if --></font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<!--<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>-->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>
								</td>
							</tr>
						</xsl:for-each>

						

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<tr>
								<!--CODIGO -->
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1.7">&#xA0;
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="45%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1.7">&#xA0;
										<!--xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/-->
										<xsl:value-of select="cac:Item/cbc:Description"/>
										
									</font>
								</td>
								<!--UNID-->
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--CANTIDAD-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.000','pen')"/>&#xA0;
										<!-- xsl:value-of select="cbc:CreditedQuantity"/ --></font>
								</td>
								<!--VALOR VTA UNIT NO MUESTRA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<!-- xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'" -->

										

										
									<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>


										<!-- /xsl:if>
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
									<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount!='0'">									
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,###.00','pen')"/>&#160;
                        			</xsl:if>
									<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount='0'">
										<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
                                			<xsl:if test=" cbc:PriceTypeCode='02'">
                                       			<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160; 
                                    		</xsl:if>
                                		</xsl:for-each>
									</xsl:if>
								</xsl:if --></font>
								</td>
								<!--PRECIO VTA UNIT-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<!-- xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
                     				<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>&#160;
                        		</xsl:if>
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
									<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount!='0'" -->
		
									
									<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount"/>&#xA0;
									
										<!-- /xsl:if>
									<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount='0'">
										<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
                                			<xsl:if test=" cbc:PriceTypeCode='02'">
                                       			<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##.00','pen')"/>&#160; 
                                    		</xsl:if>
                                		</xsl:for-each>
									</xsl:if>
								</xsl:if --></font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<!--<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font>  -->
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>

											
								</td>
							</tr>
						</xsl:for-each>

						
						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<tr>
								<!--CODIGO-->
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>&#xA0;</font>
								</td>
								<!--DESCRIPCION-->
								<td width="45%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1.7">&#xA0;
										<!--<xsl:value-of select="substring-before(cac:Item/cbc:Description,'*')"/>-->
										<!--<xsl:value-of select="substring-before(cac:Item/cbc:Description,'*')"/> -->
										<xsl:value-of select="cac:Item/cbc:Description"/>

									</font>
								</td>
								<!--UNID-->
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<!--CANTIDAD-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.000','pen')"/>&#xA0;
										<!-- xsl:value-of select="cbc:DebitedQuantity"/ --></font>
								</td>
								<!-- VALOR VTA UNIT-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
									<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'  or //cac:AccountingCustomerParty/cbc:AdditionalAccountID='-' ">
										<xsl:value-of select="cac:Price/cbc:PriceAmount"/>&#xA0;
									</xsl:if>

									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID !='0' ">
										<xsl:value-of select="cac:Price/cbc:PriceAmount"/>&#xA0;
									</xsl:if>
</xsl:if>

						<xsl:if test="//cbc:UBLVersionID='2.1'">
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID='0'  or //cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID='-' ">
										<xsl:value-of select="cac:Price/cbc:PriceAmount"/>&#xA0;
									</xsl:if>

									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID !='0' ">
										<xsl:value-of select="cac:Price/cbc:PriceAmount"/>&#xA0;
									</xsl:if>
</xsl:if>
								</font>

								</td>
								<!--PRECIO VTA UNIT-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<xsl:if test="//cbc:UBLVersionID='2.0'">
										<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'  or //cac:AccountingCustomerParty/cbc:AdditionalAccountID='-' ">
											<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount"/>&#xA0;
										</xsl:if>

										<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID !='0' ">
											<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount"/>&#xA0;
										</xsl:if>
										</xsl:if>

										<xsl:if test="//cbc:UBLVersionID='2.1'">
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID='0'  or //cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID='-' ">
											<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount"/>&#xA0;
										</xsl:if>

										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID !='0' ">
											<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount"/>&#xA0;
										</xsl:if>
										</xsl:if>

									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<!--<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;</font> -->

										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;</font>


								</td>
							</tr>
						</xsl:for-each>
							<tr>
								<!--CODIGO-->
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										&#xA0;
									</font>
								</td>
								<!--DESCRIPCION-->
								<td width="45%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">
											<xsl:variable name="AdicionalCabecera33">
												<xsl:call-template name="RetourneValAd">
													<xsl:with-param name="NumAd"
													                select="33"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="AdicionalCabecera34">
												<xsl:call-template name="RetourneValAd">
													<xsl:with-param name="NumAd"
													                select="34"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="AdicionalCabecera35">
												<xsl:call-template name="RetourneValAd">
													<xsl:with-param name="NumAd"
													                select="35"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="AdicionalCabecera36">
												<xsl:call-template name="RetourneValAd">
													<xsl:with-param name="NumAd"
													                select="36"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="AdicionalCabecera37">
												<xsl:call-template name="RetourneValAd">
													<xsl:with-param name="NumAd"
													                select="37"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$AdicionalCabecera33!='' or $AdicionalCabecera33!='-' ">
												<br/>
												&#xA0;<xsl:value-of select="$AdicionalCabecera33"/><br/>
											</xsl:if>
											<xsl:if test="$AdicionalCabecera34!='' or $AdicionalCabecera34!='-' ">
												&#xA0;<xsl:value-of select="$AdicionalCabecera34"/><br/>
											</xsl:if>
											<xsl:if test="$AdicionalCabecera35!='' or $AdicionalCabecera35!='-' ">
												&#xA0;<xsl:value-of select="$AdicionalCabecera35"/><br/>
											</xsl:if>
											<xsl:if test="$AdicionalCabecera36!='' or $AdicionalCabecera36!='-' ">
												&#xA0;<xsl:value-of select="$AdicionalCabecera36"/><br/>
											</xsl:if>
											<xsl:if test="$AdicionalCabecera37!='' or $AdicionalCabecera37!='-' ">
												&#xA0;<xsl:value-of select="$AdicionalCabecera37"/><br/>
											</xsl:if>
											
										</xsl:if>
									</font>
								</td>
								<!--UNID-->
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										&#xA0;
									</font>
								</td>
								<!--CANTIDAD-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										&#xA0;
									</font>
								</td>
								<!-- VALOR VTA UNIT-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										&#xA0;
									</font>
								</td>
								<!--PRECIO VTA UNIT-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										&#xA0;
									</font>
								</td>
								<!--VALOR VENTA-->
								<td width="10%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1.7">
										&#xA0;
									</font>
								</td>
							</tr>
						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="RetourneValAd">
		<xsl:param name="NumAd"/>
		<!-- Se especifica el numero de linea y adicional para su ubicacion y extraccion -->
		<!-- Se indica que el proceso debe raelizarse para todos los tipos de documento Factura/Boleta y Notas de Credito/Debito -->
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo = $NumAd">
				<xsl:if test="pe:Valor != '-'">
					<xsl:value-of select="pe:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo = $NumAd">
				<xsl:if test="pe1:Valor != '-'">
					<xsl:value-of select="pe1:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo = $NumAd">
				<xsl:if test="pe2:Valor != '-'">
					<xsl:value-of select="pe2:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<!--<tr height="8px">-->
			<tr>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
					</font>
				</td>
				<td width="45%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
						
						

					</font>
				</td>
				<td width="5%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;
					</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 2"/>
			</xsl:call-template>
		</xsl:if>
			
	</xsl:template>


	<xsl:template name="unidad_medida">
		<xsl:choose>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='EA'">C/U</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BO'">FRA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL'">GLN</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PK'">PAQ</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NIU'">PZ</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='C62'">PZA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE'">T</xsl:when>

			<xsl:when test="cbc:CreditedQuantity/@unitCode='TNE'">T</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='EA'">C/U</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='BO'">FRA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='GLL'">GLN</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='PK'">PAQ</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='NIU'">PZ</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='C62'">PZA</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:CreditedQuantity/@unitCode='MTK'">M2</xsl:when>

			<xsl:when test="cbc:DebitedQuantity/@unitCode='TNE'">T</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='EA'">C/U</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='BO'">FRA</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='GLL'">GLN</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='PK'">PAQ</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='NIU'">PZ</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='C62'">PZA</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:DebitedQuantity/@unitCode='MTK'">M2</xsl:when>

			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\XML_QUIMPAC_V2\20330791501&#x2D;01&#x2D;FAL1&#x2D;00000001.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->