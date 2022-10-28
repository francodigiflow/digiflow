<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN="0.00"/>

	<xsl:variable name="numColBl">
		<xsl:if test="/pe:Invoice != ''">
			<xsl:value-of select="8 - count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote != ''">
			<xsl:value-of select="8 - count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote != ''">
			<xsl:value-of select="8 - count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>
	<xsl:include href="xIBEROSTAR_encab.xslt"/>
	<xsl:include href="xIBEROSTAR_detalle.xslt"/>
	<xsl:include href="xIBEROSTAR_bottom.xslt"/>
	<xsl:include href="xIBEROSTAR_datos.xslt"/>
	<xsl:include href="xIBEROSTAR_total.xslt"/>

	<xsl:variable name="FLAG_R">
		<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="17"/></xsl:call-template>
	</xsl:variable>



	<xsl:template match="/">
		<html xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		      xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
		      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
		      xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
		      xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
		      xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2">
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
								<xsl:call-template name="DetallesEncabezado"/>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:call-template name="obs_exp"/>
							</td>
						</tr>
						<tr>
							<td>
								<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
									<tr>
										<td vAlign="top" width="57%" align="left">
											<!--<table border="1" width="100%" cellpadding="0" cellspacing="0">
												<tr>
													<td>-->
														<xsl:call-template name="inf-adic"/>
													<!--</td>
												</tr>
											</table>-->
										</td>
										<td vAlign="top" width="8%" align="left">
										</td>
										<td vAlign="top" width="35%" align="left">
											<xsl:call-template name="Total"/>
										</td>
									</tr>
								</table>		
							</td>
						</tr>
						<tr>
							<td>				
								<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">				
								<tr>
									<td vAlign="top" width="57%" align="left">
											<!--<table border="1" width="100%" cellpadding="0" cellspacing="0">			
												<tr>
													<td>-->
														<xsl:call-template name="son-pesos"/>
													<!--</td>
												</tr>-->
												<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
												<!--<tr>
													<td>-->
														<xsl:call-template name="DatosCredito"/>
													<!--</td>
												</tr>-->
												</xsl:if>
												<xsl:if test="//cbc:Note[@languageLocaleID='2006']">
												<!--<tr>
													<td>-->
														<xsl:call-template name="Detracc"/>
													<!--</td>
												</tr>-->
												</xsl:if>
												<!--<tr>
													<td>--><br/>
														<xsl:call-template name="inf-adic2"/>
													<!--</td>
												</tr>
											</table>-->
									</td>
									<td vAlign="top" width="8%" align="left">
									</td>
									<td vAlign="top" width="35%" align="left">
										<xsl:call-template name="bottom_hash"/>
									</td>
								</tr>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\XML\20601100941&#x2D;03&#x2D;B001&#x2D;00008401&#x2D;restaurante.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="..\xml\20262996329&#x2D;07&#x2D;FF11&#x2D;00000055.xml" srcSchemaRoot="CreditNote" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="166" y="60"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/table/tr/td/xsl:call&#x2D;template" x="66" y="65"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="106" y="65"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="186" y="65"/><block path="html/body/table/tbody/tr[5]/td/xsl:call&#x2D;template" x="126" y="60"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->