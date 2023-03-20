<?xml version="1.0" encoding="iso-8859-1"?>
<!-- xsl:stylesheet version="1.0" 
				xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
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
				exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi" -->
<!-- xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
				xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
				xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="70%">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td vAlign="top" width="100%">
									<xsl:call-template name="Logo"/>
								</td>
							</tr>
							<tr>
								<td vAlign="top" width="100%">
									<xsl:call-template name="EncabezadoPeru"/>
								</td>
							</tr>
						</table>
					</td>

					<td vAlign="top" width="30%">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="Logo">
		<table cellSpacing="2" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td width="100%" align="center">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td align="center" width="100%" rowspan="3">
											<img src="data:image/*;base64,[logo_1]"/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>


	<xsl:template name="EncabezadoPeru">
		<p>
			<!-- table cellSpacing="2" cellPadding="0" width="100%" border="0" -->
			<table cellSpacing="2" cellPadding="0" width="100%" border="0">
				<tbody>
					<tr>

						<!-- RZ y DIR EMISOR -->
						<td align="center">
							<table cellSpacing="0" cellPadding="0" width="85%" border="0">
								<tr>
									<td align="center">
										<font size="3" face="Arial, Helvetica, sans-serif">
											<strong>
												<xsl:value-of select="//cac:DespatchSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											</strong>
										</font>
										<br/>
										
									</td>
								</tr>
								<tr>
									<td>
										<table cellSpacing="0" cellPadding="0" width="100%" border="0">
											<tbody>
												<tr>

													<td align="center" width="100%" valign="top">
														<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
															Dom. Fiscal: Calle Juan Alfaro N° 227 Urb San Antonio - Miraflores - Lima - Lima
														</font>
														<br/>
													</td>
												</tr>
												<tr>

													<td align="center" width="100%" valign="top">
														<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
															<xsl:call-template name="TraeValorVariable">
																<xsl:with-param name="varNumVA" select="01"/>
															</xsl:call-template>
														</font>
														<br/>
													</td>
												</tr>
												<tr>

													<td align="center" width="100%" valign="top">
														<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
															<xsl:call-template name="TraeValorVariable">
																<xsl:with-param name="varNumVA" select="02"/>
															</xsl:call-template>
														</font>
														<br/>
													</td>
												</tr>
												<tr>

													<td align="center" width="100%" valign="top">
														<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
															<xsl:call-template name="TraeValorVariable">
																<xsl:with-param name="varNumVA" select="03"/>
															</xsl:call-template>
														</font>
														<br/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</p>
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tbody>
				<tr>
					<td>
						<table borderColor="#000000" cellSpacing="0" cellPadding="10" width="100%" border="1">
							<tbody>
								<tr>
									<td vAlign="top" width="100%" align="center">
										<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">

											<strong>R.U.C.:
												<xsl:value-of select="format-number(//cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID,'###########','pen')"/>
												<br/>
												<br/>
												<xsl:call-template name="tmpTipoComprobane"/>
												<br/>
												<xsl:call-template name="NFolio"/>
												<br/>
											</strong>
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

	<!-- TIPO DE DOCUMENTO -->
	<xsl:template name="tmpTipoComprobane">
		<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">GUÍA DE REMISIÓN ELECTRÓNICA</font>
	</xsl:template>

	<!-- NRO DEL DOCUMENTO -->
	<xsl:template name="NFolio">
		<br/>N°
		<xsl:value-of select="substring-before(//cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(//cbc:ID,'-'),'00000000')"/>
	</xsl:template>

	<!-- VALOR SEGUN NRO DE VARAIBLE -->
	<!-- xsl:template name="TraeValorVariable">
	  	<xsl:param name="varNumVA" />
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA"><xsl:if test="pe:Valor!='-'"><xsl:value-of select="pe:Valor"/></xsl:if></xsl:if>
		</xsl:for-each>
	</xsl:template -->

	<!-- xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template -->
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="">
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