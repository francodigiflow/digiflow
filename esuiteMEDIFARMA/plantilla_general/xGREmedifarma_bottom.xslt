<?xml version='1.0' encoding="iso-8859-1"?>
<!-- xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" 
				xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" 
				xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" 
				xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" --> 
				
<xsl:stylesheet 
				version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
				xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
				xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">

	<xsl:template name="bottom_normal">
		<table border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					falta
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="bottom_hash">
		<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td valign="baseline" width="100%" align="center">
<!--						<font face="Arial, Helvetica, sans-serif" size="2">Representación impresa del Comprobante de Retención Electrónico
							<br/>Podrá ser consultado en http://www.ecomprobantes.pe/MAF
							<br/>Autorizado mediante Resolución de Intendencia N° 018-005-0002683/SUNAT
							<br/>
							<strong>Valor Resumen :</strong>
							<xsl:value-of select="//ds:DigestValue"/></font>-->
					</td>
					
				</tr>
				<tr>
					<td align="center" width="40%">
					<!-- 	<xsl:call-template name="imp_timbre"/> -->
					</td>
				</tr>
				<!-- tr>
					<td align="center" width="50%">
						<font face="Arial, Helvetica, sans-serif" size="1">
		                     		<br/><strong>Representación impresa de la
		                     		<xsl:call-template name="aviso"/></strong><br/>
									Autorizado mediante la resolución RS N° 374-2013
		                 </font>
					</td>
				</tr -->				
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="imp_timbre">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tr>
				<td width="40%" align="right">
					<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td valign="top" align="center" width="100%" >
							   <!--  <font face="code_39" size="24">
								   <xsl:value-of select="$varCodBarraPers" />
							    </font> -->
								<!-- br/><br/>
								<font face="Arial" size="1">
									<img width="200px" height="80px">
										<xsl:attribute name="src"><xsl:call-template name="timbre"/></xsl:attribute>
									</img>
								</font -->
								<br/>
								<img width="150px" height="150px" align="center" src="data:image/*;base64,[ted_1]" />
								
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>

	<!-- xsl:template name="timbre">
		<xsl:value-of select="pe:Invoice/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
		<xsl:value-of select="'.jpg'"/>
	</xsl:template -->

	<xsl:template name="timbre">
        <xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
        <!-- xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:Documento/pe1:Nombre"/>
        <xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:Documento/pe2:Nombre"/ -->
        <xsl:value-of select="'.jpg'"/>
    </xsl:template>

	<xsl:template name="nombreTed">
		<xsl:param name="text"/>
		<xsl:param name="largo" select="0"/>
		<xsl:variable name="largo_actual" select="string-length($text)"/>
		<xsl:choose>
			<xsl:when test="$largo_actual >= $largo">
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\out\xml\20100018625&#x2D;09&#x2D;T001&#x2D;00000028.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->