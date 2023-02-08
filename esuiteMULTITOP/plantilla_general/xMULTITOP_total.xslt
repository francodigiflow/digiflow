<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:variable name="OPGravada">

		<xsl:value-of select="0.00"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID = '1001'">
				<xsl:value-of select="cbc:PayableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="OPInafecta">
		<xsl:value-of select="0.00"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID='1002'">
				<xsl:value-of select="cbc:PayableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="OPExonerada">
		<xsl:value-of select="0.00"/>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="OpeGrat">
		<xsl:value-of select="0.00"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
			<xsl:if test="cbc:ID = '1004'">
				<xsl:value-of select="cbc:PayableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="IGV">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="ICBPER">
		<xsl:value-of select="0.00"/>
		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='7152'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>

		

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='7152'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>

		

		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='7152'">
				<xsl:value-of select="cbc:TaxAmount"/>
			</xsl:if>
		</xsl:for-each>

		
	</xsl:variable>
	<xsl:variable name="sTotalDescuentos">0.00</xsl:variable>
	<xsl:variable name="sDescuentosGlobales">0.00</xsl:variable>

	<xsl:variable name="MontoPercepcion">
		<xsl:value-of select="0"/>
		<xsl:for-each select="//cac:AllowanceCharge">
			<xsl:if test="cbc:ChargeIndicator = 'true'">
				<xsl:value-of select="cbc:Amount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="DescuentoGlobal">
		<xsl:value-of select="0"/>
		<xsl:for-each select="//cac:AllowanceCharge">
			<xsl:if test="cbc:ChargeIndicator = 'false'">
				<xsl:value-of select="cbc:Amount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="MontoTotalMasPercepcion">
		<xsl:value-of select="0"/>
		<xsl:for-each select="//cac:PaymentTerms">
			<xsl:if test="cbc:ID = 'Percepcion'">
				<xsl:value-of select="cbc:Amount"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:template name="TotalD">
		<table border="1" width="100%" cellpadding="2" cellspacing="0">


		<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode!='03'">
			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>SUB TOTAL</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='11'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>


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


			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>DSCTO GLOBAL</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:value-of select="format-number($DescuentoGlobal,'###,###,##0.00','pen')"/>
					</font>
				</td>
			</tr>
			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>DSCTO TOTAL</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

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
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>DSCTO PROMOCION</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='12'">
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
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>OP. EXONERADA</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

						<xsl:value-of select="format-number($OPExonerada,'###,###,##0.00','pen')"/>
					</font>
				</td>
			</tr>

			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>OP. INAFECTA</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>
					</font>
				</td>
			</tr>

			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>OP. GRAVADA</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>
					</font>
				</td>
			</tr>			

			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>IGV</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

						<xsl:value-of select="format-number($IGV,'###,###,##0.00','pen')"/>
					</font>
				</td>
			</tr>
			</xsl:if>
			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>ICBPER</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

						<xsl:value-of select="format-number($ICBPER,'###,###,##0.00','pen')"/>
					</font>
				</td>
			</tr>



			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">TOTAL A PAGAR</xsl:if>
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode!='03'">TOTAL</xsl:if>
						</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
						</font>
					</xsl:if>
					<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
						</font>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>OP. GRATUITA</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

						<!--<xsl:value-of select="format-number($OpeGrat,'###,###,##0.00','pen')"/>-->
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
					</font>
				</td>
			</tr>
		</table>



		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td>&#xA0;</td>
			</tr>
			<tr>
				<td>&#xA0;</td>
			</tr>
			<tr>
				<td>&#xA0;</td>
			</tr>
			<tr>
				<td>&#xA0;</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="TotalNC">
		<table border="1" width="100%" cellpadding="2" cellspacing="0">
			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>SUB TOTAL</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

						

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
			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>DSCTO TOTAL</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

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
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>OP. GRAVADA</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>
					</font>
				</td>
			</tr>



			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>IGV</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

						<xsl:value-of select="format-number($IGV,'###,###,##0.00','pen')"/>
					</font>
				</td>
			</tr>

			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>ICBPER</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

						<xsl:value-of select="format-number($ICBPER,'###,###,##0.00','pen')"/>
					</font>
				</td>
			</tr>



			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>TOTAL</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
						</font>
					</xsl:if>
					<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
						</font>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>OP. GRATUITA</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

						<xsl:value-of select="format-number($OpeGrat,'###,###,##0.00','pen')"/>
					</font>
				</td>
			</tr>
		</table>



		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td>&#xA0;</td>
			</tr>
			<tr>
				<td>&#xA0;</td>
			</tr>
			<tr>
				<td>&#xA0;</td>
			</tr>
			<tr>
				<td>&#xA0;</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="TotalND">
		<table border="1" width="100%" cellpadding="2" cellspacing="0">
			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>SUB TOTAL</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

						

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
			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>OP. INAFECTA</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>
					</font>
				</td>
			</tr>
			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>IGV</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<font face="Arial, Helvetica, sans-serif" size="2">

						<xsl:value-of select="format-number($IGV,'###,###,##0.00','pen')"/>
					</font>
				</td>
			</tr>
			<tr>
				<td width="75%">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>TOTAL</strong>
					</font>
				</td>
				<td align="right" width="25%">
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
						</font>
					</xsl:if>
					<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>
						</font>
					</xsl:if>
				</td>
			</tr>
			
		</table>



		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td>&#xA0;</td>
			</tr>
			<tr>
				<td>&#xA0;</td>
			</tr>
			<tr>
				<td>&#xA0;</td>
			</tr>
			<tr>
				<td>&#xA0;</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="CuotasPago">
		<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID = 'Credito'">
				<tr>
					<td align="left">
						<hr/>
					</td>
				</tr>
				<tr>
					<td align="left">
						<font face="Arial, Helvetica, sans-serif" size="2"><strong>CUOTAS</strong></font>
					</td>
				</tr>
				<tr>
					<td align="center">
					<table border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="60%" align="center">
											<tr>
												<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Cuota</strong></font></td>
												<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Fecha de Vencimiento</strong></font></td>
												<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Moneda</strong></font></td>
												<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Monto</strong></font></td>
												</tr>
											<xsl:for-each select="//cac:PaymentTerms">
												<xsl:if test="substring(cbc:PaymentMeansID,1,5) = 'Cuota'">
													<tr>
														<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><xsl:value-of select="number(substring(cbc:PaymentMeansID,6,3))"/></font></td>
														<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><xsl:value-of select="concat(substring(cbc:PaymentDueDate,9,2),'/',substring(cbc:PaymentDueDate,6,2),'/',substring(cbc:PaymentDueDate,1,4))"/></font></td>
														<td align="center"><font face="Arial, Helvetica, sans-serif" size="2">
															<xsl:choose>
																<xsl:when test="cbc:Amount/@currencyID = 'PEN'">Soles</xsl:when>
																<xsl:when test="cbc:Amount/@currencyID = 'USD'">Dolares</xsl:when>
															</xsl:choose> 
														</font></td>
														<td align="center"><font face="Arial, Helvetica, sans-serif" size="2"><xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/></font></td>
													</tr>
												</xsl:if>
											</xsl:for-each>
										</table>
					</td>
					</tr>	
					<tr>
					<td align="left">
						<hr/>
					</td>
				</tr>				
				</xsl:if>
	</xsl:template>


	<xsl:template name="ReferenciaD">
		<table border="0" cellSpacing="0" cellPadding="2" width="100%">
			<tbody>
				
				<tr>
					<td width="100%">
						<xsl:call-template name="son-pesos"/>
					</td>
				</tr>
				<xsl:if test="//cbc:Note[@languageLocaleID='1002']!=''">
				<tr>
					<td>
						<xsl:call-template name="Transferencia"/>
					</td>
				</tr>
				</xsl:if>
				<xsl:if test="//cbc:Note[@languageLocaleID='1002']=''">
				<tr>
					<td>
						&#160;
					</td>
				</tr>
				</xsl:if>
				<tr>
					<td>
						&#160;
					</td>
				</tr>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>AGENCIA:</strong>
						</font>
					</td>
				</tr>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='07'">
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='07'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='07'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>
						</font>
						&#160;
					</td>
				</tr>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>NOTA:</strong>
						</font>
					</td>
				</tr>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">
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
				</tr>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">
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
				</tr>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">
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
				</tr>
			</tbody>
		</table>
	</xsl:template>



	<xsl:template name="son-pesos">

		<table border="0" width="100%" cellpadding="2">
			<tr>
				<td align="left" width="100%">
					<font face="Arial, Helvetica, sans-serif" size="2">
					<strong>SON:</strong>
						<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']"/>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>


	<xsl:template name="TipoDeMoneda_Total">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>




	<!--	<xsl:template name="Observaciones">
		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="left" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<strong>OBSERVACION: </strong>
						
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>-->


	
	<xsl:template name="Transferencia">
		<table border="0" width="100%" cellpadding="0">
			<tr>
				<td>
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:value-of select="substring-after(//cbc:Note[@languageLocaleID='1002'],'Leyenda ')"/>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<!--	<xsl:template name="Detraccion">
	
		<table width="100%" cellpadding="0" cellspacing="0" border="0" bordercolor="#000000">
		<xsl:if test="$varCtsPorcenDetra!=''">
		<tbody>
			<tr>
				<td align="left" width="100%">
				<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
				<br/>Operación sujeta al Sistema de Pago de Obligaciones Tributarias con el Gobierno Central.
				<br/>Cta. Cte. N°<xsl:value-of select="$varCtaBN"/> - Banco de la Nación
				<br/>No afecto a Retención de IGV - Agente de Retención según R.S. 037-2002/SUNAT<br/>

						<br/>Operación sujeta al sistema de pago tributarias con el gobierno central. Cta Cte N° 
						<xsl:call-template name="RetourneValAd">
							<xsl:with-param name="NumAd" select="04" />
						</xsl:call-template>
						, Banco de la Nacion,  
						<xsl:call-template name="RetourneValAd">
							<xsl:with-param name="NumAd" select="03" />
						</xsl:call-template>
						%, Cod Serv. 037<br/>
						<br/><br/>
					</font>
					</xsl:if>
				
				</td>	
			</tr>
			<tr>
					<td>&#160;
					</td>
			</tr>
			</tbody>
			</xsl:if>
		</table>
	</xsl:template>	-->

	<!--<xsl:template name="Leyenda">
		<table border="0" width="100%" cellpadding="1" cellspacing="1">
			<tr>
					<td>&#160;
					</td>
			</tr>
			<tr>
 				<td width="60%" colspan="2">
					<font face="Arial, Helvetica, sans-serif" size="1">DE NO SER PAGADO EL VALOR DE ESTA
						<xsl:choose>
							<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">FACTURA ELECTRÓNICA</xsl:when>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">BOLETA DE VENTA ELECTRÓNICA</xsl:when>
								<xsl:otherwise>
									<xsl:if test="/pe2:DebitNote">NOTA DE DÉBITO ELECTRÓNICA</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						<br/>A SU VENCIMIENTO EL DEUDOR SE OBLIGA A PAGAR A CAMARA DE COMERCIO LA TASA MÁXIMA
						<br/>DE INTERÉS COMPENSATORIO Y LA TASA MÁXIMA DE INTERÉS MORATORIO Y LOS GASTOS
						<br/>ADMINISTRATIVOS PERMITIDOS POR LEY
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="PreparadoPor"> 
		<table border="0" cellSpacing="0"  cellPadding="1" width="50%">
			<tr>
				<td align="right">
					<font face="Arial, Helvetica, sans-serif" size="0.1">
						<strong>Powered by: </strong>
					</font>
					<img src="logo_dibiz.png" width="20" height="30"/>
				</td>
			</tr>
		</table>
	</xsl:template>-->

	<!--<xsl:template name="Anticipos">
		<xsl:if test="count(//cac:PrepaidPayment)>0">
		<table border="0" cellSpacing="0"  cellPadding="1" width="50%">
			<thead>
				<tr>
					<th width="100%" align="left">
			        	<font face="Arial, Helvetica, sans-serif" size="1">3DOCUMENTO(S) DE REFERENCIA ANTICIPOS:</font>
			        </th>
			    </tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
							<thead>
								<tr>
									<th width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
	                                    	<strong>Serie</strong>
	                                    </font>
									</th>
									<th width="40%" align="center">
	                                	<font face="Arial, Helvetica, sans-serif" size="1">
	                                    	<strong>Número</strong>
	                                    </font>
	                                 </th>
									 <th width="40%" align="center">
	                                 	<font face="Arial, Helvetica, sans-serif" size="1">
	                                    	<strong>Monto</strong>
	                                    </font>
	                                 </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="//cac:PrepaidPayment">
									<tr>
										<td>
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:value-of select="substring-before(cbc:ID,'-')"/>
											</font>
										</td>
										<td>
											<font face="Arial, Helvetica, sans-serif" size="1">
					                        	<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
					                        </font>
										</td>
										<td>
											<font face="Arial, Helvetica, sans-serif" size="1">
					                        	<xsl:value-of select="format-number(cbc:PaidAmount, '###,###,##0.00', 'pen')"/>
					                        </font>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		</xsl:if>
	</xsl:template>-->

	<!--<xsl:template name="Referencia">
		   		<table border="0" cellSpacing="0"  cellPadding="1" width="100%">
		      		<tbody>
		         		<tr>
		            		<td>
		               			<table border="0" cellSpacing="0"  cellPadding="0" width="50%">
		                  		<tbody>
				  			
							<xsl:if test="/pe1:CreditNote">
								<tr>
                        		<td width="100%" align="left">
                           			<font face="Arial, Helvetica, sans-serif" size="1">2DOCUMENTO(S) DE REFERENCIA :</font>
                        		</td>
                     		</tr>
                     			<tr>
	                        		<td>
	                           			<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
	                              		<tbody>
	                                 		<tr>
	                                    		<td width="30%" align="center">
	                                       			<font face="Arial, Helvetica, sans-serif" size="1">
	                                          			<strong>Tipo Documento</strong>
	                                       			</font>
	                                    		</td>
	                                    		<td width="10%" align="center">
	                                       			<font face="Arial, Helvetica, sans-serif" size="1">
	                                          			<strong>Serie</strong>
	                                       			</font>
	                                    		</td>
												<td width="30%" align="center">
	                                       			<font face="Arial, Helvetica, sans-serif" size="1">
	                                          			<strong>Número</strong>
	                                       			</font>
	                                    		</td>
												<td width="30%" align="center">
	                                       			<font face="Arial, Helvetica, sans-serif" size="1">
	                                          			<strong>Fecha Referencia</strong>
	                                       			</font>
	                                    		</td>
										
	                              			</tr>
	                                    	<xsl:for-each select="//cac:DespatchDocumentReference">
	                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
	                                       			<tr>
	                                           			<td width="30%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="1">  
	                                               				<xsl:choose>
	                                                  				<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
	                                                   				<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
	                                                   				<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
	                                                   				<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
	                                                   				<xsl:otherwise>Documento NN</xsl:otherwise>
	                                               				</xsl:choose>
	                                               			</font>
	                                           			</td>
													
	                                           			<td width="10%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="1">
	                                               				<xsl:value-of select="cbc:ID"/>
																<xsl:value-of select="substring-before(cbc:ID,'-')"/>
	                                               			</font>
	                                           			</td>

														<td width="30%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="1">
	                                               				<xsl:value-of select="cbc:ID"/>
																<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
	                                               			</font>
	                                           			</td>
														<td width="30%" align="center">
	                                                		<font face="Arial, Helvetica, sans-serif" size="1">
	                                                				<xsl:call-template name="RetourneFecha">
																		<xsl:with-param name="NumAd" select="09"/>
																	</xsl:call-template>
	                                                		</font>
	                                             		</td>
													
	                                       			</tr>
	                                    		</xsl:if>
	                                    	</xsl:for-each>
	                                    	<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
	                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
	                                        		<tr>
	                                           			<td width="30%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="1">  
	                                               				<xsl:choose>
			                                                    	<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
			                                                    	<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
			                                                    	<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
			                                                    	<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
			                                                    	<xsl:otherwise>Documento NN</xsl:otherwise>
			                                                 	</xsl:choose>
	        		                                    	</font>
	                		                			</td>
													
	                                             		<td width="10%" align="center">
	                                                		<font face="Arial, Helvetica, sans-serif" size="1">
	                                                			<xsl:value-of select="cbc:ID"/>
																<xsl:value-of select="substring-before(cbc:ID,'-')"/>
	                                                		</font>
	                                             		</td>
														<td width="30%" align="center">
	                                                		<font face="Arial, Helvetica, sans-serif" size="1">
	                                                			<xsl:value-of select="substring-after(cbc:ID,'-')"/>
																<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
	                                                		</font>
	                                             		</td>
														Fecha de Referencia de la nota
														<td width="30%" align="center">
	                                                		<font face="Arial, Helvetica, sans-serif" size="1">
	                                                					
																	<xsl:call-template name="RetourneFecha">
																		<xsl:with-param name="NumAd" select="09"/>
																	</xsl:call-template>
																
	                                                		</font>
	                                             		</td>
	                                          		</tr>
	                                       		</xsl:if>
	                                    	</xsl:for-each>
	                              		</tbody>
	                           			</table>
	                        		</td>

                     		</tr>

							</xsl:if>
            				<xsl:if test="/pe2:DebitNote">				

							<tr>
                        		<td width="100%" align="left">
                           			<font face="Arial, Helvetica, sans-serif" size="1">1DOCUMENTO(S) DE REFERENCIA :</font>
                        		</td>
                     		</tr>
                     		<tr>
                        		<td>
                           			<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="50%">
                              		<tbody>
                                 		<tr>
                                    		<td width="30%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="1">
                                          			<strong>Tipo Documento</strong>
                                       			</font>
                                    		</td>
                                    		<td width="10%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="1">
                                          			<strong>Serie</strong>
                                       			</font>
                                    		</td>
											<td width="30%" align="center">
	                                       			<font face="Arial, Helvetica, sans-serif" size="1">
	                                          			<strong>Número</strong>
	                                       			</font>
	                                    	</td>
												<td width="30%" align="center">
	                                       			<font face="Arial, Helvetica, sans-serif" size="1">
	                                          			<strong>Fecha Referencia</strong>
	                                       			</font>
	                                    		</td>
                              			</tr>
                                    	<xsl:for-each select="//cac:DespatchDocumentReference">
                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
                                       			<tr>
                                           			<td width="30%" align="center">
                                              			<font face="Arial, Helvetica, sans-serif" size="1">  
                                               				<xsl:choose>
                                                  				<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
                                                   				<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
                                                   				<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
                                                   				<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
                                                   				<xsl:otherwise>Documento NN</xsl:otherwise>
                                               				</xsl:choose>
                                               			</font>
                                           			</td>
                                           			<td width="10%" align="center">
                                              			<font face="Arial, Helvetica, sans-serif" size="1">
                                               				<xsl:value-of select="cbc:ID"/>
															<xsl:value-of select="substring-before(cbc:ID,'-')"/>
                                               			</font>
                                           			</td>
													<td width="30%" align="center">
                                                		<font face="Arial, Helvetica, sans-serif" size="1">
                                                			<xsl:value-of select="substring-after(cbc:ID,'-')"/>
															<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
                                                		</font>
                                             		</td>
														<td width="30%" align="center">
	                                                		<font face="Arial, Helvetica, sans-serif" size="1">
	                                                					<xsl:call-template name="RetourneFecha">
																			<xsl:with-param name="NumAd" select="09"/>
																		</xsl:call-template>
	                                                		</font>
	                                             		</td>
                                       			</tr>
                                    		</xsl:if>
                                    	</xsl:for-each>
                                    	<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
                                        		<tr>
                                           			<td width="30%" align="center">
                                              			<font face="Arial, Helvetica, sans-serif" size="1">  
                                               				<xsl:choose>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
		                                                    	<xsl:otherwise>Documento NN</xsl:otherwise>
		                                                 	</xsl:choose>
        		                                    	</font>
                		                			</td>
                                             		<td width="10%" align="center">
                                                		<font face="Arial, Helvetica, sans-serif" size="1">
                                                			<xsl:value-of select="cbc:ID"/>
															<xsl:value-of select="substring-before(cbc:ID,'-')"/>
                                                		</font>
                                             		</td>
													<td width="30%" align="center">
                                                		<font face="Arial, Helvetica, sans-serif" size="1">
                                                			<xsl:value-of select="substring-after(cbc:ID,'-')"/>
															<xsl:value-of select="format-number(substring-after(cbc:ID,'-'),'00000000')"/>
                                                		</font>
                                             		</td>
														<td width="30%" align="center">
	                                                		<font face="Arial, Helvetica, sans-serif" size="1">
	                                                				<xsl:call-template name="RetourneFecha">
																		<xsl:with-param name="NumAd" select="09"/>
																	</xsl:call-template>
	                                                		</font>
	                                             		</td>
                                          		</tr>
                                       		</xsl:if>
                                    	</xsl:for-each>
                              		</tbody>
                           			</table>
                        		</td>

                     		</tr>

							</xsl:if> 

							
                  		</tbody>
               			</table>
            		</td>
        		</tr>
      		</tbody>
   		</table>
	</xsl:template>-->

	<xsl:template name="fecha_ddmmaa_ref">
		<xsl:variable name="aa">
			<xsl:value-of select="substring-before(FchRef,'-')"/>
		</xsl:variable>
		<xsl:variable name="mmdd">
			<xsl:value-of select="substring-after(FchRef,'-')"/>
		</xsl:variable>
		<!--prefijo Fecha Emision Mes -->
		<xsl:variable name="mm">
			<xsl:value-of select="substring-before($mmdd,'-')"/>
		</xsl:variable>
		<xsl:variable name="dd">
			<xsl:value-of select="substring-after($mmdd,'-')"/>
		</xsl:variable>
		<!-- MES -Nombre -->
		<xsl:value-of select="concat($dd,'-', $mm, '-' , $aa)"/>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="20100133050&#x2D;01&#x2D;F998&#x2D;00171001.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="schemaCache" value="||"/><advancedProp name="bSchemaAware" value="true"/><advancedProp name="bGenerateByteCode" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="xsltVersion" value="2.0"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20520929658&#x2D;01&#x2D;FF11&#x2D;99900001.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"></template><template name="Total"><block path="table/tr/td[1]/font/xsl:for&#x2D;each" x="340" y="27"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="44" y="55"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="90" y="57"/><block path="table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="160" y="87"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="260" y="27"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="15"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="410" y="17"/><block path="table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="40" y="87"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="20" y="27"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="84" y="15"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="130" y="17"/><block path="table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="200" y="47"/><block path="table/xsl:for&#x2D;each" x="300" y="27"/><block path="table/xsl:for&#x2D;each/xsl:if/=[0]" x="364" y="55"/><block path="table/xsl:for&#x2D;each/xsl:if" x="410" y="57"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="314" y="85"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if" x="360" y="87"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="360" y="127"/><block path="table/xsl:if/!=[0]" x="274" y="85"/><block path="table/xsl:if" x="320" y="87"/><block path="table/xsl:if/tr/td[1]/font/xsl:value&#x2D;of" x="400" y="127"/><block path="table/xsl:for&#x2D;each[1]" x="280" y="87"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="15"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if" x="90" y="17"/><block path="table/xsl:for&#x2D;each[1]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="320" y="127"/><block path="table/xsl:for&#x2D;each[2]" x="240" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/!=[0]" x="44" y="95"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if" x="90" y="97"/><block path="table/xsl:for&#x2D;each[2]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="280" y="127"/><block path="table/xsl:for&#x2D;each[3]" x="200" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td/font/strong/xsl:value&#x2D;of" x="360" y="87"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/!=[0]" x="124" y="135"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if" x="170" y="137"/><block path="table/xsl:for&#x2D;each[3]/tr/td[1]/font/xsl:if/xsl:value&#x2D;of" x="240" y="127"/><block path="table/tr[3]/td[1]/xsl:if/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if/font/xsl:value&#x2D;of" x="40" y="127"/><block path="table/tr[3]/td[1]/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table/tr[3]/td[1]/xsl:if[1]" x="360" y="87"/><block path="table/tr[3]/td[1]/xsl:if[1]/font/xsl:value&#x2D;of" x="360" y="87"/><block path="table[1]/tr/td/xsl:if/=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if" x="360" y="87"/><block path="table[1]/tr/td/xsl:if[1]/!=[0]" x="314" y="85"/><block path="table[1]/tr/td/xsl:if[1]" x="360" y="87"/></template><template match="/"></template><template name="AdicionaDatosEmp"><block path="table/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/=[0]" x="340" y="16"/><block path="table/xsl:for&#x2D;each/xsl:if" x="386" y="18"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/!=[0]" x="290" y="46"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if" x="336" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="0" y="38"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="16" y="40"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="36" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="340" y="56"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="386" y="58"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="56" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="180" y="56"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="226" y="58"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="60" y="56"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="106" y="58"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]" x="316" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="180" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if" x="226" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/=[0]" x="250" y="46"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if" x="296" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[1]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]" x="156" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="60" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if" x="106" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/=[0]" x="130" y="46"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if" x="176" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[1]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[2]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[3]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each" x="186" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/=[0]" x="170" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if" x="216" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="200" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if" x="246" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each" x="276" y="0"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/xsl:for&#x2D;each[2]/xsl:if/xsl:if/table/tr[4]/td[1]/font/xsl:for&#x2D;each/xsl:if/xsl:if/xsl:for&#x2D;each/xsl:if/xsl:value&#x2D;of" x="336" y="48"/><block path="table/td/table/tr/td/xsl:for&#x2D;each" x="276" y="0"/><block path="table/td/table/tr/td/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/td/table/tr/td/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/td/table/tr/td/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="290" y="46"/><block path="table/td/table/tr/td/xsl:for&#x2D;each/xsl:if/xsl:if" x="336" y="48"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each" x="276" y="0"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each/xsl:if/=[0]" x="260" y="16"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each/xsl:if" x="306" y="18"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each/xsl:if/xsl:if/=[0]" x="290" y="46"/><block path="table/td/table/tr[1]/td/xsl:for&#x2D;each/xsl:if/xsl:if" x="336" y="48"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->