<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi">
<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tbody>
			<tr width="100%">
				<td vAlign="top" width="60%">
					<xsl:call-template name="EncabezadoPeru"/>
				</td>
				<td vAlign="top" width="40%">
					<xsl:call-template name="EncabezadoRecuadro"/>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

	<xsl:template name="EncabezadoPeru">
	<p>
		<table cellSpacing="2" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td width="100%" align="center">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td vAlign="top" align="center" rowspan="2" width="22%">
										<!--<img src="logo_mebol.jpg" width="115" height="155"/>-->
										<img src="data:image/*;base64,[logo_1]" width="115" height="155" />
									</td>
									<td align="left" width="78%">
										<b>
										<font color="#000000" size="6" face="Arial, Helvetica, sans-serif">
											MEBOL
										</font>
										<font color="#000000" size="3.5" face="Arial, Helvetica, sans-serif">
											S.A.C.
										</font></b>
										<br/>
										<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
											<xsl:variable name="ValorDate">
													<xsl:call-template name="Fecha"/>
												</xsl:variable>
												<!--HACIA ADELANTE-->
												<xsl:if test="$ValorDate &gt;'20170918'">Av. El Derby N° 254, Interior 1703 Urb. El Derby- SANTIAGO DE SURCO - LIMA - LIMA</xsl:if>
												<!--FECHAS ANTIGUAS-->
												<xsl:if test="$ValorDate &lt;= '20170918'">Cal. Los Metales  N° 245 Urb. Pro Industrial San Martin de Porres - Lima - Lima</xsl:if>
										</font>
										<br/>
										<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
										Telf: 536-9939
										</font>
									</td>
								</tr>
								<tr>
									<td>
									<br/>
									</td>
								</tr>
							</tbody>
						</table>

					</td>
				</tr>
				<tr>
					<td>  </td>
				</tr>
			</tbody>
		</table>
	</p>
</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
	<table borderColor="#000000" cellSpacing="0" cellPadding="16" width="100%" align="center" border="1" style="font-size: 18px; font-family: arial,helvetica,sans-serif; color: #000000;">
				<!--	<table borderColor="#000000" cellSpacing="0" cellPadding="5" width="100%" border="1"> -->
						<tbody>
							<tr>
								<td vAlign="top" width="100%" align="center">
									<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">
										
										<strong>R.U.C.: 
											<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">
											<xsl:value-of select="format-number(//cac:AgentParty/cac:PartyIdentification/cbc:ID,'###########','pen')"/>
											<br/>
											<br/>
											<xsl:call-template name="tipodocu"/>
											<br/>
											<xsl:call-template name="NFolio"/>
											</font>
										</strong>
										<br/>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				
</xsl:template>

<xsl:template name="tipodocu">
	<!--<xsl:choose>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
			<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">FACTURA ELECTRONICA</font>
		</xsl:when>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRONICA</font></xsl:when>
		<xsl:otherwise>
			
		</xsl:otherwise>
	</xsl:choose>-->
	<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
		COMPROBANTE DE RETENCIÓN ELECTRÓNICO
	</font>
</xsl:template>

<xsl:template name="NFolio">
	<br/>Nº 
	
	<!--<xsl:value-of select="pe:Retention/cbc:ID"/>-->

<xsl:if test="/pe:Retention">
		<xsl:value-of select="substring-before(/pe:Retention/cbc:ID,'-')"/>- 
		<xsl:value-of select="format-number(substring-after(/pe:Retention/cbc:ID,'-'),'00000000')"/>
	</xsl:if>

</xsl:template>
<xsl:template name="Fecha">
    <xsl:if test="/pe:Retention">
        <xsl:variable name="date1" select="substring-before(/pe:Retention/cbc:IssueDate,'-')"/>
        <xsl:variable name="date2" select="substring-before(substring-after(/pe:Retention/cbc:IssueDate,'-'),'-')"/>
        <xsl:variable name="date3" select="substring-after(substring-after(/pe:Retention/cbc:IssueDate,'-'),'-')"/>
        <xsl:value-of select="concat($date1,$date2,$date3)"/>
    </xsl:if>
   
</xsl:template>

<xsl:template match="/">
	<html><head></head>
		<body/>
	</html>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->