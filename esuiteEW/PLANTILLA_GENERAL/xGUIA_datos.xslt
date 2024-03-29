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
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>PUNTO DE PARTIDA</strong></font>
									</td>
						            <td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>PUNTO DE LLEGADA</strong></font>
									</td>
									</tr>

								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<!-- <xsl:value-of select="//cac:Shipment/cac:OriginAddress/cbc:StreetName"/> -->
											<!--<xsl:value-of select="//cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:AddressLine/cbc:Line"/>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='40'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/> -->
											<!--<xsl:value-of select="//cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='41'">
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


	<xsl:template name="DatosReceptor">
	<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
	<tbody>
	<tr bgcolor="#DCDCDC">
	<td width="15%" align="center">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>NOMBRE O RAZ�N SOCIAL DESTINATARIO</strong></font>
		</td></tr></tbody></table>

		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Razon social / Apellidos y Nombres</strong></font>
									</td>
									<td width="60%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>

									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Nro. SAP</strong></font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='03'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
									</tr>

									<tr>
                                    <td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>R.U.C./DNI</strong></font>
									</td>
									<td width="60%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
											</xsl:if>
										</font>
									</td>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Motivo de Traslado</strong></font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cac:Shipment/cbc:HandlingCode"/>
										</font>
									</td>
								   </tr>

								<tr>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Direcci�n</strong></font>
									</td>
									<td width="8%" align="left" colspan="3">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='11'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each></font>
									</td>
								</tr>

								<tr>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha Emisi�n</strong></font>
									</td>
									<td width="60%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cbc:IssueDate"/>
										</font>
									</td>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha Inicio Traslado</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
 										<xsl:value-of select="//cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>
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
	<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2" >
	<tbody>
	<tr bgcolor="#DCDCDC">
		<td width="15%" align="center">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>UNIDAD DE TRANSPORTE Y CONDUCTOR</strong></font>
		</td>
		<td width="15%" align="center">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>EMPRESA TRANSPORTE</strong></font>
		</td>
	</tr>
	</tbody>
	</table>

		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="50%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>CONDUCTOR</strong></font>
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='04'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="5%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>LICENCIA</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='06'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
									 <td width="5%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>DNI</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='08'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
								    <td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>VEH�CULO</strong></font>
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='37'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
								    <td width="10%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>MARCA</strong></font>
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='38'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="5%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>PLACA</strong></font>
									</td>
									<td width="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='07'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
										    </xsl:for-each>
											</xsl:if>
											

											
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td vAlign="top" width="50%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="5%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>RAZON SOCIAL</strong></font>
									</td>
									<td width="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='43'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
											    </xsl:for-each>
											</xsl:if>											
										</font>
									</td>
								</tr>
								<tr>
                                    <td width="5%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>DIRECCI�N TRANSPORTISTA</strong></font>
									</td>
									<td width="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='39'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
                                    <td width="5%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>R.U.C.</strong></font>
									</td>
									<td width="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='44'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
											    </xsl:for-each>												
											</xsl:if>
										</font>
									</td>
								</tr>
								<tr>
                                    <td width="5%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>RUTA</strong></font>
									</td>
									<td width="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='05'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="5%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>PESO</strong></font>
									</td>
									<td width="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:Shipment/cbc:GrossWeightMeasure"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					
					
				</tr>
				<tr>
					<td width="15%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>&#160;OTROS</strong> :&#160;
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='09'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
						    </xsl:for-each>
						</font>
					</td>
					<td width="16%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>&#160;NRO. DE BULTOS</strong> :&#160;<xsl:value-of select="//cac:Shipment/cbc:TotalTransportHandlingUnitQuantity"/>

						</font>
					</td>
				</tr>
				
				
				
				
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="Cuadro_Referencias">
	<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2" >
	<tbody>
	<tr bgcolor="#DCDCDC">
		<td width="26%" align="center">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>DOCUMENTOS REFERENCIADOS</strong></font>
		</td>
		<td width="74%" align="center">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>MOTIVO DE TRASLADO</strong></font>
		</td>
	</tr>
	</tbody>
	</table>

		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="26%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>
											Tipo de Comprobante
										</strong>
										</font>
									</td>
									<td width="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
									
										<xsl:variable name="Doc_ref">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='42'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</xsl:variable>
											
											
											<xsl:choose>
												<xsl:when test="$Doc_ref='01'">FACTURA</xsl:when>
												<xsl:when test="$Doc_ref='03'">BOLETA DE VENTA</xsl:when>
												<xsl:when test="$Doc_ref='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="$Doc_ref='08'">NOTA DE DEBITO</xsl:when>
												<!-- <xsl:when test="$Doc_ref='09'">GU�A DE REMISI�N</xsl:when> -->
												<xsl:otherwise>-</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
								</tr>
								<tr>
								    <td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>
											N� de Comprobante
										</strong></font>
									</td>
									<td width="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										
										
										<!-- <xsl:if test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='06'"> -->
											<!-- <xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/> -->
										<!-- </xsl:if> -->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='09'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
                                    <td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>O/C</strong></font>
									</td>
									<td width="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:if test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='02'">
											<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
										</xsl:if>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='10'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										</font>
									</td>
							    </tr>
								<xsl:if test="//cac:OrderReference/cbc:OrderTypeCode='09'">
								<tr>
                                    <td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>GUIA DE REMISI�N</strong></font>
									</td>
									<td width="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cac:OrderReference/cbc:ID"/>							
										</font>
									</td>
							    </tr>
								</xsl:if>
								<xsl:if test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='01'">
								<tr>
									
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>D.A.M.</strong></font>
									</td>
									<td width="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
										</font>
									</td>
								</tr>
								</xsl:if>
							</tbody>
						</table>
					</td>
					<td vAlign="top" width="74%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="5%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>MOTIVO TRASLADO </strong></font>
									</td>
									<td width="40%" align="left">
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
                                    <td width="5%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>OBSERVACIONES</strong></font>
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cbc:Note"/>										
										<!-- <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional"> -->
											<!-- <xsl:if test="pe:Codigo='11'"> -->
											<!-- <xsl:value-of select="pe:Valor"/> -->
											<!-- </xsl:if> -->
										<!-- </xsl:for-each> -->
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

	<xsl:template name="Cuadro_Tramos">
	<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2" >
	<tbody>
	<tr bgcolor="#DCDCDC">
		<td width="15%" align="center">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>TRANSPORTE POR TRAMO  - TRANSBORDO </strong></font>
		</td>
		<td width="15%" align="center">
		<font face="Arial, Helvetica, sans-serif" size="2"><strong>TRANSPORTE POR TRAMO  - TRANSBORDO </strong></font>
		</td>
	</tr>
	</tbody>
	</table>

		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="50%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="6%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Tramo</strong></font>
									</td>
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:if test="$ValorTramo!=''">
												01<!-- <xsl:value-of select='01'/> -->
											</xsl:if>
										</font>
									</td>
								</tr>
								<tr>
                                    <td width="6%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Direcci�n</strong></font>
									</td>
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<!-- <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional"> -->
											<!-- <xsl:if test="pe:Codigo='12'"> -->
											<!-- <xsl:value-of select="pe:Valor"/> -->
											<!-- </xsl:if> -->
										<!-- </xsl:for-each> -->
										<xsl:value-of select="$ValorTramo"/>
										
										</font>
									</td>
							    </tr>
								<tr>
									<td width="6%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Horario</strong></font>
									</td>
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='13'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td vAlign="top" width="50%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
									<xsl:if test="$ValorTramo2!=''">
								    <td width="6%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Tramo</strong></font>
									</td>
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											02
										</font>
									</td>
									</xsl:if>
								</tr>
								<tr>
									<xsl:if test="$ValorTramo2!=''">
                                    <td width="6%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Direcci�n</strong></font>
									</td>
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson/cbc:ID"/>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='14'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										</font>
									</td>
									</xsl:if>
							    </tr>
								<tr>
									<xsl:if test="$ValorTramo2!=''">
									<td width="6%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Horario</strong></font>
									</td>
									<td width="44%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='15'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
											</xsl:for-each>
										</font>
									</td>
									</xsl:if>
								</tr>
							</tbody>
						</table>
					</td>
					
					
				</tr>				
				
			</tbody>
		</table>
	</xsl:template>

	
	
	<xsl:template name="Cuadro_Conductor_Transporte1">

	<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<table rules="groups" border="1" width="99%" cellpadding="0" cellspacing="0" bordercolor="#000001">
							<tbody>
								<tr bgcolor="#DCDCDC">
									<td width="100%" align="center" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>UNIDAD DE TRANSPORTE Y CONDUCTOR</strong>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>TRANSPORTISTA</strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:choose>
											<xsl:when test="//cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName!=''">
												<xsl:value-of select="//cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												
											</xsl:when>
											<xsl:otherwise>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='24'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
											</xsl:otherwise>
										</xsl:choose>
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
										
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>LICENCIA</strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='07'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>C.M.T.C.</strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:ShipmentStage/cac:TransportMeans/cbc:RegistrationNationalityID"/>
										</font>
									</td>
								</tr>
							</tbody>
					</table>
					<table border="0" width="99%" cellpadding="0" cellspacing="0" bordercolor="#000001">
						<tbody>
						<tr>
							<td vAlign="top" width="100%">
							<table rules="groups" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
								<tbody>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>OTROS</strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='10'">
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
					<td width="50%">
						<table rules="groups" border="1" width="99%" cellpadding="0" cellspacing="0" bordercolor="#000001">
							<tbody>
								<tr bgcolor="#DCDCDC">
									<td width="100%" align="center" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>EMPRESA TRANSPORTE</strong>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>RAZ�N SOCIAL</strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
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
										<strong>PLACA</strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>PESO</strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<!-- <xsl:value-of select="//cac:Shipment/cbc:GrossWeightMeasure"/> -->
										<xsl:value-of select="format-number(//cac:Shipment/cbc:GrossWeightMeasure,'###,###,##0.000','pen')"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>

						<table border="0" width="99%" cellpadding="0" cellspacing="0" bordercolor="#000001">
						<tbody>
							<tr>
							<td vAlign="top" width="100%">
						<table rules="groups" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<tbody>
						<tr>

									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>NRO. DE BULTOS</strong>
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:Shipment/cbc:TotalTransportHandlingUnitQuantity"/>									
										</font>
									</td>
						</tr></tbody></table>
						</td></tr></tbody></table>
					</td>
					</tr></tbody></table>
					</xsl:template>


			<xsl:template name="TipoComprobante">
				<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
				<tbody>
				<tr bgcolor="#DCDCDC">
				<td width="15%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="2"><strong>TIPO Y N�MERO DE COMPROBANTE DE PAGO</strong></font>
				</td></tr></tbody></table>

			<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="14.29%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Factura</strong></font>
									</td>
									<td width="14.29%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<!--<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>-->
										<xsl:if test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='06'">
											<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
										</xsl:if>
										
										</font>
									</td>

									<td width="14.29%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='02'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
										</font>
									</td>

									<td width="14.29%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>O/C</strong></font>
									</td>
									<td width="14.29%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<!--<xsl:value-of select="//cac:OrderReference/cbc:ID"/>-->
										<!-- <xsl:if test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='02'"> -->
											<!-- <xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/> -->
										<!-- </xsl:if> -->
										
										
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='23'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										
										</font>
									</td>

									<td width="14.29%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha</strong></font>
									</td>
									<td width="14.29%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='03'">
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

				<xsl:template name="MotivoTraslado">
				<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
				<tbody>
				<tr bgcolor="#DCDCDC">
				<td width="15%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="2"><strong>MOTIVO TRASLADO</strong></font>
				</td></tr></tbody></table>

			<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
								    <td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>MOTIVO TRASLADO</strong></font>
									</td>
									<td width="80%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:Shipment/cbc:Information"/>
										</font>
									</td>
									</tr>

									<tr>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>OBSERVACIONES</strong></font>
									</td>
									<td width="80%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='09'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>&#xA0;<xsl:value-of select="//cbc:Note"/>
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
						<xsl:when test="cbc:DocumentTypeCode='09'">GU�A DE REMISI�N</xsl:when>
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
									<strong>Régimen Retención</strong>
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
									<strong>Tasa Retención</strong>
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\PLANTILLA_GENERAL" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->