<?xml version='1.0' encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

   	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

   	<xsl:template name="DatosReceptor">
   	
	</xsl:template>

   	<xsl:template name="DatosReceptor_1">
   		
	</xsl:template>

	<xsl:template name="DescripcionAdicional_2_1">
		<xsl:param name="resto"/>
		<xsl:param name="adicional" select="substring-before($resto,'*')"/>
		<xsl:param name="adicional1" select="substring-after($resto,':')"/>
		<tr>
			<td width="10%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<b><xsl:value-of select="substring-before($adicional,':')"/></b>
				</font>
			</td>
			<td width="2%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<b>:</b>
				</font>
			</td>
			<td width="38%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:value-of select="substring-after($adicional,':')"/>
				</font>
			</td>
		</tr>
		<xsl:variable name="res" select="substring-after($adicional1,'*')"/>
		<xsl:if test="$res!=''">

			<xsl:call-template name="DescripcionAdicional_2_1">
				<xsl:with-param name="resto" select="$res"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="DescripcionAdicional_2_2">
		<xsl:param name="resto"/>
		<xsl:param name="adicional" select="substring-before($resto,'*')"/>
		<xsl:param name="adicional1" select="substring-after($resto,':')"/>
		<tr>
			<td widht="10%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<b><xsl:value-of select="substring-before($adicional,':')"/></b>
				</font>
			</td>
			<td width="2%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<b>:</b>
				</font>
			</td>
			<td width="38" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:value-of select="substring-before($adicional1,'*')"/>
				</font>
			</td>
		</tr>
		<xsl:variable name="res" select="substring-after($adicional1,'*')"/>
		<xsl:if test="$res!=''">

			<xsl:call-template name="DescripcionAdicional_2_2">
				<xsl:with-param name="resto" select="$res"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="Nota1">
   	<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%" height="50">
	<tbody>
	<tr>
	<td width="10%" align="left" valign="top">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo='03'">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<b><xsl:value-of select="substring-before(pe:Valor,'*')"/></b>
						<br/>
						<br/>
						<xsl:call-template name="descripcion">
							<xsl:with-param name="resto" select="substring-after(pe:Valor,'*')"/>
						</xsl:call-template>
					</font>
			</xsl:if>
		</xsl:for-each>
		</td>
		</tr>
		</tbody>
   	</table>
   	
	</xsl:template>

	<xsl:template name="descripcion">
		<xsl:param name="resto"/>	
		 &#160;<xsl:value-of select="substring-before($resto,'*')"/><br/>
		 <xsl:variable name="res" select="substring-after($resto,'*')"/>
		<xsl:if test="$res!=''">
			
			<xsl:call-template name="descripcion">
				<xsl:with-param name="resto" select="$res"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\20520929658&#x2D;03&#x2D;BB13&#x2D;66000074.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->