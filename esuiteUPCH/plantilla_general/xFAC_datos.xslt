<?xml version='1.0'?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" 
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
	xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"  
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
	xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:output method="html" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:template name="datos1">
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%" align="center">
					<font face="Arial" size="2"> </font>
				</td>
				<td width="23%" align="right">
					<font face="Arial" size="2">
						<strong>MAIL EMPRESA</strong>
					</font>
				</td>
				<td width="20%" align="right"> </td>
				<td width="17%" align="right">
					<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000">
						<td valign="top" colspan="1" align="right" bgcolor="#93D3FF">
							<font face="Arial, Helvetica, sans-serif" size="2">FECHA :<xsl:value-of select="$fecha"/>  </font>
						</td>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="DatosReceptor">
	<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
		<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
			<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td vAlign="top" width="100%" align="left" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
							<tr bgColor="#93d3ff" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td vAlign="top" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<font size="2" face="Arial, Helvetica, sans-serif" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
										<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;SEÑOR(ES) &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;:&#160;</strong>
										<xsl:value-of select="//cbc:Name"/>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td vAlign="top" width="100%" align="left" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<table border="0" rules="none" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td vAlign="top" width="10%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
								<td vAlign="top" width="40%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
								<td vAlign="top" width="10%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
								<td vAlign="top" width="40%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
							</tr>
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"></tr>
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"></tr>
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td vAlign="top" align="left" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<font size="2" face="Arial, Helvetica, sans-serif" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
										<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;R.U.C</strong>
									</font>
								</td>
								<td vAlign="top" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<font size="2" face="Arial, Helvetica, sans-serif" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
										<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">:&#160;</strong><!--<xsl:value-of select="//cac:AccountingCustomerParty//cbc:CustomerAssignedAccountID"/>-->
										<xsl:value-of select="/pe:Invoice/cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID"/>
									</font>
									<br xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/><!--<xsl:value-of select="format-number(substring-before(//sac:Signature//cbc:ID,'-'),'###.###.###','pesos')"/>-<xsl:value-of select="substring-after(DTE/Documento/Encabezado/Receptor/RUTRecep,'-')"/></font>-->
								</td>
								<td vAlign="top" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<font size="2" face="Arial, Helvetica, sans-serif" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
										<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;Fecha</strong>
									</font>
								</td>
								<td vAlign="top" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<font size="2" face="Arial, Helvetica, sans-serif" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
										<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">:&#160;</strong>
										<xsl:value-of select="//cbc:IssueDate"/>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td vAlign="top" width="100%" align="left" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<xsl:if test="//cbc:InvoiceTypeCode='01' or //cbc:InvoiceTypeCode='03' or //cbc:InvoiceTypeCode='07' or //cbc:InvoiceTypeCode='08'">
						<table border="0" rules="none" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
							<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<td vAlign="top" width="20%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
									<td vAlign="top" width="50%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
									<td vAlign="top" width="10%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
									<td vAlign="top" width="20%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>
	<xsl:template name="DatosReceptor_2">
		<table border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<table border="1" cellspacing="0" width="100%" cellpadding="1" rules="none" bordercolor="#000000">
						<tr>
							<td valign="top" width="05%"></td>
							<td valign="top" width="25%"></td>
							<td valign="top" width="20%"></td>
							<td valign="top" width="30%"></td>
							<td valign="top" width="10%"></td>
							<td valign="top" width="15%"></td>
						</tr>
						<tr>
							<td valign="top" align="left">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>AT     :</strong>
								</font>
							</td>
							<td valign="top">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="format-number(substring-before(DTE/Documento/Encabezado/Receptor/RUTRecep,'-'),'###.###.###','pen')"/>-<xsl:value-of select="substring-after(DTE/Documento/Encabezado/Receptor/RUTRecep,'-')"/></font>
							</td>

							<xsl:if test="DTE/Documento/Encabezado/IdDoc/TipoDTE ='33' or DTE/Documento/Encabezado/IdDoc/TipoDTE ='56' or DTE/Exportaciones/Encabezado/IdDoc/TipoDTE ='110' or DTE/Documento/Encabezado/IdDoc/TipoDTE ='112'">
								<td valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>CONDICIONES DE PAGO    :</strong>
									</font>
								</td>
								<td valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="DTE/Documento/Encabezado/Receptor/GiroRecep"/>
									</font>
								</td>
								<td valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>VENCE :</strong>
									</font>
								</td>
								<td valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="$fecha"/>
									</font>
								</td>
							</xsl:if>
						</tr>
					</table>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="DatosCoordinador">
		<table border="0" bordercolor="#000000" cellpadding="4" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td align="left" valign="top" width="100%">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>Coordinador :</strong>
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="DatosReceptorEx">
		<table border="0" bordercolor="#000000" cellpadding="1" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td align="left" valign="top" width="100%">
						<table border="1" cellspacing="0" width="100%" cellpadding="1" bordercolor="#000000">
							<tr bgcolor="#93D3FF">
								<td valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong> SEÑOR(ES)         :</strong>
										<xsl:value-of select="DTE/Exportaciones/Encabezado/Receptor/RznSocRecep"/>
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="left" valign="top" width="100%">
						<table border="1" cellspacing="0" width="100%" cellpadding="1" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td valign="top" width="10%"></td>
									<td valign="top" width="40%"></td>
									<td valign="top" width="10%"></td>
									<td valign="top" width="40%"></td>
								</tr>
								<tr>
									<td valign="top">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong> Dirección</strong>
										</font>
									</td>
									<td valign="top">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>: </strong>
											<xsl:value-of select="DTE/Exportaciones/Encabezado/Receptor/DirRecep"/>
										</font>
										<br/>
									</td>
									<td valign="top">
										<font face="Arial, Helvetica, sans-serif" size="2"> </font>
									</td>
									<td valign="top">
										<font face="Arial, Helvetica, sans-serif" size="2"> </font>
									</td>
								</tr>
								<tr>
									<td valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong> Comuna/Ciudad</strong>
										</font>
									</td>
									<td valign="top">
										<font size="2" face="Arial, Helvetica, sans-serif">
											<strong>: </strong>
											<xsl:value-of select="DTE/Exportaciones/Encabezado/Receptor/CmnaRecep"/> 
											<xsl:value-of select="DTE/Exportaciones/Encabezado/Receptor/CiudadRecep"/>
										</font>
									</td>

									<td valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong> Fono</strong>
										</font>
									</td>
									<td valign="top">
										<font size="2" face="Arial, Helvetica, sans-serif">
											<strong>: </strong>
											<xsl:value-of select="DTE/Exportaciones/Encabezado/Receptor/Contacto"/>
										</font>
									</td>
								</tr>
								<tr>
									<td valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong> R.U.T</strong>
										</font>
									</td>
									<td valign="top">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>: </strong>
											<xsl:value-of select="substring-before(DTE/Exportaciones/Encabezado/Receptor/RUTRecep,'-')"/>-<xsl:value-of select="substring-after(DTE/Exportaciones/Encabezado/Receptor/RUTRecep,'-')"/></font>
									</td>

									<td valign="top">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong> Giro</strong>
										</font>
									</td>
									<td valign="top">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>: </strong>
											<xsl:value-of select="DTE/Exportaciones/Encabezado/Receptor/GiroRecep"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td align="left" valign="top" width="100%">
						<table border="1" cellspacing="0" width="100%" cellpadding="1" rules="none" bordercolor="#000000">
							<tr>
								<td valign="top" width="26%"></td>
								<td valign="top" width="26%"></td>
								<td valign="top" width="22%"></td>
								<td valign="top" width="26%"></td>
							</tr>

							<tr>
								<td valign="top" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>PUERTO EMBARQUE</strong>
									</font>
								</td>
								<td valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2"><strong>PUERTO DESEMBARQUE</strong>
									</font>
								</td>
								<td valign="top" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<strong>TOTAL DE BULTOS</strong>
									</font>
								</td>
								<td valign="top" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2"><strong>TIPO DE MONEDA</strong>
									</font>
								</td>
							</tr>
							<tr>
								<td valign="top" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										 <xsl:call-template name="puerto_embarque"><xsl:with-param name="puertoEmbarque" select="DTE/Exportaciones/Encabezado/Transporte/Aduana/CodPtoEmbarque"/></xsl:call-template>
									</font>
								</td>
								<td valign="top" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="puerto_embarque"><xsl:with-param name="puertoEmbarque" select="DTE/Exportaciones/Encabezado/Transporte/Aduana/CodPtoDesemb"/></xsl:call-template>
									</font>
								</td>
								<td valign="top" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="DTE/Exportaciones/Encabezado/Transporte/Aduana/TotBultos "/>
									</font>
								</td>
								<td valign="top" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2"><xsl:value-of select="DTE/Exportaciones/Encabezado/OtraMoneda/TpoMoneda"/>
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="forma_pago">
		<xsl:choose>
			<xsl:when test="DTE/Exportaciones/Encabezado/IdDoc/FmaPago">SET</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/IdDoc/FmaPago='1'">Contado</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/IdDoc/FmaPago='2'">Crédito</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/IdDoc/FmaPago='3'">Sin Costo (Entrega Gratuita)</xsl:when>
			<xsl:otherwise> ---</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="fecha_texto">
		<xsl:variable name="aa">
			<xsl:value-of select="substring-before(DTE/Exportaciones/Encabezado/IdDoc/FchEmis|DTE/Exportaciones/Encabezado/IdDoc/FchEmis,'-')"/>
		</xsl:variable>
		<xsl:variable name="mmdd">
			<xsl:value-of select="substring-after(DTE/Exportaciones/Encabezado/IdDoc/FchEmis|DTE/Exportaciones/Encabezado/IdDoc/FchEmis,'-')"/>
		</xsl:variable>
		<!--prefijo Fecha Emision Mes -->
		<xsl:variable name="mm">
			<xsl:value-of select="substring-before($mmdd,'-')"/>
		</xsl:variable>
		<xsl:variable name="dd">
			<xsl:value-of select="substring-after($mmdd,'-')"/>
		</xsl:variable>
		<!-- MES -Nombre -->
		<xsl:variable name="nomMes">
			<xsl:choose>
				<xsl:when test="$mm='01'">enero</xsl:when>
				<xsl:when test="$mm='02'">febrero</xsl:when>
				<xsl:when test="$mm='03'">marzo</xsl:when>
				<xsl:when test="$mm='04'">abril</xsl:when>
				<xsl:when test="$mm='05'">mayo</xsl:when>
				<xsl:when test="$mm='06'">junio</xsl:when>
				<xsl:when test="$mm='07'">julio</xsl:when>
				<xsl:when test="$mm='08'">agosto</xsl:when>
				<xsl:when test="$mm='09'">septiembre</xsl:when>
				<xsl:when test="$mm='10'">octubre</xsl:when>
				<xsl:when test="$mm='11'">noviembre</xsl:when>
				<xsl:when test="$mm='12'">diciembre</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<xsl:value-of select="concat($dd,' de ', $nomMes, ' de ' , $aa)"/>
	</xsl:template>

	<xsl:template name="rut_receptor_exportacion">
		<xsl:choose>
			<xsl:when test="DTE/Exportaciones/Encabezado/Receptor/RUTRecep">
				<xsl:value-of select="DTE/Exportaciones/Encabezado/Receptor/RUTRecep"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>55.555.555-5</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="Cod_Clau_Venta">
		<xsl:choose>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='1'">CIF</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='2'">CFR</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='3'">EXW</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='4'">FAS</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='5'">FOB</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='6'">S/CL</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='7'">C Y S</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='8'">OTROS</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='9'">D.D.P.</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='10'">FCA</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='11'">CPT</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='12'">CIP</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='13'">DAF</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='14'">DES</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='15'">DEQ</xsl:when>
			<xsl:when test="DTE/Documento/Encabezado/Transporte/Aduana/CodClauVenta='16'">DDU</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="puerto_embarque">
	<xsl:param name="puertoEmbarque"/>
	<xsl:choose>
	<xsl:when test="$puertoEmbarque='644'">AALBORG</xsl:when>
	<xsl:when test="$puertoEmbarque='641'">AARHUS</xsl:when>
	<xsl:when test="$puertoEmbarque='960'">ABRA DE NAPA</xsl:when>
	<xsl:when test="$puertoEmbarque='218'">ACAPULCO</xsl:when>
	<xsl:when test="$puertoEmbarque='814'">ADELAIDA</xsl:when>
	<xsl:when test="$puertoEmbarque='992'">AEROP.A.M.BENITEZ</xsl:when>
	<xsl:when test="$puertoEmbarque='991'">AEROP.C.I.DEL CAMPO</xsl:when>
	<xsl:when test="$puertoEmbarque='989'">AEROP.CERRO MORENO</xsl:when>
	<xsl:when test="$puertoEmbarque='987'">AEROP.CHACALLUTA</xsl:when>
	<xsl:when test="$puertoEmbarque='988'">AEROP.DIEGO ARACENA</xsl:when>
	<xsl:when test="$puertoEmbarque='990'">AEROP.EL TEPUAL</xsl:when>
	<xsl:when test="$puertoEmbarque='951'">AGUAS NEGRAS</xsl:when>
	<xsl:when test="$puertoEmbarque='220'">ALTAMIRA</xsl:when>
	<xsl:when test="$puertoEmbarque='601'">AMBERES</xsl:when>
	<xsl:when test="$puertoEmbarque='621'">AMSTERDAM</xsl:when>
	<xsl:when test="$puertoEmbarque='931'">ANCUD</xsl:when>
	<xsl:when test="$puertoEmbarque='903'">ANTOFAGASTA</xsl:when>
	<xsl:when test="$puertoEmbarque='974'">APPELEG</xsl:when>
	<xsl:when test="$puertoEmbarque='901'">ARICA</xsl:when>
	<xsl:when test="$puertoEmbarque='995'">ARICA-LA PAZ</xsl:when>
	<xsl:when test="$puertoEmbarque='994'">ARICA-TACNA</xsl:when>
	<xsl:when test="$puertoEmbarque='546'">AUGUSTA</xsl:when>
	<xsl:when test="$puertoEmbarque='266'">BAHIA BLANCA</xsl:when>
	<xsl:when test="$puertoEmbarque='978'">BAKER</xsl:when>
	<xsl:when test="$puertoEmbarque='222'">BALBOA</xsl:when>
	<xsl:when test="$puertoEmbarque='136'">BALTIMORE</xsl:when>
	<xsl:when test="$puertoEmbarque='563'">BARCELONA</xsl:when>
	<xsl:when test="$puertoEmbarque='233'">BARRANQUILLA</xsl:when>
	<xsl:when test="$puertoEmbarque='146'">BATON ROUGE</xsl:when>
	<xsl:when test="$puertoEmbarque='118'">BAYSIDE</xsl:when>
	<xsl:when test="$puertoEmbarque='564'">BILBAO</xsl:when>
	<xsl:when test="$puertoEmbarque='131'">BOSTON</xsl:when>
	<xsl:when test="$puertoEmbarque='591'">BREMEN</xsl:when>
	<xsl:when test="$puertoEmbarque='557'">BREST</xsl:when>
	<xsl:when test="$puertoEmbarque='133'">BRIDGEPORT</xsl:when>
	<xsl:when test="$puertoEmbarque='158'">BROWSVILLE</xsl:when>
	<xsl:when test="$puertoEmbarque='232'">BUENAVENTURA</xsl:when>
	<xsl:when test="$puertoEmbarque='262'">BUENOS AIRES</xsl:when>
	<xsl:when test="$puertoEmbarque='555'">BURDEOS</xsl:when>
	<xsl:when test="$puertoEmbarque='422'">BUSAN CY (PUSAN)</xsl:when>
	<xsl:when test="$puertoEmbarque='942'">CABO NEGRO</xsl:when>
	<xsl:when test="$puertoEmbarque='562'">CADIZ</xsl:when>
	<xsl:when test="$puertoEmbarque='556'">CALAIS</xsl:when>
	<xsl:when test="$puertoEmbarque='205'">CALBUCO</xsl:when>
	<xsl:when test="$puertoEmbarque='471'">CALCUTA</xsl:when>
	<xsl:when test="$puertoEmbarque='918'">CALDERA</xsl:when>
	<xsl:when test="$puertoEmbarque='919'">CALDERILLA</xsl:when>
	<xsl:when test="$puertoEmbarque='950'">CALETA COLOSO</xsl:when>
	<xsl:when test="$puertoEmbarque='252'">CALLAO</xsl:when>
	<xsl:when test="$puertoEmbarque='993'">CAP HUACHIPATO</xsl:when>
	<xsl:when test="$puertoEmbarque='967'">CARDENAL SAMORE</xsl:when>
	<xsl:when test="$puertoEmbarque='980'">CASAS VIEJAS</xsl:when>
	<xsl:when test="$puertoEmbarque='932'">CASTRO</xsl:when>
	<xsl:when test="$puertoEmbarque='911'">CHACABUCO/PTO.AYSEN</xsl:when>
	<xsl:when test="$puertoEmbarque='957'">CHACALLUTA</xsl:when>
	<xsl:when test="$puertoEmbarque='934'">CHAITEN</xsl:when>
	<xsl:when test="$puertoEmbarque='481'">CHALNA</xsl:when>
	<xsl:when test="$puertoEmbarque='917'">CHANARAL/BARQUITO</xsl:when>
	<xsl:when test="$puertoEmbarque='139'">CHARLESTON</xsl:when>
	<xsl:when test="$puertoEmbarque='977'">CHILE CHICO</xsl:when>
	<xsl:when test="$puertoEmbarque='958'">CHUNGARA</xsl:when>
	<xsl:when test="$puertoEmbarque='712'">CIUDAD DEL CABO</xsl:when>
	<xsl:when test="$puertoEmbarque='940'">CLARENCIA</xsl:when>
	<xsl:when test="$puertoEmbarque='214'">COATZACOALCOS</xsl:when>
	<xsl:when test="$puertoEmbarque='959'">COLCHANE</xsl:when>
	<xsl:when test="$puertoEmbarque='223'">COLON</xsl:when>
	<xsl:when test="$puertoEmbarque='147'">COLUMBRES</xsl:when>
	<xsl:when test="$puertoEmbarque='267'">COMODORO RIVADAVIA</xsl:when>
	<xsl:when test="$puertoEmbarque='511'">CONSTANZA</xsl:when>
	<xsl:when test="$puertoEmbarque='923'">CONSTUTUCION</xsl:when>
	<xsl:when test="$puertoEmbarque='642'">COPENHAGEN</xsl:when>
	<xsl:when test="$puertoEmbarque='904'">COQUIMBO</xsl:when>
	<xsl:when test="$puertoEmbarque='265'">CORDOBA</xsl:when>
	<xsl:when test="$puertoEmbarque='926'">CORONEL</xsl:when>
	<xsl:when test="$puertoEmbarque='157'">CORPUS CRISTI</xsl:when>
	<xsl:when test="$puertoEmbarque='930'">CORRAL</xsl:when>
	<xsl:when test="$puertoEmbarque='121'">COSTA DEL ATLANTICO, OTROS NO</xsl:when>
	<xsl:when test="$puertoEmbarque='112'">COSTA DEL PACIFICO, OTROS NO E</xsl:when>
	<xsl:when test="$puertoEmbarque='123'">COSTA DEL PACIFICO, OTROS NO E</xsl:when>
	<xsl:when test="$puertoEmbarque='212'">COSTA DEL PACIFICO, OTROS PUER</xsl:when>
	<xsl:when test="$puertoEmbarque='983'">COYHAIQUE ALTO</xsl:when>
	<xsl:when test="$puertoEmbarque='221'">CRISTOBAL</xsl:when>
	<xsl:when test="$puertoEmbarque='302'">CURAZAO</xsl:when>
	<xsl:when test="$puertoEmbarque='938'">CUTTER COVE</xsl:when>
	<xsl:when test="$puertoEmbarque='597'">CUXHAVEN</xsl:when>
	<xsl:when test="$puertoEmbarque='412'">DAIREN</xsl:when>
	<xsl:when test="$puertoEmbarque='815'">DARWIN</xsl:when>
	<xsl:when test="$puertoEmbarque='979'">DOROTEA</xsl:when>
	<xsl:when test="$puertoEmbarque='577'">DOVER</xsl:when>
	<xsl:when test="$puertoEmbarque='149'">DULUTH</xsl:when>
	<xsl:when test="$puertoEmbarque='711'">DURBAM</xsl:when>
	<xsl:when test="$puertoEmbarque='595'">DUSSELDORF</xsl:when>
	<xsl:when test="$puertoEmbarque='717'">EAST-LONDON</xsl:when>
	<xsl:when test="$puertoEmbarque='574'">ETEN SALVERRY</xsl:when>
	<xsl:when test="$puertoEmbarque='142'">EVERGLADES</xsl:when>
	<xsl:when test="$puertoEmbarque='135'">FILADELFIA</xsl:when>
	<xsl:when test="$puertoEmbarque='594'">FRANKFURT</xsl:when>
	<xsl:when test="$puertoEmbarque='812'">FREMANTLE</xsl:when>
	<xsl:when test="$puertoEmbarque='449'">FUKUYAMA</xsl:when>
	<xsl:when test="$puertoEmbarque='969'">FUTALEUFU</xsl:when>
	<xsl:when test="$puertoEmbarque='156'">GALVESTON</xsl:when>
	<xsl:when test="$puertoEmbarque='542'">GENOVA</xsl:when>
	<xsl:when test="$puertoEmbarque='816'">GERALDTON</xsl:when>
	<xsl:when test="$puertoEmbarque='604'">GHENT</xsl:when>
	<xsl:when test="$puertoEmbarque='219'">GOLFO DE MEXICO, OTROS NO ESPE</xsl:when>
	<xsl:when test="$puertoEmbarque='631'">GOTEMBURGO</xsl:when>
	<xsl:when test="$puertoEmbarque='941'">GREGORIO</xsl:when>
	<xsl:when test="$puertoEmbarque='937'">GUARELLO</xsl:when>
	<xsl:when test="$puertoEmbarque='946'">GUAYACAN</xsl:when>
	<xsl:when test="$puertoEmbarque='242'">GUAYAQUIL</xsl:when>
	<xsl:when test="$puertoEmbarque='215'">GUAYMAS</xsl:when>
	<xsl:when test="$puertoEmbarque='113'">HALIFAX</xsl:when>
	<xsl:when test="$puertoEmbarque='592'">HAMBURGO</xsl:when>
	<xsl:when test="$puertoEmbarque='126'">HAMILTON</xsl:when>
	<xsl:when test="$puertoEmbarque='583'">HANKO</xsl:when>
	<xsl:when test="$puertoEmbarque='634'">HELSIMBORG</xsl:when>
	<xsl:when test="$puertoEmbarque='581'">HELSINSKI</xsl:when>
	<xsl:when test="$puertoEmbarque='492'">HONG KONG</xsl:when>
	<xsl:when test="$puertoEmbarque='159'">HOUSTON</xsl:when>
	<xsl:when test="$puertoEmbarque='972'">HUAHUM</xsl:when>
	<xsl:when test="$puertoEmbarque='920'">HUASCO/GUACOLDA</xsl:when>
	<xsl:when test="$puertoEmbarque='565'">HUELVA</xsl:when>
	<xsl:when test="$puertoEmbarque='976'">HUEMULES</xsl:when>
	<xsl:when test="$puertoEmbarque='985'">IBANEZ PALAVICINI</xsl:when>
	<xsl:when test="$puertoEmbarque='253'">ILO</xsl:when>
	<xsl:when test="$puertoEmbarque='902'">IQUIQUE</xsl:when>
	<xsl:when test="$puertoEmbarque='254'">IQUITOS</xsl:when>
	<xsl:when test="$puertoEmbarque='929'">ISLA DE PASCUA</xsl:when>
	<xsl:when test="$puertoEmbarque='143'">JACKSONVILLE</xsl:when>
	<xsl:when test="$puertoEmbarque='922'">JUAN FERNANDEZ</xsl:when>
	<xsl:when test="$puertoEmbarque='635'">KALMAR</xsl:when>
	<xsl:when test="$puertoEmbarque='451'">KAOHSIUNG</xsl:when>
	<xsl:when test="$puertoEmbarque='461'">KARHG ISLAND</xsl:when>
	<xsl:when test="$puertoEmbarque='452'">KEELUNG</xsl:when>
	<xsl:when test="$puertoEmbarque='584'">KEMI</xsl:when>
	<xsl:when test="$puertoEmbarque='443'">KOBE</xsl:when>
	<xsl:when test="$puertoEmbarque='585'">KOKKOLA</xsl:when>
	<xsl:when test="$puertoEmbarque='586'">KOTKA</xsl:when>
	<xsl:when test="$puertoEmbarque='282'">LA GUAIRA</xsl:when>
	<xsl:when test="$puertoEmbarque='552'">LA PALLICE</xsl:when>
	<xsl:when test="$puertoEmbarque='973'">LAGO VERDE</xsl:when>
	<xsl:when test="$puertoEmbarque='553'">LE HAVRE</xsl:when>
	<xsl:when test="$puertoEmbarque='928'">LEBU</xsl:when>
	<xsl:when test="$puertoEmbarque='543'">LIORNA, LIVORNO</xsl:when>
	<xsl:when test="$puertoEmbarque='909'">LIRQUEN</xsl:when>
	<xsl:when test="$puertoEmbarque='611'">LISBOA</xsl:when>
	<xsl:when test="$puertoEmbarque='571'">LIVERPOOL</xsl:when>
	<xsl:when test="$puertoEmbarque='572'">LONDRES</xsl:when>
	<xsl:when test="$puertoEmbarque='175'">LONG BEACH</xsl:when>
	<xsl:when test="$puertoEmbarque='174'">LOS ANGELES</xsl:when>
	<xsl:when test="$puertoEmbarque='965'">LOS LIBERTADORES</xsl:when>
	<xsl:when test="$puertoEmbarque='927'">LOTA</xsl:when>
	<xsl:when test="$puertoEmbarque='966'">MAHUIL MALAL</xsl:when>
	<xsl:when test="$puertoEmbarque='633'">MALMO</xsl:when>
	<xsl:when test="$puertoEmbarque='431'">MANILA</xsl:when>
	<xsl:when test="$puertoEmbarque='217'">MANZANILLO</xsl:when>
	<xsl:when test="$puertoEmbarque='269'">MAR DEL PLATA</xsl:when>
	<xsl:when test="$puertoEmbarque='285'">MARACAIBO</xsl:when>
	<xsl:when test="$puertoEmbarque='554'">MARSELLA</xsl:when>
	<xsl:when test="$puertoEmbarque='216'">MAZATLAN</xsl:when>
	<xsl:when test="$puertoEmbarque='915'">MEJILLONES</xsl:when>
	<xsl:when test="$puertoEmbarque='264'">MENDOZA</xsl:when>
	<xsl:when test="$puertoEmbarque='141'">MIAMI</xsl:when>
	<xsl:when test="$puertoEmbarque='150'">MILWAUKEE</xsl:when>
	<xsl:when test="$puertoEmbarque='153'">MOBILE</xsl:when>
	<xsl:when test="$puertoEmbarque='447'">MOJI</xsl:when>
	<xsl:when test="$puertoEmbarque='981'">MONTE AYMOND</xsl:when>
	<xsl:when test="$puertoEmbarque='272'">MONTEVIDEO</xsl:when>
	<xsl:when test="$puertoEmbarque='111'">MONTREAL</xsl:when>
	<xsl:when test="$puertoEmbarque='716'">MOSSEL-BAY</xsl:when>
	<xsl:when test="$puertoEmbarque='445'">NAGOYA</xsl:when>
	<xsl:when test="$puertoEmbarque='421'">NANPO</xsl:when>
	<xsl:when test="$puertoEmbarque='544'">NAPOLES</xsl:when>
	<xsl:when test="$puertoEmbarque='936'">NATALES</xsl:when>
	<xsl:when test="$puertoEmbarque='263'">NECOCHEA</xsl:when>
	<xsl:when test="$puertoEmbarque='132'">NEW HAVEN</xsl:when>
	<xsl:when test="$puertoEmbarque='154'">NEW ORLEANS</xsl:when>
	<xsl:when test="$puertoEmbarque='134'">NEW YORK</xsl:when>
	<xsl:when test="$puertoEmbarque='137'">NORFOLK</xsl:when>
	<xsl:when test="$puertoEmbarque='593'">NUREMBERG</xsl:when>
	<xsl:when test="$puertoEmbarque='160'">OAKLAND</xsl:when>
	<xsl:when test="$puertoEmbarque='645'">ODENSE</xsl:when>
	<xsl:when test="$puertoEmbarque='599'">OLDENBURG</xsl:when>
	<xsl:when test="$puertoEmbarque='961'">OLLAGUE</xsl:when>
	<xsl:when test="$puertoEmbarque='605'">OOSTENDE</xsl:when>
	<xsl:when test="$puertoEmbarque='442'">OSAKA</xsl:when>
	<xsl:when test="$puertoEmbarque='651'">OSLO</xsl:when>
	<xsl:when test="$puertoEmbarque='997'">OTROS PTOS. CHILENOS</xsl:when>
	<xsl:when test="$puertoEmbarque='499'">OTROS PUERTOS ASIATICOS NO ESP</xsl:when>
	<xsl:when test="$puertoEmbarque='799'">OTROS PUERTOS DE AFRICA NO ESP</xsl:when>
	<xsl:when test="$puertoEmbarque='596'">OTROS PUERTOS DE ALEMANIA NO E</xsl:when>
	<xsl:when test="$puertoEmbarque='399'">OTROS PUERTOS DE AMERICA NO ES</xsl:when>
	<xsl:when test="$puertoEmbarque='261'">OTROS PUERTOS DE ARGENTINA NO</xsl:when>
	<xsl:when test="$puertoEmbarque='813'">OTROS PUERTOS DE AUSTRALIA NO</xsl:when>
	<xsl:when test="$puertoEmbarque='482'">OTROS PUERTOS DE BANGLADESH NO</xsl:when>
	<xsl:when test="$puertoEmbarque='602'">OTROS PUERTOS DE BELGICA NO ES</xsl:when>
	<xsl:when test="$puertoEmbarque='291'">OTROS PUERTOS DE BRASIL NO ESP</xsl:when>
	<xsl:when test="$puertoEmbarque='522'">OTROS PUERTOS DE BULGARIA NO E</xsl:when>
	<xsl:when test="$puertoEmbarque='117'">OTROS PUERTOS DE CANADA NO IDE</xsl:when>
	<xsl:when test="$puertoEmbarque='413'">OTROS PUERTOS DE CHINA NO ESPE</xsl:when>
	<xsl:when test="$puertoEmbarque='231'">OTROS PUERTOS DE COLOMBIA NO E</xsl:when>
	<xsl:when test="$puertoEmbarque='423'">OTROS PUERTOS DE COREA</xsl:when>
	<xsl:when test="$puertoEmbarque='643'">OTROS PUERTOS DE DINAMARCA NO</xsl:when>
	<xsl:when test="$puertoEmbarque='241'">OTROS PUERTOS DE ECUADOR NO ES</xsl:when>
	<xsl:when test="$puertoEmbarque='561'">OTROS PUERTOS DE ESPANA NO ESP</xsl:when>
	<xsl:when test="$puertoEmbarque='180'">OTROS PUERTOS DE ESTADOS UNIDO</xsl:when>
	<xsl:when test="$puertoEmbarque='699'">OTROS PUERTOS DE EUROPA NO ESP</xsl:when>
	<xsl:when test="$puertoEmbarque='432'">OTROS PUERTOS DE FILIPINAS NO</xsl:when>
	<xsl:when test="$puertoEmbarque='582'">OTROS PUERTOS DE FINLANDIA NO</xsl:when>
	<xsl:when test="$puertoEmbarque='551'">OTROS PUERTOS DE FRANCIA NO ES</xsl:when>
	<xsl:when test="$puertoEmbarque='623'">OTROS PUERTOS DE HOLANDA NO ES</xsl:when>
	<xsl:when test="$puertoEmbarque='472'">OTROS PUERTOS DE INDIA NO E</xsl:when>
	<xsl:when test="$puertoEmbarque='576'">OTROS PUERTOS DE INGLATERRA NO</xsl:when>
	<xsl:when test="$puertoEmbarque='462'">OTROS PUERTOS DE IRAN NO ESPEC</xsl:when>
	<xsl:when test="$puertoEmbarque='541'">OTROS PUERTOS DE ITALIA NO ESP</xsl:when>
	<xsl:when test="$puertoEmbarque='441'">OTROS PUERTOS DE JAPON NO ESPE</xsl:when>
	<xsl:when test="$puertoEmbarque='301'">OTROS PUERTOS DE LAS ANTILLAS</xsl:when>
	<xsl:when test="$puertoEmbarque='210'">OTROS PUERTOS DE MEXICO NO ESP</xsl:when>
	<xsl:when test="$puertoEmbarque='652'">OTROS PUERTOS DE NORUEGA NO ES</xsl:when>
	<xsl:when test="$puertoEmbarque='899'">OTROS PUERTOS DE OCEANIA NO</xsl:when>
	<xsl:when test="$puertoEmbarque='224'">OTROS PUERTOS DE PANAMA NO ESP</xsl:when>
	<xsl:when test="$puertoEmbarque='251'">OTROS PUERTOS DE PERU NO ESPEC</xsl:when>
	<xsl:when test="$puertoEmbarque='612'">OTROS PUERTOS DE PORTUGAL NO E</xsl:when>
	<xsl:when test="$puertoEmbarque='512'">OTROS PUERTOS DE RUMANIA NO ES</xsl:when>
	<xsl:when test="$puertoEmbarque='491'">OTROS PUERTOS DE SINGAPURE NO</xsl:when>
	<xsl:when test="$puertoEmbarque='713'">OTROS PUERTOS DE SUDAFRICA NO</xsl:when>
	<xsl:when test="$puertoEmbarque='632'">OTROS PUERTOS DE SUECIA NO ESP</xsl:when>
	<xsl:when test="$puertoEmbarque='453'">OTROS PUERTOS DE TAIWAN NO ESP</xsl:when>
	<xsl:when test="$puertoEmbarque='271'">OTROS PUERTOS DE URUGUAY NO ES</xsl:when>
	<xsl:when test="$puertoEmbarque='281'">OTROS PUERTOS DE VENEZUELA NO</xsl:when>
	<xsl:when test="$puertoEmbarque='532'">OTROS PUERTOS DE YUGOESLAVIA N</xsl:when>
	<xsl:when test="$puertoEmbarque='587'">OULO</xsl:when>
	<xsl:when test="$puertoEmbarque='970'">PALENA-CARRENLEUFU</xsl:when>
	<xsl:when test="$puertoEmbarque='145'">PALM BEACH</xsl:when>
	<xsl:when test="$puertoEmbarque='975'">PAMPA ALTA</xsl:when>
	<xsl:when test="$puertoEmbarque='971'">PANGUIPULLI</xsl:when>
	<xsl:when test="$puertoEmbarque='295'">PARANAGUA</xsl:when>
	<xsl:when test="$puertoEmbarque='204'">PATACHE</xsl:when>
	<xsl:when test="$puertoEmbarque='913'">PATILLOS</xsl:when>
	<xsl:when test="$puertoEmbarque='925'">PENCO</xsl:when>
	<xsl:when test="$puertoEmbarque='152'">PENSACOLA</xsl:when>
	<xsl:when test="$puertoEmbarque='939'">PERCY</xsl:when>
	<xsl:when test="$puertoEmbarque='968'">PEREZ ROSALES</xsl:when>
	<xsl:when test="$puertoEmbarque='588'">PIETARSAARI</xsl:when>
	<xsl:when test="$puertoEmbarque='949'">PINO HACHADO (LIUCURA)</xsl:when>
	<xsl:when test="$puertoEmbarque='148'">PITTSBURGH</xsl:when>
	<xsl:when test="$puertoEmbarque='578'">PLYMOUTH</xsl:when>
	<xsl:when test="$puertoEmbarque='589'">PORI</xsl:when>
	<xsl:when test="$puertoEmbarque='155'">PORT ARTHUR</xsl:when>
	<xsl:when test="$puertoEmbarque='120'">PORT CARTIES</xsl:when>
	<xsl:when test="$puertoEmbarque='715'">PORT-ELIZABETH</xsl:when>
	<xsl:when test="$puertoEmbarque='172'">PORTLAND</xsl:when>
	<xsl:when test="$puertoEmbarque='125'">PRINCE RUPERT</xsl:when>
	<xsl:when test="$puertoEmbarque='268'">PUERTO MADRYN</xsl:when>
	<xsl:when test="$puertoEmbarque='910'">PUERTO MONTT</xsl:when>
	<xsl:when test="$puertoEmbarque='943'">PUERTO WILLIAMS</xsl:when>
	<xsl:when test="$puertoEmbarque='122'">PUERTOS DEL GOLFO DE MEXICO, O</xsl:when>
	<xsl:when test="$puertoEmbarque='912'">PUNTA ARENAS</xsl:when>
	<xsl:when test="$puertoEmbarque='947'">PUNTA DELGADA</xsl:when>
	<xsl:when test="$puertoEmbarque='124'">QUEBEC</xsl:when>
	<xsl:when test="$puertoEmbarque='933'">QUELLON</xsl:when>
	<xsl:when test="$puertoEmbarque='921'">QUINTERO</xsl:when>
	<xsl:when test="$puertoEmbarque='900'">RANCHO DE NAVES Y AERONAVES DE</xsl:when>
	<xsl:when test="$puertoEmbarque='531'">RIJEKA</xsl:when>
	<xsl:when test="$puertoEmbarque='294'">RIO GRANDE DEL SUR</xsl:when>
	<xsl:when test="$puertoEmbarque='293'">RIO JANEIRO</xsl:when>
	<xsl:when test="$puertoEmbarque='954'">RIO MAYER</xsl:when>
	<xsl:when test="$puertoEmbarque='955'">RIO MOSCO</xsl:when>
	<xsl:when test="$puertoEmbarque='573'">ROCHESTER</xsl:when>
	<xsl:when test="$puertoEmbarque='270'">ROSARIO</xsl:when>
	<xsl:when test="$puertoEmbarque='598'">ROSTOCK</xsl:when>
	<xsl:when test="$puertoEmbarque='622'">ROTTERDAM</xsl:when>
	<xsl:when test="$puertoEmbarque='558'">RUAN</xsl:when>
	<xsl:when test="$puertoEmbarque='115'">SAINT JOHN</xsl:when>
	<xsl:when test="$puertoEmbarque='714'">SALDANHA</xsl:when>
	<xsl:when test="$puertoEmbarque='545'">SALERNO</xsl:when>
	<xsl:when test="$puertoEmbarque='945'">SALINAS</xsl:when>
	<xsl:when test="$puertoEmbarque='297'">SALVADOR</xsl:when>
	<xsl:when test="$puertoEmbarque='906'">SAN ANTONIO</xsl:when>
	<xsl:when test="$puertoEmbarque='176'">SAN DIEGO</xsl:when>
	<xsl:when test="$puertoEmbarque='173'">SAN FRANCISCO</xsl:when>
	<xsl:when test="$puertoEmbarque='964'">SAN FRANCISCO</xsl:when>
	<xsl:when test="$puertoEmbarque='962'">SAN PEDRO DE ATACAMA</xsl:when>
	<xsl:when test="$puertoEmbarque='982'">SAN SEBASTIAN</xsl:when>
	<xsl:when test="$puertoEmbarque='908'">SAN VICENTE</xsl:when>
	<xsl:when test="$puertoEmbarque='292'">SANTOS</xsl:when>
	<xsl:when test="$puertoEmbarque='296'">SAO PAULO</xsl:when>
	<xsl:when test="$puertoEmbarque='140'">SAVANAH</xsl:when>
	<xsl:when test="$puertoEmbarque='547'">SAVONA</xsl:when>
	<xsl:when test="$puertoEmbarque='171'">SEATLE</xsl:when>
	<xsl:when test="$puertoEmbarque='613'">SETUBAL</xsl:when>
	<xsl:when test="$puertoEmbarque='566'">SEVILLA</xsl:when>
	<xsl:when test="$puertoEmbarque='411'">SHANGAI</xsl:when>
	<xsl:when test="$puertoEmbarque='446'">SHIMIZUI</xsl:when>
	<xsl:when test="$puertoEmbarque='811'">SIDNEY</xsl:when>
	<xsl:when test="$puertoEmbarque='963'">SOCOMPA</xsl:when>
	<xsl:when test="$puertoEmbarque='653'">STAVANGER</xsl:when>
	<xsl:when test="$puertoEmbarque='161'">STOCKTON</xsl:when>
	<xsl:when test="$puertoEmbarque='907'">TALCAHUANO</xsl:when>
	<xsl:when test="$puertoEmbarque='916'">TALTAL</xsl:when>
	<xsl:when test="$puertoEmbarque='151'">TAMPA</xsl:when>
	<xsl:when test="$puertoEmbarque='211'">TAMPICO</xsl:when>
	<xsl:when test="$puertoEmbarque='567'">TARRAGONA</xsl:when>
	<xsl:when test="$puertoEmbarque='944'">TERRITORIO ANTARTICO CHILENO</xsl:when>
	<xsl:when test="$puertoEmbarque='914'">TOCOPILLA</xsl:when>
	<xsl:when test="$puertoEmbarque='924'">TOME</xsl:when>
	<xsl:when test="$puertoEmbarque='116'">TORONTO</xsl:when>
	<xsl:when test="$puertoEmbarque='935'">TORTEL</xsl:when>
	<xsl:when test="$puertoEmbarque='984'">TRIANA</xsl:when>
	<xsl:when test="$puertoEmbarque='905'">VALPARAISO</xsl:when>
	<xsl:when test="$puertoEmbarque='114'">VANCOUVER</xsl:when>
	<xsl:when test="$puertoEmbarque='521'">VARNA</xsl:when>
	<xsl:when test="$puertoEmbarque='948'">VENTANAS</xsl:when>
	<xsl:when test="$puertoEmbarque='213'">VERACRUZ</xsl:when>
	<xsl:when test="$puertoEmbarque='986'">VILLA OHIGGINS</xsl:when>
	<xsl:when test="$puertoEmbarque='956'">VISVIRI</xsl:when>
	<xsl:when test="$puertoEmbarque='138'">WILMINGTON</xsl:when>
	<xsl:when test="$puertoEmbarque='448'">YAWATA</xsl:when>
	<xsl:when test="$puertoEmbarque='444'">YOKOHAMA</xsl:when>
	<xsl:when test="$puertoEmbarque='603'">ZEEBRUGGE</xsl:when>
	<xsl:when test="$puertoEmbarque='952'">ZONA FRANCA IQUIQUE</xsl:when>
	<xsl:when test="$puertoEmbarque='953'">ZONA FRANCA PUNTA ARENAS</xsl:when>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->