<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" 
								xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
								xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" 
								xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" 
								xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" 
								xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
								xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
								xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
								xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
								xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
								xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
								xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
								xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
								xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
								exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0" class="redondeo">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="2%" rowspan="2">
					</td>
					<td vAlign="top" width="38%" rowspan="2">
					<br/><br/>
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
					<td vAlign="top" width="2%" rowspan="2">
					</td>
					<td vAlign="middle" width="48%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>					
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:variable name="Logo_emp">
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo='01'">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo='01'">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo='01'">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:template name="EncabezadoPeru">
		<p>
			<table cellSpacing="2" cellPadding="0" width="100%" border="0">
				<tbody>
					<tr>
						<td width="100%" align="center">
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tbody>
									<tr>
										<td width="100%" align="center">
										<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tbody>
										<tr>
											<td valign="middle" align="left">
												<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
												<img src="data:image/*;base64,[logo_1]" width="265px" heigth="135px" />
												<br/><b>
												<xsl:value-of select="substring-before(//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line, '|')"/></b>										
												<br/>E-mail: 
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
												</font>
											</td>	
											<td align="left" width="45%">
											<!-- <img src="Logo_Corporativo-01.jpg"  width="230px"/> -->
											<xsl:if test="$Logo_emp='CARMEL'">
												<img src="data:image/*;base64,[logo_2]" width="230px"  heigth="135px" />
											</xsl:if>
											<xsl:if test="$Logo_emp='PACIFIKA'">
												<img src="data:image/*;base64,[logo_3]" width="230px"  heigth="135px" />
												<!--<img src="C:\GenerarPDF\esuiteELEDE\LOGOS\PCFK.png" width="230px"  heigth="135px" />-->
											</xsl:if>
											
											</td>
										</tr>
										<tr>
											<td valign="middle" align="left" colspan="2" >
											<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
													<!-- <xsl:value-of select="substring-before(/pe:Invoice/cbc:IssueDate, '-')"/> -->
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='03'">
															<xsl:value-of select="substring-before(pe:Valor, '|')"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='03'">
															<xsl:value-of select="substring-before(pe1:Valor, '|')"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='03'">
															<xsl:value-of select="substring-before(pe2:Valor, '|')"/>
														</xsl:if>
													</xsl:for-each>
												<br/>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='04'">
															<xsl:value-of select="substring-before(pe:Valor, '|')"/>															
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
														<xsl:if test="pe1:Codigo='04'">
															<xsl:value-of select="substring-before(pe1:Valor, '|')"/>
														</xsl:if>
													</xsl:for-each>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
														<xsl:if test="pe2:Codigo='04'">
															<xsl:value-of select="substring-before(pe2:Valor, '|')"/>
														</xsl:if>
													</xsl:for-each>												
											</font>
											</td>

										</tr>
										
								</tbody>
							</table>
						</td>
					
					</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</p>
	</xsl:template>
<!--colocar la validacion aqui-->
			<xsl:variable name="VersionUbl">
				<xsl:value-of select="0"/>
				<xsl:choose>
                        <!--UBL2.0 -->
                        <xsl:when test="//cbc:UBLVersionID != '2.1'">
                        <xsl:value-of select="0"/>
                        </xsl:when>
                        
						<!--UBL2.1 -->
                        <xsl:when test="//cbc:UBLVersionID = '2.1'">
                                    <xsl:value-of select="1"/>
                        </xsl:when>
				</xsl:choose>
    </xsl:variable>

	<xsl:template name="EncabezadoRecuadro">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0" class="redondeo">
			<tbody>
				<tr>
					<td>
						<table border="0" width="100%" cellpadding="0" cellspacing="0" heigth="100%" rules="none">	
							<tbody>
								<tr>
									<td vAlign="top" width="100%" align="center">
										<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
											<br/>
											<strong>R.U.C.: 
												<xsl:if test="$VersionUbl='01'">
														<xsl:value-of select="(//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID)"/>							
												
													</xsl:if>
                           						 <xsl:if test="$VersionUbl!='01'">
												
													 <xsl:value-of select="(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID)"/>
												</xsl:if>
												<br/>
												<br/>
												<xsl:call-template name="tipodocu"/>
												<br/>
												<xsl:call-template name="NFolio"/>
												<br/>
											</strong>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<!--<tr>
					<td align="center">
						<font size="2" face="Arial, Helvetica, sans-serif"> <strong>SUNAT- CENTRO LIMA</strong> </font>
					</td>
				</tr>-->
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="tipodocu">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">FACTURA ELECTRONICA</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRONICA</font></xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote"><font color="#000000" size="5" face="Arial, Helvetica, sans-serif">NOTA DE CREDITO ELECTRONICA</font></xsl:if>
				<xsl:if test="/pe2:DebitNote"><font color="#000000" size="5" face="Arial, Helvetica, sans-serif">NOTA DE DEBITO ELECTRONICA</font></xsl:if>      
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

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