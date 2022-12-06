<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1"
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
				xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
				xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Total">

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
						<tr>
							<td style="border-style: solid; border-width: 1px;" width="35%" colspan="3" align="left" >
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Régimen Retención:</strong>&#160;&#160;&#160;&#160;&#160;&#160;
									<xsl:if test="//sac:SUNATRetentionSystemCode='01'">
										TASA 3%
									</xsl:if>
								</font>
							</td>		
							<td style="border-style: solid; border-width: 1px;" width="35%" colspan="3" align="left" >
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Tasa Retención:</strong>&#160;&#160;&#160;&#160;&#160;&#160;
									<xsl:value-of select="//sac:SUNATRetentionPercent"/><strong>%</strong>
								</font>
							</td>
							<td width="10%" align="center" >
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Total en (<xsl:call-template name="TipoDeMoneda_Total" />)</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number(//cbc:TotalInvoiceAmount,'###,###,##0.00','pen')"/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number(//sac:SUNATTotalPaid,'###,###,##0.00','pen')"/>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
	</xsl:template>

	
	<xsl:template name="TOTALES">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr bgcolor="silver">
							<td width="33%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VOLUMEN TOTAL</strong>
								</font>
							</td>
							<td width="34%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>TOTAL PESO</strong>
								</font>
							</td>
							<td width="33%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>TOTAL BULTOS</strong>
								</font>
							</td>
							<!--<td width="61%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>OBSERVACIONES</strong>
								</font>
							</td>-->

						</tr>

						<tr>
							<td width="33%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:call-template name="TraeValorVariable">
										<xsl:with-param name="varNumVA" select="14"/>
									</xsl:call-template>
								</font>
							</td>
							<td width="34%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="//cac:Shipment/cbc:GrossWeightMeasure"/>&#160;KGM
								</font>
							</td>
							<td width="33%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="//cac:Shipment/cbc:TotalTransportHandlingUnitQuantity"/>
								</font>
							</td>
							<!--<td width="61%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>OBS.</strong>
								</font>
							</td>-->

						</tr>

					</table>
				</td>
			</tr>
		</table>
		
	</xsl:template>

	<xsl:template name="COMFORMIDAD">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr bgcolor="silver">
							<td width="50%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>RECIBI CONFORME</strong>
								</font>
							</td>
							<td width="50%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>V° B°</strong>
								</font>
							</td>
						</tr>

						<tr>
							<td width="50%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>&#160;<br/><br/><br/></strong>
								</font>
							</td>
							<td width="50%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>&#160;<br/><br/><br/></strong>
								</font>
							</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
		
	</xsl:template>

	<xsl:template name="Cuadros">
		<br/>
		<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td width="35%">
						<table border="1" width="100%" cellpadding="0" cellspacing="0" >
							<tbody>
								<tr>
									<td width="100%" align="center" colspan="3">
										<font face="Arial, Helvetica, sans-serif" size="2">
										INFORMACIÓN ADICIONAL
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left" rowspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
										DOCUMENTO RELACIONADO AL TRASLADO
										</font>
									</td>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										TIPO: 
										</font>
									</td>
									<td width="30%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<!--<xsl:value-of select="/DespatchAdvice/cac:AdditionalDocumentReference/cbc:DocumentTypeCode"/>-->
										<xsl:call-template name="ReferenciaDocumento"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="20%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										NÚMERO: 
										</font>
									</td>
									<td width="30%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="5%">
					</td>
					<td width="25%">
						<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
							<tbody>
								<tr>
									<td width="100%" align="center" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
										BAJA DE GUIA
										</font>
									</td>
								</tr>
								<tr>
									<td width="70%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										NÚMERO GUÍA REMISIÓN: 
										</font>
									</td>
									<td width="30%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="//cac:OrderReference/cbc:ID"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="70%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										TIPO DOCUMENTO : 
										</font>
									</td>
									<td width="30%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="//cac:OrderReference/cbc:OrderTypeCode"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="5%">
					</td>
					<td width="25%">
						<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
							<tbody>
								<tr>
									<td width="100%" align="center" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
										UNIDAD TRANSPORTE / CONDUCTOR
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										TRANSPORTISTA: 
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										RUC: 
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
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
	</xsl:template>
	<xsl:template name="Simbolo_Moneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/.</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">€</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/.</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">€</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/.</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">€</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\Panasonic\Formato_PanasonicV1.1\20100165849&#x2D;01&#x2D;F301&#x2D;00000280.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"><block path="table/td/font/xsl:for&#x2D;each" x="410" y="60"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if/=[0]" x="314" y="88"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if" x="360" y="90"/><block path="table/td/font/xsl:for&#x2D;each[1]" x="300" y="30"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="204" y="58"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if" x="250" y="60"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/xsl:value&#x2D;of" x="320" y="90"/><block path="table/td/font/xsl:for&#x2D;each[2]" x="340" y="30"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="84" y="58"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if" x="130" y="60"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/xsl:value&#x2D;of" x="200" y="90"/></template><template name="Total"></template><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->