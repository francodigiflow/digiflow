<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="tmpImporteLetras">
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="100%" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>SON :</strong>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
							<xsl:if test="cbc:ID='1000'">
								<xsl:value-of select="cbc:Value"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']"/>
						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:if test="//ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional[pe:Codigo='03' and pe:Valor='E'] or /pe:Invoice/cbc:ID='F004-00002825' or /pe:Invoice/cbc:ID='F004-00002826'">
						<br/>
						<strong>SAY :</strong>
							
							
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='19'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='19'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='19'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						</xsl:if> 
						
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<xsl:if test="$tipoDoc = '40'">
								<br/>
								<strong>SAY :</strong>
								<xsl:if test="/pe:Invoice/cbc:ID='F004-00002825'">
								TWENTYNINE THOUSAND FOUR HUNDRED SIXTY TWO AND 93/100 US DOLLARS
							</xsl:if>

							<xsl:if test="/pe:Invoice/cbc:ID='F004-00002826'">
								FORTY TWO THOUSAND SEVEN HUNDRED THIRTY FOUR AND 31/100 US DOLLARS
							</xsl:if>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='19'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='19'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='19'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
								</xsl:if>								
							</xsl:if>						 						
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<!-- TMP ANTICIPOS -->
	<xsl:template name="tmpAnticipo">
	<table   borderColor="#000000" cellSpacing="0" cellPadding="1" width="45%" style="border-top: black 1px solid; border-right: black 1px solid; border-collapse: collapse; border-bottom: black 1px solid; border-left: black 1px solid;">
		<tr>
			<td  style="border:solid 1px black;background-color:#C0C0C0" align="center" colspan="3">
				<b>
					<font  face="Arial, Helvetica, sans-serif" size="1">DOCUMENTOS ANTICIPOS</font>
				</b>
			</td>
		</tr>
		<tr>
			<td width="12%" style="border:solid 1px black;background-color:#C0C0C0" align="center">
				<b>
					<font  face="Arial, Helvetica, sans-serif" size="1">DENOMINACI?N</font>
				</b>
			</td>
			<td width="12%" style="border:solid 1px black;background-color:#C0C0C0" align="center">
				<b>
					<font  face="Arial, Helvetica, sans-serif" size="1">NRO. DOCUMENTO</font>
				</b>
			</td>
			<td width="11%" style="border:solid 1px black;background-color:#C0C0C0" align="center">
				<b>
					<font  face="Arial, Helvetica, sans-serif" size="1">MONTO</font>
				</b>
			</td>
		</tr>
		<xsl:for-each select="//cac:PrepaidPayment">
		<tr>
			<td style="border:solid 1px" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:choose>
						<xsl:when test="//cac:PrepaidPayment/cbc:ID/@schemeID='02'">FACTURA ELECTR?NICA</xsl:when>
						<xsl:when test="//cac:PrepaidPayment/cbc:ID/@schemeID='03'">BOLETA ELECTR?NICA</xsl:when>
						<xsl:otherwise>Documento NN</xsl:otherwise>
					</xsl:choose>
				</font>
			</td>
			<td style="border:solid 1px" align="center">
				
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:value-of select="substring-before(cbc:ID,'-')"/>- 
					<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
				</font>
			</td>
			<td style="border:solid 1px" align="right">

				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:value-of select="format-number(cbc:PaidAmount,'###,###,##0.00','pen')"/>
				</font>
			</td>
		</tr>
		</xsl:for-each>
	</table>
		<br/>
	</xsl:template>


	<xsl:template name="tmpPieComprobante_FB">
		<table border="0" width="100%">

			<tr>
				<td width="100%" valign="top" align="justify">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:choose>
							<xsl:when test="//ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional[pe:Codigo='03' and pe:Valor='E'] or /pe:Invoice/cbc:ID='F004-00002825' or /pe:Invoice/cbc:ID='F004-00002826'">
							</xsl:when>
							<xsl:otherwise>
								** MEBOL SAC es agente de RETENCION. **
							</xsl:otherwise>
						</xsl:choose>
					</font>
				</td>
			</tr>
			<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode!='03'">
			<tr>
				<td width="100%" valign="top" align="justify">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>OBSERVACIONES: </strong>
					</font>
				</td>
			</tr>
			<tr>
				<td width="100%" valign="top" align="justify">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='20'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='20'">

									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='20'">

									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
					</font>
				</td>
			</tr>
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='21'">
								<tr>
									<td width="100%" valign="top" align="justify">
										<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:value-of select="pe:Valor"/>
										</font>
									</td>
								</tr>
								</xsl:if>
							</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='22'">
								<tr>
									<td width="100%" valign="top" align="justify">
										<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:value-of select="pe:Valor"/>
										</font>
									</td>
								</tr>
								</xsl:if>
							</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='23'">
								<tr>
									<td width="100%" valign="top" align="justify">
										<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:value-of select="pe:Valor"/>
										</font>
									</td>
								</tr>
								</xsl:if>
							</xsl:for-each>
			</xsl:if>
			<tr>
					<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID='2003' and cbc:PayableAmount!='0.00'">
								OPERACI?N SUJETA AL SISTEMA DE PAGO DE OBLIGACIONES TRIBUTARIAS
							</xsl:if>
						</xsl:for-each>
						<br/>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
							<xsl:if test="cbc:ID='3001' and cbc:Value!=''">
								CUENTA DE DETRACCI?N BANCO DE LA NACI?N: <xsl:value-of select="cbc:Value"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:if test="//cbc:Note[@languageLocaleID='2006']!=''">
							OPERACI?N SUJETA AL SISTEMA DE PAGO DE OBLIGACIONES TRIBUTARIAS<br/>
							CUENTA DE DETRACCI?N BANCO DE LA NACI?N: <xsl:value-of select="$DetraCuenta"/>
						</xsl:if>
					</font>
				</td>
			</tr>
			<tr>
				<td width="50%" valign="top" align="left">
					<xsl:if test="//cac:PrepaidPayment/cbc:PaidAmount!=''">	
						<xsl:call-template name="tmpAnticipo"/>
					</xsl:if>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="tmpPieComprobante_NCND">
		<table border="0" width="100%">
			<tr>
				<td width="50%" valign="top">
					<xsl:if test="/pe1:CreditNote">
					<xsl:call-template name="tmpMotivoEmisionNC"/>
					</xsl:if>					
				</td>
				<td width="10%"/>
				<td width="40%" valign="top">
					<xsl:call-template name="DocumentoReferencia"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					&#xA0;
				</td>
			</tr>
			<tr>
				<td width="100%" valign="top" align="left" colspan="3">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>OBSERVACIONES: </strong>
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
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="tmpMotivoEmisionNC">
	<table  borderColor="#000000" cellSpacing="0" cellPadding="1" width="75%" style="border-top: black 1px solid; border-right: black 1px solid; border-collapse: collapse; border-bottom: black 1px solid; border-left: black 1px solid;">
						<tr width="100%">
							<td width="100%" align="center" style="border:solid 1px black;background-color:#C0C0C0" colspan="2">
								<font size="1" face="Arial, Helvetica, sans-serif">
									<strong>MOTIVOS DE LA EMISI?N DE LA NOTA CR?DITO</strong>
								</font>
							</td>
						</tr>
						<tr>
							<td width="20%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
								<font size="1" face="Arial, Helvetica, sans-serif">
									<strong>C?DIGO</strong>
								</font>
							</td>
							<td width="80%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
								<font size="1" face="Arial, Helvetica, sans-serif">
									<strong>DESCRIPCI?N</strong>
								</font>
							</td>
						</tr>
						<tr>
							<td width="20%" align="center" style="border:solid 1px" >
								<font size="1" face="Arial, Helvetica, sans-serif">
									<xsl:value-of select="//cac:DiscrepancyResponse/cbc:ResponseCode"/>
								</font>
							</td>
							<td width="80%" align="left" style="border:solid 1px">
								<font size="1" face="Arial, Helvetica, sans-serif">
									<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
								</font>
							</td>
						</tr>
					</table>
	</xsl:template>

	<xsl:template name="tmpTotal">	
		<table style="border: 1px solid black; border-collapse: collapse;" rules="groups" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
			
						<xsl:variable name="TotalDescuento">
							<xsl:value-of select="0"/>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2005'">
									<xsl:value-of select="cbc:PayableAmount"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>

						<thead style="border: 1px solid black;">
							<tr>
								<xsl:if test="//cac:PrepaidPayment/cbc:PaidAmount!=''">	
									<td width="12.5%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
										<b>
											<font face="Arial, Helvetica, sans-serif" size="1">TOTAL <br/>  ANTICIPOS</font>
										</b>
									</td>
								</xsl:if>
								<td width="12.5%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">OPERACI?N <br/>  INAFECTA</font>
									</b>
								</td>
								<td width="12.5%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">OPERACI?N <br/> EXONERADA</font>
									</b>
								</td>
								<td width="12.5%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">DESCUENTO <br/>  TOTAL</font>
									</b>
								</td>
								<td width="12.5%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">DESCUENTO <br/>  GLOBAL</font>
									</b>
								</td>
								<td width="12.5%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">OPERACI?N <br/>  GRAVADA</font>
									</b>
								</td>
								<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
									<td width="12.5%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
										<b>
											<font face="Arial, Helvetica, sans-serif" size="1">TOTAL <br/>  IGV (18%)</font>
										</b>
									</td>
								</xsl:for-each>
								</xsl:if>
								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
									<td width="12.5%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
										<b>
											<font face="Arial, Helvetica, sans-serif" size="1">TOTAL <br/> IGV (18%)</font>
										</b>
									</td>
								</xsl:for-each>
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
									<td width="12.5%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
										<b>
											<font face="Arial, Helvetica, sans-serif" size="1">TOTAL <br/>  IGV (18%)</font>
										</b>
									</td>
								</xsl:for-each>
								</xsl:if>
								<xsl:if test="//cbc:UBLVersionID='2.1'">
							 	<td width="12.5%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
										<b>
											<font face="Arial, Helvetica, sans-serif" size="1">TOTAL <br/>  IGV (18%)</font>
										</b>
									</td>
								</xsl:if> 
								<td width="12.5%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
									<b>
										<font face="Arial, Helvetica, sans-serif" size="1">TOTAL <br/>  DE VENTA</font>
									</b>
								</td>
							</tr>
						</thead>
						<tr>
							<xsl:if test="//cac:PrepaidPayment/cbc:PaidAmount!=''">	
							<td width="12.5%" align="right" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" size="1">
													<xsl:choose>
      									<xsl:when test="//cac:LegalMonetaryTotal/cbc:PrepaidAmount">
        								<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PrepaidAmount,'###,###,##0.00','pen')"/>
       									</xsl:when>
										<xsl:otherwise>
										  0.00
										</xsl:otherwise>
     								</xsl:choose>
								</font>
							</td>
							</xsl:if>
							<td width="12.5%" align="right" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1002'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>-->
									<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>&#xA0;
								</font>
							</td>
							<td width="12.5%" align="right" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1003'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>-->
									<xsl:value-of select="format-number($OPExonerada,'###,###,##0.00','pen')"/>&#xA0;
								</font>
							</td>
							<!-- Total Dscto.-->

							<td width="12.5%" align="right" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="format-number($TotalDescuento,'###,###,##0.00','pen')"/>
								</font>
							</td>

							<!--Dscto. Global-->
							<td width="12.5%" align="right" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--<xsl:choose>
										<xsl:when test="string(number(//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount)) = 'NaN'">0.00</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount">
												<xsl:if test="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount!='0.00'">
													<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount,'###,###,##0.00','pen')"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:otherwise>
									</xsl:choose>-->
									<xsl:value-of select="format-number($DescuentoGlobal,'###,###,##0.00','pen')"/>&#xA0;
								</font>
							</td>
							<td width="12.5%" align="right" style="border:solid 1px black;border-top:none;border-bottom:none">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
										<xsl:if test="cbc:ID='1001'">
											<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
										</xsl:if>
									</xsl:for-each>-->
									<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>&#xA0;
								</font>
							</td>							
							<td width="12.5%" align="right" style="border:solid 1px black;border-top:none;border-bottom:none">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number($IGV,'###,###,##0.00','pen')"/>&#xA0;
									</font>
								</td>
							
							<td width="12.5%" align="right" style="border:solid 1px black;border-top:none;border-bottom:none">
								<!--<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</font>
								</xsl:if>
								<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
									</font>
								</xsl:if>-->
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="format-number($Total,'###,###,##0.00','pen')"/>&#xA0;
								</font>
							</td>
						</tr>
					</table>
		<table border="0" width="100%" cellpadding="1">
			<tr>
				<td>
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount='0.00'">
						<center>
							<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
								<b>TRANSFERENCIA GRATUITA</b>
							</font>
						</center>
					</xsl:if>
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!='0.00'">
						<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						</font>
					</xsl:if>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Referencia">
		<table border="0" rules="cols" cellSpacing="0" cellPadding="0" width="100%">
			<tbody>
				<tr>
					<td>
						<table border="0" cellSpacing="0" cellPadding="0" width="100%">
							<tbody>
								<tr>
									<td width="100%" align="left">
										<xsl:call-template name="tmpImporteLetras"/>
									</td>
								</tr>
								<xsl:if test="/pe:Invoice/cbc:ID='F004-00002825' or /pe:Invoice/cbc:ID='F004-00002826'">
									<tr>
										<td width="100%" align="left">
											<xsl:call-template name="tmpInformacionAdicDirecto"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td width="100%" align="left">
										<xsl:choose>
											<xsl:when test="/pe:Invoice">
												<xsl:call-template name="tmpPieComprobante_FB"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="tmpPieComprobante_NCND"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>						
								

							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>

	<xsl:template name="DocumentoReferencia">
	<table borderColor="#000000" cellSpacing="0" cellPadding="1" width="100%" style="border-top: black 1px solid; border-right: black 1px solid; border-collapse: collapse; border-bottom: black 1px solid; border-left: black 1px solid;">
		<tbody>
			<tr width="100%">
				<td colSpan="3" width="100%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
					<font size="1" face="Arial, Helvetica, sans-serif">
						<strong>DOCUMENTO(S) DE REFERENCIA</strong>
					</font>
				</td>
			</tr>
			<tr>
				<td width="50%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
					<font size="1" face="Arial, Helvetica, sans-serif">
						<strong>TIPO DOCUMENTO</strong>
					</font>
				</td>
				<td width="30%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
					<font size="1" face="Arial, Helvetica, sans-serif">
						<strong>CORRELATIVO</strong>
					</font>
				</td>
				<td width="20%" align="center" style="border:solid 1px black;background-color:#C0C0C0">
					<font size="1" face="Arial, Helvetica, sans-serif">
						<strong>FECHA</strong>
					</font>
				</td>
			</tr>
			<xsl:for-each select="//cac:DespatchDocumentReference">
								<xsl:if test="cbc:DocumentTypeCode != '10' ">
									<tr>
										<td width="50%" align="center" style="border:solid 1px black">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:choose>
													<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
													<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA ELE.</xsl:when>
													<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
													<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
													<xsl:otherwise>Documento NN</xsl:otherwise>
												</xsl:choose>
											</font>
										</td>
										<td width="30%" align="center" style="border:solid 1px black">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:value-of select="cbc:ID"/>
											</font>
										</td>
										<td width="20%" align="center" style="border:solid 1px black">
											<font face="Arial, Helvetica, sans-serif" size="1">
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
							</font>
							</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
			<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
				<xsl:if test="cbc:DocumentTypeCode != '10'">
					<tr>
						<td width="50%" align="center" style="border-top: black 1px solid; border-right: black 1px solid; border-bottom: black 1px solid; border-left: black 1px solid">
							<font size="1" face="Arial, Helvetica, sans-serif">
								<xsl:choose>
									<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA ELECTR?NICA</xsl:when>
									<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA ELECTR?NICA</xsl:when>
									<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO ELECTR?NICA</xsl:when>
									<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO ELECTR?NICA</xsl:when>
									<xsl:otherwise>Documento NN</xsl:otherwise>
								</xsl:choose>
							</font>
						</td>
						<td width="30%" align="center" style="border-top: black 1px solid; border-right: black 1px solid; border-bottom: black 1px solid; border-left: black 1px solid">
							<font size="1" face="Arial, Helvetica, sans-serif">
								<xsl:value-of select="cbc:ID"/>
							</font>
						</td>
						<td width="20%" align="center" style="border-top: black 1px solid; border-right: black 1px solid; border-bottom: black 1px solid; border-left: black 1px solid">
							<font size="1" face="Arial, Helvetica, sans-serif">
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
							</font>
						</td>
					</tr>
				</xsl:if>
			</xsl:for-each>
		</tbody>
	</table>
