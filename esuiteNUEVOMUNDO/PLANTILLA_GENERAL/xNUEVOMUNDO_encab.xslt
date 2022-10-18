<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
				<!--<br/><br/><br/><br/>-->
					<td vAlign="top" width="65%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="top" width="35%">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
				</tr>
			</tbody>
		</table>
		<!--<tr>
					<td vAlign="top" align="center">
					<font color="#000000" size="0.5" face="Arial, Helvetica, sans-serif">
					<br/>
						<xsl:call-template name="TraeValorVariable">
							<xsl:with-param name="varNumVA" select="03"/>
						</xsl:call-template>
						</font>
					</td>
				</tr>-->
	</xsl:template>


	<xsl:template name="EncabezadoPeru">
		<p>
			<table cellSpacing="2" cellPadding="0" width="100%" border="0" borderColor="#000000">
				<tbody>
					<tr>
						<td width="100%" align="center">
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tbody>
									<tr>
										<td align="left" width="100%">
											 <!-- <img src="D:\OneDrive\OneDrive - Digiflow. S.A\DGF\0PROYECTOS0\Propios\Nuevo Mundo UBL 2.1 OSE\Plantilla\NM.jpg" height="80" width="200"/>  -->
											 <!-- <img src="NM.jpg" height="80" width="200"/> -->
											 <img src="data:image/*;base64,[logo_1]" height="80" width="200" />
										</td>
										<td width="2%">
										</td>
										</tr>
										<tr>
										<td align="left" width="43%">
											<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
												<br/>
												<b>CIA. INDUSTRIAL NUEVO MUNDO S.A.</b>
											</font>
											<font color="#000000" size="0.5" face="Arial, Helvetica, sans-serif">
												<br/>JR. JOSE CELEDON #750 LIMA - LIMA - LIMA
												<br/>TELEFONO: 415-4000
												<!--<br/>FAX: 336-8193-->
												<br/>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
					</tr>
				</tbody>
			</table>
		</p>
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td>
						<table borderColor="#000000" cellSpacing="0" cellPadding="4" width="100%" border="1">
							<tbody>
								<tr>
									<td vAlign="top" width="100%" align="center">
										<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
											<br/>&#xA0;
											<br/>&#xA0;
											<strong>R.U.C.
												<!--<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>-->
												<xsl:value-of select="format-number(//cac:PartyIdentification/cbc:ID,'###########','pen')"/>
												<br/>&#xA0;
												<br/>&#xA0;
												<xsl:call-template name="tipodocu"/>
												<br/>&#xA0;
												<xsl:call-template name="NFolio"/>
												<br/>&#xA0;</strong>
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

	<xsl:template name="tipodocu">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
			<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode!='40' and //cbc:UBLVersionID='2.1'">
				<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">FACTURA ELECTRONICA</font>
				</xsl:if>
				<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode='40' and //cbc:UBLVersionID='2.1'">
				<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">FACTURA / INVOICE</font>
				</xsl:if>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRONICA</font>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote">
					<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">NOTA DE CREDITO ELECTRONICA</font>
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">NOTA DE DEBITO ELECTRONICA</font>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="aviso">
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

	<xsl:template name="NFolio">
		<br/>
		<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
			<xsl:value-of select="/pe:Invoice/cbc:ID"/>
			<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
			<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
		</font>
		<br/>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20520929658&#x2D;01&#x2D;FF11&#x2D;40000014.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->