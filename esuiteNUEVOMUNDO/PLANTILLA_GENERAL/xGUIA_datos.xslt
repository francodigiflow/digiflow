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
		<table width="100%" cellpadding="1" cellspacing="0" border="1"  style="font-family :Calibri,sans-serif;font-size:12px;color:#000000">			
			<tr>
				<td>
				<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
				<table width="100%" cellpadding="1" cellspacing="0" border="0">
				<!-- <xsl:for-each select="/pe:Invoice/cac:InvoiceLine"> -->
					<tr>
						<td width="15%">
							<strong>Proveedor:</strong>
						</td>
						<td width="45%"  >
							<xsl:value-of select="//cac:DespatchSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
						</td>
						<td width="15%"  >
							<strong>Consignatario:</strong>
						</td>
						<td width="25%"  >
							<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
						</td>
					</tr>
					<tr>
						<td width="15%"  >
							<strong>R.U.C.:</strong>
						</td>
						<td width="45%"  >
							<xsl:value-of select="//cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID"/>
						</td>
						<td width="15%"  >
							<strong>Dirección:</strong>
						</td>
						<td width="25%" rowspan="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='01'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
						    </xsl:for-each>
						</td>
					</tr>
					<tr>
						<td width="15%"  >
							<strong>Dirección:</strong>
						</td>
						<td width="45%"  >
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='02'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
						    </xsl:for-each>	
						</td>
						<td width="15%"  >
							<!-- <strong>Dirección: </strong> -->
						</td>
						<td width="25%">
							
						</td>
					</tr>
					<tr>
						<td width="15%"  >
							<strong>Direcc. Pto Partida:</strong>
						</td>
						<td width="45%"  >
							<xsl:value-of select="//cac:Shipment/cac:OriginAddress/cbc:StreetName"/>	
						</td>
						<td width="15%"  >
							<strong>Almacen/Bodegaje:</strong>
						</td>
						<td width="25%">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='03'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
						    </xsl:for-each>
						</td>
					</tr>
					<tr>
						<td width="15%">
							<strong>Direcc. Pto Llegada:</strong>
							
						</td>
						<td width="45%"  >
							<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/>
						</td>
						<td width="15%"  >
							<strong>R.U.C. Almacen:</strong>
						</td>
						<td width="25%">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='14'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
						    </xsl:for-each>
						</td>
					</tr>
					<tr>
						<td width="15%">
							<strong>Fecha de Emision:</strong>						
						</td>
						<td width="45%">
							<xsl:value-of select="//cbc:IssueDate"/>						
						</td>
						<td width="15%">
							<strong>Dirección:</strong>	
						</td>
						<td width="25%"  rowspan="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='04'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
						    </xsl:for-each>
						</td>
					</tr>
					<tr>
						<td width="15%">
							<strong>Fecha de Traslado:</strong>						
						</td>
						<td width="45%">
							<xsl:value-of select="//cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>					
						</td>
						<td width="15%">
							
						</td>
						<td width="25%">
							
						</td>
					</tr>
					<tr>
						<td width="15%">
							<strong>Agencia de aduana:</strong>						
						</td>
						<td width="45%">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='05'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
						    </xsl:for-each>			
						</td>
						<td width="15%">
							
						</td>
						<td width="25%">
							
						</td>
					</tr>
					<tr>
						<td width="15%">
							<strong>Motivo Traslado:</strong>						
						</td>
						<td width="45%">
							<xsl:value-of select="//cac:Shipment/cbc:Information"/>			
						</td>
						<td width="15%">
							<strong>Peso Total de la Guía:</strong>
						</td>
						<td width="25%">
							<xsl:value-of select="//cac:Shipment/cbc:GrossWeightMeasure"/>
						</td>
					</tr>
				</table>
				</xsl:if>
				<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">	
					<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">
					<table width="100%" cellpadding="1" cellspacing="0" border="0">
					<tr>
						<td width="12%">
							<strong>Cliente:</strong>
						</td>
						<td width="88%" colspan="3">
							<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
						</td>
					</tr>
					<tr>
						<td width="12%"  >
							<strong>R.U.C.:</strong>
						</td>
						<td width="88%" colspan="3">
							<xsl:value-of select="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID"/>
						</td>
					</tr>
					<tr>
						<td width="12%"  >
							<strong>Dirección:</strong>
						</td>
						<td width="88%" colspan="3">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='02'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
						    </xsl:for-each>
						</td>
					</tr>
					<tr>
						<td width="12%"  >
							<strong>Direcc. Pto Partida:</strong>
						</td>
						<td width="88%" colspan="3">
							<xsl:value-of select="//cac:Shipment/cac:OriginAddress/cbc:StreetName"/>	
						</td>
					</tr>
					<tr>
						<td width="12%">
							<strong>Direcc. Pto Llegada:</strong>
						</td>
						<td width="88%" colspan="3">
							<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/>	
						</td>
					</tr>
					<tr>
						<td width="12%">
							<strong>Fecha de Emision:</strong>						
						</td>
						<td width="88%" colspan="3">
							<xsl:value-of select="//cbc:IssueDate"/>						
						</td>
					</tr>
					<tr>
						<td width="12%">
							<strong>F. entrega de bienes al transportista:</strong>						
						</td>
						<td width="88%" colspan="3">
							<xsl:value-of select="//cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>					
						</td>
					</tr>
					<tr>
						<td width="12%"  >
							<strong>Motivo de Traslado:</strong>
						</td>
						<td width="35%"  >
							<!-- <xsl:value-of select="//cac:Shipment/cbc:HandlingCode"/> -->
							<xsl:value-of select="//cac:Shipment/cbc:Information"/>
						</td>
						<td width="15%"  >
							<strong>Peso Total de la Guía:</strong>
						</td>
						<td width="15%"  >
							<xsl:value-of select="//cac:Shipment/cbc:GrossWeightMeasure"/>
						</td>
					</tr>
					</table>
					</xsl:if>
					
					<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
					<table width="100%" cellpadding="1" cellspacing="0" border="0">
					<tr>
						<td width="12%"  >
							<strong>Cliente:</strong>
						</td>
						<td width="88%" colspan="3">
							<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
						</td>
					</tr>
					<tr>
						<td width="12%"  >
							<strong>R.U.C.:</strong>
						</td>
						<td width="88%" colspan="3">
							<xsl:value-of select="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID"/>
						</td>
					</tr>
					<tr>
						<td width="12%"  >
							<strong>Dirección:</strong>
						</td>
						<td width="88%" colspan="3">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='02'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
						    </xsl:for-each>
						</td>
					</tr>
					<tr>
						<td width="12%"  >
							<strong>Direcc. Pto Partida:</strong>
						</td>
						<td width="88%" colspan="3">
							<xsl:value-of select="//cac:Shipment/cac:OriginAddress/cbc:StreetName"/>	
						</td>
					</tr>
					<tr>
						<td width="12%">
							<strong>Direcc. Pto Llegada:</strong>
						</td>
						<td width="88%" colspan="3">
							<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/>
						</td>
					</tr>
					<tr>
						<td width="12%">
							<strong>Fecha de Emision:</strong>						
						</td>
						<td width="88%" colspan="3">
							<xsl:value-of select="//cbc:IssueDate"/>						
						</td>
					</tr>
					<tr>
						<td width="12%">
							<strong>F. Inicio de Traslado:</strong>						
						</td>
						<td width="88%" colspan="3">
							<xsl:value-of select="//cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>					
						</td>
					</tr>
					<tr>
						<td width="12%"  >
							<strong>Motivo de Traslado:</strong>
						</td>
						<td width="35%"  >
							<!-- <xsl:value-of select="//cac:Shipment/cbc:HandlingCode"/> -->
							<xsl:value-of select="//cac:Shipment/cbc:Information"/>
						</td>
						<td width="15%"  >
							<strong>Peso Total de la Guía:</strong>
						</td>
						<td width="15%"  >
							<xsl:value-of select="//cac:Shipment/cbc:GrossWeightMeasure"/>
						</td>
					</tr>
					</table>
					</xsl:if>
				</xsl:if>	
				</td>	
			</tr>	
		</table>

	</xsl:template>
	

	<xsl:template name="Cuadro_Conductor_Transporte">
	<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2" >
	<tbody>
	<tr bgcolor="#DCDCDC">
		<td width="90%" align="center">
		<font face="Arial, Helvetica, sans-serif" size="2">
			<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
				<strong>TRANSPORTE</strong>
			</xsl:if>
			<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">
				<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">
					<strong>TRANSPORTE PUBLICO</strong>
				</xsl:if>
				<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
					<strong>TRANSPORTE PRIVADO</strong>
				</xsl:if>
			</xsl:if>
		</font>
		</td>
	</tr>
	</tbody>
	</table>

		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001" style="font-family :Calibri,sans-serif;font-size:12px;color:#000000">
			<tbody>
				<tr>
					<td vAlign="top" width="90%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="2">
							<tbody>
							<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
								<tr>
									<td width="15%"  >
										<strong>Empresa de transporte:</strong>
									</td>
									<td valign="top" align="left" width="80%"  >
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
									</td>
								</tr>
								<tr>
									<td width="15%"  >
										<strong>R.U.C.:</strong>
									</td>
									<td align="left" width="80%"  >
									<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
									</xsl:if>
									<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
										<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
										</xsl:if>
										<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">
											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson/cbc:ID"/>
										</xsl:if>
									</xsl:if>
									</td>
								</tr>
								<tr>
									<td width="15%"  >
										<strong>Marca y placa:</strong>
									</td>
									<td align="left" width="80%"  >
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='06'">
											<xsl:value-of select="pe:Valor"/>
										</xsl:if>
									</xsl:for-each>
									-<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>
									</td>
								</tr>
								<tr>
									<td width="15%"  >
										<strong>Certificado del MTC:</strong>
									</td>
									<td align="left" width="80%"  >
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='07'">
											<xsl:value-of select="pe:Valor"/>
										</xsl:if>
									</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td width="15%"  >
										<strong>Nombre del chofer:</strong>
									</td>
									<td align="left" width="80%"  >
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='08'">
											<xsl:value-of select="pe:Valor"/>
										</xsl:if>
									</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td width="15%"  >
										<strong>Licencia:</strong>
									</td>
									<td align="left" width="80%"  >
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='09'">
											<xsl:value-of select="pe:Valor"/>
										</xsl:if>
									</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">
								<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">	
								<tr>
									<td width="12%"  >
										<strong>Transportista: </strong>
									</td>
									<td valign="top" align="left" width="80%"  >
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
									</td>
								</tr>
								<tr>
									<td width="12%"  >
										<strong>R.U.C.: </strong>
									</td>
									<td align="left" width="80%"  >
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
									</td>
								</tr>
								</xsl:if>
								<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
									<tr>
										<td width="15%"  >
											<strong>Marca y placa:</strong>
										</td>
										<td align="left" width="35%"  >
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='06'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
											-<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>
										</td>
										<td width="15%"  >
											<strong>Conductor:</strong>
										</td>
										<td align="left" width="35%"  >
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='08'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td width="15%"  >
											<strong>Certificado del MTC:</strong>
										</td>
										<td align="left" width="35%"  >
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='07'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										</td>
										<td width="15%"  >
											<strong>Licencia:</strong>
										</td>
										<td align="left" width="35%"  >
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='09'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
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

	
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\EMCURE" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->