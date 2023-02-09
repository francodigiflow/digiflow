<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2">

	<xsl:template name="bottom_normal">
		<table border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td valign="baseline" width="60%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0">
							<br/>/&gt;
							<strong>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='08'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="pe:Valor"/>
										</font>
									</xsl:if>
									<xsl:if test="pe1:Codigo='08'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="pe1:Valor"/>
										</font>
									</xsl:if>
									<xsl:if test="pe2:Codigo='08'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="pe2:Valor"/>
										</font>
									</xsl:if>
								</xsl:for-each>
							</strong>Operación sujeta al sistema de pago de obligación tributaria con el <br/>
							gobierno central Bco. de la Nación Cta. Cte Nro. 00-000-333069 <br/>
                      		PRODUCTOS DE ACERO CASSADO
					  Autorizado mediante resolución XXXX " - Verifique documento: <strong>www.sunat.gob.pe</strong></font>
					</td>
					<td valign="top" width="10%" align="center"/>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="bottom_hash">
		<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td valign="top" width="50%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="1">Representación impresa de la <xsl:call-template name="tipoDoc_Footer"/>
							<br/>Podrá ser consultada en: https://factura.ecomprobantes.pe/mebol/formularios/frmInicio.aspx
							<br/>Autorizado mediante Resolución de <br/>Intendencia N° 0180050003363/SUNAT
							<br/>
							<!--<strong>Valor Resumen : </strong>
							<xsl:value-of select="//ds:DigestValue"/><br/>-->							
						</font>
					</td>
					<!-- <td valign="top" width="50%" align="center"> -->
						<!-- <font face="Arial, Helvetica, sans-serif" size="1"> -->
							<!-- <xsl:call-template name="imp_timbre"/> -->
						<!-- </font> -->
					<!-- </td> -->
				<tr>
					<td valign="top" width="50%" align="center">
						<br/>
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:call-template name="imp_timbre"/>
						</font>
					</td>
				</tr>
				</tr>
				<tr>
					<td valign="top" width="100%" align="left">
						<xsl:choose>
						<xsl:when test="/pe:Invoice">
							<xsl:call-template name="tmpMensajeFooter"/>
						</xsl:when>
						<xsl:otherwise>
							 
						</xsl:otherwise>
						</xsl:choose>
					</td>
					
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="tipoDoc_Footer">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Factura Electrónica</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Boleta de Venta Electrónica</font>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de Crédito Electrónica</font>
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de Débito Electrónica</font>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="imp_timbre">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tr align="center">
				<td width="100%" align="center">
					<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%" height="60">
						<tr align="center">
							<td valign="top" align="center" height="108">
								<font face="Arial" size="1">
									<!-- <img height="100" width="100">
									<img> 
										<xsl:attribute name="src">
											<xsl:call-template name="timbre"/>
										</xsl:attribute>
									</img> -->
									<img width="100" height="100" align="center" src="data:image/*;base64,[ted_1]" />
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
		<xsl:value-of select="pe1:CreditNote/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:Documento/pe1:Nombre"/>
		<xsl:value-of select="pe2:DebitNote/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:Documento/pe2:Nombre"/>
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

	<xsl:template name="tmpMensajeFooter">
		<!--<font face="Arial, Helvetica, sans-serif" size="1">
						*EN CASO DE NO SER PAGADO  A SU VENCIMIENTO ESTE DOCUMENTO GENERARÁ INTERESES COMPENSATORIOS Y MORATORIOS  A LAS TASAS MÁXIMAS QUE FIJE LA LEY
						<br/>
						*EL PAGO DE ESTE DOCUMENTO PUEDE SER EFECTUADO DEPOSITANDO EL IMPORTE EN NUESTRAS CTAS. CTES. O EN CASO DE PAGAR CON CHEQUE GIRARLO UNICAMENTE A LA ORDEN DE M&amp;M REPUESTOS Y SERVICIOS S.A.
						<br/>
						*LA MERCADERIA VIAJA A CUENTA Y RIESGO DEL COMPRADOR
						<br/>
						*UNA VEZ SALIDA LA MERCADERIA NO SE ACEPTAN CAMBIOS NI DEVOLUCIONES, PENALIDAD DEL 10%
						</font>-->
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->