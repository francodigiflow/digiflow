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
		<table width="100%" cellpadding="2" cellspacing="2" border="0" bordercolor="#000000" rules="none">
			<tbody>
				<tr>
					<td width="65%">
						<table border="0" width="100%" cellpadding="2" cellspacing="1">
							<tr>
								<td width="15%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>SEÑOR(ES)</strong>
									</font>
								</td>
								<td colspan="3" width="85%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>: </strong>
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
									</font>
								</td>
							</tr>

							<tr>
								<td width="15%">
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>NO DOMICILIADO</strong>
										</font>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>DNI</strong>
										</font>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>CARNET EXTR.</strong>
										</font>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>R.U.C.</strong>
										</font>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID='6'">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>R.U.C.</strong>
										</font>
									</xsl:if>
									
									
									
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>PASAPORTE</strong>
										</font>
									</xsl:if>
									<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>CED. DIP. IDENT.</strong>
										</font>
									</xsl:if>
								</td>
								<td width="35%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>: </strong>
										<xsl:if test="//cbc:UBLVersionID='2.0'">
										<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
										-
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='9' or pe:Codigo='09'">
												<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
										</xsl:if>
										<xsl:if test="//cbc:UBLVersionID='2.1'">
									<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
								  </xsl:if>
									</font>
									
									
								</td>
							</tr>

							<tr>
								<td width="15%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>DIRECCIÓN</strong>
									</font>
								</td>
								<td colspan="3" width="85%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>: </strong>
										<xsl:if test="//cbc:UBLVersionID='2.0'">
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										-
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName"/>
										-
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
										-
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District"/>
										 </xsl:if>
										
											<xsl:if test="//cbc:UBLVersionID='2.1'">
								 <xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
								 
								  </xsl:if>
									</font>
								</td>
							</tr>

							<tr>
								<td width="15%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>TELÉFONO</strong>
									</font>
								</td>
								<td colspan="3" width="85%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>: </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='2' or pe:Codigo='02'">
												<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='2' or pe1:Codigo='02'">
												<xsl:if test="pe1:Valor!='-' and pe1:Valor!='0'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>	
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='2' or pe2:Codigo='02'">
												<xsl:if test="pe2:Valor!='-' and pe2:Valor!='0'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>

							<tr>
								<td width="15%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>CORRELATIVO INTERNO</strong>
									</font>
								</td>
								<td colspan="3" width="85%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>: </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='4' or pe:Codigo='04'">
												<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='4' or pe1:Codigo='04'">
												<xsl:if test="pe1:Valor!='-' and pe1:Valor!='0'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>	
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='4' or pe2:Codigo='04'">
												<xsl:if test="pe2:Valor!='-' and pe2:Valor!='0'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
						</table>
					</td>
					<td width="35%">
						<table border="0" width="100%" cellpadding="2" cellspacing="1">
							<tr>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>FECHA DE EMISIÓN</strong>
									</font>
								</td>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>: </strong>
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03'">
										<xsl:value-of select="concat(substring(/pe:Invoice/cbc:IssueDate,9,2),'/',substring(/pe:Invoice/cbc:IssueDate,6,2),'/',substring(/pe:Invoice/cbc:IssueDate,1,4))" />
										</xsl:if>
										<xsl:if test="/pe1:CreditNote">
										<xsl:value-of select="concat(substring(/pe1:CreditNote/cbc:IssueDate,9,2),'/',substring(/pe1:CreditNote/cbc:IssueDate,6,2),'/',substring(/pe1:CreditNote/cbc:IssueDate,1,4))" />
										</xsl:if>
		        						<xsl:if test="/pe2:DebitNote">
										<xsl:value-of select="concat(substring(/pe2:DebitNote/cbc:IssueDate,9,2),'/',substring(/pe2:DebitNote/cbc:IssueDate,6,2),'/',substring(/pe2:DebitNote/cbc:IssueDate,1,4))" />
										</xsl:if>
									</font>
								</td>
							</tr>

							<tr>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>MONEDA</strong>
									</font>
								</td>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>: </strong>
										<xsl:call-template name="TipoDeMoneda"/>
									</font>
								</td>
							</tr>

							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03'">
							<tr>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>FECHA VENCIMIENTO</strong>
									</font>
								</td>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>: </strong>
										<xsl:value-of select="concat(substring(/pe:Invoice/cbc:DueDate,9,2),'/',substring(/pe:Invoice/cbc:DueDate,6,2),'/',substring(/pe:Invoice/cbc:DueDate,1,4))" />
									    <!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='6' or pe:Codigo='06'">
												<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
													<xsl:value-of select="concat(substring(pe:Valor,9,2),'/',substring(pe:Valor,6,2),'/',substring(pe:Valor,1,4))"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>-->
									</font>
								</td>
							</tr>
							</xsl:if>

							<tr>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>ORDEN N°</strong>
									</font>
								</td>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>: </strong>
									    <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='3' or pe:Codigo='03'">
												<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='3' or pe1:Codigo='03'">
												<xsl:if test="pe1:Valor!='-' and pe1:Valor!='0'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>	
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='3' or pe2:Codigo='03'">
												<xsl:if test="pe2:Valor!='-' and pe2:Valor!='0'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>

							<tr>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>ADIC. COA.</strong>
									</font>
								</td>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>: </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='5' or pe:Codigo='05'">
												<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='5' or pe1:Codigo='05'">
												<xsl:if test="pe1:Valor!='-' and pe1:Valor!='0'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>	
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='5' or pe2:Codigo='05'">
												<xsl:if test="pe2:Valor!='-' and pe2:Valor!='0'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>
							
							<!--<tr>
								<td width="50%">
									<xsl:choose>
										<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>GUÍA DE REMISIÓN N°</strong>
											</font>
										</xsl:when>
										<xsl:otherwise>
											<font face="Arial, Helvetica, sans-serif" size="2">
												<strong>REFERENCIA</strong>
											</font>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>: </strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='2' or pe:Codigo='02'">
												<xsl:if test="pe:Valor!='-' and pe:Valor!='0'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='2' or pe1:Codigo='02'">
												<xsl:if test="pe1:Valor!='-' and pe1:Valor!='0'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>	
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='2' or pe2:Codigo='02'">
												<xsl:if test="pe2:Valor!='-' and pe2:Valor!='0'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</font>
								</td>
							</tr>-->
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="xml\20100128218&#x2D;07&#x2D;FC00&#x2D;00000005.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->