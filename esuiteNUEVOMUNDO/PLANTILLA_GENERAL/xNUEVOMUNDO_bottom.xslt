<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt">

	<xsl:template name="bottom_hash">
		<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
			<tr>
					<td width="50%" align="left" valign="top" colspan="2">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount = '0.00' or //cac:LegalMonetaryTotal/cbc:PayableAmount = '0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
								<xsl:if test="cbc:ID='1002'">
									<xsl:value-of select="cbc:Value"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:if test="//cbc:Note/@languageLocaleID = '1002'">
								<xsl:value-of select="//cbc:Note"/>
							</xsl:if>
						</xsl:if>
						</font>
						<br/>
					</td>
				</tr>
				<tr>
					<td width="50%" align="left" valign="top" colspan="2">
					<!--<xsl:if test="//cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode!='40' and //cbc:UBLVersionID='2.1'">-->
						<table border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
						<br/>
							<td rowspan="2">
								<font face="Arial, Helvetica, sans-serif" size="0.5">
									<b>OBSERVACIONES:</b>&#xA0;
									<!--<xsl:call-template name="TraeValorVariable">
										<xsl:with-param name="varNumVA" select="10"/>
									</xsl:call-template>-->
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='8'">
												<xsl:if test="pe:Valor !='-' and pe:Valor !=''" >
													<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='8'">
												<xsl:if test="pe1:Valor !='-' and pe1:Valor !=''" >
													<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='8'">
												<xsl:if test="pe2:Valor !='-' and pe2:Valor !=''" >
													<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
								</font>
							</td>
						</table>
						<!--</xsl:if>-->
					</td>
				</tr>

				<tr>
					<td width="50%" align="left" valign="top" colspan="2">
						<br/>
						<table border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
							<td rowspan="2">
								<font face="Arial, Helvetica, sans-serif" size="0.5">CIA INDUSTRIAL NUEVO MUNDO S. A. HA SIDO DESIGNADA COMO AGENTE DE RETENCIÓN, ENCONTRANDOSE POR TANTO EXCLUIDA DE QUE SE EL EFECTUE LA RETENCIÓN DEL IMPUESTO GENERAL A LAS VENTAS CORRESPONDIENTES CONFORME A LA RESOLUCIÓN DE SUPERINTENDENCIA N° 037-2002/SUNAT</font>
							</td>
						</table>
					</td>
				</tr>

				<td align="LEFT" width="50%" valign="top">
					<br/>
					<font face="Arial, Helvetica, sans-serif" size="0.5">Representación impresa de la
						<xsl:call-template name="aviso"/>
						<br/>Podrá ser consultada en:
						<br/>http://factura.ecomprobantes.pe/nuevomundo<br/></font>
					<br/>
				</td>


				<td align="center" width="50%">
					<xsl:call-template name="imp_timbre"/>
				</td>

				<!-- Leyendas -->
				<tr>
					<td>
						<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<font face="Arial, Helvetica, sans-serif" size="0.5">
								<xsl:if test="cbc:ID='1004'">
									<xsl:if test="cbc:PayableAmount != '0'">
										<br/>
										<br/>TRANSFERENCIA GRATUITA DE UN BIEN Y/O SERVICIO PRESTADO GRATUITAMENTE</xsl:if>
								</xsl:if>

								<xsl:if test="//cbc:Note/@languageLocaleID = '1002'">
							<xsl:value-of select="//cbc:Note"/>
						</xsl:if>
							</font>
						</xsl:for-each>-->
						<font face="Arial, Helvetica, sans-serif" size="0.5">
							<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount = '0.00'">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
									<xsl:if test="cbc:ID='1002'">
										<xsl:value-of select="cbc:Value"/>
									</xsl:if>
								</xsl:for-each>

								<xsl:if test="//cbc:Note/@languageLocaleID = '1002'">
									<xsl:value-of select="//cbc:Note"/>
								</xsl:if>
							</xsl:if>
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="imp_timbre">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tr>
				<td width="100%" align="right">
					<!--<table border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td valign="top" align="RIGHT" width="100%">-->
					<font face="Arial" size="0.5">

						<!---->
						<!--<xsl:element name="IMG">
									                  <xsl:attribute name="SRC">
									                     <xsl:call-template name="timbre"/>
									                  </xsl:attribute>
									                  <xsl:attribute name="height">
									                     100px
									                  </xsl:attribute>
									                  <xsl:attribute name="width">
									                     100px
									                  </xsl:attribute>
									               </xsl:element>-->
						<!---->


						<!--<img src="<xsl:call-template name="timbre"/>" width="100">-->
						<!--<img src="20100073723-03-BB11-89000040.jpg" width="100px" style="max-width:100px; height:20px;"></img>-->
						<!-- <img width="100" height="100" style="max-width:100px">
							<xsl:attribute name="src">
								<xsl:call-template name="timbre"/>
							</xsl:attribute>
						</img> -->
						<img width="100" height="100" align="center" src="data:image/*;base64,[ted_1]" />
					</font>
				</td>
			</tr>
			<tr>
			</tr>
			<!--</table>
				</td>
			</tr>-->
		</table>
	</xsl:template>

	<!--<xsl:template name="timbre">
		<xsl:call-template name="nombreTed">
			<xsl:with-param name="text" select="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID"/>
			<xsl:with-param name="largo" select="'11'"/>
		</xsl:call-template>
		<xsl:value-of select="'-'"/>
		<xsl:value-of select="//cbc:InvoiceTypeCode"/>
		<xsl:if test="/pe1:CreditNote">
			<xsl:value-of select="'07'"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
			<xsl:value-of select="'08'"/>
		</xsl:if>
		<xsl:value-of select="'-'"/>
		<xsl:value-of select="/pe:Invoice/cbc:ID"/>
		<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
		<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
		<xsl:value-of select="'.jpg'"/>

	</xsl:template>-->
	<xsl:template name="timbre">
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:Documento/pe1:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:Documento/pe2:Nombre"/>
		<xsl:value-of select="'.jpg'"/>
	</xsl:template>

	<xsl:template name="nombreTed">
		<xsl:param name="text"/>
		<xsl:param name="largo" select="0"/>
		<xsl:variable name="largo_actual" select="string-length($text)"/>
		<xsl:choose>
			<xsl:when test="$largo_actual &gt;= $largo">
				<xsl:value-of select="$text"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="prefix" select="concat('0', $text)"/>
				<xsl:call-template name="nombreTed">
					<xsl:with-param name="text" select="$prefix"/>
					<xsl:with-param name="largo" select="$largo"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\par" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->