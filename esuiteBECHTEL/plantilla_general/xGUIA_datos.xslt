<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Datos_Puntos">
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table rules="all" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<!--<tr bgcolor="#778899">-->
								<tr bgcolor="#DCDCDC">
									<td width="50%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>PUNTO DE PARTIDA</strong></font>
									</td>
						            <td width="50%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>PUNTO DE LLEGADA</strong></font>
									</td>
									</tr>

								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:if test="//cbc:CustomizationID='1.0'">
											<xsl:value-of select="//cac:Shipment/cac:OriginAddress/cbc:StreetName"/>
										</xsl:if>	
										<xsl:if test="//cbc:CustomizationID='2.0'">
										<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:AddressLine/cbc:Line"/>
										</xsl:if>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:if test="//cbc:CustomizationID='1.0'">
										<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/>
									</xsl:if>
									<xsl:if test="//cbc:CustomizationID='2.0'">
										<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>
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
	<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
	<tbody>
	<tr bgcolor="#DCDCDC">
	<td width="15%" align="center">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>DATOS DEL DESTINATARIO</strong></font>
		</td></tr></tbody></table>

		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Señores</strong></font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha Emisión</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cbc:IssueDate"/>
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
										<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" />
										</xsl:if>
										</font>
									</td>
								 
								   <td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha Inicio Traslado</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
 										<xsl:value-of select="//cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>
										</font>
									</td>
								   
								</tr>
								<tr>
									<xsl:if test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='02'">
										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="2"><strong>ORDEN DE COMPRA</strong></font>
										</td>
										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
											</font>
										</td>
									</xsl:if> 
									<xsl:if test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='06'">
									 <xsl:choose>
										<xsl:when test="substring(//cac:AdditionalDocumentReference/cbc:ID,1,2)='B0'">
											<td width="15%" align="left">
												<font face="Arial, Helvetica, sans-serif" size="2"><strong>BOLETA</strong></font>
											</td>
											<td width="15%" align="left">
												<font face="Arial, Helvetica, sans-serif" size="2">:
												<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
												<!-- <xsl:value-of select="substring(//cac:AdditionalDocumentReference/cbc:ID,1,2)"/> -->
												</font>
											</td>
										</xsl:when>
										<xsl:when test="substring(//cac:AdditionalDocumentReference/cbc:ID,1,2)='F0'">
											<td width="15%" align="left">
												<font face="Arial, Helvetica, sans-serif" size="2"><strong>FACTURA</strong></font>
											</td>
											<td width="15%" align="left">
												<font face="Arial, Helvetica, sans-serif" size="2">:
												<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
												<!-- <xsl:value-of select="substring(//cac:AdditionalDocumentReference/cbc:ID,1,2)"/> -->
												</font>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<td width="15%" align="left">
												<font face="Arial, Helvetica, sans-serif" size="2"><strong>OTROS</strong></font>
											</td>
											<td width="15%" align="left">
												<font face="Arial, Helvetica, sans-serif" size="2">:
												<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
												</font>
											</td>
										</xsl:otherwise>
									 </xsl:choose>
									</xsl:if>
									<!-- <xsl:if test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode=''"> -->
										<!-- <td width="15%" align="left"> -->
										<!-- <br/> -->
										<!-- </td> -->
									<!-- </xsl:if> -->
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
						<td width="50%">
						<table rules="groups" border="1" width="99%" cellpadding="0" cellspacing="0" bordercolor="#000001">
							<tbody>
								<tr bgcolor="#DCDCDC">
									<td width="100%" align="center" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>DATOS DEL CONDUCTOR</strong>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>CONDUCTOR</strong>
										</font>
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
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>DNI/RUC </strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson/cbc:ID"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>LICENCIA DE CONDUCIR</strong>
										</font>
									</td>
									<td width="50%" align="left">
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

					<td width="2%">
					</td>

					<td width="50%">
						<table rules="groups" border="1" width="99%" cellpadding="0" cellspacing="0" bordercolor="#000001">
							<tbody>
								<tr bgcolor="#DCDCDC">
									<td width="100%" align="center" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>EMPRESA DE TRANSPORTE</strong>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>RAZÓN SOCIAL</strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
									<xsl:if test="//cbc:CustomizationID='1.0'">
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
									</xsl:if>
									<xsl:if test="//cbc:CustomizationID='2.0'">
									<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">
									<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:RegistrationName"/>
									</xsl:if>
									<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
									<xsl:value-of select="//cac:DespatchSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" />
									</xsl:if>
									</xsl:if>
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
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>MARCA/PLACA</strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:if test="//cbc:CustomizationID='1.0'">
										<xsl:if test="//cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID != ''">
											<xsl:value-of select="//cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>
										</xsl:if>
										<xsl:if test="//cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID = ''">
											-
										</xsl:if>
										</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
											<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID"/>
											</xsl:if>
										</font>
									</td>
								</tr>
								
							</tbody>
						</table>

						
					</td>
					</tr></tbody></table>
					</xsl:template>

					
		<xsl:template name="MotivoTraslado">
				<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
				<tbody>
				<tr bgcolor="#DCDCDC">
				<td width="15%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="2"><strong>MOTIVO DEL TRASLADO</strong></font>
				</td></tr></tbody></table>

			<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="18%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>MOTIVO DEL TRASLADO</strong></font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:</font>
									</td>
									<td width="45%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
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
										<xsl:if test="//cac:Shipment/cbc:HandlingCode='19'">
										Traslado a zona primaria
										</xsl:if>
										</font>
									</td>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>DESCRIPCIÓN</strong></font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
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
									<td width="18%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>OBSERVACIONES</strong></font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:</font>
									</td>
									<td width="45%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cbc:Note"/>
										</font>
									</td>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>NRO. DE BULTOS</strong></font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:Shipment/cbc:TotalTransportHandlingUnitQuantity"/>		
										</font>
									</td>
								</tr>
								<tr>
									<td width="18%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2"><strong>GUIA TRANSPORTISTA</strong></font>
									</td>
									<td width="1%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">:</font>
									</td>
									<td width="45%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='4'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										</font>
									</td>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>PESO</strong>
										</font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:Shipment/cbc:GrossWeightMeasure"/>&#xA0;
										<xsl:call-template name="unidad_medida" />
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
					
				</td>
			</tr>
		</table>
	</xsl:template>
		<xsl:template name="unidad_medida">
		<xsl:choose>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='PL'">BAL</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='D64'">BLK</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='BG'">BOL</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='BX'">CAJ</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='CY'">CIL</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='CLT'">CL</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='CMT'">CM</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='CJ'">CON</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='DLT'">DL</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='GRM'">GR</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='HUR'">HRA</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='KT'">JGO</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='KWT'">KW</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='MIL'">MIL</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='D61'">MIN</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='MMT'">MM</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='NPR'">PAR</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='FTK'">PI2</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='FTQ'">PI3</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='PA'">PQT</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='INH'">PUL</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='NRL'">ROL</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='TNE'">TON</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='SA'">SAC</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='JR'">FC</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='SO'">SO</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='JE'">JER</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode='PS'">POTE</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>

		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->