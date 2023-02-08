<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:variable name="VersionUbl">
		<xsl:value-of select="0"/>
		<xsl:choose>
			<!--UBL2.0 -->
			<xsl:when test="/pe:Invoice/cbc:UBLVersionID != '2.1' or /pe1:CreditNote/cbc:UBLVersionID != '2.1' or /pe2:DebitNote/cbc:UBLVersionID != '2.1' ">
				<xsl:value-of select="0"/>
			</xsl:when>
			<!--UBL2.1 -->
			<xsl:when test="/pe:Invoice/cbc:UBLVersionID = '2.1' or /pe1:CreditNote/cbc:UBLVersionID = '2.1' or /pe2:DebitNote/cbc:UBLVersionID = '2.1' ">
				<xsl:value-of select="1"/>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="60%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="top" width="40%">
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
					<td width="60%" align="center" colspan="2">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td align="left" width="100%">
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20261677955' or //cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID= '20261677955'">
											<xsl:variable name="ValorDate">
												<xsl:call-template name="Fecha"/>
											</xsl:variable>
										<!--MaYOR-->
											<xsl:if test="$ValorDate &gt;'20180412'">
						<!--<img src="logo_nexa.jpg" width="266px" height="87px"/>-->
			<img src="data:image/*;base64,[logo_1]"  width="266px" height="87px" />
											</xsl:if>
											<xsl:if test="$ValorDate &lt;= '20180412'">
						<!--	<img src="logo_voto.jpg" />-->
			<img src="data:image/*;base64,[logo_4]"  width="266px" height="87px" />
											</xsl:if>
										</xsl:if>	
									</td>
								</tr>
								<tr>
									<td align="left" width="100%">
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20261677955' or //cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID= '20261677955' ">
											<xsl:variable name="ValorDate">
												<xsl:call-template name="Fecha"/>
											</xsl:variable>
										<!--MaYOR-->
											<xsl:if test="$ValorDate &gt;'20180412'">
												<font size="3" face="Arial, Helvetica, sans-serif">
													<b>Nexa Resources Cajamarquilla S.A.</b>
												</font>													
											</xsl:if>
										<!--MENOR-->
											<xsl:if test="$ValorDate &lt;= '20180412'">
												Votorantim Metais Cajamarquilla S.A.<br/>
											</xsl:if>
											<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
												<br/>Carretera Central Alt. Km. 9.5 Desvio Huachipa,Cajamarquilla,Lurigancho-Chosica, Lima-Perú.
												<br/>Casilla Postal: 43-0015, Telf: (511)317-2200 Fax: (511)317-2224
											</font>
										</xsl:if>		
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
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tbody>
			<tr>
				<td>
					<table borderColor="#000000" cellSpacing="0" cellPadding="10" width="100%" border="2">
						<tbody>
							<tr>
								<td vAlign="top" width="100%" align="center">
									<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">
										<strong>R.U.C. 
											<xsl:value-of select="(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID)"/>
											<!--UBL2.1 -->
											<xsl:value-of select="(//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID)"/>
											<br/>
											<br/>
											<xsl:call-template name="tipodocu"/>
											<br/>
											<xsl:call-template name="NFolio"/>
										</strong>
										<br/>
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
				<font color="#000000" size="5" face="Arial, Helvetica, sans-serif">FACTURA ELECTRONICA</font>
			</xsl:when>

			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="5" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRONICA</font></xsl:when>
			<xsl:otherwise>
         	<xsl:if test="/pe1:CreditNote"><font color="#000000" size="3" face="Arial, Helvetica, sans-serif">NOTA DE CREDITO ELECTRONICA</font></xsl:if>
         	<xsl:if test="/pe2:DebitNote"><font color="#000000" size="3" face="Arial, Helvetica, sans-serif">NOTA DE DEBITO ELECTRONICA</font></xsl:if>      
      	</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

<xsl:template name="aviso">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Factura Electrónica</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Boleta de Venta Electrónica</font></xsl:when>
			<xsl:otherwise>
         	<xsl:if test="/pe1:CreditNote"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Nota de Crédito Electrónica</font></xsl:if>
         	<xsl:if test="/pe2:DebitNote"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Nota de Débito Electrónica</font></xsl:if>      
      	</xsl:otherwise>
		</xsl:choose>
</xsl:template>


<xsl:template name="Fecha">
			<xsl:if test="/pe:Invoice">
				<xsl:variable name="date1" select="substring-before(/pe:Invoice/cbc:IssueDate,'-')"/>
				<xsl:variable name="date2" select="substring-before(substring-after(/pe:Invoice/cbc:IssueDate,'-'),'-')"/>
				<xsl:variable name="date3" select="substring-after(substring-after(/pe:Invoice/cbc:IssueDate,'-'),'-')"/>
				<xsl:value-of select="concat($date1,$date2,$date3)"/>
			</xsl:if>
			<xsl:if test="/pe1:CreditNote">
				<xsl:variable name="date1" select="substring-before(/pe1:CreditNote/cbc:IssueDate,'-')"/>
				<xsl:variable name="date2" select="substring-before(substring-after(/pe1:CreditNote/cbc:IssueDate,'-'),'-')"/>
				<xsl:variable name="date3" select="substring-after(substring-after(/pe1:CreditNote/cbc:IssueDate,'-'),'-')"/>
				<xsl:value-of select="concat($date1,$date2,$date3)"/>
			</xsl:if>
			<xsl:if test="/pe2:DebitNote">
				<xsl:variable name="date1" select="substring-before(/pe2:DebitNote/cbc:IssueDate,'-')"/>
				<xsl:variable name="date2" select="substring-before(substring-after(/pe2:DebitNote/cbc:IssueDate,'-'),'-')"/>
				<xsl:variable name="date3" select="substring-after(substring-after(/pe2:DebitNote/cbc:IssueDate,'-'),'-')"/>
				<xsl:value-of select="concat($date1,$date2,$date3)"/>
			</xsl:if>


</xsl:template>









<xsl:template name="NFolio">
	<br/>Nº 
	<xsl:value-of select="/pe:Invoice/cbc:ID"/>
	<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
	<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
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