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
	
		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
							
								<tr>
								    <td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Cliente</strong></font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>

									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha de Emisión</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
 											<xsl:value-of select="//cbc:IssueDate"/>
										</font>
									</td>
								</tr>
								<tr>
								    <td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Dirección</strong></font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='4'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
										</font>
									</td>

									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha de inicio Traslado</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
 										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>
										</font>
									</td>
								</tr>
								<tr>
                                    <td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>R.U.C.</strong></font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
											</xsl:if>
										</font>
									</td>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Factura N°</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
 										<xsl:if test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='01'">
											<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
										</xsl:if>
										</font>
									</td>
								 </tr>
								 <tr>
                                    <td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Orden de Compra</strong></font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:if test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='801'">
											<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
										</xsl:if>
										</font>
									</td>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Motivo de Traslado</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
 										<!-- <xsl:value-of select="//cac:Shipment/cbc:Information"/> -->
										<xsl:if test="//cac:Shipment/cbc:HandlingCode='01'">
											Venta
										</xsl:if>
										<xsl:if test="//cac:Shipment/cbc:HandlingCode='02'">
											Compra
										</xsl:if>
										<xsl:if test="//cac:Shipment/cbc:HandlingCode='04'">
											Traslado entre establecimientos de la misma empresa
										</xsl:if>
										<xsl:if test="//cac:Shipment/cbc:HandlingCode='08'">
											Importación
										</xsl:if>
										<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
											Exportación
										</xsl:if>
										<xsl:if test="//cac:Shipment/cbc:HandlingCode='13'">
											Otros
										</xsl:if>
										<xsl:if test="//cac:Shipment/cbc:HandlingCode='14'">
											Venta sujeta a confirmación del comprador   
										</xsl:if>
										<xsl:if test="//cac:Shipment/cbc:HandlingCode='18'">
											Traslado emisor itinerante CP
										</xsl:if>
										<xsl:if test="//cac:Shipment/cbc:HandlingCode='13'">
											Traslado a zona primaria
										</xsl:if>
										<xsl:if test="//cac:Shipment/cbc:HandlingCode='00'">
											PRUEBA
										</xsl:if>
								</font>
									</td>
								 </tr>
								<tr>
                                    <td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>N° de Negocio</strong></font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='1'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										</font>
									</td>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Otros</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
 										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='2'">
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

	<xsl:template name="Cuadro_Conductor_Transporte">

	<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top"  width="50%" >
						<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001" vAlign="top">
							<tbody>
								<tr>
									<td width="100%"  vAlign="top" >
										<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
											<tbody>
												<tr>
													<td width="30%" align="center" colspan="2"  vAlign="top"  >
														<font face="Arial, Helvetica, sans-serif" size="2">
														Entregado p. Belltch Perú S.A.C. 
														</font>
													</td>
													<td width="50%" align="center">
														<font face="Arial, Helvetica, sans-serif" size="2">
														_________________________________________
														</font>
													</td>
												</tr>
												<tr>
													<td width="30%" align="center" colspan="2" >
														<font face="Arial, Helvetica, sans-serif" size="2">
														Recibido p. Cliente (Firma y Sello) 
														</font><br/><br/>
													</td>
													<td width="50%" align="center">
														<font face="Arial, Helvetica, sans-serif" size="2">
														_________________________________________
														</font><br/><br/>
													</td>
												</tr>
								
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</td>

					<td width="50%">
						<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001" vAlign="top">
							<tbody>
								<tr>
									<td vAlign="top" width="100%">
										<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
											<tbody>
												<tr>
													<td width="50%" align="left" colspan="2">
														<font face="Arial, Helvetica, sans-serif" size="2">&#160;
														<strong>MODALIDAD DE TRANSPORTE: </strong>
															<xsl:variable name="varVALOR">
																<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode"/>
															</xsl:variable>
															<xsl:choose>
																<xsl:when test="$varVALOR='01'">
																	01-PÚBLICO
																</xsl:when>
																<xsl:when test="$varVALOR='02'">
																	02-PRIVADO
																</xsl:when>
																<xsl:otherwise>
																</xsl:otherwise>
															</xsl:choose>
														</font>
														<br/>
													</td>									
												</tr>
												<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">
													<tr>
														<td width="50%" align="left" colspan="2">
															<font face="Arial, Helvetica, sans-serif" size="2">&#160;
																<strong>TRANSPORTISTA: </strong>
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
														<td width="25%" align="left">
										
															<font face="Arial, Helvetica, sans-serif" size="2">&#160;
															<strong>RUC: </strong>
															<xsl:if test="//cbc:CustomizationID='1.0'">
																<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
															</xsl:if>
															<xsl:if test="//cbc:CustomizationID='2.0'">
																<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
															</xsl:if>
															</font>
														</td>
														<td width="50%" align="left" colspan="2">
															<font face="Arial, Helvetica, sans-serif" size="2">
															<strong>REGISTRO MTC: </strong>
																<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:CompanyID"/>
															</font>
														</td>								
													</tr>
													<tr>
														<td width="50%" align="left" colspan="2">&#160;
															<font face="Arial, Helvetica, sans-serif" size="2">
															<strong>CERT.HAB VEHICULAR: </strong>
																<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cac:ApplicableTransportMeans/cbc:RegistrationNationalityID"/>
															</font>
														</td>									
													</tr>
												</xsl:if>
												<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
													<tr>
														<td width="100%" align="left" colspan="2">&#160;
															<font face="Arial, Helvetica, sans-serif" size="2">
																<strong>CHOFER: </strong><xsl:value-of select="//cac:ShipmentStage/cac:DriverPerson/cbc:FirstName"/>&#160;<xsl:value-of select="//cac:ShipmentStage/cac:DriverPerson/cbc:FamilyName"/>
															</font>
														</td>
													</tr>
													<tr>
														<td width="25%" align="left">
															<font face="Arial, Helvetica, sans-serif" size="2">&#160;
															<strong>LIC. CONDUCIR: </strong>
															<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson/cbc:ID"/>
															</font>
										
														</td>
														<td width="25%" align="left">
															<font face="Arial, Helvetica, sans-serif" size="2">
															<strong>TIPO DOC: </strong>
															<xsl:choose>
																<xsl:when test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID = '0'">No Domiciliado</xsl:when>
																<xsl:when test="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson/cbc:ID/@schemeID = '1'">D.N.I.</xsl:when>
																<xsl:when test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID = '4'">Carnet Extr.</xsl:when>
																<xsl:when test="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson/cbc:ID/@schemeID = '6'">R.U.C.</xsl:when>
																<xsl:when test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID = '7'">Pasaporte</xsl:when>
																<xsl:when test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID = 'A'">CED. DIP. IDENT.</xsl:when>
																<xsl:when test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID = 'B'">Doc.Ident. País Res. No. Dom.</xsl:when>
																<xsl:when test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID = 'C'">Id. Number PP.NN.</xsl:when>
																<xsl:when test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID = 'D'">Id. Number PP.JJ.</xsl:when>
																<xsl:when test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID = 'E'">Tarjeta Andina de Migración</xsl:when>
															</xsl:choose>
															</font>
														</td>
													</tr>
													<tr>
														<td width="25%" align="left">
															<font face="Arial, Helvetica, sans-serif" size="2">&#160;
																<strong>MARCA: </strong>
																<xsl:if test="//cbc:CustomizationID='1.0'">
																	<xsl:value-of select="//cbc:BrandName"/>
																</xsl:if>
																<xsl:if test="//cbc:CustomizationID='2.0'">
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																		<xsl:if test="pe:Codigo='5'">
																			<xsl:value-of select="pe:Valor"/>
																		</xsl:if>
																	</xsl:for-each>
																</xsl:if>
															</font>
														</td>
														<td width="25%" align="left">
															<font face="Arial, Helvetica, sans-serif" size="2">&#160;
																<strong>N° DOC: </strong>
																<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson/cbc:ID"/>
															</font>
														</td>
													</tr>
													<tr>
														<td width="100%" align="left" colspan="2">
															<font face="Arial, Helvetica, sans-serif" size="2">&#160;
																<strong>PLACA: </strong>
																<xsl:if test="//cbc:CustomizationID='1.0'">
																	<xsl:value-of select="//cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>
																</xsl:if>
																<xsl:if test="//cbc:CustomizationID='2.0'">
																	<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID"/>
																</xsl:if>
															</font>
														</td>
													</tr>
												</xsl:if>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					</tr>
					</tbody>
					</table>
	</xsl:template>

	<xsl:template name="Observaciones">

			<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Observaciones: </strong>
											<xsl:value-of select="//cbc:Note"/>
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
	
		<xsl:template name="Direccion">

		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="100%" align="left" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Punto de Partida: </strong>
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
									<td width="100%" align="left" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Punto de Llegada: </strong>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>
											</xsl:if>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Peso bruto: </strong>
											<xsl:value-of select="format-number(//cac:Shipment/cbc:GrossWeightMeasure,'###,###,##0.000','pen')"/>
											&#160;<xsl:value-of select="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode"/>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Total bultos: </strong>
											<xsl:value-of select="//cac:Shipment/cbc:TotalTransportHandlingUnitQuantity"/>
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

		<xsl:template name="IndicadorTraslado">

			<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>SUNAT_Envio_IndicadorTransbordoProgramado : </strong>
											<xsl:choose>
												<xsl:when test="//cbc:SpecialInstructions='SUNAT_Envio_IndicadorTransbordoProgramado'">Si</xsl:when>
												<xsl:otherwise>No</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
								</tr>
								<tr>
								    <td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>SUNAT_Envio_IndicadorTrasladoVehiculoM1L : </strong>
											<xsl:choose>
												<xsl:when test="//cbc:SpecialInstructions='SUNAT_Envio_IndicadorTrasladoVehiculoM1L'">Si</xsl:when>
												<xsl:otherwise>No</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
								</tr>
								<tr>
								    <td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>SUNAT_Envio_IndicadorVehiculoConductoresTransp : </strong>
											<xsl:choose>
												<xsl:when test="//cbc:SpecialInstructions='SUNAT_Envio_IndicadorVehiculoConductoresTransp'">Si</xsl:when>
												<xsl:otherwise>No</xsl:otherwise>
											</xsl:choose>
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


				<!--<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:value-of select="cbc:ID"/>
				</font>-->
			<!--</xsl:if>-->
		</xsl:for-each>

	<!--	<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
			<xsl:if test="cbc:DocumentTypeCode != '10'">
				<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:choose>
						<xsl:when test="cbc:DocumentTypeCode='01' and substring(cbc:ID,1,1) = 'F'">FACTURA ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='01' and substring(cbc:ID,1,1) != 'F'">FACTURA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='03' and substring(cbc:ID,1,1) = 'B'">BOLETA DE VENTA ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='03' and substring(cbc:ID,1,1) != 'B'">BOLETA DE VENTA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='07' and substring(cbc:ID,1,1) = 'F'">NOTA DE CREDITO ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='07' and substring(cbc:ID,1,1) = 'B'">NOTA DE CREDITO ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='07' and substring(cbc:ID,1,1) != 'F'">NOTA DE CREDITO</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='07' and substring(cbc:ID,1,1) != 'B'">NOTA DE CREDITO</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='08' and substring(cbc:ID,1,1) = 'F'">NOTA DE DEBITO ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='08' and substring(cbc:ID,1,1) = 'B'">NOTA DE DEBITO ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='08' and substring(cbc:ID,1,1) != 'F'">NOTA DE DEBITO ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='08' and substring(cbc:ID,1,1) != 'B'">NOTA DE DEBITO ELECTRONICA</xsl:when>
						<xsl:otherwise>Documento NN</xsl:otherwise>
					</xsl:choose>
				</font>
			</xsl:if>
		</xsl:for-each>-->

<!--		<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
			<xsl:if test="cbc:DocumentTypeCode != '10'">

				<xsl:variable name="attribute">
					<xsl:call-template name="RepeatString">
						<xsl:with-param name="string" select="'0'"/>
						<xsl:with-param name="times" select="8-(string-length(substring-after(cbc:ID,'-')))"/>
					</xsl:call-template>
				</xsl:variable>

				<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="concat($attribute,substring-after(cbc:ID,'-'))"/></font>
			</xsl:if>
		</xsl:for-each>-->
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->