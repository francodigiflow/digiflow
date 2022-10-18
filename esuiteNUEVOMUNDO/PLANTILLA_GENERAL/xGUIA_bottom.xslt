<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">

	<xsl:template name="bottom_normal">
		<table border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					falta
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template name="bottom_hash">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td valign="baseline" width="50%" colspan="5">
				<table width="100%" cellpadding="4" cellspacing="0" border="0">
				<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
				<tr>
					<td valign="top" align="left" width="15%" colspan="5">
					<font size="2" face="Arial, Helvetica, sans-serif">
						<Strong>N° CONTENEDORES: </Strong>
						<!-- <xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID"/> -->
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='10'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
					</td>
				</tr>
				<tr>
					<td valign="top" align="left" width="15%" colspan="5">
					<font size="2" face="Arial, Helvetica, sans-serif">
						<Strong>N° PRECINTOS: </Strong>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='11'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
					</td>
				</tr>
				</xsl:if>
				<tr>
					<td valign="top" align="left" width="15%" colspan="5">
					<font size="2" face="Arial, Helvetica, sans-serif">
						<Strong>Observaciones:</Strong>
					</font>
					</td>
				</tr>
				<tr>
					<td valign="top" align="left" width="15%">
					<font size="2" face="Arial, Helvetica, sans-serif">
						<Strong>- Orden de Compra: </Strong>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='12'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
					</td>
				</tr>
				<tr>
					<td valign="top" align="left" width="15%">
					<font size="2" face="Arial, Helvetica, sans-serif">
						<Strong>- N° de Pedido: </Strong>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='13'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
					</td>
				</tr>
				<tr>
					<td valign="top" align="left" width="15%">
					<font size="2" face="Arial, Helvetica, sans-serif">
						<Strong>- Total Piezas: </Strong>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='15'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
					</td>
				</tr>
				<tr>
					<td valign="top" align="left" width="15%">
					<font size="2" face="Arial, Helvetica, sans-serif">
						<Strong>- Cantidad Total: </Strong>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='16'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
					</td>
				</tr>
				<xsl:if test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">
				<tr>
					<td valign="top" align="left" width="15%">
					<font size="2" face="Arial, Helvetica, sans-serif">
						- <xsl:value-of select="//cbc:Note"/>
					</font>
					</td>
				</tr>
				</xsl:if>
				</table>
				<table width="100%" cellpadding="4" cellspacing="0" border="0">
				<tr>
					<td valign="top" align="center" width="15%" colspan="5">
					<font size="2" face="Arial, Helvetica, sans-serif">
						 <BR/>Representación Impresa - Guía de Remisión Electrónico
					</font>
					</td>
				</tr>
				</table>
				<!-- <table width="100%" cellpadding="4" cellspacing="0" border="0"  style="border-top:solid 2px black;border-bottom:none"> -->
					<!-- <tr> -->
						<!-- <td valign="top" align="left"  colspan="2"> -->
						<!-- <font size="2" face="Arial, Helvetica, sans-serif"> -->
						<!-- Autorizado Mediante Resolución Nro 0340050005929/SUNAT -->
						<!-- </font> -->
						<!-- </td> -->
					<!-- </tr> -->
					<!-- <tr> -->
						<!-- <td valign="baseline" align="left" width="12%"> -->
							<!-- <img width="120" height="120" align="center" src="data:image/*;base64,[ted_1]" /> -->
						<!-- </td> -->
						<!-- <td valign="baseline" align="top"> -->
						<!-- <font size="2" face="Arial, Helvetica, sans-serif"> -->
						<!-- Para consultar el comprobante ingrese a: -->
						<!-- <strong>  -->
							<!-- <br/><a href="https://facturacion.ecomprobantes.pe/EMCURE">https://facturacion.ecomprobantes.pe/EMCURE</a> -->
						<!-- </strong> -->
						<!-- </font> -->
						<!-- </td> -->
					<!-- </tr> -->
				<!-- </table> -->
				</td>			
			</tr>
		
			
		</table>
	</xsl:template>


	
	<!-- <xsl:template name="bottom_hash"> -->
		<!-- <table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%"> -->
			<!-- <tbody> -->
				<!-- <tr> -->
					<!-- <td valign="baseline" width="100%" align="center"> -->
						<!-- <font face="Arial, Helvetica, sans-serif" size="1"> -->
						<!-- <br/> -->
						    <!-- Representación Impresa - Guía de Remisión Electrónico -->
							<!-- <br/>  -->
							<!-- Consultar su comprobante en <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional"> -->
								<!-- <xsl:if test="pe:Codigo='03'"> -->
										<!-- <xsl:value-of select="pe:Valor"/> -->
								<!-- </xsl:if> -->
							<!-- </xsl:for-each> -->
							<!-- <br/> -->
							<!-- Autorizado mediante Resolución de Intendencia Nro 0340050005929 / SUNAT -->
							<!-- </font> -->
					<!-- </td> -->
				<!-- </tr> -->
				<!-- <tr> -->
					<!-- <td width="100%"> -->
						<!-- <xsl:call-template name="imp_timbre"/> -->
					<!-- </td> -->
				<!-- </tr> -->
				
			<!-- </tbody> -->
		<!-- </table> -->
	<!-- </xsl:template> -->

	<xsl:template name="imp_timbre">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tr>
				<td width="40%" align="center">
					<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td align="center">
							<font face="Arial" size="1.5">
							<strong></strong> <img src="timbre.jpg" width="79" height="50"/>
							</font>
							<br/>
							<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
							<!--<strong>Una empresa de CÃ¡mara de Comercio de Lima</strong>-->
							</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	

	<xsl:template name="timbre">
		
		
	<xsl:value-of select="pe:Invoice/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
		<xsl:value-of select="'.jpg'"/>
	</xsl:template>
	
	<xsl:template name="nombreTed">
		<xsl:param name="text"/>
		<xsl:param name="largo" select="0"/>
		<xsl:variable name="largo_actual" select="string-length($text)"/>
		<xsl:choose>
			<xsl:when test="$largo_actual >= $largo">
				<xsl:value-of select="$text"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="prefix" select="concat('0', $text)"/>
				<xsl:call-template name="nombreTed">
					<xsl:with-param name="text" select="$prefix"/>
					<xsl:with-param name="largo" select="$largo"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\XML\20385353406&#x2D;09&#x2D;T001&#x2D;00000212.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->