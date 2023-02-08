<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1"
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
				xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
				xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
				exclude-result-prefixes="cac cbc ccts ds ext pe  qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<!-- xsl:template name="Total">

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
						<tr>
							<td style="border-style: solid; border-width: 1px;" width="35%" colspan="3" align="left" >
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Régimen RetenciÃ³n:</strong>&#160;&#160;&#160;&#160;&#160;&#160;
									<xsl:if test="//sac:SUNATRetentionSystemCode='01'">
										TASA 3%
									</xsl:if>
								</font>
							</td>		
							<td style="border-style: solid; border-width: 1px;" width="35%" colspan="3" align="left" >
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Tasa RetenciÃ³n:</strong>&#160;&#160;&#160;&#160;&#160;&#160;
									<xsl:value-of select="//sac:SUNATRetentionPercent"/><strong>%</strong>
								</font>
							</td>
							<td width="10%" align="center" >
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Total en (<xsl:call-template name="TipoDeMoneda_Total" />)</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number(//cbc:TotalInvoiceAmount,'###,###,##0.00','pen')"/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number(//sac:SUNATTotalPaid,'###,###,##0.00','pen')"/>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
	</xsl:template -->

	
	<!-- xsl:template name="Referencia">
		
		<tbody>
			<tr>
				<td>
					<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
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
		
	</xsl:template -->




	
	
<xsl:template name="CuadroPiePagina">
<!-- <table border="1" width="100%" cellpadding="0" cellspacing="2"> -->
<table rules="all" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
				<tr>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Número de precinto</strong></font>
					</td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="5" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Ruc de almacén de Ingreso</strong></font>
					</td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="9" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Número de precinto AD</strong></font>
					</td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="6" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Número de contenedor</strong></font>
					</td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="7" /></xsl:call-template>
					</font> </td>
				</tr>
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Almacén de ingreso</strong></font>
					</td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="8" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>TRAMO 3</strong></font>
					</td>
					<td align="left" colspan="2"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="10" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>TRAMO 4</strong></font>
					</td>
					<td align="left" colspan="2"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="11" /></xsl:call-template>
					</font> </td>
				</tr>
			</table>

			
</xsl:template>


	<xsl:template name="CuadrosORIGINAL">
		<br/>
		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td width="35%">
						<table border="0" width="100%" cellpadding="0" cellspacing="0" >
							<tbody>
								<tr>
									 <td width="100%" align="left">
									 <!--  <table border="1" width="50%" cellpadding="0" cellspacing="0" bordercolor="#000000">
							            <tbody>
									      <tr>
									       <td align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<b>MOTIVO DE TRASLADO</b>
										</font>
									      </td>
								        </tr>
								<tr>
									<td width="100%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										     
										</font>
									</td>
									
								</tr>
								</tbody>
								</table>-->
                         <table border="1" width="70%" cellpadding="0" cellspacing="0" bordercolor="#000000">
							<!--<tbody>-->
								<tr>
									<td width="100%" align="center" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<b>UNIDAD DE TRANSPORTE Y CONDUCTOR</b>
										</font>
									</td>
								</tr>
								<tr>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										TRANSPORTISTA: 
										</font>
									</td>
									<td width="60%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										DNI/RUC: 
										</font>
									</td>
									<td width="60%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										PLACA DEL VEHICULO: 
										</font>
									</td>
									<td width="60%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>
										</font>
									</td>
								</tr>
							<!--</tbody>-->
						</table>

								</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="35%">
					</td>
					<!--<td width="25%">
						<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
							<tbody>
								<tr>
									<td width="100%" align="center" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
										BAJA DE GUIA
										</font>
									</td>
								</tr>
								<tr>
									<td width="70%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										NÃšMERO GUÃA REMISIÃ“N: 
										</font>
									</td>
									<td width="30%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="//cac:OrderReference/cbc:ID"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="70%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										TIPO DOCUMENTO : 
										</font>
									</td>
									<td width="30%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="//cac:OrderReference/cbc:OrderTypeCode"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>-->
					
					<td width="25%">
						<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000">
							<tbody>
								<tr>
									<td width="100%" align="center" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<b>EMPRESA DE TRANSPORTES</b>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										RAZON SOCIAL: 
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										RUC: 
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
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
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">e</xsl:when>
			
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\Panasonic\Formato_PanasonicV1.1\20100165849-01-F301-00000280.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator="">
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bGenerateByteCode" value="true"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="sInitialMode" value=""/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="20254053822-01-FF11-10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template name="son-pesos">
				<block path="table/td/font/xsl:for-each" x="410" y="60"/>
				<block path="table/td/font/xsl:for-each/xsl:if/=[0]" x="314" y="88"/>
				<block path="table/td/font/xsl:for-each/xsl:if" x="360" y="90"/>
				<block path="table/td/font/xsl:for-each[1]" x="300" y="30"/>
				<block path="table/td/font/xsl:for-each[1]/xsl:if/=[0]" x="204" y="58"/>
				<block path="table/td/font/xsl:for-each[1]/xsl:if" x="250" y="60"/>
				<block path="table/td/font/xsl:for-each[1]/xsl:if/xsl:value-of" x="320" y="90"/>
				<block path="table/td/font/xsl:for-each[2]" x="340" y="30"/>
				<block path="table/td/font/xsl:for-each[2]/xsl:if/=[0]" x="84" y="58"/>
				<block path="table/td/font/xsl:for-each[2]/xsl:if" x="130" y="60"/>
				<block path="table/td/font/xsl:for-each[2]/xsl:if/xsl:value-of" x="200" y="90"/>
			</template>
			<template name="Total"></template>
			<template match="/"></template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->