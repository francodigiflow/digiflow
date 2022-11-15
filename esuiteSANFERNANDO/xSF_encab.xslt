<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="60%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="top" width="40%">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru">
	<p>
		<xsl:variable name="Serie">
						<xsl:value-of select="substring-before(/pe:Invoice/cbc:ID, '-')"/>
						<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:ID, '-')"/>
						<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:ID, '-')"/>
		</xsl:variable>
				
		<table cellSpacing="2" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td width="60%" align="center">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
							<xsl:if test="number($Serie) = $Serie">
							<!-- myNode is a number -->
							<tr><td><font color="red" size="2" face="Arial, Helvetica, sans-serif"><b>COMPROBANTE ELECTRONICO EMITIDO EN CONTINGECIA</b></font></td></tr>
							</xsl:if>
							
								<tr>
									<td align="left" width="100%">
									<!-- <img src="logo_sf.jpg"/> -->
									<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20100154308'">
										<img src="data:image/*;base64,[logo_1]" width="400" height="100" />
									</xsl:if>
									<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20608989197'">
										<img src="data:image/*;base64,[logo_2]" width="418" height="117" />
									</xsl:if>
									</td>
								</tr>
								<tr>
									<td align="left" width="100%">
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20100154308'">
											<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
												Dirección:<xsl:value-of select="/pe:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
												<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
												<br/>Teléfono		:213-5300
											</font>
										</xsl:if>
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20608989197'">
											<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
												Dirección:<xsl:value-of select="/pe:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
												<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
												<br/>Teléfono		:372-0587
											</font>
										</xsl:if>
										
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr><td></td></tr><tr><td></td></tr>
			</tbody>
		</table>
	</p>
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tbody>
			<tr>
				<td>
					<table borderColor="#000000" cellSpacing="0" cellPadding="10" width="100%" border="2">
						<tbody>
						<xsl:variable name="Serie">
						<xsl:value-of select="substring-before(/pe:Invoice/cbc:ID, '-')"/>
						<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:ID, '-')"/>
						<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:ID, '-')"/>
		</xsl:variable>
						
							
							<tr>
								<td vAlign="top" width="100%" align="center">
								<xsl:if test="number($Serie) = $Serie">
							<!-- myNode is a number -->
							<center><font color="red" size="2" face="Arial, Helvetica, sans-serif"><b>EMISOR ELECTRONICO OBLIGATORIO</b></font></center>
						</xsl:if>
						<br/>
									<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
										<strong>RUC 
											<xsl:value-of select="format-number($v_RucEmisor,'#########','pen')"/>
											<br/>
											<xsl:call-template name="tipodocu"/>
											<xsl:call-template name="NFolio"/>
										</strong>
										
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center">
					<font size="2" face="Arial, Helvetica, sans-serif"><!-- <strong>SUNAT- CENTRO LIMA</strong> --></font>
				</td>
			</tr>
		</tbody>
	</table>
	</xsl:template>

	<xsl:template name="tipodocu">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">FACTURA ELECTRÓNICA</font>
			</xsl:when>

			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRÓNICA</font></xsl:when>
			<xsl:otherwise>
         	<xsl:if test="/pe1:CreditNote"><font color="#000000" size="3" face="Arial, Helvetica, sans-serif">NOTA DE CRÉDITO ELECTRÓNICA</font></xsl:if>
         	<xsl:if test="/pe2:DebitNote"><font color="#000000" size="3" face="Arial, Helvetica, sans-serif">NOTA DE DEBITO ELECTRÓNICA</font></xsl:if>      
      	</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

<xsl:template name="aviso">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Factura Electrónica</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Boleta de Venta Electrónica</font></xsl:when>
			<xsl:otherwise>
         	<xsl:if test="/pe1:CreditNote"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Nota de Crédito Electrónica</font></xsl:if>
         	<xsl:if test="/pe2:DebitNote"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Nota de Débito Electrónica</font></xsl:if>      
      	</xsl:otherwise>
		</xsl:choose>
</xsl:template>












<xsl:template name="NFolio">
	<br/>
	<xsl:value-of select="/pe:Invoice/cbc:ID"/>
	<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
	<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
	<br/>
</xsl:template>
<xsl:template match="/">
	<html><head></head>
		<body/>
	</html>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->