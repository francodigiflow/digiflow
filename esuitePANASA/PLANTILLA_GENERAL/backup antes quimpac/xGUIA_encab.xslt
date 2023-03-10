<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:DespatchAdvice-1" 
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
				<td vAlign="top" width="60%">
					<xsl:call-template name="EncabezadoPeru"/>
				</td>
				<td vAlign="top" width="40%">
					<xsl:if test="//cbc:CustomizationID='1.0'">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</xsl:if>
					<xsl:if test="//cbc:CustomizationID='2.0'">
						<xsl:call-template name="EncabezadoRecuadro20"/>
					</xsl:if>
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
					<td width="100%" align="left" valign="top">
						<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
							<strong><xsl:value-of select="//cbc:Name"/></strong>
						</font>
					</td>
				</tr>
				
				<tr>
					<td width="100%" align="left">
						
						<img src="logo_panasa_secundario.jpg"/>
						
					
					</td>
					
				</tr>
				<tr>
					<td width="100%" align="left">
						<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
							<br/><!--<strong>Planta Paramonga: </strong>-->
							<xsl:call-template name="TraeValorVariable">
								<xsl:with-param name="varNumVA" select="1"/>
							</xsl:call-template> 									
							<br/><strong>Teléfono : </strong>
							<xsl:call-template name="TraeValorVariable">
								<xsl:with-param name="varNumVA" select="2"/>
							</xsl:call-template> 
							&#160;&#160;&#160;
							<strong>Ventas : </strong>
								<xsl:call-template name="TraeValorVariable">
									<xsl:with-param name="varNumVA" select="3"/>
								 </xsl:call-template> 
							 <br/><strong>Email : </strong>
								<xsl:call-template name="TraeValorVariable">
									<xsl:with-param name="varNumVA" select="5"/>
								</xsl:call-template> 
                            <br/><strong>Web : </strong>
								<xsl:call-template name="TraeValorVariable">
									<xsl:with-param name="varNumVA" select="6"/>
								</xsl:call-template> 
                            <br/>
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</p>
</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
	<table cellSpacing="0" cellPadding="5" width="100%" align="center" border="1" style="font-size: 14px; font-family: arial,helvetica,sans-serif; color: #000000;">
				<!--	<table borderColor="#000000" cellSpacing="0" cellPadding="5" width="100%" border="1"> -->
						<tbody>
							<tr>
								<td vAlign="top" width="100%" align="center">
									<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
										<!--<br/>-->
										<strong>R.U.C.: 
											<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
											<xsl:value-of select="format-number(//cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID,'###########','pen')"/>
											<br/>
											<br/>
											<!--<xsl:call-template name="tipodocu"/>-->
											GUIA DE REMISION ELECTRONICA - REMITENTE
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

	<xsl:template name="EncabezadoRecuadro20">
		<!--borderColor="#000000"-->
		<table cellSpacing="0" width="100%" border="1" cellpadding="10" borderColor="#000000"  style="font-family :Arial,Helvetica,sans-serif;font-size:15px;color:#000000">
			<tr>
				<td width="60%" align="center">
						<strong>
							R.U.C. N &#160;&#160;
							<xsl:if test="//cbc:CustomizationID='1.0'">
									<xsl:value-of select="format-number(//cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID, '###########', 'pen')"/>
							</xsl:if>
							<xsl:if test="//cbc:CustomizationID='2.0'">
								<xsl:value-of select="format-number(//cac:SignatoryParty/cac:PartyIdentification/cbc:ID, '###########', 'pen')"/>
							</xsl:if>
							<br/><br/>GUÍA DE REMISIÓN ELECTRÓNICA REMITENTE
							<br/><br/><xsl:call-template name="NFolio"/>
						</strong>
				</td>
				<td width="40%" >
					<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
						<!--<img width="150px" height="150px" align="center" src="data:image/*;base64,[ted_1]" />-->
						<img width="150px" height="150px" align="center">
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
	
		<xsl:if test="pe:DespatchAdvice/cbc:DespatchAdviceTypeCode='09'">
			<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
			GUÍA DE REMISIÓN ELECTRÓNICA REMITENTE
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->