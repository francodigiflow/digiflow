<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DatosReceptor">
		<table border="0" width="100%" cellpadding="2" cellspacing="2">
			<tbody>
				<tr>
					<td vAlign="top" width="100%">
						<table border="0" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="2">
							<tbody>
								<tr>
									<td width="13%">
										<font face="Arial, Helvetica, sans-serif" size="2">SEÑOR(ES)</font>
									</td>
									<td width="25%">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
										</font>
									</td>

									<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">FECHA DE EMISIÓN</font>
									</td>
									<td width="26%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
											<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
											<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
													<xsl:value-of select="$v_TipoRucReceptor"/>
												</xsl:when>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
													<xsl:value-of select="$v_TipoRucReceptor"/>
												</xsl:when>
												<xsl:otherwise>MOTIVO</xsl:otherwise>
											</xsl:choose>
											
										</font>
									</td>
									<td width="50%">
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
												<font size="2" face="Arial, Helvetica, sans-serif">:

													<xsl:value-of select="$v_RucReceptor"/>
												</font>
											</xsl:when>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
												<font size="2" face="Arial, Helvetica, sans-serif">:

													<xsl:value-of select="$v_RucReceptor"/>
												</font>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="/pe1:CreditNote">
													<font size="2" face="Arial, Helvetica, sans-serif">: <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></font>
												</xsl:if>
												<xsl:if test="/pe2:DebitNote">
													<font size="2" face="Arial, Helvetica, sans-serif">: <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></font>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td width="13%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">TIPO DE CAMBIO</font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">:

											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='01'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>

											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='01'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='01'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="2">DIRECCIÓN</font>
									</td>
									<td width="88%" colspan="3">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="$v_DirRecep"/>
											
										</font>
									</td>
								</tr>

								<tr>
									<td width="12%">
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03'">
												<font face="Arial, Helvetica, sans-serif" size="2">ANTICIPO RELACIONADO</font>
											</xsl:when>
											<xsl:otherwise>
												<font face="Arial, Helvetica, sans-serif" size="2">COMPROBANTE RELACIONADO</font>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td width="88%" colspan="3">
										<xsl:choose>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
												<font size="2" face="Arial, Helvetica, sans-serif">:

													<xsl:call-template name="ReferenciaDocumento"/>
												</font>
											</xsl:when>
											<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
												<font size="2" face="Arial, Helvetica, sans-serif">

													<xsl:call-template name="ReferenciaDocumento"/>
												</font>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="/pe1:CreditNote">
													<font size="2" face="Arial, Helvetica, sans-serif">:</font>
													<xsl:call-template name="ReferenciaDocumento"/>
												</xsl:if>
												<xsl:if test="/pe2:DebitNote">
													<font size="2" face="Arial, Helvetica, sans-serif">:</font>
													<xsl:call-template name="ReferenciaDocumento"/>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="2">MONEDA</font>
									</td>
									<td width="50%">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
												<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
												<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
												<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
												<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
												<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
												<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
												<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
												<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
												<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="13%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03'">COND. DE PAGO</xsl:when>
												<xsl:otherwise>&#xA0;</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03'">
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='02'">
															:<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='02'">
															:<xsl:value-of select="pe1:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='02'">
															:<xsl:value-of select="pe2:Valor"/>
														</xsl:if>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>&#xA0;</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
								</tr>
								<tr>
									<td width="12%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03'">
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='11' and pe:Valor!='-'">
															PACIENTE
														</xsl:if>
													</xsl:for-each>
													
												</xsl:when>
												<xsl:otherwise>&#xA0;</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="50%">
										<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:choose>
												<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01' or /pe:Invoice/cbc:InvoiceTypeCode='03'">
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='11' and pe:Valor!='-'">
															: <xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													
												</xsl:when>
												<xsl:otherwise>&#xA0;</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="13%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;
										</font>
									</td>
									<td width="25%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="2">
											&#160;
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="ReferenciaDocumento">

		<xsl:for-each select="//cac:DespatchDocumentReference">
			<xsl:if test="cbc:DocumentTypeCode != '10'">

				<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:choose>
						<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
						<xsl:otherwise>Documento NN</xsl:otherwise>
					</xsl:choose>
				</font>


				<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:value-of select="cbc:ID"/>
				</font>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
			<xsl:if test="cbc:DocumentTypeCode != '10'">
				<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:choose>
						<xsl:when test="cbc:DocumentTypeCode='01' and substring(cbc:ID,1,1) = 'F'">FACTURA ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='01' and substring(cbc:ID,1,1) != 'F'">FACTURA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='03' and substring(cbc:ID,1,1) = 'B'">BOLETA DE VENTA ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='03' and substring(cbc:ID,1,1) != 'B'">BOLETA DE VENTA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='07' and substring(cbc:ID,1,1) = 'F'">NOTA DE CREDITO ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='07' and substring(cbc:ID,1,1) = 'B'">NOTA DE CREDITO ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='07' and substring(cbc:ID,1,1) != 'F'">NOTA DE CREDITO</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='07' and substring(cbc:ID,1,1) != 'B'">NOTA DE CREDITO</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='08' and substring(cbc:ID,1,1) = 'F'">NOTA DE DEBITO ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='08' and substring(cbc:ID,1,1) = 'B'">NOTA DE DEBITO ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='08' and substring(cbc:ID,1,1) != 'F'">NOTA DE DEBITO ELECTRONICA</xsl:when>
						<xsl:when test="cbc:DocumentTypeCode='08' and substring(cbc:ID,1,1) != 'B'">NOTA DE DEBITO ELECTRONICA</xsl:when>
						<xsl:otherwise>Documento NN</xsl:otherwise>
					</xsl:choose>
				</font>
			</xsl:if>
		</xsl:for-each>&#xA0;

		<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
			<xsl:if test="cbc:DocumentTypeCode != '10'">

				<xsl:variable name="attribute">
					<xsl:call-template name="RepeatString">
						<xsl:with-param name="string" select="'0'"/>
						<xsl:with-param name="times" select="8-(string-length(substring-after(cbc:ID,'-')))"/>
					</xsl:call-template>
				</xsl:variable>

				<font face="Arial, Helvetica, sans-serif" size="2">
					<xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="concat($attribute,substring-after(cbc:ID,'-'))"/></font>
			</xsl:if>
		</xsl:for-each>&#xA0;

		
	</xsl:template>


	<xsl:template name="RepeatString">
		<xsl:param name="string" select="''"/>
		<xsl:param name="times" select="1"/>

		<xsl:if test="number($times) &gt; 0">
			<xsl:value-of select="$string"/>
			<xsl:call-template name="RepeatString">
				<xsl:with-param name="string" select="$string"/>
				<xsl:with-param name="times" select="$times - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="ReferenciaItem">

		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
							<td width="12%">
								<font face="Arial, Helvetica, sans-serif" size="2"><strong>Referencia</strong></font>
							</td>
							<td width="88%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='03'">
															<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='03'">
															<xsl:value-of select="pe1:Valor"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='03'">
															<xsl:value-of select="pe2:Valor"/>
														</xsl:if>
													</xsl:for-each>
									</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="file:///c:/esuite/out/xml/20254053822&#x2D;01&#x2D;F002&#x2D;00345515.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->