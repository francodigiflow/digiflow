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
					<td vAlign="top" width="60%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="middle" width="40%">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
				</tr>
			</tbody>
		</table>
	
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
										<td align="center" width="100%" class="tipo2">
											 <!-- <img src="logo_emerson.jpg"/> -->
											 <img src="data:image/*;base64,[logo_1]" />
											 <br/> <b>Emerson Process Management del Perú S.A.C.</b>
											 <br/>								
												<br/>Calle Juan Alfaro 227 | Urb. San Antonio - Miraflores 
												<br/>Lima 15047 - Perú | Telf. +511 519-0130 | Fax +511 519-0131
												<br/>peventas@emerson.com | www.emersonprocess.com
												<br/>
												
																								
										</td>
										<td width="2%">
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
					   <table frame="box" border="2" width="100%" borderColor="#000000" rules="groups" class="tipo1">
							<tbody>
								<tr>
									<td vAlign="middle" width="100%" align="center">
										&#xA0;
											<strong>R.U.C.
												<xsl:if test="//cbc:UBLVersionID='2.0'">
												<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID, '###########', 'pen')"/>
												</xsl:if>
							
												<xsl:if test="//cbc:UBLVersionID='2.1'">
												<xsl:value-of select="format-number(//cac:PartyIdentification/cbc:ID,'###########','pen')"/>
												</xsl:if>
												<br/>&#xA0;
												<br/>&#xA0;
												<xsl:call-template name="tipodocu"/>
												<br/>&#xA0;
												<xsl:call-template name="NFolio"/>
												&#xA0;
											</strong>
									</td>
								</tr>
							</tbody>
						</table> 
	</xsl:template>

	<xsl:template name="tipodocu">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				FACTURA ELECTRONICA
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				BOLETA DE VENTA ELECTRONICA
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote">
					NOTA DE CREDITO ELECTRONICA
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					NOTA DE DEBITO ELECTRONICA
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="aviso">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				Factura Electrónica
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				Boleta de Venta Electrónica
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote">
					Nota de Crédito Electrónica
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					Nota de Débito Electrónica
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="NFolio">
		<br/>
		<xsl:if test="/pe:Invoice">
			<xsl:value-of select="substring-before(/pe:Invoice/cbc:ID,'-')"/>
			&#xA0; &#xA0; Nº <xsl:value-of select="substring-after(/pe:Invoice/cbc:ID,'-')"/>
		</xsl:if>
		
		<xsl:if test="/pe1:CreditNote">
			<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:ID,'-')"/>Nº 
			<xsl:value-of select="substring-after(/pe1:CreditNote/cbc:ID,'-')"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
			<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:ID,'-')"/>Nº 
			<xsl:value-of select="substring-after(/pe2:DebitNote/cbc:ID,'-')"/>
		</xsl:if>


	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="xml\20100313899_2015070703BB1100000057.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->