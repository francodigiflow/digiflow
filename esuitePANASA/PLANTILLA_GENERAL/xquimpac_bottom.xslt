<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
			xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
			xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
		xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
		xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
		xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
		xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
		xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
		xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
		xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2http://localhost/dbnweb/librerias/img/banner2_azul.png"
		xmlns:ccts="urn:un:unece:uncefact:documentation:2"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
		
		
	<xsl:template name="bottom_hash">
		<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td valign="top" width="50%" align="left">
						<xsl:call-template name="Observacion"/>
					</td>

					<td align="center" width="50%" valign="middle">
					<font color="#000000" size="2" face="Arial, Helvetica, Helvetica, sans-serif">
						Representación impresa de la <xsl:call-template name="aviso" />
						<br/>Podrá ser consultada en: www.quimpac.com.pe
						<br/>Autorizado mediante Resolución: N° 0180050001227/SUNAT<br/><br/>
					</font>
				
									
									<img width="100" height="100">
						<xsl:attribute name="src">
							<xsl:call-template name="timbre" />
						</xsl:attribute>
					</img>
					
					
				
					</td>
				</tr>
			</tbody>
		</table>



	
	





		<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
				
					<td align="left" width="100%">
					<!--
						<xsl:variable name="varVALOR">
							<xsl:call-template name="TraeValorVariable">
								<xsl:with-param name="varNumVA" select="24"/>
							</xsl:call-template>
						</xsl:variable>
						-->
						<!--
						<xsl:if test="$varVALOR='01'"> -->
						
						<font face="Arial, Helvetica, sans-serif" size="1">
						<br/>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='30' and pe:Valor != '-' ">
														<xsl:call-template name="TraeValorVariable">
															<xsl:with-param name="varNumVA" select="30"/>
														</xsl:call-template>
													</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo='30' and pe1:Valor != '-' ">
														<xsl:call-template name="TraeValorVariable">
															<xsl:with-param name="varNumVA" select="30"/>
														</xsl:call-template>
													</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo='30' and pe2:Valor != '-' ">
														<xsl:call-template name="TraeValorVariable">
															<xsl:with-param name="varNumVA" select="30"/>
														</xsl:call-template>
													</xsl:if>
									</xsl:for-each>
							</font>	


							
							
							

							<font face="Arial, Helvetica, sans-serif" size="1">
								<br/>Designado AGENTE DE RETENCIÓN, no sujeto a retención del 3% del IGV de acuerdo al inc. B
								de la Res. 033-2014 - SUNAT.<br/>
								</font>
								<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="TraeValorVariable">
												<xsl:with-param name="varNumVA" select="26"/>
											</xsl:call-template>
											</font>
						<!--</xsl:if>-->
						<!--
						<xsl:if test="$varVALOR='02'">
							<font face="Arial, Helvetica, sans-serif" size="0.5">
								<br/>DECLARAMOS BAJO JURAMENTO QUE LOS DATOS CONTENIDOS EN LA PRESENTE FACTURA, SON CIERTOS Y COMPLETOS Y QUE
							ASUMIMOS LAS RESPONSABILIDADES QUE ESTA CONLLEVA.<br/>
							ORIGEN DE MERCADERIA: PERUANA.</font>
						</xsl:if>
						-->
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="imp_timbre">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tr>
				<td width="100%" align="right">
					<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td valign="top" align="center" width="100%">
								<font face="Arial" size="1">
									<img width="100%" height="10%">
										<xsl:attribute name="src">
											<xsl:call-template name="timbre"/>
										</xsl:attribute>
									</img>
								</font>
							</td>
						</tr>
						<tr>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

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