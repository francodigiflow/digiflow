<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DatosReceptor">
		<table border="0" width="100%" cellpadding="1" cellspacing="0">
			<tbody>
				<tr>
					<td width="60%">
						<table border="0" width="100%" cellpadding="1" cellspacing="0">
							<tr>
								<td width="15%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Sr(es)</strong>
									</font>
								</td>
								<td colspan="3" width="85%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
									</font>
								</td>
							</tr>

							<tr>
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<td width="15%">
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>NO DOMICILIADO</strong>
										</font>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>DNI</strong>
										</font>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>CARNET EXTR.</strong>
										</font>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>R.U.C.</strong>
										</font>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>PASAPORTE</strong>
										</font>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>CED. DIP. IDENT.</strong>
										</font>
									</xsl:if>
								</td>
								</xsl:if>
								<xsl:if test="//cbc:UBLVersionID='2.1'">
								
								<td width="15%">
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='0'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>NO DOMICILIADO</strong>
										</font>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='1'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>DNI</strong>
										</font>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='4'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>CARNET EXTR.</strong>
										</font>
									</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='6'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>R.U.C.</strong>
										</font>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='7'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>PASAPORTE</strong>
										</font>
									</xsl:if>
										<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='A'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>CED. DIP. IDENT.</strong>
										</font>
									</xsl:if>
								</td>
									</xsl:if>
								<td width="35%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
										<xsl:if test="//cbc:UBLVersionID='2.0'">
										<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
										</xsl:if>
										<xsl:if test="//cbc:UBLVersionID='2.1'">
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>									
										</xsl:if>
									</font>
								</td>
								<!--<td width="15%">
									<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>COD. CLIENTE</strong>
										</font>
								</td>-->
								<!--td width="35%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='01'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='01'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='01'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>-->
							</tr>

							<tr>
								<td width="15%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>DIRECCION</strong>
									</font>
								</td>
								<td colspan="3" width="85%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
										<xsl:if test="$varDirEmis =''">
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
										</xsl:if>
										
										<xsl:if test="$varDirEmis !=''">
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										</xsl:if>
										
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										
										
									</font>
								</td>
							</tr>

							<tr>
								<td width="15%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>MONEDA</strong>
									</font>
								</td>
								<td colspan="3" width="85%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
										<xsl:call-template name="TipoDeMoneda"/>
									</font>
								</td>
							</tr>
							<tr>
								<td width="15%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>PEDIDO</strong>
									</font>
								</td>
								<td colspan="3" width="85%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='02'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='02'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='02'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
	
							<tr>
								<td width="15%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>VENDEDOR</strong>
									</font>
								</td>
								<td colspan="3" width="85%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
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
									</font>
								</td>
							</tr>
							<tr>
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
								<xsl:if test="//cac:PaymentTerms/cbc:ID ='FormaPago'">
								<td width="15%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>FORMA DE PAGO</strong>
									</font>
								</td>
								<td colspan="3" width="85%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
										<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID ='Credito'">
									Credito
									</xsl:if>
									<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID ='Contado'">
									Contado
									</xsl:if>
									</font>
								</td>
								</xsl:if>
							</xsl:if>
							</tr>
														
							<!-- <tr><td colspan="4"><font face="Arial, Helvetica, sans-serif" size="1"><br/></font></td></tr>

							<tr><td colspan="4"><font face="Arial, Helvetica, sans-serif" size="1"><br/></font></td></tr>-->
						</table>
					</td>
					<td width="50%" border="0">
						<table rules="none" border="0" width="100%" cellpadding="0" cellspacing="0">
							<!-- <tr> -->
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>FECHA</strong>
									</font>
								</td>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
										<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
										<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
										<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
									</font>
								</td>
							<!-- </tr> -->

							<tr>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>HORA</strong>
									</font>
								</td>
								<td colspan="3" width="50%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='05'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='05'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='05'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>

							<tr>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>CONDICION DE VENTA</strong>
									</font>
								</td> 
								<td colspan="3" width="50%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='04'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='04'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='04'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
								</tr>

							<tr>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>FECHA DE VENCIMIENTO</strong>
									</font>
								</td>
								<td colspan="3" width="50%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
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
									</font>
								</td>
							</tr>

							<tr>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>CODIGO DE CLIENTE</strong>
									</font>
								</td>
								<td colspan="3" width="50%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='07'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='07'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='07'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>

							<tr>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>GUIA DE REMISION</strong>
									</font>
									</td>
									<td colspan="2" width="50%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>: </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='08'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>	
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='08'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>	
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='08'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>	
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" width="100%">
						<table border="0" width="100%" cellpadding="1" cellspacing="0">
							<tr>
								<td width="15%">
									
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong></strong>
											</font>
										
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong></strong>
											</font>
										
								</td>
								<td width="85%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong> </strong>
										
									</font>
								</td>
							</tr> 
							<tr>
								<td width="15%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong></strong>
									</font>
								</td>
								<td width="85%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong> </strong>
										
									</font>
								</td>
							</tr>

							<tr>
								<td width="15%"></td>
								<td width="85%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="TipoDeMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="file:///d:/xml/20458605662&#x2D;01&#x2D;FF14&#x2D;90000034.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->