<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:DespatchAdvice-1"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
				xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
				xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
				xmlns:ccts="urn:un:unece:uncefact:documentation:2"
                exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi sac">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="numColBl">
		<!--		<xsl:if test="/pe:DespatchAdvice!=''">-->
		<xsl:value-of select="13-count(/pe:DespatchAdvice/cac:DespatchLine)"/>
		<!--		</xsl:if>-->
	</xsl:variable>
	<xsl:include href="xGUIA_encab.xslt"/>
	<xsl:include href="xGUIA_detalle.xslt"/>
	<xsl:include href="xGUIA_bottom.xslt"/>
	<xsl:include href="xGUIA_datos.xslt"/>
	<xsl:include href="xGUIA_total.xslt"/>
	<xsl:template match="/">
		<html xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		      xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
		      xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
		      xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2"
		      xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2" xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2">
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
								<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
									<!--EXPORTACION -->
									<xsl:call-template name="DetallesEncabezado_Exportacion"/>
								</xsl:if>
								<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">
									<!--NACIONAL -->
									<xsl:call-template name="DetallesEncabezado_Nacional"/>
								</xsl:if>

							</td>
						</tr>
						<tr>
							<td>
								<table cellSpacing="0" cellPadding="0" width="100%" align="right" border="0" heigth="100%">
									<tbody>
										<tr>
											<td vAlign="top" width="100%" align="right">
												<xsl:call-template name="Referencia"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr width="100%">
							<td>
							<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
									<!--EXPORTACION -->
									<xsl:call-template name="Cuadros_exportacion"/>
								</xsl:if>
								
									<!--NACIONAL -->
									<xsl:call-template name="Cuadros"/>
								
								
							</td>
						</tr>
						
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="ModalidadTraslado">
		<xsl:choose>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='01'">Venta</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='14'">Venta sujeta a confirmación del comprador</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='02'">Compra</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='04'">Traslado entre establecimientos de la misma empresa</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='18'">Trasladoemisor itinerante CP</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='08'">Importación</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='09'">Exportación</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='19'">Traslado a zona primaria</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='13'">Otros</xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="20293583626_2018070509T00100007740.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="321" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="201" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="161" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="281" y="69"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->