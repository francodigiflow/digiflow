<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2"
                exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi sac">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="numColBl">
		<xsl:if test="/pe:Retention!=''">
			<xsl:value-of select="30-count(//sac:SUNATRetentionDocumentReference)"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="numColBl2">
		<xsl:if test="/pe:Retention!=''">
			<xsl:value-of select="30-count(//sac:SUNATRetentionDocumentReference)"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="numColBl3">
		<xsl:if test="/pe:Retention!=''">
			<xsl:value-of select="30-count(//sac:SUNATRetentionDocumentReference)"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="numColBl4">
		<xsl:if test="/pe:Retention!=''">
			<xsl:value-of select="30-count(//sac:SUNATRetentionDocumentReference)"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="numColBl5">
		<xsl:if test="/pe:Retention!=''">
			<xsl:value-of select="30-count(//sac:SUNATRetentionDocumentReference)"/>
		</xsl:if>
	</xsl:variable>


	<xsl:variable name="totalitems">
		<!--<xsl:value-of select="count(/pe:Invoice/cac:InvoiceLine/cbc:ID)"/>-->
		<xsl:if test="/pe:Retention != ''">
			<!--<xsl:value-of select="count(/pe:Invoice/cac:InvoiceLine)"/>-->
			<xsl:value-of select="count(//sac:SUNATRetentionDocumentReference)"/>
		</xsl:if>
	</xsl:variable>
