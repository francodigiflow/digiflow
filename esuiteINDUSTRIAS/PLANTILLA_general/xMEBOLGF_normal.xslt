<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2"
                exclude-result-prefixes="cac cbc ccts ds ext fo pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN=""/>

	<xsl:variable name="numColBl">
		<xsl:if test="/pe:Invoice!=''">
			<xsl:value-of select="18-count(/pe:Invoice/cac:InvoiceLine)"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote!=''">
			<xsl:value-of select="14-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote!=''">
			<xsl:value-of select="14-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
		</xsl:if>
	</xsl:variable>
	
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



	<xsl:include href="xMEBOLGF_encab.xslt"/>
	<xsl:include href="xMEBOLGF_datos.xslt"/>
	<xsl:include href="xMEBOLGF_detalle.xslt"/>
	<xsl:include href="xMEBOLGF_bottom.xslt"/>
	<xsl:include href="xMEBOLGF_total.xslt"/>

	<xsl:template match="/">

		<html xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
		      xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
		      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
		      xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
		      xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2"
		      xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2">

			<head>
				<title>Comprobante Electrónico</title>
				<style type="text/css">.redondeo {
				border-radius: 16px 16px 16px 16px;
				-moz-border-radius: 16px 16px 16px 16px;
				-webkit-border-radius: 16px 16px 16px 16px;
				border: 2px solid #000000;
				}
				.redondeo_deta{
				border-radius: 16px 16px 16px 16px;
				-moz-border-radius: 16px 16px 16px 16px;
				-webkit-border-radius: 16px 16px 16px 16px;
				border: 1px solid #000000;
				border-collapse: collapse;
				}</style>
			</head>
			<body>
				<table cellSpacing="1" width="100%" border="0">
					<thead style="display: table-header-group">
						<tr>
							<th>
								<xsl:call-template name="Encabezado"/>
							</th>
						</tr>
						<tr>
							<th>
								<xsl:call-template name="tmpDatosReceptor"/>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<xsl:call-template name="tmpDetalle"/>
							</td>
						</tr>
						<tr>
							<td>&#xA0;</td>
						</tr>
						<xsl:if test="$tipoDoc = '40'">
							<tr>
								<td>
									<xsl:call-template name="tmpInformacionAdicExportacion"/>
								</td>
							</tr>
							<tr>
								<td>&#xA0;</td>
							</tr>
						</xsl:if>
						<tr>
							<td>
								<xsl:call-template name="tmpTotal"/>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:call-template name="Referencia"/>
								<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
								<xsl:choose>
									<xsl:when test="$tipoDoc = '40'">
										
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="DatosCredito"/>
									</xsl:otherwise>
								</xsl:choose>
								
								
								</xsl:if>
							</td>
						</tr>
						<tr width="100%">
							<td>
								<xsl:call-template name="bottom_hash"/>
							</td>
						</tr>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\XML\20601199557&#x2D;07&#x2D;F004&#x2D;00000035.MEBOLGF.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="321" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="201" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="161" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="281" y="69"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->