<?xml version="1.0" encoding="iso-8859-1"?>
<!-- xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" 
				xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" 
				xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" 
				xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">



	<xsl:template name="bottom_hash">
		
		<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td>
					<font face="Arial, Helvetica, sans-serif" size="1">
					<p>Para más información le agradecemos revisar nuestra página web: <a href="www.multitop.pe">www.multitop.pe</a></p>
					<br/>
					</font>
					</td>
				</tr>
				<tr>
					<td align="left">
						<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td valign="top" align="left" width="15%">
									<font face="Arial" size="2">
										<!--<img width="100" height="100">
											<xsl:attribute name="src">
												<xsl:call-template name="timbre"/>
											</xsl:attribute>
										</img>-->
										<img width="100" height="100" align="center" src="data:image/*;base64,[ted_1]"/>
									</font>
								</td>
								<td width="35%" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">								
										REPRESENTACIÓN IMPRESA DE LA&#xA0;<xsl:call-template name="aviso"/>
										<br/>PODRA SER CONSULTADO EN: <a href="http://ecomprobantes.multitop.pe">http://ecomprobantes.multitop.pe</a>

							</font>
								</td>
								<td valign="top" width="15%">
									<img width="100" height="100" align="center" src="data:image/*;base64,[logo_2]" />
								</td>
								<td width="35%">
									<font face="Arial, Helvetica, sans-serif" size="1">								
										SUS DATOS PERSONALES Y DE SUS CONTACTOS SON
										<br/>ALMACENADOS PARA LAS OPERACIONES QUE EL PRODUCTO O
										<br/>SERVICIO ADQUIRIDO AMERITEN.
										<br/><br/>
										LEY N° 29733, LEY DE PROTECCIÓN DE DATOS PERSONALES. PUEDE HACER
										<br/>USO DE SUS DERECHOS ARCO A TRAVÉS DE derechoarcoclientes@multitop.pe
										<br/>PARA MÁS INFORMACIÓN: <a href="http://www.multitop.pe/politicas-privacidad/">http://www.multitop.pe/politicas-privacidad/</a>
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="aviso">
		
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Guía Electrónica</font>
			
	</xsl:template>

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
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\out\xml\20100018625-09-T001-00000028.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
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