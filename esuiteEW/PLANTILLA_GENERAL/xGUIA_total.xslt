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

	<xsl:template name="CuadroExp">
		
		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Contenedor</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cbc:ID"/>
										</font>
									</td>

									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Prescinto Mebal</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='24'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
                                    <td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Booking</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='20'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										</font>
									</td>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Prescinto New</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='25'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Prescinto Aduana</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='21'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each></font>
									</td>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Total bultos</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
 										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='26'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										</font>
									</td>
								</tr>

								<tr>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Termiregistro N°</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='22'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										</font>
									</td>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Peso Neto</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='27'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Prescinto Linea</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='23'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
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
	
	<xsl:template name="CuadroPort">
	<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
	<tbody>
	<tr bgcolor="#DCDCDC">
	<td width="15%" align="center">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>Datos Almacen Portuario</strong></font>
		</td></tr></tbody></table>

		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="18%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Razon Social</strong></font>
									</td>
									<td width="60%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='28'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
                                    <td width="18%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>R.U.C.</strong></font>
									</td>
									<td width="60%" align="left">
										
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='29'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
										
									</td>
								</tr>
								<tr>
									<td width="18%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Dirección</strong></font>
									</td>
									<td width="60%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='30'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
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

	
	<xsl:template name="CuadroConformidad">
	
	<xsl:variable name="Adicional_PCERT">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="33"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="Adicional_MCERT">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="34"/>
		</xsl:call-template>
	</xsl:variable>

	
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<xsl:if test="//cac:ShipmentStage/cbc:TransportModeCode='08'">
				<tr>
					<td>
								<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
									<tr>
										<td vAlign="top" width="60%" align="left">
											<table border="0" width="100%" cellpadding="0" cellspacing="0">
												<tr>
													<td>
														<xsl:call-template name="CuadroExp"/>
													</td>
												</tr>
											</table>
										</td>
										<td vAlign="top" width="5%" align="left">
											
										</td>
										<td vAlign="top" width="35%" align="left">
											<xsl:call-template name="CuadroPort"/>
										</td>
									</tr>
									
								</table>
					</td>
				</tr>
				</xsl:if>
				<xsl:if test="//cac:ShipmentStage/cbc:TransportModeCode='09'">
				<tr>
					<td>
								<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
									<tr>
										<td vAlign="top" width="60%" align="left">
											<table border="0" width="100%" cellpadding="0" cellspacing="0">
												<tr>
													<td>
														<xsl:call-template name="CuadroExp"/>
													</td>
												</tr>
											</table>
										</td>
										<td vAlign="top" width="5%" align="left">
											
										</td>
										<td vAlign="top" width="35%" align="left">
											<xsl:call-template name="CuadroPort"/>
										</td>
									</tr>
									
								</table>
					</td>
				</tr>
				</xsl:if>
				<tr>
					<td width="100%">
						<br/>
						<table rules="groups" border="1" width="70%" align="center" cellpadding="10" cellspacing="10" bordercolor="#000001">
							<tbody>
								<xsl:if test="$Adicional_PCERT!=''">
									<tr>
									<td width="100%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='33'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</font>
									</td>
									</tr>
								</xsl:if>
								<xsl:if test="$Adicional_MCERT!=''">
									<tr>
									<td width="100%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='34'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</font>
									</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</td>
				</tr>	
				<tr>
					<td width="100%" align="center">
					<br/>
					</td>
				</tr>	
				<tr>
					<td width="100%" align="center">
					</td>
				</tr>	
				<tr>
					<td width="100%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							Representación impresa Guía de Remisión electrónica: http://comprobantescew.com
							
						</font>
					</td>
				</tr>	
			</tbody>
		</table>
	</xsl:template>


	<xsl:template name="EnlaceWEB2">
		<xsl:if test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID='20514020907' or 
				  //cac:SignatoryParty/cac:PartyIdentification/cbc:ID='20507884823' or 
				  //cac:SignatoryParty/cac:PartyIdentification/cbc:ID='20553255881' or 
				  //cac:SignatoryParty/cac:PartyIdentification/cbc:ID='20601510287' or 
				  //cac:SignatoryParty/cac:PartyIdentification/cbc:ID='20416026948'">
			<br/>
			Desde el 31/01/2023 debe de ingresar al enlace http://comprobantescew2.com
		</xsl:if>
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