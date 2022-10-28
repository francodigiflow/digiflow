<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
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

<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes" />

<xsl:template name="inf-adic">
		<table border="1" cellpadding="1" cellspacing="1" width="100%" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
		<tr>	
			<td bgcolor="#2F4968" align="center" width="100%" style="color:WHITE">
					<strong>Información adicional</strong>
			</td>
		</tr>
		<xsl:choose>
			<xsl:when test="substring-before(//cbc:ID,'-')='F001' or substring-before(//cbc:ID,'-')='B001'">
		<tr>	
			<td valign="top" align="left" width="100%" style="color:#0F2C4E">
				&#160;&#160;&#160;<strong>PROPINA: </strong>
				<xsl:if test="$FLAG_R='0'">
					<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="07"/></xsl:call-template>
				</xsl:if>
				<xsl:if test="$FLAG_R='1'">
					<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="19"/></xsl:call-template>
				</xsl:if>
				<br/>
				&#160;&#160;&#160;<strong>Formas de Pago: </strong>
				<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
					CRÉDITO
				</xsl:if>
				<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Contado'">
					CONTADO		
				</xsl:if>
				<br/>
				&#160;&#160;&#160;<strong>CheckIn: </strong>
				<xsl:variable name="CheckIn">
					<xsl:for-each select="//cac:InvoiceLine">
					<xsl:if test="cbc:ID='1'">
						<xsl:for-each select="cac:Item/cac:AdditionalItemProperty">
							<xsl:if test="cbc:NameCode='4003'">
								<xsl:value-of select="cac:UsabilityPeriod/cbc:StartDate"/>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>	
				</xsl:variable>
				
				<xsl:value-of select="substring($CheckIn,1,10)"/>
				<br/>
				&#160;&#160;&#160;<strong>CheckOut: </strong>
				<xsl:variable name="CheckOut">
					<xsl:for-each select="//cac:InvoiceLine">
						<xsl:if test="cbc:ID='1'">
							<xsl:for-each select="cac:Item/cac:AdditionalItemProperty">
								<xsl:if test="cbc:NameCode='4004'">
									<xsl:value-of select="cac:UsabilityPeriod/cbc:StartDate"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>	
				</xsl:variable>
				
				<xsl:value-of select="substring($CheckOut,1,10)"/>
				<br/>
				&#160;&#160;&#160;<strong>Reserva: </strong>
				<xsl:if test="$FLAG_R='0'">
					<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="02"/></xsl:call-template>
				</xsl:if>
				<xsl:if test="$FLAG_R='1'">
					-
				</xsl:if>
				<br/>
				&#160;&#160;&#160;<strong>Tipo de Cambio: </strong>
				<xsl:if test="$FLAG_R='0'">
					<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="14"/></xsl:call-template>
				</xsl:if>
				<xsl:if test="$FLAG_R='1'">
					-
				</xsl:if>
				<br/>
				<!-- <xsl:variable name="Huesped"> -->
					<!-- <xsl:for-each select="//cac:InvoiceLine"> -->
						<!-- <xsl:if test="cbc:ID='1'"> -->
							<!-- <xsl:for-each select="cac:Item/cac:AdditionalItemProperty"> -->
								<!-- <xsl:if test="cbc:NameCode='4007'"> -->
									<!-- <xsl:value-of select="concat(cbc:Value,'_')" /> -->
								<!-- </xsl:if> -->
							<!-- </xsl:for-each> -->
						<!-- </xsl:if> -->
					<!-- </xsl:for-each> -->
				<!-- </xsl:variable> -->
								
				<!-- <xsl:value-of select="substring-before($Huesped,'_')"/> -->

				&#160;&#160;&#160;<strong>Noches: </strong>
					<xsl:if test="//cac:InvoiceLine/cbc:ID='1'">
						<xsl:if test="//cac:InvoiceLine/cac:Item/cac:AdditionalItemProperty/cbc:NameCode='4005'">
							<xsl:value-of select="//cac:InvoiceLine/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod/cbc:DurationMeasure"/>
						</xsl:if>
					</xsl:if>
				<br/>
				&#160;&#160;&#160;<strong>Código de Grupo: </strong>
				<xsl:if test="$FLAG_R='0'">
					<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="08"/></xsl:call-template>
				</xsl:if>
				<xsl:if test="$FLAG_R='1'">
					-
				</xsl:if>
				<br/>
				&#160;&#160;&#160;<strong>Nombre de Grupo: </strong>
				<xsl:if test="$FLAG_R='0'">
					<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="09"/></xsl:call-template>
				</xsl:if>
				<xsl:if test="$FLAG_R='1'">
					-
				</xsl:if>
				<br/>
				&#160;&#160;&#160;<strong>OBSERVACIONES: </strong>
				<xsl:if test="$FLAG_R='0'">
					<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="15"/></xsl:call-template>
				</xsl:if>
				<xsl:if test="$FLAG_R='1'">
					-
				</xsl:if>
				
			</td>
		</tr>
			</xsl:when>
			<xsl:otherwise>
			<tr>	
			<td valign="top" align="left" width="100%" style="color:#0F2C4E">
				<xsl:if test="/pe:Invoice">
				&#160;&#160;&#160;<strong><xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="04"/></xsl:call-template>: </strong>
				<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="05"/></xsl:call-template><br/>
				</xsl:if>
				&#160;&#160;&#160;<strong>PROPINA: </strong>
				<xsl:if test="$FLAG_R='0'">
					<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="07"/></xsl:call-template>
				</xsl:if>
				<xsl:if test="$FLAG_R='1'">
					-
				</xsl:if>
				<br/>
				&#160;&#160;&#160;<strong>Formas de Pago: </strong>
				<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
					CRÉDITO
				</xsl:if>
				<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Contado'">
					CONTADO		
				</xsl:if>
				<br/>
				&#160;&#160;&#160;<strong>CheckIn: </strong>
				<xsl:variable name="CheckIn">
					<xsl:for-each select="//cac:InvoiceLine">
					<xsl:if test="cbc:ID='1'">
						<xsl:for-each select="cac:Item/cac:AdditionalItemProperty">
							<xsl:if test="cbc:NameCode='4003'">
								<xsl:value-of select="cac:UsabilityPeriod/cbc:StartDate"/>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>	
				</xsl:variable>
				
				<xsl:value-of select="substring($CheckIn,1,10)"/>
				<br/>
				&#160;&#160;&#160;<strong>CheckOut: </strong>
				<xsl:variable name="CheckOut">
					<xsl:for-each select="//cac:InvoiceLine">
						<xsl:if test="cbc:ID='1'">
							<xsl:for-each select="cac:Item/cac:AdditionalItemProperty">
								<xsl:if test="cbc:NameCode='4004'">
									<xsl:value-of select="cac:UsabilityPeriod/cbc:StartDate"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>	
				</xsl:variable>
				
				<xsl:value-of select="substring($CheckOut,1,10)"/>
				<br/>
				&#160;&#160;&#160;<strong>Reserva: </strong>
				<xsl:if test="$FLAG_R='0'">
					<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="02"/></xsl:call-template>
				</xsl:if>
				<xsl:if test="$FLAG_R='1'">
					-
				</xsl:if>
				<br/>
				&#160;&#160;&#160;<strong>Tipo de Cambio: </strong>
				<xsl:if test="$FLAG_R='0'">
					<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="14"/></xsl:call-template>
				</xsl:if>
				<xsl:if test="$FLAG_R='1'">
					-
				</xsl:if>
				<br/>
				<!-- <xsl:variable name="Huesped"> -->
					<!-- <xsl:for-each select="//cac:InvoiceLine"> -->
						<!-- <xsl:if test="cbc:ID='1'"> -->
							<!-- <xsl:for-each select="cac:Item/cac:AdditionalItemProperty"> -->
								<!-- <xsl:if test="cbc:NameCode='4007'"> -->
									<!-- <xsl:value-of select="concat(cbc:Value,'_')" /> -->
								<!-- </xsl:if> -->
							<!-- </xsl:for-each> -->
						<!-- </xsl:if> -->
					<!-- </xsl:for-each> -->
				<!-- </xsl:variable> -->
								
				<!-- <xsl:value-of select="substring-before($Huesped,'_')"/> -->

				&#160;&#160;&#160;<strong>Noches: </strong>
					<xsl:if test="//cac:InvoiceLine/cbc:ID='1'">
						<xsl:if test="//cac:InvoiceLine/cac:Item/cac:AdditionalItemProperty/cbc:NameCode='4005'">
							<xsl:value-of select="//cac:InvoiceLine/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod/cbc:DurationMeasure"/>
						</xsl:if>
					</xsl:if>
				<br/>
				&#160;&#160;&#160;<strong>Código de Grupo: </strong>
				<xsl:if test="$FLAG_R='0'">
					<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="08"/></xsl:call-template>
				</xsl:if>
				<xsl:if test="$FLAG_R='1'">
					-
				</xsl:if>
				<br/>
				&#160;&#160;&#160;<strong>Nombre de Grupo: </strong>
				<xsl:if test="$FLAG_R='0'">
					<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="09"/></xsl:call-template>
				</xsl:if>
				<xsl:if test="$FLAG_R='1'">
					-
				</xsl:if>
				<br/>
				&#160;&#160;&#160;<strong>OBSERVACIONES: </strong>
				<xsl:if test="$FLAG_R='0'">
					<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="15"/></xsl:call-template>
				</xsl:if>
				<xsl:if test="$FLAG_R='1'">
					-
				</xsl:if>
				
			</td>
		</tr>
			
			</xsl:otherwise>	
		</xsl:choose>
		</table>
