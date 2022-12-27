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
		<table cellSpacing="0" border="0"  style="font-family :Arial,Helvetica,sans-serif;font-size:15px;color:#000000" >
			<!-- <tr> -->
				<!-- <td valign="top" width="30%" align="left"> -->
				
				<!-- </td> -->
				<!-- <td valign="top" width="1%" align="left"> -->
						
				<!-- </td> -->
				<!-- <td valign="top" align="center" width="69%" style="font-family :Arial,Helvetica,sans-serif;font-size:16px;color:#000000"> -->
					<!-- <strong><xsl:value-of select="//cac:DespatchSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>	</strong> -->
				<!-- </td> -->
			<!-- </tr> -->
			<tr>
					<td valign="top" width="30%" align="left">
						<!-- <xsl:if test="//cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID='20604180229'"> -->
							<img src="D:\digiflow\esuiteARDILES\LOGO\Logo_Ardiles_2.PNG" width="300px" height="80px"/>
						<!-- </xsl:if> -->
					</td>				
					<td valign="top" width="1%" align="left">
						
					</td>
					<td valign="top" align="center" width="69%" style="font-family :Arial,Helvetica,sans-serif;font-size:9px;color:#000000">	
							<br/><br/>
							<font size="3">
							<strong><xsl:value-of select="//cac:DespatchSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>	</strong>
							</font>
							&#160;<br/>	<br/>		
							<font size="2"><strong>							
							&#160;MAYORISTAS FERRETEROS
							</strong>
							&#160;<br/>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='01'">
								&#160;<xsl:value-of select="pe:Valor"/>
								</xsl:if>
						    </xsl:for-each>
							<br/><xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='02'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
						    </xsl:for-each>	
							<br/><xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='03'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
						    </xsl:for-each>	
							</font>
					</td>
			</tr>

		</table>
	</xsl:template>
	
	
	<!--<xsl:template name="EncabezadoRecuadro">
		borderColor="#000000"
		<table cellSpacing="0" width="100%" border="1" cellpadding="14" borderColor="#000000"  style="font-family :Arial,Helvetica,sans-serif;font-size:18px;color:#000000">
			<tr>
				<td width="100%" align="center">
						<strong>
							R.U.C. N°&#160;&#160;
							<xsl:value-of select="format-number(//cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID, '###########', 'pen')"/>
							<br/><br/><xsl:call-template name="tipodocu"/>
							<br/><br/><xsl:call-template name="NFolio"/>
						</strong>
				</td>
			</tr>
		</table>
	</xsl:template>-->

	<xsl:template name="EncabezadoRecuadro">
		<!--borderColor="#000000"-->
		<table cellSpacing="0" width="100%" border="1" cellpadding="10" borderColor="#000000"  style="font-family :Arial,Helvetica,sans-serif;font-size:15px;color:#000000">
			<tr>
				<td width="60%" align="center">
						<strong>
							R.U.C. N°&#160;&#160;
							<xsl:value-of select="format-number(//cac:SignatoryParty/cac:PartyIdentification/cbc:ID, '###########', 'pen')"/>
							<br/><br/><xsl:call-template name="tipodocu"/>
							<br/><br/><xsl:call-template name="NFolio"/>
						</strong>
				</td>
				<td><font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
				<img width="150px" height="150px" align="center" src="data:image/*;base64,[ted_1]" />
				</font></td>
			</tr>
		</table>
	</xsl:template>

<xsl:template name="tipodocu">
	
		<xsl:if test="//cbc:DespatchAdviceTypeCode='09'">
			<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
			GUÍA DE REMISIÓN ELECTRÓNICA REMITENTE
			</font>
		</xsl:if>
		
	<!--<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
		GUÃA DE REMISIÃ“N ELECTRÃ“NICA
	</font>-->
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