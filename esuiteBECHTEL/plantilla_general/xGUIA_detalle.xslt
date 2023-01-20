<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="RetourneValAd">
		<xsl:param name="NumAd"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$NumAd">
				<xsl:if test="pe:Valor!='-'">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:variable name="hojafinal">
		<xsl:value-of select="1"/>
	</xsl:variable>
	
	<xsl:template name="RetourneValAdItem">
		<xsl:param name="NumLinea"/>
		<xsl:param name="NumAd"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Linea = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe:Valor" />
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:variable name="obs">
		<xsl:if test="string-length(//cbc:Note)&lt;65">
			<xsl:value-of select="0"/>
		</xsl:if>
		<xsl:if test="string-length(//cbc:Note) &gt;64 and string-length(//cbc:Note) &lt;190">
			<xsl:value-of select="1"/>
		</xsl:if> 
		<xsl:if test="string-length(//cbc:Note) &gt;189"> 
				<xsl:value-of select="2"/>
		</xsl:if> 
	</xsl:variable>
	
	<xsl:variable name="numitems">
		<xsl:value-of select="count(//cac:DespatchLine)"/>
	</xsl:variable>
	
	
	<xsl:variable name="adc11">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 11">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc12">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 12">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc13">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 13">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc14">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 14">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc21">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 21">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc22">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 22">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc23">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 23">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc24">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 24">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc31">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 31">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc32">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 32">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc33">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 33">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc34">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 34">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc41">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 41">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc42">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 42">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc43">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 43">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc44">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 44">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc51">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 51">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc52">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 52">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc53">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 53">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc54">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 54">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc61">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 61">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc62">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 62">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc63">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 63">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc64">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 64">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc71">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 71">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc72">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 72">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc73">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 73">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc74">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 74">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc81">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 81">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc82">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 82">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc83">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 83">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc84">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 84">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc91">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 91">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc92">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 92">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc93">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 93">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc94">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 94">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc101">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 101">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc102">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 102">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc103">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 103">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc104">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 104">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc111">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 111">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc112">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 112">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc113">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 113">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc114">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 114">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc121">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 121">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc122">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 122">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc123">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 123">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc124">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 124">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc131">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 131">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc132">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 132">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc133">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 133">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc134">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 134">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc141">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 141">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc142">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 142">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc143">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 143">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc144">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 144">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc151">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 151">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc152">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 152">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc153">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 153">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc154">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 154">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc161">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 161">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc162">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 162">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc163">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 163">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc164">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 164">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc171">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 171">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc172">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 172">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc173">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 173">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc174">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 174">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc181">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 181">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc182">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 182">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc183">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 183">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc184">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 184">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc191">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 191">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc192">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 192">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc193">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 193">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc194">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 194">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc201">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 201">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc202">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 202">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc203">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 203">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="adc204">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
				<xsl:if test="pe:Linea = 204">
					<xsl:if test="pe:Valor != '' and pe:Valor != '-'">
						<xsl:value-of select="1" />
					</xsl:if>
				</xsl:if>
		</xsl:for-each>
	</xsl:variable>

<xsl:variable name="totadicionales">
	<xsl:value-of select="$adc11 + $adc12 + $adc13 +  $adc14 + $adc21 + $adc22 + $adc23 +  $adc24 + $adc31 + $adc32 + $adc33 +  $adc34 + $adc41 + $adc42 + $adc43 +  $adc44 + $adc51 + $adc52 + $adc53 +  $adc54 + $adc61 + $adc62 + $adc63 +  $adc64 + $adc71 + $adc72 + $adc73 +  $adc74 + $adc81 + $adc82 + $adc83 +  $adc84 + $adc91 + $adc92 + $adc93 +  $adc94 + $adc101 + $adc102 + $adc103 +  $adc104 + $adc111 + $adc112 + $adc113 +  $adc114 + $adc121 + $adc122 + $adc123 +  $adc124 + $adc131 + $adc132 + $adc133 +  $adc134 + $adc141 + $adc142 + $adc143 +  $adc144 + $adc151 + $adc152 + $adc153 +  $adc154 + $adc161 + $adc162 + $adc163 +  $adc164 + $adc171 + $adc172 + $adc173 +  $adc174 + $adc181 + $adc182 + $adc183 +  $adc184 + $adc191 + $adc192 + $adc193 +  $adc194 + $adc201 + $adc202 + $adc203 +  $adc204"/>
