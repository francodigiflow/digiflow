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
			<xsl:value-of select="17-count(/pe:DespatchAdvice/cac:DespatchLine)"/>
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
				<table cellSpacing="1" width="98%" border="0">
					<tbody>
						<tr>
							<td>
								<!--&#160;-->
							</td>
						</tr>
						<tr>
							<td>
								<xsl:call-template name="Encabezado"/>
							</td>
						</tr>
						<tr>
							<td>
								<table cellSpacing="0" width="100%" align="right" border="0" heigth="100%">
									<tbody>
										<tr>
											<td vAlign="top" width="58%" height="100%" align="right" style="border:solid 1px black;" >
												<xsl:call-template name="DESTINARIO"/>
											</td>
											<td vAlign="top" width="1%" align="right">
												<br/>
											</td>
											<td vAlign="top" width="41%" align="right">
												<xsl:call-template name="CHOFER"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<!--&#160;-->
							</td>
						</tr>
						
						<tr>
							<td>
								<xsl:call-template name="PUNTOS"/>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">
									<xsl:call-template name="TRANSPORTISTA"/>
								</xsl:if>
								
							</td>
						</tr>
						<xsl:variable name="flag1" >
							<xsl:call-template name="TraeValorVariable">
								<xsl:with-param name="varNumVA" select="26"/>
							</xsl:call-template>
						</xsl:variable>

						<xsl:if test="//cbc:CustomizationID='1.0'">
							<xsl:choose>
								<xsl:when test="$flag1 = '1'">
									<tr>
										<td>
											<xsl:call-template name="DetallesEncabezado_2"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td>
								
											<xsl:call-template name="DetallesEncabezado"/>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>

						<xsl:if test="//cbc:CustomizationID='2.0'">
						
							<xsl:if test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID!='20330791501'">
								<xsl:choose>
									<xsl:when test="$flag1 = '1'">
										<tr>
											<td>
										<xsl:call-template name="DetallesEncabezado_2"/>
										</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td>
								
												<xsl:call-template name="DetallesEncabezado"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>	
							</xsl:if>
							<xsl:if test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID='20330791501'">
									<tr>
										<td>
											<xsl:call-template name="DetallesEncabezadoQP"/>
										</td>
									</tr>									
							</xsl:if>
						</xsl:if>
						
						


						<tr>
							<td>
								<table cellSpacing="0" cellPadding="0" width="100%" align="right" border="0" heigth="100%">
									<tbody>
										<tr>
											<td vAlign="top" width="34%" align="right">
												<xsl:call-template name="TOTALES"/>
											</td>
											<td vAlign="top" width="21%" align="right">
												<br/>
											</td>
											<td vAlign="top" width="45%" align="right">
												<xsl:call-template name="COMFORMIDAD"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>

						<!--<tr>
							<td>
								<xsl:call-template name="TOTALES"/>
							</td>
						</tr>-->

						<tr>
							<td>
								<table cellSpacing="0" cellPadding="0" width="100%" align="right" border="0" heigth="100%">
									<tbody>
										<tr>
											<td vAlign="top" width="50%" align="right">
												<xsl:call-template name="MOTIVOS"/>
											</td>
											<td vAlign="top" width="20%" align="right">
												<br/>
											</td>
											<td vAlign="top" width="25%" align="right">
												<xsl:call-template name="REFERENCIAS"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								&#160;
							</td>
						</tr>
						<tr width="100%">
							<td>
								<xsl:call-template name="OBSERVACIONES"/>
							</td>
						</tr>
						<tr>
							<td>
								&#160;
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
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\xml\20330791501&#x2D;09&#x2D;TG04&#x2D;00000012.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="321" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="201" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="161" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="281" y="69"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->