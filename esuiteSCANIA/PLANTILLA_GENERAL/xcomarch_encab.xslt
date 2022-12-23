<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="100%">
						<xsl:call-template name="EncabezadoImagenes"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>


	<xsl:template name="EncabezadoImagenes">
		<p>
			<table cellSpacing="0" cellPadding="0" width="100%" border="0" borderColor="#000000">
				<tbody>
					<tr>
						<td align="left">
<!--							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>-->
									<!--<td align="left">-->
										<!--<img src="C:\Users\FrancoCabanillasGóme\Documents\Representaciones\representaciones\SCANIA\logo1_scania.jpg" width="200" height="80"/>-->
										<img src="data:image/*;base64,[logo_1]" height="70"/>
									<!--</td>-->
<!--								</tr>
							</table>-->
						</td>
						<td align="right" width="80%">
							<!--<table cellSpacing="0" cellPadding="0" width="70%" border="0">
							</table>-->
						</td>
						<td align="right">
								<!--<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td align="right">-->
										<!--<img src="C:\Users\FrancoCabanillasGóme\Documents\Representaciones\representaciones\SCANIA\logo2.jpg" width="80" height="80"/>-->
										<img src="data:image/*;base64,[logo_2]" width="80" height="80" />
							<!--		</td>
								</tr>
							</table>-->
						</td>
					</tr>
				</tbody>
			</table>
		</p>
	</xsl:template>
	
	
	
		<xsl:template name="EncabezadoPeru">
		<p>
			<table cellSpacing="2" cellPadding="0" width="100%" border="0" borderColor="#000000">
				<tbody>
					<tr>
						<td width="100%" align="center">
							<table cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tbody>
						<tr>
						<td>
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td>

								<!--img src="C:\Users\Admin\Downloads\esuiteMUNCHER\logo_muncher.jpg" width="200" height="100"/-->
										<img src="data:image/*;base64,[logo_1]" width="200" height="100" />
									</td>
								</tr>
							</table>
						</td>
						<td align="center">
							<table cellSpacing="0" cellPadding="0" width="75%" border="0">
								<tr>
									<td align="">
									<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										EMPRESA:
										</font>										
										<font size="2" face="Arial, Helvetica, sans-serif">
											<strong><xsl:value-of select="(//cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name)"/></strong>
										</font>
										
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<br/>DIRECCIÓN: <xsl:value-of select="(//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line)"/>
											<br/>DPTO - PROV - DISTRITO: 
											<xsl:value-of select="(//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity)"/> &#xA0;
											<xsl:value-of select="(//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName)"/> &#xA0;
											<xsl:value-of select="(//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District)"/>
											<br/>TELEFONOS:
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
											<br/>WEB:
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
							</table>
						</td>
						<td align="center">
							<table cellSpacing="0" cellPadding="0" width="75%" border="0">
								<tr>
									<td align="">
									<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										EMPRESA:
										</font>										
										<font size="2" face="Arial, Helvetica, sans-serif">
											<strong><xsl:value-of select="(//cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name)"/></strong>
										</font>
										
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<br/>DIRECCIÓN: <xsl:value-of select="(//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line)"/>
											<br/>DPTO - PROV - DISTRITO: 
											<xsl:value-of select="(//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity)"/> &#xA0;
											<xsl:value-of select="(//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName)"/> &#xA0;
											<xsl:value-of select="(//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District)"/>
											<br/>TELEFONOS:
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
											<br/>WEB:
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
							</table>
						</td>
					</tr>
					
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
					</tr>
				</tbody>
			</table>
		</p>
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td>
						<table borderColor="#000000" cellSpacing="0" cellPadding="4" width="100%" border="1">
							<tbody>
								<tr>
									<td vAlign="top" width="100%" align="center">
										<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
											<br/>&#xA0;
											<br/>&#xA0;
											<strong>Datos del timbrado
												<!--<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>-->
												<xsl:value-of select="format-number(//cac:PartyIdentification/cbc:ID,'###########','pen')"/>
												<br/>&#xA0;
												<br/>&#xA0;
												<xsl:call-template name="tipodocu"/>
												<br/>&#xA0;
												<xsl:call-template name="NFolio"/>
												<br/>&#xA0;</strong>
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

	<xsl:template name="tipodocu">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
			<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode!='40' and //cbc:UBLVersionID='2.1'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Factura electrónica</font>
				</xsl:if>
				<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Factura / Invoice</font>
				</xsl:if>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Boleta de venta electrónica</font>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de crédito electrónica</font>
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de débito electrónica</font>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="aviso">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Factura Electrónica</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Boleta de Venta Electrónica</font>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de Crédito Electrónica</font>
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de Débito Electrónica</font>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="NFolio">
		<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
			<xsl:value-of select="/pe:Invoice/cbc:ID"/>
			<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
			<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
		</font>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20520929658&#x2D;01&#x2D;FF11&#x2D;40000014.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->