</xsl:template>

	 <xsl:template name="DatosCredito">
		<table width="100%" border="0" cellpadding="1" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
			<tr  style="color:#0F2C4E">
				<td>
				<strong>DATOS DE CUOTA: 
				<br/>
				<br/>Monto Neto Pendiente de Pago: 
				<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
					<xsl:if test="cbc:PaymentMeansID ='Credito'">	
						<xsl:call-template name="SimboloMoneda"/>  <xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
					</xsl:if>
				</xsl:for-each>	
				</strong>
				</td>				
			</tr>
			<tr  style="color:#0F2C4E">
				<td>
						<table width="50%" border="1" align="center" cellSpacing="0" borderColor="#0F2C4E" cellPadding="2" style="font-family :Arial,Helvetica,sans-serif;font-size:11px;color:#0F2C4E">
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
						</table>
				</td>
			</tr>
		</table>

	</xsl:template>


	<xsl:template name="DatosReferencia">
		<table width="100%" border="0" cellpadding="1" rules="groups" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
			<tr>
			 	<td width="65%">
					<table border="0" width="100%">
						<tr>
							<td width="45%" align="left">
							
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount = '0.00'">
							TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE
						</xsl:if>
					</xsl:if>
					<xsl:if test="//cbc:UBLVersionID='2.1'">
						<xsl:if test="//cbc:Note[@languageLocaleID='1002']">
							TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE
						</xsl:if>
					</xsl:if>	
				</td>
			</tr>
		</table>

	</xsl:template>

