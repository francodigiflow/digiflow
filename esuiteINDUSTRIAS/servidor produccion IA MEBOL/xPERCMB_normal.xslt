<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Perception-1" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="numColBl">
		<xsl:if test="/pe:Perception!=''">
			<xsl:value-of select="30-count(/pe:Perception/sac:SUNATPerceptionDocumentReference)"/>
		</xsl:if>
		
	</xsl:variable>
	<xsl:include href="xPERCMB_encab.xslt"/>
	<xsl:include href="xPERCMB_detalle.xslt"/>
	<xsl:include href="xPERCMB_bottom.xslt"/>
	<xsl:include href="xPERCMB_datos.xslt"/>
	<xsl:include href="xPERCMB_total.xslt"/>
	<xsl:template match="/">
	<html xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2" xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2"><head>
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
										<td>
											<table borderColor="#000000" cellSpacing="0" cellPadding="0" width="100%" border="0">
												<tbody>
													<tr>
														<td width="30%" align="left">
															<xsl:call-template name="Total"/>
														</td>
													</tr>
													
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr width="100%">
						<td>
							<xsl:call-template name="Monto_Letras"/>
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20102154046_2016012940PFF100000243.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="321" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="201" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="161" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="281" y="69"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->