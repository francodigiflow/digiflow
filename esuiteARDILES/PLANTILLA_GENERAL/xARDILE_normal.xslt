<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="numColBl">
		<xsl:if test="/pe:Invoice!=''">
			<xsl:value-of select="18-count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote!=''">
			<xsl:value-of select="20-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote!=''">
			<xsl:value-of select="20-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>

	<xsl:variable name="v_RucEmisor">
			<xsl:if test="//cbc:UBLVersionID='2.1'">
				<xsl:value-of select="//cac:PartyIdentification/cbc:ID"/>
			</xsl:if>
			<xsl:if test="//cbc:UBLVersionID='2.0'">
				<xsl:value-of select="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID"/>
			</xsl:if>
		</xsl:variable>

	<xsl:include href="xARDILE_encab_.xslt"/>
	<xsl:include href="xARDILE_detalle.xslt"/>
	<xsl:include href="xARDILE_bottom.xslt"/>
	<xsl:include href="xARDILE_datos.xslt"/>
	<xsl:include href="xARDILE_total.xslt"/>

	<xsl:template match="/">
		<html xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		      xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
		      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
		      xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
		      xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
		      xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2">

			<head>
				<title>Comprobante Electrónico</title>
			</head>
			<body>
				<table cellSpacing="1" width="100%" border="0">
					<tbody>
						<tr>
							<td width="100%">
								<xsl:call-template name="Encabezado"/>
							</td>
						</tr>
						<tr>
							<td width="100%">
								<xsl:call-template name="DatosReceptor"/>
							</td>
						</tr>

						<tr>
							<td width="100%">
								<xsl:call-template name="DetallesEncabezado"/>
							</td>
						</tr>
						<tr>
							<td width="100%">
								<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
									<tr>
										<td width="100%" align="right">
											<xsl:call-template name="Total"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<!--<tr>
							<td>&#xA0;</td>
						</tr>-->
						<tr>
							<td width="100%">
								<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">

									<tr>
										<td width="100%">
											<table border="1" width="100%" cellpadding="1" cellspacing="0">
												<tr>
													<td>
														<xsl:call-template name="son-pesos"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<!--<tr>
										<td width="100%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<br/>
											</font>
										</td>
									</tr>-->
								</table>
							</td>
						</tr>


						<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount='0.00'">
							<tr>
								<td width="100%">
									<xsl:call-template name="Transferencia"/>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td width="100%">
								<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
									<tr heigth="100%">
										<td vAlign="top" width="70%" align="left">
											<xsl:call-template name="Referencia"/>
										</td>
										<td vAlign="top" width="30%">
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="100%">
								<xsl:choose>
									<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
										<font size="1" face="Arial, Helvetica, sans-serif"/>
									</xsl:when>
									<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
										<font size="2" face="Arial, Helvetica, sans-serif"></font>
									</xsl:when>
									<xsl:otherwise>
										<xsl:if test="/pe1:CreditNote">
											<font size="1" face="Arial, Helvetica, sans-serif">
												<strong>MOTIVO : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong>
											</font>
										</xsl:if>
										<xsl:if test="/pe2:DebitNote">
											<font size="1" face="Arial, Helvetica, sans-serif">
												<strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong>
											</font>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<xsl:choose>
							<xsl:when test="/pe:Invoice or /pe2:DebitNote">
								<tr>
									<td width="100%">
										<xsl:call-template name="Leyenda"/>
									</td>
								</tr>
							</xsl:when>
						</xsl:choose>
						<!--<tr width="100%">
									<td width="100%">
										<xsl:call-template name="Importe_Percepcion"/>
									</td>
						</tr>-->

						<tr width="100%">
							<td width="100%">
								<xsl:call-template name="bottom_hash"/>
							</td>
						</tr>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="TraeValorVariable">
		<xsl:param name="varNumVA"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA">
				<xsl:if test="pe:Valor!='-'">
					<xsl:value-of select="pe:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$varNumVA">
				<xsl:if test="pe1:Valor!='-'">
					<xsl:value-of select="pe1:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$varNumVA">
				<xsl:if test="pe2:Valor!='-'">
					<xsl:value-of select="pe2:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\..\esuiteIMPALA\XML\20555286831&#x2D;01&#x2D;F040&#x2D;00000861.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->