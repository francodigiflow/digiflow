<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
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

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes" />

	<xsl:template name="Total">
		<table cellSpacing="0" cellPadding="1" border="1" width="100%" rules="all">
			<tr>
   
                 <!-- esta código es para hacer condición 
               si el descuento es >0  debe salir en la facura
                      si no no debe salir =
             <xsl:if test="//cac:AllowanceCharge/cbc:Amount!='0.00'"> 
						 </xsl:if>
						
						 -->
  
    <!--
           <xsl:if test="//cac:AllowanceCharge/cbc:Amount !='0.00'" > -->
		 <xsl:if test="//cac:AllowanceCharge/cbc:ChargeIndicator !='true'">
			
				<td width="10%" align="center">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>TOTAL DSCTO</strong>
					</font>
				</td>
                     </xsl:if>     <!--</xsl:if>-->  
					   


				<td width="10%" align="center">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>OP. GRAVADA</strong>
					</font>
				</td>
				<td width="10%" align="center">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>OP. EXONERADA</strong>
					</font>
				</td>
				<td width="10%" align="center">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
							<xsl:if test="//cbc:UBLVersionID='2.0'">
						
								<b>OP.<br/>
									INAFECTA</b>
									</xsl:if>
							<!--<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">-->
							<xsl:choose>
							
					
							<xsl:when test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
									<xsl:if test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									EXPORTACIÓN</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<xsl:if test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<xsl:if test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:if test="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							
							</xsl:choose>
	                             
										
							<xsl:choose>

									<xsl:when test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
									<xsl:if test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									EXPORTACIÓN</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<xsl:if test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<xsl:if test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:if test="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
