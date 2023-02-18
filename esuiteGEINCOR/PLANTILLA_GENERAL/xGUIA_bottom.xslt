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
					<table width="100%" cellpadding="4" cellspacing="0" border="0"  style="border-top:solid 2px black;border-bottom:none">
					<tr>
						<td valign="top" align="left" width="15%" colspan="5">
						<font size="2" face="Arial, Helvetica, sans-serif">
							<strong>Documento Referenciado: </strong> <xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/>
						</font>
						</td>
						
					</tr>
					<tr>
						<td valign="top" align="left" width="15%" colspan="5">
								<font size="2" face="Arial, Helvetica, sans-serif">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='01'">
											<xsl:value-of select="pe:Valor"/>
										</xsl:if>
									</xsl:for-each> 
								</font>
						</td>
					</tr>
					</table>
					<table width="100%" cellpadding="4" cellspacing="0" border="0"  style="border-top:solid 2px black;border-bottom:none">
					<tr>
						<td valign="top" align="center" width="15%" colspan="5">
						<font size="2" face="Arial, Helvetica, sans-serif">
							 Representación Impresa - Guía de Remisión Electrónico
						</font>
						</td>
					</tr>
					</table>
					<table width="100%" cellpadding="4" cellspacing="0" border="0"  style="border-top:solid 2px black;border-bottom:none">
					<tr>
						<td valign="top" align="center"  colspan="3">
						<font size="2" face="Arial, Helvetica, sans-serif">
						Para consultar el comprobante ingrese a: 
						<strong> 
							<a href="https://facturacion.ecomprobantes.pe/GEINCOR">https://facturacion.ecomprobantes.pe/GEINCOR</a>
						</strong>
						</font>
						</td>
					</tr>
					<tr>
						<td valign="top" align="left" width="30%">
						<font size="1" face="Arial, Helvetica, sans-serif">
						 *La mercadería viaja por cuenta y riesgo del cliente.
						 <br/>*La mora en el pago causará intereses de ley vigente.
						 <br/>*Después de entregada la mercadería no se aceptan devoluciones.
						 <br/>*GEINCOR se reserva el derecho de dominio de la mercaderia hasta la cancelación total de la factura
						 <br/>*La persona que recibe la mercadería se presume el derecho que está autorizada por el representante legal para recibir y comprometer a la empresa.
						 <br/>*Este documento carece de valor si no lleva el sello de cancelado y firma autorizada
						</font>
						</td>
						<td valign="baseline" align="top" width="15%">
							<img width="120" height="120" align="center" src="data:image/*;base64,[ted_1]" />					
						</td>
						<td valign="top" align="center" width="15%">
							<font size="2"   face="Arial, Helvetica, sans-serif">
								<strong>AUTORIZADO POR:</strong> 
							</font>							
						</td>
						<td valign="TOP" width="30%"  align="center">
							<font size="2"   face="Arial, Helvetica, sans-serif">
								<strong>CONFORMIDAD DEL CLIENTE</strong> 
							</font>
							<font size="2"  face="Arial, Helvetica, sans-serif">
								<br/><br/>FIRMA:___________________________________
								<br/><br/>NOMBRE:_________________________________
								<br/><br/>DNI:_____________________________________
							</font>
							
						</td>
					</tr>
					</table>
				</td>			
			</tr>
		
			
		</table>
	</xsl:template>

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
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->