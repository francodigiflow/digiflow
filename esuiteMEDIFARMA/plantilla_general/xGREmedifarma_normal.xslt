<?xml version='1.0' encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
                xmlns:ccts="urn:un:unece:uncefact:documentation:2"
                exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi sac">
	<xsl:output method="html"
	            indent="yes"
	            encoding="ISO-8859-1"
	            omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen"
	                    decimal-separator="."
	                    grouping-separator=","
	                    NaN=""/>
	<xsl:variable name="numColBl">
			<xsl:value-of select="33-count(//cac:DespatchLine)"/>
	</xsl:variable>
	<xsl:variable name="v_ItemPorPagina1"><xsl:value-of select="33"/></xsl:variable>
	<xsl:variable name="v_ItemPorPagina"><xsl:value-of select="33"/></xsl:variable>
	<xsl:param name="MaxPageTemp">
		
			<xsl:value-of select="count(/pe:DespatchAdvice/cac:DespatchLine) div 33 "/>
		
	</xsl:param>
	<xsl:variable name="MaxPage">
		<xsl:if test="$MaxPageTemp &lt;= 1">
			<xsl:value-of select="1"/>
		</xsl:if>
		<xsl:if test="$MaxPageTemp &gt; 1">
			<xsl:value-of select="$MaxPageTemp"/>
		</xsl:if>
	</xsl:variable>
	
	<xsl:variable name="v_CantidadRestoPagina">
		<xsl:value-of select="$v_ItemTotal - $v_ItemPorPagina1" />
	</xsl:variable>

	<xsl:variable name="v_CantidadTotalPagina">
	    <xsl:if test="$v_ItemTotal &lt; 33">	
		<xsl:value-of select="ceiling($v_ItemTotal div $v_ItemPorPagina)" />
		</xsl:if>

		<xsl:if test="$v_ItemTotal &gt; 33">
		<xsl:value-of select="ceiling($v_ItemTotal div $v_ItemPorPagina) + 1" />
		</xsl:if>
	</xsl:variable>
		<xsl:variable name="totalpag1">				
		
		<xsl:if test="$totalitems &lt; '33'" ><xsl:value-of select="1" /></xsl:if>
		<xsl:if test="$totalitems &gt; '33' and $totalitems &lt;'66'" ><xsl:value-of select="2" /></xsl:if>
		<xsl:if test="$totalitems &gt; '65' and $totalitems &lt;'98'" ><xsl:value-of select="3" /></xsl:if>
		<xsl:if test="$totalitems &gt; '97' and $totalitems &lt;'131'" ><xsl:value-of select="4" /></xsl:if>
		<xsl:if test="$totalitems &gt; '130' and $totalitems &lt;'163'" ><xsl:value-of select="5" /></xsl:if>
		<xsl:if test="$totalitems &gt; '162' and $totalitems &lt;'195'" ><xsl:value-of select="6" /></xsl:if>
		<xsl:if test="$totalitems &gt; '194' and $totalitems &lt;'228'" ><xsl:value-of select="7" /></xsl:if>
		
</xsl:variable>
<xsl:variable name="totalitems">
	<xsl:value-of select="count(/pe:DespatchAdvice/cac:DespatchLine)"/><!--</xsl:if>-->
		
