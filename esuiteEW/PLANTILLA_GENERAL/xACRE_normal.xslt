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
			<xsl:value-of select="6-count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote!=''">
			<xsl:value-of select="6-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote!=''">
			<xsl:value-of select="6-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="numColB2">

		<xsl:if test="/pe:Invoice!=''">
			<xsl:value-of select="23-count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote!=''">
			<xsl:value-of select="25-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote!=''">
			<xsl:value-of select="25-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="numColB3">

		<xsl:if test="/pe:Invoice!=''">
			<xsl:value-of select="23-count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote!=''">
			<xsl:value-of select="25-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote!=''">
			<xsl:value-of select="25-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="numColB4">

		<xsl:if test="/pe:Invoice!=''">
			<xsl:value-of select="23-count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote!=''">
			<xsl:value-of select="25-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote!=''">
			<xsl:value-of select="25-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>

	<xsl:variable name="numColB5">

		<xsl:if test="/pe:Invoice!=''">
			<xsl:value-of select="6-count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote!=''">
			<xsl:value-of select="6-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote!=''">
			<xsl:value-of select="6-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>
	<xsl:include href="xACRE_encab.xslt"/>
	<xsl:include href="xACRE_detalle.xslt"/>
	<xsl:include href="xACRE_bottom.xslt"/>
	<xsl:include href="xACRE_datos.xslt"/>
	<xsl:include href="xACRE_total.xslt"/>
	<xsl:template match="/">
		<html xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
		      xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
		      xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
		      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
		      xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
		      xmlns:ccts="urn:un:unece:uncefact:documentation:2">
			<head>
				<title>Comprobante Electrónico</title>
				<style>div.saltar-pagina {page-break-after: always;  }</style>
			</head>
			<body>
				<h1>
					<table cellSpacing="1" width="100%" border="0">
						<tbody>
							<tr>
								<td>
									<xsl:call-template name="Encabezado"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="DatosReceptor"/>
								</td>
							</tr>
							<tr>
								<td>
									<!--<xsl:call-template name="DetallesEncabezado"/>-->
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">-->
									<xsl:call-template name="Detalle"/>
									<!--<xsl:if test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle/pe:Codigo='13'">
											<xsl:if test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle/pe:Valor !='-'">
												 <xsl:call-template name="DetallesEncabezado_OF"/>
											</xsl:if>
                                            <xsl:if test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle/pe:Valor ='-'">
												 <xsl:call-template name="DetallesEncabezado"/>
											</xsl:if>
										</xsl:if>-->
									<!--</xsl:for-each>-->
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">-->

									<!--</xsl:for-each>-->
								</td>
							</tr>
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
										<tbody>											
											<tr heigth="100%">
												<td vAlign="top" width="71%" align="left">
													<xsl:call-template name="Referencia"/>
												</td>
												<td vAlign="top" width="29%">
													<xsl:call-template name="Total"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr width="100%">
								<td>

									<xsl:call-template name="bottom_Volcan"/>
								</td>
							</tr>
							<tr width="100%">
								<td>
									<font face="Arial, Helvetica, sans-serif" size="1">PÁGINA 1</font>
								</td>
							</tr>
						</tbody>
					</table>
				</h1>
				<xsl:variable name="FF">
					<xsl:value-of select="count(/pe:Invoice/cac:InvoiceLine/cbc:ID)"/>
				</xsl:variable>
				<xsl:variable name="FC">
					<xsl:value-of select="count(/pe1:CreditNote/cac:CreditNoteLine)"/>
				</xsl:variable>
				<xsl:variable name="FD">
					<xsl:value-of select="count(/pe2:DebitNote/cac:DebitNoteLine)"/>
				</xsl:variable>

				<!--Condición para que aparezca la 2da pagina-->

				<xsl:if test="$FF &gt;'23' or $FC &gt;'25' or $FD &gt;'25'">
					<!--Función para realizar el salto de línea-->
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$LI"/-->&#xA0;</div>
					<!--Construcción de la 2da Pagina-->
					<h2>
						<table cellSpacing="1" width="100%" border="0">
							<tbody>
								<tr>
									<td>
										<xsl:call-template name="Encabezado"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="DatosReceptor"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado2"/>
									</td>
								</tr>
								<tr>
									<td>
										<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
											<tbody>

												<!--<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03' ">-->
												<tr heigth="100%">
													<td vAlign="top" width="71%" align="left">
														<xsl:call-template name="Referencia"/>
													</td>
													<td vAlign="top" width="29%">
														<xsl:call-template name="Total"/>
													</td>
												</tr>
												<!--</xsl:if>-->
												<!-- Agrega Glosa Monto en Letras -->
												<!--<tr>
													<td vAlign="top" width="71%" align="left">
														<xsl:call-template name="Referencia"/>
													</td>
												</tr>-->
												<!-- Glosa de pie de pagina solo Factura y Boleta  -->
												<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03' ">
													<tr>
														<td>
															<!--<xsl:call-template name="DatosPieReferencia"/>-->
														</td>
													</tr>
												</xsl:if>
												<!-- Glosa NC y ND -->
												<!--<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
													<tr>
														<td colspan="1">
															<xsl:call-template name="Dato_Notas"/>
														</td>
														<td align="right" width="50%">
															<xsl:call-template name="TotalNC_Y_ND"/>
														</td>
													</tr>
												</xsl:if>-->
											</tbody>
										</table>
									</td>
								</tr>
								<tr width="100%">
									<td>

										<xsl:call-template name="bottom_Volcan"/>
									</td>
								</tr>
								<tr width="100%">
									<td>
										<font face="Arial, Helvetica, sans-serif" size="1">PÁGINA 2</font>
									</td>
								</tr>
							</tbody>
						</table>
					</h2>
				</xsl:if>

				<!--Condición para que aparezca la 3ra pagina-->
				<!--<xsl:if test="$LI3 &gt;'25' and $LI3 &lt;'51'">-->

				<xsl:if test="$FF &gt;'46' or $FC &gt;'50' or $FD &gt;'50'">
					<!--Función para realizar el salto de línea-->
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$LI3"/>-->&#xA0;</div>
					<!--Construcción de la 3ra Pagina-->
					<h3>
						<table cellSpacing="1" width="100%" border="0">
							<tbody>
								<tr>
									<td>
										<xsl:call-template name="Encabezado"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="DatosReceptor"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado2"/>
									</td>
								</tr>
								<tr>
									<td>
										<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
											<tbody>

												<!--<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03' ">-->
												<tr heigth="100%">
													<td vAlign="top" width="71%" align="left">
														<xsl:call-template name="Referencia"/>
													</td>
													<td vAlign="top" width="29%">
														<xsl:call-template name="Total"/>
													</td>
												</tr>
												<!--</xsl:if>-->
												<!-- Agrega Glosa Monto en Letras -->
												<!--<tr>
													<td vAlign="top" width="71%" align="left">
														<xsl:call-template name="Referencia"/>
													</td>
												</tr>-->
												<!-- Glosa de pie de pagina solo Factura y Boleta  -->
												<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03' ">
													<tr>
														<td>
															<!--<xsl:call-template name="DatosPieReferencia"/>-->
														</td>
													</tr>
												</xsl:if>
												<!-- Glosa NC y ND -->
												<!--<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
													<tr>
														<td colspan="1">
															<xsl:call-template name="Dato_Notas"/>
														</td>
														<td align="right" width="50%">
															<xsl:call-template name="TotalNC_Y_ND"/>
														</td>
													</tr>
												</xsl:if>-->
											</tbody>
										</table>
									</td>
								</tr>
								<tr width="100%">
									<td>

										<xsl:call-template name="bottom_Volcan"/>
									</td>
								</tr>
								<tr width="100%">
									<td>
										<font face="Arial, Helvetica, sans-serif" size="1">PÁGINA 3</font>
									</td>
								</tr>
							</tbody>
						</table>
					</h3>
				</xsl:if>
				<!--Condición para que aparezca la 4ta pagina-->
				<xsl:if test="$FF &gt;'69' or $FC &gt;'75' or $FD &gt;'75'">
					<!--Función para realizar el salto de línea-->
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$LI3"/>-->&#xA0;</div>
					<!--Construcción de la 3ra Pagina-->
					<h4>
						<table cellSpacing="1" width="100%" border="0">
							<tbody>
								<tr>
									<td>
										<xsl:call-template name="Encabezado"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="DatosReceptor"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado4"/>
									</td>
								</tr>
								<tr>
									<td>
										<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
											<tbody>

												<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03' ">
													<tr heigth="100%">
														<td vAlign="top" width="71%" align="left">
															<xsl:call-template name="Referencia"/>
														</td>
														<td vAlign="top" width="29%">
															<xsl:call-template name="Total"/>
														</td>
													</tr>
												</xsl:if>
												<!-- Agrega Glosa Monto en Letras -->
												<!--<tr>
													<td vAlign="top" width="71%" align="left">
														<xsl:call-template name="Referencia"/>
													</td>
												</tr>-->
												<!-- Glosa de pie de pagina solo Factura y Boleta  -->
												<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03' ">
													<tr>
														<td>
															<!--<xsl:call-template name="DatosPieReferencia"/>-->
														</td>
													</tr>
												</xsl:if>
												<!-- Glosa NC y ND -->
												<!--<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
													<tr>
														<td colspan="1">
															<xsl:call-template name="Dato_Notas"/>
														</td>
														<td align="right" width="50%">
															<xsl:call-template name="TotalNC_Y_ND"/>
														</td>
													</tr>
												</xsl:if>-->
											</tbody>
										</table>
									</td>
								</tr>
								<tr width="100%">
									<td>

										<xsl:call-template name="bottom_Volcan"/>
									</td>
								</tr>
								<tr width="100%">
									<td>
										<font face="Arial, Helvetica, sans-serif" size="1">PÁGINA 4</font>
									</td>
								</tr>
							</tbody>
						</table>
					</h4>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\XML\20553255881&#x2D;01&#x2D;F201&#x2D;00014214.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20100025591_2013052601FF1210002022.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[3]/td/xsl:call&#x2D;template" x="203" y="96"/><block path="html/body/table/tbody/tr[4]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="123" y="96"/><block path="html/body/table/tbody/tr[4]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="83" y="96"/><block path="html/body/table/tbody/tr[4]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="43" y="96"/><block path="html/body/table/tbody/tr[6]/td/xsl:call&#x2D;template" x="163" y="96"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->