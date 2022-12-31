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
					<td vAlign="top" width="65%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="top" width="35%">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
						
					
	<xsl:template name="EncabezadoPeru">
		<table cellSpacing="0" border="0"  style="font-family :Arial,Helvetica,sans-serif;font-size:15px;color:#000000" width="100%">
			<tr>
				<td valign="top" width="50%" align="left">
					<img src="Logo_Novopan.png" WIDTH="300" HEIGHT="89"/>
				</td>				
			</tr>
			<tr>
				<td valign="top" align="center" width="100%" style="font-family :Arial,Helvetica,sans-serif;font-size:9px;color:#000000">	
						<font size="1" >
						<strong><xsl:value-of select="//cac:DespatchSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>	</strong>
						</font>
						<br/>
						<font size="1">
							&#160;Av. Eucaliptos Int. D2b Lote. 3 Urb Santa Genoveva (Alt. Km.40 Antigua Panamericana Sur) - Lurin - Lima - Lima<br/>
							&#160;E-Mail: atencionalcliente@novopan.com.pe<br/>
							&#160;Telefonos: 660-0000
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
				<td width="40%" align="center">
					<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
					<!--<img width="100px" height="100px" align="center" src="data:image/*;base64,[ted_1]" />-->
						<img width="150px" height="150px">
                            <xsl:attribute name="src">
                                <xsl:call-template name="timbre"/>
                            </xsl:attribute>
                        </img>
					</font>
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->