</xsl:template>

<xsl:template name="tmpInformacionAdicExportacion">
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td width="23%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>Puerto de Embarque (Port of Shipment)</strong>
				</font>
			</td>
			<td width="1%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
				<strong>:</strong>
				</font>
			</td>
			<td width="26%" align="left" style="border-bottom:solid 1px black">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002826'">
						CALLAO-PERU
					</xsl:if>
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002825'">
						CALLAO-PERU
					</xsl:if>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='08'">
							<xsl:value-of select="pe:Valor"/>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='08'">
							<xsl:value-of select="pe1:Valor"/>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='08'">
							<xsl:value-of select="pe2:Valor"/>
						</xsl:if>
					</xsl:for-each>
				</font>
			</td>
			<td width="8%">
			&#xA0;
			</td>
			<td width="15%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>Forma de Pago (Payment)</strong>
				</font>
			</td>
			<td width="1%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
				<strong>:</strong>
				</font>
			</td>
			<td width="26%" style="border-bottom:solid 1px black">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002826'">
						45 DAYS BL
					</xsl:if>
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002825'">
						45 DAYS BL
					</xsl:if>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='14'">
							<xsl:value-of select="pe:Valor"/>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='14'">
							<xsl:value-of select="pe1:Valor"/>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='14'">
							<xsl:value-of select="pe2:Valor"/>
						</xsl:if>
					</xsl:for-each>
				</font>
			</td>
		</tr>
				<tr>
			<td width="23%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>Fecha de Embarque (Date of Shipment)</strong>
				</font>
			</td>
			<td width="1%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
				<strong>:</strong>
				</font>
			</td>
			<td width="26%" align="left" style="border-bottom:solid 1px black">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002826'">
						19/10/2022
					</xsl:if>
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002825'">
						19/10/2022
					</xsl:if>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
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
				</font>
			</td>
			<td width="8%">
			&#xA0;
			</td>
			<td width="15%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>Flete (Freight)</strong>
				</font>
			</td>
			<td width="1%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
				<strong>:</strong>
				</font>
			</td>
			<td width="26%" style="border-bottom:solid 1px black">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002826'">
						PORCOBRAR/COLLECT
					</xsl:if>
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002825'">
						PORCOBRAR/COLLECT
					</xsl:if>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='15'">
							<xsl:value-of select="pe:Valor"/>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='15'">
							<xsl:value-of select="pe1:Valor"/>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='15'">
							<xsl:value-of select="pe2:Valor"/>
						</xsl:if>
					</xsl:for-each>
				</font>
			</td>
		</tr>
				<tr>
			<td width="23%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>Nombre del Barco (Name of Vessel)</strong>
				</font>
			</td>
			<td width="1%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
				<strong>:</strong>
				</font>
			</td>
			<td width="26%" align="left" style="border-bottom:solid 1px black">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002826'">
						MSCROMANE NX241R 
					</xsl:if>
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002825'">
						MSCROMANE NX241R 
					</xsl:if>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='10'">
							<xsl:value-of select="pe:Valor"/>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='10'">
							<xsl:value-of select="pe1:Valor"/>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='10'">
							<xsl:value-of select="pe2:Valor"/>
						</xsl:if>
					</xsl:for-each>
				</font>
			</td>
			<td width="8%">
			&#xA0;
			</td>
			<td width="15%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>Contenedor ( Contamer)</strong>
				</font>
			</td>
			<td width="1%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
				<strong>:</strong>
				</font>
			</td>
			<td width="26%" style="border-bottom:solid 1px black">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002826'">
						FSCU5682582 
					</xsl:if>
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002825'">
						MSCU7484942
					</xsl:if>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='16'">
							<xsl:value-of select="pe:Valor"/>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='16'">
							<xsl:value-of select="pe1:Valor"/>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='16'">
							<xsl:value-of select="pe2:Valor"/>
						</xsl:if>
					</xsl:for-each>
				</font>
			</td>
		</tr>
				<tr>
			<td width="23%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>Peso Neto (Net Weight)(Kg)</strong>
				</font>
			</td>
			<td width="1%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
				<strong>:</strong>
				</font>
			</td>
			<td width="26%" align="left" style="border-bottom:solid 1px black">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002826'">
						24008.04 KG
					</xsl:if>
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002825'">
						17965.20 KG
					</xsl:if>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='11'">
							<!-- <xsl:value-of select="format-number(pe:Valor,'###,###,##0.00','pen')"/> -->
							<xsl:value-of select="pe:Valor"/>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='11'">
							<!-- <xsl:value-of select="format-number(pe1:Valor,'###,###,##0.00','pen')"/> -->
							<xsl:value-of select="pe1:Valor"/>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='11'">
							<!-- <xsl:value-of select="format-number(pe2:Valor,'###,###,##0.00','pen')"/> -->
							<xsl:value-of select="pe2:Valor"/>
						</xsl:if>
					</xsl:for-each>
				</font>
			</td>
			<td width="8%">
			&#xA0;
			</td>
			<td width="15%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>N? Pedido (Order)</strong>
				</font>
			</td>
			<td width="1%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
				<strong>:</strong>
				</font>
			</td>
			<td width="26%" style="border-bottom:solid 1px black">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002826'">
						PO29969-2
					</xsl:if>
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002825'">
						PO29968-8
					</xsl:if>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='17'">
							<xsl:value-of select="pe:Valor"/>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='17'">
							<xsl:value-of select="pe1:Valor"/>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='17'">
							<xsl:value-of select="pe2:Valor"/>
						</xsl:if>
					</xsl:for-each>
				</font>
			</td>
		</tr>
				<tr>
			<td width="23%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>Peso Bruto (Gross Weight)(Kg)</strong>
				</font>
			</td>
			<td width="1%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
				<strong>:</strong>
				</font>
			</td>
			<td width="26%" align="left" style="border-bottom:solid 1px black">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002826'">
						0.00
					</xsl:if>
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002825'">
						0.00
					</xsl:if>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='12'">
							<!-- <xsl:value-of select="format-number(pe:Valor,'###,###,##0.00','pen')"/> -->
							<xsl:value-of select="pe:Valor"/>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='12'">
							<!-- <xsl:value-of select="format-number(pe1:Valor,'###,###,##0.00','pen')"/> -->
							<xsl:value-of select="pe1:Valor"/>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='12'">
							<!-- <xsl:value-of select="format-number(pe2:Valor,'###,###,##0.00','pen')"/> -->
							<xsl:value-of select="pe2:Valor"/>
						</xsl:if>
					</xsl:for-each>
				</font>
			</td>
			<td width="8%">
			&#xA0;
			</td>
			<td width="15%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>N? Temperature Recorder</strong>
				</font>
			</td>
			<td width="1%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
				<strong>:</strong>
				</font>
			</td>
			<td width="26%" style="border-bottom:solid 1px black">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002826'">
						260000725780/260000725800
					</xsl:if>
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002825'">
						260000725781/260000725837
					</xsl:if>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='18'">
							<xsl:value-of select="pe:Valor"/>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
						<xsl:if test="pe1:Codigo='18'">
							<xsl:value-of select="pe1:Valor"/>
						</xsl:if>
					</xsl:for-each>

					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
						<xsl:if test="pe2:Codigo='18'">
							<xsl:value-of select="pe2:Valor"/>
						</xsl:if>
					</xsl:for-each>
				</font>
			</td>
		</tr>
				<tr>
			<td width="23%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>Total Bultos (Total package):</strong>
				</font>
			</td>
			<td width="1%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
				<strong>:</strong>
				</font>
			</td>
			<td width="26%" align="left" style="border-bottom:solid 1px black">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002826'">
						1764 BOXES
					</xsl:if>
					<xsl:if test="/pe:Invoice/cbc:ID='F004-00002825'">
						1320 BOXES IN18 PALLETS
					</xsl:if>
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
				</font>
			</td>
			<td colspan="4">
			</td>
		</tr>
	</table>
