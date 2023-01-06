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

	<xsl:template name="DatosTitulo">
	 <xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode ='01'">
		<xsl:if test="substring(/pe:Invoice/cbc:ID,1,1)='0'"><center>
		    <table cellpadding="5" cellspacing="4" >
				<td align="center">
				<font face="Arial, Helvetica, sans-serif" size="5" > 
			 Comprobante de pago emitido en contingencia</font>
			  </td>
			 </table></center>
		</xsl:if>

		</xsl:if>
	 <xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode ='03'">
		<xsl:if test="substring(/pe:Invoice/cbc:ID,1,1)='0'"><center>
		    <table cellpadding="5" cellspacing="4" >
				<td align="center">
				<font face="Arial, Helvetica, sans-serif" size="5" > 
			 Comprobante de pago emitido en contingencia</font>
			  </td>
			 </table></center>
		</xsl:if>

		</xsl:if>

	</xsl:template>

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
		<table cellSpacing="0" border="0"  style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000" >
			
			<tr>
			
				<td valign="top" align="center" width="90%">
					<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td align="center">
										<!-- <img src="C:\esuite_suc\config\par\CAA.jpg" height="110" /> -->
										<img src="data:image/*;base64,[logo_1]" height="100" />
									</td>
								</tr>
								
							</tbody>
						</table>
				</td>
				<td valign="middle" width="10%" align="right">
					<font face="Times New Roman, sans-serif" size="5">
                        <strong>
							<br/>
							
							<br/>
						</strong>
                    </font>
					<!-- <font face="Calibri, sans-serif" size="1">                       	 -->
							<!-- <xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/> -->
							<!-- <br/><xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="02"/></xsl:call-template> -->
							<!-- <br/><xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="03"/></xsl:call-template> -->
							<!-- <br/> -->
					<!-- </font> -->
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
		<!--borderColor="#000000"-->
		<table cellSpacing="0" width="100%" align="center" border="1" cellpadding="16" borderColor="#000000">
			<tr>
				<td width="100%" align="center">
						<br/>
						<strong><font face="Arial, Helvetica, sans-serif" size="4">
							R.U.C. N°
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>
							</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:value-of select="format-number(//cac:PartyIdentification/cbc:ID,'###########','pen')"/>
							</xsl:if>
												<br/>
												<br/>
												
												<xsl:call-template name="tipodocu"/>
												<br/>
												<br/>
												<xsl:call-template name="NFolio"/></font>
						</strong>
						<br/>
				</td>
			</tr>
		</table>
	</xsl:template>
		<xsl:template name="tipodocu">
		<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode ='01'">
		<xsl:if test="substring(/pe:Invoice/cbc:ID,1,1)='0'">
		     FACTURA
		</xsl:if>
		<xsl:if test="substring(/pe:Invoice/cbc:ID,1,1)='F'">
		     FACTURA ELECTRÓNICA
		</xsl:if>
		</xsl:if>
		<!--<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode ='01'">
		<xsl:value-of select="substring(/pe:Invoice/cbc:ID,'F')"/>
		FACTURA ELECTRÃ“NICA
		</xsl:if>
		-->
		<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode ='03'">
		<xsl:if test="substring(/pe:Invoice/cbc:ID,1,1)='0'">
		     BOLETA
		</xsl:if>
		<xsl:if test="substring(/pe:Invoice/cbc:ID,1,1)='B'">
		     BOLETA DE VENTA ELECTRÓNICA
		</xsl:if>
		</xsl:if>
			<xsl:if test="/pe1:CreditNote">NOTA DE CRÉDITO</xsl:if>
			<xsl:if test="/pe2:DebitNote">NOTA DE DÉBITO</xsl:if>
			
	</xsl:template>

	<xsl:template name="NFolio">
		Nº
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
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="20334403166&#x2D;01&#x2D;F002&#x2D;00064888.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->