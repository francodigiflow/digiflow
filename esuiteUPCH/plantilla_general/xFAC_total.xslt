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
	<xsl:template name="son-pesos">
		<table>
			<td align="left" width="100%">
				<font face="Arial" size="1">
					<!--<strong>SON:<xsl:value-of select="round(//cac:TaxSubtotal/cbc:TaxAmount + //cac:LegalMonetaryTotal/cbc:PayableAmount)"/> Pesos</strong>-->
				</font>
			</td>
		</table>
	</xsl:template>

	<xsl:template name="total">
			<table border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000" heigth="100%">
				<tr>
					<td width="80%" align="left"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					 <strong>Monto Neto</strong></font>
					</td>
					<td width="20%" align="right"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					<strong>
					<xsl:for-each select="/pe:Invoice/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
					<xsl:if test="cbc:ID='1001'">  
					<xsl:value-of select="cbc:PayableAmount"/>
					</xsl:if></xsl:for-each></strong>
					</font>
					</td>
				</tr>
				<tr>
					<td width="80%"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					 <strong>Total Exento</strong></font>
					</td>
					<td width="20%" align="rigth"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
						<xsl:for-each select="/pe:Invoice/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal"><xsl:if test="cbc:ID='1002'">  
						<strong><xsl:value-of select="cbc:PayableAmount"/></strong></xsl:if></xsl:for-each></font>
					</td>
				</tr>
				<tr>
					<td width="80%"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					 <strong>Total Venta Exonerada</strong></font>
					</td>
					<td width="20%" align="rit">
					<font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					<xsl:for-each select="/pe:Invoice/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
