<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" 
xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" 
xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" 
xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Detalle">
		
		<table rules="groups" width="100%" cellpadding="3" cellspacing="0"  
					style="border-collapse:separate;
						border:solid #2F528F 2px;
						 border-radius:6px;
					   -moz-border-radius:6px;">
						<thead 
						style="border-collapse:separate;
						border:solid #2F528F 2px;
						 border-radius:6px;
					   -moz-border-radius:6px;">
							<tr >
								<th width="5%" align="center" style="border-bottom: 1px solid #2F528F;">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1" color="blue">Item</font>
									</b>
								</th>
								<th width="9%" align="center" style="border-bottom: 1px solid #2F528F;">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1" color="blue">C?digo</font>
									</b>
								</th>
								
								<th width="30%" align="center" 
								style=" border-bottom: 1px solid #2F528F;">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1" color="blue">Descripci?n</font>
									</b>
								</th>
								
								<th width="4%" align="center" 
								style="border-bottom: 1px solid #2F528F;">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1" color="blue">Und</font>
									</b>
								</th>
								<th width="6%" align="center" 
								style="border-bottom: 1px solid #2F528F;">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1" color="blue">Cantidad</font>
									</b>
								</th>
								
								<th width="9%" align="right" 
									style="border-bottom: 1px solid #2F528F;">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1" color="blue">V.Unitario</font>
									</b>
								</th>
								<th width="6%" align="center" 
								style="border-bottom: 1px solid #2F528F;">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1" color="blue">Importe Dscto</font>
									</b>
								</th>
								
								<th width="9%" align="right" 
								style="border-bottom: 1px solid #2F528F;">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1" color="blue">Valor venta</font>
									</b>
								</th>

							
							</tr>
						</thead>
						
						<tbody>
							
							<!--<xsl:for-each select="format-number(/pe:Invoice/cac:InvoiceLine,'00','pen')">-->
							<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
								<tr>
									<td width="5%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<td width="9%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="30%" align="left" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;" >
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<td width="4%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<td width="6%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="9%" align="right" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
										
											<xsl:variable name="CTSValor1">
												<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
													<xsl:if test="cbc:PriceTypeCode = '02'">
														<xsl:value-of select="cbc:PriceAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>

											<xsl:variable name="CTSValorFinal">
												<xsl:if test="$CTSValor1 = ''">
													<xsl:value-of select="cac:Price/cbc:PriceAmount"/>
												</xsl:if>
												<xsl:if test="$CTSValor1 != ''">
													<xsl:value-of select="$CTSValor1"/>
												</xsl:if>
											</xsl:variable>
										
												<xsl:choose>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 3">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 4">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 5">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 6">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 7">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 8">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 9">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 10">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="6%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:variable name="Descuento">
												<xsl:value-of select="0"/>
												<xsl:if test="cac:AllowanceCharge/cbc:Amount">
													<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
												</xsl:if>
											</xsl:variable>
											<xsl:choose>
												<xsl:when test="//cac:PartyIdentification/cbc:ID='20138651917'">
													<xsl:value-of select="format-number($Descuento*1.18,'###,###,##0.00','pen')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="format-number($Descuento,'###,###,##0.00','pen')"/>
												</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="9%" align="right" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')"/>&#xA0;&#xA0;
											
										</font>
									</td>

								</tr>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
								<xsl:variable name="Descuento1">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:Amount">
										<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
									</xsl:if>
								</xsl:variable>

								<tr>
									<td width="5%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<td width="13%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="20%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<td width="4%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<td width="6%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:CreditedQuantity,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="9%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
										
											<xsl:variable name="CTSValor1">
												<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
													<xsl:if test="cbc:PriceTypeCode = '02'">
														<xsl:value-of select="cbc:PriceAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>

											<xsl:variable name="CTSValorFinal">
												<xsl:if test="$CTSValor1 = ''">
													<xsl:value-of select="cac:Price/cbc:PriceAmount"/>
												</xsl:if>
												<xsl:if test="$CTSValor1 != ''">
													<xsl:value-of select="$CTSValor1"/>
												</xsl:if>
											</xsl:variable>
										
												<xsl:choose>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 3">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 4">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 5">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 6">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 7">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 8">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 9">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 10">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="6%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
											<xsl:when test="//cac:PartyIdentification/cbc:ID='20138651917'">
												<xsl:variable name="Descuento">
													<xsl:value-of select="0"/>
													<xsl:if test="cac:AllowanceCharge/cbc:Amount">
														<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
													</xsl:if>
												</xsl:variable>
												<xsl:value-of select="format-number($Descuento*1.18,'###,###,##0.00','pen')"/>
											</xsl:when>
												<xsl:otherwise>
														<xsl:variable name="Descuento">
												<xsl:value-of select="0"/>
												<xsl:if test="cac:AllowanceCharge/cbc:Amount">
													<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
												</xsl:if>
											</xsl:variable>
												<xsl:value-of select="format-number($Descuento,'###,###,##0.00','pen')"/>
											</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="9%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount, '###,###,##0.00', 'pen')"/>
										</font>
									</td>
								</tr>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
								<xsl:variable name="Descuento1">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:Amount">
										<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
									</xsl:if>
								</xsl:variable>

								<tr>
									<td width="5%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<td width="13%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="20%" align="left" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</font>
									</td>
									<td width="4%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<td width="6%" align="right" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:DebitedQuantity,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="9%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
										
											<xsl:variable name="CTSValor1">
												<xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
													<xsl:if test="cbc:PriceTypeCode = '02'">
														<xsl:value-of select="cbc:PriceAmount"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>
											<xsl:variable name="CTSValorFinal">
												<xsl:if test="$CTSValor1 = ''">
													<xsl:value-of select="cac:Price/cbc:PriceAmount"/>
												</xsl:if>
												<xsl:if test="$CTSValor1 != ''">
													<xsl:value-of select="$CTSValor1"/>
												</xsl:if>
											</xsl:variable>
											<xsl:choose>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 3">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 4">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 5">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 6">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 7">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 8">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 9">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.000000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:when test="string-length(substring-after($CTSValorFinal, '.')) = 10">
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.0000000000', 'pen')"/>&#xA0;</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="format-number($CTSValorFinal, '###,###,##0.00', 'pen')"/>&#xA0;</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="6%" align="right" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
											<xsl:when test="//cac:PartyIdentification/cbc:ID='20138651917'">
												<xsl:variable name="Descuento">
													<xsl:value-of select="0"/>
													<xsl:if test="cac:AllowanceCharge/cbc:Amount">
														<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
													</xsl:if>
												</xsl:variable>
												<xsl:value-of select="format-number($Descuento*1.18,'###,###,##0.00','pen')"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:variable name="Descuento">
													<xsl:value-of select="0"/>
													<xsl:if test="cac:AllowanceCharge/cbc:Amount">
														<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
													</xsl:if>
												</xsl:variable>
												<xsl:value-of select="format-number($Descuento,'###,###,##0.00','pen')"/>
											</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="9%" align="right" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;border-right: none;">
										<font face="Arial, Helvetica, sans-serif" size="1">
											
										<xsl:variable name="ValorAdicional2">
                                            <xsl:call-template name="RetourneValAdItem">
                                                <xsl:with-param name="NumLinea" select="cbc:ID"/>
                                                <xsl:with-param name="NumAd" select="2"/>
                                            </xsl:call-template>
                                        </xsl:variable>
 
                                        <xsl:if test="$ValorAdicional2 != '' and $ValorAdicional2 !='-' ">
                                        <xsl:value-of select="$ValorAdicional2"/>
                                        </xsl:if>
										</font>
									</td>
								</tr>
							</xsl:for-each>
							
							<!--xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template-->

							<tr>
								<td width="100%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;" colspan="7">
									<xsl:call-template name="tmpDatosLeyenda"/>
								</td>
							</tr>
							<tr>
								<td width="100%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;" colspan="7">
									
								</td>
							</tr>
							
						</tbody>
						

						<thead 
						style="border-collapse:separate;
						border:solid #2F528F 2px;
						 border-radius:6px;
					   -moz-border-radius:6px;">
							<tr>
								<th width="3%" align="left">
									
								</th>
								<th width="94%" align="left" style="border-bottom: 1px solid #2F528F;" colspan="10">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">Totales</font>
									</b>
								</th>
								<th width="3%" align="left">
									
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="5%" align="center" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;">
								</td>
							</tr>	
							<tr>
								<td width="100%" align="right" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;" colspan="9">
									<xsl:call-template name="tmpTotal"/>
								</td>
							</tr>	

							<tr>
								<td width="60%" align="left" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;" colspan="9">
									<xsl:call-template name="tmpImporteLetras"/>
								</td>
							</tr>	
							<tr>
								<td width="60%" align="left" valign="top" style="border:solid 1px #fff;border-top:none;border-bottom:none;border-left: none;" colspan="9">									
								</td>
							</tr>
							
						</tbody>
						
					
					</table>
			
	</xsl:template>

	<xsl:template name="unidad_medida">
		<xsl:choose>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PL' or cbc:CreditedQuantity/@unitCode='PL' or cbc:DebitedQuantity/@unitCode='PL'">BAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D64' or cbc:CreditedQuantity/@unitCode='D64' or cbc:DebitedQuantity/@unitCode='D64'">BLK</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BG' or cbc:CreditedQuantity/@unitCode='BG' or cbc:DebitedQuantity/@unitCode='BG'">BOL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BO' or cbc:CreditedQuantity/@unitCode='BO' or cbc:DebitedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BX' or cbc:CreditedQuantity/@unitCode='BX' or cbc:DebitedQuantity/@unitCode='BX'">CAJ</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CY' or cbc:CreditedQuantity/@unitCode='CY' or cbc:DebitedQuantity/@unitCode='CY'">CIL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CLT' or cbc:CreditedQuantity/@unitCode='CLT' or cbc:DebitedQuantity/@unitCode='CLT'">CL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CMT' or cbc:CreditedQuantity/@unitCode='CMT' or cbc:DebitedQuantity/@unitCode='CMT'">CM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CJ' or cbc:CreditedQuantity/@unitCode='CJ' or cbc:DebitedQuantity/@unitCode='CJ'">CON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='DLT' or cbc:CreditedQuantity/@unitCode='DLT' or cbc:DebitedQuantity/@unitCode='DLT'">DL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL' or cbc:CreditedQuantity/@unitCode='GLL' or cbc:DebitedQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GRM' or cbc:CreditedQuantity/@unitCode='GRM' or cbc:DebitedQuantity/@unitCode='GRM'">GR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='HUR' or cbc:CreditedQuantity/@unitCode='HUR' or cbc:DebitedQuantity/@unitCode='HUR'">HRA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KT' or cbc:CreditedQuantity/@unitCode='KT' or cbc:DebitedQuantity/@unitCode='KT'">JGO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM' or cbc:CreditedQuantity/@unitCode='KGM' or cbc:DebitedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KWT' or cbc:CreditedQuantity/@unitCode='KWT' or cbc:DebitedQuantity/@unitCode='KWT'">KW</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR' or cbc:CreditedQuantity/@unitCode='LBR' or cbc:DebitedQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR' or cbc:CreditedQuantity/@unitCode='LTR' or cbc:DebitedQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTR' or cbc:CreditedQuantity/@unitCode='MTR' or cbc:DebitedQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK' or cbc:CreditedQuantity/@unitCode='MTK' or cbc:DebitedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTQ' or cbc:CreditedQuantity/@unitCode='MTQ' or cbc:DebitedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MIL' or cbc:CreditedQuantity/@unitCode='MIL' or cbc:DebitedQuantity/@unitCode='MIL'">MIL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D61' or cbc:CreditedQuantity/@unitCode='D61' or cbc:DebitedQuantity/@unitCode='D61'">MIN</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MLT' or cbc:CreditedQuantity/@unitCode='MLT' or cbc:DebitedQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MMT' or cbc:CreditedQuantity/@unitCode='MMT' or cbc:DebitedQuantity/@unitCode='MMT'">MM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NPR' or cbc:CreditedQuantity/@unitCode='NPR' or cbc:DebitedQuantity/@unitCode='NPR'">PAR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTK' or cbc:CreditedQuantity/@unitCode='FTK' or cbc:DebitedQuantity/@unitCode='FTK'">PI2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTQ' or cbc:CreditedQuantity/@unitCode='FTQ' or cbc:DebitedQuantity/@unitCode='FTQ'">PI3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PA' or cbc:CreditedQuantity/@unitCode='PA' or cbc:DebitedQuantity/@unitCode='PA'">PQT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='INH' or cbc:CreditedQuantity/@unitCode='INH' or cbc:DebitedQuantity/@unitCode='INH'">PUL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NRL' or cbc:CreditedQuantity/@unitCode='NRL' or cbc:DebitedQuantity/@unitCode='NRL'">ROL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE' or cbc:CreditedQuantity/@unitCode='TNE' or cbc:DebitedQuantity/@unitCode='TNE'">TON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NIU' or cbc:CreditedQuantity/@unitCode='NIU' or cbc:DebitedQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SA' or cbc:CreditedQuantity/@unitCode='SA' or cbc:DebitedQuantity/@unitCode='SA'">SAC</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='JR' or cbc:CreditedQuantity/@unitCode='JR' or cbc:DebitedQuantity/@unitCode='JR'">FC</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SO' or cbc:CreditedQuantity/@unitCode='SO' or cbc:DebitedQuantity/@unitCode='SO'">SO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='JE' or cbc:CreditedQuantity/@unitCode='JE' or cbc:DebitedQuantity/@unitCode='JE'">JER</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PS' or cbc:CreditedQuantity/@unitCode='PS' or cbc:DebitedQuantity/@unitCode='PS'">POTE</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='C62' or cbc:CreditedQuantity/@unitCode='C62' or cbc:DebitedQuantity/@unitCode='C62'">PZA</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
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
    </xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->