<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:DespatchAdvice-1"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
				xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
				xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
				xmlns:ccts="urn:un:unece:uncefact:documentation:2"
                exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi sac">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="numColBl">
		<xsl:if test="/pe:DespatchAdvice!=''">
			<xsl:value-of select="50-count(/pe:DespatchAdvice/cac:DespatchLine)"/>
		</xsl:if>
	<!-- <xsl:value-of select="20-count(//cac:DespatchLine)"/> -->
	</xsl:variable>
	
	
	<xsl:include href="xGUIA_encab.xslt"/>
	<xsl:include href="xGUIA_detalle.xslt"/>
	<xsl:include href="xGUIA_bottom.xslt"/>
	<xsl:include href="xGUIA_datos.xslt"/>
	<xsl:include href="xGUIA_total.xslt"/>
	
	<xsl:variable name="ref">
		<xsl:value-of select="0"/>
		<xsl:if test="//cac:AdditionalDocumentReference/cbc:ID">
			<xsl:value-of select="1"/>
		</xsl:if>
	</xsl:variable>
	
	<xsl:template match="/">
		<html xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		      xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
		      xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
		      xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2"
		      xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2" xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2">
			<head>
				<title>Comprobante Electrónico</title>
				<style>div.saltar-pagina {page-break-after: always;  }</style>
			</head>
			<body>
			<h1>
				<table cellSpacing="1" width="100%" border="0">
					<tbody>
					<div align="right">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
					<strong>
					1 de <xsl:value-of select="$totalpag"/>&#160;&#160;
					</strong>
					</font>
					</div>	
						<tr>
							<td>
								<xsl:call-template name="Encabezado"/>
							</td>
						</tr>
						<tr>						
							<td>
								<xsl:call-template name="Datos_Puntos"/>
							</td>
						</tr>
						<tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
						<tr>
							<td>
								<xsl:call-template name="DatosReceptor"/>
							</td>
						</tr>
						<tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
						<tr>
							<td>
								<xsl:call-template name="MotivoTraslado"/>
							</td>
						</tr>
						<tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
						<tr>
							<td>
								<xsl:call-template name="Cuadro_Conductor_Transporte"/>
								<br/>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:call-template name="DetallesEncabezado"/>
							</td>
						</tr>
						
					</tbody>
				</table>
			</h1>
			
<xsl:if test="($numitems + $totadicionales) &gt;'30'">		
			<xsl:variable name="FF">
				<xsl:value-of select="count(//cac:DespatchLine/cbc:ID)"/>
			</xsl:variable>
						
					<div class="saltar-pagina">
						&#160;</div>
					<h2>
					<table cellSpacing="1" width="100%" border="0">
					<tbody>
						<div align="right">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
					<strong>
					2 de <xsl:value-of select="$totalpag"/>&#160;&#160;
					</strong>
					</font>
					</div>	
						<tr>
							<td>
								<xsl:call-template name="Encabezado"/>
							</td>
						</tr>
						
						<tr>
							<td>
								<xsl:call-template name="DetallesEncabezado2"/>
							</td>
						</tr>

					</tbody>
				</table>
				</h2>
		</xsl:if>		
			
