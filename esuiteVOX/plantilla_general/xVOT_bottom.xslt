<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

   <xsl:template name="bottom_normal">
      <table border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
         <tbody>
            <tr>
               <td valign="baseline" width="60%" align="center">
                  <font face="Arial, Helvetica, sans-serif" size="0">
                     <br/>/&gt;
							<strong>
					 		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='08'">
									<font face="Arial, Helvetica, sans-serif" size="1">								
										<xsl:value-of select="pe:Valor"/>
									</font>
								</xsl:if>
								<xsl:if test="pe1:Codigo='08'">
									<font face="Arial, Helvetica, sans-serif" size="1">								
										<xsl:value-of select="pe1:Valor"/>
									</font>
								</xsl:if>
								<xsl:if test="pe2:Codigo='08'">
									<font face="Arial, Helvetica, sans-serif" size="1">								
										<xsl:value-of select="pe2:Valor"/>
									</font>
								</xsl:if>
							</xsl:for-each>
							</strong>
							Operación sujeta al sistema de pago de obligación tributaria con el <br/>
							gobierno central Bco. de la Nación Cta. Cte Nro. 00-000-333069 <br/>
                      		
					  Autorizado mediante resolución XXXX " - Verifique documento: <strong>www.sunat.gob.pe</strong>
					 </font>			 
               </td>
               <td valign="top" width="10%" align="center"/>
            </tr>
         </tbody>
      </table>
   	</xsl:template>

	<xsl:template name="bottom_hash">
      	<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
         	<tbody>
				<!--VALOR RESUMEN-->
				<tr >
					<td align="right" colspan="3">
					<!--libre-->
					</td>
				</tr>
				<tr>
				
				<td><xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
						<xsl:if test="cbc:ID='2001'">
							<xsl:if test="cbc:PayableAmount!='0'">
								<font face="Arial, Helvetica, sans-serif" size="1"><strong>OPERACION SUJETA A PERCEPCIÓN DEL IGV</strong></font>
					 		</xsl:if>
						</xsl:if>
					</xsl:for-each>
				</td>
				</tr>
				<tr><td >
				            <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1004' and cbc:PayableAmount!=0">
									<left><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
									<b>   TRANSFERENCIA GRATUITA</b>
									</font></left>
								</xsl:if>
							</xsl:for-each>
								
								<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0.00'">
									<font color="#000000" size="4" face="Arial, Helvetica, sans-serif"> </font>
								</xsl:if>
							</td></tr>
			</tbody>
      	</table>


   	</xsl:template>

	<xsl:template name="timbre">
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:Documento/pe1:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:Documento/pe2:Nombre"/>
		<xsl:value-of select="'.jpg'"/>
	</xsl:template>

	<xsl:template name="nombreTed">
		<xsl:param name="text"/>
		<xsl:param name="largo" select="0"/>
		<xsl:variable name="largo_actual" select="string-length($text)"/>
		<xsl:choose>
			<xsl:when test="$largo_actual &gt;= $largo">
				<xsl:value-of select="$text"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="prefix" select="concat('0', $text)"/>
				<xsl:call-template name="nombreTed">
					<xsl:with-param name="text" select="$prefix"/>
					<xsl:with-param name="largo" select="$largo"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->