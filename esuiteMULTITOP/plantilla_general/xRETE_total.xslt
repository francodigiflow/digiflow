<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Total">

<tr>
				<td>
					<table rules="cols" border="0" width="100%" cellpadding="2" cellspacing="0">
						<tr>
							<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="20%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="15%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="15%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="15%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
							<td width="15%" align="right" >
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>TOTAL S/</strong>
								</font>
							</td>
							<td width="15%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number(//cbc:TotalInvoiceAmount,'###,###,##0.00','pen')"/>
								</font>
							</td>
							
						</tr>
					</table>
				</td>
			</tr>
	</xsl:template>

	
	

	<xsl:template name="Monto_Letras">
		<br/>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td align="left" width="100%">
						<!--<font face="Arial, Helvetica, sans-serif" size="1"> -->
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
							<strong>SON: </strong>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='03'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
						<!--</font> -->
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
	</xsl:template>
	<xsl:template name="Simbolo_Moneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/.</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/.</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/.</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\Panasonic\Formato_PanasonicV1.1\20100165849-01-F301-00000280.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator="">
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bGenerateByteCode" value="true"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="sInitialMode" value=""/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="20254053822-01-FF11-10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template name="son-pesos">
				<block path="table/td/font/xsl:for-each" x="410" y="60"/>
				<block path="table/td/font/xsl:for-each/xsl:if/=[0]" x="314" y="88"/>
				<block path="table/td/font/xsl:for-each/xsl:if" x="360" y="90"/>
				<block path="table/td/font/xsl:for-each[1]" x="300" y="30"/>
				<block path="table/td/font/xsl:for-each[1]/xsl:if/=[0]" x="204" y="58"/>
				<block path="table/td/font/xsl:for-each[1]/xsl:if" x="250" y="60"/>
				<block path="table/td/font/xsl:for-each[1]/xsl:if/xsl:value-of" x="320" y="90"/>
				<block path="table/td/font/xsl:for-each[2]" x="340" y="30"/>
				<block path="table/td/font/xsl:for-each[2]/xsl:if/=[0]" x="84" y="58"/>
				<block path="table/td/font/xsl:for-each[2]/xsl:if" x="130" y="60"/>
				<block path="table/td/font/xsl:for-each[2]/xsl:if/xsl:value-of" x="200" y="90"/>
			</template>
			<template name="Total">
				<block path="table/tr/td[1]/font/xsl:for-each" x="340" y="27"/>
				<block path="table/tr/td[1]/font/xsl:for-each/xsl:if/=[0]" x="44" y="55"/>
				<block path="table/tr/td[1]/font/xsl:for-each/xsl:if" x="90" y="57"/>
				<block path="table/tr/td[1]/font/xsl:for-each/xsl:if/xsl:value-of" x="160" y="87"/>
				<block path="table/tr[1]/td[1]/font/xsl:for-each" x="260" y="27"/>
				<block path="table/tr[1]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="364" y="15"/>
				<block path="table/tr[1]/td[1]/font/xsl:for-each/xsl:if" x="410" y="17"/>
				<block path="table/tr[1]/td[1]/font/xsl:for-each/xsl:if/xsl:value-of" x="40" y="87"/>
				<block path="table/tr[2]/td[1]/font/xsl:for-each" x="20" y="27"/>
				<block path="table/tr[2]/td[1]/font/xsl:for-each/xsl:if/=[0]" x="84" y="15"/>
				<block path="table/tr[2]/td[1]/font/xsl:for-each/xsl:if" x="130" y="17"/>
				<block path="table/tr[2]/td[1]/font/xsl:for-each/xsl:if/xsl:value-of" x="200" y="47"/>
				<block path="table/xsl:for-each" x="300" y="27"/>
				<block path="table/xsl:for-each/xsl:if/=[0]" x="364" y="55"/>
				<block path="table/xsl:for-each/xsl:if" x="410" y="57"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/!=[0]" x="314" y="85"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if" x="360" y="87"/>
				<block path="table/xsl:for-each/xsl:if/xsl:if/tr/td[1]/font/xsl:value-of" x="360" y="127"/>
				<block path="table/xsl:if/!=[0]" x="274" y="85"/>
				<block path="table/xsl:if" x="320" y="87"/>
				<block path="table/xsl:if/tr/td[1]/font/xsl:value-of" x="400" y="127"/>
				<block path="table/xsl:for-each[1]" x="280" y="87"/>
				<block path="table/xsl:for-each[1]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="15"/>
				<block path="table/xsl:for-each[1]/tr/td[1]/font/xsl:if" x="90" y="17"/>
				<block path="table/xsl:for-each[1]/tr/td[1]/font/xsl:if/xsl:value-of" x="320" y="127"/>
				<block path="table/xsl:for-each[2]" x="240" y="87"/>
				<block path="table/xsl:for-each[2]/tr/td/font/strong/xsl:value-of" x="360" y="87"/>
				<block path="table/xsl:for-each[2]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="95"/>
				<block path="table/xsl:for-each[2]/tr/td[1]/font/xsl:if" x="90" y="97"/>
				<block path="table/xsl:for-each[2]/tr/td[1]/font/xsl:if/xsl:value-of" x="280" y="127"/>
				<block path="table/xsl:for-each[3]" x="200" y="87"/>
				<block path="table/xsl:for-each[3]/tr/td/font/strong/xsl:value-of" x="360" y="87"/>
				<block path="table/xsl:for-each[3]/tr/td[1]/font/xsl:if/!=[0]" x="124" y="135"/>
				<block path="table/xsl:for-each[3]/tr/td[1]/font/xsl:if" x="170" y="137"/>
				<block path="table/xsl:for-each[3]/tr/td[1]/font/xsl:if/xsl:value-of" x="240" y="127"/>
				<block path="table/tr[3]/td[1]/xsl:if/!=[0]" x="314" y="85"/>
				<block path="table/tr[3]/td[1]/xsl:if" x="360" y="87"/>
				<block path="table/tr[3]/td[1]/xsl:if/font/xsl:value-of" x="40" y="127"/>
				<block path="table/tr[3]/td[1]/xsl:if[1]/!=[0]" x="314" y="85"/>
				<block path="table/tr[3]/td[1]/xsl:if[1]" x="360" y="87"/>
				<block path="table/tr[3]/td[1]/xsl:if[1]/font/xsl:value-of" x="360" y="87"/>
				<block path="table[1]/tr/td/xsl:if/=[0]" x="314" y="85"/>
				<block path="table[1]/tr/td/xsl:if" x="360" y="87"/>
				<block path="table[1]/tr/td/xsl:if[1]/!=[0]" x="314" y="85"/>
				<block path="table[1]/tr/td/xsl:if[1]" x="360" y="87"/>
			</template>
			<template match="/"></template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->