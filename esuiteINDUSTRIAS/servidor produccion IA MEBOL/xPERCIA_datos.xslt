<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">

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
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Señor(es)</strong>
										</font>
									</td>
									<td width="87%">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationName "/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="13%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:call-template name="tipoDocumentoIdentidad"/>
										</font>
									</td>
									<td width="87%">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cac:ReceiverParty/cac:PartyIdentification/cbc:ID"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="13%">
										<font face="Arial, Helvetica, sans-serif" size="2"><strong>Dirección</strong></font>
									</td>
									<td width="87%">
										<font face="Arial, Helvetica, sans-serif" size="2">:
										<xsl:value-of select="//cac:ReceiverParty/cac:PostalAddress/cbc:StreetName"/> 
										 <strong>-</strong> 
										<xsl:value-of select="//cac:ReceiverParty/cac:PostalAddress/cbc:CityName"/> 
										 <strong>-</strong> 
										<xsl:value-of select="//cac:ReceiverParty/cac:PostalAddress/cbc:CountrySubentity"/>
										 <strong>-</strong> 
										<xsl:value-of select="//cac:ReceiverParty/cac:PostalAddress/cbc:District"/> 
										</font>
									</td>
								</tr>
								<tr>
									<td width="13%">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<strong>Fecha Emisión</strong>
										</font>
									</td>
									<td width="87%" colspan="3">
										<font face="Arial, Helvetica, sans-serif" size="2">:
											<xsl:value-of select="//cbc:IssueDate"/>
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
		</xsl:for-each>

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
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="RepeatString">
		<xsl:param name="string" select="''"/>
		<xsl:param name="times" select="1"/>

		<xsl:if test="number($times) > 0">
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
					<!--<table cellSpacing="0" cellPadding="2" width="100%" border="1" bordercolor="#000000" rules="cols">-->
					<!--<table align="center" rules="cols" border="1" width="20%" bordercolor="#000000" cellpadding="5" cellspacing="1">-->

						<!--<tr>
							<td width="20%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>RÉGIMEN PERCEPCIÓN</strong>
								</font>
							</td>
							<td width="80%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:call-template name="regimenPercepcion"/>
								</font>
							</td>
						</tr>-->
						<!--<tr>
							<td width="20%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>TASA PERCEPCIÓN</strong>
								</font>
							</td>
							<td width="80%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="//sac:SUNATPerceptionPercent"/>
								</font>
							</td>
						</tr>-->
						<!--<tr> -->
							<!--<td width="20%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>TOTAL COBRADO DE CPE</strong>
								</font>
							</td>
							<td width="80%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									
										<xsl:value-of select="format-number(//sac:SUNATTotalCashed,'###,###,##0.00','pen')"/>
								</font>
							</td>-->
						<!--</tr>-->
						<!--<tr>-->
							<!--<td width="20%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>TOTAL PERCIBIDO DE CPE</strong>
								</font>
							</td>
							<td width="80%">
								<font face="Arial, Helvetica, sans-serif" size="2">
									
										<xsl:value-of select="format-number(//cbc:TotalInvoiceAmount,'###,###,##0.00','pen')"/>
								</font>
							</td>-->
						<!--</tr>-->
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="tipoDocumentoIdentidad">
		<xsl:choose>
			<xsl:when test="//cac:ReceiverParty/cac:PartyIdentification/cbc:ID/@schemeID='0'">NO DOMICILIADO</xsl:when>
			<xsl:when test="//cac:ReceiverParty/cac:PartyIdentification/cbc:ID/@schemeID='1'">D.N.I.</xsl:when>
			<xsl:when test="//cac:ReceiverParty/cac:PartyIdentification/cbc:ID/@schemeID='4'">CARNET DE EXTRANJERIA</xsl:when>
			<xsl:when test="//cac:ReceiverParty/cac:PartyIdentification/cbc:ID/@schemeID='6'">
				<strong>R.U.C.</strong>
			</xsl:when>
			<xsl:when test="//cac:ReceiverParty/cac:PartyIdentification/cbc:ID/@schemeID='7'">PASAPORTE</xsl:when>
			<xsl:when test="//cac:ReceiverParty/cac:PartyIdentification/cbc:ID/@schemeID='A'">CED. DIPLOMATICA</xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="regimenPercepcion">
	<xsl:choose>
		<xsl:when test="//sac:SUNATPerceptionSystemCode='01'">PERCEPCIÓN VENTA INTERNA</xsl:when>
		<xsl:when test="//sac:SUNATPerceptionSystemCode='02'">PERCEPCIÓN A LA ADQUISICIÓN DE COMBUSTIBLE</xsl:when>
		<xsl:when test="//sac:SUNATPerceptionSystemCode='03'">PERCEPCIÓN REALIZADA AL AGENTE DE PERCEPCION CON TASA ESPECIAL</xsl:when>
		<xsl:otherwise/>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="Ejemplo_percepcion_final.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->