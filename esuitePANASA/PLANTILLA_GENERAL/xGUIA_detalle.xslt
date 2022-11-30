<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
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


	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>


	<xsl:template name="DetallesEncabezado">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr bgcolor="silver">
							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UNIDAD</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="53%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>LOTE</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>N° BULTOS</strong>
								</font>
							</td>

						</tr>

					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<xsl:for-each select="//cac:DespatchLine">
							<tr>
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:DeliveredQuantity/@unitCode"/>
									</font>
								</td>
							    <td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="cbc:DeliveredQuantity"/>
									</font>
								</td>
								<td width="53%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cbc:CustomizationID='1.0'">
											<xsl:value-of select="cac:Item/cbc:Name"/>
										</xsl:if>
										<xsl:if test="//cbc:CustomizationID='2.0'">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</xsl:if>
									</font>
								</td>
                                <td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumAd" select="1"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:if test="$ValorAdicional1">
											<xsl:value-of select="$ValorAdicional1"/>
										</xsl:if>
									</font>
								</td>
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumAd" select="2"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:if test="$ValorAdicional1">
											<xsl:value-of select="$ValorAdicional1"/>
										</xsl:if>
									</font>
								</td>
							</tr>
						</xsl:for-each>

						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template>
					</table>
				</td>
			</tr>
			<!--<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>PESO BRUTO</strong>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="//cac:Shipment/cbc:GrossWeightMeasure"/>
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
									
								</font>
							</td>
							<td width="50%" align="center" colspan="3">
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
									
								</font>
							</td>
							<td width="10%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
									
								</font>
							</td>

						</tr>

					</table>
				</td>
			</tr>-->
		</table>
	</xsl:template>


		<xsl:template name="DetallesEncabezado_2">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" cellpadding="4" cellspacing="0">
						<tr bgcolor="silver">
							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UNIDAD</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="41%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>COD EAN</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>LOTE</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>N° BULTOS</strong>
								</font>
							</td>

						</tr>

					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<xsl:for-each select="//cac:DespatchLine">
							<tr>
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:DeliveredQuantity/@unitCode"/>
									</font>
								</td>
							    <td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="cbc:DeliveredQuantity"/>
									</font>
								</td>
								<td width="41%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="//cbc:CustomizationID='1.0'">
											<xsl:value-of select="cac:Item/cbc:Name"/>
										</xsl:if>
										<xsl:if test="//cbc:CustomizationID='2.0'">
											<xsl:value-of select="cac:Item/cbc:Description"/>
										</xsl:if>
									</font>
								</td>
								<td width="12%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumAd" select="3"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:if test="$ValorAdicional1">
											<xsl:value-of select="$ValorAdicional1"/>
										</xsl:if>
									</font>
								</td>
                                <td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumAd" select="1"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:if test="$ValorAdicional1">
											<xsl:value-of select="$ValorAdicional1"/>
										</xsl:if>
									</font>
								</td>
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumAd" select="2"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:if test="$ValorAdicional1">
											<xsl:value-of select="$ValorAdicional1"/>
										</xsl:if>
									</font>
								</td>
							</tr>
						</xsl:for-each>

						<xsl:call-template name="lineaB2">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template>
					</table>
				</td>
			</tr>
			
		</table>
	</xsl:template>

	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="8%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="8%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="53%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="8%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="8%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>

			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>


	<xsl:template name="lineaB2">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="10%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="8%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="8%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="41%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="12%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="8%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="8%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>

			</tr>
			<xsl:call-template name="lineaB2">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	
	<xsl:template name="TraeValorVariable">
		<xsl:param name="varNumVA"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="RetourneValAdItem">
		<xsl:param name="NumLinea"/>
		<xsl:param name="NumAd"/>

		<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">-->
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		
	</xsl:template>


	<xsl:template name="unidad_medida">
		<xsl:choose>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PL' or cbc:CreditedQuantity/@unitCode='PL' or cbc:DebitedQuantity/@unitCode='PL'">BAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D64' or cbc:CreditedQuantity/@unitCode='D64' or cbc:DebitedQuantity/@unitCode='D64'">BLK</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BG' or cbc:CreditedQuantity/@unitCode='BG' or cbc:DebitedQuantity/@unitCode='BG'">BOL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BO' or cbc:CreditedQuantity/@unitCode='BO' or cbc:DebitedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BX' or cbc:CreditedQuantity/@unitCode='BX' or cbc:DebitedQuantity/@unitCode='BX'">CAJ</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CY' or cbc:CreditedQuantity/@unitCode='CY' or cbc:DebitedQuantity/@unitCode='CY'">CIL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CLT' or cbc:CreditedQuantity/@unitCode='CLT' or cbc:DebitedQuantity/@unitCode='CLT'">CL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CMT' or cbc:CreditedQuantity/@unitCode='CMT' or cbc:DebitedQuantity/@unitCode='CMT'">CM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CJ' or cbc:CreditedQuantity/@unitCode='CJ' or cbc:DebitedQuantity/@unitCode='CJ'">CON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='DLT' or cbc:CreditedQuantity/@unitCode='DLT' or cbc:DebitedQuantity/@unitCode='DLT'">DL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL' or cbc:CreditedQuantity/@unitCode='GLL' or cbc:DebitedQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GRM' or cbc:CreditedQuantity/@unitCode='GRM' or cbc:DebitedQuantity/@unitCode='GRM'">GR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='HUR' or cbc:CreditedQuantity/@unitCode='HUR' or cbc:DebitedQuantity/@unitCode='HUR'">HRA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KT' or cbc:CreditedQuantity/@unitCode='KT' or cbc:DebitedQuantity/@unitCode='KT'">JGO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM' or cbc:CreditedQuantity/@unitCode='KGM' or cbc:DebitedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KWT' or cbc:CreditedQuantity/@unitCode='KWT' or cbc:DebitedQuantity/@unitCode='KWT'">KW</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR' or cbc:CreditedQuantity/@unitCode='LBR' or cbc:DebitedQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR' or cbc:CreditedQuantity/@unitCode='LTR' or cbc:DebitedQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTR' or cbc:CreditedQuantity/@unitCode='MTR' or cbc:DebitedQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK' or cbc:CreditedQuantity/@unitCode='MTK' or cbc:DebitedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTQ' or cbc:CreditedQuantity/@unitCode='MTQ' or cbc:DebitedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MIL' or cbc:CreditedQuantity/@unitCode='MIL' or cbc:DebitedQuantity/@unitCode='MIL'">MIL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D61' or cbc:CreditedQuantity/@unitCode='D61' or cbc:DebitedQuantity/@unitCode='D61'">MIN</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MLT' or cbc:CreditedQuantity/@unitCode='MLT' or cbc:DebitedQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MMT' or cbc:CreditedQuantity/@unitCode='MMT' or cbc:DebitedQuantity/@unitCode='MMT'">MM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NPR' or cbc:CreditedQuantity/@unitCode='NPR' or cbc:DebitedQuantity/@unitCode='NPR'">PAR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTK' or cbc:CreditedQuantity/@unitCode='FTK' or cbc:DebitedQuantity/@unitCode='FTK'">PI2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTQ' or cbc:CreditedQuantity/@unitCode='FTQ' or cbc:DebitedQuantity/@unitCode='FTQ'">PI3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PA' or cbc:CreditedQuantity/@unitCode='PA' or cbc:DebitedQuantity/@unitCode='PA'">PQT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='INH' or cbc:CreditedQuantity/@unitCode='INH' or cbc:DebitedQuantity/@unitCode='INH'">PUL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NRL' or cbc:CreditedQuantity/@unitCode='NRL' or cbc:DebitedQuantity/@unitCode='NRL'">ROL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE' or cbc:CreditedQuantity/@unitCode='TNE' or cbc:DebitedQuantity/@unitCode='TNE'">TON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NIU' or cbc:CreditedQuantity/@unitCode='NIU' or cbc:DebitedQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SA' or cbc:CreditedQuantity/@unitCode='SA' or cbc:DebitedQuantity/@unitCode='SA'">SAC</xsl:when>		
			<xsl:otherwise>UNI
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="TipoDeMoneda_Total">
		<xsl:choose>
			<xsl:when test="//sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/@currencyID='PEN'">S/</xsl:when>
			<xsl:when test="//sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/@currencyID='USD'">USD</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->