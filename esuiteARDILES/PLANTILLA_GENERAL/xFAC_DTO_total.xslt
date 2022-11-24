<?xml version='1.0'?>
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
   xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2">
   <xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
   
   <xsl:template name="son-pesos">
      <table>
         <td align="left" width="100%">
            <font face="Arial, Helvetica, sans-serif" size="2">
				<strong>Son :&#160;</strong>
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='07'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>
									
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='07'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe1:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='07'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe2:Valor"/>
										</font>
									</xsl:if>
								</xsl:for-each>
            </font>
         </td>
      </table>
   </xsl:template>

  	<xsl:template name="Guia">
   	<table border="0" cellspacing="0" borderColor="#000000" cellpadding="0" width="100%">
      	<tbody>
         	<tr>
            	<td width="100%" align="center">
               		<font face="Arial, Helvetica, sans-serif" size="2">
                 		<!--strong>GUIA DE REMISION</strong><br/-->
				  			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='10'">
									<strong>GUIA DE REMISION</strong><br/>
									<font face="Arial, Helvetica, sans-serif" size="2">								
										<xsl:value-of select="pe:Valor"/>
									</font>
								</xsl:if>
							</xsl:for-each>
									
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='10'">
									<font face="Arial, Helvetica, sans-serif" size="2">								
										<xsl:value-of select="pe1:Valor"/>
									</font>
								</xsl:if>
							</xsl:for-each>

							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='10'">
									<font face="Arial, Helvetica, sans-serif" size="2">								
										<xsl:value-of select="pe2:Valor"/>
									</font>
							</xsl:if>
						</xsl:for-each>
						
               </font>
            </td>
          </tr>
         <tr>
            <td width="30%">
               <font face="Arial, Helvetica, sans-serif" size="1">
                  <strong>&#160;</strong>
               </font>
            </td>
            
         </tr>
         <!--tr>
            <td align="center" width="30%">
               <font face="Arial, Helvetica, sans-serif" size="2">
                  <strong>&#160;</strong>
               </font>
            </td>
         </tr-->
         <!--<tr>
            <td align="center" width="30%">
               <font face="Arial, Helvetica, sans-serif" size="2">&#160;LA CANCELACION DE ESTE DOCUMENTO<br/>POSTERIOR A SU VENCIMIENTO ESTARA<br/>SUJETO A COBRO DE INTERESES</font>
           	   <br/>
			   <br/>
		    </td>
         </tr>-->
		<tr>
			<td valign="baseline" width="55%" align="center">
                <font face="Arial, Helvetica, sans-serif" size="2">
					<strong>&#160;Valor Resumen : </strong>
                    <xsl:value-of select="//ds:DigestValue"/><br/>
             	</font>
            </td>
		</tr>
      </tbody>
   </table>
