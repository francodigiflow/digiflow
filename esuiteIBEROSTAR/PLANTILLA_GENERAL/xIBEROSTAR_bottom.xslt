<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2">
	
	<!--Referencia de ANTICIPO-->
	<xsl:template name="anticipo">	 
		<!--<table border="0" cellpadding="0" cellspacing="0" width="50%">-->
		<table border="1" rules="all" width="50%" cellpadding="1" cellspacing="0" bordercolor="silver">
			<!--<tr>				
				<td width="50%">
				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="50%">
					<tbody>-->
						<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>Detalle de anticipo</strong>
						</font>
						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<tr width="50%">
							<td width="20%" align="center" bgcolor="silver">
								<font face="Arial, Helvetica, sans-serif" size="2">
									TIPO DE DOCUMENTO
								</font>
							</td>
							<td width="15%" align="center" bgcolor="silver">
								<font face="Arial, Helvetica, sans-serif" size="2">
									NUMERO DE DOCUMENTO
								</font>
							</td>
							<td width="15%" align="center" bgcolor="silver">
								<font face="Arial, Helvetica, sans-serif" size="2">
									IMPORTE DE ANTICIPO
								</font>
							</td>
						</tr>

						<xsl:for-each select="//cac:PrepaidPayment">
								<tr width="50%">
									<td width="15%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
												<xsl:when test="//cac:LegalMonetaryTotal/cbc:PrepaidAmount !=''">ANTICIPO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<td width="15%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="cbc:PaidAmount"/>
										</font>
									</td>
								</tr>
						</xsl:for-each>
						</xsl:if>
						
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<tr width="50%">
								<td width="20%" align="center" bgcolor="silver">
									<font face="Arial, Helvetica, sans-serif" size="2">
										TIPO DE DOCUMENTO
									</font>
								</td>
								<td width="15%" align="center" bgcolor="silver">
									<font face="Arial, Helvetica, sans-serif" size="2">
										NUMERO DE DOCUMENTO
									</font>
								</td>
								<td width="15%" align="center" bgcolor="silver">
									<font face="Arial, Helvetica, sans-serif" size="2">
										IMPORTE DE ANTICIPO
									</font>
								</td>
							</tr>
						
						<tr width="50%">
							<xsl:for-each select="//cac:PrepaidPayment">
								<xsl:if test="cbc:ID[@schemeName='Anticipo']">
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											ANTICIPO
										</font>
									</td>
								</xsl:if>	
							</xsl:for-each>
							<xsl:for-each select="//cac:AdditionalDocumentReference">
								<xsl:if test="cbc:DocumentTypeCode='02'">
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
								</xsl:if>	
							</xsl:for-each>
							<xsl:for-each select="//cac:PrepaidPayment">
									<td width="15%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<!-- <xsl:value-of select="cbc:PaidAmount"/> -->
											<xsl:value-of select="format-number(cbc:PaidAmount, '###,###,##0.00', 'pen')"/>
										</font>
									</td>
							</xsl:for-each>
						</tr>
						</xsl:if>
					<!--</tbody>
				</table>
			</td>
			</tr>-->
			
		</table>	  
	</xsl:template>
	
	<xsl:template name="bottom_hash">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr> <!--width="55%"--> 
				<td valign="baseline" align="center">
					<!-- <img width="120" height="120"> -->
					<!-- <xsl:attribute name="src"><xsl:call-template name="timbre"/></xsl:attribute></img> -->
					<img width="120" height="120" align="center" src="data:image/*;base64,[ted_1]" />
				</td>
			</tr>
			<tr>
				<td valign="baseline" align="center">
				<!--<table border="1" width="100%" cellpadding="0" cellspacing="0">		-->	
					<font size="2" face="Arial, Helvetica, sans-serif" style="color:#0F2C4E">
						<!--<br/>-->
						Representación impresa de la
						<xsl:choose>
							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">Factura Electrónica</xsl:when>
							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">Boleta de Venta Electrónica</xsl:when>
							<xsl:when test="/pe1:CreditNote">Nota de Crédito Electrónica</xsl:when>
							<xsl:when test="/pe2:DebitNote">Nota de Débito Electrónica</xsl:when>
							<xsl:otherwise></xsl:otherwise>
						</xsl:choose> 
						<!--autorizada mediante Resolución de Intendencia Nº 300-2014/SUNAT-->
						<br/>Puede descargar su comprobante desde el sitio:
						<strong>
						<br/>https://facturacion.ecomprobantes.pe/IBEROSTAR
						</strong>
						<br/><br/>"Los importes correspondientes a ventas por tajetas de crédito y débito han sido cedidos al patrimonio autónomo "FIDEICOMISO IBEROSTAR", administrado por FiduPerú S.A. Sociedad Fiduciaria."</font>
				<!--</table>-->
				</td>			
			</tr>
		</table>
	</xsl:template>

	<!--<xsl:template name="timbre">
		<xsl:call-template name="nombreTed">
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
		<xsl:value-of select="'.jpg'"/>
	</xsl:template>-->
	<xsl:template name="timbre">		
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:Documento/pe1:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:Documento/pe2:Nombre"/>
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

</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->