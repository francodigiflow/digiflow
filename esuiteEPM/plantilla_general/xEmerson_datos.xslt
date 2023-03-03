<?xml version="1.0" encoding="iso-8859-1"?>
<!--<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
				xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">


	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DatosCliente">
		
					<table cellSpacing="0" width="100%">
						<tr width="100%">
					<td vAlign="top">
						<xsl:call-template name="DatosReceptor"/> </td>
						</tr>
					<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
					<tr width="100%">
					<td vAlign="top">
					<!--<br/>-->
						<xsl:call-template name="Datosguia"/> </td>
						</tr>
						</xsl:if>
					</table>
					
	</xsl:template>

	<xsl:template name="DatosReceptor">
	<br/>
						<table width="100%" cellpadding="0" cellspacing="0" border="1" rules="groups" class="tipo2">
							<tbody>
								<tr>
									<td width="1%">  </td>							
									
									<td width="14%"></td>
									
									<td width="48%"></td>

									<td width="1%"></td>

									<td width="17%"></td>

									<td width="19%"></td>
								</tr>
								
								<tr>
								    <td width="1%"> </td>							
									<td width="14%"> </td>
									
									<td width="48%" valign="top" align="left">
										
									</td>

									<td width="1%"></td>

									<td width="17%">
											<b>
											Fecha de Emisión:
											</b>
									
									</td>

									<td width="19%">
											<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
											<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
											<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
									</td>
								</tr>
								
								<tr>
								    <td width="1%"> </td>							
									<td width="14%">
									 	<!--<font face="Consolas" size="1">-->
												<b> Señor(es): </b>
										<!--</font>-->
									</td>
									
									<td width="48%" valign="top" align="left">
										<!-- NOMBRE O RAZON SOCIAL DEL USUARIO O ADQUIRENTE -->
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
									</td>
                                                                             <!--cac:Party/cac:PartyLegalEntity/cbc:RegistrationName-->
									<td width="1%"></td>

									<td width="17%">
											<b>
											O/C°:
											</b>
									
									</td>

									<td width="19%">
									<xsl:if test="//cbc:UBLVersionID='2.0'">
										<xsl:call-template name="TraeValorVariable">
     										<xsl:with-param name="varNumVA" select="06"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.1'">
										<xsl:value-of select="//cac:OrderReference//cbc:ID" />
										
									</xsl:if>	
									</td>
								</tr>

							<tr>	
							<td width="1%"> </td>							
									<td width="14%">
									 	<!--<font face="Consolas" size="1">-->
												<b> Dirección: </b>
										<!--</font>-->
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<!--<font face="Consolas" size="1">-->
											<!-- DIRECCION -->
											<xsl:if test="//cbc:UBLVersionID='2.0'">
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>                                         
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											</xsl:if>
											
											<xsl:if test="//cbc:UBLVersionID='2.1'">
											<xsl:value-of select="Invoice/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:StreetName"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<!-- Nota de Credito -->
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<!-- Nota de Debito -->
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											</xsl:if>
											
										<!--</font>-->
									</td>
									<td width="1%"></td>

									<td width="17%">
									   <!-- <font face="Consolas" size="1">-->
											<b> Guía N°: </b>
										<!--</font>-->
									</td>

									<td width="19%">
									      <xsl:value-of select="/pe:Invoice/cac:DespatchDocumentReference/cbc:ID"/>
									</td>

								</tr>

								<tr>	
								<td width="1%"> </td>							
									<td width="14%">
									 	<!--<font face="Consolas" size="1">-->
												<b> <xsl:call-template name="TipoDeDocumento"/>:</b>
										<!--</font>-->
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<!--<font face="Consolas" size="1">-->
											<!-- DOCUMENTO DEL USUARIO O ADQUIRENTE -->
											<xsl:if test="//cbc:UBLVersionID='2.0'">
												<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />
											</xsl:if>
											<xsl:if test="//cbc:UBLVersionID='2.1'">
												<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" />
											</xsl:if>
										<!--</font>-->
									</td>

									<td width="1%"></td>
									
									<td width="17%">
									   <!-- <font face="Consolas" size="1">-->
											<b> Moneda: </b>
										<!--</font>-->
									</td>

									<td width="19%">
									<xsl:call-template name="TipoDeMoneda"/>	
									</td>

								</tr>
								<tr>	
									<td width="1%"> </td>							
									<td width="14%">
									 	<b>
											Condición de Pago:
										</b>
									</td>
									
									<th width="48%" cellpadding="2" valign="top" align="left">
										<xsl:call-template name="TraeValorVariable">
     										<xsl:with-param name="varNumVA" select="01"/>
										</xsl:call-template>
									</th>

									<td width="1%"></td>

									<td width="17%">
									  <b>
											Orden Venta:
										</b>
									</td>

									<td width="19%">
									  <xsl:call-template name="TraeValorVariable">
     										<xsl:with-param name="varNumVA" select="02"/>
									  </xsl:call-template>
									</td>
								</tr>
						
								
								<tr>
								    <td width="1%"> </td>							
									<td width="14%"> </td>
									
									<td width="48%" valign="top" align="left">
										
									</td>

									<td width="1%"></td>

									<td width="17%">
											<b>
											Incoterm:
											</b>
									
									</td>

									<td width="19%">
									  <xsl:call-template name="TraeValorVariable">
     										<xsl:with-param name="varNumVA" select="08"/>
									  </xsl:call-template>
									</td>
								</tr>
								
								
							</tbody>
						</table>
	</xsl:template>

	<xsl:template name="Datosguia"><!--cellpadding="0" cellspacing="0"-->
		<table width="100%" cellpadding="0" cellspacing="0" border="1" rules="groups" class="tipo2">
			<tbody>
				<xsl:if test="//cbc:UBLVersionID='2.0'">
								<tr>
									<td width="1%">  </td>							
									
									<td width="14%"></td>
									
									<td width="48%"></td>

									<td width="1%"></td>

									<td width="17%"></td>

									<td width="19%"></td>
								</tr>
								
								<tr>
								    <td width="1%"> </td>							
									<td width="14%"> 
									        <b>
											Pto. Partida:
											</b>
									</td>
									
									<td width="48%" valign="top" align="left">
										<xsl:if test="//cbc:UBLVersionID='2.0'">
											<xsl:value-of select="//cac:OriginAddress/cbc:StreetName"/>
										</xsl:if>
										<xsl:if test="//cbc:UBLVersionID='2.1'"> 
											<xsl:value-of select="//cac:OriginAddress/cbc:ID"/>
										</xsl:if>
										
									</td>

									<td width="1%"></td>

									<td width="17%">
											<b>
											Pto. Llegada:
											</b>
									
									</td>

									<td width="19%"><!--/sac:SUNATEmbededDespatchAdvice/-->
										<xsl:if test="//cbc:UBLVersionID='2.0'">
											 <xsl:value-of select="//cac:DeliveryAddress/cbc:StreetName"/>
										</xsl:if>
										<xsl:if test="//cbc:UBLVersionID='2.1'"> 
											<xsl:value-of select="//cac:DeliveryAddress/cbc:ID"/>
										</xsl:if>	 
											 
									</td>
								</tr>
								
								<tr>
								    <td width="1%"> </td>							
									<td width="14%">
									 	<!--<font face="Consolas" size="1">-->
												<b> Transportista: </b>
										<!--</font>-->
									</td>
									
									<td width="48%" valign="top" align="left">
 											
											<xsl:value-of select="//sac:SUNATCarrierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										<!-- NOMBRE O RAZON SOCIAL DEL USUARIO O ADQUIRENTE -->
											<!--<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>-->
									</td>

									<td width="1%"></td>

									<td width="17%">
											<b>
											R.U.C.:
											</b>
									
									</td>

									<td width="19%">
											<xsl:value-of select="//sac:SUNATCarrierParty/cbc:CustomerAssignedAccountID"/>
									</td>
								</tr>

							<tr>	
							<td width="1%"> </td>							
									<td width="14%">
									 	<!--<font face="Consolas" size="1">-->
												<b>Marca: </b>
										<!--</font>-->
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
										<xsl:value-of select="//cbc:BrandName"/>
										
										<!--<font face="Consolas" size="1">-->
											<!-- DIRECCION -->
											<!--<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>                                         -->
										<!--</font>-->
									</td>
									<td width="1%"></td>

									<td width="17%">
									   <!-- <font face="Consolas" size="1">-->
											<b> Nro. Placa: </b>
										<!--</font>-->
									</td>

									<td width="19%">
									<xsl:value-of select="//cbc:LicensePlateID"/>
									     <!-- <xsl:value-of select="/pe:Invoice/cac:DespatchDocumentReference/cbc:ID"/>-->
									</td>

								</tr>

								<tr>	
								<td width="1%"> </td>							
									<td width="14%">
									 	<!--<font face="Consolas" size="1">-->
												<b> Constancia de Inscripción:</b>
										<!--</font>-->
									</td>
									<td width="48%" cellpadding="2" valign="top" align="left">
	                                <xsl:value-of select="//cbc:TransportAuthorizationCode"/>
										<!--<font face="Consolas" size="1">-->
											<!-- DOCUMENTO DEL USUARIO O ADQUIRENTE -->
											<!--<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>-->
										<!--</font>-->
									</td>

									<td width="1%"></td>
									
									<td width="17%">
									   <!-- <font face="Consolas" size="1">-->
											<b> Lic. de Conducir: </b>
										<!--</font>-->
									</td>

									<td width="19%">
									<!--<xsl:call-template name="TipoDeMoneda"/>	-->
									
									<xsl:value-of select="//cac:Party/cac:PartyIdentification/cbc:ID"/>
									</td>

								</tr>
								<tr>	
									<td width="1%"> </td>							
									<td width="14%" valign="top">
									 	<b>
											Motivo Traslado:
										</b>
									</td>
									
									<td width="48%" cellpadding="2" valign="top" align="left">
										<xsl:call-template name="TraeValorVariable">
     										<xsl:with-param name="varNumVA" select="07"/>
										</xsl:call-template>
									</td>

									<td width="1%"></td>

									<td width="17%">
									  <b>
											
										</b>
									</td>

									<td width="19%">
									   
									</td>
								</tr>
								<tr>	
									<td width="1%"> </td>							
									<td width="14%" valign="top">
									 	<b>
											Destino Final:
										</b>
									</td>
									
									<td width="48%" cellpadding="2" valign="top" align="left">
										<xsl:call-template name="TraeValorVariable">
     										<xsl:with-param name="varNumVA" select="08"/>
										</xsl:call-template>
									</td>

									<td width="1%"></td>

									<td width="17%">
									  <b>
											
										</b>
									</td>

									<td width="19%">
									    
									</td>
								</tr>
				</xsl:if>
						
				<xsl:if test="//cbc:UBLVersionID='2.1'">
				<!-- <xsl:if test="//cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'"> -->
					<!-- <tr> -->
						<!-- <td width="1%">  </td> -->
						<!-- <td width="10%"></td> -->
						<!-- <td width="50%"></td> -->
						<!-- <td width="1%"></td> -->
						<!-- <td width="14%"></td> -->
						<!-- <td width="21%"></td> -->
					<!-- </tr> -->
					<!-- <tr> -->
						<!-- <td width="1%"> </td>							 -->
						<!-- <td width="10%">  -->
							<!-- <b> -->
							<!-- Pto. Partida: -->
							<!-- </b> -->
						<!-- </td> -->
						<!-- <td width="50%" valign="top" align="left"> -->
							<!-- <xsl:value-of select="//cac:Delivery/cac:Shipment/cac:OriginAddress/cac:AddressLine/cbc:Line"/>	 -->
						<!-- </td> -->
						<!-- <td width="1%"></td> -->
						<!-- <td width="14%"> -->
						<!-- <b>R.U.C.:</b> -->
						<!-- </td> -->
						<!-- <td width="21%"> -->
								<!-- <xsl:value-of select="//cac:Delivery/cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/> -->
						<!-- </td> -->
					<!-- </tr>					 -->
					<!-- <tr> -->
						<!-- <td width="1%"> </td>	 -->
						<!-- <td width="10%"> -->
							<!-- <b>Pto. Llegada:</b> -->
						<!-- </td> -->
						<!-- <td width="50%"> -->
							<!-- <xsl:value-of select="//cac:Delivery/cac:Shipment/cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>	 -->
												  
						<!-- </td>	 -->
							<!-- <td width="1%"></td> -->
							<!-- <td width="14%"> -->
							
							<!-- <b>Motivo Traslado: </b> -->
						<!-- </td> -->
						<!-- <td width="21%" cellpadding="2" valign="top" align="left"> -->
							<!-- <xsl:choose> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='01'">Venta</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='02'">Compra</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='04'">Traslado entre establecimientos de la misma empresa</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='08'">Importación</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='09'">Exportación</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='13'">Otros</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='14'">Venta sujeta a confirmación del comprador</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='18'">Traslado emisor itinerante CP</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='19'">Traslado a zona primaria</xsl:when> -->
								<!-- <xsl:otherwise>-</xsl:otherwise> -->
							<!-- </xsl:choose> -->
						<!-- </td> -->
								
					<!-- </tr> -->
					<!-- <tr>	 -->
						<!-- <td width="1%"> </td>							 -->
						<!-- <td width="10%"> -->
							<!-- <b> Transportista: </b> -->
						<!-- </td> -->
						<!-- <td width="50%" align="left"> -->
							<!-- <xsl:value-of select="//cac:Delivery/cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:RegistrationName"/> -->
						<!-- </td> -->
						<!-- <td width="1%"></td> -->
						<!-- <td width="14%"> -->
							<!-- <b>Modalidad Traslado: </b> -->
						<!-- </td> -->
						<!-- <td width="21%"> -->
							<!-- Transporte Público -->
						<!-- </td> -->
					<!-- </tr> -->
					<!-- </xsl:if> -->
					
				<!-- <xsl:if test="//cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'"> -->
					<!-- <tr> -->
						<!-- <td width="1%">  </td> -->
						<!-- <td width="10%"></td> -->
						<!-- <td width="50%"></td> -->
						<!-- <td width="1%"></td> -->
						<!-- <td width="14%"></td> -->
						<!-- <td width="21%"></td> -->
					<!-- </tr> -->
					<!-- <tr> -->
						<!-- <td width="1%"> </td>							 -->
						<!-- <td width="10%">  -->
							<!-- <b> -->
							<!-- Pto. Partida: -->
							<!-- </b> -->
						<!-- </td> -->
						<!-- <td width="50%" valign="top" align="left"> -->
							<!-- <xsl:value-of select="//cac:Delivery/cac:Shipment/cac:OriginAddress/cac:AddressLine/cbc:Line"/>	 -->
						<!-- </td> -->
						<!-- <td width="1%"></td> -->
						<!-- <td width="14%"> -->
							<!-- <b>Motivo Traslado: </b> -->
						<!-- </td> -->
						<!-- <td width="21%" cellpadding="2" valign="top" align="left"> -->
							<!-- <xsl:choose> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='01'">Venta</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='02'">Compra</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='04'">Traslado entre establecimientos de la misma empresa</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='08'">Importación</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='09'">Exportación</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='13'">Otros</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='14'">Venta sujeta a confirmación del comprador</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='18'">Traslado emisor itinerante CP</xsl:when> -->
								<!-- <xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='19'">Traslado a zona primaria</xsl:when> -->
								<!-- <xsl:otherwise>-</xsl:otherwise> -->
							<!-- </xsl:choose> -->
						<!-- </td> -->
	
					<!-- </tr>					 -->
					<!-- <tr> -->
						<!-- <td width="1%"> </td>	 -->
						<!-- <td width="10%"> -->
							<!-- <b>Pto. Llegada:</b> -->
						<!-- </td> -->
						<!-- <td width="50%"> -->
							<!-- <xsl:value-of select="//cac:Delivery/cac:Shipment/cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>	 -->
												  
						<!-- </td> -->
						<!-- <td width="1%"></td> -->
							<!-- <td width="14%"> -->
								<!-- <b>Licencia Conductor:</b> -->
							<!-- </td> -->
							<!-- <td width="21%"> -->
							<!-- <xsl:call-template name="TraeValorVariable"> -->
     							<!-- <xsl:with-param name="varNumVA" select="30"/> -->
							<!-- </xsl:call-template> -->
							<!-- </td> -->
					<!-- </tr> -->
					<!-- <tr>	 -->
						<!-- <td width="1%"> </td>							 -->
						<!-- <td width="10%"> -->
							<!-- <b> Placa Vehicular: </b> -->
						<!-- </td> -->
						<!-- <td width="50%" valign="top" align="left"> -->
							<!-- <xsl:value-of select="//cac:Delivery/cac:Shipment/cac:ShipmentStage/cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/> -->
						<!-- </td> -->
						<!-- <td width="1%"></td> -->
						<!-- <td width="14%"> -->
							<!-- <b>Modalidad Traslado: </b> -->
						<!-- </td> -->
						<!-- <td width="21%"> -->
							<!-- Transporte Privado -->
						<!-- </td> -->
					<!-- </tr> -->
					<!-- </xsl:if> -->
					
					<tr>
						<td width="1%">  </td>							
						<td width="12%"></td>
						<td width="45%"></td>
						<td width="1%"></td>
						<td width="14%"></td>
						<td width="28%"></td>
					</tr>				
					
					<tr>
					    <td width="1%"> </td>							
						<td width="12%"> 
							<b>Pto. Partida:</b>
						</td>
						<td width="48%" align="left">
							<xsl:value-of select="//cac:Delivery/cac:Shipment/cac:OriginAddress/cac:AddressLine/cbc:Line"/>&#160;
							<xsl:call-template name="TraeValorVariable">
     							<xsl:with-param name="varNumVA" select="14"/>
							</xsl:call-template>
						</td>
						<td width="1%"></td>
						<td width="14%">
							<b> Transportista: </b>
						</td>
						<td width="28%" align="left">
							<xsl:value-of select="//cac:Delivery/cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:RegistrationName"/>
						</td>
						
					</tr>
					<tr>
						<td width="1%"> </td>								
						<td width="12%"> 
							<b>Pto. Llegada:</b>
						</td>
						<td width="48%" align="left">
							<xsl:value-of select="//cac:Delivery/cac:Shipment/cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>&#160;
							<xsl:call-template name="TraeValorVariable">
     							<xsl:with-param name="varNumVA" select="13"/>
							</xsl:call-template>
						</td>
						<td width="1%"></td>		
						<td width="14%">	
							<b>R.U.C. Transp.:</b>
						</td>
						<td width="28%">
								<xsl:value-of select="//cac:Delivery/cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
						</td>
					</tr>
					<tr>
						<td width="1%"> </td>							
						<td width="12%">
							<b>Motivo Traslado: </b>
						</td>
						<td width="48%" cellpadding="2" align="left">
							<xsl:choose>
								<xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='01'">Venta</xsl:when>
								<xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='02'">Compra</xsl:when>
								<xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='04'">Traslado entre establecimientos de la misma empresa</xsl:when>
								<xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='08'">Importación</xsl:when>
								<xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='09'">Exportación</xsl:when>
								<xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='13'">Otros</xsl:when>
								<xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='14'">Venta sujeta a confirmación del comprador</xsl:when>
								<xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='18'">Traslado emisor itinerante CP</xsl:when>
								<xsl:when test="//cac:Delivery/cac:Shipment/cbc:ID='19'">Traslado a zona primaria</xsl:when>
								<xsl:otherwise>-</xsl:otherwise>
							</xsl:choose>
						</td> 
						<td width="1%"></td>
						<td width="14%">
							<b>Modalidad de Traslado: </b>
						</td>
						<td width="28%">
							<xsl:if test="//cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">
							Transporte Público
							</xsl:if> 
							<xsl:if test="//cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
								Transporte Privado
							</xsl:if> 
						</td>
					</tr>
											
				</xsl:if>
			</tbody>
		</table>
	</xsl:template>


	<xsl:template name="Dato_Notas">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000">
			<tbody>
				<tr>
					<td>
						<table border="1" width="30%" cellSpacing="0" cellPadding="1" bordercolor="#000000" rules="all" class="tipo2">
							<tbody>
                          <tr>
							<td width= "10%" align="center">
									<b>Tipo<br/>
									Documento</b>
								
							</td>
							<td width= "10%" align="center">
									<b>Serie</b>
								
							</td>
							<td width= "10%" align="center">
								
									<b>Correlativo</b>
								
							</td>
							<td width= "10%" align="center">
								
									<b>Fecha_Emisión</b>
								
							</td>
						</tr>
						<tr>
							<td width= "10%" align="center">
								
									<xsl:choose>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">BOLETA DE VENTA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
									</xsl:choose>
								
							</td>
							<td width= "10%" align="center">
								
									<xsl:value-of select="substring-before(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-')"/>
								
							</td>
							<td width= "10%" align="center">
								
									<xsl:value-of select="substring-after(//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID,'-')"/>
								
							</td>
							<td  width= "10%" align="center">
								
									<xsl:call-template name="TraeValorVariable">
						                 <xsl:with-param name="varNumVA" select="05"/>
									</xsl:call-template>
								
							</td>
							</tr>
                          
     			</tbody>
      		 </table>
			 </td>

             <td rowspan="10" width="60%">

			 </td>
								