<!-- CONTADOR -->
	
	<xsl:variable name="totalpag">
		<xsl:if test="$totalitems &lt; '31'">
			<xsl:value-of select="1"/>
		</xsl:if>
		<xsl:if test="$totalitems &gt;'30' and $totalitems &lt;'61'">
			<xsl:value-of select="2"/>
		</xsl:if>
		<xsl:if test="$totalitems &gt;'60' and $totalitems &lt;'91'">
			<xsl:value-of select="3"/>
		</xsl:if>
		<xsl:if test="$totalitems &gt;'90' and $totalitems &lt;'121'">
			<xsl:value-of select="4"/>
		</xsl:if>
		<xsl:if test="$totalitems &gt;'120' and $totalitems &lt;'151'">
			<xsl:value-of select="5"/>
		</xsl:if>
		<!--<xsl:if test="$totalitems &gt;'20'" >
					<xsl:value-of select="ceiling($totalitems div 30)" />
				</xsl:if>-->
	</xsl:variable>

	<xsl:variable name="goultpag">
		<xsl:value-of select="$totalitems - ($totalitems mod 30)"/>
	</xsl:variable>

	<xsl:variable name="Utima_pagina">
		<xsl:value-of select="$totalpag"/>
	</xsl:variable>

	<xsl:include href="xRETRECO_encab.xslt"/>
	<xsl:include href="xRETRECO_detalle.xslt"/>
	<xsl:include href="xRETRECO_bottom.xslt"/>
	<xsl:include href="xRETRECO_datos.xslt"/>
	<xsl:include href="xRETRECO_total.xslt"/>
	<xsl:template match="/">
		<html xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		      xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
		      xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
		      xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2"
		      xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2" xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2">
			<head>
				<title>Comprobante Electrónico</title>
				<style type="text/css">@media print {
							    * {color: black;}
							    div.saltar-pagina {page-break-after: always;  }
							} 
				
				.redondeo
		{
			border-radius: 16px 16px 16px 16px;
			-moz-border-radius: 16px 16px 16px 16px;
			-webkit-border-radius: 16px 16px 16px 16px;
			border: 2px solid #000000;
		}</style>
		
			</head>
			<body>
				<h1>
					<table cellSpacing="1" width="100%" border="0">
						<thead style="display: table-header-group">
							<th>
								<xsl:call-template name="Encabezado"/>
							</th>

							<tr>
								<th>
									<xsl:call-template name="DatosReceptor"/>
								</th>
							</tr>
							<tr>
								<th>
									<xsl:call-template name="ReferenciaItem"/>
								</th>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="Encabezadodetalle"/>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<xsl:call-template name="DetallesEncabezado"/>
								</td>
							</tr>

							<xsl:if test="$Utima_pagina ='1'">
								<tr>
									<td>
										<xsl:call-template name="Total"/>
									</td>
								</tr>
							
							
						
							<tr width="100%">

								<td>
									<xsl:call-template name="Monto_Letras"/>
								</td>
							</tr>
							</xsl:if>
						</tbody>
						<tfoot>
							<tr>
								<td width="100%" colspan="3">
									<br/>
									<hr size="2" width="100%" color="#000000"/>
								</td>
							</tr>
							<tr width="100%">
								<td>
									<xsl:call-template name="bottom_hash"/>
								</td>
							</tr>
							<tr width="100%" align="right">
								<td>Página 1 de <xsl:value-of select="$totalpag"/></td>
							</tr>
						</tfoot>
					</table>
				</h1>
				<xsl:if test="$FL &gt;'31'">
					<div class="saltar-pagina">
					</div>
					<h2>
						<table cellSpacing="1" width="100%" border="0">
							<thead style="display: table-header-group">
								<th>
									<xsl:call-template name="Encabezado"/>
								</th>

								<tr>
									<th>
										<xsl:call-template name="DatosReceptor"/>
									</th>
								</tr>
								<tr>
									<th>
										<xsl:call-template name="ReferenciaItem"/>
									</th>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="Encabezadodetalle"/>
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado2"/>
									</td>
								</tr>
								<xsl:if test="$Utima_pagina ='2'">
									<tr>
										<td>
											<xsl:call-template name="Total"/>
										</td>
									</tr>
								
								
								<tr width="100%">

									<td>
										<xsl:call-template name="Monto_Letras"/>
									</td>
								</tr>
								</xsl:if>
							</tbody>
							 <tfoot> 
								<tr>
									<td width="100%" colspan="3">
										<br/>
										<hr size="2" width="100%" color="#000000"/>
									</td>
								</tr>
								<tr width="100%">
									<td>
										<xsl:call-template name="bottom_hash"/>
									</td>
								</tr>
								<tr width="100%" align="right">
									<td>Página 2 de <xsl:value-of select="$totalpag"/></td>
								</tr>
							</tfoot> 
						</table>
					</h2>
				</xsl:if>
				<xsl:if test="$FL &gt;'61'">

					<div class="saltar-pagina">
					</div>
					<h3>
						<table cellSpacing="1" width="100%" border="0">
							<thead style="display: table-header-group">
								<th>
									<xsl:call-template name="Encabezado"/>
								</th>

								<tr>
									<th>
										<xsl:call-template name="DatosReceptor"/>
									</th>
								</tr>
								<tr>
									<th>
										<xsl:call-template name="ReferenciaItem"/>
									</th>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="Encabezadodetalle"/>
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado3"/>
									</td>
								</tr>
								<xsl:if test="$Utima_pagina ='3'">
									<tr>
										<td>
											<xsl:call-template name="Total"/>
										</td>
									</tr>
								
								
								<tr width="100%">

									<td>
										<xsl:call-template name="Monto_Letras"/>
									</td>
								</tr>
								</xsl:if>
							</tbody>
							 <tfoot> 
								<tr>
									<td width="100%" colspan="3">
										<br/>
										<hr size="2" width="100%" color="#000000"/>
									</td>
								</tr>
								<tr width="100%">
									<td>
										<xsl:call-template name="bottom_hash"/>
									</td>
								</tr>
								<tr width="100%" align="right">
									<td>Página 3 de <xsl:value-of select="$totalpag"/></td>
								</tr>
							 </tfoot> 
						</table>
					</h3>
				</xsl:if>
				<xsl:if test="$FL &gt;'91'">

					<div class="saltar-pagina">
					</div>
					<h4>
						<table cellSpacing="1" width="100%" border="0">
							<thead style="display: table-header-group">
								<th>
									<xsl:call-template name="Encabezado"/>
								</th>

								<tr>
									<th>
										<xsl:call-template name="DatosReceptor"/>
									</th>
								</tr>
								<tr>
									<th>
										<xsl:call-template name="ReferenciaItem"/>
									</th>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="Encabezadodetalle"/>
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado4"/>
									</td>
								</tr>
								<xsl:if test="$Utima_pagina ='4'">
									<tr>
										<td>
											<xsl:call-template name="Total"/>
										</td>
									</tr>
								
								
								<tr width="100%">

									<td>
										<xsl:call-template name="Monto_Letras"/>
									</td>
								</tr>
								</xsl:if>
							</tbody>
							<tfoot>
								<tr>
									<td width="100%" colspan="3">
										<br/>
										<hr size="2" width="100%" color="#000000"/>
									</td>
								</tr>
								<tr width="100%">
									<td>
										<xsl:call-template name="bottom_hash"/>
									</td>
								</tr>
								<tr width="100%" align="right">
									<td>Página 4 de <xsl:value-of select="$totalpag"/></td>
								</tr>
							</tfoot>
						</table>
					</h4>
				</xsl:if>
				<xsl:if test="$FL &gt;'121'">

					<div class="saltar-pagina">
					</div>
					<h5>
						<table cellSpacing="1" width="100%" border="0">
							<thead style="display: table-header-group">
								<th>
									<xsl:call-template name="Encabezado"/>
								</th>

								<tr>
									<th>
										<xsl:call-template name="DatosReceptor"/>
									</th>
								</tr>
								<tr>
									<th>
										<xsl:call-template name="ReferenciaItem"/>
									</th>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="Encabezadodetalle"/>
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<xsl:call-template name="DetallesEncabezado5"/>
									</td>
								</tr>
								<xsl:if test="$Utima_pagina ='5'">
									<tr>
										<td>
											<xsl:call-template name="Total"/>
										</td>
									</tr>
								
								
								<tr width="100%">

									<td>
										<xsl:call-template name="Monto_Letras"/>
									</td>
								</tr>
								</xsl:if>
							</tbody>
							<tfoot>
								<tr>
									<td width="100%" colspan="3">
										<br/>
										<hr size="2" width="100%" color="#000000"/>
									</td>
								</tr>
								<tr width="100%">
									<td>
										<xsl:call-template name="bottom_hash"/>
									</td>
								</tr>
								<tr width="100%" align="right">
									<td>Página 5 de <xsl:value-of select="$totalpag"/></td>
								</tr>
							</tfoot>
						</table>
					</h5>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<!-- TIPO DE CAMBIO DEL COMPROBANTES -->
	<xsl:variable name="varTipCambio">
		<xsl:value-of select="/pe:Retention/sac:SUNATRetentionDocumentReference/sac:SUNATRetentionInformation/cac:ExchangeRate/cbc:CalculationRate"/>
	</xsl:variable>
	<!-- MONTO LITERAL DEL COMPROBANTES -->
	<xsl:variable name="MontoLiteral">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="01"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VALOR SEGUN NRO DE VARAIBLE -->
	<xsl:template name="TraeValorVariable">
		<xsl:param name="varNumVA"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA">
				<xsl:if test="pe:Valor!='-'">
					<xsl:value-of select="pe:Valor"/>
				</xsl:if>
			</xsl:if>
			<!-- &#160; -->
			<!--</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$varNumVA">
				<xsl:if test="pe1:Valor!='-'">
					<xsl:value-of select="pe1:Valor"/>
				</xsl:if>
			</xsl:if>
			 &#160; 
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$varNumVA">
				<xsl:if test="pe2:Valor!='-'">
					<xsl:value-of select="pe2:Valor"/>
				</xsl:if>
			</xsl:if>
			 &#160; -->
		</xsl:for-each>
	</xsl:template>
	<!-- TIPO DE MONEDA -->
	<xsl:template name="TipoDeMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Retention/sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/@currencyID='PEN'">SOL</xsl:when>
			<xsl:when test="/pe:Retention/sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/@currencyID='USD'">USD</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- TIPO DE REFERENCIA -->
	<xsl:template name="TipoDeRefe">
		<xsl:choose>
			<xsl:when test="/pe:Retention/sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/cbc:ID/@schemeID='01'">Factura</xsl:when>
			<xsl:when test="/pe:Retention/sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/cbc:ID/@schemeID='03'">Boleta</xsl:when>
			<xsl:when test="/pe:Retention/sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/cbc:ID/@schemeID='07'">N. Crédito</xsl:when>
			<xsl:when test="/pe:Retention/sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/cbc:ID/@schemeID='08'">N. Débito</xsl:when>
			<xsl:otherwise>Documento NN</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\..\..\..\..\..\..\..\..\..\..\GeneradorPDF\20101396437\XML\20100018625&#x2D;20&#x2D;R001&#x2D;00016359.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="321" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="201" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="161" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="281" y="69"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->