</xsl:choose>
							<xsl:choose>

							
							<xsl:when test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
									<xsl:if test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									EXPORTACIÓN</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
									<xsl:if test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
									<xsl:if test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
									<xsl:if test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>
							<xsl:when test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
									<xsl:if test="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount!='0.00'"><b>OP.<br/>
									INAFECTA</b></xsl:if>
							</xsl:when>

							</xsl:choose>
							

					</font>
				</td>
				
				
				
				
				
				
				<td width="13%" align="center">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>OP. GRATUITA</strong>
					</font>
				</td>
				<td width="12%" align="center">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>OTROS CARGOS</strong>
					</font>
				</td>
				<td width="12%" align="center">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>I.S.C.</strong>
					</font>
				</td>
				<td width="11%" align="center">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>I.G.V.</strong>
					</font>
				</td>
				<td width="12%" align="left">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>
							IMPORTE TOTAL
							<xsl:choose>
								<xsl:when test="//cbc:DocumentCurrencyCode = 'PEN'">(S/)</xsl:when>
								<xsl:when test="//cbc:DocumentCurrencyCode = 'USD'">($)</xsl:when>
								<xsl:when test="//cbc:DocumentCurrencyCode = 'EUR'">(€)</xsl:when>
                         		<xsl:otherwise></xsl:otherwise>
               				</xsl:choose>
						</strong>
					</font>
				</td>
			</tr>
			<tr>


			
                 <!-- esta código es para hacer condición 
               si el descuento es >0  debe salir en la facura
                      si no no debe salir
             <xsl:if test="//cac:AllowanceCharge/cbc:Amount!='0.00'"> 
						 </xsl:if>
						
						 -->
			
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
					   <xsl:if test="//cac:AllowanceCharge/cbc:Amount !='0.00'" >  
						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<td width="12%" align="right">
						<xsl:variable name="TotDesc">
							<xsl:value-of select="0" />
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID = '2005'">
									<xsl:value-of select="cbc:PayableAmount" />
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>

						<xsl:value-of select="format-number($TotDesc, '###,###,##0.00', 'pen')" />
						
    </td> </xsl:if> 
	   </xsl:if>  
	   

	     <!--<xsl:if test="//cac:AllowanceCharge/cbc:Amount !='0.00'" > -->
		    <xsl:if test="//cac:AllowanceCharge/cbc:ChargeIndicator !='true' ">
	
						 <xsl:if test="//cbc:UBLVersionID='2.1'">
						<td width="10%" align="right">
						<!--<xsl:variable name="TotDesc">
							<xsl:value-of select="0" />
							<xsl:for-each select="//cac:AllowanceCharge">
						
									<xsl:value-of select="cbc:Amount" />
							
							</xsl:for-each>
						</xsl:variable>

						<xsl:value-of select="format-number($TotDesc, '###,###,##0.00', 'pen')" />-->
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<!--<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="32" /></xsl:call-template>-->
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo = 32">
					<xsl:value-of select="format-number(pe:Valor, '###,###,##0.00', 'pen')" />
			</xsl:if>
		</xsl:for-each></font>
						 </td>
						 </xsl:if>    <!--</xsl:if> -->
 </xsl:if>   						 
						 
						 
					</font>
				
	  



				<!--gravada-->
				<td width="10%" align="right">

					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID = '1001'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')" />
							</xsl:if>
						</xsl:for-each>
						</xsl:if>



						<xsl:if test="//cbc:UBLVersionID='2.1'">
               	<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
											<xsl:if test="cbc:TaxableAmount!='0.00'">
												<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
											</xsl:if>
										</xsl:if>
							</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>

						
						
						<!--<xsl:if test="//cbc:Note[@languageLocaleID='1002']">
							0.00&#xA0;
						</xsl:if>-->



						<xsl:variable name="Gravado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							 <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							
							</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							 <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							
							</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							 <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								
							
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>


 										<xsl:if test="$Gravado = ''">
											0.00&#xA0;
										</xsl:if>


										        </xsl:if>
						
						
					</font>
				</td>

                 
                  
					<td width="12.5%" align="right">
						<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						
						<xsl:if test="//cbc:UBLVersionID='2.0'">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
									<xsl:if test="cbc:ID='1003'">
										<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>&#xA0;
									</xsl:if>
							</xsl:for-each>
						</xsl:if>
							
							<xsl:if test="//cbc:UBLVersionID='2.1'">					
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
										<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
											<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
										<!--</xsl:if>-->
									</xsl:if>
								</xsl:for-each>
					
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<xsl:if test="cbc:TaxableAmount='0.00'">
										<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						
						
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							<xsl:if test="cbc:TaxableAmount='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>
                       
						

							<xsl:variable name="Exonerado">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							  <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							  <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9997'">
							  <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>


 										<xsl:if test="$Exonerado = ''">
											0.00
										</xsl:if>

					   
                                </xsl:if>
							
						
						</font>
					</td>
					


				<!--inafecta-->
				<td width="10%" align="right">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
							<xsl:if test="cbc:ID = '1002'">
								<xsl:value-of select="format-number(cbc:PayableAmount, '###,###,##0.00', 'pen')" />
							</xsl:if>
						</xsl:for-each>
						</xsl:if>
					
					
					<xsl:if test="//cbc:UBLVersionID='2.1'">					
					<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>--></xsl:if>
						</xsl:for-each>
                       
					   <xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>--></xsl:if>
						</xsl:for-each>
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							<!--</xsl:if>--></xsl:if>
						</xsl:for-each>
					   
					   <!--
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:if test="cbc:TaxableAmount='0.00'">
									<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9998'">
							<xsl:if test="cbc:TaxableAmount='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>-->

						<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9995'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:if>
						</xsl:for-each>
                                </xsl:if>
						
					</font>
				</td>
					 		
				
				
				<!--gratuita-->
				<td width="13%" align="right">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<xsl:if test="//cbc:UBLVersionID='2.0'">	
						
						<!-- 
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID = '1004'">
									<xsl:value-of select="cbc:PayableAmount" />
								</xsl:if>
							</xsl:for-each> -->
							<xsl:variable name="OpeGrat">
							<xsl:value-of select="0" />
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID = '1004'">
									<xsl:value-of select="cbc:PayableAmount" />
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>
	
						<xsl:value-of select="format-number($OpeGrat, '###,###,##0.00', 'pen')" />
						

						
					</xsl:if>
					<xsl:if test="//cbc:UBLVersionID='2.1'">
					
					<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
							  <xsl:if test="//cbc:TaxableAmount!='0.00'">
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>


								
							</xsl:if>
							</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
						
						
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>


                   
							
							
							



                            
						<xsl:variable name="Exportacion">
								
                                              <xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
										<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
											<xsl:if test="cbc:TaxableAmount!='0.00'">
												<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>&#xA0;
											</xsl:if>
										</xsl:if>
							</xsl:for-each>

                        
						<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
							<xsl:if test="cbc:TaxableAmount!='0.00'">
								<!--<xsl:call-template name="SimboloMoneda"/> &#xA0;-->
								<xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
							



							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='9996'">
							 <xsl:value-of select="format-number(cbc:TaxableAmount, '###,###,##0.00', 'pen')"/>
								
							
							</xsl:if>
							</xsl:for-each>
							
							</xsl:variable>

	


					</xsl:if>
					</font>
				</td>
				<!--otros cargos-->
				<td width="12%" align="right">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
					<xsl:if test="//cbc:UBLVersionID='2.0'">
						<xsl:choose>
							<xsl:when test="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount != ''">
								<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount, '###,###,##0.00', 'pen')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')" />
							</xsl:otherwise>
						</xsl:choose>
						</xsl:if>
						

						<xsl:if test="//cbc:UBLVersionID='2.1'">
					<xsl:choose>
				
							<xsl:when test="//pe:Invoice/cac:AllowanceCharge/cbc:Amount!= ''">
								<xsl:if test="//cac:AllowanceCharge/cbc:ChargeIndicator= 'true'">
									<xsl:value-of select="format-number(//cac:AllowanceCharge/cbc:Amount, '###,###,##0.00', 'pen')" />
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="format-number(0, '###,###,##0.00', 'pen')" />
							</xsl:otherwise>
							
							
							</xsl:choose>
							</xsl:if>
						 
					
					</font>
				</td>
				<!--isc-->
				<td width="12%" align="right">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<xsl:variable name="ISC">
							<xsl:value-of select="0" />
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '2000'">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')" />
								</xsl:if> 
							</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '2000'">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')" />
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '2000'">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')" />
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>
						
						<xsl:value-of select="format-number($ISC, '###,###,##0.00', 'pen')" />
					</font>
				</td>
				<!--igv-->
				<td width="11%" align="right">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
           <xsl:if test="//cbc:UBLVersionID='2.0'">

       <xsl:variable name="IGV">
	    <xsl:choose>
	    	<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID !='0'">
					<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
						 <xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
						</xsl:if>
						
					</xsl:for-each>

					
					
					<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
						<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
					<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
						<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###,###,##0.00','pen')"/>
					</xsl:if>
					</xsl:for-each>
						<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='-' "> 
							<xsl:value-of select="format-number(0.00,'###,###,##0.00','pen')"/>
						</xsl:if>
				</xsl:when>
				<xsl:otherwise>0.00</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
					
					<xsl:value-of select="$IGV"/>&#xA0; 
						<!--<xsl:variable name="IGV">
							<xsl:for-each select="/pe:Invoice/cac:TaxTotal">
								 <xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')" />
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')" />
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
								<xsl:if test="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = '1000'">
									<xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount, '###,###,##0.00', 'pen')" />
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>

						<xsl:value-of select="$IGV" />-->
						</xsl:if>
						
						
						
						
						

						<xsl:if test="//cbc:UBLVersionID='2.1'">
                           

							<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
										<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
											<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
										<!--</xsl:if>-->
									</xsl:if>
								</xsl:for-each>
					
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
							
										<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
						
						
						<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
							<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							<!--<xsl:if test="cbc:TaxableAmount!='0.00'">-->
							
										<xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>
								<!--</xsl:if>-->
							</xsl:if>
						</xsl:for-each>
                       
						

							<xsl:variable name="IGV">
								<xsl:for-each select="/pe:Invoice/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe1:CreditNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/pe2:DebitNote/cac:TaxTotal/cac:TaxSubtotal">
									<xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:ID='1000'">
							  <xsl:value-of select="format-number(cbc:TaxAmount, '###,###,##0.00', 'pen')"/>&#xA0;
							</xsl:if>
							</xsl:for-each>
							</xsl:variable>


 										<xsl:if test="$IGV = ''">
											0.00
										</xsl:if>


						</xsl:if>
						
						
						
					</font>
				</td>
				<!--importe-->
				<td width="12%" align="right">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount != '0'">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')" />
						</xsl:if>
						<!--en notas de debito-->
						<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount != ''">
							<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount, '###,###,##0.00', 'pen')" />
						</xsl:if>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="Son">
		<table cellSpacing="0" cellPadding="1" width="100%" border="1" rules="none">
			<tr>
				<td width="100%">
					<font color="#000000" size="2" face="Times New Roman, Helvetica, sans-serif">
						<strong>SON: </strong>
						<xsl:call-template name="DatoAdicional01"><xsl:with-param name="var" select="12" /></xsl:call-template>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>

</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="xml\20330791501&#x2D;01&#x2D;FN01&#x2D;00013231.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->