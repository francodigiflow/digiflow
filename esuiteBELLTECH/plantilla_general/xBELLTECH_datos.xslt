<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" exclude-result-prefixes="cac cbc ext pe pe1 pe2">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:template name="DatosReceptor">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<xsl:choose>
						<xsl:when test="/pe:Invoice">
							<xsl:call-template name="DatosReceptor_FB"/>
						</xsl:when>
						<xsl:when test="/pe1:CreditNote">
							<xsl:call-template name="DatosReceptor_NC"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="DatosReceptor_NC"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="DatosReceptor_FB">
		<table border="0" width="100%" cellpadding="2" cellspacing="0">
			<tbody>
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">FECHA EMISIÓN</font>
					</td>
					<!--<td width="56%">-->
					<td width="56%" cellpadding="2" valign="top" align="left">
                        <font face="Arial, Helvetica, sans-serif" size="1">:
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
                        </font>
                    </td> 

					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">ORDEN DE COMPRA</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='3'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='3'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='3'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">SEÑOR(ES)</font>
					</td>
					<td width="56%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
						</font>
					</td>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">MONEDA</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">: <xsl:call-template name="tmpDescripcionMoneda"/></font>
					</td>
				</tr>
				<tr>
				
						<td width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:choose>
	                                    <xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '-'">NO DOMICILIADO</xsl:when>
	                                    <xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '1'">DNI</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '4'">CARNET EXTR.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '6'">R.U.C.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '7'">PASAPORTE</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'A'">CED. DIP. IDENT.</xsl:when>
                               		</xsl:choose>
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.1'">
									<xsl:choose>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID= '0'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">NO DOMICILIADO</xsl:when>
	                                    <xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CARNET EXTR.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">R.U.C.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PASAPORTE</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID= 'A'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID= 'B'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID= 'C'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID= 'D'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID= 'E'">NO DOMICILIADO</xsl:when>
									</xsl:choose>
									</xsl:if>
							
							
							
							
							</font>
						</td>
					
					
					
					
					
					

					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
						</font>
					</td>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">FORMA DE PAGO</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='1'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='1'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='1'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">DIRECCIÓN</font>
					</td>
					<td width="56%">
						
							<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:if test="//cbc:UBLVersionID='2.0'">
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										</xsl:if>
										<xsl:if test="//cbc:UBLVersionID='2.1'">
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>&#xA0;
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District"/>-
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity"/>-
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
										</xsl:if>
						
						</font>
					</td>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">GUÍA DE REMISIÓN</font>
					</td>
					<td width="20%">
					
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='2' and pe:Valor!='-'">
									<xsl:value-of select="pe:Valor"/>
									</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='2' and pe1:Valor!='-'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='2'and pe2:Valor!='-'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='5'and pe:Valor!='-'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe1:Codigo='5'and pe1:Valor!='-'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='5' and pe2:Valor!='-'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
					
					<!--<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='4'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='4'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='4'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>-->
					
				</tr>
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">CENTRO DE COSTO</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='4'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='4'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='4'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
					<!--<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='2'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='2'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='2'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>-->
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="DatosReceptor_NC">
		<table border="0" width="100%" cellpadding="2" cellspacing="0">
			<tbody>
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">FECHA EMISIÓN</font>
					</td>
					<td width="56%" cellpadding="2" valign="top" align="left">
                        <font face="Arial, Helvetica, sans-serif" size="1">:
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
                        </font>
                    </td> 
					<!--<td width="56%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
							<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
							<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
						</font>
					</td>-->
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">ORDEN DE COMPRA</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='1'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='3'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='3'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
					
				</tr>
				<tr>
				   
