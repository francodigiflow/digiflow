<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Perception-1"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
				xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
				xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
				xmlns:ccts="urn:un:unece:uncefact:documentation:2"
                exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="numColBl">
		<xsl:if test="/pe:Perception!=''">
			<xsl:value-of select="10-count(/pe:Perception/cac:InvoiceLine)"/>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="numColBl2">
		<xsl:if test="/pe:Perception!=''">
			<xsl:value-of select="10-count(/pe:Perception/cac:InvoiceLine)"/>
		</xsl:if>
	</xsl:variable>

	<xsl:variable name="totalitems">
		<!--<xsl:value-of select="count(/pe:Invoice/cac:InvoiceLine/cbc:ID)"/>-->
		<!--<xsl:if test="/pe:Perception != ''">-->
			<!--<xsl:value-of select="count(/pe:Invoice/cac:InvoiceLine)"/>-->
			<xsl:value-of select="count(//sac:SUNATPerceptionDocumentReference)"/>
		<!--</xsl:if>-->
	</xsl:variable>
	<!-- CONTADOR -->
	<!--<xsl:variable name="FL">
		<xsl:value-of select="count(//sac:SUNATRetentionDocumentReference)"/>
	</xsl:variable>-->

	<xsl:variable name="totalpag">
		<!--<xsl:if test="$totalitems &lt; '31'">
			<xsl:value-of select="01"/>			
		</xsl:if>
		<xsl:if test="$totalitems &gt;'30' and $totalitems &lt;'61'">
			<xsl:value-of select="02"/>			
		</xsl:if>
		<xsl:if test="$totalitems &gt;'60' and $totalitems &lt;'91'">
			<xsl:value-of select="03"/>			
		</xsl:if>
		<xsl:if test="$totalitems &gt;'90' and $totalitems &lt;'121'">
			<xsl:value-of select="04"/>			
		</xsl:if>-->
		<!--<xsl:if test="$totalitems &gt;'30'" >
			<xsl:value-of select="ceiling($totalitems div 30)" />
		</xsl:if>-->
		<xsl:value-of select="ceiling($totalitems div 30)" />
	</xsl:variable>

	<xsl:variable name="goultpag">
		<xsl:value-of select="$totalitems - ($totalitems mod 30)"/>
	</xsl:variable>

	<xsl:include href="xPERRECO_encab.xslt"/>
	<xsl:include href="xPERRECO_detalle.xslt"/>
	<xsl:include href="xPERRECO_bottom.xslt"/>
	<xsl:include href="xPERRECO_datos.xslt"/>
	<xsl:include href="xPERRECO_total.xslt"/>
	<xsl:template match="/">
		<html xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
		      xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
		      xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
		      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		      xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2">
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
						</tbody>
					</table>
				</h1>
				<xsl:if test="$FL &gt;'30'">

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
							</tbody>
						</table>
					</h2>

				</xsl:if>
				<xsl:if test="$FL &gt;'60'">
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
							</tbody>
						</table>
					</h3>

				</xsl:if>

				<xsl:if test="$FL &gt;'90'">
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
							</tbody>
						</table>
					</h4>

				</xsl:if>
				
				<xsl:if test="$FL &gt;'120'">
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
							</tbody>
						</table>
					</h5>

				</xsl:if>

				<xsl:if test="$FL &gt;'150'">
					<div class="saltar-pagina">
					</div>
					<h6>
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
										<xsl:call-template name="DetallesEncabezado6"/>
									</td>
								</tr>
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
										<td>Página 6 de <xsl:value-of select="$totalpag"/></td>										
									</tr>
								</tfoot>
							</tbody>
						</table>
					</h6>

				</xsl:if>

			</body>
		</html>
	</xsl:template>

	
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
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="no" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\..\out\xml\20100018625&#x2D;40&#x2D;P019&#x2D;11001346.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator=""/><scenario default="yes" name="Scenario2" userelativepaths="yes" externalpreview="yes" url="xml\20100018625&#x2D;40&#x2D;P001&#x2D;00002158.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="321" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="201" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="161" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="281" y="69"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->