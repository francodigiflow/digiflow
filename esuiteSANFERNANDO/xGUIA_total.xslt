<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>


<xsl:template name="CuadroConformidad">

	<table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
						<td width="80%">
						<table rules="groups" border="1" width="100%" cellpadding="60" cellspacing="40" bordercolor="#000001">
							<tbody>
								<tr>
									<td width="50%" align="CENTER">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<!--<br/><br/><br/><br/>-->
										<!--<p>


</p>-->
										________________________________________________
										<!--<br/><br/>-->
										<!--<p>

										</p>-->
										<strong>Conformidad del Almacen</strong>
										</font><!--<br/><br/>-->
									</td>
									<td width="50%" align="CENTER">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<!--<br/><br/><br/><br/>-->
										<!--<p>


</p>-->
										________________________________________________
										<!--<br/><br/>-->
										<!--<p>

										</p>-->
										<strong>Conformidad del Cliente</strong>
										</font><!--<br/><br/>-->
									</td>
								</tr>
							</tbody>
						</table>
						</td>
					</tr>
				</tbody>
			</table>
	</xsl:template>

	<xsl:template name="Simbolo_Moneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/.</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822-01-FF11-10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son-pesos"><block path="table/td/font/xsl:for-each" x="410" y="60"/><block path="table/td/font/xsl:for-each/xsl:if/=[0]" x="314" y="88"/><block path="table/td/font/xsl:for-each/xsl:if" x="360" y="90"/><block path="table/td/font/xsl:for-each[1]" x="300" y="30"/><block path="table/td/font/xsl:for-each[1]/xsl:if/=[0]" x="204" y="58"/><block path="table/td/font/xsl:for-each[1]/xsl:if" x="250" y="60"/><block path="table/td/font/xsl:for-each[1]/xsl:if/xsl:value-of" x="320" y="90"/><block path="table/td/font/xsl:for-each[2]" x="340" y="30"/><block path="table/td/font/xsl:for-each[2]/xsl:if/=[0]" x="84" y="58"/><block path="table/td/font/xsl:for-each[2]/xsl:if" x="130" y="60"/><block path="table/td/font/xsl:for-each[2]/xsl:if/xsl:value-of" x="200" y="90"/></template><template name="Total"></template><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->