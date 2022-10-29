<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="middle" width="68%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="top" width="32%">
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
					<td width="40%" align="center">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td align="left">
									 <xsl:variable name="DatoAdicional12">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='12'">
											<xsl:value-of select="pe:Valor"/> 
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='12'">
											<xsl:value-of select="pe1:Valor"/> 
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='12'">
											<xsl:value-of select="pe2:Valor"/> 
									</xsl:if>
								</xsl:for-each>
							</xsl:variable>
                                                <img src="logo_buffet.jpg"/>									 
                                
 								
									</td>
								</tr>
								
							</tbody>
						</table>
					</td>
					<td valign="middle" width="60%" align="center">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td valign="middle" align="center">
										<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
											<strong>
												
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 										
											</strong>
										</font>
									</td>
								</tr>
								<tr>
									<td valign="middle" align="center">
									
											<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
		 								      <xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                              <br/>
											  LA MOLINA-LIMA
											  <br/>
											  <br/>
                                              AV. LOS LIRIOS NRO. 301 INT. REF (PCS-4010 CENTRO COMERCIAL MALL SUR) 
											  <br/>
												LIMA - LIMA - SAN JUAN DE MIRAFLORES
                             <xsl:variable name="DatoAdicional11">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='11'">
											<xsl:value-of select="pe:Valor"/> 
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='11'">
											<xsl:value-of select="pe1:Valor"/> 
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='11'">
											<xsl:value-of select="pe2:Valor"/> 
									</xsl:if>
								</xsl:for-each>
							</xsl:variable>

                          
													
							


							
                                                    <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													    <xsl:if test="pe:Codigo='13'">
												          <xsl:value-of select="pe:Valor"/>
											            </xsl:if>
												  </xsl:for-each>
												  
                                                    <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													    <xsl:if test="pe1:Codigo='13'">
												          <xsl:value-of select="pe1:Valor"/>
											            </xsl:if>
												  </xsl:for-each>
												  
                                                    <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													    <xsl:if test="pe2:Codigo='13'">
												          <xsl:value-of select="pe2:Valor"/>
											            </xsl:if>
												  </xsl:for-each>
							
                           
							
											</font>				
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>&#160; </td>
				</tr>
			</tbody>
		</table>
	</p>
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
	<table cellSpacing="0" cellPadding="0" width="100%" border="1">
		<tbody>
			<tr>
				<td>
					<table borderColor="#000000" cellSpacing="0" cellPadding="15" width="100%" border="1">
						<tbody>
							<tr>
								<td vAlign="top" width="100%" align="center">
									<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
										<strong>R.U.C.: 
											<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>
											<br/>
											<br/>
											<xsl:call-template name="tipodocu"/>
											<br/>
											<xsl:call-template name="NFolio"/>
										</strong>
										
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center">
					<font size="2" face="Arial, Helvetica, sans-serif"><!-- <strong>SUNAT- CENTRO LIMA</strong> --></font>
				</td>
			</tr>
		</tbody>
	</table>
	</xsl:template>

<xsl:template name="tipodocu">
	<xsl:choose>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
			<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">FACTURA ELECTRONICA</font>
		</xsl:when>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRONICA</font></xsl:when>
		<xsl:otherwise>
         <xsl:if test="/pe1:CreditNote"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE CREDITO ELECTRONICA</font></xsl:if>
         <xsl:if test="/pe2:DebitNote"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE DEBITO ELECTRONICA</font></xsl:if>      
      </xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!--
<xsl:template name="NFolio">
	<br/>Nº 
	<xsl:value-of select="/pe:Invoice/cbc:ID"/>
	<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
	<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
	<br/>
</xsl:template>
-->
	<xsl:template name="NFolio">
		<br/>Nº 
		<xsl:if test="/pe:Invoice">
		<xsl:value-of select="substring-before(/pe:Invoice/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe:Invoice/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
		<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe1:CreditNote/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
		<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe2:DebitNote/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<br/>
	</xsl:template>



<xsl:template match="/">
	<html><head></head>
		<body/>
	</html>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->