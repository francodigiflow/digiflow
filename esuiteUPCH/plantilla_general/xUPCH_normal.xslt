<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="numColBl">
		<xsl:if test="/pe:Invoice!=''">
			<xsl:value-of select="25-count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote!=''">
			<xsl:value-of select="25-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote!=''">
			<xsl:value-of select="25-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>

<xsl:variable name="v_RucEmisor">
		<xsl:if test="//cbc:UBLVersionID='2.1'">
			<xsl:value-of select="//cac:PartyIdentification/cbc:ID"/>
		</xsl:if>
		<xsl:if test="//cbc:UBLVersionID='2.0'">
			<xsl:value-of select="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID"/>
		</xsl:if>
	</xsl:variable>

	<xsl:variable name="v_TipoRucReceptor">

		<xsl:if test="//cbc:UBLVersionID='2.1'">
			<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">NO DOMICILIADO</xsl:if>
			<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI</xsl:if>
			<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CARNET EXTR.</xsl:if>
			<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">R.U.C.</xsl:if>
			<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PASAPORTE</xsl:if>
			<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">CED. DIP. IDENT</xsl:if>
		</xsl:if>
		<xsl:if test="//cbc:UBLVersionID='2.0'">
			<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">NO DOMICILIADO</xsl:if>
			<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '1'">DNI</xsl:if>
			<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '4'">CARNET EXTR.</xsl:if>
			<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '6'">R.U.C.</xsl:if>
			<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '7'">PASAPORTE</xsl:if>
			<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'A'">CED. DIP. IDENT</xsl:if>
		</xsl:if>
	</xsl:variable>

	<xsl:variable name="v_RucReceptor">
		<xsl:if test="//cbc:UBLVersionID='2.0'">
			<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
		</xsl:if>
		<xsl:if test="//cbc:UBLVersionID='2.1'">
			<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
		</xsl:if>
	</xsl:variable>

	<xsl:variable name="v_DirRecep">
		<xsl:if test="//cbc:UBLVersionID='2.0'">
			<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>

			<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
		</xsl:if>
		<xsl:if test="//cbc:UBLVersionID='2.1'">
			<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
		</xsl:if>
	</xsl:variable>

	<xsl:include href="xUPCH_encab.xslt"/>
	<xsl:include href="xUPCH_detalle.xslt"/>
	<xsl:include href="xUPCH_bottom.xslt"/>
	<xsl:include href="xUPCH_datos.xslt"/>
	<xsl:include href="xUPCH_total.xslt"/>
	<xsl:template match="/">
		<html xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
		      xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
		      xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
		      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
		      xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
		      xmlns:ccts="urn:un:unece:uncefact:documentation:2">
			<head>
				<title>Comprobante Electrónico</title>
			</head>
			<body>
				<table cellSpacing="1" width="100%" border="0">
					<tbody>
						<tr>
							<td>
								<xsl:call-template name="Encabezado"/>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:call-template name="DatosReceptor"/>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:call-template name="ReferenciaItem"/>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:call-template name="DetallesEncabezado"/>
							</td>
						</tr>
						<tr>
							<td>
								<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
									<tbody>
										<tr>
											<td vAlign="top" width="70%" align="left">
												<xsl:call-template name="Referencia"/>
											</td>
											<td width="1%" align="left"/>
											<td vAlign="top" width="29%">
												<xsl:call-template name="Total"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr width="100%">
							<td>
								<xsl:call-template name="DatoAdicional_Detraccion"/>
							</td>
						</tr>
						<tr width="100%">
							<td>
								<xsl:call-template name="bottom_hash"/>
							</td>
						</tr>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\xml\20610098704&#x2D;01&#x2D;FL01&#x2D;00000001.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="321" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="201" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="161" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="281" y="69"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->