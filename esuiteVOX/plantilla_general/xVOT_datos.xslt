<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

   	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

   	<xsl:template name="DatosReceptor">
   	<br/>
	<table border="0" cellSpacing="2" borderColor="#000000" cellPadding="2" width="100%">
      <body>
         <tr>
            <td vAlign="top" width="100%" colspan="4">
              	<!-- datos receptor-->
				<table border="2" cellspacing="0" cellpadding="0" width="100%" borderColor="#000000">
				<body>
				<tr>
				<td>
            		<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="2" width="100%">
						<body>
							<tr>
							<td width="10%">
							<font face="Arial, Helvetica, sans-serif" size="2" ><strong>SEÑOR(ES)</strong></font>
							</td>
							<td width="45%">
							<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong> 
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
								</font>
							</td>
							<td width="4%"></td>
							<td width="20%">
							<font face="Arial, Helvetica, sans-serif" size="2" ><strong>FECHA EMISIÓN</strong></font>
							</td>
							<td width="21%">
							<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong> 
												<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
                                				<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
                                				<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
								</font>
							</td>
							</tr>
							
							<tr>
							<td><font face="Arial, Helvetica, sans-serif" size="2" ><strong>
							<xsl:choose>

					<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '0'">NO DOMICILIADO</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">NO DOMICILIADO</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '-'">NO DOMICILIADO</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">NO DOMICILIADO</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '1'">DNI</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '4'">CARNET EXTR.</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CARNET EXTR.</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '6'">R.U.C.</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">R.U.C.</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = '7'">PASAPORTE</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PASAPORTE</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID = 'A'">CED. DIP. IDENT.</xsl:when>
					<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">CED. DIP. IDENT.</xsl:when>

							</xsl:choose>
							</strong></font></td> 
						
				
							<td width="45%">
							<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong> 
											<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />
						
						<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
						
						<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />
						<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID" />
											</font>
							</td>
							<td width="4%"></td>
							<td width="20%"><font face="Arial, Helvetica, sans-serif" size="2" ><strong>MONEDA</strong></font></td>
							<td width="21%">
							<font face="Arial, Helvetica, sans-serif" size="2"><strong>: </strong> 
								
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

								</font>
							</td>
							</tr>
							<tr>
							<td width="10%">
							<font face="Arial, Helvetica, sans-serif" size="2"><strong>DIRECCIÓN</strong></font>
							</td>
							<td width="45%" colspan="4">
							<font face="Arial, Helvetica, sans-serif" size="2"><strong>: </strong>
							<xsl:if test="$VersionUbl!='01'"><!-- UBL 2.0-->
							<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/> 
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>  												
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>  
							<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/> 												
							<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>												
							<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>												
							</xsl:if>					
						
						<xsl:if test="$VersionUbl='01'"><!-- UBL 2.1-->
															<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>													
															<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>  												
															<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>		
						</xsl:if>
						
						
											</font>
							</td>
						
							</tr>
						</body>
					</table>
				</td>
				</tr>
				</body>
				</table>
			
				<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="2" width="100%">
				<body>
					<xsl:if test="/pe1:CreditNote">
					<tr>
					</tr>
							<tr>
						<td colspan="3">
							<xsl:choose>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
									<font size="2" face="Arial, Helvetica, sans-serif"/>
								</xsl:when>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font size="2" face="Arial, Helvetica, sans-serif"></font>
								</xsl:when>
								<xsl:otherwise>
					    	<xsl:if test="/pe1:CreditNote"><font size="2" face="Arial, Helvetica, sans-serif"><strong>MOTIVO: </strong><xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></font></xsl:if>
					    	<xsl:if test="/pe2:DebitNote"><font size="2" face="Arial, Helvetica, sans-serif"><strong>MOTIVO: </strong><xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></font></xsl:if>      

					    	</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
							<tr>
                        		<td width="100%" align="left" colspan="3">
                           			<font face="Arial, Helvetica, sans-serif" size="2"><strong>DOCUMENTO(S) DE REFERENCIA:</strong></font>
                        		</td>
                     		</tr>
                     		<tr>
                        		<td colspan="3">
                           			<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="50%">
                              		<tbody>
                                 		<tr>
                                    		<td width="35%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="2">
                                          			<strong>Tipo de Doc.</strong>
                                       			</font>
                                    		</td>
                                    		<td width="40%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="2">
                                          			<strong>N° documento</strong>
                                       			</font>
                                    		</td>
											<td width="25%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="2">
                                          			<strong>Fecha</strong>
                                       			</font>
                                    		</td>
                              			</tr>
										
                                    	<xsl:for-each select="//cac:DespatchDocumentReference">
                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
                                           			<tr>
														<td width="35%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="2">  
	                                               				<xsl:choose>
	                                                  				<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
	                                                   				<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
	                                                   				<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
	                                                   				<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
	                                                   				<xsl:otherwise>Documento NN</xsl:otherwise>
	                                               				</xsl:choose>
	                                               			</font>
	                                           			</td>
	                                           			<td width="40%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="2">
	                                               				<xsl:value-of select="cbc:ID"/>
	                                               			</font>
	                                           			</td>
														<td>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
																<xsl:if test="pe1:Codigo='10'">

																	<xsl:variable name="Quota">
																		<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="resto1">
																		<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="PesoNeto">
																		<xsl:value-of select="substring-before($resto1,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="resto2">
																		<xsl:value-of select="substring-after($resto1,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="NOrden">
																		<xsl:value-of select="substring-before($resto2,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="resto3">
																		<xsl:value-of select="substring-after($resto2,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="OrdenVenta">
																		<xsl:value-of select="substring-before($resto3,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="resto4">
																		<xsl:value-of select="substring-after($resto3,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="PreciounitarioProvisional">
																		<xsl:value-of select="substring-before($resto4,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="resto5">
																		<xsl:value-of select="substring-after($resto4,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="Pesoprovisional">
																		<xsl:value-of select="substring-before($resto5,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="resto6">
																		<xsl:value-of select="substring-after($resto5,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="FacturaProvisional">
																		<xsl:value-of select="substring-before($resto6,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="resto7">
																		<xsl:value-of select="substring-after($resto6,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="PreciounitarioFinal">
																		<xsl:value-of select="substring-before($resto7,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="resto8">
																		<xsl:value-of select="substring-after($resto7,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="Pesofinales">
																		<xsl:value-of select="substring-before($resto8,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="resto9">
																		<xsl:value-of select="substring-after($resto8,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="FacturaFinal">
																		<xsl:value-of select="substring-before($resto9,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="resto10">
																		<xsl:value-of select="substring-after($resto9,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="Diferencia">
																		<xsl:value-of select="substring-before($resto10,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="resto11">
																		<xsl:value-of select="substring-after($resto10,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="Fechadereferecia">
																		<xsl:value-of select="substring-before($resto11,'*')"/>
																	</xsl:variable>
																	<xsl:variable name="resto12">
																		<xsl:value-of select="substring-after($resto11,'*')"/>
																	</xsl:variable>

																		<xsl:if test="$Fechadereferecia!='-'">
																				<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
																				&#160;<xsl:value-of select="$Fechadereferecia"/>
																				</font>
																		</xsl:if>
																	</xsl:if>
																	</xsl:for-each>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='10'">

																<xsl:variable name="Quota">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="PesoNeto">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="NOrden">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="OrdenVenta">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioProvisional">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesoprovisional">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaProvisional">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioFinal">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesofinales">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaFinal">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="Diferencia">
																	<xsl:value-of select="substring-before($resto10,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto11">
																	<xsl:value-of select="substring-after($resto10,'*')"/>
																</xsl:variable>
																<xsl:variable name="Fechadereferecia">
																	<xsl:value-of select="substring-before($resto11,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto12">
																	<xsl:value-of select="substring-after($resto11,'*')"/>
																</xsl:variable>

																	<xsl:if test="$Fechadereferecia!='-'">
																			<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
																			&#160;<xsl:value-of select="$Fechadereferecia"/>
																			</font>
																	</xsl:if>
																</xsl:if>
																</xsl:for-each>
														</td>
													</tr>
                                    		</xsl:if>
                                    	</xsl:for-each>

                                    	<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
                                        		<tr>
                                           			<td width="30%" align="center">
                                              			<font face="Arial, Helvetica, sans-serif" size="2">  
                                               				<xsl:choose>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
		                                                    	<xsl:otherwise>Documento NN</xsl:otherwise>
		                                                 	</xsl:choose>
        		                                    	</font>
                		                			</td>
                                             		<td width="15%" align="center">
                                                		<font face="Arial, Helvetica, sans-serif" size="2">
                                                			<xsl:value-of select="cbc:ID"/>
                                                		</font>
                                             		</td>
                                          			<td align="center">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='10'">

																<xsl:variable name="Quota">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="NOrden">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="OrdenVenta">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioProvisional">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesoprovisional">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaProvisional">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioFinal">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesofinales">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaFinal">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="Diferencia">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="Fechadereferecia">
																	<xsl:value-of select="substring-before($resto10,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto11">
																	<xsl:value-of select="substring-after($resto10,'*')"/>
																</xsl:variable>

																	<xsl:if test="$Fechadereferecia!='-'">
																			<font face="Arial, Helvetica, sans-serif" size="2">
																			&#160;<xsl:value-of select="$Fechadereferecia"/>
																			</font>
																	</xsl:if>
																</xsl:if>
																</xsl:for-each>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='10'">

																<xsl:variable name="Quota">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="NOrden">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="OrdenVenta">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioProvisional">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesoprovisional">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaProvisional">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioFinal">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesofinales">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaFinal">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="Diferencia">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="Fechadereferecia">
																	<xsl:value-of select="substring-before($resto10,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto11">
																	<xsl:value-of select="substring-after($resto10,'*')"/>
																</xsl:variable>
																	<xsl:if test="$Fechadereferecia!='-'">
																			<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
																			&#160;<xsl:value-of select="$Fechadereferecia"/>
																			</font>
																	</xsl:if>
																</xsl:if>
																</xsl:for-each>
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
						<td colspan="5">
							<xsl:choose>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
									<font size="2" face="Arial, Helvetica, sans-serif"/>
								</xsl:when>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font size="2" face="Arial, Helvetica, sans-serif"></font></xsl:when>
								<xsl:otherwise>
					    	<xsl:if test="/pe1:CreditNote"><font size="2" face="Arial, Helvetica, sans-serif"><strong>MOTIVO : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>
					    	<xsl:if test="/pe2:DebitNote"> <font size="2" face="Arial, Helvetica, sans-serif"><strong>MOTIVO : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>      
					    	</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
							<tr>
                        		<td width="100%" align="left" COLSPAN="5">
                           			<font face="Arial, Helvetica, sans-serif" size="2">DOCUMENTO(S) DE REFERENCIA :</font>
                        		</td>
                     		</tr>
                     		<tr>
                        		<td COLSPAN="5">
                           			<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="50%">
                              		<tbody>
                                 		<tr>
                                    		<td width="35%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="2">
                                          			<strong>Tipo Documento</strong>
                                       			</font>
                                    		</td>
                                    		<td width="40%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="2">
                                          			<strong>Correlativo</strong>
                                       			</font>
                                    		</td>
											<td width="25%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="2">
                                          			<strong>fecha</strong>
                                       			</font>
                                    		</td>
                              			</tr>
                                    	<xsl:for-each select="//cac:DespatchDocumentReference">
                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
                                       			<tr>
                                           			<td width="35%" align="center">
                                              			<font face="Arial, Helvetica, sans-serif" size="2">  
                                               				<xsl:choose>
                                                  				<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
                                                   				<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
                                                   				<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
                                                   				<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
                                                   				<xsl:otherwise>Documento NN</xsl:otherwise>
                                               				</xsl:choose>
                                               			</font>
                                           			</td>
                                           			<td width="40%" align="center">
                                              			<font face="Arial, Helvetica, sans-serif" size="2">
                                               				<xsl:value-of select="cbc:ID"/>
                                               			</font>
                                           			</td>
													<td>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='10'">

																<xsl:variable name="Quota">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="PesoNeto">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="NOrden">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="OrdenVenta">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioProvisional">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesoprovisional">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaProvisional">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioFinal">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesofinales">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaFinal">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="Diferencia">
																	<xsl:value-of select="substring-before($resto10,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto11">
																	<xsl:value-of select="substring-after($resto10,'*')"/>
																</xsl:variable>
																<xsl:variable name="Fechadereferecia">
																	<xsl:value-of select="substring-before($resto11,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto12">
																	<xsl:value-of select="substring-after($resto11,'*')"/>
																</xsl:variable>

																	<xsl:if test="$Fechadereferecia!='-'">
																			<font face="Arial, Helvetica, sans-serif" size="2">
																			&#160;<xsl:value-of select="$Fechadereferecia"/>
																			</font>
																	</xsl:if>
																</xsl:if>
																</xsl:for-each>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='10'">

																<xsl:variable name="Quota">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="PesoNeto">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="NOrden">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="OrdenVenta">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioProvisional">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesoprovisional">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaProvisional">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioFinal">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesofinales">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaFinal">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="Diferencia">
																	<xsl:value-of select="substring-before($resto10,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto11">
																	<xsl:value-of select="substring-after($resto10,'*')"/>
																</xsl:variable>
																<xsl:variable name="Fechadereferecia">
																	<xsl:value-of select="substring-before($resto11,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto12">
																	<xsl:value-of select="substring-after($resto11,'*')"/>
																</xsl:variable>

																	<xsl:if test="$Fechadereferecia!='-'">
																			<font face="Arial, Helvetica, sans-serif" size="2">
																			&#160;<xsl:value-of select="$Fechadereferecia"/>
																			</font>
																	</xsl:if>
																</xsl:if>
																</xsl:for-each>
													</td>
                                       			</tr>
                                    		</xsl:if>
                                    	</xsl:for-each>
                                    	<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
                                        		<tr>
                                           			<td width="30%" align="center">
                                              			<font face="Arial, Helvetica, sans-serif" size="2">  
                                               				<xsl:choose>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
		                                                    	<xsl:otherwise>Documento NN</xsl:otherwise>
		                                                 	</xsl:choose>
        		                                    	</font>
                		                			</td>
                                             		<td width="15%" align="center">
                                                		<font face="Arial, Helvetica, sans-serif" size="2">
                                                			<xsl:value-of select="cbc:ID"/>
                                                		</font>
                                             		</td>
													<td>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='10'">

																<xsl:variable name="Quota">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="NOrden">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="OrdenVenta">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioProvisional">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesoprovisional">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaProvisional">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioFinal">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesofinales">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaFinal">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="Diferencia">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="Fechadereferecia">
																	<xsl:value-of select="substring-before($resto10,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto11">
																	<xsl:value-of select="substring-after($resto10,'*')"/>
																</xsl:variable>

																	<xsl:if test="$Fechadereferecia!='-'">
																			<font face="Arial, Helvetica, sans-serif" size="2">
																			&#160;<xsl:value-of select="$Fechadereferecia"/>
																			</font>
																	</xsl:if>
																</xsl:if>
																</xsl:for-each>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='10'">

																<xsl:variable name="Quota">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="NOrden">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="OrdenVenta">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioProvisional">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesoprovisional">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaProvisional">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioFinal">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesofinales">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaFinal">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="Diferencia">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="Fechadereferecia">
																	<xsl:value-of select="substring-before($resto10,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto11">
																	<xsl:value-of select="substring-after($resto10,'*')"/>
																</xsl:variable>

																	<xsl:if test="$Fechadereferecia!='-'">
																			<font face="Arial, Helvetica, sans-serif" size="2">
																			&#160;<xsl:value-of select="$Fechadereferecia"/>
																			</font>
																	</xsl:if>
																</xsl:if>
																</xsl:for-each>
													</td>
                                          		</tr>
                                       		</xsl:if>
                                    	</xsl:for-each>
                              		</tbody>
                           			</table>
                        		</td>

                     		</tr>
							</xsl:if> 
				</body>
				</table>
			</td>
         </tr>
	  </body>
   	</table>
	</xsl:template>
