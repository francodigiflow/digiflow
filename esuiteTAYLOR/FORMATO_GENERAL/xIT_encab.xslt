<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="middle" width="20%">
						<!-- <xsl:call-template name="EncabezadoLogos"/>  -->
						<img src="data:image/*;base64,[logo_1]" />
					</td>
					<td vAlign="middle" width="55%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="middle" width="25%">
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
						<td vAlign="middle" width="100%" align="center">
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tbody>
									<tr/>
									<tr>
										<td width="100%" align="center">
											<!--<img  width="249px" height="127px" src="Logo_SIMSA.jpg"/>-->
											<!--<img src="D:\OneDrive\OneDrive - Digiflow. S.A\DGF\0PROYECTOS0\Propios\Taylor UBL 2.1 OSE CERT PROP IAN TAYLOR CERT DGF TAYLOR LOGISTIC Atilio UBL 2.1 ACTUALIZAR HOLDING PRODUCCION\Plantilla\2.1\emp_taylor.png"/>-->
											<!--Asignar icono empresa -->
											<!-- <img src="emp_taylor.png"/> -->
											
										</td>
									</tr>
									<tr>
										<td vAlign="middle" align="center">
											<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
												<strong>
													<xsl:choose>
														<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20109969452'">IAN TAYLOR PERU S.A.C.
												<br/>Agentes Generales, Remolcaje, Practicaje, Serv. Lanchas.
												</xsl:if>-->
														<xsl:when test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID = '20109969452'">IAN TAYLOR PERU S.A.C.
														<!--<br/>Agentes Generales, Remolcaje, Practicaje, Serv. Lanchas.-->
															<!--<br/>Agentes Generales, Practicaje, Serv. Lanchas, Ag.de Carga, Logistica--></xsl:when>
														<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20345286081'">TAYLOR LOGISTICS PERU S.A.C. 
													<br/>Forwarding - Project Forwarding - Transports 
												</xsl:if>-->
														<xsl:when test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID = '20345286081'">IAN TAYLOR AGENCIAS S.A.C.
															<br/>Agentes Generales, Practicaje, Serv. Lanchas, Ag.de Carga, Logistica</xsl:when>
															<!--<br/>Forwarding - Project Forwarding - Transports</xsl:when>-->
														<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20100025591'">
													EMPRESA ADMINISTRADORA CHUNGAR S.A.C.
												</xsl:if>
												<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20538848060'">
													EMPRESA ADMINISTRADORA CERRO S.A.C.
												</xsl:if> -->
													</xsl:choose>
												</strong>
											</font>
										</td>
									</tr>
									<xsl:choose>
										<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20109969452'">-->
										<xsl:when test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID = '20109969452'">
											<tr>
												<td vAlign="middle" align="center">
													<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Of. Miraflores: Av. Armendariz 480 oficina 502 - Miraflores - Central: (511-615-5000) 
													<br/>LIMA 18 - PERU
													<!--<br/>-->
														
													</font>
												</td>
											</tr>
											<!--</xsl:if>-->
										</xsl:when>
										<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20345286081'">-->
										<xsl:when test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID = '20345286081'">
											<tr>
												<td vAlign="middle" align="center">
													<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Of. Miraflores: Av. Armendariz 480 oficina 502 - Miraflores - Central: (511-615-5000)
														<br/>LIMA 18 - PERU
														<br/>Of. Callao: Av Oscar R. Benavides N° 3866, EC01-3B (Oficinas administrativas del Mall Plaza) Bellavista.
														</font>
												</td>
											</tr>
											<!--</xsl:if>-->
										</xsl:when>
									</xsl:choose>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>&#xA0;</td>
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
												<!--<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>-->
												<xsl:value-of select="format-number(//cac:PartyIdentification/cbc:ID,'###########','pen')"/>
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
						<font size="2" face="Arial, Helvetica, sans-serif"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="tipodocu">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">FACTURA ELECTRONICA</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRONICA</font>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote">
					<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">NOTA DE CREDITO ELECTRONICA</font>
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">NOTA DE DEBITO ELECTRONICA</font>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="NFolio">
		<br/>N°
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
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>

	<xsl:template name="EncabezadoLogos">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tbody>
			<tr>
				<td colSpan="2" width="100%" align="center">
					<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20109969452'">-->
					<xsl:choose>
					<xsl:when test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID = '20109969452'">
							<!--<img  width="249px" height="127px" src="Logo_SIMSA.jpg"/>-->
							<!--<img src="D:\OneDrive\OneDrive - Digiflow. S.A\DGF\0PROYECTOS0\Propios\Taylor UBL 2.1 OSE CERT PROP IAN TAYLOR CERT DGF TAYLOR LOGISTIC Atilio UBL 2.1 ACTUALIZAR HOLDING PRODUCCION\Plantilla\2.1\iantaylor_1.jpg"/>-->
							<!-- <img src="iantaylor_1.jpg"/> -->
							<img src="data:image/*;base64,[logo_2]" />
						<!--</xsl:if>-->
						</xsl:when>
					<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20345286081'">-->
					<xsl:when test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID = '20345286081'">
					<!--<img  width="249px" height="127px" src="Logo_SIMSA.jpg"/>-->
						<!--<img src="D:\OneDrive\OneDrive - Digiflow. S.A\DGF\0PROYECTOS0\Propios\Taylor UBL 2.1 OSE CERT PROP IAN TAYLOR CERT DGF TAYLOR LOGISTIC Atilio UBL 2.1 ACTUALIZAR HOLDING PRODUCCION\Plantilla\2.1\taylorlogistic_1.jpg"/>-->
						<!--<img src="taylorlogistic_1.jpg"/>-->

					<!--</xsl:if>-->
					</xsl:when>
					</xsl:choose><!--Asignar icono empresa -->
				</td>
			</tr>
			<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20109969452'">-->
			<xsl:choose>
			<xsl:when test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID = '20109969452'">
					<tr>
						<td width="50%" align="center">
							<!--<img  width="249px" height="127px" src="Logo_SIMSA.jpg"/>-->

							<!--<img src="D:\OneDrive\OneDrive - Digiflow. S.A\DGF\0PROYECTOS0\Propios\Taylor UBL 2.1 OSE CERT PROP IAN TAYLOR CERT DGF TAYLOR LOGISTIC Atilio UBL 2.1 ACTUALIZAR HOLDING PRODUCCION\Plantilla\2.1\loguito_1.png"/>-->
							<!-- <img src="loguito_1.png"/> -->
							<img src="data:image/*;base64,[logo_3]" />
							<!--Asignar icono empresa -->
						</td>
						<td width="50%" align="center">
							<!--<img  width="249px" height="127px" src="Logo_SIMSA.jpg"/>-->
							<!--<img src="D:\OneDrive\OneDrive - Digiflow. S.A\DGF\0PROYECTOS0\Propios\Taylor UBL 2.1 OSE CERT PROP IAN TAYLOR CERT DGF TAYLOR LOGISTIC Atilio UBL 2.1 ACTUALIZAR HOLDING PRODUCCION\Plantilla\2.1\loguito_2.png"/>-->
							<!-- <img src="loguito_2.png"/> -->
							<img src="data:image/*;base64,[logo_4]" />

							<!--Asignar icono empresa -->
						</td>
					</tr>
				<!--</xsl:if>-->
				</xsl:when>
				</xsl:choose>
			<tr>
				<xsl:choose>
					<!--<xsl:when test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20109969452'">-->
					<xsl:when test="//cac:SignatoryParty/cac:PartyIdentification/cbc:ID = '20109969452'">
							<td width="50%" align="center">
								<!--<img  width="249px" height="127px" src="Logo_SIMSA.jpg"/>-->
								<!--<img src="D:\OneDrive\OneDrive - Digiflow. S.A\DGF\0PROYECTOS0\Propios\Taylor UBL 2.1 OSE CERT PROP IAN TAYLOR CERT DGF TAYLOR LOGISTIC Atilio UBL 2.1 ACTUALIZAR HOLDING PRODUCCION\Plantilla\2.1\loguito_3.png"/>-->
								<!-- <img src="loguito_3.png"/> -->
								<img src="data:image/*;base64,[logo_5]" />
								<!--Asignar icono empresa -->
							</td>
							<td width="50%" align="center">
								<!--<img  width="249px" height="127px" src="Logo_SIMSA.jpg"/>-->
								<!--<img src="D:\OneDrive\OneDrive - Digiflow. S.A\DGF\0PROYECTOS0\Propios\Taylor UBL 2.1 OSE CERT PROP IAN TAYLOR CERT DGF TAYLOR LOGISTIC Atilio UBL 2.1 ACTUALIZAR HOLDING PRODUCCION\Plantilla\2.1\loguito_4.png"/>-->
								<!-- <img src="loguito_4.png"/> -->
								<img src="data:image/*;base64,[logo_6]" />
								<!--Asignar icono empresa -->
							</td>
						</xsl:when>
					<xsl:otherwise>
						<td width="100%" align="center"><!--<img  width="249px" height="127px" src="Logo_SIMSA.jpg"/>-->
							<!--<img src="D:\OneDrive\OneDrive - Digiflow. S.A\DGF\0PROYECTOS0\Propios\Taylor UBL 2.1 OSE CERT PROP IAN TAYLOR CERT DGF TAYLOR LOGISTIC Atilio UBL 2.1 ACTUALIZAR HOLDING PRODUCCION\Plantilla\2.1\loguito_5.png"/>--><!--Asignar icono empresa--> 
							<!-- <img src="loguito_5.png"/> -->
							<img src="data:image/*;base64,[logo_7]" />
						</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
		</tbody>
	</table>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\xml\20109969452&#x2D;01&#x2D;F008&#x2D;00003211.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->