<xsl:template name="obs_exp">
		<table border="0" cellpadding="1" cellspacing="1" width="100%" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
			<tr>
				<td width="90%" align="center" style="color:#0F2C4E">
					<xsl:if test="$OPExport> 0 ">
					<strong>
					&#160;&#160;&#160;"Exportación de Servicios - Decreto Legislativo N° 919"
					</strong>
					</xsl:if>
				</td>
			</tr>
		</table>
</xsl:template>


<xsl:template name="son-pesos">
		<table border="0" cellpadding="1" cellspacing="1" width="100%" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
			<tr>
				<td width="90%" style="color:#0F2C4E">
					&#160;&#160;&#160;Monto en letras: 
					<xsl:if test="//cbc:UBLVersionID='2.1'">
					<strong>
						<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']"/>
					</strong>
					</xsl:if>						
					<xsl:if test="//cbc:UBLVersionID='2.0'">
					<strong>
					<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty/cbc:Value"/>
					</strong>
					</xsl:if>
				</td>
			</tr>
		</table>
</xsl:template>


<xsl:template name="Total">
	<table border="1"  cellpadding="1" cellspacing="1" width="100%" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
		<tr>	
			<td bgcolor="#2F4968" align="center" width="35%" style="color:WHITE" colspan="2">
					<strong>Totales del documento</strong>
			</td>
		</tr>
		<tr>	
			<td valign="top" align="left" style="border: inset 0pt;color:#0F2C4E">
				&#160;<strong>Operación Gravada: </strong><br/>
				&#160;<strong>Operación Exportación: </strong><br/>
				&#160;<strong>Operación Exonerada: </strong><br/>
				&#160;<strong>Operación Inafecta: </strong><br/>
				&#160;<strong>Operación Gratuita: </strong><br/>
				&#160;<strong>Descuento: </strong><br/>
				&#160;<strong>Total Anticipo: </strong><br/>
				&#160;<strong>Rec. de Consumo(10%): </strong><br/>
				&#160;<strong>Total IGV 18%: </strong><br/>
				&#160;<strong>Importe Total a Pagar: </strong><br/>
			</td>	
			<td valign="top" align="right" style="border: inset 0pt">
				<xsl:call-template name="SimboloMoneda"/>
				<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>&#160;&#160;&#160;
				<br/>
				<xsl:call-template name="SimboloMoneda"/>
				<xsl:value-of select="format-number($OPExport,'###,###,##0.00','pen')"/>&#160;&#160;&#160;
				<br/>
				<xsl:call-template name="SimboloMoneda"/>
				<xsl:value-of select="format-number($OPExonerada,'###,###,##0.00','pen')"/>&#160;&#160;&#160;
				<br/>
				<xsl:call-template name="SimboloMoneda"/>
				<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>&#160;&#160;&#160;
				<br/>
				<xsl:call-template name="SimboloMoneda"/>
				<xsl:value-of select="format-number($OpeGrat,'###,###,##0.00','pen')"/>&#160;&#160;&#160;
				<br/>
				<xsl:call-template name="SimboloMoneda"/>
				<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount,'###,###,##0.00','pen')"/>&#160;&#160;&#160;
				<br/>
				<xsl:call-template name="SimboloMoneda"/>
				<xsl:value-of select="format-number(//cac:PrepaidPayment/cbc:PaidAmount,'###,###,##0.00','pen')"/>&#160;&#160;&#160;
				<br/>
				<xsl:call-template name="SimboloMoneda"/>
				<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount,'###,###,##0.00','pen')"/>&#160;&#160;&#160;
				<br/>
				<xsl:call-template name="SimboloMoneda"/>
				<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;&#160;&#160;
				<br/>
				<xsl:call-template name="SimboloMoneda"/>
				<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount != ''">
					<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#160;&#160;&#160;
				</xsl:if>
				<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount != ''">
					<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')"/>&#160;&#160;&#160;
				</xsl:if>	
			</td>
		
		</tr>
	</table>
