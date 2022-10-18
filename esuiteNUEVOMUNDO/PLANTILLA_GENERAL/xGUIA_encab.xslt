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
					<td width="65%" align="center">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td vAlign="top" align="left" width="10%">
										<!-- <img src="LogoIberostar.PNG" width="279" height="155"/> -->
										<img src="data:image/*;base64,[logo_1]" height="80" width="200" />
									</td>
									<td align="center" valign="top" Width="90%">
										<strong>
											<font face="Times New Roman, sans-serif" size="4">
												<xsl:value-of select="//cac:DespatchSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											</font>
										</strong>
										<font face="Calibri, sans-serif" size="2">  
											<br/><xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<br/>LIMA - LIMA - LIMA 
											<br/>Teléfono: (01) 415-4000 
											<br/>www.nuevomundosa.com
											<br/><br/>
										</font>
									</td>
									<!-- <td colspan="2" width="100%">
								
									<xsl:call-template name="DatosReceptor_FB"/>
									
									</td> -->
								</tr> 
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</p>
	</xsl:template>
	
	<xsl:template name="EncabezadoRecuadro">
		<table cellSpacing="0" width="100%" align="center" border="1" cellpadding="16" borderColor="#000000">
				<tr>
					<td width="100%" align="center">
						<br/>
						<strong>
							<font face="Arial, Helvetica, sans-serif" size="4">
							R.U.C. N°
							<xsl:value-of select="format-number(//cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID, '###########', 'pen')"/>
							<br/>
							<br/>
							<xsl:call-template name="tipodocu"/>
							<br/>
							<br/>
							<xsl:call-template name="NFolio"/>
							</font>
						</strong>
						<br/>
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
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->