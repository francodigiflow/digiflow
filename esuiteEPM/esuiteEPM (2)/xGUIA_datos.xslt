<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DatosReceptor">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tbody>
				<tr>
					<!-- td -->
					<td valign="top" width="100%">
						<!-- table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000" -->
						<table border="1" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<!-- Motivo de traslado -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>Cliente</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>Fecha Emisión</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="//cbc:IssueDate"/>
										</font>
									</td>
								</tr>
								<tr>
									<!-- TIPO DE VENTA -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>R.U.C./D.N.I.</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
										</font>
									</td>
									<!-- PESO TOTAL -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>O/C</strong>
										</font>
									</td>
									<td width="38%" align="left" colspan="3">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="04"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
								<tr>
									<!-- Punto de partida -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>Domicilio Fiscal</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="05"/>
											</xsl:call-template>
										</font>
									</td>

									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>Doc. Ref.</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="05"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
								<tr>
									<!-- Punto de partida -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>Ticket</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="06"/>
											</xsl:call-template>
										</font>
									</td>

									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr bgcolor="gray">

					<td align="center" valign="middle">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>DATOS DE ENTREGA Y TRANSPORTE</strong>
						</font>
					</td>
				</tr>
				<tr>
					<!-- td -->
					<td valign="top" width="100%">
						<!-- table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000" -->
						<table border="1" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>

								<tr>
									<!-- Punto de Llegada -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>Punto de partida</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>
										</font>
									</td>
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>Punto de llegada</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:AddressLine/cbc:Line"/>
										</font>
									</td>
								</tr>
								<tr>
									<!-- Motivo de traslado -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>Transportista</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>R.U.C.</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
										</font>
									</td>
								</tr>
								
								<tr>
									<!-- TIPO DE VENTA -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>Conductor</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson/cbc:FirstName"/>&#xA0;<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson/cbc:FamilyName"/></font>
									</td>
									<!-- PESO TOTAL -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>Licencia</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson/cac:IdentityDocumentReference/cbc:ID"/>
										</font>
									</td>
								</tr>
								<tr>
									<!-- TIPO DE VENTA -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>N° Placa</strong>
										</font>
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID"/>
											<xsl:if test="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cac:AttachedTransportEquipment/cbc:ID">
												/ / <xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cac:AttachedTransportEquipment/cbc:ID"/>
											</xsl:if>
										</font>
									</td>
									<!-- PESO TOTAL -->
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>Marca</strong>
										</font>
									</td>
									<td width="32%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="06"/>
											</xsl:call-template>
										</font>
									</td>
								</tr>
								<tr>
									<!-- TIPO DE VENTA -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<strong>Inscripción MTC</strong>
										</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:CompanyID"/>
											<xsl:variable name="Adic09">
											<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="09"/>
											</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$Adic09">
												/ / <xsl:value-of select="$Adic09"/>
											</xsl:if>
										</font>
									</td>
									<!-- PESO TOTAL -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">&#xA0;</font>
									</td>
									<td width="38%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											&#xA0;</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr bgcolor="gray">

					<td align="center">

						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>DATOS DEL TRASLADO</strong>
						</font>
					</td>
				</tr>
				<tr>
					<!-- td -->
					<td valign="top" width="100%">
						<!-- table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000" -->
						<table border="1" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>

								<tr>
									<!-- Motivo de traslado -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">Motivo de traslado</font>
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:<xsl:value-of select="//cac:Shipment/cbc:HandlingCode"/>-<xsl:value-of select="//cac:Shipment/cbc:HandlingInstructions"/></font>
									</td>
									<!-- Nro Bultos -->
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">Fecha de entrega de bienes al transportista</font>
									</td>
									<td width="32%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/></font>
									</td>
								</tr>
								<tr>
									<!-- ObservaciÃ³n -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">Modalidad de transporte</font>
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:<xsl:call-template name="tmpModalidadTraslado"/></font>
									</td>
									<!-- Nro Pallets -->
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">Peso bruto</font>
									</td>
									<td width="32%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="$varPesoTotalTras"/>
										</font>
									</td>
								</tr>
								<tr>
									<!-- TIPO DE VENTA -->
									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">Observaciones</font>
									</td>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:<xsl:value-of select="//cbc:Note"/></font>
									</td>
									<!-- PESO TOTAL -->
									<td width="16%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">N° bultos</font>
									</td>
									<td width="32%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="$varNroBulto"/>
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

			<font face="Arial, Helvetica, sans-serif" size="1">
				<xsl:choose>
					<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
					<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA</xsl:when>
					<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
					<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
					<xsl:otherwise>Documento NN</xsl:otherwise>
				</xsl:choose>&#xA0;
				<xsl:value-of select="cbc:ID"/>
			</font>


			<!--<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:value-of select="cbc:ID"/>
				</font>-->
			<!--</xsl:if>-->
		</xsl:for-each>

		<!--	<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
			<xsl:if test="cbc:DocumentTypeCode != '10'">
				<font face="Arial, Helvetica, sans-serif" size="1">
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

				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="concat($attribute,substring-after(cbc:ID,'-'))"/></font>
			</xsl:if>
		</xsl:for-each>-->
	</xsl:template>


	<xsl:template name="RepeatString">
		<xsl:param name="string" select="''"/>
		<xsl:param name="times" select="1"/>

		<xsl:if test="number($times) &gt; 0">
			<xsl:value-of select="$string"/>
			<xsl:call-template name="RepeatString">
				<xsl:with-param name="string" select="$string"/>
				<xsl:with-param name="times" select="$times - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<!-- xsl:template name="ReferenciaItem">

		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td -->


	<!--<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">-->
	<!--<tr>
							<td width="20%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>RÃ©gimen RetenciÃ³n</strong>
								</font>
							</td>
							<td width="80%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:if test="//sac:SUNATRetentionSystemCode='01'">
										TASA 3%
									</xsl:if>

								</font>
							</td>
						</tr>-->
	<!--<tr>
							<td width="20%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Tasa RetenciÃ³n</strong>
								</font>
							</td>
							<td width="80%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="//sac:SUNATRetentionPercent"/>
										
								</font>
							</td>
						</tr>-->
	<!--<tr>-->
	<!--<td width="20%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>TOTAL PAGADO DE CRE</strong>
								</font>
							</td>
							<td width="80%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									
										<xsl:value-of select="format-number(//sac:SUNATTotalPaid,'###,###,##0.00','pen')"/>
								</font>
							</td> -->
	<!--</tr>-->
	<!--<tr>-->
	<!--	<td width="20%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>TOTAL RETENIDO DE CRE</strong>
								</font>
							</td>
							<td width="80%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									
										<xsl:value-of select="format-number(//cbc:TotalInvoiceAmount,'###,###,##0.00','pen')"/>
								</font>
							</td> -->
	<!--</tr>-->
	<!--</table>-->


	<!-- /td>
			</tr>
		</table>
	</xsl:template -->
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20257364357-09-TAA1-00000002.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="">
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bGenerateByteCode" value="true"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="sInitialMode" value=""/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->