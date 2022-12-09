<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="numColBl">
		<xsl:if test="/pe:Invoice != ''">
			<xsl:value-of select="18 - count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote != ''">
			<xsl:value-of select="18 - count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote != ''">
			<xsl:value-of select="18 - count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>

	<xsl:include href="xpanasa_encab.xslt"/>
	<xsl:include href="xpanasa_datos.xslt"/>
	<xsl:include href="xpanasa_detalle.xslt"/>
	<xsl:include href="xpanasa_bottom.xslt"/>
	<xsl:include href="xpanasa_total.xslt"/>

	<xsl:template match="/">
		<html xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
		      xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
		      xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
		      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
		      xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
		      xmlns:ccts="urn:un:unece:uncefact:documentation:2">

			<head>
				<title>Documento Electrónico</title>
			</head>

			<body>
				<!--<table cellSpacing="1" width="100%" border="0">-->
				<table cellSpacing="0" cellPadding="1" width="100%" border="0">
					<tr>
						<td width="100%">
							<xsl:call-template name="Encabezado"/>
						</td>
					</tr>
					<tr>
						<td width="100%">
							<xsl:call-template name="DatosCliente"/>
						</td>
					</tr>
					<xsl:variable name="CTSvar10">
						<xsl:call-template name="DatoAdicional01">
							<xsl:with-param name="var" select="10"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="CTSvar11">
						<xsl:call-template name="DatoAdicional01">
							<xsl:with-param name="var" select="11"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:if test="$CTSvar10 != '' or $CTSvar11 != ''">
						<tr>
							<td width="100%">
								<xsl:call-template name="DatosCliente2"/>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
						<tr>
							<td width="100%">
								<xsl:call-template name="Referencia"/>
							</td>
						</tr>
					</xsl:if>
					<tr>
						<td width="100%">
							<xsl:call-template name="Detalle"/>
						</td>
					</tr>
					<tr>
						<td width="100%">
							<xsl:call-template name="Total"/>
						</td>
					</tr>
					<tr>
						<td width="100%">
							<xsl:call-template name="Son"/>
						</td>
					</tr>
					<tr>
						<td width="100%">
							<xsl:call-template name="bottom_hash"/>
						</td>
					</tr>
					<xsl:variable name="CTSvar13">
						<xsl:call-template name="DatoAdicional01">
							<xsl:with-param name="var" select="13"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:if test="$CTSvar13 != ''">
						<tr>
							<td width="100%">
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="$CTSvar13"/>
								</font>
							</td>
						</tr>
					</xsl:if>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="panasa&#x2D;fact" userelativepaths="yes" externalpreview="yes" url="..\Quimpac\20536733419&#x2D;01&#x2D;FP01&#x2D;10036374.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="iErrorHandling" value="fatal"/></scenario><scenario default="no" name="panasa&#x2D;nc" userelativepaths="yes" externalpreview="yes" url="20100047641&#x2D;07&#x2D;BC01&#x2D;00000003.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="iErrorHandling" value="fatal"/></scenario><scenario default="no" name="panasa&#x2D;boleta" userelativepaths="yes" externalpreview="yes" url="20100047641&#x2D;03&#x2D;BE01&#x2D;00000650.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20100128056&#x2D;01&#x2D;F001&#x2D;2001.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="224" y="10"/><block path="html/body/table/tbody/tr[1]/td/xsl:if/or[0]" x="139" y="44"/><block path="html/body/table/tbody/tr[1]/td/xsl:if/or[0]/or[0]" x="110" y="18"/><block path="html/body/table/tbody/tr[1]/td/xsl:if/or[0]/or[0]/or[0]" x="79" y="2"/><block path="html/body/table/tbody/tr[1]/td/xsl:if/or[0]/or[0]/or[0]/=[0]" x="11" y="3"/><block path="html/body/table/tbody/tr[1]/td/xsl:if/or[0]/or[0]/or[0]/=[1]" x="88" y="104"/><block path="html/body/table/tbody/tr[1]/td/xsl:if/or[0]/or[0]/=[1]" x="131" y="90"/><block path="html/body/table/tbody/tr[1]/td/xsl:if/or[0]/=[1]" x="174" y="126"/><block path="html/body/table/tbody/tr[1]/td/xsl:if" x="195" y="23"/><block path="html/body/table/tbody/tr[1]/td/xsl:if/xsl:call&#x2D;template" x="323" y="71"/><block path="html/body/table/tbody/tr[2]/td/table/tbody/tr/td/xsl:if/or[0]" x="77" y="34"/><block path="html/body/table/tbody/tr[2]/td/table/tbody/tr/td/xsl:if/or[0]/or[0]" x="30" y="44"/><block path="html/body/table/tbody/tr[2]/td/table/tbody/tr/td/xsl:if/or[0]/or[0]/or[0]" x="5" y="31"/><block path="html/body/table/tbody/tr[2]/td/table/tbody/tr/td/xsl:if/or[0]/or[0]/or[0]/=[0]" x="45" y="17"/><block path="html/body/table/tbody/tr[2]/td/table/tbody/tr/td/xsl:if/or[0]/or[0]/or[0]/=[1]" x="10" y="72"/><block path="html/body/table/tbody/tr[2]/td/table/tbody/tr/td/xsl:if/or[0]/or[0]/=[1]" x="73" y="131"/><block path="html/body/table/tbody/tr[2]/td/table/tbody/tr/td/xsl:if/or[0]/=[1]" x="33" y="151"/><block path="html/body/table/tbody/tr[2]/td/table/tbody/tr/td/xsl:if" x="100" y="68"/><block path="html/body/table/tbody/tr[2]/td/table/tbody/tr/td/xsl:if/xsl:call&#x2D;template" x="185" y="56"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="81" y="163"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:if/=[0]" x="219" y="82"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:if" x="226" y="49"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:if/xsl:call&#x2D;template" x="265" y="13"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/xsl:choose" x="190" y="160"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/xsl:choose/=[0]" x="57" y="71"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/xsl:choose/xsl:when/xsl:call&#x2D;template" x="305" y="13"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/xsl:choose/=[1]" x="128" y="142"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/xsl:choose/xsl:when[1]/xsl:call&#x2D;template" x="147" y="5"/><block path="" x="289" y="135"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="287" y="82"/><block path="html/body/table/tbody/tr[4]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="264" y="66"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->