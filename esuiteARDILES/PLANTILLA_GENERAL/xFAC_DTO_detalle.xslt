<?xml version='1.0'?>
<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
   xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
   xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
   xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
   xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2">
   
   <xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
   
   <xsl:template name="DetallesEncabezado">
      <table border="0" width="100%" cellpadding="0" cellspacing="0">
         <tr>
            <td>
               <table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
                  <tr>
                     <td width="16%" align="center">
                        <font face="Arial, Helvetica, sans-serif" size="2">
                              <strong>Código</strong>
                        </font>
                     </td>
                     <td width="45%" align="center">
                        <font face="Arial, Helvetica, sans-serif" size="2">
                              <strong>Descripción</strong>
                        </font>
                     </td>
                     <td width="8%" align="center">
                        <font face="Arial, Helvetica, sans-serif" size="2">
                              <strong>Unidad</strong>
                        </font>
                     </td>
                     <td width="8%" align="center">
                        <font face="Arial, Helvetica, sans-serif" size="2">
                              <strong>Cantidad</strong>
                        </font>
                     </td>
                     <td width="10%" align="center">
                        <font face="Arial, Helvetica, sans-serif" size="2">
                              <strong>P. Unitario</strong>
                        </font>
                     </td>
                     <td width="13%" align="center">
                        <font face="Arial, Helvetica, sans-serif" size="2">
                              <strong>Valor Venta</strong>
                        </font>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr><td height="5px"/></tr>
         <tr>
            <td>
               <table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
                  <xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
                     <tr>
                        <td width="16%" align="center"><font face="Arial, Helvetica, sans-serif" size="1">
                           <xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/></font> </td>
                        <td width="45%" align="left"><font face="Arial, Helvetica, sans-serif" size="1">
                           &#160;<xsl:value-of select="cac:Item/cbc:Description"/></font></td>
                        <td width="8%" align="center"><font face="Arial, Helvetica, sans-serif" size="1">
                           <xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/></font></td>
                        <td width="8%" align="center"><font face="Arial, Helvetica, sans-serif" size="1">
                           <xsl:value-of select="cbc:InvoicedQuantity"/></font> </td>
                        <td width="10%" align="right"><font face="Arial, Helvetica, sans-serif" size="1">
                     		<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###.###.##0,00','pen')"/>&#160;</font></td>
                        <td width="13%" align="right"><font face="Arial, Helvetica, sans-serif" size="1">
                           <xsl:value-of select="format-number(cbc:LineExtensionAmount,'###.###.##0,00','pen')"/></font> </td>
                     </tr>
                  </xsl:for-each>
                  <xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
                     <tr>
                        <td width="16%" align="center"><font face="Arial, Helvetica, sans-serif" size="1">
                           <xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/></font> </td>
                        <td width="45%" align="left"><font face="Arial, Helvetica, sans-serif" size="1">
                           &#160;<xsl:value-of select="cac:Item/cbc:Description"/></font></td>
                        <td width="8%" align="center"><font face="Arial, Helvetica, sans-serif" size="1">
                           <xsl:value-of select="cbc:CreditedQuantity/@unitCode"/></font></td>
                        <td width="8%" align="center"><font face="Arial, Helvetica, sans-serif" size="1">
                           <xsl:value-of select="cbc:CreditedQuantity"/></font> </td>
                        <td width="10%" align="right"><font face="Arial, Helvetica, sans-serif" size="1">
                     		<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###.###.##0,00','pen')"/>&#160;</font></td>
                        <td width="13%" align="right"><font face="Arial, Helvetica, sans-serif" size="1">
                           <xsl:value-of select="format-number(cbc:LineExtensionAmount,'###.###.##0,00','pen')"/></font> </td>
                     </tr>
                  </xsl:for-each>
                  <xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
                     <tr>
                        <td width="16%" align="center"><font face="Arial, Helvetica, sans-serif" size="1">
                           <xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/></font> </td>
                        <td width="45%" align="left"><font face="Arial, Helvetica, sans-serif" size="1">
                           &#160;<xsl:value-of select="cac:Item/cbc:Description"/></font></td>
                        <td width="8%" align="center"><font face="Arial, Helvetica, sans-serif" size="1">
                           <xsl:value-of select="cbc:DebitedQuantity/@unitCode"/></font></td>
                        <td width="8%" align="center"><font face="Arial, Helvetica, sans-serif" size="1">
                           <xsl:value-of select="cbc:DebitedQuantity"/></font> </td>
                        <td width="10%" align="right"><font face="Arial, Helvetica, sans-serif" size="1">
                     		<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###.###.##0,00','pen')"/>&#160;</font></td>
                        <td width="13%" align="right"><font face="Arial, Helvetica, sans-serif" size="1">
                           <xsl:value-of select="format-number(cbc:LineExtensionAmount,'###.###.##0,00','pen')"/></font> </td>
                     </tr>
                  </xsl:for-each>                  
                  <xsl:call-template name="lineaBl">
                     <xsl:with-param name="cont" select="$numColBl"/>
                     <table>
                        <tr>
                           <td align="center" valign="top" width="15%">
                              <font face="Arial, Helvetica, sans-serif" size="2">
                                 <xsl:call-template name="total"/>
                              </font>
                           </td>
                        </tr>
                     </table>
                  </xsl:call-template>
               </table>
            </td>
         </tr>
      </table>
   </xsl:template>

   <xsl:template name="lineaBl">
      <xsl:param name="cont"/>
      <xsl:if test="$cont>0">
         <tr>
            <td width="16%" align="center" valign="top">
               <font face="Arial, Helvetica, sans-serif" size="1"> </font>
            </td>
            <td width="45" align="center" valign="top">
               <font face="Arial, Helvetica, sans-serif" size="1"> </font>
            </td>
            <td width="8%" align="center">
               <font face="Arial, Helvetica, sans-serif" size="1"> </font>
            </td>
            <td width="8%" align="center">
               <font face="Arial, Helvetica, sans-serif" size="1"> </font>
            </td>
            <td width="10%" align="center">
               <font face="Arial, Helvetica, sans-serif" size="1"> </font>
            </td>
            <td width="13%" align="center">
               <font face="Arial, Helvetica, sans-serif" size="1"> </font>
            </td>
         </tr>
         <xsl:call-template name="lineaBl">
            <xsl:with-param name="cont" select="$cont - 1"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>