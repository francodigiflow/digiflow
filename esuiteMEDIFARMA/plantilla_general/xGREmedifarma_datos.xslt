<?xml version='1.0' encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
				xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
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
<!-- Punto de partida -->   <td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>PUNTO DE PARTIDA</strong></font>
							</td>
							<td width="44%" align="left" >
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
<xsl:if test="//cbc:CustomizationID='2.0'">
	<xsl:value-of select="//cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:AddressLine/cbc:Line"/>
</xsl:if>
<xsl:if test="//cbc:CustomizationID='1.0'">
	<xsl:value-of select="//cac:Shipment/cac:OriginAddress/cbc:StreetName"/>
</xsl:if>
							   </font>
							</td>
							
							<td width="10%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>ENTREGA SAP</strong></font>
							</td>
							<td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
 							      <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="2" /></xsl:call-template>
							   </font>
							</td>

      <td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>FECHA DE EMISIÓN</strong></font>
							</td>
							<td width="10%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
							      <xsl:value-of select="//cbc:IssueDate"/>
							   </font>
							</td>
						 </tr>
						 <tr>
<!-- Punto de Llegada -->   <td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>PUNTO DE LLEGADA</strong></font>
							</td>
							<td width="44%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
							      <!--<xsl:if test="//cbc:CustomizationID='2.0'">
	<xsl:value-of select="//cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>
</xsl:if>
<xsl:if test="//cbc:CustomizationID='1.0'">
	 <xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/>
</xsl:if>-->
	<xsl:if test="//cbc:CustomizationID='2.0'">
	<!--<xsl:value-of select="//cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>-->
 <xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
 	<xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="27" /></xsl:call-template>
 </xsl:if>
<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">
	<xsl:value-of select="//cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>
 </xsl:if>
</xsl:if>
<xsl:if test="//cbc:CustomizationID='1.0'">
	 <xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/>
</xsl:if>
										
							   </font>
							</td>
<!-- Referencia -->			<td width="10%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>REFERENCIA</strong></font>
							</td>
							<td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
 							      <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="4" /></xsl:call-template>
							   </font>
							</td>
<!-- Fecha Entrega -->		<td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>FECHA ENTREGA</strong></font>
							</td>
							<td width="10%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
							      <xsl:value-of select="concat(substring($varFechEntrega,7,4),'-',substring($varFechEntrega,4,2),'-',substring($varFechEntrega,1,2))" />
							   </font>
							</td>
						 </tr>
						 <tr>
<!-- Motivo de traslado -->	<td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>MOTIVO DE TRASLADO</strong></font>
							</td>
							<td width="44%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
							    <xsl:if test="//cbc:CustomizationID='2.0'">
	<xsl:value-of select="//cac:Shipment/cbc:HandlingInstructions"/>
</xsl:if>
<xsl:if test="//cbc:CustomizationID='1.0'">
	  <xsl:value-of select="//cac:Shipment/cbc:Information"/>
</xsl:if>
							   </font>
							</td>
<!-- Nro Bultos -->			<td width="10%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>NRO. BULTOS</strong></font>
							</td>
							<td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
							      <!--<xsl:value-of select="$varNroBulto" />-->
								    <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="14" /></xsl:call-template>
							   </font>
							</td>
<!-- AlmacÃ©n -->			<td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>ALMACÉN</strong></font>
							</td>
							<td width="10%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
							      <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="17" /></xsl:call-template>
							   </font>
							</td>
						 </tr>
						 <tr>
<!-- TIPO DE VENTA -->		<td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>TIPO DE VENTA:</strong></font>
							</td>
							<td width="44%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
							      <xsl:value-of select="$varTipoVentaGuia"/>
							   </font>
							</td>
<!-- Nro Pallets -->		<td width="10%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>NRO. PALLETS</strong></font>
							</td>
							<td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
							      <xsl:value-of select="$varNroPallets" />
							   </font>
							</td>
<!-- O/C -->				<td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>O/C</strong></font>
							</td>
							<td width="10%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
							      <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="1" /></xsl:call-template>
							   </font>
							</td>
						 </tr>
 						 <tr>
<!-- ObservaciÃ³n -->	    <td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>OBSERVACIÓN</strong></font>
							</td>
							<td width="44%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
							      <xsl:value-of select="//cbc:Note"/>
							   </font>
							</td>
<!-- PESO TOTAL -->			<td width="10%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>PESO TOTAL (KG)</strong></font>
							</td>
							<td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
							      <xsl:value-of select="$varPesoTotalTras" />
							   </font>
							</td>
<!-- NRO. PEDIDO -->		<td width="12%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1"><strong>NRO.PEDIDO</strong></font>
							</td>
							<td width="10%" align="left">
							   <font face="Arial, Helvetica, sans-serif" size="0.1">:
							      <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="16" /></xsl:call-template>
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
				<font face="Arial, Helvetica, sans-serif" size="0.1">
					<xsl:choose>
						<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\out\xml\20100018625&#x2D;09&#x2D;T001&#x2D;00000027.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->