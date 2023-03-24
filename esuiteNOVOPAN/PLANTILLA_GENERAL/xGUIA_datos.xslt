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
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>DATOS DE ENVÍO</strong></font>		
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>				
					<td vAlign="top" width="100%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>Fecha de inicio de traslado</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="24%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
												<xsl:value-of select="//cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>
											</xsl:if>
										</font>										
									</td>
									<td width="2%"></td>
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;Punto de partida
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="34%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:AddressLine/cbc:Line"/>s
										</font>										
									</td>							
								</tr>
								<tr>
									<td width="100%" align="left" colspan="7">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;&#160;Fecha de entrega de bienes al transportista :&#160;
											<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">
												<xsl:value-of select="//cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/> 
											</xsl:if>
										</font>										
									</td>
								</tr>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>Motivo de traslado</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="24%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:Shipment/cbc:HandlingCode"/> - 
											<xsl:call-template name="DescMotivoTraslado"/>
										</font>										
									</td>
									<td width="2%"></td>
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;Punto de llegada
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="34%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>
										</font>										
									</td>							
								</tr>
								<tr>
									<td width="100%" align="left" colspan="7">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;Descripción de motivo de traslado "otros": 
											<xsl:if test="//cac:Shipment/cbc:HandlingCode='13'">
												<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cbc:Information"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:Shipment/cbc:HandlingInstructions"/>
											</xsl:if>
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

	<xsl:template name="DescMotivoTraslado">
		<xsl:choose>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='01'">Venta</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='02'">Compra</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='03'">Venta con entrega a terceros</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='04'">Traslado entre establecimientos de la misma empresa</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='05'">Consignaci&#xFFFD;n</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='06'">Devoluci&#xFFFD;n</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='07'">Recojo de bienes transformados</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='08'">Importaci&#xFFFD;n</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='09'">Exportaci&#xFFFD;n</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='13'">Otros</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='14'">Venta sujeta a confirmaci&#xFFFD;n del comprador</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='17'">Traslado de bienes para transformaci&#xFFFD;n</xsl:when>
			
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='18'">Trasladoemisor itinerante CP</xsl:when>
			
			
			
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="Datos_Arriba">
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="19%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="100%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha de emisión</strong></font>
									</td>
								</tr>
								<tr>
									<td width="100%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cbc:IssueDate"/>
										</font>										
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td vAlign="top" width="1%">
					</td>
					<td vAlign="top" width="19%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="100%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha de inicio de traslado</strong></font>
									</td>
								</tr>
								<tr>
									<td width="100%" align="center">
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

	<xsl:template name="TipoDeDocumento">
		<xsl:if test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='-' or //cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='0'">NO DOMICILIADO</xsl:if>
		<xsl:if test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='1'">DNI</xsl:if>
		<xsl:if test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='4'">CARNET EXTR.</xsl:if>
		<xsl:if test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='6'">RUC</xsl:if>
		<xsl:if test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='7'">PASAPORTE</xsl:if>
		<xsl:if test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='A'">CED. DIP. IDENT.</xsl:if>
		<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='-' or //cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='0'">NO DOMICILIADO</xsl:if>
		<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='6'">RUC</xsl:if>
		<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='4'">CARNET EXTR.</xsl:if>
		<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='7'">PASAPORTE</xsl:if>
		<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='A'">CED. DIP. IDENT.</xsl:if>
	</xsl:template>

	<xsl:template name="DatosReceptor">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>DATOS DEL DESTINATARIO</strong></font>		
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>				
					<td vAlign="top" width="100%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>Tipo y N° documento</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:call-template name="TipoDeDocumento"/>&#160;<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
										</font>										
									</td>						
								</tr>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>Razón Social/Nombres</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:RegistrationName"/>											
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

	<xsl:template name="DatosReceptor2">
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
								<tr>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;Dir. Fiscal
										</font>										
									</td>
									<td width="90%" align="left" colspan="7">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:call-template name="RetourneValAd">
												<xsl:with-param name="NumAd" select="01"/>	
											</xsl:call-template>
										</font>										
									</td>									
								</tr>
								<tr>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;Pedido
										</font>										
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											
										</font>										
									</td>
									<td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;O.Compra
										</font>										
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:call-template name="RetourneValAd">
												<xsl:with-param name="NumAd" select="02"/>	
											</xsl:call-template>
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

	<xsl:template name="DatosInfoTraslado">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>DATOS DEL TRASLADO</strong></font>		
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>				
					<td vAlign="top" width="100%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;
										</font>										
									</td>
									<td width="21%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Modalidad de traslado</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="74%" align="left" colspan="6">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">
												Transporte público
											</xsl:if>
											<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
												Transporte privado
											</xsl:if>
										</font>										
									</td>						
								</tr>
								<tr>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;
										</font>										
									</td>
									<td width="42%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Indicador de Transbordo Programado</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="//cbc:SpecialInstructions='SUNAT_Envio_IndicadorTransbordoProgramado'">SI</xsl:when><xsl:otherwise>NO</xsl:otherwise>
											</xsl:choose>
										</font>										
									</td>
									<td width="2%"></td>
									<td width="47%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Indicador de Retorno de Vehículo Vacío</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="2%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="//cbc:SpecialInstructions='SUNAT_Envio_IndicadorRetornoVehiculoVacio'">SI</xsl:when><xsl:otherwise>NO</xsl:otherwise>
											</xsl:choose>
										</font>										
									</td>
									<td width="1%"></td>
								</tr>
								<tr>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;
										</font>										
									</td>
									<td width="42%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Indicador de Categoría M1 o L</strong>
										</font>										
									</td>
									<td width="1%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="2%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="//cbc:SpecialInstructions='SUNAT_Envio_IndicadorTrasladoVehiculoM1L'">SI</xsl:when><xsl:otherwise>NO</xsl:otherwise>
											</xsl:choose>
										</font>										
									</td>
									<td width="2%"></td>
									<td width="47%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Indicador de Traslado Total de la DAM o la DS</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="2%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="//cbc:SpecialInstructions='SUNAT_Envio_IndicadorTrasladoTotalDAMoDS'">SI</xsl:when><xsl:otherwise>NO</xsl:otherwise>
											</xsl:choose>
										</font>										
									</td>
									<td width="1%"></td>
								</tr>
								<tr>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;
										</font>										
									</td>
									<td width="42%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Indicador de Retorno de Vehículo con Envases o Embalajes Vacíos</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="//cbc:SpecialInstructions='SUNAT_Envio_IndicadorRetornoVehiculoEnvaseVacio'">SI</xsl:when><xsl:otherwise>NO</xsl:otherwise>
											</xsl:choose>
										</font>										
									</td>
									<td width="2%"></td>
									<td width="47%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Indicador de Registro de Vehículos y Conductores del Transportista</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="2%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="//cbc:SpecialInstructions='SUNAT_Envio_IndicadorVehiculoConductoresTransp'">SI</xsl:when><xsl:otherwise>NO</xsl:otherwise>
											</xsl:choose>
										</font>										
									</td>
									<td width="1%"></td>
								</tr>								
							</tbody>
						</table>

					</td>					
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="Datos_Peso">

		<table border="0" width="100%" bordercolor="#000001" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							&#160;<strong>Unidad de Medida del Peso Bruto</strong>
						</font>										
					</td>
					<td width="2%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							&#160;<strong>:</strong>&#160;
						</font>										
					</td>
					<td width="70%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="//cac:Shipment/cbc:GrossWeightMeasure/@unitCode"/>
						</font>										
					</td>	
				</tr>
				<tr>
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							&#160;<strong>Peso Bruto Total de la Carga</strong>
						</font>										
					</td>
					<td width="2%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							&#160;<strong>:</strong>&#160;
						</font>										
					</td>
					<td width="70%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number(//cac:Shipment/cbc:GrossWeightMeasure,'###,###,##0.000','pen')"/>											
						</font>										
					</td>	
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template name="DatosVehiculoConductor">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>DATOS DE LOS VEHÍCULOS Y CONDUCTORES</strong></font>		
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>				
					<td vAlign="top" width="100%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>TIPO</strong>
										</font>										
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>NÚMERO DE PLACA</strong>
										</font>										
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>TIPO Y N° DE DOCUMENTO</strong>
										</font>										
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>NOMBRE DEL CONDUCTOR</strong>
										</font>										
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>NRO DE LICENCIA</strong>
										</font>										
									</td>					
								</tr>
								<xsl:for-each select="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson">
									<tr>
										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:value-of select="cbc:JobTitle"/>
											</font>										
										</td>
										<td width="20%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID"/>
											</font>										
										</td>
										<td width="20%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:choose>
													<xsl:when test="cbc:ID/@schemeID = '0'">No Domiciliado</xsl:when>
													<xsl:when test="cbc:ID/@schemeID = '1'">D.N.I.</xsl:when>
													<xsl:when test="cbc:ID/@schemeID = '4'">Carnet Extr.</xsl:when>
													<xsl:when test="cbc:ID/@schemeID = '6'">R.U.C.</xsl:when>
													<xsl:when test="cbc:ID/@schemeID = '7'">Pasaporte</xsl:when>
												</xsl:choose>&#160;
												<xsl:value-of select="cac:IdentityDocumentReference/cbc:ID"/>
											</font>										
										</td>
										<td width="20%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:value-of select="cbc:FirstName"/>&#160;<xsl:value-of select="cbc:FamilyName"/>
											</font>										
										</td>
										<td width="20%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:value-of select="cac:IdentityDocumentReference/cbc:ID"/>
											</font>										
										</td>					
									</tr>								
								</xsl:for-each>

														
							</tbody>
						</table>

					</td>					
				</tr>
				<tr>				
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000001" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;
										</font>										
									</td>						
								</tr>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>Tracto</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:call-template name="RetourneValAd">
												<xsl:with-param name="NumAd" select="04"/>
											</xsl:call-template>
										</font>										
									</td>						
								</tr>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>Carreta</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:call-template name="RetourneValAd">
												<xsl:with-param name="NumAd" select="05"/>
											</xsl:call-template>
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

	<xsl:template name="DatosTransportista">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>DATOS DEL TRANSPORTISTA</strong></font>		
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>				
					<td vAlign="top" width="100%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>Tipo y N° documento</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='-' or //cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='0'">NO DOMICILIADO</xsl:if>
											<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='6'">RUC</xsl:if>
											<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='4'">CARNET EXTR.</xsl:if>
											<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='7'">PASAPORTE</xsl:if>
											<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='A'">CED. DIP. IDENT.</xsl:if>
											&#160;
											<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
										</font>										
									</td>						
								</tr>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>Razón Social/Nombres</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>										
									</td>						
								</tr>
							</tbody>
						</table>

					</td>					
				</tr>
				<tr>				
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000001" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>Tarjeta única de circulación</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:CompanyID"/>
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

	<xsl:template name="DatosInformacionAdicional">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>INFORMACION ADICIONAL</strong></font>		
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>				
					<td vAlign="top" width="100%">
						<table rules="none" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="1">
							<tbody>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>Tipo y N° documento rel.</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='01'">FACT </xsl:when>
												<xsl:when test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='03'">BV </xsl:when>
												<xsl:when test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='07'">NC </xsl:when>
												<xsl:when test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='08'">ND </xsl:when>
												<xsl:when test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='06'">OTROS </xsl:when>
												<xsl:otherwise>-</xsl:otherwise>
											</xsl:choose>
											&#160;
											<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
										</font>										
									</td>						
								</tr>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>Observaciones</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cbc:Note"/>
										</font>										
									</td>						
								</tr>
							</tbody>
						</table>

					</td>					
				</tr>
				<tr>				
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000001" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>Configuración Vehicular</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:call-template name="RetourneValAd">
												<xsl:with-param name="NumAd" select="02"/>
											</xsl:call-template>
										</font>										
									</td>						
								</tr>
								<tr>
									<td width="22%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>Dimensión Vehicular</strong>
										</font>										
									</td>
									<td width="2%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;<strong>:</strong>&#160;
										</font>										
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:call-template name="RetourneValAd">
												<xsl:with-param name="NumAd" select="03"/>
											</xsl:call-template>
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



	<xsl:template name="DatosReceptorT">
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
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
											<xsl:call-template name="RetourneValAd">
												<xsl:with-param name="NumAd" select="03"/>	
											</xsl:call-template>
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