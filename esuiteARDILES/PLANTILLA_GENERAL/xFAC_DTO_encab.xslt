<?xml version='1.0'?>
<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
   xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
   xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
   xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
   xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
   xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
   xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
   xmlns:ds="http://www.w3.org/2000/09/xmldsig#"  
   xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
   xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
   xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
   <xsl:template name="Encabezado">
   <table border="0" cellPadding="1" width="100%">
      <tbody>
         <tr height="100%">
            <td vAlign="middle" width="70%">
               <xsl:call-template name="EncabezadoPeru"/>
            </td>
            <td vAlign="top" width="30%">
               <xsl:call-template name="EncabezadoRecuadro"/>
            </td>
         </tr>
      </tbody>
   </table>
</xsl:template>

   <xsl:template name="EncabezadoPeru">
   <table border="0" cellSpacing="0" cellPadding="0" width="90%">
      <tbody>
         <tr>
            <td width="50%" align="center">
               <table border="0" cellSpacing="0" cellPadding="0" width="100%">
                  <tbody>
                     <!--<tr>
                        <td align="left">
                           <img src="logo_pana.jpg"/>
                        </td>
                     </tr>
					 <tr>
					 	<td align="left">
                           	<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
                              <br/>
                              <b>Panasonic Peruana S.A.</b>
						   	</font>
							<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
                              	<br/>
                              		Av. Alfredo Mendiola Nº 1600 - Independencia
								<br/>
									Tel.: 614-0000 Fax: 614-0001 Lima - Perú
						   	</font>
							
							  
                           
                        </td>
					 </tr>-->
					 
                     	<tr>
                        	<td align="left">
                           		<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
                              		<br/>
                              		<xsl:value-of select="//cbc:Name"/>&#160; 
                           		</font>
                        	</td>
                     	</tr>
                     	<tr>
                        	<td width="100%" align="left">
                           		<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
                              		<xsl:value-of select="//cbc:StreetName "/>
                           		</font>
                        	</td>
                     	</tr>
					 
                  </tbody>
               </table>
            </td>
            <td vAlign="top" width="50%" align="left">
               <table border="0" cellSpacing="0" cellPadding="0" width="100%">
                  <tbody>
                     <tr>
                        <td>
                           <font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
                              <strong></strong>&#160; 
                           </font>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <font color="#000000" size="1" face="Arial, Helvetica, sans-serif">&#160;</font>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <font color="#000000" size="1" face="Arial, Helvetica, sans-serif">&#160;</font>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <font color="#000000" size="1" face="Arial, Helvetica, sans-serif">&#160;</font>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </td>
         </tr>
      </tbody>
   </table>
</xsl:template>

<xsl:template name="EncabezadoRecuadro">
   <table border="0" width="100%">
      <tbody>
         <tr>
            <td>
               <table border="1" cellSpacing="0" borderColor="#000000" cellPadding="15" width="100%">
                  <tbody>
                     <tr>
                        <td vAlign="top" width="100%" align="center">
                           <font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
                              <strong>R.U.C.: 
                                 <xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>
                                 <br/>
                                 <br/>
                                 <xsl:call-template name="tipodocu"/>
                                 <br/>
                                 <xsl:call-template name="NFolio"/>
                              </strong>
                              <br/>
                           </font>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </td>
         </tr>
         <tr>
            <td align="center">
               <font face="Arial, Helvetica, sans-serif" size="2">
                  <!-- <strong>SUNAT- CENTRO LIMA</strong> -->
               </font>
            </td>
         </tr>
      </tbody>
   </table>
</xsl:template>

<xsl:template name="tipodocu">
   <xsl:choose>
      <xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">Factura Electrónica</font></xsl:when>
      <xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">Boleta Electrónica</font></xsl:when>
      <xsl:otherwise>
         <xsl:if test="/pe1:CreditNote"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">Nota de Crédito Electrónica</font></xsl:if>
         <xsl:if test="/pe2:DebitNote"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">Nota de Débito Electrónica</font></xsl:if>      
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template name="NFolio">
   <br/>Nº 
   <xsl:value-of select="/pe:Invoice/cbc:ID"/>
   <xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
   <xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
   <br/>
</xsl:template>
</xsl:stylesheet>