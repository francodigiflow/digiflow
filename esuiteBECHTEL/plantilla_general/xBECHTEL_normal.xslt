<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
	xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
	xmlns:ccts="urn:un:unece:uncefact:documentation:2"
	exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes" />
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN="0.00" />
	
	<xsl:variable name="numColBl">
		<xsl:if test="/pe:Invoice != ''">
			<xsl:value-of select="25 - count(/pe:Invoice/cac:InvoiceLine)" />
		</xsl:if>
		<xsl:if test="/pe1:CreditNote != ''">
			<xsl:value-of select="25 - count(/pe1:CreditNote/cac:CreditNoteLine)" />
		</xsl:if>
		<xsl:if test="/pe2:DebitNote != ''">
			<xsl:value-of select="25 - count(/pe2:DebitNote/cac:DebitNoteLine)" />
		</xsl:if>
	</xsl:variable>
	<xsl:include href="xBECHTEL_encab.xslt" />
	<xsl:include href="xBECHTEL_detalle.xslt" />
	<xsl:include href="xBECHTEL_bottom.xslt" />
	<xsl:include href="xBECHTEL_datos.xslt" />
	<xsl:include href="xBECHTEL_total.xslt" />
	<xsl:template match="/">
		<html xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2"
			xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
			xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2"
			xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
			xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
			xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
			xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
			xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
			xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
			xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
			xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
			xmlns:ccts="urn:un:unece:uncefact:documentation:2">
			<head>
				<title>Comprobante Electrónico</title>
			</head>
			<body>
				<table cellSpacing="1" width="100%" border="0">
					<tbody>
						<tr><td><xsl:call-template name="Encabezado" /></td></tr>
						<tr><td><xsl:call-template name="DatosReceptor" /></td></tr>
						<tr><td><xsl:call-template name="DetallesEncabezado" /></td></tr>
						<tr><td><xsl:call-template name="Total" /></td></tr>
						<tr><td><xsl:call-template name="Referencia" /></td></tr>
						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<tr><td><xsl:call-template name="CTSOtraTonteria" /></td></tr>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
						<tr><td><xsl:call-template name="DatoDetraccion" /></td></tr>
						</xsl:if> 
						<tr width="100%"><td width="100%"><xsl:call-template name="bottom_hash" /></td></tr>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="no" name="ANTICIPO RF" userelativepaths="yes" externalpreview="yes" url="..\XML TEST\UBL 21 20100020361&#x2D;01&#x2D;AC1F F201&#x2D;00000010.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="ANTICIPO 1R" userelativepaths="yes" externalpreview="no" url="..\XML TEST\UBL 21 20100020361&#x2D;01&#x2D;AC1R F201&#x2D;00000008.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="ANTICIPO 2R" userelativepaths="yes" externalpreview="yes" url="..\XML TEST\UBL 21 20100020361&#x2D;01&#x2D;AC2R F201&#x2D;00000009.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="ANTICIPO 1" userelativepaths="yes" externalpreview="yes" url="..\XML TEST\UBL 21 20100020361&#x2D;01&#x2D;ANT1 F201&#x2D;00000006.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="ANTICIPO 2" userelativepaths="yes" externalpreview="yes" url="..\XML TEST\UBL 21 20100020361&#x2D;01&#x2D;ANT2 F101&#x2D;00000018.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="DETRACCION" userelativepaths="yes" externalpreview="yes" url="..\..\..\0PRODUCCION0\DXN UBL 2.1\XML TEST\UBL 21 20106975737_2018080101FDET200047858.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="EXPORTACION" userelativepaths="yes" externalpreview="yes" url="..\XML TEST\UBL 21 20100182263&#x2D;01&#x2D;EXP FEL3&#x2D;00000677.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="GRATUITA" userelativepaths="yes" externalpreview="no" url="..\XML TEST\UBL 21 20600948131_2018072001FGR100000003.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="BOLETAS" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20600948131_2018072003BO0100000006.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="DEBITO" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20600948131_2018072008FDE100000010.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="CREDITO" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20600948131_2018072307FCR100000004.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="yes" name="FACTURA" userelativepaths="yes" externalpreview="yes" url="..\..\PUNTOVISUAL\20216501021&#x2D;01&#x2D;F101&#x2D;00003246.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="GRABADA Y EXONERADA" userelativepaths="yes" externalpreview="no" url="..\XML TEST\20125899723_2018110703B00100000129 GRABADA Y EXONERADA UBL21.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="GRATUITA EXONERADA" userelativepaths="yes" externalpreview="no" url="..\XML TEST\20125899723_2018111601F00200000007 GRATUITA EXONERADA UBL21.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="GRATUITA GRABADA" userelativepaths="yes" externalpreview="no" url="..\XML TEST\20125899723_2018111601F00200000008 GRAT GRAB UBL21.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="file:///c:/Users/emendez/Desktop/20603630409&#x2D;01&#x2D;F001&#x2D;00000002.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20100257298&#x2D;01&#x2D;FFQA&#x2D;90112727.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose" x="207" y="62"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/=[0]" x="161" y="56"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/xsl:when/xsl:call&#x2D;template" x="277" y="92"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/=[1]" x="161" y="84"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/xsl:when[1]/xsl:call&#x2D;template" x="157" y="92"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/xsl:otherwise/xsl:if" x="47" y="62"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/xsl:otherwise/xsl:if/xsl:call&#x2D;template" x="117" y="92"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/xsl:otherwise/xsl:if[1]" x="367" y="22"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/xsl:otherwise/xsl:if[1]/xsl:call&#x2D;template" x="317" y="52"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[4]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="197" y="26"/><block path="html/body/table/tbody/tr[4]/td/table/tbody/xsl:if/or[0]" x="351" y="24"/><block path="html/body/table/tbody/tr[4]/td/table/tbody/xsl:if" x="397" y="26"/><block path="html/body/table/tbody/tr[4]/td/table/tbody/xsl:if/tr/td/xsl:call&#x2D;template" x="157" y="26"/><block path="html/body/table/tbody/tr[6]/td/xsl:call&#x2D;template" x="357" y="26"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->