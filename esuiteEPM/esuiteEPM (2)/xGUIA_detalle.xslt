<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:variable name="numitems">
		<xsl:value-of select="count(//cac:DespatchLine)"/>
	</xsl:variable>
	<xsl:template name="DetalleMultipagina">
		<xsl:param name="v_ItemPorPagina"/>
		<xsl:param name="v_Contador"/>
		<!-- nOR DE PAG -->
		<xsl:call-template name="DetallesEncabezadoMultipagina">
			<xsl:with-param name="v_ItemPorPagina" select="$v_ItemPorPagina1"/>
			<xsl:with-param name="v_Contador" select="$v_Contador"/>
			<!--nRO DE PAG -->
		</xsl:call-template>
	</xsl:template>
	

	<xsl:template name="DetallesEncabezado">

		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Remitimos a Usted en perfectas condiciones lo siguiente:</strong>
					</font>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
							<!-- ITEM. -->
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<!-- CANT. -->
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<!-- U.M. -->
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>U.M.</strong>
								</font>
							</td>
							<!-- PESO -->
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PESO</strong>
								</font>
							</td>
							<!-- UMP -->
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UMP</strong>
								</font>
							</td>
							<!-- DESCRIP. -->
							<td width="42%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<!-- BULTOS -->
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PEDIDO</strong>
								</font>
							</td>
							<!-- BULTOS -->
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>GUÍA</strong>
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
								<!-- ITEM. -->
								<td width="4%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<!-- CANT. -->
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:DeliveredQuantity"/>
									</font>
								</td>
								<!-- U.M. -->
								<td width="4%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!-- xsl:value-of select="$varUM"/ -->
										<xsl:call-template name="tmpUnidadMedida"/>
									</font>
								</td>
								<!-- PESO -->
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="1" />
										</xsl:call-template>	
									</font>
								</td>
								<!-- PESO -->
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="2" />
										</xsl:call-template>	
									</font>
								</td>
								<!-- DESCRIP. -->
								<td width="42%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<!-- BULTOS -->
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="3" />
										</xsl:call-template>	
									</font>
								</td>
								<!-- GUIA -->
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="4" />
										</xsl:call-template>	
									</font>
								</td>
							</tr>
						</xsl:for-each>


						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="DetallesEncabezadoMultipagina">
		<xsl:param name="titems"/>
		<xsl:param name="tpaginas"/>
		<xsl:param name="pagina"/>
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>Remitimos a Usted en perfectas condiciones lo siguiente:</strong>
					</font>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
							<!-- ITEM. -->
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							
							<!-- DESCRIP. -->
							<td width="60%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<!-- CANT. -->
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<!-- U.M. -->
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>U.M.</strong>
								</font>
							</td>
							
							<!-- UMP -->
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CÓDIGO</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<xsl:variable name="min">
				<xsl:choose>
					<xsl:when test="$pagina = '1'">0</xsl:when>
					<xsl:when test="$pagina = '2'">20</xsl:when>
					<xsl:when test="$pagina = '3'">40</xsl:when>
					<xsl:when test="$pagina = '4'">60</xsl:when>
					<xsl:when test="$pagina = '5'">80</xsl:when>
					<xsl:when test="$pagina = '6'">100</xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="max">
				<xsl:choose>					
					<xsl:when test="$pagina = '1'">21</xsl:when>
					<xsl:when test="$pagina = '2'">41</xsl:when>
					<xsl:when test="$pagina = '3'">61</xsl:when>
					<xsl:when test="$pagina = '4'">81</xsl:when>
					<xsl:when test="$pagina = '5'">101</xsl:when>
					<xsl:when test="$pagina = '6'">121</xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt; $min and cbc:ID &lt; $max ">
							<tr>
								<!-- ITEM. -->
								<td width="4%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								
								<!-- DESCRIP. -->
								<td width="60%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<!-- CANT. -->
								<td width="12%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cbc:DeliveredQuantity"/>
									</font>
								</td>
								<!-- U.M. -->
								<td width="12%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!-- xsl:value-of select="$varUM"/ -->
										<xsl:call-template name="tmpUnidadMedida"/>
										<!--<xsl:value-of select="cbc:DeliveredQuantity/@unitCode"/>-->
											
									</font>
								</td>
								
								<!-- PESO -->
								<td width="12%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:call-template name="tmpDatosAdicionalesDetalle">
											<xsl:with-param name="item" select="cbc:ID" />
											<xsl:with-param name="adicional" select="2" />
										</xsl:call-template>	-->
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								
							</tr>
						</xsl:if>
						</xsl:for-each>


						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr>
				<!-- CANT. -->
				<td width="4%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.1">
					</font>
				</td>
				
				<!-- DESCRIP.-->
				<td width="60%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.1">
					</font>
				</td>
				<!-- CANT. -->
				<td width="12%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.1">
					</font>
				</td>
				<!-- CANT. -->
				<td width="12%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.1">
					</font>
				</td>
				
				<!-- U.M. -->
				<td width="12%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.1">
					</font>
				</td>
				
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>


	


	<xsl:template name="tmpDocumentosReferencias">

		<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
			<tr>
				<td width="20%" align="LEFT">
					<font face="Arial, Helvetica, sans-serif" size="0.1">
						<strong>DOCUMENTOS DE REFERENCIA:</strong>
					</font>
				</td>

				<td width="80%" align="left" colspan="3">
					<font face="Arial, Helvetica, sans-serif" size="0.1">
						<!-- xsl:choose>
										<xsl:when test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='01'">FACT </xsl:when>
										<xsl:when test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='03'">BV </xsl:when>
										<xsl:when test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='07'">NC </xsl:when>
										<xsl:when test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='08'">ND </xsl:when>
										<xsl:when test="//cac:AdditionalDocumentReference/cbc:DocumentTypeCode='06'">OTROS </xsl:when>
										<xsl:otherwise>-</xsl:otherwise>
									</xsl:choose>
                                   <xsl:value-of select="//cac:AdditionalDocumentReference/cbc:ID"/ -->

						<!-- MUESTRO LA SECCION REFERENCIAS  -->
						<!-- xsl:if test="string-length(concat($varDocRef1 , $varDocRef2))>2">
									<tr>
										<td valign="top" width="100%" align="left" -->
						<!-- xsl:call-template name="tmpDocReferencia"/ -->
						<xsl:value-of select="normalize-space(concat(concat(normalize-space($varDocRef1), ' '), $varDocRef2))"/>
						<!-- /td>
									</tr>
									<tr><td>&#xA0;</td></tr >
									</xsl:if -->
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="tmpDatosAdicionalesDetalle">
		<xsl:param name="item"/>
		<xsl:param name="adicional"/>
		<xsl:for-each select="//pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($item, $adicional)">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="">
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->