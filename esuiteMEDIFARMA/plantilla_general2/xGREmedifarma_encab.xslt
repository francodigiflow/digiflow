<?xml version='1.0' encoding="iso-8859-1"?>

<!-- xsl:stylesheet version="1.0" 
				xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:DespatchAdvice-1" 
				xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
				xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
				xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
				xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
				xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
				exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi" -->

<!-- xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
				xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
				xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" -->

<xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" 
				xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
				xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
				xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
				xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
				xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				exclude-result-prefixes="cac cbc ccts ds ext pe  qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

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
			<!-- table cellSpacing="2" cellPadding="0" width="100%" border="0" -->
			<table border="0" width="100%" cellSpacing="0" cellPadding="2" borderColor="#000000">
				<tbody>
					<tr>
<!-- LOGO -->			<td>
							<!-- table cellSpacing="0" cellPadding="0" width="100%" border="0" -->
							<table border="0" width="100%" cellSpacing="0" cellPadding="0" borderColor="#000000">
								<tr>
									<td>
									
										<img src="data:image/*;base64,[logo_1]" width="220" height="100" />
									</td>
								</tr>
							</table>
						</td>
<!-- RZ y DIR EMISOR --><td align="center">
							<table cellSpacing="0" cellPadding="0" width="85%" border="0">
								<tr>
									<td align="center">
										<font size="3" face="Arial, Helvetica, sans-serif">
											<strong>MEDIFARMA S.A.</strong>
										</font>
										<br/>
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<br/>Jr. Ecuador N° 787 - Lima - Lima - Lima
											<br/>Central Telefónica:332-6200
											<br/>Fax: 431-9764</font>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="2">


			<table border="0" width="100%" cellSpacing="0" cellPadding="9" borderColor="#000000" >  <!--style="font-size: 18px; font-family: arial,helvetica,sans-serif; color: #000000;" -->
							
			<!-- table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000" -->
				<tr>
					<td vAlign="top" width="100%">
	
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td>
<!-- RazÍ³n Social Cliente -->			<tr>
											<td width="18%">
												<font face="Arial, Helvetica, sans-serif" size="0.1">
													<strong>RAZÓN SOCIAL</strong>
												</font>
											</td>
											<td width="82%">
												<font face="Arial, Helvetica, sans-serif" size="0.1">
													<strong>:</strong>&#xA0;
													<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												</font>
											</td>
										</tr>

<!-- DirecciÍ³n Fiscal del Cliente -->	<tr>
											<td width="18%">
												<font face="Arial, Helvetica, sans-serif" size="0.1">
													<strong>DIRECCIÓN</strong>
												</font>
											</td>
											<td width="82%">
												<font face="Arial, Helvetica, sans-serif" size="0.1">
													<strong>:</strong>&#xA0;
													<xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="27" /></xsl:call-template>
													 <!--  <xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/> -->
												</font>
											</td>
										</tr>
<!-- Tipo y RUC del Cliente -->			<tr>
											<td width="18%">
												<font face="Arial, Helvetica, sans-serif" size="0.1">
													<strong><xsl:call-template name="TipoDeDocumento" /></strong>
												</font>
											</td>
											<td width="82%">
												<font face="Arial, Helvetica, sans-serif" size="0.1">
													<strong>:</strong>&#xA0;
													
													<xsl:if test="//cbc:CustomizationID='2.0'">
	<xsl:value-of select="//cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
</xsl:if>
<xsl:if test="//cbc:CustomizationID='1.0'">
	<xsl:value-of select="//cac:DeliveryCustomerParty/cbc:CustomerAssignedAccountID"/>
</xsl:if>
												</font>
											</td>
										</tr>
<!-- CÍ³digo del  Cliente -->			<tr>
											<td width="18%">
												<font face="Arial, Helvetica, sans-serif" size="0.1">
													<strong>CÓDIGO</strong>
												</font>
											</td>
											<td width="82%">
												<font face="Arial, Helvetica, sans-serif" size="0.1">
													<strong>:</strong>&#xA0;
													<xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="18" /></xsl:call-template>
												</font>
											</td>
										</tr>
									</td>
								</tr>
							</table>

					</td>
				</tr>
			</table>


						</td>
					</tr>
				</tbody>
			</table>
		</p>
	</xsl:template>
	
	<xsl:template name="EncabezadoRecuadro">
	<table border="0" width="100%" cellpadding="0" cellspacing="2">
	   <tbody>
	      <tr>
		 
		     <td>
			    <table borderColor="#000000" cellSpacing="0" cellPadding="7" width="100%" border="1">
				   <tbody>
				      <tr>
					   <td valign="middle"><xsl:call-template name="imp_timbre"/></td>
					     <td vAlign="top" width="100%" align="center">
						    <font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
							   <br/>
							   <strong>R.U.C.: 
							   
							   <xsl:if test="//cbc:CustomizationID='2.0'">
								 <xsl:value-of select="format-number(//cac:SignatoryParty/cac:PartyIdentification/cbc:ID, '###########', 'pen')"/>
								</xsl:if>
								 <xsl:if test="//cbc:CustomizationID='1.0'">
								  <xsl:value-of select="format-number(//cac:DespatchSupplierParty/cbc:CustomerAssignedAccountID,'###########','pen')"/>
								</xsl:if>
							  
							  
							   <br/>
							   <br/>
							   <xsl:call-template name="tmpTipoComprobane"/>
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
	   </tbody>
	</table>
    </xsl:template>

	<!-- TIPO DE DOCUMENTO -->
	<xsl:template name="tmpTipoComprobane">
		<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">GUÍA DE REMISIÓN ELECTRÓNICA</font>
	</xsl:template>
	
	<!-- NRO DEL DOCUMENTO -->
	<xsl:template name="NFolio">
		<br/>Nº 
		<xsl:value-of select="substring-before(//cbc:ID,'-')"/>- 
		<xsl:value-of select="format-number(substring-after(//cbc:ID,'-'),'00000000')"/>
	</xsl:template>

	<!-- VALOR SEGUN NRO DE VARAIBLE -->
	<!-- xsl:template name="TraeValorVariable">
	  	<xsl:param name="varNumVA" />
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA"><xsl:if test="pe:Valor!='-'"><xsl:value-of select="pe:Valor"/></xsl:if></xsl:if>
		</xsl:for-each>
	</xsl:template -->

	<!-- xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template -->
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->