</xsl:template>

   <xsl:template name="Total">
         <table border="1" width="100%" cellpadding="1" cellspacing="0" bordercolor="#000000" heigth="100%">
            <tr>
               <td width="56%" align="left"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Total Gravado</strong></font></td>
               <td width="44%" align="right"><font face="Arial, Helvetica, sans-serif" size="2">&#160;
                  <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
                     <xsl:if test="cbc:ID='1001'"><xsl:value-of select="format-number(cbc:PayableAmount,'###.###.##0,00','pen')"/>&#160;</xsl:if>
                  </xsl:for-each>
               </font></td>
            </tr>
            <tr>
               <td><font face="Arial, Helvetica, sans-serif" size="2"><strong>Total No Gravado</strong></font></td>
               <td align="right"><font face="Arial, Helvetica, sans-serif" size="2">&#160;
                  <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
                     <xsl:if test="cbc:ID='1002'"><xsl:value-of select="format-number(cbc:PayableAmount,'###.###.##0,00','pen')"/>&#160;</xsl:if>
                  </xsl:for-each>                  
               </font></td>
            </tr>
            <tr>
               <td><font face="Arial, Helvetica, sans-serif" size="2"><strong>Total Exonerado</strong></font></td>
               <td align="right"><font face="Arial, Helvetica, sans-serif" size="2">&#160;
                  <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
                     <xsl:if test="cbc:ID='1003'"><xsl:value-of select="format-number(cbc:PayableAmount,'###.###.##0,00','pen')"/>&#160;</xsl:if>
                  </xsl:for-each>
               </font></td>
            </tr>
            <xsl:if test="//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount!=''">
            <tr>
               <td><font face="Arial, Helvetica, sans-serif" size="2"><strong>Total Descuentos</strong></font></td>
               <td align="right"><font face="Arial, Helvetica, sans-serif" size="2">&#160;
                  <xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount,'###.###.##0,00','pen')"/>&#160;
               </font>
            </td>
            </tr>
            </xsl:if>
            <xsl:if test="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount!=''">
            <tr>
               <td><font face="Arial, Helvetica, sans-serif" size="2"><strong>Total Otros Cargos</strong></font></td>
               <td align="right"><font face="Arial, Helvetica, sans-serif" size="2">&#160;
                  <xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount,'###.###.##0,00','pen')"/>&#160;
               </font>
               </td>
            </tr>
            </xsl:if>
            <xsl:for-each select="/pe:Invoice/cac:TaxTotal">
            <tr>
               <td><font face="Arial, Helvetica, sans-serif" size="2">
			   			<strong>Total <xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name" />&#160;18%
			   			</strong>
					</font>
				</td>
               <td align="right"><font face="Arial, Helvetica, sans-serif" size="2">&#160;
               <xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
                     <xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###.###.##0,00','pen')"/>&#160;
               </xsl:if>
               </font>
               </td>
            </tr>
            </xsl:for-each>
            <xsl:for-each select="/pe1:CreditNote/cac:TaxTotal">
            <tr>
               <td><font face="Arial, Helvetica, sans-serif" size="2"><strong>Total <xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name" />&#160;18%</strong></font></td>
               <td align="right"><font face="Arial, Helvetica, sans-serif" size="2">&#160;
               <xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
                     <xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###.###.##0,00','pen')"/>&#160;
               </xsl:if>
               </font>
               </td>
            </tr>
            </xsl:for-each>
            <xsl:for-each select="/pe2:DebitNote/cac:TaxTotal">
            <tr>
               <td><font face="Arial, Helvetica, sans-serif" size="2"><strong>Total <xsl:value-of select="cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name"/>&#160;18%</strong></font></td>
               <td align="right"><font face="Arial, Helvetica, sans-serif" size="2">&#160;
               <xsl:if test="cac:TaxSubtotal/cbc:TaxAmount!=''">
                     <xsl:value-of select="format-number(cac:TaxSubtotal/cbc:TaxAmount,'###.###.##0,00','pen')"/>&#160;
               </xsl:if>
               </font>
               </td>
            </tr>
            </xsl:for-each>
            
			<tr >
               <td><font face="Arial, Helvetica, sans-serif" size="2"><strong>Importe Total</strong></font></td>
			   <td align="right">
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!=''">
               			<font face="Arial, Helvetica, sans-serif" size="2">&#160;<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:PayableAmount,'###.###.##0,00','pen')"/>&#160;
			   			</font>
					</xsl:if>
					<xsl:if test="//cac:RequestedMonetaryTotal/cbc:PayableAmount!=''">	
               			<font face="Arial, Helvetica, sans-serif" size="2">&#160;<xsl:value-of select="format-number(//cac:RequestedMonetaryTotal/cbc:PayableAmount,'###.###.##0,00','pen')"/>&#160;
			   			</font>
					</xsl:if>
			   </td>
            </tr>
         </table>
   </xsl:template>

   <xsl:template name="Cancelado">
   <table border="1" cellSpacing="0" cellPadding="0" width="100%" borderColor="#000000">
      <tbody>
         <tr>
            <td width="30%">
               <font face="Arial, Helvetica, sans-serif" size="2">
                  <strong>&#160;</strong>
               </font>
            </td>
            <td width="40%" align="center">
               <font face="Arial, Helvetica, sans-serif" size="2">
                  <strong>CANCELADO</strong>
               </font>
            </td>
            <td width="30%" align="right">
               <font face="Arial, Helvetica, sans-serif" size="2">
                  <strong>&#160;</strong>
               </font>
            </td>
         </tr>
         <tr>
            <td width="30%" align="center">
               <font face="Arial, Helvetica, sans-serif" size="2" >
                  <strong>&#160;DIA</strong>
               </font>
            </td>
            <td width="40%" align="center">
               <font face="Arial, Helvetica, sans-serif" size="2">
                  <strong>&#160;MES</strong>
               </font>
            </td>
            <td width="30%" align="center">
               <font face="Arial, Helvetica, sans-serif" size="2">
                  <strong>&#160;AÑO</strong>
               </font>
            </td>
         </tr>
         <tr>
            <td width="30%">
               <font face="Arial, Helvetica, sans-serif" size="2">
                  <strong>&#160;</strong>
               </font>
            </td>
            <td width="40%" align="right">
               <font face="Arial, Helvetica, sans-serif" size="2">
                  <strong>&#160;</strong>
               </font>
            </td>
            <td width="30%" align="right">
               <font face="Arial, Helvetica, sans-serif" size="2">
                  <strong>&#160;</strong>
               </font>
            </td>
         </tr>
         <tr>
            <td colSpan="3" width="30%">
               <font face="Arial, Helvetica, sans-serif" size="2">&#160;Con :</font>
            </td>
         </tr>
      </tbody>
   </table>