</xsl:template>

	<xsl:template name="Detracc">
		<table border="1"  cellpadding="1" cellspacing="1" width="100%" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
		<tr>	
				<td bgcolor="#2F4968" align="center" width="35%" style="color:WHITE" colspan="2">
						<strong>Operación sujeta a detracción</strong>
				</td>
			</tr>
			<tr>	
				<td valign="top" align="left" style="border: inset 0pt;color:#0F2C4E">
					&#160;<strong>Codigo de detración: </strong><xsl:value-of select="format-number(//cac:PaymentTerms/cbc:PaymentMeansID,'000','pen')"/>&#160;&#160;&#160;
					<br/>
					&#160;<strong>Tasa de detración afecta: </strong><xsl:value-of select="format-number(//cac:PaymentTerms/cbc:PaymentPercent,'##0.00','pen')"/>&#160;&#160;&#160;
					<br/>
					&#160;<strong>Monto de detración: </strong> S/. <xsl:value-of select="format-number(//cac:PaymentTerms/cbc:Amount,'###,###,##0','pen')"/>.00&#160;&#160;&#160;
					<br/>
					&#160;<strong>Cta. Bco. de la nación: </strong> N° <xsl:value-of select="//cac:PayeeFinancialAccount/cbc:ID"/>&#160;&#160;&#160;
					<br/>
				</td>
				<!-- <td valign="top" align="right" style="border: inset 0pt"> -->
					
					<!-- <br/> -->
					
					<!-- <br/> -->
					
					<!-- <br/> -->
					
					<!-- <br/> -->
					
				<!-- </td> -->
			</tr>
			</table>
			
	</xsl:template>
	
	<xsl:template name="inf-adic2">
		<table border="1"  cellpadding="1" cellspacing="1" width="100%" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
			<tr>	
				<td valign="top" align="left" style="border: inset 0pt;color:#0F2C4E">
					<strong>&#160;&#160;&#160;&#160;Observaciones:</strong> 
					<br/>&#160;&#160;&#160;- Servicios de Alquiler de salas y Coffee break afectos al SPOT, Favor depositar la respectiva detracción en la Cta Cte del Banco de la Nación MN Nro 00-046-242998
					<br/>&#160;&#160;&#160;- El servicio de Alojamiento y los servicios complementarios a este quedan excluidos del SPOT, según R.S N° 063-2012 anexo 3 numeral 10
				</td>
			</tr>
			</table>
	</xsl:template>


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





	<xsl:template name="fecha_ddmmaa_ref">
		<xsl:variable name="aa">
			<xsl:value-of select="substring-before(FchRef, '-')"/>
		</xsl:variable>
		<xsl:variable name="mmdd">
			<xsl:value-of select="substring-after(FchRef, '-')"/>
		</xsl:variable>
		<xsl:variable name="mm">
			<xsl:value-of select="substring-before($mmdd, '-')"/>
		</xsl:variable>
		<xsl:variable name="dd">
			<xsl:value-of select="substring-after($mmdd, '-')"/>
		</xsl:variable>
		<xsl:value-of select="concat($dd, '-', $mm, '-' , $aa)"/>
	</xsl:template>

	<xsl:template name="CTSJuanchoQuiereElSimbolo">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'PEN'">(S/)</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'USD'">(USD)</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'EUR'">(EUR)</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'PEN'">(S/)</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'USD'">(USD)</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'EUR'">(EUR)</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'PEN'">(S/)</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'USD'">(USD)</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'EUR'">(EUR)</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="SimboloMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">USD </xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUR </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">USD </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUR </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">USD </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUR </xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