</xsl:variable>	
	<xsl:variable name="v_ItemTotal">
	<xsl:value-of select="count(/pe:DespatchAdvice/cac:DespatchLine)"/><!--</xsl:if>-->
	</xsl:variable>
	
	<xsl:include href="xGREmedifarma_encab.xslt"/>
	<xsl:include href="xGREmedifarma_datos.xslt"/>
	<xsl:include href="xGREmedifarma_detalle.xslt"/>
	<xsl:include href="xGREmedifarma_total.xslt"/>
	<xsl:include href="xGREmedifarma_bottom.xslt"/>
	<xsl:template match="/">
		<html xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
		      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		      xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1"
		      xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
		      xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
		      xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
		      xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
		      xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		      xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
		      xmlns:ccts="urn:un:unece:uncefact:documentation:2"
		      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		      xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2"
		      xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2">
			<head>
				<title>Comprobante Electrónico</title>
				<style type="text/css">div.saltar-pagina {page-break-after: always;  }
				@font-face {
                        font-family: 'code_39';
                        src: url(data:font/truetype;charset=utf-8;base64,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) format('truetype');
                        font-weight: normal;
                        font-style: normal;
                }
            </style>
			</head>
			<body>
				<table cellSpacing="0"
				       width="100%"
				       border="0">
					<tbody width="90%">
						<tr width="100%"
						    align="rights">
							<td>
								<font face="Arial, Helvetica, sans-serif"
								      size="1"><!-- PÁGINA 1 de 1 -->
									  <xsl:value-of select="concat('PÁGINA 1' ,' de ', ceiling($totalpag1) )"/>
									  </font>
							</td>
						</tr>
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
								<xsl:call-template name="DetallesEncabezado"/>
							</td>
						</tr>
						
						 <xsl:if test="position() &gt;= $MaxPage ">
						<!--  <tfoot>  -->
						<tr>
						
								<td>
									<table cellSpacing="0"
									       cellPadding="0"
									       width="100%"
									       align="center"
									       border="0"
									       heigth="100%">
										<tbody>
											<tr>
												<td>
													<xsl:call-template name="Cuadros"/>
												</td>
											</tr>
											<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
												<tr>
													<td>
														<xsl:call-template name="CuadroPiePaginaNew"/>
													</td>
												</tr>
											</xsl:if>
											<tr>
												<td>
													<xsl:call-template name="bottom_hash"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							
						</tr>
							<!-- </tfoot> -->
						 </xsl:if>
					
						
					</tbody>
				</table>
				<xsl:variable name="FF">
				<xsl:value-of select="count(//cac:DespatchLine/cbc:ID)"/>
			</xsl:variable>
		<xsl:if test="$FF &gt;'33'">
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$LI"/-->&#xA0;</div>
					<h2>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
							<tbody width="100%">
								<tr width="100%"
								    align="rights">
									<td>
										<font face="Arial, Helvetica, sans-serif"
										      size="1"><!--PÁGINA 2  de 2 -->
											   <xsl:value-of select="concat('PÁGINA 2' ,' de ', ceiling($totalpag1) )"/>
											  
											  </font>
									</td>
								</tr>
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
							<xsl:if test="position()+1  &gt;= $MaxPage "> 
								<td>
									<table cellSpacing="0"
									       cellPadding="0"
									       width="100%"
									       align="center"
									       border="0"
									       heigth="100%">
										<tbody>
											<tr>
												<td>
													<xsl:call-template name="Cuadros"/>
												</td>
											</tr>
											<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
												<tr>
													<td>
														<xsl:call-template name="CuadroPiePaginaNew"/>
													</td>
												</tr>
											</xsl:if>
											<!-- <tr>
												<td>
													<xsl:call-template name="bottom_hash"/>
												</td>
											</tr> -->
										</tbody>
									</table>
								</td>
							 </xsl:if> 
						</tr>
						
							</tbody>
						</table>
					</h2>
				</xsl:if>
			    <xsl:if test="$FF &gt;'66'">
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$LI"/-->&#xA0;</div>
					<h3>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
							<tbody width="100%">
								<tr width="100%"
								    align="rights">
									<td>
										<font face="Arial, Helvetica, sans-serif"
										      size="1"><!-- PÁGINA 3 de 3 --> <xsl:value-of select="concat('PÁGINA 3' ,' de ', ceiling($totalpag1) )"/></font>
									</td>
								</tr>
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
										<xsl:call-template name="DetallesEncabezado3"/>
									</td>
								</tr>
								<tr>
									<xsl:if test="position()+2 &gt;= $MaxPage">
										<td>
											<table cellSpacing="0"
											       cellPadding="0"
											       width="100%"
											       align="center"
											       border="0"
											       heigth="100%">
												<tbody>
													<tr>
														<td>
															<xsl:call-template name="Cuadros"/>
														</td>
													</tr>
													<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
														<tr>
															<td>
																<xsl:call-template name="CuadroPiePaginaNew"/>
															</td>
														</tr>
													</xsl:if>
													<tr>
														<td>
															<xsl:call-template name="bottom_hash"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</xsl:if>
								</tr>
							</tbody>
						</table>
					</h3>
				</xsl:if>
				<xsl:if test="$FF &gt;'99'">
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$LI"/-->&#xA0;</div>
					<h4>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
							<tbody width="100%">
								<tr width="100%"
								     align="rights">
									<td>
										<font face="Arial, Helvetica, sans-serif"
										      size="1"><!-- PÁGINA 4 de 4 --> <xsl:value-of select="concat('PÁGINA 4' ,' de ', ceiling($totalpag1) )"/></font>
									</td>
								</tr>
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
									<xsl:if test="position()+3 &gt;= $MaxPage">
										<td>
											<table cellSpacing="0"
											       cellPadding="0"
											       width="100%"
											       align="center"
											       border="0"
											       heigth="100%">
												<tbody>
													<tr>
														<td>
															<xsl:call-template name="Cuadros"/>
														</td>
													</tr>
													<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
														<tr>
															<td>
																<xsl:call-template name="CuadroPiePaginaNew"/>
															</td>
														</tr>
													</xsl:if>
													<tr>
														<td>
															<xsl:call-template name="bottom_hash"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</xsl:if>
								</tr>
							</tbody>
						</table>
					</h4>
				</xsl:if>
				<xsl:if test="$FF &gt;'132'">
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$LI"/-->&#xA0;</div>
					<h5>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
							<tbody width="100%">
								<tr width="100%"
								    align="rights">
									<td>
										<font face="Arial, Helvetica, sans-serif"
										      size="1"><!-- PÁGINA 5 de 5 --> <xsl:value-of select="concat('PÁGINA 5' ,' de ', ceiling($totalpag1) )"/></font>
									</td>
								</tr>
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
										<xsl:call-template name="DetallesEncabezado5"/>
									</td>
								</tr>
								<tr>
									<xsl:if test="position()+4 &gt;= $MaxPage">
										<td>
											<table cellSpacing="0"
											       cellPadding="0"
											       width="100%"
											       align="center"
											       border="0"
											       heigth="100%">
												<tbody>
													<tr>
														<td>
															<xsl:call-template name="Cuadros"/>
														</td>
													</tr>
													<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
														<tr>
															<td>
																<xsl:call-template name="CuadroPiePaginaNew"/>
															</td>
														</tr>
													</xsl:if>
													<tr>
														<td>
															<xsl:call-template name="bottom_hash"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</xsl:if>
								</tr>
							</tbody>
						</table>
					</h5>
				</xsl:if>
				<xsl:if test="$FF &gt;'165'">
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$LI"/-->&#xA0;</div>
					<h6>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
							<tbody width="100%">
								<tr width="100%"
								     align="rights">
									<td>
										<font face="Arial, Helvetica, sans-serif"
										      size="1"><!-- PÁGINA 6 de 6 --> <xsl:value-of select="concat('PÁGINA 6' ,' de ', ceiling($totalpag1) )"/></font>
									</td>
								</tr>
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
										<xsl:call-template name="DetallesEncabezado6"/>
									</td>
								</tr>
								<tr>
									<xsl:if test="position()+5 &gt;= $MaxPage">
										<td>
											<table cellSpacing="0"
											       cellPadding="0"
											       width="100%"
											       align="center"
											       border="0"
											       heigth="100%">
												<tbody>
													<tr>
														<td>
															<xsl:call-template name="Cuadros"/>
														</td>
													</tr>
													<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
														<tr>
															<td>
																<xsl:call-template name="CuadroPiePaginaNew"/>
															</td>
														</tr>
													</xsl:if>
													<tr>
														<td>
															<xsl:call-template name="bottom_hash"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</xsl:if>
								</tr>
							</tbody>
						</table>
					</h6>
				</xsl:if>
				
				<xsl:if test="$FF &gt;'198'">
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$LI"/-->&#xA0;</div>
					<h7>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
							<tbody width="100%">
								<tr width="100%"
								    align="rights">
									<td>
										<font face="Arial, Helvetica, sans-serif"
										      size="1"><!-- PÁGINA 7 de 7 --> <xsl:value-of select="concat('PÁGINA 7' ,' de ', ceiling($totalpag1) )"/></font>
									</td>
								</tr>
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
										<xsl:call-template name="DetallesEncabezado7"/>
									</td>
								</tr>
								<tr>
									<xsl:if test="position()+6 &gt;= $MaxPage">
										<td>
											<table cellSpacing="0"
											       cellPadding="0"
											       width="100%"
											       align="center"
											       border="0"
											       heigth="100%">
												<tbody>
													<tr>
														<td>
															<xsl:call-template name="Cuadros"/>
														</td>
													</tr>
													<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
														<tr>
															<td>
																<xsl:call-template name="CuadroPiePaginaNew"/>
															</td>
														</tr>
													</xsl:if>
													<tr>
														<td>
															<xsl:call-template name="bottom_hash"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</xsl:if>
								</tr>
							</tbody>
						</table>
					</h7>
				</xsl:if>
				
				<xsl:if test="$FF &gt;'231'">
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$LI"/-->&#xA0;</div>
					<h8>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
							<tbody width="100%">
								<tr width="100%"
								    align="rights">
									<td>
										<font face="Arial, Helvetica, sans-serif"
										      size="1"><!-- PÁGINA 8 de 8 --> <xsl:value-of select="concat('PÁGINA 8' ,' de ', ceiling($totalpag1) )"/></font>
									</td>
								</tr>
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
										<xsl:call-template name="DetallesEncabezado8"/>
									</td>
								</tr>
								<tr>
									<xsl:if test="position()+7 &gt;= $MaxPage">
										<td>
											<table cellSpacing="0"
											       cellPadding="0"
											       width="100%"
											       align="center"
											       border="0"
											       heigth="100%">
												<tbody>
													<tr>
														<td>
															<xsl:call-template name="Cuadros"/>
														</td>
													</tr>
													<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
														<tr>
															<td>
																<xsl:call-template name="CuadroPiePaginaNew"/>
															</td>
														</tr>
													</xsl:if>
													<tr>
														<td>
															<xsl:call-template name="bottom_hash"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</xsl:if>
								</tr>
							</tbody>
						</table>
					</h8>
				</xsl:if>
				<xsl:if test="$FF &gt;'264'">
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$LI"/-->&#xA0;</div>
					<h9>
						<table cellSpacing="1"
						       width="100%"
						       border="0">
							<tbody width="100%">
								<tr width="100%"
								    align="rights">
									<td>
										<font face="Arial, Helvetica, sans-serif"
										      size="1"><!-- PÁGINA 9 de 9 --> <xsl:value-of select="concat('PÁGINA 9' ,' de ', ceiling($totalpag1) )"/></font>
									</td>
								</tr>
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
										<!-- <xsl:call-template name="DetallesEncabezado9"/> -->
									</td>
								</tr>
								<tr>
									<xsl:if test="position()+8 &gt;= $MaxPage">
										<td>
											<table cellSpacing="0"
											       cellPadding="0"
											       width="100%"
											       align="center"
											       border="0"
											       heigth="100%">
												<tbody>
													<tr>
														<td>
															<xsl:call-template name="Cuadros"/>
														</td>
													</tr>
													<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
														<tr>
															<td>
																<xsl:call-template name="CuadroPiePaginaNew"/>
															</td>
														</tr>
													</xsl:if>
													<tr>
														<td>
															<xsl:call-template name="bottom_hash"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</xsl:if>
								</tr>
							</tbody>
						</table>
					</h9>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<!-- NRO de FE|BVE|NCE|NDE|CPE|CRE|GRE -->
	<!-- xsl:template name="NFolio">
		<br/>NÂº 
		<xsl:value-of select="substring-before(//cbc:ID,'-')"/>- 
		<xsl:value-of select="format-number(substring-after(//cbc:ID,'-'),'00000000')"/>
	</xsl:template -->
	<!-- MOTIVO DE TRASLADO -->
	<xsl:template name="ModalidadTraslado">
		<xsl:choose>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='01'">Venta</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='14'">Venta sujeta a confirmación del comprador</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='02'">Compra</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='04'">Traslado entre establecimientos de la misma empresa</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='18'">Trasladoemisor itinerante CP</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='08'">Importación</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='09'">Exportación</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='19'">Traslado a zona primaria</xsl:when>
			<xsl:when test="//cac:ShipmentStage/cbc:TransportModeCode='13'">Otros</xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- TIPO DE DOCUMENTO DEL RECEPTOR -->
	<xsl:template name="TipoDeDocumento">
		<xsl:if test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='-' or //cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='0'">NO DOMICILIADO</xsl:if>
		<xsl:if test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='1'">DNI</xsl:if>
		<xsl:if test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='4'">CARNET EXTR.</xsl:if>
		<xsl:if test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='6'">RUC</xsl:if>
		<xsl:if test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='7'">PASAPORTE</xsl:if>
		<xsl:if test="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID/@schemeID='A'">CED. DIP. IDENT.</xsl:if>
		<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='-' or //cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='0'">NO DOMICILIADO</xsl:if>
		<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='6'">RUC</xsl:if>
		<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='4'">CARNET EXTR.</xsl:if>
		<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='7'">PASAPORTE</xsl:if>
		<xsl:if test="//cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID /@schemeID='A'">CED. DIP. IDENT.</xsl:if>
	</xsl:template>
	<!-- MODALIDAD DE TRASLADO -->
	<xsl:template name="tmpModalidadTraslado">
		<xsl:choose>
			<xsl:when test="cbc:TransportModeCode='01'">PÚBLICO</xsl:when>
			<xsl:when test="cbc:TransportModeCode='02'">PRIVADO</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- VALOR SEGUN NRO DE VARAIBLE -->
	<xsl:template name="TraeValorVariable">
		<xsl:param name="varNumVA"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA">
				<xsl:if test="pe:Valor!='-'">
					<xsl:value-of select="pe:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpMARCASTRAMO">
		<xsl:param name="parNroTramo"/>
		<xsl:param name="parNomMarcas"/>
		<xsl:choose>
			<xsl:when test="$parNroTramo = 1">
				<xsl:value-of select="substring-before($parNomMarcas, '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 2">
				<xsl:value-of select="substring-before(substring-after($parNomMarcas, '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 3">
				<xsl:value-of select="substring-before(substring-after(substring-after($parNomMarcas, '*'), '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 4">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after($parNomMarcas, '*'), '*'), '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:otherwise>No existe...</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="tmpLICENCIAS">
		<xsl:param name="parNroTramo"/>
		<xsl:param name="parLicencia"/>
		<xsl:choose>
			<xsl:when test="$parNroTramo = 1">
				<xsl:value-of select="substring-before($parLicencia, '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 2">
				<xsl:value-of select="substring-before(substring-after($parLicencia, '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 3">
				<xsl:value-of select="substring-before(substring-after(substring-after($parLicencia, '*'), '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 4">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after($parLicencia, '*'), '*'), '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:otherwise>No existe...</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="tmpCIMTC">
		<xsl:param name="parNroTramo"/>
		<xsl:param name="parCimtc"/>
		<xsl:choose>
			<xsl:when test="$parNroTramo = 1">
				<xsl:value-of select="substring-before($parCimtc, '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 2">
				<xsl:value-of select="substring-before(substring-after($parCimtc, '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 3">
				<xsl:value-of select="substring-before(substring-after(substring-after($parCimtc, '*'), '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 4">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after($parCimtc, '*'), '*'), '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:otherwise>No existe...</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="tmpNOMBRECONDUCTORES">
		<xsl:param name="parNroTramo"/>
		<xsl:param name="parNomConductores"/>
		<xsl:choose>
			<xsl:when test="$parNroTramo = 1">
				<xsl:value-of select="substring-before($parNomConductores, '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 2">
				<xsl:value-of select="substring-before(substring-after($parNomConductores, '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 3">
				<xsl:value-of select="substring-before(substring-after(substring-after($parNomConductores, '*'), '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 4">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after($parNomConductores, '*'), '*'), '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:otherwise>No existe...</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="tmpDNICONDUCTORES">
		<xsl:param name="parNroTramo"/>
		<xsl:param name="parDniConductores"/>
		<xsl:choose>
			<xsl:when test="$parNroTramo = 1">
				<xsl:value-of select="substring-before($parDniConductores, '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 2">
				<xsl:value-of select="substring-before(substring-after($parDniConductores, '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 3">
				<xsl:value-of select="substring-before(substring-after(substring-after($parDniConductores, '*'), '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 4">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after($parDniConductores, '*'), '*'), '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:otherwise>No existe...</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="tmpUnidadMedida">
		<xsl:choose>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PL'  or cbc:CreditedQuantity/@unitCode='PL'  or cbc:DebitedQuantity/@unitCode='PL'  or cbc:DeliveredQuantity/@unitCode='PL'">BAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D64' or cbc:CreditedQuantity/@unitCode='D64' or cbc:DebitedQuantity/@unitCode='D64' or cbc:DeliveredQuantity/@unitCode='D64'">BLK</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BG'  or cbc:CreditedQuantity/@unitCode='BG'  or cbc:DebitedQuantity/@unitCode='BG'  or cbc:DeliveredQuantity/@unitCode='BG'">BOL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BO'  or cbc:CreditedQuantity/@unitCode='BO'  or cbc:DebitedQuantity/@unitCode='BO'  or cbc:DeliveredQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BX'  or cbc:CreditedQuantity/@unitCode='BX'  or cbc:DebitedQuantity/@unitCode='BX'  or cbc:DeliveredQuantity/@unitCode='BX'">CJA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CY'  or cbc:CreditedQuantity/@unitCode='CY'  or cbc:DebitedQuantity/@unitCode='CY'  or cbc:DeliveredQuantity/@unitCode='CY'">CIL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CLT' or cbc:CreditedQuantity/@unitCode='CLT' or cbc:DebitedQuantity/@unitCode='CLT' or cbc:DeliveredQuantity/@unitCode='CLT'">CL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CMT' or cbc:CreditedQuantity/@unitCode='CMT' or cbc:DebitedQuantity/@unitCode='CMT' or cbc:DeliveredQuantity/@unitCode='CMT'">CM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CJ'  or cbc:CreditedQuantity/@unitCode='CJ'  or cbc:DebitedQuantity/@unitCode='CJ'  or cbc:DeliveredQuantity/@unitCode='CJ'">CON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='DLT' or cbc:CreditedQuantity/@unitCode='DLT' or cbc:DebitedQuantity/@unitCode='DLT' or cbc:DeliveredQuantity/@unitCode='DLT'">DL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL' or cbc:CreditedQuantity/@unitCode='GLL' or cbc:DebitedQuantity/@unitCode='GLL' or cbc:DeliveredQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GRM' or cbc:CreditedQuantity/@unitCode='GRM' or cbc:DebitedQuantity/@unitCode='GRM' or cbc:DeliveredQuantity/@unitCode='GRM'">GR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='HUR' or cbc:CreditedQuantity/@unitCode='HUR' or cbc:DebitedQuantity/@unitCode='HUR' or cbc:DeliveredQuantity/@unitCode='HUR'">HRA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KT'  or cbc:CreditedQuantity/@unitCode='KT'  or cbc:DebitedQuantity/@unitCode='KT'  or cbc:DeliveredQuantity/@unitCode='KT'">JGO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM' or cbc:CreditedQuantity/@unitCode='KGM' or cbc:DebitedQuantity/@unitCode='KGM' or cbc:DeliveredQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KWT' or cbc:CreditedQuantity/@unitCode='KWT' or cbc:DebitedQuantity/@unitCode='KWT' or cbc:DeliveredQuantity/@unitCode='KWT'">KW</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR' or cbc:CreditedQuantity/@unitCode='LBR' or cbc:DebitedQuantity/@unitCode='LBR' or cbc:DeliveredQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR' or cbc:CreditedQuantity/@unitCode='LTR' or cbc:DebitedQuantity/@unitCode='LTR' or cbc:DeliveredQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTR' or cbc:CreditedQuantity/@unitCode='MTR' or cbc:DebitedQuantity/@unitCode='MTR' or cbc:DeliveredQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK' or cbc:CreditedQuantity/@unitCode='MTK' or cbc:DebitedQuantity/@unitCode='MTK' or cbc:DeliveredQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTQ' or cbc:CreditedQuantity/@unitCode='MTQ' or cbc:DebitedQuantity/@unitCode='MTQ' or cbc:DeliveredQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MIL' or cbc:CreditedQuantity/@unitCode='MIL' or cbc:DebitedQuantity/@unitCode='MIL' or cbc:DeliveredQuantity/@unitCode='MIL'">MIL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D61' or cbc:CreditedQuantity/@unitCode='D61' or cbc:DebitedQuantity/@unitCode='D61' or cbc:DeliveredQuantity/@unitCode='D61'">MIN</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MLT' or cbc:CreditedQuantity/@unitCode='MLT' or cbc:DebitedQuantity/@unitCode='MLT' or cbc:DeliveredQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MMT' or cbc:CreditedQuantity/@unitCode='MMT' or cbc:DebitedQuantity/@unitCode='MMT' or cbc:DeliveredQuantity/@unitCode='MMT'">MM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NPR' or cbc:CreditedQuantity/@unitCode='NPR' or cbc:DebitedQuantity/@unitCode='NPR' or cbc:DeliveredQuantity/@unitCode='NPR'">PAR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTK' or cbc:CreditedQuantity/@unitCode='FTK' or cbc:DebitedQuantity/@unitCode='FTK' or cbc:DeliveredQuantity/@unitCode='FTK'">PI2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTQ' or cbc:CreditedQuantity/@unitCode='FTQ' or cbc:DebitedQuantity/@unitCode='FTQ' or cbc:DeliveredQuantity/@unitCode='FTQ'">PI3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PA'  or cbc:CreditedQuantity/@unitCode='PA'  or cbc:DebitedQuantity/@unitCode='PA'  or cbc:DeliveredQuantity/@unitCode='PA'">PQT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='INH' or cbc:CreditedQuantity/@unitCode='INH' or cbc:DebitedQuantity/@unitCode='INH' or cbc:DeliveredQuantity/@unitCode='INH'">PUL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NRL' or cbc:CreditedQuantity/@unitCode='NRL' or cbc:DebitedQuantity/@unitCode='NRL' or cbc:DeliveredQuantity/@unitCode='NRL'">ROL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE' or cbc:CreditedQuantity/@unitCode='TNE' or cbc:DebitedQuantity/@unitCode='TNE' or cbc:DeliveredQuantity/@unitCode='TNE'">TON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NIU' or cbc:CreditedQuantity/@unitCode='NIU' or cbc:DebitedQuantity/@unitCode='NIU' or cbc:DeliveredQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SA'  or cbc:CreditedQuantity/@unitCode='SA'  or cbc:DebitedQuantity/@unitCode='SA'  or cbc:DeliveredQuantity/@unitCode='SA'">SAC</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- VARIABLE MARCA DE TRAMOS-->
	<xsl:variable name="varMARCATRAMO">
		<!-- MARCA TRAMO -->
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="19"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VARIABLE LICENCIAS DE TRAMOS -->
	<xsl:variable name="varLicencia">
		<!-- MARCA TRAMO -->
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="29"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VARIABLE CIMTC DE TRAMOS -->
	<xsl:variable name="varCimtc">
		<!-- MARCA TRAMO -->
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="33"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VARIABLE OTROS DATOS DE SCCION -->
	<xsl:variable name="varOtrosDeSeccion">
		<!-- MARCA TRAMO -->
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="32"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- ASIGNO LAS REFERENCIAS A NUEVAS VARIABLES (que han de ir en el recuadro de REFERENCIAS) -->
	<xsl:variable name="varDocRef1">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="4"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="varDocRef2">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="20"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:template name="tmpDIRECCIONTRAMO">
		<xsl:param name="parNroTramo"/>
		<xsl:param name="parDirecTramo"/>
		<xsl:choose>
			<xsl:when test="$parNroTramo = 1">
				<xsl:value-of select="substring-before($parDirecTramo, '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 2">
				<xsl:value-of select="substring-before(substring-after($parDirecTramo, '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 3">
				<xsl:value-of select="substring-before(substring-after(substring-after($parDirecTramo, '*'), '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:when test="$parNroTramo = 4">
				<xsl:value-of select="substring-before(substring-after(substring-after(substring-after($parDirecTramo, '*'), '*'), '*'), '*')"/>&#xA0;</xsl:when>
			<xsl:otherwise>No existe...</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- VARIABLES TRAMOS ORIGEN -->
	<xsl:variable name="varTramoOrigen12">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="21"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="varTramoOrigen34">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="22"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VARIABLE DIRECCION ORIGEN CONCATENADO -->
	<xsl:variable name="varDirOrigen">
		<xsl:value-of select="concat(normalize-space($varTramoOrigen12),normalize-space($varTramoOrigen34))"/>
	</xsl:variable>
	<!-- VARIABLES TRAMOS DESTINO -->
	<xsl:variable name="varTramoDestino12">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="23"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="varTramoDestino34">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="24"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VARIABLE DIRECCION DESTINO CONCATENADO -->
	<xsl:variable name="varDirDestino">
		<xsl:value-of select="concat(normalize-space($varTramoDestino12),normalize-space($varTramoDestino34))"/>
	</xsl:variable>
	<!-- CONENEDOR -->
	<xsl:variable name="varContenedor">
		<xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID"/>
	</xsl:variable>
	<!-- NRO DE BULTOS -->
	<xsl:variable name="varNroBulto">
		<xsl:value-of select="//cac:Shipment/cbc:TotalTransportHandlingUnitQuantity"/>
	</xsl:variable>
	<!-- PRECINTO -->
	<xsl:variable name="varPrecinto">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="30"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- FECHA DE ENTREGA -->
	<xsl:variable name="varFechEntrega">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="31"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- TIPO VENTA PARA GUIA -->
	<xsl:variable name="varTipoVentaGuia">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="35"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- NRO DE PALLETS -->
	<xsl:variable name="varNroPallets">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="26"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- PESO TOTAL TRASLADO-->
	<xsl:variable name="varPesoTotalTras">
		<xsl:value-of select="//cac:Shipment/cbc:GrossWeightMeasure"/>
	</xsl:variable>
	<!-- CODIGO DE BARRA PERSONALIZADO -->
	<xsl:variable name="varCodBarraPers">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="28"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VARIABLE NOMBRE DE CONDUCTOR -->
	<xsl:variable name="varNomConductor">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="25"/>
		</xsl:call-template>
	</xsl:variable>
	<!-- VARIABLE DNI DE CONDUCTOR -->
	<xsl:variable name="varDNIConductor">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="34"/>
		</xsl:call-template>
	</xsl:variable>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="20100018625&#x2D;09&#x2D;T005&#x2D;10000158_TRASLADO.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="321" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="201" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="161" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="281" y="69"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->