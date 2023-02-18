<?xml version="1.0" encoding="iso-8859-1"?>
	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:template name="bottom_hash">		
		<table border="1" cellSpacing="0" borderColor="#ffffff" cellPadding="1" width="100%" rules="none">
		<tbody>
						<tr>
							<td width="100%">
							<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
							<tbody>
								<tr>
									<td align="center">
										<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
										    <!--<img width="100" height="100">
												<xsl:attribute name="src">
													<xsl:call-template name="timbre"/>
												</xsl:attribute>
											</img>-->

											<img width="100" height="100" align="center" src="data:image/*;base64,[ted_1]" />

											<br/>
											<br/>Representación impresa de la
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">Factura Electrónica</xsl:when>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">Boleta de Venta Electrónica</xsl:when>
												<xsl:when test="/pe1:CreditNote">Nota de Crédito Electrónica</xsl:when>
												<xsl:when test="/pe2:DebitNote">Nota de Dédito Electrónica</xsl:when>
												<xsl:otherwise></xsl:otherwise>
											</xsl:choose>
											<br/>Existe la posibilidad que SUNAT rechace el documento, lo cual requiere un cambio en el número de este comprobante
											<br/>Podra ser consultada en: <a href="https://solana.ecomprobantes.pe/SOLANA">https://solana.ecomprobantes.pe/SOLANA</a>
											
										</font>	
									</td>
								</tr>
								</tbody>
							 </table>
							</td>
									
								</tr>
								</tbody>
							 </table>
							<!--<td width="30%">
								&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
							</td>-->
							
						
	</xsl:template>

	<xsl:template name="aviso">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Factura Electrónica</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Boleta Electrónica</font>
			</xsl:when>
			<xsl:when test="/pe1:CreditNote">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de Crédito Electrónica</font>
			</xsl:when>
			<xsl:when test="/pe2:DebitNote">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de Débito Electrónica</font>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="resolucion">
		<xsl:choose>
			<xsl:when test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20254134318'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">4082539500115/SUNAT</font>
			</xsl:when>
			<xsl:when test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = 'NaN'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Otros/SUNAT</font>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="timbre">
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:Documento/pe1:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:Documento/pe2:Nombre"/>
		<xsl:value-of select="'.jpg'"/>
		
	<!-- <xsl:call-template name="nombreTed">
			<xsl:with-param name="text" select="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID"/>
			<xsl:with-param name="largo" select="'11'"/>
		</xsl:call-template>
		<xsl:value-of select="'-'"/>
		<xsl:value-of select="//cbc:InvoiceTypeCode"/>
		<xsl:if test="/pe1:CreditNote">
			<xsl:value-of select="'07'"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
			<xsl:value-of select="'08'"/>
		</xsl:if>
		<xsl:value-of select="'-'"/>
		<xsl:value-of select="/pe:Invoice/cbc:ID"/>
		<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
		<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
		<xsl:value-of select="'.jpg'"/>  -->
	</xsl:template>

	<xsl:template name="nombreTed">
		<xsl:param name="text"/>
		<xsl:param name="largo" select="0"/>
		<xsl:variable name="largo_actual" select="string-length($text)"/>
		<xsl:choose>
			<xsl:when test="$largo_actual &gt;= $largo">
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
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->