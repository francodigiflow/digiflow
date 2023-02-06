<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" 
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"  
	xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
	xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >
<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
<xsl:decimal-format name="pen" decimal-separator="," grouping-separator="." NaN=""/>
<!--<xsl:template match="/">-->
	<xsl:variable name="numColBl">
		<xsl:value-of select="20-count(//cac:InvoiceLine)"/>
	</xsl:variable>

	<xsl:include href="NC_encab.xsl"/>
	<xsl:include href="NC_detalle.xsl"/>
	<xsl:include href="NC_bottom.xsl"/>
	<xsl:include href="NC_datos.xsl"/>
	<xsl:include href="NC_total.xsl"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Documento Tributario Electronico</title>
			</head>

			<body>
				<table border="1" width="100%" cellspacing="1">
					<tr>
						<td>
							<xsl:call-template name="Encabezado"/>
						</td>
					</tr>
					<tr>
						<td>
						<xsl:call-template name="DatosReceptor"/>
						<xsl:if test="//cbc:InvoiceTypeCode='01' or //cbc:InvoiceTypeCode='03' or //cbc:InvoiceTypeCode='07'  or //cbc:InvoiceTypeCode='08'">
							<xsl:call-template name="DatosReceptor"/>
						</xsl:if>
						<!--<xsl:if test="DTE/Exportaciones/Encabezado/IdDoc/TipoDTE='110' or DTE/Exportaciones/Encabezado/IdDoc/TipoDTE='111' or DTE/Exportaciones/Encabezado/IdDoc/TipoDTE='112'">
							<xsl:call-template name="DatosReceptorEx"/>
						</xsl:if>-->
						</td>
					</tr>
					<tr>
						<td>
							<table align="center" border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td align="left" width="100%" valign="top">
									<xsl:call-template name="DetallesEncabezado"/>
									<!--<xsl:if test="//cbc:InvoiceTypeCode='01'or //cbc:InvoiceTypeCode='03' or //cbc:InvoiceTypeCode='07' or //cbc:InvoiceTypeCode='08'">
										<xsl:call-template name="DetallesEncabezado"/>
									</xsl:if>
									<xsl:if test="//cbc:InvoiceTypeCode='01' or //cbc:InvoiceTypeCode='03'or //cbc:InvoiceTypeCode='07' or //cbc:InvoiceTypeCode='08'">
										<xsl:call-template name="DetallesEncabezadoEx"/>
									</xsl:if>-->
									</td>
								</tr>
							</table>
						</td>
					</tr>

					<tr>
						<td>
							<table align="center" border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td align="left" width="35%" valign="top">
										<xsl:call-template name="Cancelado"/>
									</td>

									<td align="left" width="30%" valign="top">
										<xsl:call-template name="CuadroPago"/>
										<xsl:if test="//cbc:CustomerAssignedAccountID = '20100128056'">
											<xsl:call-template name="CuadroPago"/>
										</xsl:if>
									</td>
									<td width="35%" valign="top">
										<xsl:call-template name="total"/>
										<xsl:choose>
											<xsl:when test="DTE/Documento/Encabezado/IdDoc/TipoDTE='34' or DTE/Exportaciones/Encabezado/IdDoc/TipoDTE='110' or DTE/Exportaciones/Encabezado/IdDoc/TipoDTE='111' or DTE/Exportaciones/Encabezado/IdDoc/TipoDTE='112'">
												<xsl:call-template name="exento"/>
											</xsl:when>
											<xsl:when test="//cbc:InvoiceTypeCode='01'">
												<xsl:call-template name="total"/>
											</xsl:when>
											<xsl:when test="//cbc:InvoiceTypeCode='03'">
												<xsl:call-template name="total"/>
											</xsl:when>

											<!--xsl:otherwise>Documento no Identificado</xsl:otherwise-->
										</xsl:choose>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>						
						<td align="left" valign="top">
							<xsl:call-template name="Referencia"/>
							<!--<xsl:if test="//cbc:DocumentTypeCode='07' or //cbc:DocumentTypeCode='08' or //cbc:DocumentTypeCode='09'">
								<xsl:call-template name="Referencia"/>
							</xsl:if>-->
						</td>
					</tr>
					<tr>
						<br/>
					</tr>
					<tr>
						<td>
							<table align="center" border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="100%" align="center">
										<xsl:call-template name="bottom_normal"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\in\flat\1003&#x2D;07&#x2D;000100000001.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="E089530600T110F0000000018.xml" srcSchemaRoot="DTE" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tr/td/xsl:call&#x2D;template" x="243" y="63"/><block path="html/body/table/tr[1]/td/xsl:call&#x2D;template" x="283" y="63"/><block path="html/body/table/tr[3]/td/table/tr/td/xsl:call&#x2D;template" x="203" y="63"/><block path="html/body/table/tr[4]/td/table/tr/td/xsl:call&#x2D;template" x="163" y="63"/><block path="html/body/table/tr[4]/td/table/tr/td/xsl:call&#x2D;template[1]" x="123" y="63"/><block path="html/body/table/tr[4]/td/table/tr/td[1]/xsl:choose" x="13" y="33"/><block path="html/body/table/tr[4]/td/table/tr/td[1]/xsl:choose/!=[0]" x="0" y="27"/><block path="html/body/table/tr[4]/td/table/tr/td[1]/xsl:choose/xsl:when/xsl:call&#x2D;template" x="83" y="63"/><block path="html/body/table/tr[4]/td/table/tr/td[1]/xsl:choose/=[1]" x="0" y="55"/><block path="html/body/table/tr[4]/td/table/tr/td[1]/xsl:choose/xsl:when[1]/xsl:call&#x2D;template" x="243" y="23"/><block path="" x="283" y="23"/><block path="html/body/table/tr[5]/td/table/tr/td/xsl:call&#x2D;template" x="203" y="23"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->