<xsl:if test="($numitems + $totadicionales) &gt;'80'">			
			<xsl:variable name="FF">
				<xsl:value-of select="count(//cac:DespatchLine/cbc:ID)"/>
			</xsl:variable>
						
					<div class="saltar-pagina">
						&#160;</div>
					<h3>
					<table cellSpacing="1" width="100%" border="0">
					<tbody>
						<div align="right">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
					<strong>
					3 de <xsl:value-of select="$totalpag"/>&#160;&#160;
					</strong>
					</font>
					</div>	
						<tr>
							<td>
								<xsl:call-template name="Encabezado"/>
							</td>
						</tr>
						
						<tr>
							<td>
								<xsl:call-template name="DetallesEncabezado3"/>
							</td>
						</tr>

					</tbody>
				</table>
				</h3>
		</xsl:if>		
		
			<!-- <xsl:if test="$FF &gt;'16'"> -->
					
				<!-- <div class="saltar-pagina"> -->
						<!-- &#160;</div> -->
					<!-- <h3> -->
					<!-- <table cellSpacing="1" width="100%" border="0"> -->
					<!-- <tbody> -->
						<!-- <div align="right"> -->
					<!-- <font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> -->
					<!-- <strong> -->
					<!-- 3 de <xsl:value-of select="$totalpag"/>&#160;&#160; -->
					<!-- </strong> -->
					<!-- </font> -->
					<!-- </div>	 -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="Encabezado"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="DetallesEncabezado3"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						
					<!-- </tbody> -->
				<!-- </table> -->
				<!-- </h3> -->
			<!-- </xsl:if>	 -->
			<!-- <xsl:if test="$FF &gt;'32'"> -->
					
				<!-- <div class="saltar-pagina">&#160;</div> -->
					<!-- <h4> -->
					<!-- <table cellSpacing="1" width="100%" border="0"> -->
					<!-- <tbody> -->
						<!-- <div align="right"> -->
					<!-- <font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> -->
					<!-- <strong> -->
					<!-- 4 de <xsl:value-of select="$totalpag"/>&#160;&#160; -->
					<!-- </strong> -->
					<!-- </font> -->
					<!-- </div>	 -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="Encabezado"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="DetallesEncabezado4"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <br/><br/><br/> -->
							<!-- </td> -->
						<!-- </tr> -->
					<!-- </tbody> -->
				<!-- </table> -->
				<!-- </h4> -->
			<!-- </xsl:if>		 -->
			<!-- <xsl:if test="$FF &gt;'83'"> -->
					
				<!-- <div class="saltar-pagina">&#160;</div> -->
					<!-- <h5> -->
					<!-- <table cellSpacing="1" width="100%" border="0"> -->
					<!-- <tbody> -->
						<!-- <div align="right"> -->
					<!-- <font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> -->
					<!-- <strong> -->
					<!-- 5 de <xsl:value-of select="$totalpag"/>&#160;&#160; -->
					<!-- </strong> -->
					<!-- </font> -->
					<!-- </div>	 -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="Encabezado"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="DetallesEncabezado5"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <br/><br/><br/> -->
							<!-- </td> -->
						<!-- </tr>						 -->
					<!-- </tbody> -->
				<!-- </table> -->
				<!-- </h5> -->
			<!-- </xsl:if>					 -->
			<!-- <xsl:if test="$FF &gt;'134'"> -->
					
				<!-- <div class="saltar-pagina">&#160;</div> -->
					<!-- <h6> -->
					<!-- <table cellSpacing="1" width="100%" border="0"> -->
					<!-- <tbody> -->
					<!-- <div align="right"> -->
					<!-- <font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> -->
					<!-- <strong> -->
					<!-- 6 de <xsl:value-of select="$totalpag"/>&#160;&#160; -->
					<!-- </strong> -->
					<!-- </font> -->
					<!-- </div>	 -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="Encabezado"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="DetallesEncabezado6"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <br/><br/><br/> -->
							<!-- </td> -->
						<!-- </tr> -->
					<!-- </tbody> -->
				<!-- </table> -->
				<!-- </h6> -->
			<!-- </xsl:if>	 -->
			<!-- <xsl:if test="$FF &gt;'185'"> -->
					
				<!-- <div class="saltar-pagina">&#160;</div> -->
					<!-- <h7> -->
					<!-- <table cellSpacing="1" width="100%" border="0"> -->
					<!-- <tbody> -->
						<!-- <div align="right"> -->
					<!-- <font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> -->
					<!-- <strong> -->
					<!-- 7 de <xsl:value-of select="$totalpag"/>&#160;&#160; -->
					<!-- </strong> -->
					<!-- </font> -->
					<!-- </div>	 -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="Encabezado"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="DetallesEncabezado7"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <br/><br/><br/><br/> -->
							<!-- </td> -->
						<!-- </tr> -->
					<!-- </tbody> -->
				<!-- </table> -->
				<!-- </h7> -->
			<!-- </xsl:if>	 -->
			<!-- <xsl:if test="$FF &gt;'236'"> -->
					
				<!-- <div class="saltar-pagina">&#160;</div> -->
					<!-- <h8> -->
					<!-- <table cellSpacing="1" width="100%" border="0"> -->
					<!-- <tbody> -->
						<!-- <div align="right"> -->
					<!-- <font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> -->
					<!-- <strong> -->
					<!-- 8 de <xsl:value-of select="$totalpag"/>&#160;&#160; -->
					<!-- </strong> -->
					<!-- </font> -->
					<!-- </div>	 -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="Encabezado"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="DetallesEncabezado8"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <br/><br/><br/><br/> -->
							<!-- </td> -->
						<!-- </tr> -->
					<!-- </tbody> -->
				<!-- </table> -->
				<!-- </h8> -->
			<!-- </xsl:if> -->
			<!-- <xsl:if test="$FF &gt;'287'"> -->
				
				<!-- <div class="saltar-pagina">&#160;</div> -->
					<!-- <h9> -->
					<!-- <table cellSpacing="1" width="100%" border="0"> -->
					<!-- <tbody> -->
						<!-- <div align="right"> -->
					<!-- <font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> -->
					<!-- <strong> -->
					<!-- 9 de <xsl:value-of select="$totalpag"/>&#160;&#160; -->
					<!-- </strong> -->
					<!-- </font> -->
					<!-- </div>	 -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="Encabezado"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="DetallesEncabezado9"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <br/><br/><br/><br/> -->
							<!-- </td> -->
						<!-- </tr> -->
					<!-- </tbody> -->
				<!-- </table> -->
				<!-- </h9> -->
			<!-- </xsl:if>	 -->
			
			<!-- <xsl:if test="$FF &gt;'338'">					 -->
				<!-- <div class="saltar-pagina">&#160;</div> -->
					
					<!-- <h10> -->
					<!-- <table cellSpacing="1" width="100%" border="0"> -->
					<!-- <tbody> -->
						<!-- <div align="right"> -->
					<!-- <font color="#000000" size="2" face="Arial, Helvetica, sans-serif"> -->
					<!-- <strong> -->
					<!-- 10 de <xsl:value-of select="$totalpag"/>&#160;&#160; -->
					<!-- </strong> -->
					<!-- </font> -->
					<!-- </div>	 -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="Encabezado"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <xsl:call-template name="DetallesEncabezado10"/> -->
							<!-- </td> -->
						<!-- </tr> -->
						<!-- <tr> -->
							<!-- <td> -->
								<!-- <br/><br/><br/> -->
							<!-- </td> -->
						<!-- </tr> -->
					<!-- </tbody> -->
				<!-- </table> -->
				<!-- </h10> -->
			<!-- </xsl:if> -->
			
			</body>
		</html>
	</xsl:template>
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
	
	<xsl:variable name="totalitems">
		<xsl:value-of select="count(//cac:DespatchLine/cbc:ID)"/>
	</xsl:variable>	

	<xsl:variable name="totalpag">				
		
		<xsl:if test="($numitems + $totadicionales) &lt;'31'">
			<xsl:value-of select="1" />
		</xsl:if>
		<xsl:if test="($numitems + $totadicionales) &gt;'30'  and ($numitems + $totadicionales) &lt;'81' ">
			<xsl:value-of select="2" />
		</xsl:if>
		<xsl:if test="($numitems + $totadicionales) &gt;'80' ">
			<xsl:value-of select="3" />
		</xsl:if>
</xsl:variable>
	
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\20603630409&#x2D;09&#x2D;T004&#x2D;00000004.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="321" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="201" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="161" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="281" y="69"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->