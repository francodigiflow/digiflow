<?xml version='1.0'?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" 
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
	xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"  
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
	xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:template name="Encabezado">
	<table border="0" cellPadding="1" width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
		<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
			<tr height="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td vAlign="top" width="70%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03'">
							<xsl:call-template name="EncabezadoPeru"/>
					</xsl:if>
				</td>
				<td vAlign="top" width="30%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<xsl:if test="//cbc:InvoiceTypeCode='01' or//cbc:InvoiceTypeCode='03' or //cbc:InvoiceTypeCode='07' or //cbc:InvoiceTypeCode='08'">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</xsl:if>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

	<xsl:template name="EncabezadoPeru">
	<table border="0" cellSpacing="0" cellPadding="0" width="90%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
		<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
			<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td width="50%" align="center" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<table border="0" cellSpacing="0" cellPadding="0" width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td align="left" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<img src="logo.jpg" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
								</td>
							</tr>
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td align="left" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<font color="#000000" size="3" face="Times New Roman, Arial, Helvetica, sans-serif" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
										<br xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
										<xsl:value-of select="//cbc:Name"/>&#160; 
									</font>
								</td>
							</tr>
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td width="100%" align="left" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<font color="#000000" size="2" face="Times New Roman,Arial, Helvetica, sans-serif" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
										<xsl:value-of select="//cbc:StreetName "/>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
				<td vAlign="top" width="50%" align="left" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<table border="0" cellSpacing="0" cellPadding="0" width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<font color="#000000" size="2" face="Times New Roman,Arial, Helvetica, sans-serif" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
										<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">SUCURSALES:</strong>&#160; 
									</font>
								</td>
							</tr>
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<br xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
								</td>
							</tr>
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<font color="#000000" size="1" face="Times New Roman,Arial, Helvetica, sans-serif" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;SUCURSAL 1, Lima </font>
								</td>
							</tr>
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<font color="#000000" size="1" face="Times New Roman,Arial, Helvetica, sans-serif" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;SUCURSAL 2, Arequipa</font>
								</td>
							</tr>
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<font color="#000000" size="1" face="Times New Roman,Arial, Helvetica, sans-serif" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;SUCURSAL 3, Tacna</font>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

	<xsl:variable name="fecha_texto">
		<xsl:value-of select="substring-before(//cbc:IssueDate,'-')"/>
	</xsl:variable>
	<xsl:variable name="mmdd">
		<xsl:value-of select="substring-after(//cbc:IssueDate,'-')"/>
	</xsl:variable>
	<!--prefijo Fecha Emision Mes -->
	<xsl:variable name="mm">
		<xsl:value-of select="substring-before($mmdd,'-')"/>
	</xsl:variable>
	<xsl:variable name="dd">
		<xsl:value-of select="substring-after($mmdd,'-')"/>
	</xsl:variable>
	<!-- MES -Nombre -->
	<xsl:variable name="nomMes">
		<xsl:choose>
			<xsl:when test="$mm='01'">Enero</xsl:when>
			<xsl:when test="$mm='02'">Febrero</xsl:when>
			<xsl:when test="$mm='03'">Marzo</xsl:when>
			<xsl:when test="$mm='04'">Abril</xsl:when>
			<xsl:when test="$mm='05'">Mayo</xsl:when>
			<xsl:when test="$mm='06'">Junio</xsl:when>
			<xsl:when test="$mm='07'">Julio</xsl:when>
			<xsl:when test="$mm='08'">Agosto</xsl:when>
			<xsl:when test="$mm='09'">Septiembre</xsl:when>
			<xsl:when test="$mm='10'">Octubre</xsl:when>
			<xsl:when test="$mm='11'">Noviembre</xsl:when>
			<xsl:when test="$mm='12'">Diciembre</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="fecha">
		<xsl:value-of select="concat($dd,'/',$mm2,'/' ,$fecha_texto)"/>
	</xsl:variable>
	<xsl:variable name="mmdd2">
		<xsl:value-of select="substring-after(DTE/Documento/Encabezado/IdDoc/FchVenc,'-')"/>
	</xsl:variable>
	<xsl:variable name="aa2">
		<xsl:value-of select="substring-before(DTE/Documento/Encabezado/IdDoc/FchVenc,'-')"/>
	</xsl:variable>
	<xsl:variable name="mm2">
		<xsl:value-of select="substring-before($mmdd2,'-')"/>
	</xsl:variable>
	<xsl:variable name="dd2">
		<xsl:value-of select="substring-after($mmdd2,'-')"/>
	</xsl:variable>
	<xsl:variable name="fechaVcto">
		<xsl:value-of select="concat($dd2,'-', $mm2, '-' , $aa2)"/>
	</xsl:variable>

	<xsl:template name="EncabezadoRecuadro">
	<table border="0" width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
		<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
			<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="15" width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td vAlign="top" width="100%" align="center" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<font color="#000000" size="2" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
										<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">R.U.T.: 
											<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'###.###.###','pen')"/>
											<br xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
											<br xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
											<xsl:call-template name="tipodocu"/>
											<br xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
											<xsl:call-template name="NFolio"/>
										</strong>
										<br xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td align="center" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="2" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">SUNAT- CENTRO LIMA</strong>
					</font>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

	<xsl:template name="tipodocu">
	<xsl:choose>
		<xsl:when test="//cbc:InvoiceTypeCode='01'">Factura Electrónica</xsl:when>
		<xsl:when test="//cbc:InvoiceTypeCode='03'">Boleta Electronica</xsl:when>
		<xsl:when test="//cbc:InvoiceTypeCode='07'">Nota de Credito Electronica</xsl:when>
		<xsl:when test="//cbc:InvoiceTypeCode='08'">Nota de Debito Electronica</xsl:when>
		<xsl:otherwise>Documento no Identificado</xsl:otherwise>
	</xsl:choose>
</xsl:template>

	<xsl:template name="NFolio">
	<xsl:choose>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
			<br xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>Nº 
			<xsl:value-of select="substring-after(/pe:Invoice/cbc:ID,'-')"/>
			<br xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
		</xsl:when>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<br/>Nº <xsl:value-of select="substring-after(/pe:Invoice/cbc:ID,'-')"/><br/></xsl:when>
		<xsl:otherwise>Documento no Identificado</xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->