</xsl:variable>	

<xsl:variable name="item1">
	<xsl:value-of select="1 + $adc11 + $adc12 + $adc13 +  $adc14"/>
</xsl:variable>	
<xsl:variable name="item2">	
	<xsl:if test="$numitems >=2">
		<xsl:value-of select="1 + $adc21 + $adc22 + $adc23 +  $adc24"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item3">	
	<xsl:if test="$numitems >=3">
		<xsl:value-of select="1 + $adc31 + $adc32 + $adc33 +  $adc34"/>
	</xsl:if>
</xsl:variable>		
<xsl:variable name="item4">		
	<xsl:if test="$numitems >=4">
		<xsl:value-of select="1 + $adc41 + $adc42 + $adc43 +  $adc44"/>
	</xsl:if>
</xsl:variable>		
<xsl:variable name="item5">		
	<xsl:if test="$numitems >=5">	
		<xsl:value-of select="1 + $adc51 + $adc52 + $adc53 +  $adc54"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item6">		
	<xsl:if test="$numitems >=6">		
		<xsl:value-of select="1 + $adc61 + $adc62 + $adc63 +  $adc64"/>
	</xsl:if>
</xsl:variable>
<xsl:variable name="item7">		
	<xsl:if test="$numitems >=7">		
		<xsl:value-of select="1 + $adc71 + $adc72 + $adc73 +  $adc74"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item8">		
	<xsl:if test="$numitems >=8">		
		<xsl:value-of select="1 + $adc81 + $adc82 + $adc83 +  $adc84"/>
	</xsl:if>
</xsl:variable>		
<xsl:variable name="item9">		
	<xsl:if test="$numitems >=9">
		<xsl:value-of select="1 + $adc91 + $adc92 + $adc93 +  $adc94"/>
	</xsl:if>
</xsl:variable>		
<xsl:variable name="item10">		
	<xsl:if test="$numitems >=10">
		<xsl:value-of select="1 + $adc101 + $adc102 + $adc103 +  $adc104"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item11">		
	<xsl:if test="$numitems >=11">
		<xsl:value-of select="1 + $adc111 + $adc112 + $adc113 +  $adc114"/>
	</xsl:if>
</xsl:variable>		
<xsl:variable name="item12">		
	<xsl:if test="$numitems >=12">
		<xsl:value-of select="1 + $adc121 + $adc122 + $adc123 +  $adc124"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item13">		
	<xsl:if test="$numitems >=13">
		<xsl:value-of select="1 + $adc131 + $adc132 + $adc133 +  $adc134"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item14">		
	<xsl:if test="$numitems >=14">
		<xsl:value-of select="1 + $adc141 + $adc142 + $adc143 +  $adc144"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item15">		
	<xsl:if test="$numitems >=15">
		<xsl:value-of select="1 + $adc151 + $adc152 + $adc153 +  $adc154"/>
	</xsl:if>
</xsl:variable>		
<xsl:variable name="item16">		
	<xsl:if test="$numitems >=16">
		<xsl:value-of select="1 + $adc161 + $adc162 + $adc163 +  $adc164"/>
	</xsl:if>
</xsl:variable>		
<xsl:variable name="item17">		
	<xsl:if test="$numitems >=17">
		<xsl:value-of select="1 + $adc171 + $adc172 + $adc173 +  $adc174"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item18">		
	<xsl:if test="$numitems >=18">
		<xsl:value-of select="1 + $adc181 + $adc182 + $adc183 +  $adc184"/>
	</xsl:if>
