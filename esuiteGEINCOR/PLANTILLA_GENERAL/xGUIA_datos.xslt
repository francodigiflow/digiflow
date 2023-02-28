<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DatosReceptor">
		<table width="100%" cellpadding="1" cellspacing="0" border="0"  style="font-family :Calibri,sans-serif;font-size:12px;color:#000000">			
			<tr>
				<td>
				<table width="100%" cellpadding="4" cellspacing="0" border="0"  style="border-top:solid 2px black;border-bottom:none">
						<tr>
							<td width="80%" colspan="4">
								<strong>DATOS DEL DESTINATARIO: </strong>
							</td>
						</tr>
						<tr>
							<td width="20%"  >
								<strong>Documento de Identidad: </strong>
							</td>
							<td valign="top" align="left" width="20%"  >
								<xsl:value-of select="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID"/>
							</td>
							<td width="15%"  >
								<strong>Razón Social: </strong>
							</td>
							<td valign="top" align="left" width="45%"  >
								
							</td>
						</tr>						
				</table>
					<table width="100%" cellpadding="4" cellspacing="0" border="0"  style="border-top:solid 2px black;border-bottom:none">
						<tr>
							<td width="80%" colspan="4">
								<strong>DATOS DEL PUNTO DE PARTIDA Y PUNTO DE LLEGADA: </strong>
							</td>
						</tr>
						
						<tr>
							<td width="25%"  >
								<strong>Dirección del punto de partida: </strong>
							</td>
							<td valign="top" align="left" width="40%"  >
								
							</td>
							<td width="20%"  >
								<strong>Fecha de Emision: </strong>
							</td>
							<td valign="top" align="left" width="10%"  >
								<xsl:value-of select="//cbc:IssueDate"/>
							</td>
						</tr>
						<tr>
							<td width="25%"  >
								<strong>Dirección del punto de llegada: </strong>
							</td>
							<td valign="top" align="left" width="40%"  >
								
							</td>
							<td width="20%"  >
								<strong>Fecha Inicio Traslado: </strong>
							</td>
							<td valign="top" align="left" width="10%"  >
								<xsl:value-of select="//cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>
							</td>
						</tr>	
						<tr>
							<td width="25%"  >
								<strong>Motivo de Traslado: </strong>
							</td>
							<td  align="left" width="40%"  >
								<xsl:value-of select="//cac:Shipment/cbc:Information"/>
							</td>
							<td width="20%"  >
								<strong>Modalidad de Transporte: </strong>
							</td>
							<td valign="top" align="left" width="10%"  >
								<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">
									Transporte público
								</xsl:if>
								<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
									Transporte privado	
								</xsl:if>
							</td>
						</tr>	
					</table>
					
					<table width="100%" cellpadding="4" cellspacing="0" border="0"  style="border-top:solid 2px black;border-bottom:none">
						<tr>
							<td width="80%" colspan="4">
								<strong>DATOS DEL TRANSPORTISTA: </strong>
							</td>
						</tr>
						<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">
						<tr>
							<td width="15%"  >
								<strong>Documento de Identidad: </strong>
							</td>
							<td align="left" width="15%"  >
								<xsl:if test="//cbc:CustomizationID='1.0'">
									<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
								</xsl:if>
								<xsl:if test="//cbc:CustomizationID='2.0'">
									<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
								</xsl:if>
							</td>
							<td width="14%"  >
								<strong>Razón Social: </strong>
							</td>
							<td valign="top" align="left" width="50%"  >
								<xsl:if test="//cbc:CustomizationID='1.0'">
									<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
								</xsl:if>
								<xsl:if test="//cbc:CustomizationID='2.0'">
									<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:RegistrationName"/>
								</xsl:if>
							</td>
						</tr>
						</xsl:if>
						<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
						<tr>
							<td width="15%"  >
								<strong>Documento de Identidad: </strong>
							</td>
							<td align="left" width="15%"  >
								<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson/cbc:ID"/>
							</td>
							<td width="14%"  >
								<strong>Nombre Conductor: </strong>
							</td>
							<td valign="top" align="left" width="30%"  >
								<xsl:value-of select="//cac:ShipmentStage/cac:DriverPerson/cbc:FirstName"/>&#160;<xsl:value-of select="//cac:ShipmentStage/cac:DriverPerson/cbc:FamilyName"/>
							</td>
						</tr>
						<tr>
							<td width="20%"  >
								<strong>Placa: </strong>
							</td>
							<td align="left" width="15%"  >
									<xsl:if test="//cbc:CustomizationID='1.0'">
										<xsl:value-of select="//cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>
									</xsl:if>
									<xsl:if test="//cbc:CustomizationID='2.0'">
										<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID"/>
									</xsl:if>
							</td>
							<td width="12%"  >
								<strong>Licencia Conductor: </strong>
							</td>
							<td valign="top" align="left" width="30%"  >
									<xsl:if test="//cbc:CustomizationID='1.0'">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='03'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="//cbc:CustomizationID='2.0'">
										<xsl:value-of select="//cac:ShipmentStage/cac:DriverPerson/cac:IdentityDocumentReference/cbc:ID"/>
									</xsl:if>								
								
							</td>
						</tr>
						</xsl:if>

					</table>
				
				</td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template name="Datos_Arriba">
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="50%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="1%" align="left">&#xA0;</td>
									<td width="99%" align="left" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Punto de partida&#xA0;:</strong>
											&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cac:OriginAddress/cbc:StreetName"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:AddressLine/cbc:Line"/>
											</xsl:if>
										</font>
									</td>									
								</tr>								
								<tr>
									<td width="1%" align="left">&#xA0;</td>
									<td width="32%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Fecha emisión&#xA0;:</strong>
										</font>										
									</td>
									<td width="67%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#xA0;<xsl:value-of select="//cbc:IssueDate"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="1%" align="left">&#xA0;</td>
									<td width="32%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Fecha Inicio Traslado&#xA0;:</strong>											
										</font>										
									</td>
									<td width="67%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#xA0;<xsl:value-of select="//cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td vAlign="top" width="1%" height="100%">
					</td>
					<td vAlign="top" width="49%" height="100%">
						<table rules="none" border="1" width="100%" height="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody height="100%">
								<tr  height="100%">
									<td width="1%" align="left">&#xA0;</td>
									<td width="99%" align="left" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Punto de llegada&#xA0;:</strong>
											&#xA0;
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>
											</xsl:if>
										</font>
									</td>									
								</tr>								
								<tr  height="100%">
									<td width="1%" align="left">&#xA0;</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Destinatario&#xA0;:</strong>
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#xA0;
											<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>
								</tr>
								<tr  height="100%">
									<td width="1%" align="left">&#xA0;</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>RUC&#xA0;:</strong>											
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#xA0;
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
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

	<xsl:template name="Datos_Transporte">
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="50%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="100%" align="center" colspan="3">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>UNIDAD DE TRANSPORTE Y CONDUCTOR</strong>
										</font>
									</td>									
								</tr>							
								<tr>
									<td width="1%" align="left">&#xA0;</td>
									<td width="32%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Marca y N° Placa&#xA0;:</strong>
										</font>										
									</td>
									<td width="67%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#xA0;
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='04'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each> 
											- 
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID"/>
											</xsl:if>
										</font>										
									</td>
								</tr>
								<tr>
									<td width="1%" align="left">&#xA0;</td>
									<td width="32%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Constancia Inscripc.
											&#xA0;:</strong>											
										</font>										
									</td>
									<td width="67%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#xA0;
											<xsl:value-of select="//cac:CarrierParty/cac:PartyLegalEntity/cbc:CompanyID"/>
										</font>
									</td>
								</tr>
								
								<tr>
									<td width="1%" align="left">&#xA0;</td>
									<td width="32%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Licencia Conducir
											&#xA0;:</strong>											
										</font>										
									</td>
									<td width="67%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#xA0;
											<xsl:value-of select="//cac:ShipmentStage/cac:DriverPerson/cac:IdentityDocumentReference/cbc:ID"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td vAlign="top" width="1%">
					</td>
					<td vAlign="top" width="49%" height="100%">
						<table rules="none" border="1" width="100%" height="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody  height="100%">
								<tr>
									<td width="100%" align="center" colspan="3">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>EMPRESA DE TRANSPORTES</strong>
										</font>
									</td>									
								</tr>
								<tr>
									<td width="1%" align="left">&#xA0;</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Razón Social:&#xA0;:</strong>
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#xA0;
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:RegistrationName"/>
											</xsl:if>
										</font>
									</td>
								</tr>
								<tr>
									<td width="1%" align="left">&#xA0;</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>RUC&#xA0;:</strong>											
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#xA0;
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
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

	<xsl:template name="Datos_Generales">
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="1%" align="left">&#xA0;</td>
									<td width="14%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Motivo de traslado&#xA0;:</strong>
										</font>										
									</td>
									<td width="85%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#xA0;
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cbc:Information"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:Shipment/cbc:HandlingInstructions"/>
											</xsl:if>
										</font>										
									</td>
								</tr>
								<tr>
									<td width="1%" align="left">&#xA0;</td>
									<td width="14%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Modalidad de traslado
											&#xA0;:</strong>											
										</font>										
									</td>
									<td width="85%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#xA0;
											<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">
												Transporte público
											</xsl:if>
											<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
												Transporte privado	
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

	<xsl:template name="ReferenciaItem">

		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<!--<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">-->
						<!--<tr>
							<td width="20%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>RÃ©gimen RetenciÃ³n</strong>
								</font>
							</td>
							<td width="80%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:if test="//sac:SUNATRetentionSystemCode='01'">
										TASA 3%
									</xsl:if>

								</font>
							</td>
						</tr>-->
						<!--<tr>
							<td width="20%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Tasa RetenciÃ³n</strong>
								</font>
							</td>
							<td width="80%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="//sac:SUNATRetentionPercent"/>
										
								</font>
							</td>
						</tr>-->
						<!--<tr>-->
							<!--<td width="20%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>TOTAL PAGADO DE CRE</strong>
								</font>
							</td>
							<td width="80%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									
										<xsl:value-of select="format-number(//sac:SUNATTotalPaid,'###,###,##0.00','pen')"/>
								</font>
							</td> -->
						<!--</tr>-->
						<!--<tr>-->
						<!--	<td width="20%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>TOTAL RETENIDO DE CRE</strong>
								</font>
							</td>
							<td width="80%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									
										<xsl:value-of select="format-number(//cbc:TotalInvoiceAmount,'###,###,##0.00','pen')"/>
								</font>
							</td> -->
						<!--</tr>-->
					<!--</table>-->
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\EMCURE" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->