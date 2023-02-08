<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2"
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
				xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
				xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Total">

		<tr>
			<td>
				<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
					<tr>
						<td style="border-style: solid; border-width: 1px;" width="35%" colspan="3" align="left" >
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>Régimen Retención:</strong>&#160;&#160;&#160;&#160;&#160;&#160;
								<xsl:if test="//sac:SUNATRetentionSystemCode='01'">
										TASA 3%
								</xsl:if>
							</font>
						</td>		
						<td style="border-style: solid; border-width: 1px;" width="35%" colspan="3" align="left" >
							<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>Tasa Retención:</strong>&#160;&#160;&#160;&#160;&#160;&#160;
								<xsl:value-of select="//sac:SUNATRetentionPercent"/>
								<strong>%</strong>
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
	</xsl:template>


	<xsl:template name="Referencia">

		<tbody>
			<tr>
				<td>
					<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
						<tbody>
							<tr>
								<td  align="left">
									<table  border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
										<tbody>
											<tr>

												<td width="50%">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<b>Origen</b>
													</font>
												</td>
												<td width="50%">
													<font face="Arial, Helvetica, sans-serif" size="2">
														<b>Destino</b>
													</font>
												</td>
											</tr>
											<tr>
												<td width="50%">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:value-of select="//cac:Shipment/cac:OriginAddress/cbc:StreetName"/>
													</font>
												</td>
												<td width="50%">
													<font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/>
													</font>
												</td>

											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>


	</xsl:template>
	<xsl:template name="Cuadros_exportacion">
		<br/>
		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td width="20%">
				Motivo Traslado
					</td>
					<td width="80%">

						<xsl:value-of select="//pe:DespatchAdvice/cac:Shipment/cbc:Information"/>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<table border="0" width="100%" 	cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td width="60%">
						<table border="1" width="100%" cellpadding="0" cellspacing="0" >
							<tbody>
								<tr>
									<td width="20%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										Contenedor
										</font>
									</td>
									<td  width="30%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='03' and pe:Valor!='-'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each> 
										</font>
									</td>
									<td   width="30%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										Precinto Mebol
										</font>
									</td>
									<td  width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='08' and pe:Valor!='-'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each> 
										</font>
									</td>
								</tr>
								<tr>
									<td  width="20%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										Booking
										</font>
									</td>
									<td  width="30%"  align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='04' and pe:Valor!='-'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each> 
										</font>
									</td>
									<td   width="30%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										Prescinto New
										</font>
									</td>
									<td   width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">

											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='09' and pe:Valor!='-'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each> 
										</font>
									</td>
								</tr>
								<tr>
									<td  width="20%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										Precinto Aduana
										</font>
									</td>
									<td  width="30%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">

											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='05' and pe:Valor!='-'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each> 
										</font>
									</td>
									<td  width="30%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										Total bultos
										</font>
									</td>
									<td   width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">

											<xsl:value-of select="//pe:DespatchAdvice/cac:Shipment/cbc:TotalTransportHandlingUnitQuantity"/>
										</font>
									</td>
								</tr>
								<tr>
									<td  width="20%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										Termiregistro N°
										</font>
									</td>
									<td  width="30%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">

											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='06' and pe:Valor!='-'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each> 
										</font>
									</td>
									<td  width="30%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										Peso Neto
										</font>
									</td>
									<td  width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">

											<xsl:value-of select="//pe:DespatchAdvice/cac:Shipment/cbc:GrossWeightMeasure"/>
										</font>
									</td>
								</tr>
								<tr>
									<td  width="20%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										Precinto Linea
										</font>
									</td>

									<td  width="30%" align="left" colspan="3">
										<font face="Arial, Helvetica, sans-serif" size="2">

											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='07' and pe:Valor!='-'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each> 
										</font>
									</td>

								</tr>
							</tbody>
						</table>
					</td>
					<td width="5%">
					</td>
					<td width="35%">
						<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
							<tbody>
								<tr>
									<td width="100%" align="center" colspan="2" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										Datos Almacen Portuario
										</font>
									</td>
								</tr>
								<tr>
									<td width="30%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										RAZON SOCIAL 
										</font>
									</td>
									<td width="70%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='11' and pe:Valor!='-'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="30%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										RUC: 
										</font>
									</td>
									<td width="70%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='12' and pe:Valor!='-'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="30%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										DIRECCIÓN: 
										</font>
									</td>
									<td width="70%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='13' and pe:Valor!='-'">
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
		<br/>
	</xsl:template>
	<xsl:template name="Cuadros">
		<br/>
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td width="50%">
						<table border="1" width="100%" cellpadding="0" cellspacing="0" >
							<tbody>
								<tr>
									<td width="100%" align="center" colspan="3" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
									UNIDAD DE TRANSPORTE Y CONDUCTOR
										</font>
									</td>
								</tr>
								<tr>

									<td width="20%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										TRANSPORTISTA
										</font>
									</td>
									<td width="30%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">

											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
											<!--<xsl:call-template name="ReferenciaDocumento"/>-->
										</font>
									</td>
								</tr>
								<tr>
									<td width="20%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										DNI/RUC 
										</font>
									</td>
									<td width="30%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">

											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>

										</font>
									</td>
								</tr>
								<tr>
									<td width="20%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										LICENCIA
										</font>
									</td>
									<td width="30%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:if test="//cac:Shipment/cbc:HandlingCode='01'">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='03' and pe:Valor!='-'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='10' and pe:Valor!='-'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
										</font>
									</td>
								</tr>
								<!--<tr>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										C.M.T.C
										</font>
									</td>
									<td width="30%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											-
										</font>
									</td>
								</tr>-->
							</tbody>
						</table>
					</td>
					<td width="5%">
					</td>
					<td width="45%">
						<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
							<tbody>
								<tr>
									<td width="100%" align="center" colspan="2" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										EMPRESA TRANSPORTE
										</font>
									</td>
								</tr>
								<tr>
									<td width="30%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										RAZON SOCIAL 
										</font>
									</td>
									<td width="70%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="30%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										RUC: 
										</font>
									</td>
									<td width="70%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="30%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										PLACA: 
										</font>
									</td>
									<td width="70%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<!--<xsl:value-of select="//DespatchAdvice/cac:Shipment/cac:ShipmentStage/cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>-->
											<xsl:value-of select="//cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>

										</font>
									</td>
								</tr>
								<tr>
									<td width="30%" align="left" bgcolor="#B4B3B3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										PESO: 
										</font>
									</td>
									<td width="70%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//pe:DespatchAdvice/cac:Shipment/cbc:GrossWeightMeasure"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
	</xsl:template>
	<xsl:template name="Simbolo_Moneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">€</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">€</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">€</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head/>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\Panasonic\Formato_PanasonicV1.1\20100165849&#x2D;01&#x2D;F301&#x2D;00000280.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"><block path="table/td/font/xsl:for&#x2D;each" x="410" y="60"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if/=[0]" x="314" y="88"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if" x="360" y="90"/><block path="table/td/font/xsl:for&#x2D;each[1]" x="300" y="30"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="204" y="58"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if" x="250" y="60"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/xsl:value&#x2D;of" x="320" y="90"/><block path="table/td/font/xsl:for&#x2D;each[2]" x="340" y="30"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="84" y="58"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if" x="130" y="60"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/xsl:value&#x2D;of" x="200" y="90"/></template><template name="Total"></template><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->