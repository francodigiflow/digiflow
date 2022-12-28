<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
    xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
    xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
    xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
	xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
    xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
	xmlns:ccts="urn:un:unece:uncefact:documentation:2"
	exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="numColBl">
		<xsl:if test="/pe:Invoice!=''">
			<xsl:value-of select="23-count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote!=''">
			<xsl:value-of select="23-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote!=''">
			<xsl:value-of select="23-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>
	
	<xsl:include href="xnovopan_encab.xslt"/>
	<xsl:include href="xnovopan_detalle.xslt"/>
	<xsl:include href="xnovopan_bottom.xslt"/>
	<xsl:include href="xnovopan_datos.xslt"/>
	<xsl:include href="xnovopan_total.xslt"/>
	
	 	<xsl:template name="DatosCredito">
		<table width="100%" border="0" cellpadding="1" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
			<tr>
				<td>
				<strong>DATOS DE CUOTA: </strong>
				</td>				
			</tr>
			<tr>
				<td>
						<table width="50%" border="1" cellSpacing="0" borderColor="#000000" cellPadding="2" style="font-family :Arial,Helvetica,sans-serif;font-size:11px;color:#000000">
							<tr>
								<td width="15%" align="center" size="1">
										<strong>N° DE CUOTA</strong>
								</td>
								<td width="15%" align="center" size="1">
										<strong>MONTO</strong>
								</td>
								<td width="15%" align="center" size="1">
										<strong>FECHA VENCIMIENTO</strong>
								</td>
							</tr>
							<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
							<xsl:if test="cbc:ID !='Detraccion'">
								<xsl:if test="cbc:PaymentMeansID !='Credito'">	
									<xsl:if test="cbc:PaymentMeansID !='037'">
									<tr>
											
											<td width= "7%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
													<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
												</font>							
											</td>
											<td width= "12%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
													<!--<xsl:value-of select="cbc:Amount"/>-->
													<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
												</font>
											</td>
											<td width= "10%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
												<xsl:value-of select="cbc:PaymentDueDate"/>
												</font>
											</td>
									</tr>
									</xsl:if>
								</xsl:if>
							</xsl:if>
							</xsl:for-each>
							
							<xsl:for-each select="/pe1:CreditNote/cac:PaymentTerms">
							<xsl:if test="cbc:ID !='Detraccion'">
								<xsl:if test="cbc:PaymentMeansID !='Credito'">	
									<xsl:if test="cbc:PaymentMeansID !='037'">
										<tr>
												
												<td width= "7%" align="center">
													<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
														<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
													</font>							
												</td>
												<td width= "12%" align="center">
													<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
														<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
													</font>
												</td>
												<td width= "10%" align="center">
													<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
													<xsl:value-of select="cbc:PaymentDueDate"/>
													</font>
												</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:if>
							</xsl:for-each>
													
							<xsl:for-each select="/pe2:DebitNote/cac:PaymentTerms">
							<xsl:if test="cbc:PaymentMeansID !='Credito'">
							<xsl:if test="cbc:PaymentMeansID !='037'">
							<tr>
									
									<td width= "7%" align="center">
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
										</font>							
									</td>
									<td width= "12%" align="center">
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width= "10%" align="center">
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										<xsl:value-of select="cbc:PaymentDueDate"/>
										</font>
									</td>
							</tr>
							</xsl:if>
							</xsl:if>
							</xsl:for-each>
							

						</table>
				</td>
			</tr>
		</table>

	</xsl:template>


	
	<xsl:template match="/">
		<html xmlns:ccts="urn:un:unece:uncefact:documentation:2"
			xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
			xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		    xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
			xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
			xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
			xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
			xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
			xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
			xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2"
			xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
			xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2">

			<head><title>Comprobante Electrónico</title></head>
			<body>
				<table cellSpacing="1" width="100%" border="0">
					<tbody>
						<tr><td><xsl:call-template name="Encabezado"/></td></tr>
						<tr><td><xsl:call-template name="DatosReceptor"/></td></tr>
						<tr><td><xsl:call-template name="DetallesEncabezado"/></td></tr>
						<tr>
							<td>
								<table border="0" cellSpacing="0" cellPadding="0" width="100%" align="center" heigth="100%">
									<tbody>
										<tr>
											<td colspan="2">
												<table border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000">
													<tr><td><xsl:call-template name="son-pesos"/></td></tr>
												</table>
											</td>
										</tr>
										<tr><td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1"><br/></font></td></tr>
										<tr>
										<td>
						<table border="1" width="95%" cellpadding="1" cellspacing="0" bordercolor="#000000">
							<tr><td width="100%" align="char" border="1">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>OBSERVACIONES:</strong>
									<br/>- GARANTIA CUBIERTA PARA DEVOLUCIONES DE TABLEROS Y CANTOS.VALIDA POR DOS MESES
									<br/>- GIRAR CHEQUE A NOMBRE DE NOVOPAN PERU S.A.C.
									<br/>- NO SE AUTORIZA A ENTREGAR DINERO EN EFECTIVO A PERSONAL DE LA EMPRESA.
									<br/>
									<br> <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='09'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='09'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='09'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
									</br>
									
								<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
								<td>
									<xsl:call-template name="DatosCredito"/>
								</td>
								</xsl:if>
									
								</font>
								</td>
							</tr>
						</table>
								</td>
								<td width="30%"><xsl:call-template name="Total"/></td>
							</tr>
								<tr><td colspan="2">
									
									<xsl:call-template name="Transferencia"/>
						
								</td></tr>
										<!--<xsl:if test="/pe:Invoice!=''">
										<tr><td colspan="2"><xsl:call-template name="PreparadoPor"/></td></tr>
										</xsl:if>-->
									</tbody>
								</table>
							</td>
						</tr>
						
						
						<td width="85%">
							<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='10' and pe:Valor!='-'">
									<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
										<xsl:value-of select="pe:Valor"/>
									</xsl:if>
									</xsl:if>
								</xsl:for-each>
							</font>
						</td>
						
						<!--<tr><td><xsl:call-template name="DatosReferencia"/></td></tr>-->
						<tr>
						<td>
							<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
								<tbody>
									<tr heigth="100%">
										<td vAlign="top" width="70%" align="left">
											<xsl:call-template name="Referencia"/>
										</td>
										<td vAlign="top" width="30%">
										</td>
									</tr>

								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<xsl:choose>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
									<font size="1" face="Arial, Helvetica, sans-serif"/>
								</xsl:when>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font size="2" face="Arial, Helvetica, sans-serif"></font></xsl:when>
								<xsl:otherwise>
					    	<xsl:if test="/pe1:CreditNote"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>
					    	<xsl:if test="/pe2:DebitNote"> <font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>      
					    	</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<xsl:choose>
							<xsl:when test="/pe:Invoice or /pe2:DebitNote">
					<tr><td><xsl:call-template name="Leyenda"/></td></tr></xsl:when>
					</xsl:choose>
					<tr><td><xsl:call-template name="PreparadoPor"/></td></tr>
						<!--<xsl:if test="/pe1:CreditNote!= '' or /pe2:DebitNote!= '' ">
						<tr><td><xsl:call-template name="PreparadoPor"/></td></tr>
						</xsl:if>-->
					

						<!--<tr><td><xsl:call-template name="bottom_hash"/></td></tr>-->
					<tr width="100%">
								<td>
									<xsl:call-template name="bottom_hash"/>
								</td>
					</tr>
					<!--<tr>
						<td>
							<xsl:choose>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
									<font size="1" face="Arial, Helvetica, sans-serif"/>
								</xsl:when>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font size="1" face="Arial, Helvetica, sans-serif"></font></xsl:when>
								<xsl:otherwise>
					    	<xsl:if test="/pe1:CreditNote"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Motivo : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>
					    	<xsl:if test="/pe2:DebitNote"> <font size="1" face="Arial, Helvetica, sans-serif"><strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>      
					    	</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>-->
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:variable name="varDirEmis">
          <xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
		  <xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
		  <xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
    </xsl:variable>
