<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2"
                exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi sac">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="numColBl">
		<!--<xsl:value-of select="40-count(/pe:DespatchAdvice/cac:DespatchLine)"/>-->
		<xsl:value-of select="40-count(//cac:DespatchLine)"/>
	</xsl:variable>
	<xsl:variable name="numColB2">
		<xsl:value-of select="40-count(//cac:DespatchLine)"/>
	</xsl:variable>
	<xsl:variable name="numColB3">
		<xsl:value-of select="40-count(//cac:DespatchLine)"/>
	</xsl:variable>

	<xsl:include href="xGUIA_encab.xslt"/>
	<xsl:include href="xGUIA_datos.xslt"/>
	<xsl:include href="xGUIA_detalle.xslt"/>
	<xsl:include href="xGUIA_total.xslt"/>
	<xsl:include href="xGUIA_bottom.xslt"/>
	<xsl:variable name="v_ItemPorPagina1">
		<xsl:value-of select="13"/>
	</xsl:variable>

	<xsl:template match="/">

		<html xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1"
		      xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
		      xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
		      xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2"
		      xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2">
			<style>div.saltar-pagina {page-break-after: always;  }
                    body {
                          margin-top: 20px;
                          margin-bottom: 20px;
                          margin-right: 30px;
                          margin-left: 40px;
                          }</style>
			<head>
				<title>Comprobante Electrónico</title>
			</head>
			<xsl:variable name="totalitems">
				<!--<xsl:value-of select="count(/pe:Invoice/cac:InvoiceLine/cbc:ID)"/>-->

				<xsl:value-of select="count(//cac:DespatchLine)"/>
			</xsl:variable>

			<xsl:variable name="totalpag">
				<xsl:if test="$totalitems &lt; '21'">
					<xsl:value-of select="1"/>
				</xsl:if>
				<!--	<xsl:if test="$totalitems &gt;'36' and $totalitems &lt;'49'">
					<xsl:value-of select="2"/>
				</xsl:if>-->
				<xsl:if test="$totalitems &gt;'20'">
					<xsl:value-of select="ceiling($totalitems div 20)"/>
				</xsl:if>
			</xsl:variable>

			<xsl:variable name="goultpag">
				<xsl:value-of select="$totalitems - ($totalitems mod 20)"/>
			</xsl:variable>
			<body>
				<table cellSpacing="1" width="100%" border="0">
					<tbody>
						<!-- CABECERA -->
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
								<xsl:call-template name="DetallesEncabezadoMultipagina">
									<xsl:with-param name="titems" select="$totalitems"/>
									<xsl:with-param name="tpaginas" select="$totalpag"/>
									<xsl:with-param name="pagina" select="1"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td width="100%">
								<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
									<tbody>
										<tr>

											<td width="100%" align="right">
												<xsl:call-template name="bottom_hash"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				<div align="right">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pg 1/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
				</div>
				<xsl:if test="$totalpag &gt;'1'">
					<!--Funcin para realizar el salto de lnea-->
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$i"/>-->
					</div>
					<!-- Construcción de la 2da Pagina -->
					<table cellSpacing="1" width="100%" border="0">
						<tbody>
							<!-- CABECERA -->
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
									<xsl:call-template name="DetallesEncabezadoMultipagina">
										<xsl:with-param name="titems" select="$totalitems"/>
										<xsl:with-param name="tpaginas" select="$totalpag"/>
										<xsl:with-param name="pagina" select="2"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td width="100%">
									<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
										<tbody>
											<tr>

												<td width="100%" align="right">
													<xsl:call-template name="bottom_hash"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<div align="right">
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pg 2/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
					</div>
				</xsl:if>
				<xsl:if test="$totalpag &gt;'2'">
					<!--Funcin para realizar el salto de lnea-->
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$i"/>-->
					</div>
					<!-- Construcción de la 2da Pagina -->
					<table cellSpacing="1" width="100%" border="0">
						<tbody>
							<!-- CABECERA -->
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
									<xsl:call-template name="DetallesEncabezadoMultipagina">
										<xsl:with-param name="titems" select="$totalitems"/>
										<xsl:with-param name="tpaginas" select="$totalpag"/>
										<xsl:with-param name="pagina" select="3"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td width="100%">
									<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
										<tbody>
											<tr>

												<td width="100%" align="right">
													<xsl:call-template name="bottom_hash"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<div align="right">
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pg 3/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
					</div>
				</xsl:if>
				<xsl:if test="$totalpag &gt;'3'">
					<!--Funcin para realizar el salto de lnea-->
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$i"/>-->
					</div>
					<!-- Construcción de la 2da Pagina -->
					<table cellSpacing="1" width="100%" border="0">
						<tbody>
							<!-- CABECERA -->
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
									<xsl:call-template name="DetallesEncabezadoMultipagina">
										<xsl:with-param name="titems" select="$totalitems"/>
										<xsl:with-param name="tpaginas" select="$totalpag"/>
										<xsl:with-param name="pagina" select="4"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td width="100%">
									<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
										<tbody>
											<tr>

												<td width="100%" align="right">
													<xsl:call-template name="bottom_hash"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<div align="right">
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pg 4/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
					</div>
				</xsl:if>
				<xsl:if test="$totalpag &gt;'4'">
					<!--Funcin para realizar el salto de lnea-->
					<div class="saltar-pagina">
						<!--<xsl:value-of select="$i"/>-->
					</div>
					<!-- Construcción de la 2da Pagina -->
					<table cellSpacing="1" width="100%" border="0">
						<tbody>
							<!-- CABECERA -->
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
									<xsl:call-template name="DetallesEncabezadoMultipagina">
										<xsl:with-param name="titems" select="$totalitems"/>
										<xsl:with-param name="tpaginas" select="$totalpag"/>
										<xsl:with-param name="pagina" select="5"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td width="100%">
									<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
										<tbody>
											<tr>

												<td width="100%" align="right">
													<xsl:call-template name="bottom_hash"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<div align="right">
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Pg 5/<xsl:value-of select="$totalpag"/>&#xA0;&#xA0;</font>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>



	<!-- MOTIVO DE TRASLADO -->
	<xsl:template name="DescMotivoTraslado">
		<xsl:choose>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='01'">Venta</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='02'">Compra</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='03'">Venta con entrega a terceros</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='04'">Traslado entre establecimientos de la misma empresa</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='05'">Consignación</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='06'">Devolución</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='07'">Recojo de bienes transformados</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='08'">Importación</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='09'">Exportación</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='13'">Otros</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='14'">Venta sujeta a confirmación del comprador</xsl:when>
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='17'">Traslado de bienes para transformación</xsl:when>
			
			<xsl:when test="//cac:Shipment/cbc:HandlingCode='18'">Trasladoemisor itinerante CP</xsl:when>
			
			
			
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
	</xsl:template>

	<!-- MODALIDAD DE TRASLADO -->
	<xsl:template name="tmpModalidadTraslado">
		<xsl:choose>
			<xsl:when test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='01'">TRANSPORTE PÚBLICO</xsl:when>
			<xsl:when test="//cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode='02'">TRANSPORTE PRIVADO</xsl:when>
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
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='PL'">BAL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='D64'">BLK</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='BG'">BOL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='BX'">CJA</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='CY'">CIL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='CLT'">CL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='CMT'">CM</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='CJ'">CON</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='DLT'">DL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='GRM'">GR</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='HUR'">HRA</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='KT'">JGO</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='KWT'">KW</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='MIL'">MIL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='D61'">MIN</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='MMT'">MM</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='NPR'">PAR</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='FTK'">PI2</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='FTQ'">PI3</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='PA'">PQT</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='INH'">PUL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='NRL'">ROL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='TNE'">TON</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='SA'">SAC</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='PAL'">PAS</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- VARIABLE MARCA DE TRAMOS-->
	<xsl:variable name="varMARCATRAMO">
		<!-- MARCA TRAMO -->
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="19"/>
		</xsl:call-template>
	</xsl:variable>

	<!-- VARIABLE LICENCIAS DE TRAMOS -->
	<xsl:variable name="varLicencia">
		<!-- MARCA TRAMO -->
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="29"/>
		</xsl:call-template>
	</xsl:variable>

	<!-- VARIABLE CIMTC DE TRAMOS -->
	<xsl:variable name="varCimtc">
		<!-- MARCA TRAMO -->
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="33"/>
		</xsl:call-template>
	</xsl:variable>

	<!-- VARIABLE OTROS DATOS DE SCCION -->
	<xsl:variable name="varOtrosDeSeccion">
		<!-- MARCA TRAMO -->
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="32"/>
		</xsl:call-template>
	</xsl:variable>

	<!-- ASIGNO LAS REFERENCIAS A NUEVAS VARIABLES (que han de ir en el recuadro de REFERENCIAS) -->
	<xsl:variable name="varDocRef1">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="4"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="varDocRef2">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="20"/>
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
			<xsl:with-param name="varNumVA" select="21"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="varTramoOrigen34">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="22"/>
		</xsl:call-template>
	</xsl:variable>

	<!-- VARIABLE DIRECCION ORIGEN CONCATENADO -->
	<xsl:variable name="varDirOrigen">
		<xsl:value-of select="concat(normalize-space($varTramoOrigen12),normalize-space($varTramoOrigen34))"/>
	</xsl:variable>

	<!-- VARIABLES TRAMOS DESTINO -->
	<xsl:variable name="varTramoDestino12">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="23"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="varTramoDestino34">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="24"/>
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
			<xsl:with-param name="varNumVA" select="30"/>
		</xsl:call-template>
	</xsl:variable>

	<!-- FECHA DE ENTREGA -->
	<xsl:variable name="varFechEntrega">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="31"/>
		</xsl:call-template>
	</xsl:variable>

	<!-- TIPO VENTA PARA GUIA -->
	<xsl:variable name="varTipoVentaGuia">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="35"/>
		</xsl:call-template>
	</xsl:variable>

	<!-- NRO DE PALLETS -->
	<xsl:variable name="varNroPallets">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="26"/>
		</xsl:call-template>
	</xsl:variable>

	<!-- PESO TOTAL TRASLADO-->
	<xsl:variable name="varPesoTotalTras">
		<xsl:value-of select="//cac:Shipment/cbc:GrossWeightMeasure"/>
	</xsl:variable>

	<!-- CODIGO DE BARRA PERSONALIZADO -->
	<xsl:variable name="varCodBarraPers">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="28"/>
		</xsl:call-template>
	</xsl:variable>


	<!-- VARIABLE NOMBRE DE CONDUCTOR -->
	<xsl:variable name="varNomConductor">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="25"/>
		</xsl:call-template>
	</xsl:variable>

	<!-- VARIABLE DNI DE CONDUCTOR -->
	<xsl:variable name="varDNIConductor">
		<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA" select="34"/>
		</xsl:call-template>
	</xsl:variable>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\20100079501-09-T001-0000010.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator="">
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="schemaCache" value="||"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bGenerateByteCode" value="true"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="sInitialMode" value=""/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="20254053822-01-FF11-10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/">
				<block path="html/body/table/tbody/tr/td/xsl:call-template" x="361" y="69"/>
				<block path="html/body/table/tbody/tr[1]/td/xsl:call-template" x="401" y="69"/>
				<block path="html/body/table/tbody/tr[2]/td/xsl:call-template" x="321" y="69"/>
				<block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call-template" x="241" y="69"/>
				<block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call-template" x="201" y="69"/>
				<block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call-template" x="161" y="69"/>
				<block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/>
				<block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/>
				<block path="html/body/table/tbody/tr[4]/td/xsl:call-template" x="281" y="69"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->