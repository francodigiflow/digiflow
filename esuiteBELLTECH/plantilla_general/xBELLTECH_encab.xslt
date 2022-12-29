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
				<tr>
					<td width="68%" valign="top">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="top" width="32%">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="EncabezadoPeru">
		<p>
			<table cellSpacing="2" cellPadding="0" width="100%" border="0">
				<tbody>
					<tr>
						<td width="100%" align="center">
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tbody>
									<tr>
										<td vAlign="top" align="left">
											 <!--<img src="LOGOBELLTECH.png" width="364" height="110"/> -->
											<img src="data:image/*;base64,[logo_1]" width="364" height="110" />
										</td>
									</tr>
										<tr align="left">
											<td width="50%">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
												    BELLTECH PERU S.A.C.<br/>
													Av. EL DERBY N°055 OFICINA 1007 - 1008 TORRE 3 EDIF CRONOS<br/>
													URB POLO AND HUNT CLUB - SANTIAGO DE SURCO<br/>
													TELEFONO (511)611-2600<br/>
													FAX (511) 611-2601<br/>
													LIMA-PERU<br/>
												</font>
											</td>
											<td width="50%">
												<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">

												 <!--<img src="noretencion.png" width="364" height="110"/> -->
													<img src="data:image/*;base64,[logo_2]" width="264" height="70" />
												</xsl:if>
											</td>
										</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>&#xA0;</td>
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
						<table class="redondeo" borderColor="#000000" cellSpacing="0" cellPadding="4" width="100%">
							<tbody>
								<tr>
									<td vAlign="top" width="100%" align="center">
										<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
											<br/>
											<strong>R.U.C.:
												<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID, '###########', 'pen')"/>
							</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID,'###########','pen')"/>	
							</xsl:if>
							<br/><xsl:call-template name="tipodocu"/>
							<br/><xsl:call-template name="NFolio"/>
											</strong>
											<br/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center">
						<font size="1" face="Arial, Helvetica, sans-serif">
						</font>
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
					<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE CREDITO ELECTRÓNICA</font>
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE DEBITO ELECTRÓNICA</font>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="NFolio">
		<br/>
		<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">Nº
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="true"/><advancedProp name="bGenerateByteCode" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="xsltVersion" value="2.0"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->