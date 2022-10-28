<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
               xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
			   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
               xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" 
				xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" 
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Total">

<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
						<tr>
							<td style="border-style: solid; border-width: 1px;" width="32%" colspan="3" align="left" >
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Régimen Retención:</strong>&#160;&#160;&#160;&#160;&#160;&#160;
									<xsl:if test="//sac:SUNATRetentionSystemCode='01'">
										TASA 3%
									</xsl:if>
								</font>
							</td>		
							<td style="border-style: solid; border-width: 1px;" width="32%" colspan="3" align="left" >
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Tasa Retención:</strong>&#160;&#160;&#160;&#160;&#160;&#160;
									<xsl:value-of select="//sac:SUNATRetentionPercent"/><strong>%</strong>
								</font>
							</td>
							<td width="12%" align="center" >
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>Total en Soles</strong>
								</font>
							</td>
							<td width="12%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number(//cbc:TotalInvoiceAmount,'###,###,##0.00','pen')"/>
								</font>
							</td>
							<td width="12%" align="right">
								<font face="Arial, Helvetica, sans-serif" size="2">
								<xsl:value-of select="format-number(//sac:SUNATTotalPaid,'###,###,##0.00','pen')"/>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
	</xsl:template>

	
	<xsl:template name="Referencia">
		
		<tbody>
			<tr>
				<td>
					<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
						<tbody>
							<tr>
								<td width="30%" align="left">
									<xsl:call-template name="Total"/>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>

		
	</xsl:template>

	<xsl:template name="Monto_Letras">
		<br/>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td align="left" width="100%">
						<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
							<strong>SON: </strong>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								   <xsl:if test="pe:Codigo='01'">
										<xsl:value-of select="pe:Valor"/>
								   </xsl:if>
							</xsl:for-each>
						</font>
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

    <xsl:template name="descripcion_datos">

		<xsl:param name="var" />

		<xsl:variable name="varvar">
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
				<xsl:if test="pe:Codigo = '02'">
				<xsl:value-of select="pe:Valor" /></xsl:if>
			</xsl:for-each>
		</xsl:variable>
	
		<xsl:variable name="linea1">
			<xsl:value-of select="substring-before($varvar, '*')" />
		</xsl:variable>
		<xsl:variable name="resto1">
			<xsl:value-of select="substring-after($varvar, '*')" />
		</xsl:variable>
		<xsl:variable name="linea2">
			<xsl:value-of select="substring-before($resto1, '*')" />
		</xsl:variable>
		<xsl:variable name="resto2">
			<xsl:value-of select="substring-after($resto1, '*')" />
		</xsl:variable>
		<xsl:variable name="linea3">
			<xsl:value-of select="substring-before($resto2, '*')" />
		</xsl:variable>
		<xsl:variable name="resto3">
			<xsl:value-of select="substring-after($resto2, '*')" />
		</xsl:variable>
		<xsl:variable name="linea4">
			<xsl:value-of select="substring-before($resto3, '*')" />
		</xsl:variable>
		<xsl:variable name="resto4">
			<xsl:value-of select="substring-after($resto3, '*')" />
		</xsl:variable>
		<xsl:variable name="linea5">
			<xsl:value-of select="substring-before($resto4, '*')" />
		</xsl:variable>
		<xsl:variable name="resto5">
			<xsl:value-of select="substring-after($resto4, '*')" />
		</xsl:variable>
		<xsl:variable name="linea6">
			<xsl:value-of select="substring-before($resto5, '*')" />
		</xsl:variable>
		<xsl:variable name="resto6">
			<xsl:value-of select="substring-after($resto5, '*')" />
		</xsl:variable>
		<xsl:variable name="linea7">
			<xsl:value-of select="substring-before($resto6, '*')" />
		</xsl:variable>
		<xsl:variable name="resto7">
			<xsl:value-of select="substring-after($resto6, '*')" />
		</xsl:variable>
		<xsl:variable name="linea8">
			<xsl:value-of select="substring-before($resto7, '*')" />
		</xsl:variable>
		<xsl:variable name="resto8">
			<xsl:value-of select="substring-after($resto7, '*')" />
		</xsl:variable>
		<xsl:variable name="linea9">
			<xsl:value-of select="substring-before($resto8, '*')" />
		</xsl:variable>
		<xsl:variable name="resto9">
			<xsl:value-of select="substring-after($resto8, '*')" />
		</xsl:variable>
		<xsl:variable name="linea10">
			<xsl:value-of select="substring-before($resto9, '*')" />
		</xsl:variable>
		<xsl:variable name="resto10">
			<xsl:value-of select="substring-after($resto9, '*')" />
		</xsl:variable>
		<xsl:variable name="linea11">
			<xsl:value-of select="substring-before($resto10, '*')" />
		</xsl:variable>
		<xsl:variable name="resto11">
			<xsl:value-of select="substring-after($resto10, '*')" />
		</xsl:variable>
		<xsl:variable name="linea12">
			<xsl:value-of select="substring-before($resto11, '*')" />
		</xsl:variable>
		<xsl:variable name="resto12">
			<xsl:value-of select="substring-after($resto11, '*')" />
		</xsl:variable>
		<xsl:variable name="linea13">
			<xsl:value-of select="substring-before($resto12, '*')" />
		</xsl:variable>
		<xsl:variable name="resto13">
			<xsl:value-of select="substring-after($resto12, '*')" />
		</xsl:variable>
		<xsl:variable name="linea14">
			<xsl:value-of select="substring-before($resto13, '*')" />
		</xsl:variable>
		<xsl:variable name="resto14">
			<xsl:value-of select="substring-after($resto13, '*')" />
		</xsl:variable>
		<xsl:variable name="linea15">
			<xsl:value-of select="substring-before($resto14, '*')" />
		</xsl:variable>
		<xsl:variable name="resto15">
			<xsl:value-of select="substring-after($resto14, '*')" />
		</xsl:variable>
		<xsl:variable name="linea16">
			<xsl:value-of select="substring-before($resto15, '*')" />
		</xsl:variable>
		<xsl:variable name="resto16">
			<xsl:value-of select="substring-after($resto15, '*')" />
		</xsl:variable>
		<xsl:variable name="linea17">
			<xsl:value-of select="substring-before($resto16, '*')" />
		</xsl:variable>
		<xsl:variable name="resto17">
			<xsl:value-of select="substring-after($resto16, '*')" />
		</xsl:variable>
		<xsl:variable name="linea18">
			<xsl:value-of select="substring-before($resto17, '*')" />
		</xsl:variable>
		<xsl:variable name="resto18">
			<xsl:value-of select="substring-after($resto17, '*')" />
		</xsl:variable>
		<xsl:variable name="linea19">
			<xsl:value-of select="substring-before($resto18, '*')" />
		</xsl:variable>
		<xsl:variable name="resto19">
			<xsl:value-of select="substring-after($resto18, '*')" />
		</xsl:variable>
		<xsl:variable name="linea20">
			<xsl:value-of select="substring-before($resto19, '*')" />
		</xsl:variable>
		<xsl:variable name="resto20">
			<xsl:value-of select="substring-after($resto19, '*')" />
		</xsl:variable>
		<xsl:variable name="linea21">
			<xsl:value-of select="substring-before($resto20, '*')" />
		</xsl:variable>
		<xsl:variable name="resto21">
			<xsl:value-of select="substring-after($resto20, '*')" />
		</xsl:variable>
		<xsl:variable name="linea22">
			<xsl:value-of select="substring-before($resto21, '*')" />
		</xsl:variable>
		<xsl:variable name="resto22">
			<xsl:value-of select="substring-after($resto21, '*')" />
		</xsl:variable>
		<xsl:variable name="linea23">
			<xsl:value-of select="substring-before($resto22, '*')" />
		</xsl:variable>
		<xsl:variable name="resto23">
			<xsl:value-of select="substring-after($resto22, '*')" />
		</xsl:variable>
		<xsl:variable name="linea24">
			<xsl:value-of select="substring-before($resto23, '*')" />
		</xsl:variable>
		<xsl:variable name="resto24">
			<xsl:value-of select="substring-after($resto23, '*')" />
		</xsl:variable>
		<xsl:variable name="linea25">
			<xsl:value-of select="substring-before($resto24, '*')" />
		</xsl:variable>
		<xsl:variable name="resto25">
			<xsl:value-of select="substring-after($resto24, '*')" />
		</xsl:variable>
		<xsl:variable name="linea26">
			<xsl:value-of select="substring-before($resto25, '*')" />
		</xsl:variable>
		<xsl:variable name="resto26">
			<xsl:value-of select="substring-after($resto25, '*')" />
		</xsl:variable>
		<xsl:variable name="linea27">
			<xsl:value-of select="substring-before($resto26, '*')" />
		</xsl:variable>
		<xsl:variable name="resto27">
			<xsl:value-of select="substring-after($resto26, '*')" />
		</xsl:variable>
		<xsl:variable name="linea28">
			<xsl:value-of select="substring-before($resto27, '*')" />
		</xsl:variable>
		<xsl:variable name="resto28">
			<xsl:value-of select="substring-after($resto27, '*')" />
		</xsl:variable>
		<xsl:variable name="linea29">
			<xsl:value-of select="substring-before($resto28, '*')" />
		</xsl:variable>
		<xsl:variable name="resto29">
			<xsl:value-of select="substring-after($resto28, '*')" />
		</xsl:variable>
		<xsl:variable name="linea30">
			<xsl:value-of select="substring-before($resto29, '*')" />
		</xsl:variable>
		<xsl:variable name="resto30">
			<xsl:value-of select="substring-after($resto29, '*')" />
		</xsl:variable>
	
		<xsl:choose>
			<xsl:when test="$var = '1'"><xsl:value-of select="$linea1" /></xsl:when>
			<xsl:when test="$var = '2'"><xsl:value-of select="$linea2" /></xsl:when>
			<xsl:when test="$var = '3'"><xsl:value-of select="$linea3" /></xsl:when>
			<xsl:when test="$var = '4'"><xsl:value-of select="$linea4" /></xsl:when>
			<xsl:when test="$var = '5'"><xsl:value-of select="$linea5" /></xsl:when>
			<xsl:when test="$var = '6'"><xsl:value-of select="$linea6" /></xsl:when>
			<xsl:when test="$var = '7'"><xsl:value-of select="$linea7" /></xsl:when>
			<xsl:when test="$var = '8'"><xsl:value-of select="$linea8" /></xsl:when>
			<xsl:when test="$var = '9'"><xsl:value-of select="$linea9" /></xsl:when>
			<xsl:when test="$var = '10'"><xsl:value-of select="$linea10" /></xsl:when>
			<xsl:when test="$var = '11'"><xsl:value-of select="$linea11" /></xsl:when>
			<xsl:when test="$var = '12'"><xsl:value-of select="$linea12" /></xsl:when>
			<xsl:when test="$var = '13'"><xsl:value-of select="$linea13" /></xsl:when>
			<xsl:when test="$var = '14'"><xsl:value-of select="$linea14" /></xsl:when>
			<xsl:when test="$var = '15'"><xsl:value-of select="$linea15" /></xsl:when>
			<xsl:when test="$var = '16'"><xsl:value-of select="$linea16" /></xsl:when>
			<xsl:when test="$var = '17'"><xsl:value-of select="$linea17" /></xsl:when>
			<xsl:when test="$var = '18'"><xsl:value-of select="$linea18" /></xsl:when>
			<xsl:when test="$var = '19'"><xsl:value-of select="$linea19" /></xsl:when>
			<xsl:when test="$var = '20'"><xsl:value-of select="$linea20" /></xsl:when>
			<xsl:when test="$var = '21'"><xsl:value-of select="$linea21" /></xsl:when>
			<xsl:when test="$var = '22'"><xsl:value-of select="$linea22" /></xsl:when>
			<xsl:when test="$var = '23'"><xsl:value-of select="$linea23" /></xsl:when>
			<xsl:when test="$var = '24'"><xsl:value-of select="$linea24" /></xsl:when>
			<xsl:when test="$var = '25'"><xsl:value-of select="$linea25" /></xsl:when>
			<xsl:when test="$var = '26'"><xsl:value-of select="$linea26" /></xsl:when>
			<xsl:when test="$var = '27'"><xsl:value-of select="$linea27" /></xsl:when>
			<xsl:when test="$var = '28'"><xsl:value-of select="$linea28" /></xsl:when>
			<xsl:when test="$var = '29'"><xsl:value-of select="$linea29" /></xsl:when>
			<xsl:when test="$var = '30'"><xsl:value-of select="$linea30" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\Panasonic\Formato_PanasonicV1.1\20100165849&#x2D;01&#x2D;F301&#x2D;00000280.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"><block path="table/td/font/xsl:for&#x2D;each" x="410" y="60"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if/=[0]" x="314" y="88"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if" x="360" y="90"/><block path="table/td/font/xsl:for&#x2D;each[1]" x="300" y="30"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="204" y="58"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if" x="250" y="60"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/xsl:value&#x2D;of" x="320" y="90"/><block path="table/td/font/xsl:for&#x2D;each[2]" x="340" y="30"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="84" y="58"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if" x="130" y="60"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/xsl:value&#x2D;of" x="200" y="90"/></template><template name="Total"><block path="table/tr/td[1]/font/xsl:for&#x2D;each" x="340" y="27"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="44" y="55"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="90" y="57"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="160" y="87"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="260" y="27"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="15"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="410" y="17"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="40" y="87"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="20" y="27"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="84" y="15"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="130" y="17"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="200" y="47"/><block path="table/xsl:for&#x2D;each" x="300" y="27"/><block path="table/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="55"/><block path="table/xsl:for&#x2D;each/xsl:if" x="410" y="57"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="314" y="85"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if" x="360" y="87"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="360" y="127"/><block path="table/xsl:if/!=[0]" x="274" y="85"/><block path="table/xsl:if" x="320" y="87"/><block path="table/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="400" y="127"/><block path="table/xsl:for&#x2D;each[1]" x="280" y="87"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="15"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if" x="90" y="17"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="320" y="127"/><block path="table/xsl:for&#x2D;each[2]" x="240" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="95"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if" x="90" y="97"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="280" y="127"/><block path="table/xsl:for&#x2D;each[3]" x="200" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/!=[0]" x="124" y="135"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if" x="170" y="137"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="240" y="127"/><block path="table/tr[3]/td[1]/xsl:if/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if/font/xsl:value&#x2D;of" x="40" y="127"/><block path="table/tr[3]/td[1]/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if[1]" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if[1]/font/xsl:value&#x2D;of" x="360" y="87"/><block path="table[1]/tr/td/xsl:if/=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if" x="360" y="87"/><block path="table[1]/tr/td/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if[1]" x="360" y="87"/></template><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->