</xsl:variable>		
<xsl:variable name="item19">		
	<xsl:if test="$numitems >=19">
		<xsl:value-of select="1 + $adc191 + $adc192 + $adc193 +  $adc194"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item20">		
	<xsl:if test="$numitems >=20">
		<xsl:value-of select="1 + $adc201 + $adc202 + $adc203 +  $adc204"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item21">		
	<xsl:if test="$numitems >=21">
		<xsl:value-of select="1"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item22">		
	<xsl:if test="$numitems >=22">
		<xsl:value-of select="1"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item23">		
	<xsl:if test="$numitems >=23">
		<xsl:value-of select="1"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item24">		
	<xsl:if test="$numitems >=24">
		<xsl:value-of select="1"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item25">		
	<xsl:if test="$numitems >=25">
		<xsl:value-of select="1"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item26">		
	<xsl:if test="$numitems >=26">
		<xsl:value-of select="1"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item27">		
	<xsl:if test="$numitems >=27">
		<xsl:value-of select="1"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item28">		
	<xsl:if test="$numitems >=28">
		<xsl:value-of select="1"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item29">		
	<xsl:if test="$numitems >=29">
		<xsl:value-of select="1"/>
	</xsl:if>
</xsl:variable>	
<xsl:variable name="item30">		
	<xsl:if test="$numitems >=30">
		<xsl:value-of select="1"/>
	</xsl:if>
</xsl:variable>	


	<xsl:variable name="totlineas">
		<xsl:value-of select="$item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20"/>
	</xsl:variable>
	
	<xsl:variable name="totadic">
		<xsl:value-of select="$item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20"/>
	</xsl:variable>
	
	<xsl:variable name="hoja1">
	
		<!-- <xsl:if test="($totadicionales + $numitems)	&lt;'30'"> -->
		
		<!-- </xsl:if> -->
		
		<xsl:if test="($totadicionales + $numitems)	&gt;'29'">
		<xsl:choose>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6) ='30'">
			<xsl:value-of select="6"/>
		</xsl:when> 
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7) ='30'">
			<xsl:value-of select="7"/>
		</xsl:when> 
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8) ='30'">
			<xsl:value-of select="8"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9) ='30'">
			<xsl:value-of select="9"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 ) ='30'">
			<xsl:value-of select="10"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 ) ='30'">
			<xsl:value-of select="11"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 ) ='30'">
			<xsl:value-of select="12"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 ) ='30'">
			<xsl:value-of select="13"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14) ='30'">
			<xsl:value-of select="14"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15) ='30'">
			<xsl:value-of select="15"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 ) ='30'">
			<xsl:value-of select="16"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 ) ='30'">
			<xsl:value-of select="17"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 ) ='30'">
			<xsl:value-of select="18"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19 ) ='30'">
			<xsl:value-of select="19"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 ) ='30'">
			<xsl:value-of select="20"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 ) ='30'">
			<xsl:value-of select="21"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22) ='30'">
			<xsl:value-of select="22"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23) ='30'">
			<xsl:value-of select="23"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24) ='30'">
			<xsl:value-of select="24"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24  + $item25) ='30'">
			<xsl:value-of select="25"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24  + $item25  + $item26) ='30'">
			<xsl:value-of select="26"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24  + $item25  + $item26  + $item27) ='30'">
			<xsl:value-of select="27"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24  + $item25  + $item26  + $item27  + $item28) ='30'">
			<xsl:value-of select="28"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24  + $item25  + $item26  + $item27  + $item28  + $item29) ='30'">
			<xsl:value-of select="29"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24  + $item25  + $item26  + $item27  + $item28  + $item29  + $item30) ='30'">
			<xsl:value-of select="30"/>
		</xsl:when>
		</xsl:choose>

		</xsl:if>
		
	</xsl:variable>
	