</xsl:template>

<xsl:template name="tmpInformacionAdicDirecto">
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td width="40%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<u><strong>FOR PAYMENTS FROM OUTSIDE THE USA</strong></u>
				</font>
			</td>			
			<td width="2%">&#xA0;</td>
			<td width="40%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<u><strong>FOR PAYMENTS FROM A BANK WITHIN THE USA</strong></u>
				</font>
			</td>
			<td width="18%">&#xA0;</td>
		</tr>

		<tr>
			<td width="34%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>BENEFICIARY BANK : </strong> BANCO DE CREDITO DEL PERU- MIAMI AGENCY
				</font>
			</td>			
			<td width="2%">&#xA0;</td>
			<td width="34%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>BENEFICIARY BANK : </strong>BANCO DE CREDITO DEL PERU- MIAMI AGENCY
				</font>
			</td>
			<td width="15%">&#xA0;</td>
		</tr>
		
		<tr>
			<td width="34%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>ADRESS : </strong>121 ALHAMBRA PLAZA, SUITE 1200, CORAL GABLES, FL 33134
				</font>
			</td>			
			<td width="2%">&#xA0;</td>
			<td width="30%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>ADRESS : </strong>121 ALHAMBRA PLAZA, SUITE 1200, CORAL GABLES, FL 33134
				</font>
			</td>
			<td width="15%">&#xA0;</td>
		</tr>

		<tr>
			<td width="20%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>SWIFT : </strong>BCPLUS33
				</font>
			</td>			
			<td width="8%">&#xA0;</td>
			<td width="15%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>ABA : </strong>067015355
				</font>
			</td>
			<td width="30%">&#xA0;</td>
		</tr>

		<tr>
			<td width="20%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>ABA : </strong>067015355
				</font>
			</td>			
			<td width="8%">&#xA0;</td>
			<td width="15%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>BENEFICIARY ACCOUNTNAME : </strong>MEBOL SAC
				</font>
			</td>
			<td width="30%">&#xA0;</td>
		</tr>

		<tr>
			<td width="27%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>INTERMEDIARY BANK : </strong>STANDARD CHARTERED BANK - NEW YORK
				</font>
			</td>			
			<td width="1%">&#xA0;</td>
			<td width="15%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>BENEFICIARY ACCOUNT NUMBER : </strong>201030010007046
				</font>
			</td>
			<td width="30%">&#xA0;</td>
		</tr>

		<tr>
			<td width="20%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>SWIFT: </strong>SCBLUS33
				</font>
			</td>			
			<td width="8%">&#xA0;</td>
			<td width="15%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong></strong>
				</font>
			</td>
			<td width="30%">&#xA0;</td>
		</tr>

		<tr>
			<td width="20%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>BENEFICIARY ACCOUNT NAME : </strong>MEBOL SAC
				</font>
			</td>			
			<td width="8%">&#xA0;</td>
			<td width="15%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong></strong>
				</font>
			</td>
			<td width="30%">&#xA0;</td>
		</tr>

		<tr>
			<td width="27%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>BENEFICIARY ACCOUNT NUMBER : </strong>201030010007046
				</font>
			</td>			
			<td width="1%">&#xA0;</td>
			<td width="15%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong></strong>
				</font>
			</td>
			<td width="30%">&#xA0;</td>
		</tr>

	</table>
</xsl:template>


<xsl:template name="TipoDeDocumento">
		<xsl:choose>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'">NO DOMICILIADO</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">NO DOMICILIADO</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='-'">NO DOMICILIADO</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">NO DOMICILIADO</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">DNI</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">CARNET EXTR.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CARNET EXTR.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">R.U.C.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">R.U.C.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">PASAPORTE</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PASAPORTE</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">CED. DIP. IDENT.</xsl:when>
			<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">CED. DIP. IDENT.</xsl:when>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->