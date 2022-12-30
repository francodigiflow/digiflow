<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:template name="bottom_Volcan">
		<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td valign="top" width="52%" align="center">
						<!--DATOS-->
						<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" rules="none">
							<tbody>
								<tr>
								
									<td width="52%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='06'">
													<xsl:if test="pe:Valor !='-'">
														<xsl:value-of select="pe:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='06'">
													<xsl:if test="pe1:Valor !='-'">
														<xsl:value-of select="pe1:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='06'">
													<xsl:if test="pe2:Valor !='-'">
														<xsl:value-of select="pe2:Valor"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
								<td>
								
								</td>
								</tr>
								<tr>
									<td width="52%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='07'">
													<xsl:if test="pe:Valor !='-'">
														<xsl:value-of select="substring-before(pe:Valor,'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='07'">
													<xsl:if test="pe1:Valor !='-'">
														<xsl:value-of select="substring-before(pe1:Valor,'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='07'">
													<xsl:if test="pe2:Valor !='-'">
														<xsl:value-of select="substring-before(pe2:Valor,'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>

									<td width="52%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='07'">
													<xsl:if test="pe:Valor !='-'">
														<xsl:value-of select="substring-after(pe:Valor,'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='07'">
													<xsl:if test="pe1:Valor !='-'">
														<xsl:value-of select="substring-after(pe1:Valor,'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='07'">
													<xsl:if test="pe2:Valor !='-'">
														<xsl:value-of select="substring-after(pe2:Valor,'|')"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>

									<td width="52%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:variable name="ADIC8">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='08'">
														<xsl:if test="pe:Valor !='-'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo='08'">
														<xsl:if test="pe1:Valor !='-'">
															<xsl:value-of select="pe1:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo='08'">
														<xsl:if test="pe2:Valor !='-'">
															<xsl:value-of select="pe2:Valor"/>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>

											<xsl:variable name="ADIC10">
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													<xsl:if test="pe:Codigo='10'">
														<b>
															<xsl:value-of select="pe:Valor"/>
														</b>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													<xsl:if test="pe1:Codigo='10'">
														<b>
															<xsl:value-of select="pe1:Valor"/>
														</b>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													<xsl:if test="pe2:Codigo='10'">
														<b>
															<xsl:value-of select="pe2:Valor"/>
														</b>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>

											<!-- <xsl:choose>
												<xsl:when test="//cbc:Note[@languageLocaleID='1002']">TRANSFERENCIA GRATUITA
													<br/>
												</xsl:when> 
																			
												<xsl:otherwise>
													<xsl:value-of select=""/>
												</xsl:otherwise>
											</xsl:choose> -->

											<xsl:choose>
												<xsl:when test="$ADIC8!=''">
													<xsl:value-of select="$ADIC8"/>
												</xsl:when>

												<xsl:otherwise>
													<!-- <xsl:value-of select="$ADIC10"/> -->
												</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<!--FIN DATOS-->
					</td>
					<td valign="top" width="1%" align="center"/>
					<td valign="top" width="47%" align="center">
						<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td valign="baseline" width="50%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">Representación impresa de la <xsl:call-template name="aviso"/>
										<br/>Podrá ser consultada en http://comprobantescew.com
										<br/>Autorizado mediante resolución: N°300-2014-SUNAT
										<br/>
									</font>
								</td>
							</tr>
							<tr>
								<td align="center">
									<xsl:call-template name="imp_timbre"/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="imp_timbre">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tr>
				<td width="40%" align="right">
					<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td valign="top" align="center">
								<font face="Arial" size="1">
									<img>
										<xsl:attribute name="src">
											<xsl:call-template name="timbre"/>
										</xsl:attribute>
									</img>
								</font>
							</td>
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


	<xsl:template name="DescripcionAdicional_BottomVolcan">
		<xsl:param name="resto"/>
		<xsl:variable name="adicional" select="substring-before($resto,'|')"/>
		<xsl:variable name="adicional1" select="substring-after($resto,':')"/>
		<tr>
			<td width="65%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<b>
						<xsl:value-of select="substring-before($adicional,':')"/>
					</b>
				</font>
			</td>

			<td width="35%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">

					<xsl:value-of select="substring-after($adicional,':')"/>
				</font>
			</td>
		</tr>
		<xsl:variable name="res" select="substring-after($adicional1,'|')"/>
		<xsl:if test="$res!=''">

			<xsl:call-template name="DescripcionAdicional_BottomVolcan">
				<xsl:with-param name="resto" select="$res"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="aviso">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Factura Electrónica</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Boleta de Venta Electrónica</font>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de Crédito Electrónica</font>
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de Débito Electrónica</font>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->