<xsl:template name="descripcion">
		<xsl:param name="resto"/>
		<td width="16%" align="center"><font face="Arial, Helvetica, sans-serif" size="2" ><xsl:value-of select="substring-before($resto,'*')"/></font></td>
		 <xsl:variable name="res" select="substring-after($resto,'*')"/>
		
		<xsl:if test="$res!=''">
			<xsl:call-template name="descripcion">
				<xsl:with-param name="resto" select="$res"/>
			</xsl:call-template>
		</xsl:if>

	</xsl:template>
	<xsl:template name="Dato10">
		<xsl:param name="var" />

		<xsl:variable name="varvar">
		    <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
				<xsl:if test="pe:Codigo = '10'"><xsl:value-of select="pe:Valor" /></xsl:if>
			</xsl:for-each>
			
		</xsl:variable>
	
		<xsl:variable name="linea1">
			<xsl:value-of select="substring-before($varvar, '*')" />
		</xsl:variable>
		<xsl:variable name="resto1">
			<xsl:value-of select="substring-after($varvar, '*')" />
		</xsl:variable>
		<xsl:variable name="linea2">
			<xsl:value-of select="substring-before($resto1, '*')" />
		</xsl:variable>
		<xsl:variable name="resto2">
			<xsl:value-of select="substring-after($resto1, '*')" />
		</xsl:variable>
		<xsl:variable name="linea3">
			<xsl:value-of select="substring-before($resto2, '*')" />
		</xsl:variable>
		<xsl:variable name="resto3">
			<xsl:value-of select="substring-after($resto2, '*')" />
		</xsl:variable>
		<xsl:variable name="linea4">
			<xsl:value-of select="substring-before($resto3, '*')" />
		</xsl:variable>
		<xsl:variable name="resto4">
			<xsl:value-of select="substring-after($resto3, '*')" />
		</xsl:variable>
		<xsl:variable name="linea5">
			<xsl:value-of select="substring-before($resto4, '*')" />
		</xsl:variable>
		<xsl:variable name="resto5">
			<xsl:value-of select="substring-after($resto4, '*')" />
		</xsl:variable>
		<xsl:variable name="linea6">
			<xsl:value-of select="substring-before($resto5, '*')" />
		</xsl:variable>
		<xsl:variable name="resto6">
			<xsl:value-of select="substring-after($resto5, '*')" />
		</xsl:variable>
		<xsl:variable name="linea7">
			<xsl:value-of select="substring-before($resto6, '*')" />
		</xsl:variable>
		<xsl:variable name="resto7">
			<xsl:value-of select="substring-after($resto6, '*')" />
		</xsl:variable>
		<xsl:variable name="linea8">
			<xsl:value-of select="substring-before($resto7, '*')" />
		</xsl:variable>
		<xsl:variable name="resto8">
			<xsl:value-of select="substring-after($resto7, '*')" />
		</xsl:variable>
		<xsl:variable name="linea9">
			<xsl:value-of select="substring-before($resto8, '*')" />
		</xsl:variable>
		<xsl:variable name="resto9">
			<xsl:value-of select="substring-after($resto8, '*')" />
		</xsl:variable>
		<xsl:variable name="linea10">
			<xsl:value-of select="substring-before($resto9, '*')" />
		</xsl:variable>
		<xsl:variable name="resto10">
			<xsl:value-of select="substring-after($resto9, '*')" />
		</xsl:variable>
		<xsl:variable name="linea11">
			<xsl:value-of select="substring-before($resto10, '*')" />
		</xsl:variable>
		<xsl:variable name="resto11">
			<xsl:value-of select="substring-after($resto10, '*')" />
		</xsl:variable>
		<xsl:variable name="linea12">
			<xsl:value-of select="substring-before($resto11, '*')" />
		</xsl:variable>
		<xsl:variable name="resto12">
			<xsl:value-of select="substring-after($resto11, '*')" />
		</xsl:variable>
		<xsl:variable name="linea13">
			<xsl:value-of select="substring-before($resto12, '*')" />
		</xsl:variable>
		<xsl:variable name="resto13">
			<xsl:value-of select="substring-after($resto12, '*')" />
		</xsl:variable>
		<xsl:variable name="linea14">
			<xsl:value-of select="substring-before($resto13, '*')" />
		</xsl:variable>
		<xsl:variable name="resto14">
			<xsl:value-of select="substring-after($resto13, '*')" />
		</xsl:variable>
		<xsl:variable name="linea15">
			<xsl:value-of select="substring-before($resto14, '*')" />
		</xsl:variable>
		<xsl:variable name="resto15">
			<xsl:value-of select="substring-after($resto14, '*')" />
		</xsl:variable>
		<xsl:variable name="linea16">
			<xsl:value-of select="substring-before($resto15, '*')" />
		</xsl:variable>
		<xsl:variable name="resto16">
			<xsl:value-of select="substring-after($resto15, '*')" />
		</xsl:variable>
		<xsl:variable name="linea17">
			<xsl:value-of select="substring-before($resto16, '*')" />
		</xsl:variable>
		<xsl:variable name="resto17">
			<xsl:value-of select="substring-after($resto16, '*')" />
		</xsl:variable>
		<xsl:variable name="linea18">
			<xsl:value-of select="substring-before($resto17, '*')" />
		</xsl:variable>
		<xsl:variable name="resto18">
			<xsl:value-of select="substring-after($resto17, '*')" />
		</xsl:variable>
		<xsl:variable name="linea19">
			<xsl:value-of select="substring-before($resto18, '*')" />
		</xsl:variable>
		<xsl:variable name="resto19">
			<xsl:value-of select="substring-after($resto18, '*')" />
		</xsl:variable>
		<xsl:variable name="linea20">
			<xsl:value-of select="substring-before($resto19, '*')" />
		</xsl:variable>
		<xsl:variable name="resto20">
			<xsl:value-of select="substring-after($resto19, '*')" />
		</xsl:variable>
		<xsl:variable name="linea21">
			<xsl:value-of select="substring-before($resto20, '*')" />
		</xsl:variable>
		<xsl:variable name="resto21">
			<xsl:value-of select="substring-after($resto20, '*')" />
		</xsl:variable>
		<xsl:variable name="linea22">
			<xsl:value-of select="substring-before($resto21, '*')" />
		</xsl:variable>
		<xsl:variable name="resto22">
			<xsl:value-of select="substring-after($resto21, '*')" />
		</xsl:variable>
		<xsl:variable name="linea23">
			<xsl:value-of select="substring-before($resto22, '*')" />
		</xsl:variable>
		<xsl:variable name="resto23">
			<xsl:value-of select="substring-after($resto22, '*')" />
		</xsl:variable>
		<xsl:variable name="linea24">
			<xsl:value-of select="substring-before($resto23, '*')" />
		</xsl:variable>
		<xsl:variable name="resto24">
			<xsl:value-of select="substring-after($resto23, '*')" />
		</xsl:variable>
		<xsl:variable name="linea25">
			<xsl:value-of select="substring-before($resto24, '*')" />
		</xsl:variable>
		<xsl:variable name="resto25">
			<xsl:value-of select="substring-after($resto24, '*')" />
		</xsl:variable>
		<xsl:variable name="linea26">
			<xsl:value-of select="substring-before($resto25, '*')" />
		</xsl:variable>
		<xsl:variable name="resto26">
			<xsl:value-of select="substring-after($resto25, '*')" />
		</xsl:variable>
		<xsl:variable name="linea27">
			<xsl:value-of select="substring-before($resto26, '*')" />
		</xsl:variable>
		<xsl:variable name="resto27">
			<xsl:value-of select="substring-after($resto26, '*')" />
		</xsl:variable>
		<xsl:variable name="linea28">
			<xsl:value-of select="substring-before($resto27, '*')" />
		</xsl:variable>
		<xsl:variable name="resto28">
			<xsl:value-of select="substring-after($resto27, '*')" />
		</xsl:variable>
		<xsl:variable name="linea29">
			<xsl:value-of select="substring-before($resto28, '*')" />
		</xsl:variable>
		<xsl:variable name="resto29">
			<xsl:value-of select="substring-after($resto28, '*')" />
		</xsl:variable>
		<xsl:variable name="linea30">
			<xsl:value-of select="substring-before($resto29, '*')" />
		</xsl:variable>
		<xsl:variable name="resto30">
			<xsl:value-of select="substring-after($resto29, '*')" />
		</xsl:variable>
	
		<xsl:choose>
			<xsl:when test="$var = '1'"><xsl:value-of select="$linea1" /></xsl:when>
			<xsl:when test="$var = '2'"><xsl:value-of select="$linea2" /></xsl:when>
			<xsl:when test="$var = '3'"><xsl:value-of select="$linea3" /></xsl:when>
			<xsl:when test="$var = '4'"><xsl:value-of select="$linea4" /></xsl:when>
			<xsl:when test="$var = '5'"><xsl:value-of select="$linea5" /></xsl:when>
			<xsl:when test="$var = '6'"><xsl:value-of select="$linea6" /></xsl:when>
			<xsl:when test="$var = '7'"><xsl:value-of select="$linea7" /></xsl:when>
			<xsl:when test="$var = '8'"><xsl:value-of select="$linea8" /></xsl:when>
			<xsl:when test="$var = '9'"><xsl:value-of select="$linea9" /></xsl:when>
			<xsl:when test="$var = '10'"><xsl:value-of select="$linea10" /></xsl:when>
			<xsl:when test="$var = '11'"><xsl:value-of select="$linea11" /></xsl:when>
			<xsl:when test="$var = '12'"><xsl:value-of select="$linea12" /></xsl:when>
			<xsl:when test="$var = '13'"><xsl:value-of select="$linea13" /></xsl:when>
			<xsl:when test="$var = '14'"><xsl:value-of select="$linea14" /></xsl:when>
			<xsl:when test="$var = '15'"><xsl:value-of select="$linea15" /></xsl:when>
			<xsl:when test="$var = '16'"><xsl:value-of select="$linea16" /></xsl:when>
			<xsl:when test="$var = '17'"><xsl:value-of select="$linea17" /></xsl:when>
			<xsl:when test="$var = '18'"><xsl:value-of select="$linea18" /></xsl:when>
			<xsl:when test="$var = '19'"><xsl:value-of select="$linea19" /></xsl:when>
			<xsl:when test="$var = '20'"><xsl:value-of select="$linea20" /></xsl:when>
			<xsl:when test="$var = '21'"><xsl:value-of select="$linea21" /></xsl:when>
			<xsl:when test="$var = '22'"><xsl:value-of select="$linea22" /></xsl:when>
			<xsl:when test="$var = '23'"><xsl:value-of select="$linea23" /></xsl:when>
			<xsl:when test="$var = '24'"><xsl:value-of select="$linea24" /></xsl:when>
			<xsl:when test="$var = '25'"><xsl:value-of select="$linea25" /></xsl:when>
			<xsl:when test="$var = '26'"><xsl:value-of select="$linea26" /></xsl:when>
			<xsl:when test="$var = '27'"><xsl:value-of select="$linea27" /></xsl:when>
			<xsl:when test="$var = '28'"><xsl:value-of select="$linea28" /></xsl:when>
			<xsl:when test="$var = '29'"><xsl:value-of select="$linea29" /></xsl:when>
			<xsl:when test="$var = '30'"><xsl:value-of select="$linea30" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Homologacion_bat\xml_bat\20261180937&#x2D;08&#x2D;FF12&#x2D;00000051.xml.orig.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->