<xsl:if test="cbc:ID='1003'"><strong><xsl:value-of select="cbc:PayableAmount"/></strong></xsl:if></xsl:for-each></font>
					</td>
				</tr>
				<tr>
					<td width="80%"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					 <strong>Total Descuentos</strong></font>
					</td>
					<td width="20%" align="center"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					<strong> </strong><xsl:value-of select="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount"/></font>
					</td>
				</tr>
				<tr>
					<td width="80%"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					 <strong>Total Otros Cargos</strong></font>
					</td>
					<td width="20%" align="center"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					<strong> </strong><xsl:value-of select="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount"/></font>
					</td>
				</tr>
				<tr>
					<td width="80%"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					 <strong>Total Otros Tributos</strong></font>
					</td>
					<td width="20%" align="center"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					<strong> </strong></font>
					</td>
				</tr>
				<tr>
					<td width="80%"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					 <strong>Total Igv 18%</strong></font>
					</td>
					<td width="20%" align="center"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					<strong><xsl:value-of select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount"/></strong>
					</font>
					</td>
				</tr>
				<tr >
					<td width="80%"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					 <strong>Importe Total</strong></font>
					</td>
					<td width="20%" align="center"><font face="Times New Roman,Arial, Helvetica, sans-serif" size="1">
					<strong><xsl:value-of select="//cac:LegalMonetaryTotal/cbc:PayableAmount"/></strong>
					</font></td>
				</tr>
			</table>
	</xsl:template>

	<xsl:template name="total1">
		<table border="1" width="100%" cellpadding="2" cellspacing="-2">
			<tr>
				<td colspan="2" rowspan="3"> </td>
				<td bgcolor="#93D3FF" width="14%">
					<font face="Arial" size="2">
						<strong>Exento</strong>
					</font>
				</td>
				<td bgcolor="#93D3FF" width="20%" align="right">
					<font face="Arial" size="2">
						<strong>
							<xsl:value-of select="format-number(DTE/Exportaciones/Encabezado/Totales/MntExe ,'###.###.###','pen')"/>
						</strong>
					</font>
				</td>
			</tr>
			<tr>
				<td bgcolor="#93D3FF" width="14%">
					<font face="Arial" size="2">
						<strong>Total</strong>
					</font>
				</td>
				<td bgcolor="#93D3FF" width="20%" align="right">
					<font face="Arial" size="2">
						<strong>
							<xsl:value-of select="format-number(DTE/Exportaciones/Encabezado/Totales/MntTotal,'#.##0','pen')"/>
						</strong>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="totalEx">
		<table border="1" width="100%" cellpadding="2" cellspacing="-2" bordercolor="#000000">
			<tr bgcolor="#93D3FF">
				<td width="43%">
					<font face="Arial" size="2">
						<strong> Exento</strong>
					</font>
				</td>
				<td width="57%" align="right">
					<font face="Arial" size="2">
						<strong>
							<xsl:value-of select="format-number(DTE/Exportaciones/Encabezado/Totales/MntExe ,'###.###.###','pen')"/>
						</strong>
					</font>
				</td>
			</tr>
			<tr bgcolor="#93D3FF">
				<td width="40%">
					<font face="Arial" size="2">
						<strong> Total</strong>
					</font>
				</td>
				<td width="60%" align="right">
					<font face="Arial" size="2">
						<strong>
							<xsl:value-of select="format-number(DTE/Exportaciones/Encabezado/Totales/MntTotal,'#.##0','pen')"/>
						</strong>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Cancelado">
	<table border="1" cellSpacing="0" cellPadding="1" width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
		<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
			<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td width="30%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="2" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;</strong>
					</font>
				</td>
				<td width="40%" align="center" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="2" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">CANCELADO</strong>
					</font>
				</td>
				<td width="30%" align="right" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="2" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;</strong>
					</font>
				</td>
			</tr>
			<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td width="30%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="2" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;DIA</strong>
					</font>
				</td>
				<td width="40%" align="center" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="2" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;MES</strong>
					</font>
				</td>
				<td width="30%" align="center" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="2" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;AÑO</strong>
					</font>
				</td>
			</tr>
			<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td width="30%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="2" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;</strong>
					</font>
				</td>
				<td width="40%" align="right" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="2" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;</strong>
					</font>
				</td>
				<td width="30%" align="right" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="2" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;</strong>
					</font>
				</td>
			</tr>
			<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td colSpan="3" width="30%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="2" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;Con :</font>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

	<xsl:template name="exento">
		<table border="1" bordercolor="#000000" width="100%" cellpadding="2" cellspacing="-1">
			<tr bgcolor="#93D3FF">
				<td width="48%">
					<font face="Arial" size="2">
						<strong>Exento</strong>
						<strong>           $</strong>
					</font>
				</td>
				<td width="52%" align="right">
					<font face="Arial" size="2">
						<strong>
							<xsl:value-of select="format-number(DTE/Documento/Encabezado/Totales/MntExe,'###.###.###','pen')"/>
						</strong>
					</font>
				</td>
			</tr>
			<tr bgcolor="#93D3FF">
				<td>
					<font face="Arial" size="2">
						<strong>Monto Total</strong>
						<strong>  $</strong>
					</font>
				</td>
				<td align="right">
					<font face="Arial" size="2">
						<strong>
							<xsl:value-of select="format-number(DTE/Documento/Encabezado/Totales/MntTotal,'#.##0','pen')"/>
						</strong>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="totalCompra">
		<table border="1" bordercolor="#000000" width="100%" cellpadding="1" cellspacing="0">
			<tr>
				<td align="right">
					<font face="Arial" size="2">
						<strong>Neto $</strong>
					</font>
				</td>
				<td width="60%" align="right" valign="top">
					<font face="Arial" size="2">
						<strong>
							<xsl:value-of select="format-number(DTE/Documento/Encabezado/Totales/MntNeto,'#.##0','pen')"/>
						</strong>
					</font>
				</td>
			</tr>
			<tr>
				<td width="50%" align="right" valign="top">
					<font face="Arial" size="2">
						<strong>8% IVA a Retener $</strong>
					</font>
				</td>
				<td width="50%" align="right" valign="top">
					<font face="Arial" size="2">
						<xsl:for-each select="DTE/Documento/Encabezado/Totales/ImptoReten">
							<xsl:if test="TipoImp='33'">
								<strong>
									<xsl:value-of select="format-number(MontoImp,'#.##0','pen')"/>
								</strong>
							</xsl:if>
						</xsl:for-each>
						<xsl:if test="count(DTE/Documento/Encabezado/Totales/ImptoReten/TipoImp)=0">
							<strong>0</strong>
						</xsl:if>
						<xsl:if test="DTE/Documento/Encabezado/Totales/ImptoReten/TipoImp='41'">
							<strong>0</strong>
						</xsl:if>
					</font>
				</td>
			</tr>
			<tr>
				<td width="50%" align="right" valign="top">
					<font face="Arial" size="2">
						<strong>11% IVA no Retenido $</strong>
					</font>
				</td>
				<td width="50%" align="right" valign="top">
					<font face="Arial" size="2">
						<strong>
							<xsl:value-of select="format-number(DTE/Documento/Encabezado/Totales/IVANoRet ,'#.##0','pen')"/>
						</strong>
					</font>
				</td>
			</tr>
			<tr>
				<td align="right" valign="top">
					<font face="Arial" size="2">
						<strong>
							<xsl:value-of select="DTE/Documento/Encabezado/Totales/TasaIVA"/>% IVA Retenido Total $</strong>
					</font>
				</td>
				<td align="right" valign="top">
					<font face="Arial" size="2">
						<strong>
							<xsl:value-of select="format-number(DTE/Documento/Encabezado/Totales/IVA,'###.###.###','pen')"/>
						</strong>
					</font>
				</td>
			</tr>
			<tr>
				<td align="right" valign="top">
					<font face="Arial" size="2">
						<strong>Sub Total $</strong>
					</font>
				</td>
				<td align="right" valign="top">
					<font face="Arial" size="2">
						<xsl:for-each select="DTE/Documento/Encabezado/Totales">
							<strong>
								<xsl:value-of select="format-number(MntNeto + IVA,'###.###.###','pen')"/>
							</strong>
						</xsl:for-each>
					</font>
				</td>
			</tr>
			<tr>
				<td align="right" valign="top">
					<font face="Arial" size="2">
						<strong>(-)menos <xsl:value-of select="DTE/Documento/Encabezado/Totales/ImptoReten/TasaImp"/>% IVA Retenido $</strong>
					</font>
				</td>
				<td align="right" valign="top">
					<font face="Arial" size="2">
						<strong>
							<xsl:value-of select="DTE/Documento/Encabezado/Totales/ImptoReten/MontoImp"/>
						</strong>
						<xsl:if test="count(DTE/Documento/Encabezado/Totales/ImptoReten/TipoImp)=0">
							<strong>0</strong>
						</xsl:if>
					</font>
				</td>
			</tr>
			<tr>
				<td align="right">
					<font face="Arial" size="2">
						<strong>Total a Pagar $</strong>
					</font>
				</td>
				<td align="right">
					<font face="Arial" size="2">
						<xsl:for-each select="DTE/Documento/Encabezado/Totales">
							<strong>
								<xsl:value-of select="format-number(MntTotal,'###.###.###','pen')"/>
							</strong>
						</xsl:for-each>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Referencia">
	<table border="0" rules="cols" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
		<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
			<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
						<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td width="100%" align="left" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<font size="1" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">DOCUMENTO(S) DE REFERENCIA :</font>
								</td>
							</tr>
							<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
								<td xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
									<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
										<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
											<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
												<td width="60%" align="center" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
													<font size="1" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
														<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">Tipo Doc.</strong>
													</font>
												</td>
												<td width="40%" align="center" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
													<font size="1" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
														<strong xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">Folio</strong>
													</font>
												</td>
											</tr>
											<xsl:if test="//cbc:InvoiceTypeCode= '01'">
												<xsl:for-each select="//cac:DespatchDocumentReference">
													<xsl:if test="cbc:DocumentTypeCode != '10'">
														<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
															<td width="30%" align="center" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
																<font size="1" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"><!--xsl:value-of select="TpoDocRef"/-->&#160; 
																	<xsl:choose>
																		<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
																		<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
																		<xsl:when test="cbc:DocumentTypeCode='09'">GUIA DE DESPACHO</xsl:when>
																		<xsl:otherwise>Documento NN</xsl:otherwise>
																	</xsl:choose>
																</font>
															</td>
															<td width="15%" align="center" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
																<font size="1" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
																	<xsl:value-of select="substring-after(cbc:ID,'-')"/>
																</font>
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

	<xsl:template name="InformesAsoc">
		<table rules="cols" border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<table border="0" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
						<tr>
							<td width="15%" align="left">
								<font face="Arial" size="2">
									<strong>Informes Asociados :</strong>
								</font>
							</td>
							<td width="75%" align="left">
								<font size="2" face="Arial, Helvetica, sans-serif">
									<xsl:value-of select="DTE/Documento/ValAdicionales/Val3"/>
								</font>
								<br/> </td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="CuadroPago">
	<table border="0"  width="100%" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
		<tbody xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
			<tr>
				<td vAlign="top" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="1" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;Depositar o transferir electrónicamente a :</font>
				</td>
			</tr>
			<tr>
				<td align="left" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="2" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;<strong>Saga Falabella SA.</strong></font>
				</td>
			</tr>
			<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td align="left" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="1" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;Banco Peru, cuenta 40-17394-3.</font>
				</td>
			</tr>
			<tr xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
				<td align="left" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
					<font size="1" face="Arial" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">&#160;Avisar a email contabilidad@falabella.pe</font>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>
	
	<xsl:template name="fecha_ddmmaa_ref">
		<xsl:variable name="aa">
			<xsl:value-of select="substring-before(FchRef,'-')"/>
		</xsl:variable>
		<xsl:variable name="mmdd">
			<xsl:value-of select="substring-after(FchRef,'-')"/>
		</xsl:variable>
		<!--prefijo Fecha Emision Mes -->
		<xsl:variable name="mm">
			<xsl:value-of select="substring-before($mmdd,'-')"/>
		</xsl:variable>
		<xsl:variable name="dd">
			<xsl:value-of select="substring-after($mmdd,'-')"/>
		</xsl:variable>
		<!-- MES -Nombre -->

		<xsl:value-of select="concat($dd,'-', $mm, '-' , $aa)"/>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->