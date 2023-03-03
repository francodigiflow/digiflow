<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" 
				xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" 
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
				xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
				xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
				exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>


	<xsl:template name="Totales">
				<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%" class="tipo2">
					<tbody>
						<tr>
							<th colspan="2">
								<xsl:call-template name="MontoLiteral"/>
							</th>
						</tr>
						<tr>
							
						</tr>
						<tr>
						<th align="left" width="50%">
						
					<br/>
					<xsl:if test="/pe:Invoice">		
						<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									Operación (CIIU 7421) Sujeta al Sistema de Pago de Detracciones <xsl:value-of select="cbc:Percent"/>%
									<br/> D. LEG. N° 940 R. DE SUPERINTENDENCIA N° 056-2006/SUNAT (02-04-2006)
									<br/> BANCO DE LA NACIÓN CTA. CTE. N° 00-000-393533
									<br/><br/>
								</xsl:if>
							</xsl:for-each>
							
							<!--<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='2003'">
									OPERACION SUJETA AL SISTEMA DE PAGO DE OBLIGACIONES
									<br/>TRIBUTARIAS CON EL GOBIERNO CENTRAL.
									<br/>CUENTA ABIERTA EN EL BANCO DE LA NACION
									<br/>NÂ° 00-000-434477
									<br/><br/>
								</xsl:if>
							</xsl:for-each>-->
							</xsl:if>
							
							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:if test="//cbc:Note[@languageLocaleID='2006']">
									Operación (CIIU 7421) Sujeta al Sistema de Pago de Detracciones <xsl:value-of select="format-number(//cac:PaymentTerms/cbc:PaymentPercent,'##0.00','pen')"/>%
									<br/> D. LEG. N° 940 R. DE SUPERINTENDENCIA N° 056-2006/SUNAT (02-04-2006)
									<br/> BANCO DE LA NACIÓN CTA. CTE. N° 00-000-393533
									<br/><br/>
								</xsl:if>
							</xsl:if>
							
						</xsl:if>
		

						</xsl:if>					
						
						<xsl:if test="/pe1:CreditNote">
							<xsl:call-template name="Dato_Notas"/>
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								  
									<xsl:if test="cbc:ID='2003'">
										Operación (CIIU 7421) Sujeta al Sistema de Pago de Detracciones <xsl:value-of select="cbc:Percent"/>%
										<br/> D. LEG. N° 940 R. DE SUPERINTENDENCIA N° 056-2006/SUNAT (02-04-2006)
										<br/> BANCO DE LA NACIÓN CTA. CTE. N° 00-000-393533
										<br/><br/>
									</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:if test="//cbc:Note[@languageLocaleID='2006']">
									Operación (CIIU 7421) Sujeta al Sistema de Pago de Detracciones  <xsl:value-of select="format-number(//cac:PaymentTerms/cbc:PaymentPercent,'##0.00','pen')"/>%
									<br/> D. LEG. N° 940 R. DE SUPERINTENDENCIA N° 056-2006/SUNAT (02-04-2006)
									<br/> BANCO DE LA NACIÓN CTA. CTE. N° 00-000-393533
									<br/><br/>
								</xsl:if>
						</xsl:if>
						<xsl:call-template name="Dato_Notas"/>
						</xsl:if>
					
						</th>

						<th rowspan="2" width="50%" align="right">
						        <xsl:call-template name="Total"/>
					    </th>  
				    </tr>				 
				</tbody>
			</table>
			<br/>
			
			<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
						<xsl:if test="count(/pe:Invoice/cac:InvoiceLine) &gt; '30' and count(/pe:Invoice/cac:InvoiceLine) &lt; '42'">				              							
									<br/>
									<br/>
									<br/>
									<br/>
									<br/>
									<br/>
									<br/>
									<br/>   	
									<br/> 
									<br/>
						</xsl:if>
			<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="1" heigth="100%" class="tipo3">
								<tr>
						<td width="100%">
						
						<!--<xsl:value-of select="count(/pe:Invoice/cac:InvoiceLine)"/>-->   
							DESTINATION CONTROL STATEMENT These comodities, technology or software were exported from the United States in accordance with the Export Administration
							<br/>DESTINATION CONTROL STATEMENT "Applicable Only in Latin America"
							<br/>"This comodities, technology or software were exported from the United States in accordance with the Export Administration Regulation of that Country. Diversion contrary to the provisions of the legal provisions in Latin America, incruding but not limited Argentina, Brazil, Colombia, Costa Rica, Chile, Ecuador, Mexico, Panama, Paraguay, Peru, Uruguay y Venezuela which may prohiba the exportation or importation of certain goods to the countries, entities and persons established in any export laws issued in foreign countries which contain measures to preserve peace and international security is prohibited."
							<br/>DECLARACION DE CONTROL DE DESTINO "Aplica Unicamente en Latinoamérica"
							<br/>"Estos productos, tecnología o programas de cómputo fueron exportados de los Estados Unidos de América en cumplimiento con los Reglamentos de la Administración de Exportaciones (Export Administration Regulations) de aquel país. La violación a lo dispuesto de las leyes de cada pais en Latinoamérica - incluyendo pero limitado a Argentina, Brasil, Colombia, Costa Rica, Chile, Ecuador, México, Panamá, Paraguay, Perú, Uruguay y Venezuela que puedan prohibir la exportación de ciertos bienes a los paises, entidades o personas listadas en cualquiera de las leyes de exportación emitidas en países extranjeros que contengan medidas para preservar la paz y la seguridad internacional está prohibida."
						
						 
						</td>
					</tr>
			</table>
				
				<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="1" heigth="100%" class="tipo3">
								<tr>
						<td width="100%">
							En caso no ser pagado a su vencimiento, este documento generará el interés compensatorio y moratorio a la tasa máxima que fija la ley.
						</td>
					</tr>
				</table>
				 </xsl:if>
				
			<!--</td>
		</tr>	-->	
	</xsl:template>

	<xsl:template name="Total">
	                <xsl:if test="count(/pe:Invoice/cac:InvoiceLine) &gt; '41' and count(/pe:Invoice/cac:InvoiceLine) &lt; '50'">				              							
									<br/>
									<br/>
									<br/>
									<br/>
									<br/>
									<br/>
									<br/>
									<br/>   	
									<br/> 
									<br/> 
			       </xsl:if>

				   
					<table border="1" align="rigth" width="80%" bordercolor="#000000" cellspacing="0" class="tipo2" rules="all">
						<tbody>
                           <tr>
							<td width= "10%" align="left">
								<!--<font face="Consolas" size="1">-->
									OP. GRAVADA
								<!--</font>-->
							</td>

							<td width= "3%" align="left">
								<!--<font face="Consolas" size="1">-->
									<xsl:call-template name="SimboloMoneda"/>
								<!--</font>-->
							</td>
							
							<td width= "10%" align="right">
								<xsl:if test="//cbc:UBLVersionID='2.0'">
										<!--<font face="Consolas" size="1">-->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
												<xsl:if test="cbc:ID='1001'">
													<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
												</xsl:if>
											</xsl:for-each>
										<!--</font>-->
									
								</xsl:if>
								<xsl:if test="//cbc:UBLVersionID='2.1'">
									<xsl:value-of select="format-number($OPGravada,'###,###,##0.00','pen')"/>&#160;	
								</xsl:if>
							</td>
							</tr>

						
						<tr>

							<td width= "10%" align="left">
								<!--<font face="Consolas" size="1">-->
									OP. GRATUITA
								<!--</font>-->
							</td>


							<td width= "3%" align="left">
								<!--<font face="Consolas" size="1">-->
									<xsl:call-template name="SimboloMoneda"/>
								<!--</font>-->
							</td>

							<td  width= "10%" align="right">
							
								<xsl:if test="//cbc:UBLVersionID='2.0'">
									<xsl:choose>
									<xsl:when test="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal/cbc:ID='1004'">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
									</xsl:when>
									<xsl:otherwise>0.00&#160;</xsl:otherwise>
								</xsl:choose>
								</xsl:if>
								<xsl:if test="//cbc:UBLVersionID='2.1'">
									<xsl:value-of select="format-number($OpeGrat*1.18,'###,###,##0.00','pen')"/>&#160;
								</xsl:if>
								<!--</font>-->
							</td>

							</tr>

						<tr>
							<td width= "10%" align="left">
								<!--<font face="Consolas" size="1">-->
									OP. EXONERADA
								<!--</font>-->
							</td>

							<td width= "3%" align="left">
								<!--<font face="Consolas" size="1">-->
									<xsl:call-template name="SimboloMoneda"/>
								<!--</font>-->
							</td>

							<td width= "10%" align="right">
								<xsl:if test="//cbc:UBLVersionID='2.0'">
									<!--<font face="Consolas" size="1">-->
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID='1003'">
												<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
										</xsl:for-each>
									<!--</font>-->
								</xsl:if>
								<xsl:if test="//cbc:UBLVersionID='2.1'">
									<xsl:value-of select="format-number($OPExonerada,'###,###,##0.00','pen')"/>&#160;
								</xsl:if>
							</td>

							</tr>

							<tr>

							<td width= "10%" align="left">
								<!--<font face="Consolas" size="1">-->
									OP. INAFECTA
								<!--</font>-->
							</td>

							
							<td width= "3%" align="left">
								<!--<font face="Consolas" size="1">-->
									<xsl:call-template name="SimboloMoneda"/>
								<!--</font>-->
							</td>
							
							<td width= "10%" align="right">
								<xsl:if test="//cbc:UBLVersionID='2.0'">
									<!--<font face="Consolas" size="1">-->
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
											<xsl:if test="cbc:ID='1002'">
												<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
										</xsl:for-each>
									<!--</font>-->
								</xsl:if>
								<xsl:if test="//cbc:UBLVersionID='2.1'">
									<xsl:value-of select="format-number($OPInafecta,'###,###,##0.00','pen')"/>&#160;
								</xsl:if>
							</td>

							</tr>
						
							<tr>
							<td width= "10%" align="left">
								<!--<font face="Consolas" size="1">-->
									I.G.V.
								<!--</font>-->
							</td>

							<td width= "3%" align="left">
								<!--<font face="Consolas" size="1">-->
									<xsl:call-template name="SimboloMoneda"/>
								<!--</font>-->
							</td>

							<td width= "10%" align="right">
							
							<xsl:if test="//cbc:UBLVersionID='2.0'">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
									<!--<font face="Consolas" size="1">-->
										<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
									<!--</font>-->
								</xsl:for-each>
								<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
									<!--<font face="Consolas" size="1">-->
										<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
									<!--</font>-->
								</xsl:for-each>
								<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
									<!--<font face="Consolas" size="1">-->
										<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
											</xsl:if>
									<!--</font>-->
								</xsl:for-each>
							</xsl:if>
							
							<xsl:if test="//cbc:UBLVersionID='2.1'">
								<xsl:variable name="IGV">
									
									<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
											<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')" />&#160;
										</xsl:if>
									</xsl:for-each>
										
									<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
											<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')" />&#160;
										</xsl:if>
									</xsl:for-each>
										
									<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
											<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')" />&#160;
										</xsl:if>
									</xsl:for-each>
									
								</xsl:variable>
							</xsl:if>
								<xsl:if test="//cbc:UBLVersionID='2.1'">
									<xsl:value-of select="format-number(//cac:TaxTotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>&#160;
								</xsl:if>
							</td>
							</tr>

							<tr>
							<td width= "10%" align="left">
								<!--<font face="Consolas" size="1">-->
									<b>IMPORTE TOTAL</b>
								<!--</font>-->
							</td>

							
							<td width= "3%" align="left">
								<!--<font face="Consolas" size="1">-->
									<b><xsl:call-template name="SimboloMoneda"/></b>
								<!--</font>-->
							</td>

							<td  width= "10%" align="right">
								<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
									<!--<font face="Consolas" size="1">-->
										<b><xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;</b>
										<!--</font>-->
								</xsl:if>

								<xsl:for-each select="/pe2:DebitNote/cac:RequestedMonetaryTotal">
									<!--<font face="Consolas" size="1">-->
										<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">
									      <!--<font face="Consolas" size="1">-->
										<b><xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###,###,##0.00','pen')"/>&#160;</b>
										<!--</font>-->
								       </xsl:if>
									<!--</font>-->
								</xsl:for-each>
							</td>

						</tr>


						</tbody>
					</table>
				<!--</td>
