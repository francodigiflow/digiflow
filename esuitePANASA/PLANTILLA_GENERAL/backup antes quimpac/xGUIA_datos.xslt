<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	
	<xsl:variable name="Tramo2_LLEGADA">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="11"/>
		</xsl:call-template>		
	</xsl:variable>	

	<xsl:variable name="Tramo2_PARTIDA">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="10"/>
		</xsl:call-template>		
	</xsl:variable>	

	<xsl:variable name="Tramo2_CONDUCTOR">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="12"/>
		</xsl:call-template>		
	</xsl:variable>	

	<xsl:template name="DESTINARIO">
		<table border="1" width="100%" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td vAlign="top" align="left" >
						<table border="0" width="100%" cellpadding="3" cellspacing="0">
							<tbody>
								<tr>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>DESTINATARIO</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>R.U.C.</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">											
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
											</xsl:if>
										</font>
									</td>
								</tr>
								<tr>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>CLIENTE</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="7"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
								<tr>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>R.U.C.</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="8"/>
											</xsl:call-template> 
										</font>
									</td>
								</tr>
								<tr>
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>VENDEDOR</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="9"/>
											</xsl:call-template> 
										</font>
									</td>
								</tr>
								<tr>
									<!--<td width="16%" align="left">-->
									<!--<td width="18%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>FECHA EMISIÓN :&#160;</strong>
										</font>
									</td>-->
									<!--<td width="1%" align="left">-->
									<td colspan="6" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>FECHA EMISIÓN :&#160;</strong>
											<xsl:value-of select="//cbc:IssueDate"/>
											&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
											<strong>FECHA INICIO TRASLADO :&#160;</strong>
											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>
										</font>
									</td>
									<!--<td width="29%" align="left" valign="middle">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="//cbc:IssueDate"/>
										</font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>FECHA INICIO TRASLADO</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="28%" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>
										</font>
									</td>-->
								</tr>
							</tbody>
						</table>
					</td>
					
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="CHOFER">
		<table border="1" width="100%" cellpadding="3" cellspacing="0">
			<tbody>
				<tr bgcolor="silver">
					<td colspan="3" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>UNIDAD DE TRANSPORTE Y CONDUCTOR</strong>
						</font>
					</td>
				</tr>
				<tr>
					<td vAlign="top" align="left" >
						<table border="0" width="100%" cellpadding="3" cellspacing="0">
							<tbody>
								<tr>
									<td colspan="6" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>CHOFER : </strong>
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="16"/>
											</xsl:call-template> 
										</font>
									</td>
								</tr>
								<tr>
									<td colspan="6" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>N° LIC. CONDUCIR : </strong>
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="17"/>
											</xsl:call-template> 
											&#160;&#160;&#160;&#160;&#160;&#160;

											<strong>TIPO DOC : </strong>
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
									<!--<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="74%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="18"/>
											</xsl:call-template> 
										</font>
									</td>-->
								</tr>
								<tr>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>MARCA</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="18"/>
											</xsl:call-template> 
										</font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>N° DOC</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson/cbc:ID"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>N° PLACA</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID"/>
											</xsl:if>
										</font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>N° PLACA 2</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="20"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
								
								<tr>
									<td colspan="6" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>CERT.HAB VEHICULAR : </strong>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="19"/>
												</xsl:call-template> 
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cac:ApplicableTransportMeans/cbc:RegistrationNationalityID"/>
											</xsl:if>
											
										</font>
									</td>
									<!--<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="72%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="19"/>
											</xsl:call-template> 
										</font>
									</td>-->
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="PUNTOS">
		<table border="1" width="100%" cellpadding="3" cellspacing="0">
			<tbody>
				<tr bgcolor="silver">
					<td align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>PUNTOS DE ORIGEN Y DESTINO</strong>
						</font>
					</td>
				</tr>
				<tr>
					<td vAlign="top" align="left" >
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>P. PARTIDA 1</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
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
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>P. LLEGADA 1</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="//cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>												
											</xsl:if>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					
				</tr>

			<xsl:if test="//cbc:CustomizationID='1.0'">
				<tr>
					<td vAlign="top" align="left" >
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>P. PARTIDA 2</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="10"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>P. LLEGADA 2</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="11"/>
											</xsl:call-template>											
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="//cbc:CustomizationID='2.0'">
				<xsl:if test="$Tramo2_PARTIDA!=''">
					<tr>
					<td vAlign="top" align="left" >
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>P. PARTIDA 2</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$Tramo2_PARTIDA"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>P. LLEGADA 2</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="$Tramo2_LLEGADA"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				</xsl:if>
			</xsl:if>				

				
			</tbody>
		</table>
	</xsl:template>


	<xsl:template name="OBSERVACIONES">
		<table border="1" width="100%" cellpadding="3" cellspacing="0">
			<tbody>
				<tr>
					<td width="12%" align="center" bgcolor="silver" valign="middle">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>OBSERVACIONES</strong>
						</font>
					</td>
					<td width="88%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cbc:Note"/>
						</font>
					</td>

				</tr>
				
			</tbody>
		</table>
	</xsl:template>


	
	<xsl:template name="TRANSPORTISTA">
		<table border="1" width="100%" cellpadding="3" cellspacing="0">
			<tbody>
				<tr bgcolor="silver">
					<td colspan="3" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>DATOS DEL TRANSPORTISTA</strong>
						</font>
					</td>
				</tr>
				<tr>
					<td vAlign="top" align="left" >
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>NOMBRE O RAZ. SOCIAL</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="84%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
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
									<td width="15%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>R.U.C.</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="84%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>

			<xsl:if test="//cbc:CustomizationID='1.0'">
				<tr>
						<td vAlign="top" align="left" >
							<table border="0" width="100%" cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>NOMBRE O RAZ. SOCIAL</strong>
											</font>
										</td>
										<td width="1%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>:</strong>
											</font>
										</td>
										<td width="84%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="12"/>
												</xsl:call-template>
											</font>
										</td>
									</tr>
									<tr>
										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>R.U.C. </strong>
											</font>
										</td>
										<td width="1%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>:</strong>
											</font>
										</td>
										<td width="84%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="13"/>
												</xsl:call-template>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>		
			</xsl:if>
			<xsl:if test="//cbc:CustomizationID='2.0'">
				<xsl:if test="$Tramo2_CONDUCTOR!=''">
					<tr>
						<td vAlign="top" align="left" >
							<table border="0" width="100%" cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>NOMBRE O RAZ. SOCIAL</strong>
											</font>
										</td>
										<td width="1%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>:</strong>
											</font>
										</td>
										<td width="84%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="12"/>
												</xsl:call-template>
											</font>
										</td>
									</tr>
									<tr>
										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>R.U.C. </strong>
											</font>
										</td>
										<td width="1%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<strong>:</strong>
											</font>
										</td>
										<td width="84%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="13"/>
												</xsl:call-template>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>		
				</xsl:if>
			</xsl:if>
				
				
					

			</tbody>
		</table>
	</xsl:template>

	
	<xsl:template name="MOTIVOS">
		
		<table border="1" width="100%" cellpadding="3" cellspacing="0">
			<tbody>
				<tr>
					<td vAlign="top" align="left" >
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="26%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>MOTIVO DE TRASLADO</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="//cac:Shipment/cbc:HandlingCode"/>

											<xsl:choose>
												<xsl:when test="//cac:Shipment/cbc:HandlingCode = '01'">
													Venta
												</xsl:when>
												<xsl:when test="//cac:Shipment/cbc:HandlingCode = '02'">
													Compra
												</xsl:when>
												<xsl:when test="//cac:Shipment/cbc:HandlingCode = '04'">
													Traslado entre establecimientos de la misma empresa
												</xsl:when>
												<xsl:when test="//cac:Shipment/cbc:HandlingCode = '08'">
													Importación
												</xsl:when>
												<xsl:when test="//cac:Shipment/cbc:HandlingCode = '09'">
													Exportación
												</xsl:when>
												<xsl:when test="//cac:Shipment/cbc:HandlingCode = '13'">
													Otros
												</xsl:when>
												<xsl:when test="//cac:Shipment/cbc:HandlingCode = '14'">
													Venta sujeta a confirmación del comprador   
												</xsl:when>
												<xsl:when test="//cac:Shipment/cbc:HandlingCode = '18'">
													Traslado emisor itinerante CP
												</xsl:when>
												<xsl:when test="//cac:Shipment/cbc:HandlingCode = '19'">
													Traslado a zona primaria
												</xsl:when>
											</xsl:choose>
										</font>
									</td>
								</tr>
								<tr>
									<td width="26%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>DESC. TRASLADO</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
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

		<br/>
			<table border="1" width="100%" cellpadding="3" cellspacing="0">
			<tbody>
				<tr>
					<td vAlign="top" align="left" >
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="18%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>CONTENEDOR</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="33%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:if test="//cac:Shipment/cbc:HandlingCode = '09'">
													
													<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:Package/cbc:ID"/>
												</xsl:if>
											</xsl:if>
										</font>
									</td>

									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>N° D.A.M.</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="35%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:if test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode = '01'">
													<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
												</xsl:if>												
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:if test="//cac:Shipment/cbc:HandlingCode = '09'">
													<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
												</xsl:if>
											</xsl:if>
										</font>
									</td>
								</tr>
								<tr>
									<td width="18%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>PRECINTO</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td colspan="4" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">											
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="15"/>
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
		


	<xsl:template name="DatosReceptor">
		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
									<td width="15%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Punto de partida</strong></font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cac:Shipment/cac:OriginAddress/cbc:StreetName"/>
										</font>
									</td>
                                    <td width="15%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha emisión</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cbc:IssueDate"/>
										</font>
									</td>
									</tr>
									<tr>
									<td width="15%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Señor(es)</strong></font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>
                                    <td width="15%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>R.U.C.</strong></font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID"/></font>
									</td>
									
								</tr>
								<tr>
									<td width="15%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Punto de llegada</strong></font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/></font>
									</td>
									<td width="15%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha inicio traslado</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
 										<xsl:value-of select="//cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Nro. Comprobante de pago</strong></font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/></font>
									</td>
									<td width="15%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Cod. Cliente</strong></font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
 										Adicional
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


	<xsl:template name="REFERENCIAS">
		<table border="1" width="100%" cellpadding="3" cellspacing="0">
			<tbody>
				<tr>
					<td vAlign="top" align="left" >
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="18%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>N° PEDIDO: </strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="81%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="21"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
								<tr>
									<td width="18%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>N° O.C.</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="81%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="22"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
								<tr>
									<td width="18%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>N° ENTREGA</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="81%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="23"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
								<tr>
									<td width="18%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>N° TRANSPORTE</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="81%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="24"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
								<tr>
									<td width="18%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>N° FACTURA</strong>
										</font>
									</td>
									<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="81%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="25"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>

			<xsl:if test="//cac:OrderReference/cbc:OrderTypeCode = '09'">
				<tr bgcolor="silver">
					<td vAlign="top" align="left" >
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td colspan="3" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>BAJA DE GUÍA DE REMISIÓN</strong>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td vAlign="top" align="left" >
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td colspan="3" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>N° GUÍA DE REMISIÓN : </strong>
											<xsl:value-of select="//cac:OrderReference/cbc:ID"/>
										</font>
									</td>
									<!--<td width="1%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>:</strong>
										</font>
									</td>
									<td width="81%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="//cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>-->
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			
			</xsl:if>
			
			</tbody>
		</table>
	</xsl:template>


	<!--<xsl:template name="DatosTraslado">
		<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td width="100%" align="center" colspan="5">
						<font face="Arial, Helvetica, sans-serif" size="2"><strong>DATOS DEL TRASLADO</strong></font>
					</td>
				</tr>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000001" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="15%" align="right" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>MOTIVO</strong></font>
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cac:Shipment/cbc:Information"/>
										</font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>MODALIDAD</strong></font>
									</td>
									<td width="25%" align="left" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:call-template name="ModalidadTraslado" />
											<xsl:value-of select="//cac:ShipmentStage/cbc:TransportModeCode"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%" align="right" rowspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>DIRECCIÓN</strong></font>
									</td>
									<td width="5%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>PARTIDA</strong></font>
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:OriginAddress/cbc:StreetName"/></font>
									</td>
									<td width="10%" align="right" rowspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>UBIGEO</strong></font>
									</td>
									<td width="10%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>PARTIDA</strong></font>
									</td>
									<td width="25%" align="left" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">:
 										<xsl:value-of select="//cac:OriginAddress/cbc:ID"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="15%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>LLEGADA</strong></font>
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/></font>
									</td>
									<td width="20%" align="right">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>LLEGADA</strong></font>
									</td>
									<td width="25%" align="left" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">:
 										<xsl:value-of select="//cac:DeliveryAddress/cbc:ID"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>-->

	<xsl:template name="ReferenciaDocumento">

		<xsl:for-each select="//cac:AdditionalDocumentReference">
			<!--<xsl:if test="cbc:DocumentTypeCode != '10'">-->

				<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:choose>
						<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->