<td width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:choose>
	                                    <xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '-'">NO DOMICILIADO</xsl:when>
	                                    <xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '1'">DNI</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '4'">CARNET EXTR.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '6'">R.U.C.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '7'">PASAPORTE</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'A'">CED. DIP. IDENT.</xsl:when>
                               		</xsl:choose>
									</xsl:if>
									<xsl:if test="//cbc:UBLVersionID='2.1'">
									<xsl:choose>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID= '0'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">NO DOMICILIADO</xsl:when>
	                                    <xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CARNET EXTR.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">R.U.C.</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PASAPORTE</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID= 'A'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID= 'B'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID= 'C'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID= 'D'">NO DOMICILIADO</xsl:when>
										<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID= 'E'">NO DOMICILIADO</xsl:when>
									</xsl:choose>
									</xsl:if>
							
							
							
							
							</font>
						</td>
					
					
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
						</font>
					</td>


					
                    <td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">FORMA DE PAGO</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='1'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='1'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='1'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>


				</tr>
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">SEÑOR(ES)</font>
					</td>
					<td width="56%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
						</font>
					</td>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">MONEDA</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:call-template name="tmpDescripcionMoneda"/>
						</font>
					</td>
					
					
				</tr>
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">DIRECCIÓN</font>
					</td>
					<td width="56%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
						<xsl:if test="//cbc:UBLVersionID='2.0'">
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										</xsl:if>
										<xsl:if test="//cbc:UBLVersionID='2.1'">
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>&#xA0;
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District"/>-
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity"/>-
										<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
										</xsl:if>
						
										
						</font>
					</td>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">CENTRO DE COSTO</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='4'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='4'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='4'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
					<!--<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">GUÍA REMISIÓN</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='2'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='2'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='2'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>-->
				</tr>
				
				<tr>
					<table border="0" width="100%" cellpadding="2" cellspacing="0">
						<tr>
							<td width="35%">
								<font face="Arial, Helvetica, sans-serif" size="1">DOCUMENTO QUE MODIFICA</font>
							</td>
							<td width="65%">
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
									<font face="Arial, Helvetica, sans-serif" size="1">:
										<xsl:value-of select="pe:Invoice/cac:DespatchDocumentReference/cbc:ID"/>
									</font>
								</xsl:if>
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:for-each select="/pe1:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference">
										<xsl:choose>
											<xsl:when test="//cbc:DocumentTypeCode='01'">:FACTURA - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:when test="//cbc:DocumentTypeCode='03'">:BOLETA DE VENTA - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:when test="//cbc:DocumentTypeCode='07'">:NOTA DE CREDITO - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:when test="//cbc:DocumentTypeCode='08'">:NOTA DE DEBITO - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:otherwise>:Documento NN</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
									<xsl:for-each select="/pe2:DebitNote/cac:BillingReference/cac:InvoiceDocumentReference">
										<xsl:choose>
											<xsl:when test="//cbc:DocumentTypeCode='01'">:FACTURA - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:when test="//cbc:DocumentTypeCode='03'">:BOLETA DE VENTA - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:when test="//cbc:DocumentTypeCode='07'">:NOTA DE CREDITO - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:when test="//cbc:DocumentTypeCode='08'">:NOTA DE DEBITO - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:otherwise>:Documento NN</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</font>
							</td>
						</tr>
						<tr>
							<td width="35%">
								<font face="Arial, Helvetica, sans-serif" size="1">FECHA DE EMISIÓN DEL COMPROBANTE DE PAGO QUE MODIFICA</font>
							</td>
							<td width="65%">
								<font face="Arial, Helvetica, sans-serif" size="1">:
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
										<xsl:if test="pe1:Codigo='6'">
											<xsl:value-of select="pe1:Valor"/>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='6'">
											<xsl:value-of select="pe2:Valor"/>
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>
						</tr>
					</table>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="DatosReceptor_ND">
		<table border="0" width="100%" cellpadding="2" cellspacing="0">
			<tbody>
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">FECHA EMISIÓN</font>
					</td>
					<td width="56%" cellpadding="2" valign="top" align="left">
                        <font face="Arial, Helvetica, sans-serif" size="1">:
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
                        </font>
                    </td> 
					<!--<td width="56%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
							<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
							<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
						</font>
					</td>-->
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">ORDEN DE COMPRA</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="2">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='3'">
									<font face="Arial, Helvetica, sans-serif" size="2">: <xsl:value-of select="pe:Valor"/></font>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='3'">
									<font face="Arial, Helvetica, sans-serif" size="2">: <xsl:value-of select="pe1:Valor"/></font>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='3'">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="pe2:Valor"/>
									</font>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">SEÑOR(ES)</font>
					</td>
					<td width="56%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
						</font>
					</td>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">MONEDA</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">: <xsl:call-template name="tmpDescripcionMoneda"/></font>
					</td>
				</tr>
				<tr>
					<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0'">
						<td width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">NO DOMICILIADO</font>
						</td>
					</xsl:if>
					<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">
						<td width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">DNI</font>
						</td>
					</xsl:if>
					<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">
						<td width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">CARNET EXTR.</font>
						</td>
					</xsl:if>
					<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">
						<td width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">R.U.C.</font>
						</td>
					</xsl:if>
					<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">
						<td width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">PASAPORTE</font>
						</td>
					</xsl:if>
					<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">
						<td width="12%">
							<font face="Arial, Helvetica, sans-serif" size="1">CED. DIP. IDENT.</font>
						</td>
					</xsl:if>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>
						</font>
					</td>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">FORMA DE PAGO</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='1'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='1'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='1'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">DIRECCIÓN</font>
					</td>
					<td width="56%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							- 
                            <xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName"/>
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName"/>
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName"/>
							- 
							<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
							-

							<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District"/>
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District"/>
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:District"/>

							<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
						</font>
					</td>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">CENTRO DE COSTO</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='4'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='4'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='4'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
					<!--<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">GUÍA REMISIÓN</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='2'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='2'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='2'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>-->
				</tr>
				<tr>
				<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">GUÍA REMISIÓN</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='2'and pe:Valor!='-'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='2'and pe1:Valor!='-'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='2'and pe2:Valor!='-'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='5'and pe:Valor!='-'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe1:Codigo='5'and pe1:Valor!='-'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='5'and pe2:Valor!='-'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
							</xsl:for-each>
						</font>
					</td>
					<!--<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="1">CENTRO DE COSTO</font>
					</td>
					<td width="20%">
						<font face="Arial, Helvetica, sans-serif" size="1">:
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='4'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='4'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='4'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>-->
				</tr>
				<tr>
					<table border="0" width="100%" cellpadding="2" cellspacing="0">
						<tr>
							<td width="35%">
								<font face="Arial, Helvetica, sans-serif" size="1">DOCUMENTO QUE MODIFICA</font>
							</td>
							<td width="65%">
								<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
									<font face="Arial, Helvetica, sans-serif" size="1">:
										<xsl:value-of select="pe:Invoice/cac:DespatchDocumentReference/cbc:ID"/>
									</font>
								</xsl:if>
								<font face="Arial, Helvetica, sans-serif" size="1">:
									<xsl:for-each select="/pe2:DebitNote/cac:BillingReference/cac:InvoiceDocumentReference">
										<xsl:choose>
											<xsl:when test="//cbc:DocumentTypeCode='01'">FACTURA - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:when test="//cbc:DocumentTypeCode='03'">BOLETA DE VENTA - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:when test="//cbc:DocumentTypeCode='07'">NOTA DE CREDITO - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:when test="//cbc:DocumentTypeCode='08'">NOTA DE DEBITO - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:otherwise>:Documento NN</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
									<xsl:for-each select="/pe2:DebitNote/cac:AdditionalDocumentReference">
										<xsl:choose>
											<xsl:when test="//cbc:DocumentTypeCode='01'">FACTURA - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:when test="//cbc:DocumentTypeCode='03'">BOLETA DE VENTA - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:when test="//cbc:DocumentTypeCode='07'">NOTA DE CREDITO - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:when test="//cbc:DocumentTypeCode='08'">NOTA DE DEBITO - <xsl:value-of select="substring-before(cbc:ID,'-')"/>-<xsl:value-of select="substring-after(cbc:ID,'-')"/></xsl:when>
											<xsl:otherwise>:Documento NN</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</font>
							</td>
						</tr>
						<tr>
							<td width="35%">
								<font face="Arial, Helvetica, sans-serif" size="1">FECHA DE EMISIÓN DEL COMPROBANTE DE PAGO QUE MODIFICA</font>
							</td>
							<td width="65%">
								<font face="Arial, Helvetica, sans-serif" size="1">:
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
										<xsl:if test="pe2:Codigo='6'">
											<xsl:value-of select="pe2:Valor"/>
										</xsl:if>
									</xsl:for-each>
								</font>
							</td>
						</tr>
					</table>
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
				<body/>
			</html>
		</p>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="examples\GRUPOS DE FACTURAS\GRUPO 1 &#x2D; VTAS GRAVADAS CON IGV\01 F1 con 3 items\20520929658&#x2D;01&#x2D;FF11&#x2D;66000001.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->