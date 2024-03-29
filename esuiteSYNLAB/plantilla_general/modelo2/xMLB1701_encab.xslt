<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" 
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" 
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" 
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
	xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
	xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="65%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="top" width="35%">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru">
		<p>
		<table cellSpacing="1" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td width="100%" align="center">
						<table cellSpacing="7" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td align="left" valign="middle" width="50%">
										<img src="logo_synlab2.png" height="50" width="200"/>
									</td>
									<td align="left" valign="middle" width='60%'>
										<font color="#000000" size="3" face="Arial,Helvetica,sans-serif">
										<strong>SYNLAB PERU S.A.C</strong>
										</font>
										<br/>
										<font color="#000000" size="2" face="Arial,Helvetica,sans-serif">
										Avenida Gregorio Escobedo 710,<br/>
										Jesus Maria - Lima - Lima<br/>
										Telf. 203-5900<br/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</p>
</xsl:template>

<xsl:template name="EncabezadoRecuadro">
	<table borderColor="#000000" cellSpacing="0" cellPadding="0" width="100%" border="1">
		<tbody>
			<tr>
				<td>
					<table borderColor="#000000" cellSpacing="0" cellPadding="15" width="100%" border="1">
						<tbody>
							<tr>
								<td vAlign="top" width="100%" align="center" >
									<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
										<strong>R.U.C.
											<xsl:if test="//cbc:UBLVersionID='2.0'">
											<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>
											</xsl:if>
											<xsl:if test="//cbc:UBLVersionID='2.1'">
														
										<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID,'#########','pen')"/>
											
										</xsl:if>
											<br/>
											<br/>
											<xsl:call-template name="tipodocu"/>
											<br/>
											<xsl:call-template name="NFolio"/>
										</strong>
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
				<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">FACTURA ELECTRÓNICA</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRÓNICA</font>
			</xsl:when>
			<xsl:otherwise>
		        <xsl:if test="/pe1:CreditNote">
					<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE CRÉDITO ELECTRÓNICA</font>
				</xsl:if>
		        <xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE DÉBITO ELECTRÓNICA</font>
				</xsl:if>
	      </xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="NFolio">
		<br/> 
		<!--<xsl:value-of select="/pe:Invoice/cbc:ID"/>-->
		<!--<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>-->
		<!--<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>-->
		<xsl:if test="/pe:Invoice">
		<xsl:value-of select="substring-before(/pe:Invoice/cbc:ID,'-')"/> -
		<xsl:value-of select="format-number(substring-after(/pe:Invoice/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
		<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:ID,'-')"/> -
		<xsl:value-of select="format-number(substring-after(/pe1:CreditNote/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
		<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:ID,'-')"/> -
		<xsl:value-of select="format-number(substring-after(/pe2:DebitNote/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="/">
		<html><head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\20520929658&#x2D;08&#x2D;FF11&#x2D;99900008.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->