<?xml version='1.0' encoding='utf-8' ?>
<xsl:stylesheet version="1.0"
   xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
   xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
   xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
   xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
   xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
   xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
   xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
   xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
   xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
   xmlns:ccts="urn:un:unece:uncefact:documentation:2"> 
   
   <xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
   <xsl:decimal-format name="pen" decimal-separator="," grouping-separator="." NaN=""/>
      
   <xsl:variable name="numColBl">
      <xsl:if test="/pe:Invoice!=''">
	     <xsl:value-of select="21-count(/pe:Invoice/cac:InvoiceLine)"/>
      </xsl:if>
      <xsl:if test="/pe1:CreditNote!=''">
	     <xsl:value-of select="21-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
	  </xsl:if>
      <xsl:if test="/pe2:DebitNote!=''">
	     <xsl:value-of select="21-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
	  </xsl:if>
   </xsl:variable>
   <xsl:include href="xFAC_DTO_encab.xslt"/>
   <xsl:include href="xFAC_DTO_detalle.xslt"/>
   <xsl:include href="xFAC_DTO_bottom.xslt"/>
   <xsl:include href="xFAC_DTO_datos.xslt"/>
   <xsl:include href="xFAC_DTO_total.xslt"/>
   <xsl:template match="/">
      <html xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2" xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2">
         <head>
            <title>Comprobante Electrónico</title>
         </head>
         <body>
            <table border="0" cellSpacing="2" width="100%">
               <tr>
			      <td>
				      <xsl:call-template name="Encabezado"/>
			      </td>
			   </tr>
               <tr>
			      <td>
				      <xsl:call-template name="DatosReceptor"/>
				  </td>
			   </tr>
               <tr>
                  <td>
                     <table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%" align="center">
                        <tbody>
                           <tr>
                              <td vAlign="top" width="100%" align="left">
                                 <xsl:call-template name="DetallesEncabezado"/>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </td>
               </tr>
			   <!--<xsl:call-template name="son-pesos"/>-->
               <tr>
                  <td>
                      <table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%" align="center" heigth="100%">
                        <tbody>
							<tr heigth="100%">						   		
	                        	<td width="35%" vAlign="top" height="100%" align="left">
	                            	<xsl:call-template name="Guia"/>
	                            </td>
	                            <td width="35%" vAlign="top" align="left">
								 	<!--<xsl:call-template name="Guia"/>-->
	                            	<!--<xsl:call-template name="CuadroPago"/>-->
	                            </td>
	                            <td width="30%" vAlign="top" rowSpan="2">
	                                 <xsl:call-template name="Total"/>
	                            </td>
                        	</tr>
							<tr>	
								<td width="35%"> 
								   <xsl:choose>
									      <xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'"><font size="2" face="Arial, Helvetica, sans-serif"></font></xsl:when>
									      <xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font size="2" face="Arial, Helvetica, sans-serif"></font></xsl:when>
									      <xsl:otherwise>
									         <xsl:if test="/pe1:CreditNote"><font size="2" face="Arial, Helvetica, sans-serif"><strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>
									         <xsl:if test="/pe2:DebitNote"><font size="2" face="Arial, Helvetica, sans-serif"><strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>      
									      </xsl:otherwise>
								   </xsl:choose>

					                <!--font face="Arial, Helvetica, sans-serif" size="2">
					                      <strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong>
					                </font-->
								</td>	

								<td width="30%" align="right" colspan="2"> 
						            <!--font face="Arial, Helvetica, sans-serif" size="2">
						                  <strong><xsl:value-of select="//ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty/cbc:Value"/></strong>
						            </font-->

									<xsl:for-each select="//ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
										<xsl:if test="sac:AdditionalProperty/cbc:ID='1002'">
							                <font face="Arial, Helvetica, sans-serif" size="2">
							                      <strong><xsl:value-of select="cbc:Value"/></strong>
							                </font>
										</xsl:if>
									</xsl:for-each>

						            <!--font face="Arial, Helvetica, sans-serif" size="2">
						                  <strong>SERVICIO PRESTADO GRATUITAMENTE</strong>
						            </font-->

								</td>	

							</tr>	
                            <tr>
                              	<td colSpan="2">
                                 	<xsl:call-template name="Referencia"/>
                              	</td>
                           </tr>
                        </tbody>
                     </table>
                  </td>
               </tr>
               <tr><td>&#160;</td></tr>
                  <tr>
                     <td>
                        <table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%" align="center">
                           <tbody>
                              <tr>
                                <td width="100%" align="center">
								 	<xsl:call-template name="bottom_normal"/>
								</td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
            </table>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
