<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:variable name="Tramo2_PARTIDA">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="10"/>	
		</xsl:call-template>			
	</xsl:variable>
	<xsl:variable name="Tramo2_LLEGADA">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="11"/>	
		</xsl:call-template>			
	</xsl:variable>

	<xsl:template name="Datos_Puntos">

		<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
			<tbody>
				<tr>
					<td width="100%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2"><strong>PUNTO DE PARTIDA</strong></font>
					</td>
				</tr>
				<tr>
					<td width="100%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="//cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:AddressLine/cbc:Line"/>
						</font>										
					</td>
				</tr>
				<tr>
					<td width="100%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2"><strong>PUNTO DE LLEGADA</strong></font>										
					</td>
				</tr>
				<tr>
					<td width="100%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="//cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="Datos_Arriba">
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="40%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="50%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha de emisión</strong></font>
									</td>
									<td width="50%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha de inicio de traslado</strong></font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cbc:IssueDate"/>
										</font>										
									</td>
									<td width="50%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>
										</font>										
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td vAlign="top" width="1%">
					</td>
					<td vAlign="top" width="59%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="100%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Motivo de traslado</strong></font>
									</td>
								</tr>
								<tr>
									<td width="100%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:Shipment/cbc:HandlingCode"/> - 
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cbc:Information"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:Shipment/cbc:HandlingInstructions"/>
											</xsl:if>
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

	<xsl:template name="DatosReceptor">
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="100%" align="left"  colspan="4">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>DESTINATARIO</strong>
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;Razon Social
										</font>										
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>										
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;RUC
										</font>										
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</font>										
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>				
					<td vAlign="top" width="100%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="100%" align="left" colspan="8">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>TRANSPORTISTA</strong>
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;R.Social
										</font>										
									</td>
									<td width="36%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>										
									</td>
									<td width="2%"></td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;Placa
										</font>										
									</td>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID"/>
										</font>										
									</td>
									<td width="2%"></td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;Peso bruto
										</font>										
									</td>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="format-number(//cac:Shipment/cbc:GrossWeightMeasure,'###,###,##0.000','pen')"/>
										</font>										
									</td>									
								</tr>
								<tr>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;RUC
										</font>										
									</td>
									<td width="36%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
										</font>										
									</td>
									<td width="2%"></td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;C.Inscripc.
										</font>										
									</td>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:CarrierParty/cac:PartyLegalEntity/cbc:CompanyID"/>
										</font>										
									</td>
									<td width="2%"></td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;Nro bultos
										</font>										
									</td>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:Shipment/cbc:TotalTransportHandlingUnitQuantity"/>
										</font>										
									</td>
								</tr>
								<tr>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;Conductor
										</font>										
									</td>
									<td width="36%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:ShipmentStage/cac:DriverPerson/cbc:FirstName	"/>&#160;<xsl:value-of select="//cac:ShipmentStage/cac:DriverPerson/cbc:FamilyName"/>
										</font>										
									</td>
									<td width="2%"></td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;Marca
										</font>										
									</td>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='06'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
										    </xsl:for-each>
										</font>										
									</td>
									<td width="2%"></td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;Lic.Conduc.
										</font>										
									</td>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:ShipmentStage/cac:DriverPerson/cac:IdentityDocumentReference/cbc:ID"/>
										</font>										
									</td>
								</tr>
								<tr>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;Modalidad
										</font>										
									</td>
									<td width="36%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">
												Transporte público
											</xsl:if>
											<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
												Transporte privado
											</xsl:if>
										</font>										
									</td>
									<td width="2%"></td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											
										</font>										
									</td>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											
										</font>										
									</td>
									<td width="2%"></td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											
										</font>										
									</td>
									<td width="16%" align="left">
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

	<xsl:template name="Datos_Final">

		<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
			<tbody>
				<tr>
					<td width="20%" align="left" colspan="5">
						<font face="Arial, Helvetica, sans-serif" size="2">
							&#160;
							<strong>Observaciones:&#160;</strong>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='07'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
						    </xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">&#160;SUNAT_Envio_IndicadorTrasladoVehiculoM1L</font>										
					</td>
					<td width="30%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							&#160;
							<xsl:choose>
								<xsl:when test="//cbc:SpecialInstructions='SUNAT_Envio_IndicadorTrasladoVehiculoM1L'">SI</xsl:when><xsl:otherwise>NO</xsl:otherwise>
							</xsl:choose>
						</font>										
					</td>
					<td width="20%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">SUNAT_Envio_IndicadorTransbordoProgramado</font>
					</td>
					<td width="30%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							&#160;
							<xsl:choose>
								<xsl:when test="//cbc:SpecialInstructions='SUNAT_Envio_IndicadorTransbordoProgramado'">SI</xsl:when><xsl:otherwise>NO</xsl:otherwise>
							</xsl:choose>
						</font>										
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="ReferenciaDocumento">

		<xsl:for-each select="//cac:AdditionalDocumentReference">
			<!--<xsl:if test="cbc:DocumentTypeCode != '10'">-->

				<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:choose>
						<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='09'">GUÍA DE REMISIÓN</xsl:when>
						<xsl:otherwise>Documento NN</xsl:otherwise>
					</xsl:choose>
				</font>

		</xsl:for-each>
			
	</xsl:template>


	<xsl:template name="RepeatString">
		<xsl:param name="string" select="''"/>
		<xsl:param name="times" select="1"/>

		<xsl:if test="number($times) > 0">
			<xsl:value-of select="$string"/>
			<xsl:call-template name="RepeatString">
				<xsl:with-param name="string" select="$string"/>
				<xsl:with-param name="times" select="$times - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\ARDILES" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->