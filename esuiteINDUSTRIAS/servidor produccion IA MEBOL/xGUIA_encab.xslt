<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi">
<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tbody>
			<tr width="100%">
				<td vAlign="middle" width="70%">
					<xsl:call-template name="EncabezadoPeru"/>
				</td>
				<td vAlign="top" width="30%">
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
							<xsl:if test="//cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID='20293583626'">
									<td width="30%" align="left" valign="middle">
										
										<img width="150" height="130" src="logo_mebol.jpg"/>
										
									</td>
									<td width="70%" align="left" valign="middle">
										<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
											&#xA0; <b><xsl:value-of select="//cac:PartyLegalEntity/cbc:RegistrationName"/></b> <br/>	
										</font>
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<br/>&#xA0; <b>Dirección :</b>AV. EL DERBY NRO. 254 INT. 1703 URB. EL DERBY 
											<br/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;(CRUZE AV EL DERBY CON MANUEL OLGUIN)
											<br/>&#xA0; <b>Telf.:</b> 536-9939
												<br/>
												<br/>&#xA0; Cal. Las Exportaciones 151 Zl. Industrial Pro-San Martin de Porres-Lima-Lima
												<br/>&#xA0; Av.Gerardo Unger 7885 Urb. Pro -San Martin de Porres - Lima-Lima
												<br/>&#xA0; Cal. Los Metales 232 Urb. Pro Industrial 6to Sector - San Martin de Porres-Lima-Lima
                                                <br/>&#xA0; Cal. Los Metales 272 Urb. Pro Industrial 6to Sector - San Martin de Porres-Lima-Lima
                                                <br/>&#xA0; Cal. Los Metales 278 Urb. Pro Industrial 6to Sector - San Martin de Porres-Lima-Lima
                                                <br/>&#xA0; Cal. Los Metales 230 Urb. Pro Industrial 6to Sector - San Martin de Porres-Lima-Lima
												<br/>&#xA0; Cal. Los Metales 252 Urb. Pro Industrial 6to Sector - San Martin de Porres-Lima-Lima
										</font>
									</td>
							</xsl:if>
							<xsl:if test="//cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID='20102154046'">
									<td width="30%" align="left" valign="middle">
										
										<img width="150" height="130" src="logo_industrias.jpg"/>
										
									</td>
									<td width="70%" align="left" valign="middle">
										<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
											&#xA0; <b><xsl:value-of select="//cac:PartyLegalEntity/cbc:RegistrationName"/></b> <br/>	
										</font>
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<br/>&#xA0; <b>Dirección :</b>AV. EL DERBY NRO. 254 INT. 1703 URB. EL DERBY 
											<br/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;LIMA - LIMA - SANTIAGO DE SURCO
											<br/>&#xA0; <b>Telf.:</b>  536-9922 / 536-9933
												<br/>
												<br/>&#xA0; Cal. Los Metales 245 Int. 271 Z.I. Pro Industrial-San Martin de Porres-Lima-Lima
												<br/>&#xA0; Jr. Los Metales 200 Urb. Pro Industrial-San Martin de Porres-Lima-Lima
												<br/>&#xA0; Cal. Las Exportaciones 167 Urb. Pro Industrial-San Martin de Porres-Lima
                                                <br/>&#xA0; Cal. Los Metales 174 Urb. Pro Industrial-San Martin de Porres-Lima-Lima
                                                
										</font>
									</td>
							</xsl:if>
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
	<table borderColor="#000000" cellSpacing="0" cellPadding="16" width="100%" align="center" border="1" style="font-size: 16px; font-family: arial,helvetica,sans-serif; color: #000000;">
				<!--	<table borderColor="#000000" cellSpacing="0" cellPadding="5" width="100%" border="1"> -->
						<tbody>
							<tr>
								<td vAlign="top" width="100%" align="center">
									<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">
										
										<strong>R.U.C.: 
											<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">
											<xsl:value-of select="format-number(//cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID,'###########','pen')"/>
											
											<br/>
											<!--<xsl:call-template name="tipodocu"/>-->
											GUIA DE REMISION ELECTRONICA
											
											<xsl:call-template name="NFolio"/>
											</font>
										</strong>
										
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				
</xsl:template>

<xsl:template name="tipodocu">
	
		<xsl:if test="pe:DespatchAdvice/cbc:DespatchAdviceTypeCode='09'">
			<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
			GUÍA DE REMISIÓN ELECTRÓNICA
			</font>
		</xsl:if>
		
	<!--<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
		GUÍA DE REMISIÓN ELECTRÓNICA
	</font>-->
</xsl:template>

<xsl:template name="NFolio">
	<br/>Nº 
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20293583626_2017090409T0R100007821.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->