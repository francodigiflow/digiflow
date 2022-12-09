<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
	xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
	xmlns:ccts="urn:un:unece:uncefact:documentation:2"
	exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:template name="bottom_hash">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td valign="top" width="60%">
					<table cellpadding="0" cellspacing="1" width="100%" border="0">
						<tr>
							<td width="100%">
								<xsl:call-template name="Observacion1" />
							</td>
						</tr>
						<xsl:variable name="CTSvar15">
							<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="15" /></xsl:call-template>
						</xsl:variable>
						<xsl:if test="$CTSvar15 != ''">
							<tr>
								<td width="100%">
									<xsl:call-template name="Observacion2" />
								</td>
							</tr>
						</xsl:if>
					</table>
				</td>
				<td align="center" width="40%" valign="top">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						Representación impresa de la <xsl:call-template name="aviso" />
						<br/>Podrá ser consultada en: www.panasa.com.pe
						<br/>Autorizado mediante Resolución de Intendencia: N° 0180050001752/SUNAT<br/>
					</font>
					<img width="100" height="100">
						<xsl:attribute name="src">
							<xsl:call-template name="timbre" />
						</xsl:attribute>
					</img>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Observacion1">
		<table cellpadding="0" cellspacing="0" width="100%" border="0">
			<tr>
				<td width="100%">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>Observación:</strong>
					</font>
				</td>
			</tr>
			<tr>
				<td>
					<table cellSpacing="0" cellPadding="1" width="100%" border="1" rules="none">
						<tr>
							<td>
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:call-template name="DatoAdicional01">
									<xsl:with-param name="var" select="14" />
									</xsl:call-template>
									<xsl:call-template name="DatoAdicional01">
									<xsl:with-param name="var" select="29" />
									</xsl:call-template>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
<!-- CUOTAS NORMATIVA -->
	<xsl:for-each select="//cac:PaymentTerms">
	<xsl:if test="cbc:PaymentMeansID ='Cuota002' ">
			<tr>
				<td width="70%">
				
					<font color="#000000" size="1" face="Tahoma, Helvetica, sans-serif">
					<br/>
						<xsl:call-template name="DocumentoReferencia_cuota"/>
					</font>
				</td>
			</tr>
	</xsl:if>
	</xsl:for-each>
		</table>
	</xsl:template>
<xsl:template name="DocumentoReferencia_cuota">
		<table borderColor="#000000" cellSpacing="0" cellPadding="1" width="100%" style="border-top: black 1px solid; border-right: black 1px solid; border-collapse: collapse; border-bottom: black 1px solid; border-left: black 1px solid;">
			<tbody>
				<tr width="100%">
					<td colSpan="3" width="100%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
						<font size="1" face="Arial, Helvetica, sans-serif">
							<strong>CUOTAS DE REFERENCIA</strong>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
						<font size="1" face="Arial, Helvetica, sans-serif">
							<strong>N°CUOTA</strong>
						</font>
					</td>
					<td width="15%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
						<font size="1" face="Arial, Helvetica, sans-serif">
							<strong>MONTO</strong>
						</font>
					</td>
					<td width="15%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
						<font size="1" face="Arial, Helvetica, sans-serif">
							<strong>FECHA VENC</strong>
						</font>
					</td>
				</tr>
				<xsl:for-each select="//cac:PaymentTerms">
					<xsl:if test="cbc:PaymentMeansID !='Credito' and cbc:ID !='Detraccion' ">
						<tr>
							
							<td width="20%" align="center" style="border:solid 1px black">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="cbc:PaymentMeansID"/>
								</font>
							</td>
							<td width="15%" align="center" style="border:solid 1px black">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="cbc:Amount"/>
								</font>
							</td>
							<td width="15%" align="center" style="border:solid 1px black">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="cbc:PaymentDueDate"/>
								</font>
							</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Observacion2">
		<table cellpadding="0" cellspacing="0" width="50%" border="0">
			<xsl:variable name="CTSiteracion15">
				<xsl:call-template name="DatoAdicional01">
					<xsl:with-param name="var" select="15" />
				</xsl:call-template>
			</xsl:variable>
			<tr>
				<td width="100%">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong><xsl:value-of select="substring-before($CTSiteracion15, '|')" /></strong>
					</font>
				</td>
			</tr>
			<tr>
				<td>
					<table cellSpacing="0" cellPadding="1" width="100%" border="1" rules="none">
						<tr>
							<td>
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<strong>MONTO:</strong>
								</font>
							</td>
							<td>
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="substring-before(substring-after($CTSiteracion15, '|'), '|')" />
								</font>
							</td>
						</tr>
						<tr>
							<td>
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<strong>TASA:</strong>
								</font>
							</td>
							<td>
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="substring-before(substring-after(substring-after($CTSiteracion15, '|'), '|'), '|')" />
								</font>
							</td>
						</tr>
						<tr>
							<td>
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<strong>TOTAL:</strong>
								</font>
							</td>
							<td>
								<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
									<xsl:value-of select="substring-before(substring-after(substring-after(substring-after($CTSiteracion15, '|'), '|'), '|'), '|')" />
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="aviso">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">Factura Electrónica</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">Boleta de Venta Electrónica</xsl:when>
			<xsl:when test="/pe1:CreditNote">Nota de Crédito Electrónica</xsl:when>
         	<xsl:when test="/pe2:DebitNote">Nota de Débito Electrónica</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="timbre">
	
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre" />
		<xsl:value-of select="'.jpg'" />
	</xsl:template>

	<xsl:template name="nombreTed">
		<xsl:param name="text" />
		<xsl:param name="largo" select="0" />
		<xsl:variable name="largo_actual" select="string-length($text)" />
		<xsl:choose>
			<xsl:when test="$largo_actual &gt;= $largo">
				<xsl:value-of select="$text" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="prefix" select="concat('0', $text)" />
				<xsl:call-template name="nombreTed">
					<xsl:with-param name="text" select="$prefix" />
					<xsl:with-param name="largo" select="$largo" />
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