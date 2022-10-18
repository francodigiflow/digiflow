<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="DatosCliente">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td vAlign="top" width="70%">
					<xsl:call-template name="DatosFiscales"/>
					</td>
					
					<td vAlign="top" width="30%">
					<xsl:call-template name="DatosTimbre"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
		<xsl:template name="EmisorReceptor">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td vAlign="top" width="50%">
					<xsl:call-template name="DatosEmisor"/>
					</td>
					
					<td vAlign="top" width="50%">
					<xsl:call-template name="DatosReceptor"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="DatosFiscales">
		<table border="0" width="100%" cellspacing="0" cellPadding="2"  rules="cols" 
		>
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="0" width="100%" cellSpacing="0" cellPadding="2" rules="none"
						style="border-collapse:separate;border-spacing: 1;border:solid #2F528F 2px;border-radius:10px;
						-moz-border-radius:10px;-webkit-border-radius: 5px;">
							<tbody>
								<tr>
									<td width="17%">
										<font face="Arial, Helvetica, sans-serif" size="1">
										
											<b>
												Datos Fiscales
											</b>
										</font>
									</td>
									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
								</font>
									</td>


									<td width="17%">
									</td>

									<td width="18%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											
										</font>
									</td>
								</tr>
								
									<tr>
									<td length="17%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Serie/Folio</b>
										</font>
									</td>
									<td length="18%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<strong><xsl:call-template name="NFolio"/></strong>
									</font>
										</td>
										<td length="17%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											
										</font>
									</td>
									<td length="18%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											
									</font>
										</td>
								</tr>
								<tr>
									<td length="17%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Divisa</b>
										</font>
									</td>
									<td length="18%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='01'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='01'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='01'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
										<td length="17%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> No Cte</b>
										</font>
									</td>
									<td length="18%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='02'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='02'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='02'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
								</tr>
									<tr align="left">
										<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Fecha Comprobante</b>
										</font>
									</td>
									<td length="25%" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
											<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
											<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
									</font>
										</td>
										<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Tasa Cambio</b>
										</font>
									</td>
									<td length="15%" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1"> :
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='03'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='03'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='03'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
								</tr>
								<tr>
										<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Pedido</b>
										</font>
									</td>
									<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='04'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='04'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='04'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
										<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Tipo Comprobante</b>
										</font>
									</td>
									<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											<xsl:call-template name="tipodocu"/>
									</font>
										</td>
								</tr>
									<tr>
									<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Certificado Emisor</b>
										</font>
									</td>
									<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='05'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='05'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='05'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
										<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> O.V/O.T</b>
										</font>
									</td>
									<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
																				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='06'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='06'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='06'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
								</tr>
								
								<tr>
										<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Regimen Fiscal</b>
										</font>
									</td>
									<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
																			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='07'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='07'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='07'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
										
									<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Lugar de Expedición</b>
										</font>
									</td>
									<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
																				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='08'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='08'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='08'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
								</tr>
								<tr>

										<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Condición de Pago</b>
										</font>
									</td>
									<td length="15%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='09'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='09'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='09'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
										<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Forma de Pago</b>
										</font>
									</td>
									<td length="25%" valign="top" align="left" >
										<font face="Arial, Helvetica, sans-serif" size="1">:
										<xsl:if test="//cac:PaymentTerms/cbc:ID='FormaPago' and //cac:PaymentTerms/cbc:PaymentMeansID='Contado'">
											Contado
											</xsl:if>
										<xsl:if test="//cac:PaymentTerms/cbc:ID='FormaPago' and //cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
											Credito
											</xsl:if>
									</font>
										</td>
								</tr>
								
									<tr>

										<td length="70%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>Método de Pago  </b>
										</font>
									</td>
									<td length="70%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='10'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='10'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='10'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
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
	</xsl:template>

	<xsl:template name="DatosTimbre">
		<table border="0" width="100%" cellspacing="0" cellPadding="2"  rules="cols">
						<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="0" width="100%" cellSpacing="0" cellPadding="2" rules="none"
						style="border-collapse:separate;border-spacing: 1;border:solid #2F528F 2px;border-radius:10px;
						-moz-border-radius:10px;-webkit-border-radius: 5px;">
							<tbody>
								<tr>
									<td width="30%">
										<font face="Arial, Helvetica, sans-serif" size="1">
										
											<b>
												Datos de timbrado
											</b>
										</font>
									</td>

								</tr>
								<tr>
									<td width="20%">
										<font face="Arial, Helvetica, sans-serif" size="1">
										
											<b>
												Nombre
											</b>
										</font>
									</td>
									<td width="20%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
								<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>&#xA0;
							</font>
								
									</td>

								</tr>
								<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>RFC</b>
										</font>
									</td>
									<td width="15%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
																				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='11'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='11'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='11'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
								</tr>
								
									<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>Certificado SAT</b>
										</font>
									</td>
									<td width="15%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
																				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='12'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='12'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='12'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
								</tr>
									<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>Folio Fiscal</b>
										</font>
									</td>
									<td width="15%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
																				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='13'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='13'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='13'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
								</tr>
									<tr>
									<td width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>F. Certif.CFDI </b>
										</font>
									</td>
									<td width="15%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='14'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='14'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='14'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
								</tr>
									<tr>
									<td width="15%"></td>
									<td width="15%"></td>
								</tr>
									<tr>
									<td width="15%"></td>
									<td width="15%"></td>
								</tr>
									<tr>
									<td width="15%"></td>
									<td width="15%"></td>
								</tr>
									<tr>
									<td width="15%"></td>
									<td width="15%"></td>
								</tr>
									<tr>
									<td width="15%"></td>
									<td width="15%"></td>
								</tr>
									<tr>
									<td width="15%"></td>
									<td width="15%"></td>
								</tr>
									<tr>
									<td width="15%"></td>
									<td width="15%"></td>
								</tr>
									<tr>
									<td width="15%"></td>
									<td width="15%"></td>
								</tr>
									<tr>
									<td width="15%"></td>
									<td width="15%"></td>
								</tr>
								
								
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		
		</table>
	</xsl:template>

	<xsl:template name="DatosEmisor">
	<br/>
		<table border="0" width="100%" cellspacing="0" cellPadding="2"  rules="cols">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="0" width="100%" cellSpacing="0" cellPadding="2" rules="none"
						style="border-collapse:separate;border-spacing: 1;border:solid #2F528F 2px;border-radius:10px;
						-moz-border-radius:10px;-webkit-border-radius: 5px;">
						<tbody>
								<tr>
									<td width="25%">
										<font face="Arial, Helvetica, sans-serif" size="1">
										
											<b>
												Emisor
											</b>
										</font>
									</td>
									<td width="25%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
								</font>
									</td>

								</tr>
								
									<tr>
									<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> RFC</b>
										</font>
									</td>
									<td length="25%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='15'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='15'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='15'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
								</tr>
								<tr>
									<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Nombre</b>
										</font>
									</td>
									<td length="25%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='16'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='16'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='16'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
											</tr>
								<tr>
									<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> </b>
										</font>
									</td>
									<td length="25%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										 
									</font>
										</td>
								</tr>
																<tr>
									<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> </b>
										</font>
									</td>
									<td length="25%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										 
									</font>
										</td>
								</tr>
								<tr>
									<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> </b>
										</font>
									</td>
									<td length="25%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										 
									</font>
										</td>
								</tr>
								<tr>
									<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> </b>
										</font>
									</td>
									<td length="25%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										 
									</font>
										</td>
								</tr>
																<tr>
									<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> </b>
										</font>
									</td>
									<td length="25%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										 
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

	<xsl:template name="DatosReceptor">
		<br/>
			<table border="0" width="100%" cellspacing="0" cellPadding="2"  rules="cols">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="0" width="100%" cellSpacing="0" cellPadding="2" rules="none"
						style="border-collapse:separate;border-spacing: 1;border:solid #2F528F 2px;border-radius:10px;
						-moz-border-radius:10px;-webkit-border-radius: 5px;"
						>
							<tbody>
								<tr>
									<td width="25%">
										<font face="Arial, Helvetica, sans-serif" size="1">
										
											<b>
												Receptor
											</b>
										</font>
									</td>
									<td width="25%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
								</font>
									</td>

								</tr>
								
									<tr>
									<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> RFC</b>
										</font>
									</td>
									<td length="25%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
											 
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='17'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='17'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='17'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
								</tr>
								<tr>
									<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Nombre</b>
										</font>
									</td>
									<td length="25%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
									
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='18'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='18'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='18'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									</font>
										</td>
											</tr>
								<tr>
									<td length="25%" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b> Uso CFDI</b>
										</font>
									</td>
									<td length="25%"  valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">:
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
										<xsl:if test="pe:Codigo='19'">
											<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='19'">
											<xsl:if test="pe1:Valor !='-'">
										<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='19'">
											<xsl:if test="pe2:Valor !='-'">
										<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
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
	</xsl:template>

	<xsl:template name="TraeValorVariable">
		<xsl:param name="varNumVA"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA">
				<xsl:if test="pe:Valor !='-' and pe:Valor !=''">
					<!--<xsl:value-of select="format-number(pe:Valor, '###,###,##0.00', 'pen')"/>-->
					<xsl:value-of select="pe:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$varNumVA">
				<xsl:if test="pe1:Valor !='-'">
					<xsl:value-of select="pe1:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$varNumVA">
				<xsl:if test="pe2:Valor !='-'">
					<xsl:value-of select="pe2:Valor"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\esuiteACI\xml\20492307298&#x2D;03&#x2D;B001&#x2D;00000107.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->