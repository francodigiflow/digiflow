<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DatosReceptor">
	
	
	<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
	<!--EXPORTACION -->
	<xsl:call-template name="DatosReceptor_Exportacion"/>
</xsl:if>
	<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">
		<!--NACIONAL -->
		<xsl:call-template name="DatosReceptor_Nacional"/>
	</xsl:if>
	
	</xsl:template>
<xsl:template name="DatosReceptor_Nacional">
<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
<tbody>
<tr>
<td>

<table border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
	<tr>
			<td width="15%">
				<b>&#xA0;Señores</b>
			</td>
			<td width="30%">:&#xA0;
				<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
			</td>
			<td  width="10%"> </td>
			<td  width="15%">
				<b>&#xA0;Cod. Cli.</b>
			</td>
			<td  width="30%">:&#xA0;
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='01' and pe:Valor!='-'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
				</xsl:for-each>
			</td>
		</tr>
		<tr>
			<td width="15%"><b>&#xA0; R.U.C.</b></td>
			<td width="30%">:&#xA0;<xsl:value-of select="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID"/> </td>
			<td width="10%"> </td>
			<td width="15%"><b>&#xA0; Alm.</b></td>
			<td width="30%">:&#xA0;<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='02' and pe:Valor!='-'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
				</xsl:for-each> </td>
		</tr>
		<tr>
			<td width="15%"><b>&#xA0; Dirección</b></td>
			<td width="30%" colspan="2">:&#xA0;
				<!-- CALLE LUIS GALVANI 144 URB. STA ROSA ATE, LIMA-->
			<xsl:value-of select="//cac:Shipment/cac:OriginAddress/cbc:StreetName"/>
			</td>
			
			<td width="15%"><b>&#xA0; Fecha Inicio Traslado</b></td>
			<td width="20%">:&#xA0;
			<!--<xsl:value-of select="//DespatchAdvice/cac:Shipment/cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/> -->
			<xsl:value-of select="//cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/>
			</td>
			
			
		</tr>
		<tr>
			<td width="15%"><b>&#xA0; Fecha Emisión</b></td>
			<td width="30%">:&#xA0;<xsl:value-of select="//cbc:IssueDate"/></td>
			<td width="10%"> </td>
			<td width="15%"><b>&#xA0; O/C</b></td>
			<td width="30%">:&#xA0;<xsl:value-of select="//pe:DespatchAdvice/cac:AdditionalDocumentReference/cbc:ID"/></td>
		</tr>
		<tr>
			<td width="15%" ><b>&#xA0; Motivo Traslado</b></td>
			<td width="30%" colspan="2">:&#xA0;<xsl:value-of select="//pe:DespatchAdvice/cac:Shipment/cbc:Information"/></td>
			

			
			
		</tr>
</table>
<br/>
</td>
</tr>
</tbody>
</table>

</xsl:template>

<xsl:template name="DatosReceptor_Exportacion">
<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
<tbody>
<tr>
<td>
<br/>
<table border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
	<tr>
			<td width="15%"><b>&#xA0;Señores</b></td>
			<td width="30%">:&#xA0;<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/> </td>
			<td  width="10%"> </td>
			<td  width="15%"><b>&#xA0;Cod. Cli.</b></td>
			<td  width="30%">:&#xA0;<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='01' and pe:Valor!='-'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
				</xsl:for-each>
			</td>
		</tr>
		<tr>
			<td width="15%"><b>&#xA0; R.U.C.</b></td>
			<td width="30%">:&#xA0;<xsl:value-of select="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID"/> </td>
			<td width="10%"> </td>
			<td width="15%"><b>&#xA0; Alm.</b></td>
			<td width="30%">:&#xA0;<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='02' and pe:Valor!='-'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
				</xsl:for-each> </td>
		</tr>
		<tr>
			<td width="15%"><b>&#xA0; Dirección</b></td>
			<td width="30%">:&#xA0;-</td>
			<td width="10%"> </td>
			<td width="15%"><b>&#xA0;</b></td>
			<td width="30%">&#xA0;</td>
			<!--
			<td width="15%"><b>&#xA0; Fecha Inicio Traslado</b></td>
			<td width="30%">:&#xA0;<xsl:value-of select="//DespatchAdvice/cac:Shipment/cac:ShipmentStage/cac:TransitPeriod/cbc:StartDate"/></td>
			-->
			
		</tr>
		<tr>
			<td width="15%"><b>&#xA0; Fecha Emisión</b></td>
			<td width="30%">:&#xA0;<xsl:value-of select="//cbc:IssueDate"/></td>
			<td width="10%"> </td>
			<td width="15%"><b>&#xA0; O/C</b></td>
			<td width="30%">:&#xA0;<xsl:value-of select="//pe:Invoice/cac:OrderReference/cbc:ID"/></td>
		</tr>
		<tr>
			<td width="15%"><b>&#xA0; Motivo Traslado</b></td>
			<td width="30%">:&#xA0;<xsl:value-of select="//pe:DespatchAdvice/cac:Shipment/cbc:Information"/></td>
			

			
			
		</tr>
</table>
<br/>
</td>
</tr>
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->