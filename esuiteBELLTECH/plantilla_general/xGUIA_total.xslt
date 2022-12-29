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


	<xsl:template name="Cuadro_Exportacion">

	<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
						<td width="50%">
						<table rules="groups" border="1" width="99%" cellpadding="0" cellspacing="0" bordercolor="#000001">
							<tbody>
								<tr>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Contenedor</strong>
										</font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='11'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>

									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Prescinto Mebal</strong>
										</font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='16'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Booking</strong>
										</font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='12'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>

									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Prescinto New</strong>
										</font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='17'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Prescinto Aduana</strong>
										</font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='13'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>

									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Total bultos</strong>
										</font>
									</td>
									<td width="25%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">:
									<xsl:value-of select="//cac:Shipment/cbc:TotalTransportHandlingUnitQuantity"/>	
										</font>
									</td>
								</tr>
								<tr>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Termiregistro N°</strong>
										</font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='14'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>

									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Peso Neto</strong>
										</font>
									</td>
									<td width="25%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">:
									
									</font>
									</td>
								</tr>
								<tr>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Prescinto Linea</strong>
										</font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='15'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
									<td width="25%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2"></font>
									</td>
									<td width="25%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2"></font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>

					<td width="2%">
					</td>

					<td width="50%">
						<table rules="groups" border="1" width="99%" cellpadding="0" cellspacing="0" bordercolor="#000001">
							<tbody>
								<tr bgcolor="#DCDCDC">
									<td width="100%" align="center" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>DATOS ALMACÉN PORTUARIO</strong>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Razón Social</strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='18'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>RUC</strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='19'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>Dirección</strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='20'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					</tr></tbody></table>
					</xsl:template>

	<!-- <xsl:template name="Simbolo_Moneda"> -->
		<!-- <xsl:choose> -->
			<!-- <xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/.</xsl:when> -->
			<!-- <xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when> -->
			<!-- <xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when> -->
			<!-- <xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/.</xsl:when> -->
			<!-- <xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when> -->
			<!-- <xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when> -->
			<!-- <xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/.</xsl:when> -->
			<!-- <xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when> -->
			<!-- <xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when> -->
			<!-- <xsl:otherwise>OTRA MONEDA</xsl:otherwise> -->
		<!-- </xsl:choose> -->
	<!-- </xsl:template> -->

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\Panasonic\Formato_PanasonicV1.1\20100165849&#x2D;01&#x2D;F301&#x2D;00000280.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"><block path="table/td/font/xsl:for&#x2D;each" x="410" y="60"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if/=[0]" x="314" y="88"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if" x="360" y="90"/><block path="table/td/font/xsl:for&#x2D;each[1]" x="300" y="30"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="204" y="58"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if" x="250" y="60"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/xsl:value&#x2D;of" x="320" y="90"/><block path="table/td/font/xsl:for&#x2D;each[2]" x="340" y="30"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="84" y="58"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if" x="130" y="60"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/xsl:value&#x2D;of" x="200" y="90"/></template><template name="Total"></template><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->