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
						<td width="100%" align="center">
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tbody>
									<tr>
										<td vAlign="top" align="left">
											<!-- <img src="LOGOBELLTECH.png" width="364" height="110"/> -->
											<img src="data:image/*;base64,[logo_1]" width="364" height="110" />
										</td>
									</tr>
										<tr align="left">
										<td>
											<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											    BELLTECH PERU S.A.C.<br/>
												Av. EL DERBY N°055 OFICINA 1007 - 1008 TORRE 3 EDIF CRONOS<br/>
												URB POLO AND HUNT CLUB - SANTIAGO DE SURCO<br/>
												TELEFONO (511)611-2600<br/>
												FAX (511) 611-2601<br/>
												LIMA-PERU<br/>
											</font>
											</td>
										</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>&#xA0;</td>
					</tr>
				</tbody>
			</table>
		</p>
	</xsl:template>
	
	
	<xsl:template name="EncabezadoRecuadro">
		<!--borderColor="#000000"-->
		<table cellSpacing="0" width="100%" border="1" cellpadding="14" borderColor="#000000"  style="font-family :Arial,Helvetica,sans-serif;font-size:18px;color:#000000">
			<tr>
				<td width="100%" align="center">
						<strong>
							R.U.C. N°&#160;&#160;
							<xsl:if test="//cbc:CustomizationID='1.0'">
													<xsl:value-of select="format-number(//cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID, '###########', 'pen')"/>
							</xsl:if>
							<xsl:if test="//cbc:CustomizationID='2.0'">
								<xsl:value-of select="format-number(//cac:SignatoryParty/cac:PartyIdentification/cbc:ID, '###########', 'pen')"/>
							</xsl:if>
							<br/><br/><xsl:call-template name="tipodocu"/>
							<br/><br/><xsl:call-template name="NFolio"/>
						</strong>
				</td>
			</tr>
		</table>
	</xsl:template>

<xsl:template name="EncabezadoRecuadro20">
		<table cellSpacing="0" width="100%" border="1" cellpadding="10" borderColor="#000000"  style="font-family Arial,Helvetica,sans-serif;font-size:15px;color:#000000">
			<tr>
				<td width="60%" align="center">
					<strong>
						R.U.C. N°&#160;&#160;
						<xsl:if test="//cbc:CustomizationID='1.0'">
							<xsl:value-of select="format-number(//cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID, '###########', 'pen')"/>
						</xsl:if>
						<xsl:if test="//cbc:CustomizationID='2.0'">
							<xsl:value-of select="format-number(//cac:SignatoryParty/cac:PartyIdentification/cbc:ID, '###########', 'pen')"/>
						</xsl:if>
						<br/><br/><xsl:call-template name="tipodocu"/>
						<br/><br/><xsl:call-template name="NFolio"/>
					</strong>
				</td>
				<td>
					<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
						<!-- <img width="150px" height="150px" align="center" src="data:image/*;base64,[ted_1]" /> -->
						<img width="150px" height="150px" align="center" >
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
	
		<xsl:if test="//cbc:DespatchAdviceTypeCode='09'">
			<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
			GUÍA DE REMISIÓN ELECTRÓNICA
			</font>
		</xsl:if>
		
	<!--<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
		GUÃA DE REMISIÃ“N ELECTRÃ“NICA
	</font>-->
</xsl:template>

<xsl:template name="timbre">		
		<xsl:value-of select="pe:Invoice/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
		<xsl:value-of select="'.jpg'"/>
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20131376503&#x2D;09&#x2D;TZ03&#x2D;00000357.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->