<xsl:template name="firmabottom">
		<table border="0" cellpadding="1" cellspacing="1" width="100%" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">						
			<tr>
				<td width="50%">
					<table border="0" cellSpacing="0" borderColor="#ffffff" cellPadding="1" width="100%" rules="none"><tbody>
						<tr>
							<td width="70%">
							<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%"><tbody>
								<tr>
									<td align="left">
										<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
										    <img width="20%"><xsl:attribute name="src"><xsl:call-template name="timbre"/></xsl:attribute></img><br/><br/>
											Representación impresa de la
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">Factura Electrónica</xsl:when>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">Boleta de Venta Electrónica</xsl:when>
												<xsl:when test="/pe1:CreditNote">Nota de Crédito Electrónica</xsl:when>
												<xsl:when test="/pe2:DebitNote">Nota de Dédito Electrónica</xsl:when>
												<xsl:otherwise></xsl:otherwise>
											</xsl:choose>
											<br/>Podrá ser consultada en: <a href="http://ecomprobantes.pe/">www.ecomprobantes.pe/IBEROSTAR</a>													
											<br/>
										</font>	
									</td>
								</tr></tbody>
							 </table>
							</td>
							<td width="30%">
								&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
							</td>
							
						</tr></tbody>
					</table>
				</td>
			</tr>			
		</table>
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\LIBRE HOTEL" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->