<xsl:variable name="hoja2">
		
		<xsl:if test="($totadicionales + $numitems)	&gt;'79'">
		<xsl:choose>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 ) ='80'">
			<xsl:value-of select="16"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 ) ='80'">
			<xsl:value-of select="17"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 ) ='80'">
			<xsl:value-of select="18"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19 ) ='80'">
			<xsl:value-of select="19"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 ) ='80'">
			<xsl:value-of select="20"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 ) ='80'">
			<xsl:value-of select="21"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22) ='80'">
			<xsl:value-of select="22"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23) ='80'">
			<xsl:value-of select="23"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24) ='80'">
			<xsl:value-of select="24"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24  + $item25) ='80'">
			<xsl:value-of select="25"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24  + $item25  + $item26) ='80'">
			<xsl:value-of select="26"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24  + $item25  + $item26  + $item27) ='80'">
			<xsl:value-of select="27"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24  + $item25  + $item26  + $item27  + $item28) ='80'">
			<xsl:value-of select="28"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24  + $item25  + $item26  + $item27  + $item28  + $item29) ='80'">
			<xsl:value-of select="29"/>
		</xsl:when>
		<xsl:when test="($item1 + $item2 + $item3 + $item4 + $item5 + $item6 + $item7 + $item8 + $item9 + $item10 + $item11 + $item12 + $item13 + $item14 + $item15 + $item16 + $item17 + $item18 + $item19  + $item20 + $item21 + $item22 + $item23 + $item24  + $item25  + $item26  + $item27  + $item28  + $item29  + $item30) ='80'">
			<xsl:value-of select="30"/>
		</xsl:when>
		</xsl:choose>

		</xsl:if>
		
	</xsl:variable>


	<xsl:template name="DetallesEncabezado">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr bgcolor="#DCDCDC">
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
						<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>N° 
									</strong>
								</font>
							</td>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="7%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>UNIDAD</strong>
								</font>
							</td>
							<td width="78%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>DESCRIPCIÓN </strong>  
									 <!-- - <xsl:value-of select="$item1"/> -->
									 <!-- - <xsl:value-of select="$item2"/>  -->
									 <!-- - <xsl:value-of select="$item3"/>  -->
									 <!-- - <xsl:value-of select="$item4"/>  -->
									 <!-- - <xsl:value-of select="$item5"/>  -->
									 <!-- - <xsl:value-of select="$item6"/>   -->
									 <!-- - <xsl:value-of select="$hoja1"/>  -->
								</font>
							</td>
						</tr>

					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						
							<xsl:if test="($numitems + $totadicionales) &lt;'30'">
									
								<xsl:for-each select="//cac:DespatchLine">
									<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;($numitems + 1) ">
										<tr>
											<td width="5%" align="center" valign="top">
												<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:value-of select="cbc:ID"/>
												</font>
											</td>
											<td width="10%" align="center" valign="top">
												<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:value-of select="cbc:DeliveredQuantity"/>
												</font>
											</td>
											<td width="7%" align="center" valign="top">
												<font face="Arial, Helvetica, sans-serif" size="2">
													
													<xsl:call-template name="unidad_medida" />
												</font>
											</td>
											<td width="78%" align="left" valign="top">
												<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:if test="//cbc:CustomizationID='1.0'">
									<xsl:value-of select="cac:Item/cbc:Name"/>
									</xsl:if>
									<xsl:if test="//cbc:CustomizationID='2.0'">
										<xsl:value-of select="cac:Item/cbc:Description"/>
										</xsl:if>
													<xsl:variable name="ValorAdicional1">
														<xsl:call-template name="RetourneValAdItem">
															<xsl:with-param name="NumLinea" select="cbc:ID"/>	
															<xsl:with-param name="NumAd" select="1"/>
														</xsl:call-template>								
													</xsl:variable>
											

													<xsl:variable name="ValorAdicional2">
														<xsl:if test="$ValorAdicional1 != ''">
															<xsl:call-template name="RetourneValAdItem">
																<xsl:with-param name="NumLinea" select="cbc:ID"/>
																<xsl:with-param name="NumAd" select="2"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:variable>

													<xsl:variable name="ValorAdicional3">
														<xsl:if test="$ValorAdicional2 != ''">
															<xsl:call-template name="RetourneValAdItem">
																<xsl:with-param name="NumLinea" select="cbc:ID"/>
																<xsl:with-param name="NumAd" select="3"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:variable>
													
													<xsl:variable name="ValorAdicional4">
														<xsl:if test="$ValorAdicional3 != ''">
															<xsl:call-template name="RetourneValAdItem">
																<xsl:with-param name="NumLinea" select="cbc:ID"/>
																<xsl:with-param name="NumAd" select="4"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:variable>
													

													
													<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 != '-'">
														<br/><xsl:value-of select="$ValorAdicional1"/>
													</xsl:if>
													<xsl:if test="$ValorAdicional2 != ''and $ValorAdicional2 != '-'">
														<br/><xsl:value-of select="$ValorAdicional2"/>
													</xsl:if>
													<xsl:if test="$ValorAdicional3 != '' and $ValorAdicional3 != '-'">
														<br/><xsl:value-of select="$ValorAdicional3"/>
													</xsl:if>
													<xsl:if test="$ValorAdicional4 != ''and $ValorAdicional4 != '-'">
														<br/><xsl:value-of select="$ValorAdicional4"/>
													</xsl:if>
													
												</font>
											</td>
											
										</tr>
									</xsl:if> 
							
								</xsl:for-each>
								
								<xsl:call-template name="lineaBl"> 
									<xsl:with-param name="cont" select="29 - ($numitems + $totadicionales)"/>
								</xsl:call-template>
							
							</xsl:if>

							<xsl:if test="($numitems + $totadicionales) &gt;'29'">
								<xsl:for-each select="//cac:DespatchLine">
									<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;($hoja1 + 1) ">
										<tr>
											<td width="5%" align="center" valign="top">
												<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:value-of select="cbc:ID"/>
												</font>
											</td>
											<td width="10%" align="center" valign="top">
												<font face="Arial, Helvetica, sans-serif" size="2">
												<xsl:value-of select="cbc:DeliveredQuantity"/>
												</font>
											</td>
											<td width="7%" align="center" valign="top">
												<font face="Arial, Helvetica, sans-serif" size="2">
													
													<xsl:call-template name="unidad_medida" />
												</font>
											</td>
											<td width="78%" align="left" valign="top">
												<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:if test="//cbc:CustomizationID='1.0'">
									<xsl:value-of select="cac:Item/cbc:Name"/>
									</xsl:if>
									<xsl:if test="//cbc:CustomizationID='2.0'">
										<xsl:value-of select="cac:Item/cbc:Description"/>
										</xsl:if>
													
													<xsl:variable name="ValorAdicional1">
														<xsl:call-template name="RetourneValAdItem">
															<xsl:with-param name="NumLinea" select="cbc:ID"/>	
															<xsl:with-param name="NumAd" select="1"/>
														</xsl:call-template>								
													</xsl:variable>
											

													<xsl:variable name="ValorAdicional2">
														<xsl:if test="$ValorAdicional1 != ''">
															<xsl:call-template name="RetourneValAdItem">
																<xsl:with-param name="NumLinea" select="cbc:ID"/>
																<xsl:with-param name="NumAd" select="2"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:variable>

													<xsl:variable name="ValorAdicional3">
														<xsl:if test="$ValorAdicional2 != ''">
															<xsl:call-template name="RetourneValAdItem">
																<xsl:with-param name="NumLinea" select="cbc:ID"/>
																<xsl:with-param name="NumAd" select="3"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:variable>
													
													<xsl:variable name="ValorAdicional4">
														<xsl:if test="$ValorAdicional3 != ''">
															<xsl:call-template name="RetourneValAdItem">
																<xsl:with-param name="NumLinea" select="cbc:ID"/>
																<xsl:with-param name="NumAd" select="4"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:variable>
													

													
													<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 != '-'">
														<br/><xsl:value-of select="$ValorAdicional1"/>
													</xsl:if>
													<xsl:if test="$ValorAdicional2 != ''and $ValorAdicional2 != '-'">
														<br/><xsl:value-of select="$ValorAdicional2"/>
													</xsl:if>
													<xsl:if test="$ValorAdicional3 != '' and $ValorAdicional3 != '-'">
														<br/><xsl:value-of select="$ValorAdicional3"/>
													</xsl:if>
													<xsl:if test="$ValorAdicional4 != ''and $ValorAdicional4 != '-'">
														<br/><xsl:value-of select="$ValorAdicional4"/>
													</xsl:if>
													
												</font>
											</td>
											
										</tr>
									</xsl:if> 
							
								</xsl:for-each>
																							
							</xsl:if>
						
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	



	
<xsl:template name="DetallesEncabezado2">
<xsl:if test="($numitems + $totadicionales) &gt;'30'">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr bgcolor="#DCDCDC">
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
						<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>N°</strong>
								</font>
							</td>
						<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="7%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>UNIDAD</strong>
								</font>
							</td>
							<td width="78%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>DESCRIPCIÓN </strong> 
									<!-- - <xsl:value-of select="$numitems + $totadicionales"/> -->
									<!-- - <xsl:value-of select="$hoja1 + 1"/> -->
								</font>
							</td>
						</tr>

					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						
						<xsl:if test="($numitems + $totadicionales) &gt;'30'  and ($numitems + $totadicionales) &lt;'81' ">
						<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;$hoja1 and cbc:ID &lt;($numitems + 1)">
							<tr>
								<td width="5%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
							    <td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="cbc:DeliveredQuantity"/>
									</font>
								</td>
								<td width="7%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida" />
									</font>
								</td>
								<td width="78%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:if test="//cbc:CustomizationID='1.0'">
									<xsl:value-of select="cac:Item/cbc:Name"/>
									</xsl:if>
									<xsl:if test="//cbc:CustomizationID='2.0'">
										<xsl:value-of select="cac:Item/cbc:Description"/>
										</xsl:if>
										
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>	
												<xsl:with-param name="NumAd" select="1"/>
											</xsl:call-template>								
										</xsl:variable>
								

										<xsl:variable name="ValorAdicional2">
											<xsl:if test="$ValorAdicional1 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="2"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional3">
											<xsl:if test="$ValorAdicional2 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="3"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>
										
										<xsl:variable name="ValorAdicional4">
											<xsl:if test="$ValorAdicional3 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="4"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>
										
										
										<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 != '-'">
											<br/><xsl:value-of select="$ValorAdicional1"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional2 != ''and $ValorAdicional2 != '-'">
											<br/><xsl:value-of select="$ValorAdicional2"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional3 != '' and $ValorAdicional3 != '-'">
											<br/><xsl:value-of select="$ValorAdicional3"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional4 != ''and $ValorAdicional4 != '-'">
											<br/><xsl:value-of select="$ValorAdicional4"/>
										</xsl:if>
									
									</font>
								</td>
								
								
							</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:call-template name="lineaBl"> 
							<xsl:with-param name="cont" select="85 - ($numitems + $totadicionales)"/>
						</xsl:call-template>
						</xsl:if>
						
						
						<xsl:if test="($numitems + $totadicionales) &gt;'80' ">
						<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;$hoja1 and cbc:ID &lt;($hoja2 + 1)">
							<tr>
								<td width="5%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
							    <td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="cbc:DeliveredQuantity"/>
									</font>
								</td>
								<td width="7%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida" />
									</font>
								</td>
								<td width="78%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:if test="//cbc:CustomizationID='1.0'">
									<xsl:value-of select="cac:Item/cbc:Name"/>
									</xsl:if>
									<xsl:if test="//cbc:CustomizationID='2.0'">
										<xsl:value-of select="cac:Item/cbc:Description"/>
										</xsl:if>
										
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>	
												<xsl:with-param name="NumAd" select="1"/>
											</xsl:call-template>								
										</xsl:variable>
								

										<xsl:variable name="ValorAdicional2">
											<xsl:if test="$ValorAdicional1 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="2"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional3">
											<xsl:if test="$ValorAdicional2 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="3"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>
										
										<xsl:variable name="ValorAdicional4">
											<xsl:if test="$ValorAdicional3 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="4"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>
										
										
										<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 != '-'">
											<br/><xsl:value-of select="$ValorAdicional1"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional2 != ''and $ValorAdicional2 != '-'">
											<br/><xsl:value-of select="$ValorAdicional2"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional3 != '' and $ValorAdicional3 != '-'">
											<br/><xsl:value-of select="$ValorAdicional3"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional4 != ''and $ValorAdicional4 != '-'">
											<br/><xsl:value-of select="$ValorAdicional4"/>
										</xsl:if>
									
									</font>
								</td>
								
								
							</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:call-template name="lineaBl"> 
							<xsl:with-param name="cont" select="5"/>
						</xsl:call-template>
						</xsl:if>
					</table>
				</td>
			</tr>
		</table>
	</xsl:if>	
	</xsl:template>
	

	
	
	<xsl:template name="DetallesEncabezado3">
	<xsl:if test="($numitems + $totadicionales) &gt;'80'">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr bgcolor="#DCDCDC">
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
						<td width="5%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>N°</strong>
								</font>
							</td>
						<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="7%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>UNIDAD</strong>
								</font>
							</td>
							<td width="78%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							
						</tr>

					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						
						<xsl:if test="($numitems + $totadicionales) &gt;'80'">
						<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;$hoja2 and cbc:ID &lt;($numitems + 1)">
							<tr>
								<td width="5%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
							    <td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="cbc:DeliveredQuantity"/>
									</font>
								</td>
								<td width="7%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida" />
									</font>
								</td>
								<td width="78%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:if test="//cbc:CustomizationID='1.0'">
									<xsl:value-of select="cac:Item/cbc:Name"/>
									</xsl:if>
									<xsl:if test="//cbc:CustomizationID='2.0'">
										<xsl:value-of select="cac:Item/cbc:Description"/>
										</xsl:if>
										
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>	
												<xsl:with-param name="NumAd" select="1"/>
											</xsl:call-template>								
										</xsl:variable>
								

										<xsl:variable name="ValorAdicional2">
											<xsl:if test="$ValorAdicional1 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="2"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>

										<xsl:variable name="ValorAdicional3">
											<xsl:if test="$ValorAdicional2 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="3"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>
										
										<xsl:variable name="ValorAdicional4">
											<xsl:if test="$ValorAdicional3 != ''">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="4"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:variable>
										
										
										<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 != '-'">
											<br/><xsl:value-of select="$ValorAdicional1"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional2 != ''and $ValorAdicional2 != '-'">
											<br/><xsl:value-of select="$ValorAdicional2"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional3 != '' and $ValorAdicional3 != '-'">
											<br/><xsl:value-of select="$ValorAdicional3"/>
										</xsl:if>
										<xsl:if test="$ValorAdicional4 != ''and $ValorAdicional4 != '-'">
											<br/><xsl:value-of select="$ValorAdicional4"/>
										</xsl:if>
									
									</font>
								</td>
								
								
							</tr>
							</xsl:if>
						</xsl:for-each>

						<xsl:call-template name="lineaBl"> 
							<xsl:with-param name="cont" select="135 - ($numitems + $totadicionales)"/>
						</xsl:call-template>
						</xsl:if>
						

					</table>
				</td>
			</tr>
		</table>
	</xsl:if>
	</xsl:template>
	

	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
			 <td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">
					</font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1">
					</font>
				</td>
				<td width="7%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
				<td width="78%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> 
					</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="unidad_medida">
		<xsl:choose>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PL' or cbc:CreditedQuantity/@unitCode='PL' or cbc:DebitedQuantity/@unitCode='PL'">BAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D64' or cbc:CreditedQuantity/@unitCode='D64' or cbc:DebitedQuantity/@unitCode='D64'">BLK</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BG' or cbc:CreditedQuantity/@unitCode='BG' or cbc:DebitedQuantity/@unitCode='BG'">BOL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BO' or cbc:CreditedQuantity/@unitCode='BO' or cbc:DebitedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BX' or cbc:CreditedQuantity/@unitCode='BX' or cbc:DebitedQuantity/@unitCode='BX'">CAJ</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CY' or cbc:CreditedQuantity/@unitCode='CY' or cbc:DebitedQuantity/@unitCode='CY'">CIL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CLT' or cbc:CreditedQuantity/@unitCode='CLT' or cbc:DebitedQuantity/@unitCode='CLT'">CL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CMT' or cbc:CreditedQuantity/@unitCode='CMT' or cbc:DebitedQuantity/@unitCode='CMT'">CM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CJ' or cbc:CreditedQuantity/@unitCode='CJ' or cbc:DebitedQuantity/@unitCode='CJ'">CON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='DLT' or cbc:CreditedQuantity/@unitCode='DLT' or cbc:DebitedQuantity/@unitCode='DLT'">DL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL' or cbc:CreditedQuantity/@unitCode='GLL' or cbc:DebitedQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GRM' or cbc:CreditedQuantity/@unitCode='GRM' or cbc:DebitedQuantity/@unitCode='GRM'">GR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='HUR' or cbc:CreditedQuantity/@unitCode='HUR' or cbc:DebitedQuantity/@unitCode='HUR'">HRA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KT' or cbc:CreditedQuantity/@unitCode='KT' or cbc:DebitedQuantity/@unitCode='KT'">JGO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM' or cbc:CreditedQuantity/@unitCode='KGM' or cbc:DebitedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KWT' or cbc:CreditedQuantity/@unitCode='KWT' or cbc:DebitedQuantity/@unitCode='KWT'">KW</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR' or cbc:CreditedQuantity/@unitCode='LBR' or cbc:DebitedQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR' or cbc:CreditedQuantity/@unitCode='LTR' or cbc:DebitedQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTR' or cbc:CreditedQuantity/@unitCode='MTR' or cbc:DebitedQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK' or cbc:CreditedQuantity/@unitCode='MTK' or cbc:DebitedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTQ' or cbc:CreditedQuantity/@unitCode='MTQ' or cbc:DebitedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MIL' or cbc:CreditedQuantity/@unitCode='MIL' or cbc:DebitedQuantity/@unitCode='MIL'">MIL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D61' or cbc:CreditedQuantity/@unitCode='D61' or cbc:DebitedQuantity/@unitCode='D61'">MIN</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MLT' or cbc:CreditedQuantity/@unitCode='MLT' or cbc:DebitedQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MMT' or cbc:CreditedQuantity/@unitCode='MMT' or cbc:DebitedQuantity/@unitCode='MMT'">MM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NPR' or cbc:CreditedQuantity/@unitCode='NPR' or cbc:DebitedQuantity/@unitCode='NPR'">PAR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTK' or cbc:CreditedQuantity/@unitCode='FTK' or cbc:DebitedQuantity/@unitCode='FTK'">PI2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTQ' or cbc:CreditedQuantity/@unitCode='FTQ' or cbc:DebitedQuantity/@unitCode='FTQ'">PI3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PA' or cbc:CreditedQuantity/@unitCode='PA' or cbc:DebitedQuantity/@unitCode='PA'">PQT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='INH' or cbc:CreditedQuantity/@unitCode='INH' or cbc:DebitedQuantity/@unitCode='INH'">PUL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NRL' or cbc:CreditedQuantity/@unitCode='NRL' or cbc:DebitedQuantity/@unitCode='NRL'">ROL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE' or cbc:CreditedQuantity/@unitCode='TNE' or cbc:DebitedQuantity/@unitCode='TNE'">TON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NIU' or cbc:CreditedQuantity/@unitCode='NIU' or cbc:DebitedQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SA' or cbc:CreditedQuantity/@unitCode='SA' or cbc:DebitedQuantity/@unitCode='SA'">SAC</xsl:when>		
			<xsl:otherwise>UNI
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="TipoDeMoneda_Total">
		<xsl:choose>
			<xsl:when test="//sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/@currencyID='PEN'">S/</xsl:when>
			<xsl:when test="//sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/@currencyID='USD'">USD</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>



	<xsl:variable name="varExportacion">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="22"/>
		</xsl:call-template>
	</xsl:variable>


</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\20513081236_2018111209T00100000005.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="..\20513081236_2018111209T00100000005.xml" srcSchemaRoot="DespatchAdvice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="DetallesEncabezado"></template><template name="RetourneValAdItem"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->