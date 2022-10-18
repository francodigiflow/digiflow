<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="numColBl">

		<xsl:if test="/pe:Invoice!=''">
			<xsl:value-of select="20-count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote!=''">
			<xsl:value-of select="20-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote!=''">
			<xsl:value-of select="20-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>

	<xsl:include href="xIT_encab.xslt"/>
	<xsl:include href="xIT_detalle.xslt"/>
	<xsl:include href="xIT_bottom.xslt"/>
	<xsl:include href="xIT_datos.xslt"/>
	<xsl:include href="xIT_total.xslt"/>
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
						<!--<tr>
						<td width="100%" align="left">
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tbody>
									<tr>
										<td align="left"><img  width="249px" height="127px" src="Logo_SIMSA.jpg"/>
											<img src="Logo_NF.png" width="176" height="93"/>Asignar icono empresa 
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>-->
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
							<xsl:call-template name="OtrosDatos"/>
						</tr>
						<tr>
							<td>
								<xsl:call-template name="DetallesEncabezado"/>
							</td>
						</tr>
						<tr>
							<td>
								<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
									<tbody>
										<tr>
											<td vAlign="top" width="70%" align="left">
												<xsl:call-template name="Referencia"/>
											</td>
											<td vAlign="top" width="30%">
												<xsl:call-template name="Total"/>
											</td>
										</tr>

										<tr>
											<td colSpan="2" vAlign="top">
												<xsl:call-template name="bottom_Simsa"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>&#xA0;</td>
						</tr>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>


	<xsl:template match="text()" name="split">
		<xsl:param name="pText" select="."/>
		<xsl:if test="string-length($pText)">
			<xsl:if test="not($pText=.)">
				<!--<br/>-->
			</xsl:if>
			<xsl:value-of select="substring-before(concat($pText,'|'),'|')"/>
			<br/>
			<xsl:call-template name="split">
				<xsl:with-param name="pText" select="substring-after($pText, '|')"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="factura 20" userelativepaths="yes" externalpreview="yes" url="..\XML\20109969452&#x2D;01&#x2D;F008&#x2D;00003211.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="debito 20" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\XML DEBITO &#x2D; UNC.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="credito 20" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\XML NOTA C&#x2D;D &#x2D; UNC.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="exportacion 20" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\XML EXPORTACION &#x2D; UNC.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="anticipo 20" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\XML ANTICIPO &#x2D; UNC.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="factura gratuita 20" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\XML FACTURA GRATUITA &#x2D; UNC.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="detraccion 20" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\XML DETRACCION &#x2D; UNC.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="boleta gratuita 20" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\XML BOLETA GRATUITA &#x2D; UNC.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="boleta 20" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\XML BOLETA &#x2D; UNC.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="anticipo total 20" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\XML ANTICIPO &#x2D;UNC TOTAL.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="factura 21" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 2120600948131_2018072001FFF110000057.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="debito 21" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20600948131_2018072008FDE100000010.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="credito 21" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20600948131_2018072307FCR100000004.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="exportacion 21" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20100182263&#x2D;01&#x2D;FEL3&#x2D;00000677 EXPORTACION.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="anticipo 21 rf" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20100020361&#x2D;01&#x2D;AC1F F201&#x2D;00000010.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="anticipo 21 1r" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20100020361&#x2D;01&#x2D;AC1R F201&#x2D;00000008.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="anticipo 21 2r" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20100020361&#x2D;01&#x2D;AC2R F201&#x2D;00000009.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="anticipo 21 1" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20100020361&#x2D;01&#x2D;ANT1 F201&#x2D;00000006.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="anticipo 21 2" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20100020361&#x2D;01&#x2D;ANT2 F101&#x2D;00000018.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="boleta 21" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20600948131_2018072003BO0100000006.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="factura gratuita 21" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\20125899723_2018111601F00200000008 GRAT GRAB UBL21.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="anticipo 1 21" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20100020361&#x2D;01&#x2D;ANT1 F201&#x2D;00000006.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="anticipo 2 21" userelativepaths="yes" externalpreview="yes" url="..\..\XML TEST\UBL 21 20100020361&#x2D;01&#x2D;ANT2 F101&#x2D;00000018.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="detraccion 21" userelativepaths="yes" externalpreview="yes" url="..\xml\20109969452&#x2D;01&#x2D;F008&#x2D;00003211.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="321" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="201" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="161" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="281" y="69"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->