</xsl:stylesheet>

<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="no" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\..\Anticipos Novopan\20381034071&#x2D;01&#x2D;F001&#x2D;00000052.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator=""/><scenario default="yes" name="Scenario2" userelativepaths="yes" externalpreview="yes" url="..\..\BDO\20106975737&#x2D;01&#x2D;F002&#x2D;00055413.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="Scenario3" userelativepaths="yes" externalpreview="no" url="..\..\Anticipos Novopan\20381034071&#x2D;01&#x2D;F001&#x2D;00000048.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="Scenario4" userelativepaths="yes" externalpreview="no" url="20381034071&#x2D;03&#x2D;B001&#x2D;00000002.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/><scenario default="no" name="Scenario5" userelativepaths="yes" externalpreview="no" url="..\..\Anticipos Novopan\20381034071&#x2D;01&#x2D;F001&#x2D;00000048.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20124148970&#x2D;08&#x2D;BB11&#x2D;30000011.xml" srcSchemaRoot="DebitNote" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="166" y="60"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="246" y="20"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/xsl:call&#x2D;template" x="166" y="20"/><block path="html/body/table/tbody/tr[4]/td/xsl:choose" x="86" y="60"/><block path="html/body/table/tbody/tr[4]/td/xsl:choose/=[0]" x="40" y="54"/><block path="html/body/table/tbody/tr[4]/td/xsl:choose/=[1]" x="40" y="82"/><block path="html/body/table/tbody/tr[4]/td/xsl:choose/xsl:otherwise/xsl:if" x="46" y="60"/><block path="html/body/table/tbody/tr[4]/td/xsl:choose/xsl:otherwise/xsl:if[1]" x="206" y="20"/><block path="html/body/table/tbody/tr[5]/td/xsl:call&#x2D;template" x="126" y="60"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->