</tr>
		</table>-->
		
	</xsl:template>
	
	
	<xsl:variable name="OPGravada">
		<xsl:value-of select="0.00"/>

		<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
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

		<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
			<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
				<xsl:value-of select="cbc:TaxableAmount"/>
			</xsl:if>
		</xsl:for-each>


		<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
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
	</xsl:variable>
	
	<xsl:variable name="OPExport">
		<xsl:value-of select="0.00"/>
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

	
	
	

	<xsl:template name="MontoLiteral">
		<table border="0" width="100%" cellpadding="0" cellspacing="0" class="tipo2"><tbody><tr>
			<td align="left" width="60%">
				
					<strong>SON:</strong>&#160;
					<xsl:choose>
					<xsl:when test="/pe:Invoice/cbc:ID='F001-14357'">			
						<xsl:value-of select="//cbc:Note[@languageLocaleID='1000']"/>
					</xsl:when>
					<xsl:otherwise>
					<xsl:call-template name="TraeValorVariable">
						<xsl:with-param name="varNumVA" select="04"/>
					</xsl:call-template>
					</xsl:otherwise>
					</xsl:choose>
			</td>
				
			<td align="left" width="40%">
				
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
						<xsl:if test="cbc:ID='2001'">
							<strong>COMPROBANTE DE PERCEPCION </strong>
							Monto de Percepción: <xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/> 
							Total a Pagar: <xsl:value-of select="format-number(sac:TotalAmount,'###,###,##0.00','pen')"/>
						</xsl:if>
					</xsl:for-each>
				
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
	</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20100522030&#x2D;01&#x2D;F001&#x2D;00009020.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->