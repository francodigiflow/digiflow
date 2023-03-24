<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">
<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="1" width="100%" border="0"  >
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="10%">
							<!--<img width="100px" height="100px" align="center" src="data:image/*;base64,[ted_1]" />-->
							<img width="150px" height="150px">
	                            <xsl:attribute name="src">
	                                <xsl:call-template name="timbre"/>
	                            </xsl:attribute>
	                        </img>
					</td>
					<td vAlign="top" width="65%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="top" width="25%">
						<xsl:call-template name="EncabezadoRecuadro"/>
						
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
						
					
	<xsl:template name="EncabezadoPeru">
		<table cellSpacing="0" border="0"  style="font-family :Arial,Helvetica,sans-serif;font-size:15px;color:#000000" width="100%">
			<tr>
				<td valign="top" width="50%" align="center">
					<img src="Logo_Novopan.png" WIDTH="300" HEIGHT="89"/>
				</td>				
			</tr>
			<tr>
				<td valign="top" align="left" width="100%" style="font-family :Arial,Helvetica,sans-serif;font-size:9px;color:#000000">	
					<font face="Arial, Helvetica, sans-serif" size="1">
						&#160;Av. Eucaliptos Int. D2b Lote. 3 Urb Santa Genoveva (Alt. Km.40 Antigua Panamericana Sur) - Lurin - Lima - Lima<br/>
						<xsl:call-template name="RetourneValAd">
							<xsl:with-param name="NumAd" select="01"/>
						</xsl:call-template>
						<br/>
						<strong>Fecha de emisión :</strong><xsl:value-of select="//cbc:IssueDate"/>
										
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template name="EncabezadoRecuadro">
		<table cellSpacing="0" width="100%" border="1" cellpadding="10" borderColor="#000000"  style="font-family :Arial,Helvetica,sans-serif;font-size:14px;color:#000000">
			<tr>
				
				<td width="60%" align="center">
						<strong>
							R.U.C. N°&#160;
							<xsl:value-of select="format-number(//cac:SignatoryParty/cac:PartyIdentification/cbc:ID, '###########', 'pen')"/>
							<br/><br/><xsl:call-template name="tipodocu"/>
							<br/><br/><xsl:call-template name="NFolio"/>
						</strong>
				</td>
			</tr>
		</table>
	</xsl:template>

<xsl:template name="tipodocu">
			GUÍA DE REMISIÓN ELECTRÓNICA REMITENTE
</xsl:template>

<xsl:template name="NFolio">
	Nº 
	<xsl:value-of select="substring-before(//cbc:ID,'-')"/>- 
	<xsl:value-of select="format-number(substring-after(//cbc:ID,'-'),'00000000')"/>
</xsl:template>

<xsl:template match="/">
	<html><head></head>
		<body/>
	</html>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\PLANTILLA_GENERAL" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->