</tr>

<tr>
<td>
   <table border="1" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none" class="tipo2">
	<tbody>
	  <tr>
		<td width="100%" align="left">
		    
		       <b>MOTIVO/SUSTENTO :
			   <br/>
			   <br/>
			   </b>
			  <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
		   
		</td>
	  </tr>
	</tbody>
    </table>
</td>
</tr>
   </tbody>
</table>


</xsl:template>

	<xsl:template name="TraeValorVariable">
		<xsl:param name="varNumVA"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
			<!-- &#160; -->
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$varNumVA">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
			<!-- &#160; -->
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$varNumVA">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
			<!-- &#160; -->
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="TipoDeDocumento">
		<xsl:if test="//cbc:UBLVersionID='2.0'">
			<xsl:choose>
				<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">NO DOMICILIADO</xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '-'">NO DOMICILIADO</xsl:when>
	            <xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '1'">DNI</xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '4'">CARNET EXTR.</xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '6'">R.U.C.</xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '7'">PASAPORTE</xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'A'">CED. DIP. IDENT.</xsl:when>
       		</xsl:choose>
		</xsl:if>
		<xsl:if test="//cbc:UBLVersionID='2.1'">
			<xsl:choose>
				<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'"><strong>NO DOMICILIADO</strong></xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'"><strong>NO DOMICILIADO</strong></xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'"><strong>DNI</strong></xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'"><strong>CARNET EXTR.</strong></xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'"><strong>RUC</strong></xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'"><strong>PASAPORTE</strong></xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'"><strong>CED. DIP. IDENT.</strong></xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'B'"><strong>DOC. IDEN. PAIS RESID. NO D.</strong></xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'C'"><strong>T.I.N.-Doc.Trib.PP.NN.</strong></xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'D'"><strong>I.N.-Doc.Trib.PP.JJ.</strong></xsl:when>
				<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'E'"><strong>TAM</strong></xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="TipoDeMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="SimboloMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\Install\EMERSON\20100020361&#x2D;01&#x2D;F011&#x2D;00000157.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->