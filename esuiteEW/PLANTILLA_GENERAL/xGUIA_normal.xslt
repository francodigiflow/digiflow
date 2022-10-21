<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:DespatchAdvice-1"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2"
                exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi sac">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="ValorTramo">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="12"/>	
		</xsl:call-template>			
	</xsl:variable>
	<xsl:variable name="ValorTramo2">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="14"/>	
		</xsl:call-template>			
	</xsl:variable>
	
	<xsl:variable name="QItem">
		<xsl:value-of select="count(//cac:DespatchLine)"/>
	</xsl:variable>
	
	<xsl:variable name="numColBl">
		<xsl:value-of select="40-count(//cac:DespatchLine)"/>
	</xsl:variable>

	<xsl:variable name="numColB2">

		<xsl:value-of select="40-count(//cac:DespatchLine)"/>
	</xsl:variable>
	<xsl:variable name="numColB3">
		<xsl:value-of select="40-count(//cac:DespatchLine)"/>
	</xsl:variable>

	<xsl:variable name="v_StatusMultiPagina">
		<xsl:value-of select="'S'"/>
	</xsl:variable>

	<xsl:include href="xGUIA_encab.xslt"/>
	<xsl:include href="xGUIA_detalle.xslt"/>
	<xsl:include href="xGUIA_bottom.xslt"/>
	<xsl:include href="xGUIA_datos.xslt"/>
	<xsl:include href="xGUIA_total.xslt"/>

	<xsl:variable name="v_ItemPorPagina1">
		<xsl:value-of select="11"/>
	</xsl:variable>
	<xsl:variable name="v_ItemPorPagina">
		<xsl:value-of select="30"/>
	</xsl:variable>


	<xsl:variable name="varPagRestoSeccionesFinales">
		<xsl:value-of select="20 div $v_ItemPorPagina"/>
	</xsl:variable>

	<xsl:variable name="v_CantidadRestoPagina">
		<xsl:value-of select="$v_ItemTotal - $v_ItemPorPagina1"/>
	</xsl:variable>

	<xsl:variable name="v_CantidadTotalPagina">
		<xsl:if test="$QItem &gt; 0 and $QItem &lt;= 11">
			<xsl:value-of select="1"/>
		</xsl:if>
		<xsl:if test="$QItem &gt; 11 and $QItem &lt;= 38">
			<xsl:value-of select="2"/>
		</xsl:if>
		<xsl:if test="$QItem &gt; 38 and $QItem &lt;= 80">
			<xsl:value-of select="3"/>
		</xsl:if>
		<xsl:if test="$QItem &gt; 80 and $QItem &lt;= 100">
			<xsl:value-of select="4"/>
		</xsl:if>
			
	</xsl:variable>
	
	<xsl:variable name="Pag">
		<xsl:if test="$QItem &gt; 0 and $QItem &lt;= 11">
			<xsl:value-of select="1"/>
		</xsl:if>
		<xsl:if test="$QItem &gt; 11 and $QItem &lt;= 38">
			<xsl:value-of select="2"/>
		</xsl:if>
		<xsl:if test="$QItem &gt; 38 and $QItem &lt;= 80">
			<xsl:value-of select="3"/>
		</xsl:if>
		<xsl:if test="$QItem &gt; 80 and $QItem &lt;= 100">
			<xsl:value-of select="4"/>
		</xsl:if>
			
	</xsl:variable>

	<xsl:variable name="v_ItemTotal">
		<!--<xsl:if test="/pe:DespatchAdvice!=''">-->
		<xsl:value-of select="count(//cac:DespatchLine)"/>
		<!--</xsl:if>-->
	</xsl:variable>

	<xsl:template match="/">
		<html xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		      xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:DespatchAdvice-1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
		      xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
		      xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2"
		      xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2" xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2">
			<head>
				<title>Comprobante Electrónico</title>
				<style>.td_Cabecera
			    {
			        padding:0px;
			        height:1px;
					line-height: 1.4;
					font-size: 8;
					font-family: Arial, Helvetica, Sans-serif;
					color: #ff7e16;
				  	background-color: white;
			    }
			    .td_Detalle
			    {
			        padding:0px;
			        height:1px;
					line-height: 1.4;
					font-size: 9;
					font-family: Bahnschrift Condendsed;
					color: black;
				  	background-color: white;
			    }
				.contenido{
					font-size: 0.8;
					line-height: 1;
				}
				.redondeo {
					border-radius: 10px 10px 10px 10px;
					-moz-border-radius: 10px 10px 10px 10px;
					-webkit-border-radius: 10px 10px 10px 10px;
					border: 1px solid #ff7e16;
				}
				.recuadro {
					border: 1px solid #ff7e16;
				}
				div.saltar-pagina {
					page-break-after: always;  
				}
				.page {
			        width: 250mm;
			        min-height: 315mm;
			        padding: 5mm;
					margin: 5mm auto;
			        border-radius: 0px;
			        background: white;
			    }
			    @media print {
			        html, body {
			            width: 250mm;
			            height: 315mm;        
			        }
			        .page {
			            margin: 0;
			            border: initial;
			            border-radius: initial;
			            width: initial;
			            min-height: initial;
			            box-shadow: initial;
			            background: initial;
			            page-break-after: always;
			        }
			    }</style>
			</head>
			<body>
				<xsl:if test="$v_StatusMultiPagina='S'">
					<xsl:call-template name="tmpSiMultipagina">
						<xsl:with-param name="cont" select="$v_CantidadTotalPagina"/>
						<xsl:with-param name="ContadorItem" select="1"/>
						<!-- NRO DE PAG. -->
					</xsl:call-template>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="tmpSiMultipagina">
		<xsl:param name="cont"/>
		<!-- caNT. TOTAL DE PAG -->
		<xsl:param name="ContadorItem"/>
		<!-- nRO DE PAG ACT -->

		<xsl:if test="$cont &gt; 0">

			<div class="page">

				<table cellSpacing="0" width="100%" border="0">
					<thead>
						<tr>
							<td align="right">
								<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
									<xsl:value-of select="concat($ContadorItem ,' de ', ceiling($v_CantidadTotalPagina) )"/>
								</font>
							</td>
						</tr>
					</thead>
					<!-- <tfoot> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="CuadroConformidad"/> -->
							<!-- </td> -->
						<!-- </tr> -->
					<!-- </tfoot> -->
					<tbody>
						<div class="content">
							<!--<tr>
								<td>&#xA0;</td>
							</tr>-->
							<!-- CABECERA -->
							<tr>
								<td>
									<xsl:call-template name="Encabezado"/>
								</td>
							</tr>
							<xsl:if test="$ContadorItem = 1">
								<!-- DATOS CLIENTE -->
								<tr>
									<td>
										<xsl:call-template name="Datos_Puntos"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="DatosReceptor"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="Cuadro_Conductor_Transporte"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="Cuadro_Referencias"/>
									</td>
								</tr>
								<xsl:if test="$ValorTramo != '' and $ValorTramo !='-' ">
									<tr>
										<td>
											<xsl:call-template name="Cuadro_Tramos"/>
										</td>
									</tr>
								</xsl:if>
								<!-- <tr> -->
									<!-- <td> -->
										
									<!-- </td> -->
								<!-- </tr> -->
							</xsl:if>
							<!-- DETALLE -->
							<tr>
								<td>
									<!--<xsl:if test="$ContadorItem = 1">-->
									<xsl:call-template name="DetalleMultipagina">
										<xsl:with-param name="v_ItemPorPagina" select="$v_ItemPorPagina"/>
										<xsl:with-param name="v_Contador" select="$ContadorItem"/>
										<!-- nRO DE PAG -->
									</xsl:call-template>
									<!--</xsl:if>-->
									<!--<xsl:if test="$ContadorItem &gt; 1">
								<xsl:call-template name="DetalleMultipagina">
									<xsl:with-param name="v_ItemPorPagina" select="$v_ItemPorPagina"/>
									<xsl:with-param name="v_Contador" select="$ContadorItem"/>  nRO DE PAG 								
								</xsl:call-template>
								</xsl:if>-->
								</td>
							</tr>
							<xsl:if test="$ContadorItem = $Pag">
							<tr>
								<td>						
									 <xsl:call-template name="CuadroConformidad"/>
									
								</td>
							</tr>
							</xsl:if>
							<!-- /div>
					  <div class="push"></div>
					  <div class="footer" -->
							<xsl:if test="$ContadorItem = $v_CantidadTotalPagina">
								<!-- xsl:if test="$ContadorItem = ceiling($v_CantidadTotalPagina)" -->
								<!-- xsl:if test="($ContadorItem + $varPagRestoSeccionesFinales) = ceiling($v_CantidadTotalPagina)" -->
								<!-- TOTALES -->
								<tr>
									<td>
										<hr style="border-collapse: separate; border-color: white; border: 0px solid white;"/>
										<!--<xsl:call-template name="Totales"/>-->
									</td>
								</tr>
							</xsl:if>
						</div>
					</tbody>
				</table>
			</div>



			<!--<xsl:if test="$v_ItemTotal &gt; $v_ItemPorPagina">-->
			<!-- xsl:if test="($v_ItemTotal - ($v_ItemPorPagina*( number($ContadorItem) - 1))) &gt; $v_ItemPorPagina" -->
			<xsl:if test="$cont &gt; 1">
				<div class="saltar-pagina"/>
			</xsl:if>

			<xsl:call-template name="tmpSiMultipagina">
				<xsl:with-param name="cont" select="$cont - 1"/>
				<xsl:with-param name="ContadorItem" select="$ContadorItem+1"/>
			</xsl:call-template>
			<!--</xsl:if>-->
		</xsl:if>
	</xsl:template>

	



	<xsl:variable name="totalpag">

		<xsl:if test="($numitems) &lt;'12'">
			<xsl:value-of select="1"/>
		</xsl:if>
		<xsl:if test="($numitems) &gt;'11'  and ($numitems) &lt;'39' ">
			<xsl:value-of select="2"/>
		</xsl:if>
		<xsl:if test="($numitems) &gt;'38' ">
			<xsl:value-of select="3"/>
		</xsl:if>
	</xsl:variable>

	<xsl:template name="ModalidadTraslado">
		<xsl:choose>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='01'">Venta</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='14'">Venta sujeta a confirmación del comprador</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='02'">Compra</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='04'">Traslado entre establecimientos de la misma empresa</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='18'">Traslado emisor itinerante CP</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='08'">Importación</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='09'">Exportación</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='19'">Traslado a zona primaria</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='13'">Otros</xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!--</xsl:template>-->
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\XML\20527030421&#x2D;09&#x2D;T004&#x2D;0000476.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="321" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="201" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="161" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="281" y="69"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->