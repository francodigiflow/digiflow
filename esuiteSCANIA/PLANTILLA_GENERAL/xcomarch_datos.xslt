<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="fechaddmmyyyy">
		<xsl:if test="/pe:Invoice">		
			<xsl:variable name="aa">
	        	<xsl:value-of select="substring-before(/pe:Invoice/cbc:IssueDate, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="mmdd">
	         	<xsl:value-of select="substring-after(/pe:Invoice/cbc:IssueDate, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="mm">
	         	<xsl:value-of select="substring-before($mmdd, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="dd">
	         	<xsl:value-of select="substring-after($mmdd, '-')"/>
	      	</xsl:variable>
	      	<xsl:value-of select="concat($dd, '/', $mm, '/' , $aa)"/>
		</xsl:if>

		<xsl:if test="/pe1:CreditNote">		
			<xsl:variable name="aa">
	        	<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:IssueDate, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="mmdd">
	         	<xsl:value-of select="substring-after(/pe1:CreditNote/cbc:IssueDate, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="mm">
	         	<xsl:value-of select="substring-before($mmdd, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="dd">
	         	<xsl:value-of select="substring-after($mmdd, '-')"/>
	      	</xsl:variable>
	      	<xsl:value-of select="concat($dd, '/', $mm, '/' , $aa)"/>
		</xsl:if>

		<xsl:if test="/pe2:DebitNote">		
			<xsl:variable name="aa">
	        	<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:IssueDate, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="mmdd">
	         	<xsl:value-of select="substring-after(/pe2:DebitNote/cbc:IssueDate, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="mm">
	         	<xsl:value-of select="substring-before($mmdd, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="dd">
	         	<xsl:value-of select="substring-after($mmdd, '-')"/>
	      	</xsl:variable>
	      	<xsl:value-of select="concat($dd, '/', $mm, '/' , $aa)"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="tmpDatosAdicional">
		<table border="0" bordercolor="#000000" cellpadding="1" cellspacing="2" width="100%"
		style="border-collapse:separate;
						border:solid #2F528F 2px;
						 border-radius:6px;
					   -moz-border-radius:6px;">
			<tbody>
			
				<tr>
					<td width="100%" >
						<xsl:call-template name="DatosNota"/>
					</td>
				</tr>
				<tr>
					<td width="100%" >
						<xsl:call-template name="DatosCredito"/>
					</td>
				</tr>
				<tr>
					<td width="100%" >
						<xsl:call-template name="DatosDetracc"/>
					</td>
				</tr>
				<tr>
					<td width="100%" >
						<xsl:call-template name="DatosInfoAdicional"/>
					</td>
				</tr>				
			</tbody>
		</table>		
	</xsl:template>
	
	<xsl:template name="tmpDatosLeyenda">
		<xsl:if test="//cac:PaymentMeans/cbc:ID='Detraccion'">
			<br/>
			
			<table style="" width="100%" cellpadding="2" cellspacing="0">
				<tbody >
					<tr>
						<td width="5%">&#160;&#160;
						</td>
						<td width="90%" colspan="5">&#160;&#160;
							<font face="Arial, Helvetica, sans-serif" size="1">
								<b>Leyenda</b>
							</font>
						</td>						
						<td width="5%">&#160;&#160;
						</td>
					</tr>
					<tr>
						<td width="5%">&#160;&#160;
						</td>
						<td width="5%" style="border:solid 1px #A5A5A5;" align="center">&#160;&#160;
							<font face="Arial, Helvetica, sans-serif" size="1">
								1
							</font>
						</td>
						<td width="40%" style="border:solid 1px #A5A5A5;" align="center">&#160;&#160;
							<font face="Arial, Helvetica, sans-serif" size="1">
								Leyenda Operación Sujeta a Detracción
							</font>
						</td>
						<td width="45%" style="border:solid 1px #A5A5A5;" align="center">&#160;&#160;
							<font face="Arial, Helvetica, sans-serif" size="1">
								"Operación sujeta a detracción"
							</font>
						</td>
						<td width="5%">&#160;&#160;
						</td>
					</tr>
				
				</tbody>
			</table>
			<br/>
		</xsl:if>
	</xsl:template>	

	<xsl:template name="tmpDescripcionMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">Soles</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">Dólares americanos</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">Euros</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">Soles</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">Dólares americanos</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">Euros</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">Soles</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">Dólares americanos</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">Euros</xsl:when>
			<xsl:otherwise>Otra moneda</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="RetourneValAd">
		<xsl:param name="NumAd"/>

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

	<xsl:template name="DatosCliente">
		<table cellSpacing="0" cellPadding="0" width="100%"
		>
			<tbody>
				<tr>
					<td vAlign="top" width="70%"  border="0">
						<xsl:call-template name="DatosFiscales"/>
					</td>
					
					<td vAlign="top" width="30%" border="0" height="100px">
						<xsl:call-template name="DatosTimbre"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template name="EmisorReceptor">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td vAlign="top" width="50%">
						<xsl:call-template name="DatosEmisor"/>
					</td>
					
					<td vAlign="top" width="50%">
					<xsl:call-template name="DatosReceptor"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="DatosFiscales">
		<table border="0" width="100%" cellspacing="0" cellPadding="2"  rules="none" 
		>
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="0" width="100%" cellSpacing="0" cellPadding="2" rules="none"
						style="border-collapse:separate;border-spacing: 1;border:solid #2F528F 2px;border-radius:10px;
						-moz-border-radius:10px;-webkit-border-radius: 5px;"
						>
							<!---->
							<tbody>
								<tr>
									<td width="100%" colspan="4">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>Datos Fiscales</b>
										</font>
									</td>
								</tr>
								<tr>
									<td width="100%" colspan="4">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Scania del Perú S.A.
										</font>
									</td>									
								</tr>
								<tr>
									<td width="100%"  colspan="4">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Autopista Ramiro Priale Km. 7.5 Urb. Capitana Santa María de Huachipa - LURIGANCHO - LIMA - LIMA
										</font>
									</td>
									
								</tr>
								<tr>
									<td width="100%"  colspan="5">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>-
											<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>-
											<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity"/>-
											<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District"/>
										</font>
									</td>
									
								</tr>
								<tr>
									<td width="13%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										</font>
									</td>
									<td width="13%">
									</td>
									<td width="17%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										</font>
									</td>
								</tr>
								<tr>
									<td length="13%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Tipo de comprobante
										</font>
									</td>
									<td length="18%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<xsl:call-template name="tipodocu"/>
										</font>
									</td>
									<td length="8%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											
										</font>
									</td>
									<td length="18%" valign="top" align="left">
										
									</td>
								</tr>
								<tr>
									<td length="13%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Nro de comprobante
										</font>
									</td>
									<td length="18%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<xsl:call-template name="NFolio"/>
										</font>
									</td>
									<td length="13%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Pedido
										</font>
									</td>
									<td length="8%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="16"/></xsl:call-template>
										</font>
									</td>
								</tr>
								<tr>
									<td length="13%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Fecha de comprobante
										</font>
									</td>
									<td length="18%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<!--<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
											<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
											<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>-->
											<xsl:call-template name="fechaddmmyyyy"/>
										</font>
									</td>
									<td length="8%" valign="top" align="left">
										
									</td>
									<td length="18%" valign="top" align="left">
										
									</td>
								</tr>
								<tr>
									<td length="13%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Doc. refencia
										</font>
									</td>
									<td length="25%" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<xsl:value-of select="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>&#160;
										</font>
									</td>
										<td length="8%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Forma de pago
										</font>
									</td>
									<td length="15%" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
										<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
											Crédito
										</xsl:if>
										<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Contado'">
											Contado		
										</xsl:if>
										</font>
									</td>
								</tr>
								<tr>
									<td length="13%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Tipo de cambio
										</font>
									</td>
									<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="09"/></xsl:call-template>											
										</font>
									</td>
									<td length="8%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Método de pago
										</font>
									</td>
									<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03'">
												<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="06"/></xsl:call-template>
											</xsl:if>
										</font>
									</td>
								</tr>
								<tr>
									<td length="13%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Moneda
										</font>
									</td>
									<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<xsl:call-template name="tmpDescripcionMoneda"/>
										</font>
									</td>
									<td length="8%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Lugar de expedición
										</font>
									</td>
									<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>-
											<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity"/>-
											<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		
		</table>
	</xsl:template>

	<xsl:template name="DatosTimbre">
		<table border="0" width="100%" height="100%" cellspacing="0" cellPadding="2"  rules="none">
						<tbody>
				<tr>
					<td valign="top" width="100%" height="100%">
						<table border="0" width="100%"  height="100%" cellSpacing="0" cellPadding="2" rules="none"
						style="border-collapse:separate;border-spacing: 1;border:solid #2F528F 2px;border-radius:10px;
						-moz-border-radius:10px;-webkit-border-radius: 5px;"
						>
						<!---->
							<tbody>
								<tr>
									<td width="100%"  colspan="2" >
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>
												Datos de timbrado
											</b>
										</font>
									</td>

								</tr>
								<tr>
									<td width="35%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Nombre
										</font>
									</td>
									<td width="65%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											Digiflow S.A.
										</font>
									</td>

								</tr>
								<tr>
									<td width="10%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											RUC
										</font>
									</td>
									<td width="90%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											20600948131
										</font>								
									</td>
								</tr>
								<tr>
									<td width="10%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Dirección
										</font>
									</td>
									<td width="90%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											Jr. Pachacutec Nro. 1315
										</font>								
									</td>
								</tr>
								<tr>
									<td width="10%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Nro resolución
										</font>
									</td>
									<td width="90%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											034 005 0010266
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Autorizado desde
										</font>
									</td>
									<td width="90%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											09/03/2018
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%"></td>
									<td width="90%"></td>
								</tr>
								<tr>
									<td width="10%"></td>
									<td width="90%"></td>
								</tr>
									<tr>
									<td width="10%"></td>
									<td width="90%"></td>
								</tr>
									<tr>
									<td width="10%"></td>
									<td width="90%"></td>
								</tr>
									<tr>
									<td width="10%"></td>
									<td width="90%"></td>
								</tr>
								<tr>
									<td width="10%"></td>
									<td width="15%"></td>
								</tr>
									<tr>
									<td width="10%"></td>
									<td width="15%"></td>
								</tr>
									<tr>
									<td width="10%"></td>
									<td width="15%"></td>
								</tr>
								<tr>
									<td width="10%"></td>
									<td width="15%"></td>
								</tr>
								<tr>
									<td width="10%"></td>
									<td width="15%"></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		
		</table>
	</xsl:template>

	<xsl:template name="DatosEmisor">
		<table border="0" width="100%" height="100px" cellspacing="0" cellPadding="2" rules="none">
			<tbody   height="100%">
				<tr   height="100%">
					<td valign="top" width="100%"  height="100%">
						<table border="0" width="100%"   height="100%" cellSpacing="0" cellPadding="2" rules="none"
						style="border-collapse:separate;border-spacing: 1;border:solid #2F528F 2px;border-radius:10px;
						-moz-border-radius:10px;-webkit-border-radius: 5px;">
						<tbody>
								<tr>
									<td width="100%" colspan="2" >
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>
												Emisor
											</b>
										</font>
									</td>
								</tr>
								<tr>
									<td length="5%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											RUC
										</font>
									</td>
									<td length="95%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<xsl:value-of select="format-number(//cac:PartyIdentification/cbc:ID,'###########','pen')"/>&#xA0;
										</font>
									</td>
								</tr>
								<tr>
									<td length="5%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Nombre
										</font>
									</td>
									<td length="95%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<xsl:value-of select="(//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName)"/>&#xA0;
										</font>
									</td>
								</tr>
								<tr>
									<td width="100%" colspan="2" >										
									</td>
								</tr>
								<tr>
									<td width="100%" colspan="2" >										
									</td>
								</tr>
								<tr>
									<td width="100%" colspan="2" >										
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>		
		</table>
	</xsl:template>

	<xsl:template name="DatosReceptor">
			<table border="0" width="100%" height="100px" cellspacing="0" cellPadding="2"  rules="none">
			<tbody>
				<tr>
					<td valign="top" width="100%" height="100%">
						<table border="0" width="100%" height="100%" cellSpacing="0" cellPadding="2" rules="none"
						style="border-collapse:separate;border-spacing: 1;border:solid #2F528F 2px;border-radius:10px;
						-moz-border-radius:10px;-webkit-border-radius: 5px;"
						>
							<tbody>
								<tr>
									<td width="100%" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>
												Receptor
											</b>
										</font>
									</td>
								</tr>
								<tr>
									<td length="5%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											RUC
										</font>
									</td>
									<td length="95%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>&#xA0;	 
										</font>
									</td>
								</tr>
								<tr>
									<td length="5%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Nombre
										</font>
									</td>
									<td length="95%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>&#xA0;
										</font>
										</td>
											</tr>
								<tr>
									<td length="5%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Dirección
										</font>
									</td>
									<td length="95%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:&#xA0;
											<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="05"/></xsl:call-template>
										</font>
									</td>
								</tr>

							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		
		</table>
	</xsl:template>

	<xsl:template name="TraeValorVariable">
		<xsl:param name="varNumVA"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA">
				<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
					<!--<xsl:value-of select="format-number(pe:Valor, '###,###,##0.00', 'pen')"/>-->
					<xsl:value-of select="pe:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$varNumVA">
				<xsl:if test="pe1:Valor !='-'">
					<xsl:value-of select="pe1:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$varNumVA">
				<xsl:if test="pe2:Valor !='-'">
					<xsl:value-of select="pe2:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="DatosCredito">
		<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
			<table width="80%" align="center" border="0" cellpadding="1">
				<tr  style="">
							
					<td width="80%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Datos de cuota <br/></strong>
						</font>
					</td>				
				</tr>
				<tr  style="">
					<td>
						<table width="100%" align="center" cellpadding="2" cellspacing="0" style="border:solid 1px #A5A5A5;">
						
							<tr>
							
								<td width="100%" align="center">
								<br/>
									<table style="" width="50%" align="center" cellpadding="2" cellspacing="0">
							<tr>
								<td width="15%" align="center" style="border:solid 1px #A5A5A5;" >
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Nro de cuota</strong>
									</font>
									
								</td>
								<td width="15%" align="center" style="border:solid 1px #A5A5A5;" >
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Fecha de <br/>Vencimiento</strong>
									</font>
								</td>
								<td width="15%" align="center" style="border:solid 1px #A5A5A5;" >
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Tipo de <br/>Moneda</strong>
									</font>
								</td>
								<td width="15%" align="center" style="border:solid 1px #A5A5A5;" >
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Monto de cuota</strong>
									</font>
								</td>
								
							</tr>
							<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
								<xsl:if test="cbc:ID !='Detraccion'">
									<xsl:if test="cbc:PaymentMeansID !='Credito'">	
										<xsl:if test="cbc:PaymentMeansID !='037'">
											<tr>
												<td width="7%" align="center" style="border:solid 1px #A5A5A5;" >
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
													</font>							
												</td>
												<td width="10%" align="center" style="border:solid 1px #A5A5A5;" >
													<font face="Arial, Helvetica, sans-serif" size="1">
														<!--<xsl:value-of select="cbc:PaymentDueDate"/>-->
														<xsl:if test="cbc:PaymentDueDate != '-' or cbc:PaymentDueDate != '_'">
															<xsl:call-template name="fecha_ddmmaa_formato">
													            <xsl:with-param name="FechaFormateada" select="cbc:PaymentDueDate"/>
													        </xsl:call-template>
														</xsl:if>
													</font>
												</td>
												<td width="10%" align="center" style="border:solid 1px #A5A5A5;" >
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="tmpDescripcionMoneda"/>
													</font>
												</td>
												<td width="12%" align="center" style="border:solid 1px #A5A5A5;" >
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
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
												<td width="7%" align="center" style="border:solid 1px #A5A5A5;" >
													<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
														<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
													</font>							
												</td>
												<td width="12%" align="center" style="border:solid 1px #A5A5A5;" >
													<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
														<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
													</font>
												</td>
												<td width="10%" align="center" style="border:solid 1px #A5A5A5;" >
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
								<br/>
								</td>
							
							</tr>
						
						</table>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>

	<xsl:template name="DatosDetracc">
		<xsl:if test="//cac:PaymentMeans/cbc:ID='Detraccion'">
	
			<table width="80%" align="center" border="0" cellpadding="1">
				<tr  style="">
					<td width="80%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Detracción en Moneda Soles</strong><br/>
						</font>
					</td>				
				</tr>
				<tr  style="">
					<td>
						<table width="100%" align="center" cellpadding="2" cellspacing="0" style="border:solid 1px #A5A5A5;">
							<tr>
								<td width="20%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>% Detracción:</strong>&#xA0;<xsl:value-of select="format-number(//cac:PaymentTerms/cbc:PaymentPercent,'##0.00','pen')"/>
									</font>
								</td>
								<td width="20%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Monto Detracción:</strong>&#xA0;<xsl:value-of select="format-number(//cac:PaymentTerms/cbc:Amount,'###,###,##0','pen')"/>
									</font>
								</td>
								<td width="20%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>N° de cuenta:</strong>&#xA0;000000447765
									</font>
								</td>							
								<td width="20%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Moneda:</strong>&#xA0;Sol
									</font>
								</td>
								<td width="20%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Código Detracción:</strong>&#xA0;<xsl:value-of select="format-number(//cac:PaymentTerms/cbc:PaymentMeansID,'000','pen')"/>
									</font>
								</td>
							</tr>						
						</table>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>

	<xsl:template name="DatosInfoAdicional">
		<table width="80%" align="center" border="0" cellpadding="1">
			<tr  style="">
				<td width="80%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Información adicional</strong><br/>
					</font>
				</td>				
			</tr>
			<tr  style="">
				<td>
					<table width="100%" align="center" cellpadding="2" cellspacing="0">
						<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03'">
							<tr>
								<td width="5%" align="center" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										1
									</font>
								</td>
								<td width="25%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										Código de cliente
									</font>
								</td>
								<td width="70%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="02"/></xsl:call-template>
									</font>
								</td>							
							</tr>
							<tr>
								<td width="5%" align="center" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										2
									</font>
								</td>
								<td width="25%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										Código de vendedor
									</font>
								</td>
								<td width="70%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="03"/></xsl:call-template>
									</font>
								</td>							
							</tr>
							<tr>
								<td width="5%" align="center" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										3
									</font>
								</td>
								<td width="25%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										Teléfono de cliente
									</font>
								</td>
								<td width="70%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="01"/></xsl:call-template>
									</font>
								</td>							
							</tr>
							<tr>
								<td width="5%" align="center" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										4
									</font>
								</td>
								<td width="25%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										Nro Documento Receptor
									</font>
								</td>
								<td width="70%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="04"/></xsl:call-template>
									</font>
								</td>							
							</tr>
							<tr>
								<td width="5%" align="center" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										5
									</font>
								</td>
								<td width="25%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										Transacción
									</font>
								</td>
								<td width="70%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="06"/></xsl:call-template>
									</font>
								</td>							
							</tr>
							<tr>
								<td width="5%" align="center" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										6
									</font>
								</td>
								<td width="25%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										Importe a pagar (Otra moneda)
									</font>
								</td>
								<td width="70%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="18"/></xsl:call-template>
									</font>
								</td>							
							</tr>
							<tr>
								<td width="5%" align="center" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										7
									</font>
								</td>
								<td width="25%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										Vale
									</font>
								</td>
								<td width="70%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="07"/></xsl:call-template>
									</font>
								</td>							
							</tr>
							<tr>
								<td width="5%" align="center" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										8
									</font>
								</td>
								<td width="25%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										Fax
									</font>
								</td>
								<td width="70%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="12"/></xsl:call-template>
									</font>
								</td>							
							</tr>
							<tr>
								<td width="5%" align="center" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										9
									</font>
								</td>
								<td width="25%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										Tipo de cambio
									</font>
								</td>
								<td width="70%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="09"/></xsl:call-template>
									</font>
								</td>							
							</tr>
							<tr>
								<td width="5%" align="center" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										10
									</font>
								</td>
								<td width="25%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										Kilometraje
									</font>
								</td>
								<td width="70%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="08"/></xsl:call-template>
									</font>
								</td>							
							</tr>
							<tr>
								<td width="5%" align="center" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										11
									</font>
								</td>
								<td width="25%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										Agente de retención de IGV
									</font>
								</td>
								<td width="70%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="11"/></xsl:call-template>
									</font>
								</td>							
							</tr>
						</xsl:if>
						<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
							<tr>
								<td width="5%" align="center" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										1
									</font>
								</td>
								<td width="25%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										Código de cliente
									</font>
								</td>
								<td width="70%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="02"/></xsl:call-template>
									</font>
								</td>							
							</tr>
							<tr>
								<td width="5%" align="center" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										2
									</font>
								</td>
								<td width="25%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										Teléfono de cliente
									</font>
								</td>
								<td width="70%" style="border:solid 1px #A5A5A5;">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="01"/></xsl:call-template>
									</font>
								</td>							
							</tr>							
						</xsl:if>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="DatosNota">
		<xsl:if test="/pe1:CreditNote or /pe2:DeditNote">
			<table width="80%" align="center" border="0" cellpadding="1">
				<tr  style="">
					<td>
						<table width="100%" align="center" cellpadding="2" cellspacing="0" style="border:solid 1px #A5A5A5;">
							<tr>
								<td width="100%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Motivo o Sustento:</strong>&#xA0;<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
									</font>
								</td>
							</tr>
							<tr>
								<td width="100%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Tipo de nota:</strong>&#xA0;<xsl:call-template name="MotivoNotaElectronica"/>
									</font>
								</td>							
							</tr>						
						</table>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>

	<xsl:template name="MotivoNotaElectronica">
		<xsl:choose>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='01'">ANULACION DE LA OPERACION</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='02'">ANULACION POR ERROR EN EL RUC</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='03'">CORRECCION POR ERROR EN LA DESCRIPCION</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='04'">DESCUENTO GLOBAL</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='05'">DESCUENTO POR ITEM</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='06'">DEVOLUCION TOTAL</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='07'">DEVOLUCION POR ITEM</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='08'">BONIFICACION</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='09'">DISMINUCION EN EL VALOR</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='10'">OTROS CONCEPTOS</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='11'">AJUSTES DE OPERACIONES DE EXPORTACION</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='12'">AJUSTES AFECTOS AL IVAP</xsl:when>
			<xsl:when test="pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='13'">CORRECCI&#xFFFD;N DEL MONTO NETO PENDIENTE DE PAGO Y/O LA(S) FECHAS(S) DE VENCIMIENTO DEL PAGO &#xFFFD;NICO O DE LAS CUOTAS Y/O MONTOS CORRESPONDIENTES A CADA CUOTA, DE SER EL CASO.</xsl:when>
			<xsl:when test="pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='01'">INTERESES POR MORA</xsl:when>
			<xsl:when test="pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='02'">AUMENTO EN EL VALOR</xsl:when>
			<xsl:when test="pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='03'">PENALIDADES / OTROS CONCEPTOS</xsl:when>
			<xsl:when test="pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='11'">AJUSTES DE OPERACIONES DE EXPORTACION</xsl:when>
			<xsl:when test="pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='12'">AJUSTES AFECTOS AL IVAP</xsl:when>
			<xsl:when test="pe2:DebitNote/cac:DiscrepancyResponse/cbc:ResponseCode='13'">CORRECCI&#xFFFD;N DEL MONTO NETO PENDIENTE DE PAGO Y/O LA(S) FECHAS(S) DE VENCIMIENTO DEL PAGO &#xFFFD;NICO O DE LAS CUOTAS Y/O MONTOS CORRESPONDIENTES A CADA CUOTA, DE SER EL CASO.</xsl:when>
			<xsl:otherwise>MOTIVO DE NOTA INEXISTENTE</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="cac:LegalMonetaryTotal">
	
</xsl:template>

<xsl:template match="cbc:ID">
	
</xsl:template>

<xsl:template match="cbc:InvoicedQuantity">
	
</xsl:template>

<xsl:template name="fecha_ddmmaa_formato">
	<xsl:param name="FechaFormateada"/>
	<xsl:variable name="aa">
		<xsl:value-of select="substring-before($FechaFormateada,'-')"/>
	</xsl:variable>
	<xsl:variable name="mmdd">
		<xsl:value-of select="substring-after($FechaFormateada,'-')"/>
	</xsl:variable>
	<!--prefijo Fecha Emision Mes -->
	<xsl:variable name="mm">
		<xsl:value-of select="substring-before($mmdd,'-')"/>
	</xsl:variable>
	<xsl:variable name="dd">
		<xsl:value-of select="substring-after($mmdd,'-')"/>
	</xsl:variable>
	<!-- MES -Nombre -->
	<xsl:value-of select="concat($dd,'/', $mm, '/' , $aa)"/>
</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\XML\20101363008&#x2D;01&#x2D;F999&#x2D;00000001.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->