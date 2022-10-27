<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
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

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes" />

	<xsl:template name="Encabezado">
		<table cellSpacing="2" cellPadding="1" width="100%" border="0"  >
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="60%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="top" width="35%">
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
					<td width="65%" align="center">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td vAlign="top" align="left" width="10%">
										<!-- <img src="LogoIberostar.PNG" width="279" height="155"/> -->
										<img src="data:image/*;base64,[logo_1]" width="279" height="155"/>
									</td>
									<td align="center" valign="top" Width="90%">
										<strong>
											<font face="Times New Roman, sans-serif" size="4">
												<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											</font>
										</strong>
										<font face="Calibri, sans-serif" size="2">  
											<br/><xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
											<xsl:if test="$FLAG_R='0'">
												<br/><xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="13"/></xsl:call-template>
											</xsl:if>
											<xsl:if test="$FLAG_R='1'">
												<br/><xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="13"/></xsl:call-template>
											</xsl:if>
											<br/><br/>
										</font>
										<strong>
											<font face="Times New Roman, sans-serif" size="4">
												<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name"/>
											</font>
										</strong>
										<font face="Calibri, sans-serif" size="2"> 
											<xsl:if test="$FLAG_R='0'">
												<br/><xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="16"/></xsl:call-template>
												<br/><xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="12"/></xsl:call-template>
											</xsl:if>
											<xsl:if test="$FLAG_R='1'">
												<br/><xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="15"/></xsl:call-template>
												<br/><xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="14"/></xsl:call-template>
											</xsl:if>
										</font>
									</td>
									<!-- <td colspan="2" width="100%">
								
									<xsl:call-template name="DatosReceptor_FB"/>
									
									</td> -->
								</tr> 
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</p>
	</xsl:template>
	

	
	<xsl:template name="EncabezadoRecuadro">
		<table cellSpacing="0" width="100%" align="center" border="1" cellpadding="16" borderColor="#000000">
				<tr>
					<td width="100%" align="center">
						<br/>
						<strong>
							<font face="Arial, Helvetica, sans-serif" size="4">
							R.U.C. N°
							<xsl:value-of select="format-number(//cac:PartyIdentification/cbc:ID,'###########','pen')"/>
							<br/>
							<br/>
							<xsl:call-template name="tipodocu"/>
							<br/>
							<br/>
							<xsl:call-template name="NFolio"/>
							</font>
						</strong>
						<br/>
					</td>
				</tr>
		</table>
	</xsl:template>
	
	<xsl:template name="tipodocu">
			
		<xsl:if test="//cbc:UBLVersionID='2.1'">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">FACTURA ELECTRÓNICA</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRÓNICA</font>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote">
					<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE CRÉDITO ELECTRÓNICA</font>
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE DÉBITO ELECTRÓNICA</font>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:if>
	</xsl:template>



<xsl:template name="NFolio">
		<!-- <xsl:if test="//cbc:UBLVersionID='2.0'"> -->
		<!-- NÂº -->
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
	</xsl:template>
	
<xsl:template name="fecha_">
		<xsl:if test="/pe:Invoice">		
			<xsl:variable name="aa">
	        	<xsl:value-of select="substring-before(/pe:Invoice/cbc:IssueDate, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="mmdd">
	         	<xsl:value-of select="substring-after(/pe:Invoice/cbc:IssueDate, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="mm">
	         	<xsl:value-of select="substring-before($mmdd, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="dd">
	         	<xsl:value-of select="substring-after($mmdd, '-')"/>
	      	</xsl:variable>
	      	<xsl:value-of select="concat($dd, '/', $mm, '/' , $aa)"/>
		</xsl:if>

		<xsl:if test="/pe1:CreditNote">		
			<xsl:variable name="aa">
	        	<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:IssueDate, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="mmdd">
	         	<xsl:value-of select="substring-after(/pe1:CreditNote/cbc:IssueDate, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="mm">
	         	<xsl:value-of select="substring-before($mmdd, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="dd">
	         	<xsl:value-of select="substring-after($mmdd, '-')"/>
	      	</xsl:variable>
	      	<xsl:value-of select="concat($dd, '/', $mm, '/' , $aa)"/>
		</xsl:if>

		<xsl:if test="/pe2:DebitNote">		
			<xsl:variable name="aa">
	        	<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:IssueDate, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="mmdd">
	         	<xsl:value-of select="substring-after(/pe2:DebitNote/cbc:IssueDate, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="mm">
	         	<xsl:value-of select="substring-before($mmdd, '-')"/>
	      	</xsl:variable>
	      	<xsl:variable name="dd">
	         	<xsl:value-of select="substring-after($mmdd, '-')"/>
	      	</xsl:variable>
	      	<xsl:value-of select="concat($dd, '/', $mm, '/' , $aa)"/>
		</xsl:if>
</xsl:template>
	
	
	<xsl:template match="/">
		<html><head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\ATV\XML\desc&#x2D;01&#x2D;F105&#x2D;00005606.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->