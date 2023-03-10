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
			<xsl:value-of select="20 - count(/pe:Invoice/cac:InvoiceLine)" />
		</xsl:if>
		<xsl:if test="/pe1:CreditNote != ''">
			<xsl:value-of select="20 - count(/pe1:CreditNote/cac:CreditNoteLine)" />
		</xsl:if>
		<xsl:if test="/pe2:DebitNote != ''">
			<xsl:value-of select="20 - count(/pe2:DebitNote/cac:DebitNoteLine)" />
		</xsl:if>
	</xsl:variable>
	<xsl:include href="xSOLANA_encab.xslt" />
	<xsl:include href="xSOLANA_detalle.xslt" />
	<xsl:include href="xSOLANA_bottom.xslt" />
	<xsl:include href="xSOLANA_datos.xslt" />
	<xsl:include href="xSOLANA_total.xslt" />

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
			
			
			<!--<style>
                    body {
                          margin-top: 20px;
                          margin-bottom: 20px;
                          margin-right: 30px;
                          margin-left: 40px;
                          }
            </style>-->
			
			<head>
				<title>Comprobante Electrónico</title>
			</head>
			<body>
				<table cellSpacing="1" width="100%" border="0">
					<tbody>
						<tr><td>&#160;</td></tr>
						<tr><td><xsl:call-template name="Encabezado" /></td></tr>
						<tr><td><xsl:call-template name="DatosReceptor" /></td></tr>
					
						<tr><td><xsl:call-template name="Detalles_QUANTA" /></td></tr>
					
						<tr><td><xsl:call-template name="Total" /></td></tr>

						<tr>
							<td>&#160;
							</td>
						</tr>															
						<tr width="100%">
							<td width="100%">
								<xsl:call-template name="bottom_hash" />
							</td>
						</tr>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="no" name="FACTURA&#x2D;CABAL" userelativepaths="yes" externalpreview="yes" url="xml\20254134318&#x2D;01&#x2D;F001&#x2D;00030806.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="notacredtio" userelativepaths="yes" externalpreview="yes" url="20257982794&#x2D;07&#x2D;FNC1&#x2D;00000705.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="boleta" userelativepaths="yes" externalpreview="yes" url="20257982794&#x2D;03&#x2D;BP01&#x2D;00000001.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="notadebito" userelativepaths="yes" externalpreview="yes" url="20262996329&#x2D;08&#x2D;FX12&#x2D;07000002.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="REAL" userelativepaths="yes" externalpreview="yes" url="20117331823_2015090701F01100016133.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="ultimate" userelativepaths="yes" externalpreview="yes" url="20117331823_2015091501FZ1100016206.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="globalpumps" userelativepaths="yes" externalpreview="yes" url="20546923747_2015091601FP0100000112.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="Separador" userelativepaths="yes" externalpreview="yes" url="observaciones.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="datotipo02" userelativepaths="yes" externalpreview="yes" url="20117331823_2015111001F03200000842.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="GlobalPumps" userelativepaths="yes" externalpreview="yes" url="..\..\NATCLAR\Plantillas y RI\20546923747_2015110401F00400003015.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="datosadicionalesPV" userelativepaths="yes" externalpreview="yes" url="DATOS2&#x2D;20117331823_2015120701F01100016875.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="garantiaOBSERQUIO" userelativepaths="yes" externalpreview="yes" url="..\REVISAR\20117331823_2015122201F01100016959.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="02OBSERQUIO" userelativepaths="yes" externalpreview="yes" url="..\REVISAR\dos\20117331823_2015122201F02200022036.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="neoGarantia" userelativepaths="yes" externalpreview="yes" url="..\..\jleon.DIGIFLOW\Desktop\20117331823_2016011801F0X100008001.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="NOTADEBITO009" userelativepaths="yes" externalpreview="yes" url="xml\20254134318&#x2D;08&#x2D;F001&#x2D;00002112.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="NOTACREDIT009" userelativepaths="yes" externalpreview="yes" url="xml\20254134318&#x2D;07&#x2D;B001&#x2D;00000450.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="NCfarmindus" userelativepaths="yes" externalpreview="yes" url="20100020361&#x2D;01&#x2D;FH01_items.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\..\esuiteEW\XML\20553255881&#x2D;01&#x2D;F118&#x2D;00000015.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20100257298&#x2D;01&#x2D;FFQA&#x2D;90112727.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose" x="207" y="62"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/=[0]" x="161" y="56"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/xsl:when/xsl:call&#x2D;template" x="277" y="92"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/=[1]" x="161" y="84"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/xsl:when[1]/xsl:call&#x2D;template" x="157" y="92"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/xsl:otherwise/xsl:if" x="47" y="62"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/xsl:otherwise/xsl:if/xsl:call&#x2D;template" x="117" y="92"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/xsl:otherwise/xsl:if[1]" x="367" y="22"/><block path="html/body/table/tbody/tr[2]/td/xsl:choose/xsl:otherwise/xsl:if[1]/xsl:call&#x2D;template" x="317" y="52"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[4]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="197" y="26"/><block path="html/body/table/tbody/tr[4]/td/table/tbody/xsl:if/or[0]" x="351" y="24"/><block path="html/body/table/tbody/tr[4]/td/table/tbody/xsl:if" x="397" y="26"/><block path="html/body/table/tbody/tr[4]/td/table/tbody/xsl:if/tr/td/xsl:call&#x2D;template" x="157" y="26"/><block path="html/body/table/tbody/tr[6]/td/xsl:call&#x2D;template" x="357" y="26"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->