<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1"
xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" 
xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" 
xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>


	<xsl:template name="DetallesEncabezado">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table border="0" width="100%" cellpadding="4" cellspacing="0">
						<tr>
							<td align="left">
								<font face="Arial, Helvetica, sans-serif" size="2">
									COMPROBANTES DE PAGO QUE DAN ORIGEN A LA RETENCI�N:
								</font>
							</td>
							<td align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
									IMPORTES EXPRESADOS EN SOLES
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						
						<tr>
							<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>TIPO</strong>
								</font>
							</td>
							<td width="20%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>SERIE / CORRELATIVO</strong>
								</font>
							</td>
							<td width="15%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>FECHA EMISI�N</strong>
								</font>
							</td>
							<td width="15%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>MDA. DOC.</strong>
								</font>
							</td>
							<td width="15%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>MONTO DOC. ORIG.</strong>
								</font>
							</td>
							<td width="15%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>MONTO S/</strong>
								</font>
							</td>
							<td width="15%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>IMPORTE RETENIDO</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<xsl:for-each select="//sac:SUNATRetentionDocumentReference">

							
							<tr>
								<td width="5%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID/@schemeID"/>
									</font>
								</td>
								<td width="20%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="substring-before(cbc:ID,'-')"/>- 
									<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
									</font>
								</td>
								<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:IssueDate"/>
									</font>
								</td>

								<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:TotalInvoiceAmount/@currencyID"/>
									</font>
								</td>
								<td width="15%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:TotalInvoiceAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
								
								
								<td width="15%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="position()" />
											<xsl:with-param name="adicional" select="1" />
										</xsl:call-template>	
									</font>
								</td>
								
								<td width="15%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(sac:SUNATRetentionInformation/sac:SUNATRetentionAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
								
							</tr>
						</xsl:for-each>

						<!-- <xsl:call-template name="lineaBl">
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
						</xsl:call-template> -->
						<xsl:call-template name="lineaBl"><xsl:with-param name="cont" select="$numColBl"/></xsl:call-template>
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
					<font face="Arial, Helvetica, sans-serif" size="1">�
					</font>
				</td>
				<td width="20%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">�
					</font>
				</td>
				<td width="15%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">�
					</font>
				</td>
				<td width="15%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">�
					</font>
				</td>
				<td width="15%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">�
					</font>
				</td>
				<td width="15%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">�
					</font>
				</td>
				<td width="15%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">�
					</font>
				</td>
			
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="tmpDatosAdicionalesDetalle">
		<xsl:param name="item" />
		<xsl:param name="adicional" />


		<xsl:for-each select="//pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($item, $adicional)">

				<xsl:value-of select="pe:Valor" />

			</xsl:if>
		</xsl:for-each>


		<xsl:for-each select="//pe1:DatosAdicionales/pe1:LineaDetalle">
	

			<xsl:if test="pe1:Codigo = concat($item, $adicional)">


	<xsl:value-of select="pe1:Valor" />

			</xsl:if>
		</xsl:for-each>


		<xsl:for-each select="//pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo = concat($item, $adicional)">
				<xsl:value-of select="pe2:Valor" />
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
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="">
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->