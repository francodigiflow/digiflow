<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DatosReceptor">

		<!--<xsl:choose>

			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe1:CreditNote">-->
				<table border="0" cellSpacing="0" cellPadding="2" width="100%" rules="none">
					<tr>
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>NOMBRE</strong>
							</font>
						</td>
						<td colspan="3">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>:</strong>
								<!--<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>-->
								<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
								<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
								<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
							</font>
						</td>
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>N° PEDIDO</strong>
							</font>
						</td>
						<td width="25%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>:</strong>
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
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>
									<xsl:choose>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '-'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '1'">DNI</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">D.N.I.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '4'">CARNET EXTR.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CARNET EXTR.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '6'">R.U.C.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">R.U.C.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '7'">PASAPORTE</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PASAPORTE</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'A'">CED. DIP. IDENT.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">CED. DIP. IDENT.</xsl:when>
									</xsl:choose>
								</strong>
							</font>
						</td>
						<td colspan="3">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>:</strong>
								<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
								<!--<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />-->
							</font>
						</td>
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>FECHA EMISIÓN</strong>
							</font>
						</td>
						<td width="25%" align="left">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>:</strong>
								<xsl:value-of select="concat(substring(//cbc:IssueDate,9,2),'/',substring(//cbc:IssueDate,6,2),'/',substring(//cbc:IssueDate,1,4))"/>&#xA0;<xsl:value-of select="//cbc:IssueTime"/></font>
						</td>
					</tr>
					<tr>
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>DOMICILIO FISCAL</strong>
							</font>
						</td>
						<td colspan="3">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>:</strong>
								<xsl:value-of select="Invoice/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:StreetName"/>
								<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
								<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
								<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
								<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
								<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
								<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
								<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
								<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
								<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>

								<!--<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
						<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
						
						<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
						<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>-->
							</font>
						</td>
						<xsl:if test="/pe1:CreditNote">
<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe1:CreditNote">
									<strong>FORMA DE PAGO</strong>
								</xsl:if>
							</font>
						</td>
						<td width="25%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe1:CreditNote">
									<strong>:</strong>
									<xsl:for-each select="//cac:PaymentTerms">
										<xsl:if test="cbc:ID = 'FormaPago' and substring(cbc:PaymentMeansID,1,5) != 'Cuota'">
											<xsl:value-of select="cbc:PaymentMeansID"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</font>
						</td>
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								
									<strong>F. PAGO</strong>
								
							</font>
						</td>
						<td width="25%">
							<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>:
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='20'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='20'">
								<xsl:value-of select="pe1:Valor"/>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='20'">
								<xsl:value-of select="pe2:Valor"/>
							</xsl:if>
						</xsl:for-each></strong>
							</font>
						</td>
						</xsl:if>
						<xsl:if test="/pe:Invoice">
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>FECHA VCTO.</strong>
							</font>
						</td>
						<td width="25%">
							<strong>:</strong>
							<xsl:if test="//cbc:DueDate">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="concat(substring(//cbc:DueDate,9,2),'/',substring(//cbc:DueDate,6,2),'/',substring(//cbc:DueDate,1,4))"/>
								</font>
							</xsl:if>
						</td>
						</xsl:if>
					</tr>
					<tr>
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>DEPENDENCIA</strong>
							</font>
						</td>
						<td colspan="3">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>:</strong>
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
						<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>MONEDA</strong>
							</font>
						</td>
						<td width="25%">
							<strong>:</strong>
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:call-template name="DescripcionTipoDeMoneda_Total"/>
							</font>
						</td>
</xsl:if>

						<!--</xsl:if>-->
						<xsl:if test="/pe:Invoice">
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe1:CreditNote">
									<strong>FORMA DE PAGO</strong>
								</xsl:if>
							</font>
						</td>
						<td width="25%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe1:CreditNote">
									<strong>:</strong>
									<xsl:for-each select="//cac:PaymentTerms">
										<xsl:if test="cbc:ID = 'FormaPago' and substring(cbc:PaymentMeansID,1,5) != 'Cuota'">
											<xsl:value-of select="cbc:PaymentMeansID"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</font>
						</td>
						</xsl:if>
					</tr>
					<tr>
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>DIR. ENTREGA</strong>
							</font>
						</td>
						<td colspan="3">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>:</strong>
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
						<xsl:if test="/pe:Invoice">
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>MEDIO DE PAGO</strong>
							</font>
						</td>
						<td width="25%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>:</strong>

								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='14'">
										<xsl:value-of select="pe:Valor"/>
									</xsl:if>
								</xsl:for-each>

								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='14'">
										<xsl:value-of select="pe1:Valor"/>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='14'">
										<xsl:value-of select="pe2:Valor"/>
									</xsl:if>
								</xsl:for-each>
							</font>
						</td>
						</xsl:if>
<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>DOC. REF.</strong>
							</font>
						</td>
						<td width="25%">
							<strong>:</strong>
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:call-template name="ReferenciaDocumento"/>
							</font>
						</td>
</xsl:if>
					</tr>
					<tr>
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>VENDEDOR</strong>
							</font>
						</td>
						<td colspan="3">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>:</strong>
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
<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>DOC. RELAC.</strong>
							</font>
						</td>
						<td width="25%">
							<strong>:</strong>
							<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='18'">
								<xsl:value-of select="pe1:Valor"/>
							</xsl:if>
						</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='18'">
								<xsl:value-of select="pe2:Valor"/>
							</xsl:if>
						</xsl:for-each>
							</font>
						</td>
</xsl:if>
<xsl:if test="/pe:Invoice">
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>MONEDA</strong>
							</font>
						</td>
						<td width="25%">
							<strong>:</strong>
							<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:call-template name="DescripcionTipoDeMoneda_Total"/>
							</font>
						</td>
						</xsl:if>
					</tr>
						
                   <xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03'">
					<tr>
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>ESTATUS</strong>
							</font>
						</td>
						<td colspan="3">
						<strong>:</strong>
								<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='17'">
										<xsl:value-of select="pe:Valor"/>
									</xsl:if>
								</xsl:for-each>

								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='17'">
										<xsl:value-of select="pe1:Valor"/>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='17'">
										<xsl:value-of select="pe2:Valor"/>
									</xsl:if>
								</xsl:for-each>
								</font>
						</td>
						<td width="15%">
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>SEGUIMIENTO</strong>
							</font>
						</td>
						<td width="25%">
							<strong>:</strong>
							<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='16'">
										<xsl:value-of select="pe:Valor"/>
									</xsl:if>
								</xsl:for-each>

								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='16'">
										<xsl:value-of select="pe1:Valor"/>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='16'">
										<xsl:value-of select="pe2:Valor"/>
									</xsl:if>
								</xsl:for-each>
								</font>
						</td>
					</tr>
				</xsl:if>
				</table>
				<br/>
			<!--</xsl:when>-->

			
		<!--</xsl:choose>-->
	</xsl:template>

	<xsl:template name="DescripcionTipoDeMoneda_Total">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">DOLARES</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">DOLARES</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">DOLARES</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="ReferenciaDocumento">

		<xsl:for-each select="//cac:AdditionalDocumentReference">
			<font face="Arial, Helvetica, sans-serif" size="2">
				<xsl:value-of select="cbc:ID"/>
			</font>
		</xsl:for-each>



		<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
			<xsl:if test="cbc:DocumentTypeCode != '10'">
				<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:value-of select="cbc:ID"/>
				</font>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\descuentos\20602184065_2019020403BG1600000018.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="true"/><advancedProp name="bGenerateByteCode" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="xsltVersion" value="2.0"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->