<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">	
		<!--Tabla general del encabezado-->
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="middle" width="68%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="middle" width="32%">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru">
		
			<table cellSpacing="2" cellPadding="0" width="100%" border="0">
				<tbody>
					<tr>
						<td width="100%" align="left">
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">

									<tr>
										<td align="left">
											<!-- <img src="logo_antamina.jpg" width="169" height="151"/> -->
											<img src="data:image/*;base64,[logo_1]" width="407" height="122"/>
										</td>
										<!--<td valign="middle" width="60%" align="center">
											<table cellSpacing="0" cellPadding="0" width="100%" border="0">
												<tbody>
													<tr>
														<td valign="middle" align="center">
															<font color="#000000" size="3" face="Helvetica">
																<strong>
																	<xsl:value-of select="//cac:AgentParty/cac:PartyLegalEntity/cbc:RegistrationName"/>
																</strong>
															</font>
														</td>
													</tr>
													<tr>
														<td valign="middle" align="center">
															<font color="#000000" size="2" face="Helvetica">
																<xsl:value-of select="//cac:AgentParty/cac:PostalAddress/cbc:StreetName"/>
															</font>
														</td>
													</tr>
													<tr>
														<td valign="middle" align="center">
															<font color="#000000" size="2" face="Helvetica">
																<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																	<xsl:if test="pe:Codigo='01'">
																		<xsl:value-of select="pe:Valor"/>
																	</xsl:if>
																</xsl:for-each>
															</font>
														</td>
													</tr>
													<tr>
														<td valign="middle" align="center">
															<font color="#000000" size="2" face="Helvetica">
																<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																	<xsl:if test="pe:Codigo='02'">
																		<xsl:value-of select="pe:Valor"/>
																	</xsl:if>
																</xsl:for-each>
															</font>
														</td>
													</tr>
													<tr>
														<td valign="middle" align="center">
															<font color="#000000" size="2" face="Helvetica">
																<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																	<xsl:if test="pe:Codigo='03'">
																		<xsl:value-of select="pe:Valor"/>
																	</xsl:if>
																</xsl:for-each>
															</font>
														</td>
													</tr>
												</tbody>
											</table>
										</td>-->
									</tr>
								
							</table>
						</td>
					</tr>
					
				</tbody>
			</table>
		
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
		<table borderColor="#000000" cellSpacing="0" cellPadding="16" width="100%" align="center" border="1" style="font-size: 18px; font-family: arial,helvetica,sans-serif; color: #000000;">
			<!--	<table borderColor="#000000" cellSpacing="0" cellPadding="5" width="100%" border="1"> -->
			<tbody>
				<tr>
					<td vAlign="top" width="100%" align="center">
						<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
							<strong>R.U.C.:
								<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
									<xsl:value-of select="format-number(//cac:AgentParty/cac:PartyIdentification/cbc:ID,'###########','pen')"/>
									<br/>
									<br/>
									<xsl:call-template name="tipodocu"/>
									<br/>
									<xsl:call-template name="NFolio"/>
								</font>
							</strong>
							<br/>
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="tipodocu">
		<!--<xsl:choose>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
			<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">FACTURA ELECTRONICA</font>
		</xsl:when>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRONICA</font></xsl:when>
		<xsl:otherwise>
			
		</xsl:otherwise>
	</xsl:choose>-->
		<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">COMPROBANTE DE RETENCIÓN ELECTRÓNICO</font>
	</xsl:template>

	<xsl:template name="NFolio">
		<br/>Nº

		<!--<xsl:value-of select="pe:Retention/cbc:ID"/>-->

		<xsl:if test="/pe:Retention">
			<xsl:value-of select="substring-before(/pe:Retention/cbc:ID,'-')"/>-
			<xsl:value-of select="format-number(substring-after(/pe:Retention/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
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
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20388853752-20-R012-0059940.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->