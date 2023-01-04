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
								<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
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
								<strong>Direccion del punto de partida: </strong>
							</td>
							<td valign="top" align="left" width="40%"  >
								<xsl:value-of select="//cac:Shipment/cac:OriginAddress/cbc:StreetName"/>
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
								<strong>Direccion del punto de llegada: </strong>
							</td>
							<td valign="top" align="left" width="40%"  >
								<xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/> 
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
								<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
							</td>
							<td width="14%"  >
								<strong>Razón Social: </strong>
							</td>
							<td valign="top" align="left" width="50%"  >
								<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
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
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='02'">
										<xsl:value-of select="pe:Valor"/>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td width="20%"  >
								<strong>Placa: </strong>
							</td>
							<td align="left" width="15%"  >
								<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>
							</td>
							<td width="12%"  >
								<strong>Licencia Conductor: </strong>
							</td>
							<td valign="top" align="left" width="30%"  >
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='03'">
										<xsl:value-of select="pe:Valor"/>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						</xsl:if>

					</table>
				
				</td>
			</tr>
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\EMCURE" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->