<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

<!-- MODALIDAD DE TRASLADO -->
	<xsl:template name="tmpModalidadTraslado">
		<xsl:choose>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='01'">PÚBLICO</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='02'">PRIVADO</xsl:when>
		</xsl:choose>
	</xsl:template>
<xsl:template name="CuadroConformidad">

	<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
						<td width="80%">
						<table rules="groups" border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000">
							<tbody>
								<tr>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										<strong>Modalidad de traslado</strong>
										
										</font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										:&#160;<xsl:call-template name="tmpModalidadTraslado"/>
										</font>
									</td>
									
									<td width="23%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										<strong>Preparado por</strong>
										</font>
									</td>
									<td width="17%" colspan="2" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										<strong>:&#160;</strong>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='05' or pe:Codigo='5'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										
										</font>
									</td>
								</tr>
								<tr>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										<strong>Indicador de transbordo programado</strong>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										: -
										</font>
									</td>
									<td width="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										
										</font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										<strong></strong>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										<strong></strong>
										</font>
									</td>
								</tr>
								<tr>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										<strong>Indicador de traslado en vehículo de categoria M1</strong>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										:<xsl:value-of select="//cac:Shipment/cbc:SpecialInstructions"/>
										</font>
									</td>
									<td width="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										
										</font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										<strong></strong>
										</font>
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										<strong></strong>
										</font>
									</td>
								</tr>
								<tr>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										<strong>Observaciones</strong>
										
										</font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										:&#160;<xsl:value-of select="//cac:Shipment/cbc:Note"/>
										</font>
									</td>
									
									<td width="23%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										
										</font>
									</td>
									<td width="17%" colspan="2" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">								
										
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

	<xsl:template name="Simbolo_Moneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/.</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"><block path="table/td/font/xsl:for&#x2D;each" x="410" y="60"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if/=[0]" x="314" y="88"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if" x="360" y="90"/><block path="table/td/font/xsl:for&#x2D;each[1]" x="300" y="30"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="204" y="58"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if" x="250" y="60"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/xsl:value&#x2D;of" x="320" y="90"/><block path="table/td/font/xsl:for&#x2D;each[2]" x="340" y="30"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="84" y="58"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if" x="130" y="60"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/xsl:value&#x2D;of" x="200" y="90"/></template><template name="Total"></template><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->