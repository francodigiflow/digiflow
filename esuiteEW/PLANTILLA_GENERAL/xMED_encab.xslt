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

                                   <xsl:if test="//cac:PartyName/cbc:Name = 'MEDITERRANEO'">
                                         <img src="logo_mediterraneo.png"/>									     							
								   </xsl:if>
								    <xsl:if test="//cac:PartyName/cbc:Name = 'DON BUFFET - MEDITERRANEO'">
                                         <img src="logo_buffet.jpg"/>									     							
								   </xsl:if>
							       <xsl:if test="$DatoAdicional12 = 'DB'">
                                                <img src="logo_buffet.jpg"/>									     							
                                   </xsl:if>
								   <xsl:if test="$DatoAdicional12 = 'CM'">
                                                <img src="logo_mediterraneo.png"/>									 
                                   </xsl:if>
								   <xsl:if test="$DatoAdicional12 = 'CM DB'">
                                                <img src="logo_mediterraneo.png"/>
												<br/><img src="logo_buffet.jpg"/>
                                   </xsl:if>
								   <!--<xsl:if test="$DatoAdicional12 = 'CM DB'">
                                                <img src="logo_mediterraneo.png"/>
												<br/><img src="logo_buffet.png"/>
                                   </xsl:if>-->

								   <xsl:if test="substring-before(/pe:Invoice/cbc:ID,'-')='F115' and substring-after(/pe:Invoice/cbc:ID,'-')='0000002'">
														 <img src="logo_mediterraneo.png"/>
												<br/><img src="logo_buffet.jpg"/>
													</xsl:if>
 								 <xsl:if test="substring-before(/pe:Invoice/cbc:ID,'-')='F115' and substring-after(/pe:Invoice/cbc:ID,'-')='0000003'">
														 <img src="logo_mediterraneo.png"/>
												<br/><img src="logo_buffet.jpg"/>
													</xsl:if>
													 <xsl:if test="substring-before(/pe:Invoice/cbc:ID,'-')='F115' and substring-after(/pe:Invoice/cbc:ID,'-')='0000004'">
														 <img src="logo_mediterraneo.png"/>
												<br/><img src="logo_buffet.jpg"/>
													</xsl:if>
													 <xsl:if test="substring-before(/pe:Invoice/cbc:ID,'-')='F115' and substring-after(/pe:Invoice/cbc:ID,'-')='0000005'">
														 <img src="logo_mediterraneo.png"/>
												<br/><img src="logo_buffet.jpg"/>
													</xsl:if>
													 <xsl:if test="substring-before(/pe:Invoice/cbc:ID,'-')='F115' and substring-after(/pe:Invoice/cbc:ID,'-')='0000006'">
														 <img src="logo_mediterraneo.png"/>
												<br/><img src="logo_buffet.jpg"/>
													</xsl:if>
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
												
		 										<xsl:if test="//cbc:UBLVersionID='2.0'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/></xsl:if>
										<xsl:if test="//cbc:UBLVersionID='2.1'">
		 										<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name"/></xsl:if>
		 										
											</strong>
										</font>
									</td>
								</tr>
								<tr>
									<td valign="middle" align="center">
									
											<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
		 								      <xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
											  <xsl:value-of select="//cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
                                              <br/>
											  LA MOLINA-LIMA
											  <br/>
											  <br/>


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

                            <xsl:if test="$DatoAdicional11 = ''">
							 <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													    <xsl:if test="pe:Codigo='01'">
												         <b> <xsl:value-of select="pe:Valor"/></b>
														  <br/>
											            </xsl:if>
													 </xsl:for-each>
													 <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													    <xsl:if test="pe1:Codigo='01'">
												         <b> <xsl:value-of select="pe1:Valor"/></b>
														  <br/>
											            </xsl:if>
													 </xsl:for-each>
													 <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													    <xsl:if test="pe2:Codigo='01'">
												          <b><xsl:value-of select="pe2:Valor"/></b>
														  <br/>
											            </xsl:if>
													 </xsl:for-each>
                                                    <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
													    <xsl:if test="pe:Codigo='02'">
												          <xsl:value-of select="pe:Valor"/>
											            </xsl:if>
													 </xsl:for-each>
													 <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
													    <xsl:if test="pe1:Codigo='02'">
												          <xsl:value-of select="pe1:Valor"/>
											            </xsl:if>
													 </xsl:for-each>
													 <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
													    <xsl:if test="pe2:Codigo='02'">
												          <xsl:value-of select="pe2:Valor"/>
											            </xsl:if>
													 </xsl:for-each>
							
                            </xsl:if>

							                      <xsl:if test="$DatoAdicional11 = 'SAP'">
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
							
                            </xsl:if>
							
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
											<xsl:if test="//cbc:UBLVersionID='2.0'">
											<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>
											</xsl:if>
											<xsl:if test="//cbc:UBLVersionID='2.1'">
														
										<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID,'#########','pen')"/>
											
										</xsl:if>
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
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20254053822-01-FF11-10331676.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->