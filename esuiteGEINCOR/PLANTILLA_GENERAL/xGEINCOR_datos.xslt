<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"

	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:template name="DatosReceptor">
		<table width="100%" cellpadding="2" cellspacing="2" border="0" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000" rules="none">
			<tr>
				<td>
					<font face="Arial, Helvetica, sans-serif" size="2"> 
						<strong>
							GEOMATIC INSTRUMENTS CORPORATION S.A.C.
						</strong>
						<br/><xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyName"/>
						<br/><xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/> 
						<br/><xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District"/> - <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/> - <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity"/>
					</font>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" cellpadding="2" cellspacing="0" border="0" bordercolor="#ffffff" rules="none"  style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
						<tr>
							<td width="12%">
								<font face="Arial, Helvetica, sans-serif" size="2"> 
									<strong>
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">Señor (es)</xsl:when>
											<xsl:otherwise>Señor (es)</xsl:otherwise>
										</xsl:choose>
									</strong>
								</font>
							</td>
							<td width="40%">
								<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>: </Strong>
									<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
								</font>
							</td><td width="18%">
								<font face="Arial, Helvetica, sans-serif" size="2"> 
									<strong>
									Documento
									</strong>
								</font>
							</td>
							<td width="30%">
								<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>: </Strong>
									<xsl:if test="//cbc:UBLVersionID='2.0'">
										<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.1'">
									
									<xsl:choose>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">S/D</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">S/D</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '-'">S/D</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">S/D</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '1'">DNI -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '4'">CE -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CE -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '6'">RUC -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">RUC -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '7'">PAS -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PAS -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'A'">CDI -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">CDI -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'B'">DIPRND -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'B'">DIPRND -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'C'">TIN -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'C'">TIN -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'D'">IN -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'D'">IN -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'E'">TAM -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'E'">TAM -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'F'">PTP -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'F'">PTP -
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</xsl:when>
									</xsl:choose>									
									</xsl:if>
								</font>
							</td>
						</tr>
						<tr>
						<xsl:if test="/pe1:CreditNote">
							<td width="12%">
							  	<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>Dirección</Strong>
								</font>
							</td>
							<td width="40%">
								<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>: </Strong>
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>

											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										
								</font>
							</td>
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
							<td width="12%">
							  	<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>Dirección</Strong>
								</font>
							</td>
							<td width="40%">
								<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>: </Strong>
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>

											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										
								</font>
							</td>
						</xsl:if>
						<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode ='03'">
							<td width="12%">
							  	<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>Dirección</Strong>
								</font>
							</td>
							<td width="40%">
								<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>: </Strong>
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>

											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										
								</font>
							</td>
						</xsl:if>
						<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode ='01'">
							<td width="12%">
							  	<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>Dirección</Strong>
								</font>
							</td>
							<td width="40%">
								<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>: </Strong>
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>

											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										
								</font>
							</td>
						</xsl:if>
							<td width="18%">
							  	<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>Fecha de Emision</Strong>
								</font>
							</td>
							<td width="30%">
									<Strong>: </Strong>
									<font face="Arial, Helvetica, sans-serif" size="2"> 
										<xsl:call-template name="fecha_"/>
									</font>
							</td>
						
						</tr>
						<tr>
							<td width="18%">
							  	<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>Moneda</Strong>
								</font>
							</td>
							<td width="30%">
									<Strong>: </Strong>
									<font face="Arial, Helvetica, sans-serif" size="2"> 
										<xsl:call-template name="LetraMoneda"/>
									</font>
							</td>
							<xsl:if test="/pe:Invoice">
							<td width="18%">
							  	<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>Fecha de Vencimiento</Strong>
								</font>
							</td>
							<td width="30%">
									<Strong>: </Strong>
									<font face="Arial, Helvetica, sans-serif" size="2"> 
										<xsl:value-of select="//cbc:DueDate"/>
									</font>
							</td>
							</xsl:if>
							<xsl:if test="/pe1:CreditNote">
							<td width="18%">
							  	<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>Factura/Boleta</Strong>
								</font>
							</td>
							<td width="30%">
									<Strong>: </Strong>
									<font face="Arial, Helvetica, sans-serif" size="2"> 
										<xsl:value-of select="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>
									</font>
							</td>
							</xsl:if>
							<xsl:if test="/pe2:DebitNote">
							<td width="18%">
							  	<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>Factura/Boleta</Strong>
								</font>
							</td>
							<td width="30%">
									<Strong>: </Strong>
									<font face="Arial, Helvetica, sans-serif" size="2"> 
										<xsl:value-of select="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>
									</font>
							</td>
							</xsl:if>				
						</tr>
						<tr>
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode ='01'">
							<td width="18%">
							  	<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>Forma de pago</Strong>
								</font>
							</td>
							<td width="30%">
									<Strong>: </Strong>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
											Crédito	
											</xsl:if>
											<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Contado'">
											Contado		
											</xsl:if>
										</font>
							</td>
							
							<td width="18%">
							  	<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>Orden de Compra</Strong>
								</font>
							</td>
							<td width="30%">
									<Strong>: </Strong>
									<font face="Arial, Helvetica, sans-serif" size="2"> 
										<xsl:value-of select="//cac:OrderReference/cbc:ID"/>
									</font>
							</td>
							</xsl:if>
						</tr>
						<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode ='01'">
						<tr>
						
							<td width="18%">
							  	<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>Guía de Remision Remitente: </Strong>
								</font>
							</td>
							<td width="30%">
									<Strong>: </Strong>
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:DespatchDocumentReference/cbc:ID"/>
										</font>
							</td>
							<td width="18%">
							  	<font face="Arial, Helvetica, sans-serif" size="2"> 
									<Strong>Orden de Venta</Strong>
								</font>
							</td>
							<td width="30%">
									<Strong>: </Strong>
									<font face="Arial, Helvetica, sans-serif" size="2"> 
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='03'">
											<xsl:if test="pe:Valor !='-'">
												<xsl:value-of select="pe:Valor"/> 
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
							</td>
						</tr>
						</xsl:if>
					</table>
				</td>
			</tr>
		</table>

	</xsl:template>
	<xsl:template name="fecha_">
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
			<xsl:variable name="HH">
	         	<xsl:value-of select="/pe:Invoice/cbc:IssueTime"/>
	      	</xsl:variable>
			
	      	<xsl:value-of select="concat($dd, '/', $mm, '/' , $aa,' ',$HH)"/>
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

	<xsl:template name="RetourneDato1">
		<xsl:param name="NumAd1"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo = $NumAd1">
				<xsl:if test="pe:Valor != '-'">
					<xsl:value-of select="substring-before(pe:Valor,'*')"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="RetourneDato2">
		<xsl:param name="NumAd2"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo = $NumAd2">
				<xsl:if test="pe:Valor != '-'">
					<xsl:value-of select="substring-before(substring-after(pe:Valor,'*'),'*')"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="RetourneDato3">
		<xsl:param name="NumAd3"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo = $NumAd3">
				<xsl:if test="pe:Valor != '-'">
					<xsl:value-of select="substring-after(substring-after(pe:Valor,'*'),'*')"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="RetournerMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'PEN'">SOLES</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'USD'">DÓLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode = 'EUR'">EUROS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'PEN'">SOLES</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'USD'">DÓLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode = 'EUR'">EUROS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'PEN'">SOLES</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'USD'">DÓLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode = 'EUR'">EUROS</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->