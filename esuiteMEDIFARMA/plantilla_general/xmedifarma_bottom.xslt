<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

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
                      		PRODUCTOS DE ACERO CASADO
					  Autorizado mediante resolución XXXX " - Verifique documento: <strong>www.sunat.gob.pe</strong>
					 </font>			 
               </td>
               <td valign="top" width="10%" align="center"/>
            </tr>
         </tbody>
      </table>
   	</xsl:template>

	<xsl:template name="descripcion_cuentas">
		
	</xsl:template>

	<xsl:template name="bottom_hash">

		<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="2" width="100%">
				<tbody>
					<tr>
						<td width="100%" >
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>										
									<td align="center" width="40%">
										<xsl:call-template name="imp_timbre"/>
									</td>
								</tr>
								<tr>
									<td align="center" width="50%">
										<font face="Arial, Helvetica, sans-serif" size="1">
				                     		<br/><strong>Representación impresa de la
				                     		<xsl:call-template name="aviso"/></strong><br/>
											Autorizado mediante la resolución RS N° 374-2013
						                 </font>
									</td>
								</tr>
								<tr>
									<td align="center" width="50%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											Su comprobante electrónico podrá ser consultado en nuestra web: <strong>http://www.medifarma.com.pe/felec</strong>
										</font>
									</td>
								</tr>	
								<tr>
									<td align="center" width="50%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<br/>
											Este comprobante ha sido validado por OSE - Digiflow, Operador de Servicios Electrónicos <br/>
											Puede consultar el estado del comprobante en: <strong>http://consulta.ose.pe</strong>
										</font>
									</td>
								</tr>	
							</table>
						</td>
						
					</tr>
				</tbody>
		</table>
      	
   	</xsl:template>

	<xsl:template name="imp_timbre">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
		<tr>
			<td width="100%" align="right">
				<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td valign="top" align="center" width="100%" >
							<font face="Arial" size="1">
								<!-- <img width="100px" height="100px">
									<xsl:attribute name="src">
										<xsl:call-template name="timbre"/>
									</xsl:attribute>
								</img> -->
								<img width="100" height="100" align="center" src="data:image/*;base64,[ted_1]" />
							</font>
						</td>
					</tr>
					<tr>
            		</tr>
				</table>
			</td>
		</tr>
		</table>
	</xsl:template>

	<!--<xsl:template name="timbre">
		<xsl:call-template name="nombreTed">
			<xsl:with-param name="text" select="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID"/>
			<xsl:with-param name="largo" select="'11'"/>
		</xsl:call-template>
		<xsl:value-of select="'-'"/>
		<xsl:value-of select="//cbc:InvoiceTypeCode"/>
		<xsl:if test="/pe1:CreditNote">
			<xsl:value-of select="'07'"/>
		</xsl:if>
        <xsl:if test="/pe2:DebitNote">
			<xsl:value-of select="'08'"/>
		</xsl:if>
		<xsl:value-of select="'-'"/>
		<xsl:value-of select="/pe:Invoice/cbc:ID"/>
		<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
		<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
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
	</xsl:template>-->


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
            <xsl:when test="$largo_actual >= $largo">
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\20100018625&#x2D;01&#x2D;F001&#x2D;00401196.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->