</xsl:template>

<xsl:template name="Referencia">
   <table border="0" rules="cols" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
      <tbody>
         <tr>
            <td>
               <table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
                  <tbody>
                     <tr>
                        <td width="100%" align="left">
                           <font face="Arial, Helvetica, sans-serif" size="1">DOCUMENTO(S) DE REFERENCIA :</font>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="50%">
                              <tbody>
                                 <tr>
                                    <td width="60%" align="center">
                                       <font face="Arial, Helvetica, sans-serif" size="1">
                                          <strong>Tipo Documento</strong>
                                       </font>
                                    </td>
                                    <td width="40%" align="center">
                                       <font face="Arial, Helvetica, sans-serif" size="1">
                                          <strong>Correlativo</strong>
                                       </font>
                                    </td>
                                 </tr>
                                    <xsl:for-each select="//cac:DespatchDocumentReference">
                                       <xsl:if test="cbc:DocumentTypeCode != '10'">
                                          <tr>
                                             <td width="30%" align="center">
                                                <font face="Arial, Helvetica, sans-serif" size="1">&#160; 
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
                                                <font face="Arial, Helvetica, sans-serif" size="1">
                                                   <xsl:value-of select="cbc:ID"/>
                                                </font>
                                             </td>
                                          </tr>
                                       </xsl:if>
                                    </xsl:for-each>
                                    <xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
                                       <xsl:if test="cbc:DocumentTypeCode != '10'">
                                          <tr>
                                             <td width="30%" align="center">
                                                <font face="Arial, Helvetica, sans-serif" size="1">&#160; 
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
                                                <font face="Arial, Helvetica, sans-serif" size="1">
                                                   <xsl:value-of select="cbc:ID"/>
                                                </font>
                                             </td>
                                          </tr>
                                       </xsl:if>
                                    </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </td>

         </tr>
      </tbody>
   </table>
</xsl:template>

<xsl:template name="CuadroPago">
   <table border="0"  width="100%">
      <tbody>
         <tr>
            <td vAlign="top">
               <font face="Arial, Helvetica, sans-serif" size="1">&#160;Depositar o transferir electrónicamente a :</font>
            </td>
         </tr>
         <tr>
            <td align="left">
               <font face="Arial, Helvetica, sans-serif" size="2">&#160;<strong></strong></font>
            </td>
         </tr>
         <tr>
            <td align="left">
               <font face="Arial, Helvetica, sans-serif" size="1">&#160;</font>
            </td>
         </tr>
         <tr>
            <td align="left">
               <font face="Arial, Helvetica, sans-serif" size="1">&#160;Avisar a email</font>
            </td>
         </tr>
      </tbody>
   </table>
</xsl:template>
   
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
</xsl:stylesheet>