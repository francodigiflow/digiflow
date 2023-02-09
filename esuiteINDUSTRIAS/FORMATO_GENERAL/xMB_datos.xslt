<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" exclude-result-prefixes="cac cbc ext pe pe1 pe2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="tmpDatosReceptor">
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<xsl:choose>
						<xsl:when test="/pe:Invoice">
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
								<xsl:choose>
									<!--<xsl:when test="//ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional[pe:Codigo='03' and pe:Valor='E']">-->
									<xsl:when test="$tipoDoc = '40'">
										<xsl:call-template name="tmpDatosRecepExportacion"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="tmpDatosReceptor_F"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
								<xsl:call-template name="tmpDatosReceptor_B"/>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="tmpDatosReceptor_NCND"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>			
		</table>
	</xsl:template>

	<xsl:template name="tmpDatosReceptor_NCND">
		<table width="100%" cellpadding="2" cellspacing="0">  <!--style="border: 1px solid black; border-collapse: collapse;"-->
			<tbody style="border:solid 1px black">
				<tr>
					<td width="10%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>SEÑOR (ES)</strong>
						</font>
					</td>
					<td width="2%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="88%" > <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
						</font>
					</td>
				</tr>
				<tr>
					<td width="10%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>
								<xsl:call-template name="TipoDeDocumento"/>
							</strong>
						</font>
					</td>
					<td width="2%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="88%">  <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">							
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
							</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
							</xsl:if>
						</font>
					</td>
				</tr>
				<tr>
					<td width="10%">  <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>DIRECCIÓN</strong>
						</font>
					</td>
					<td width="2%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="88%" > <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
						</font>
					</td>
				</tr>
				<tr>
					<td width="10%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>FECHA</strong>
						</font>
					</td>
					<td width="2%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="88%">  <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cbc:IssueDate"/>
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="tmpDatosReceptor_B">
		<table width="100%" cellpadding="2" cellspacing="0">  <!--style="border: 1px solid black; border-collapse: collapse;"-->
			<tbody style="border:solid 1px black">
				<tr>
					<td width="10%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>SEÑOR (ES)</strong>
						</font>
					</td>
					<td width="2%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="88%" > <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
						</font>
					</td>
				</tr>
				<tr>
					<td width="10%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>
								<xsl:call-template name="TipoDeDocumento"/>
							</strong>
						</font>
					</td>
					<td width="2%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="88%">  <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
							</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
							</xsl:if>
						</font>
					</td>
				</tr>
				<tr>
					<td width="10%">  <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>DIRECCIÓN</strong>
						</font>
					</td>
					<td width="2%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="88%" > <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
						</font>
					</td>
				</tr>
				<tr>

					<td width="10%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>FECHA</strong>
						</font>
					</td>
					<td width="2%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="88%">  <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cbc:IssueDate"/>
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="tmpDatosRecepExportacion">
			<table width="100%" cellpadding="2" cellspacing="0">  <!--style="border: 1px solid black; border-collapse: collapse;"-->
			<tbody style="border:solid 1px black">
				<tr>
					<td width="12%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Sres. (Messers)</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="51%" > <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
						</font>
					</td>
					<td width="12%">  <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Fecha (Date)</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="23%"> <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cbc:IssueDate"/>
						</font>
					</td>
				</tr>
				<tr>
					<td width="12%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>
								<xsl:call-template name="TipoDeDocumento"/>
							</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="51%">  <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
							</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
							</xsl:if>
						</font>
					</td>
					<td width="12%" ><!-- style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Código (Code)</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="23%"> <!-- style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='05'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='05'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='05'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td width="12%">  <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Direc. (Messers)</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="54%" > <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
						</font>
					</td>
					<td width="12%"> <!-- style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Puerto (Port) Destin</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="23%">  <!--style="border:solid 1px black" -->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='06'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='06'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='06'">

									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>

					<td width="12%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Phone</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="51%">  <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='04'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='04'">

									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='04'">

									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
					<td width="12%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>Incoterm</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="23%"> <!--style="border:solid 1px black" -->
						<font face="Arial, Helvetica, sans-serif" size="1">
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
					</td>
				</tr>

			</tbody>
		</table>	
	</xsl:template>	

	<xsl:template name="tmpDatosReceptor_F">
		<table width="100%" cellpadding="2" cellspacing="0">  <!--style="border: 1px solid black; border-collapse: collapse;"-->
			<tbody style="border:solid 1px black">
				<tr>
					<td width="8%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>SEÑOR (ES)</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="55%" > <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
						</font>
					</td>
					<td width="7%" ><!-- style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>COD. CLIE</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="28%"> <!-- style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='01'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>

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
				<tr>
					<td width="8%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>
								<xsl:call-template name="TipoDeDocumento"/>
							</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="55%">  <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
							</xsl:if>
							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
							</xsl:if>
						</font>
					</td>
					<td width="7%" ><!-- style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>FA</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="28%"> <!-- style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cbc:ID"/>
						</font>
					</td>
				</tr>
				<tr>
					<td width="8%">  <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>DIRECCIÓN</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="55%" > <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
						</font>
					</td>
					<td width="7%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>O/C</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="28%" colspan="4"> <!--style="border:solid 1px black" -->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cac:OrderReference/cbc:ID"/>
						</font>
					</td>
				</tr>
				<tr>

					<td width="8%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>FECHA</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="55%" >  <!--style="border:solid 1px black"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="//cbc:IssueDate"/>
						</font>
					</td>
					<td width="18%" > <!--style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>FORMA DE PAGO</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="15%" colspan="4"> <!--style="border:solid 1px black" -->
						<font face="Arial, Helvetica, sans-serif" size="1">
								<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
								Crédito		
								</xsl:if>
								<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Contado'">
								Contado		
								</xsl:if>
						</font>
					</td>			
				</tr>
				<tr>
					<td width="8%" > <!-- style="border:solid 1px black;background-color:#C0C0C0"-->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>GR</strong>
						</font>
					</td>
					<td width="1%">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong>:</strong>
						</font>
					</td>
					<td width="91%" colspan="4" >  <!--style="border:solid 1px black" -->
						<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:for-each select="//cac:DespatchDocumentReference">
                               	<xsl:value-of select="cbc:ID"/>&#xA0;/
                            </xsl:for-each>
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="tmpDatosNegocio">
		<table style="border: 1px solid black; border-collapse: collapse;" width="100%" cellpadding="2" cellspacing="0">
			<tbody style="border:solid 1px black">
				<tr>
					<td width="16%" style="border:solid 1px black;background-color:#C0C0C0" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>NUM. DOC.</strong>
						</font>
					</td>
					<td width="16%" style="border:solid 1px black;background-color:#C0C0C0" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>FECHA EMISIÓN</strong>
						</font>
					</td>
					<td width="16%" style="border:solid 1px black;background-color:#C0C0C0" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>N° PEDIDO</strong>
						</font>
					</td>
					<td width="16%" style="border:solid 1px black;background-color:#C0C0C0" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>N° O/COMPRA</strong>
						</font>
					</td>
					<td width="16%" style="border:solid 1px black;background-color:#C0C0C0" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>N° GUÍA</strong>
						</font>
					</td>
					<td width="16%" style="border:solid 1px black;background-color:#C0C0C0" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>FECHA GUÍA</strong>
						</font>
					</td>
				</tr>
				<tr>
					<td width="16%" style="border:solid 1px black" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='04'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='04'">

									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='04'">

									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
					<td width="16%" style="border:solid 1px black" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
							<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
							<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
						</font>
					</td>
					<td width="16%" style="border:solid 1px black" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='05'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='05'">

									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='05'">

									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
					<td width="16%" style="border:solid 1px black" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="//cac:OrderReference/cbc:ID"/>
						</font>
					</td>
					<td width="16%" style="border:solid 1px black" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
                            <xsl:for-each select="//cac:DespatchDocumentReference">
                                <xsl:value-of select="cbc:ID"/>
                            </xsl:for-each>
                        </font> 

					</td>
					<td width="16%" style="border:solid 1px black" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='06'">

									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='06'">

									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='06'">

									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="tmpDescripcionMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">SOLES</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">DOLARES AMERICANOS</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">EUROS</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="/">
	<p>
		<html>
			<body style="background-color: #c0c0c0"/>
		</html>
	</p>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->