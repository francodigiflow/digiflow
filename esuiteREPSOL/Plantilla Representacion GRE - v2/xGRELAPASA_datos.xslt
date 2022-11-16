<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2"
				
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
				exclude-result-prefixes="cac cbc ext pe sac  sac"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">
	<xsl:output method="html"
	            indent="yes"
	            encoding="ISO-8859-1"
	            omit-xml-declaration="yes"/>
	<xsl:template name="Datos_DirPuntoPartida">
		
		<table  border="0" width="100%" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td  align="left"><b><font face="Arial, Helvetica, sans-serif" size="2">Fecha Emisión</font></b></td>
					<td  align="left"><font face="Arial, Helvetica, sans-serif" size="2">:&#160;<xsl:value-of select="//cbc:IssueDate"/></font></td>
					<td  align="left"></td>
					<td  align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2">Fecha de Inicio de Traslado</font></b></td>
					<td  align="left" ><font face="Arial, Helvetica, sans-serif" size="2">:&#160;<xsl:value-of select="//cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/></font></td>
				</tr>
				<tr>
					<td  align="left"><b><font face="Arial, Helvetica, sans-serif" size="2">Hora Emisión</font></b></td>
					<td  align="left"><font face="Arial, Helvetica, sans-serif" size="2">:&#160;<xsl:value-of select="//cbc:IssueTime"/></font></td>
					<td  align="left"></td>
					<td  align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2"></font></b></td>
					<td  align="left" ><font face="Arial, Helvetica, sans-serif" size="2">&#160;</font></td>
				</tr>
				<tr>
					<td align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2">Destinatario</font></b></td>
					<td align="left" ><font face="Arial, Helvetica, sans-serif" size="2">: <xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/></font></td>
					<td align="left"></td>
					<td align="left"></td>
					<td align="left"></td>
				</tr>
				<tr>
					<td align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2">Dirección del Punto de llegada</font></b></td>
					<td align="left" colspan="4">:<font face="Arial, Helvetica, sans-serif" size="2"><xsl:value-of select="//cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/></font></td>
					<td align="left"></td>
					<td align="left"></td>
					<td align="left"></td>
				</tr>
				<tr>
					<td align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2">R.U.C.</font></b></td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="2">: <xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/></font></td>
					<td></td>
					<td align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2">Código del Destinatario</font></b></td>
					<td align="left" ><font face="Arial, Helvetica, sans-serif" size="2">:&#160;
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='01' or pe:Codigo='1'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
					</font></td>
				</tr>
				
				</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Datos_Transportista">
		<table rules="groups" border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000">
		<tbody style="font-size: 0.35cm; border:solid 1px black;font-family: Arial,Helvetica, sans-serif;" vAlign="top">
			<!-- <tbody> -->
				<tr style="border-top:none">
					<td align="left"><font face="Arial, Helvetica, sans-serif"    size="2"><b>Transportista</b></font></td>
					<td align="left" colspan="2"><font face="Arial, Helvetica, sans-serif" size="2">:&#160;<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:RegistrationName"/></font></td>
					
					<td align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2">L.C.</font></b></td>
					<td align="left" colspan="2"><font face="Arial, Helvetica, sans-serif" size="2">
					:&#160;<xsl:value-of select="//cac:ShipmentStage/cac:DriverPerson/cac:IdentityDocumentReference/cbc:ID"/></font></td>
					
				</tr>
				<tr style="border-top:none">
					<td align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2">Dirección</font></b></td>
					<td align="left" colspan="5" ><font face="Arial, Helvetica, sans-serif" size="2">:&#160;
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='03' or pe:Codigo='3'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
					</font>
					</td>
					
					
					
				</tr>
				<tr style="border-top:none">
					<td align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2">R.U.C.</font></b></td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="2">:&#160;<xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/></font></td>
					<td align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2">Conductor</font></b></td>
					<td align="left" colspan="3" ><font face="Arial, Helvetica, sans-serif" size="2">:&#160;<xsl:value-of select="//cac:ShipmentStage/cac:DriverPerson/cbc:FirstName	"/>&#160;
						<xsl:value-of select="//cac:ShipmentStage/cac:DriverPerson/cbc:FamilyName"/></font></td>
					
				</tr>
				<tr style="border-top:none">
					<td align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2">Placa(s)</font></b></td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="2">:&#160;<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID"/></font></td>
					<td align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2">Marca</font></b></td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="2">: 
					<!--<xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="4" /></xsl:call-template>-->
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='04' or pe:Codigo='4'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
					</font></td>
					<td align="left" rowspan="2"><b><font face="Arial, Helvetica, sans-serif"    size="2">Constancia de inscripción</font></b></td>
					<td  align="left" rowspan="2" ><font face="Arial, Helvetica, sans-serif" size="2">:&#160;<xsl:value-of select="//cac:CarrierParty/cac:PartyLegalEntity/cbc:CompanyID"/></font></td>
				</tr>
				<tr style="border-top:none">
					<td align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2">Peso Bruto</font></b></td>
					<td align="left" ><font face="Arial, Helvetica, sans-serif" size="2">:&#160;<xsl:value-of select="format-number(//cac:Shipment/cbc:GrossWeightMeasure,'###,###,##0.000','pen')"/> KG</font></td>
					<td align="left"><b><font face="Arial, Helvetica, sans-serif"    size="2">Nro Bultos</font></b></td>
					<td align="left" ><font face="Arial, Helvetica, sans-serif" size="2">:&#160;<xsl:value-of select="//cac:Shipment/cbc:TotalTransportHandlingUnitQuantity"/></font></td>
					
				</tr>
				</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Datos_DirPuntoPartidaDerecha">
		<table  border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000">
				<tbody>
					<tr>
						<td align="center"><b><font face="Arial, Helvetica, sans-serif"    size="2">N° Mecanizado<br/></font></b></td>
						<td align="center"><b><font face="Arial, Helvetica, sans-serif"    size="2">N° Factura<br/></font></b></td>
					</tr>
					<tr>
						<td align="center"><font face="Arial, Helvetica, sans-serif" size="2">&#160;
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='02' or pe:Codigo='2'">
											<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										    </xsl:for-each>
						</font></td>
						<td align="center"><font face="Arial, Helvetica, sans-serif" size="2">&#160;<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/></font></td>
					</tr>
				</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Datos_MotivoTraslado">
		<table rules="none" border="1" width="100%" cellpadding="2" cellspacing="0" bordercolor="#000001">
				<tbody style="font-size: 0.35cm; border:solid 1px black;font-family: Arial,Helvetica, sans-serif;" vAlign="top">
					<tr><td align="center"><b><font face="Arial, Helvetica, sans-serif"    size="2">Motivo del Traslado</font></b></td></tr>
					<tr><td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><xsl:value-of select="//cac:Shipment/cbc:HandlingCode"/> - <xsl:value-of select="//cac:Shipment/cbc:HandlingInstructions"/></font><br/></td></tr>
					<tr><td align="center"><br/></td></tr>
					
					
				</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Datos_Puntos">
		<table border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000">
		<font face="Arial, Helvetica, sans-serif"    size="2"><b>Dirección del punto de Partida:</b>&#160;<xsl:value-of select="//cac:Delivery/cac:Despatch/cac:DespatchAddress/cbc:ID"/></font> &#160;<font face="Arial, Helvetica, sans-serif" size="2"><xsl:value-of select="//cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:AddressLine/cbc:Line"/></font><br/>
			<tbody style="font-size: 0.35cm; border:solid 1px black;font-family: Arial,Helvetica, sans-serif;" vAlign="top">
			
				<tr style="border-top:none">
					<td width="70%" align="left">
						<xsl:call-template name="Datos_DirPuntoPartida"/>
					</td>
					<!-- <td width="1%">&#xA0;</td> -->
					<td width="30%" align="left">	
						<xsl:call-template name="Datos_DirPuntoPartidaDerecha"/>
						
					</td>
				</tr>
				
			</tbody>
		</table>
		<br/>
		<table  border="0" width="100%" cellpadding="2" cellspacing="0" bordercolor="#000000">
			
			<tbody valign="top"  >
				<tr>
					<td width="73%" align="left">	
						<xsl:call-template name="Datos_Transportista"/>
					</td>
					<td width="2%">&#xA0;</td>
					<td width="25%" align="left">
						<xsl:call-template name="Datos_MotivoTraslado"/>
						
					</td>
				</tr>
				
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="DatosReceptor">
		
		
	</xsl:template>
	<xsl:template name="Cuadro_Conductor_Transporte">
		
	</xsl:template>
	<xsl:template name="TipoComprobante">
		
	</xsl:template>
	<xsl:template name="MotivoTraslado">
		
		
	</xsl:template>
	<xsl:template name="ReferenciaDocumento">
		<xsl:for-each select="//cac:AdditionalDocumentReference">
			<!--<xsl:if test="cbc:DocumentTypeCode != '10'">-->
			<font face="Arial, Helvetica, sans-serif"    size="2">
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
		<xsl:param name="string"
		           select="''"/>
		<xsl:param name="times"
		           select="1"/>
		<xsl:if test="number($times) > 0">
			<xsl:value-of select="$string"/>
			<xsl:call-template name="RepeatString">
				<xsl:with-param name="string"
				                select="$string"/>
				<xsl:with-param name="times"
				                select="$times - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="ReferenciaItem">
		<table border="0"
		       width="100%"
		       cellpadding="0"
		       cellspacing="2">
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
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->