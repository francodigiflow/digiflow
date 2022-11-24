<?xml version='1.0'?>
<xsl:stylesheet version="1.0" 
   	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
   	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
   	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
   	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
   	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

  	<xsl:template name="bottom_normal">
    	<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
        	<tbody>
				
            	<tr>
               		<td valign="baseline" width="60%" align="center">
                  		<font face="Arial, Helvetica, sans-serif" size="0">
                     	<br/>
                     	<strong>
					 	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='08'">
								<font face="Arial, Helvetica, sans-serif" size="1">								
									<xsl:value-of select="substring-before(pe:Valor,'*')"/>
								</font>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='08'">
								<font face="Arial, Helvetica, sans-serif" size="1">								
									<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
								</font>
							</xsl:if>							
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='08'">
								<font face="Arial, Helvetica, sans-serif" size="1">								
									<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
								</font>
							</xsl:if>							
						</xsl:for-each>
					 
						</strong>
                     	<!--<br/>Res. Nº 0180050000866 del 28/08/2013 - Verifique documento: <strong>www.sunat.gob.pe</strong>-->
						</font>
               		</td>
               		<!--td valign="top" width="10%" align="center"/-->
            	</tr>

				<tr>
					<td>
						<br/>
					</td>
               		<!--td valign="baseline" width="60%" align="center">
                  		<font face="Arial, Helvetica, sans-serif" size="0">
                     	<br/>
                     	<strong>
					 	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='08'">
								<font face="Arial, Helvetica, sans-serif" size="2">								
									<xsl:value-of select="substring-after(pe:Valor,'*')"/>
								</font>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='08'">
								<font face="Arial, Helvetica, sans-serif" size="2">								
									<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
								</font>
							</xsl:if>							
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='08'">
								<font face="Arial, Helvetica, sans-serif" size="2">								
									<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
								</font>
							</xsl:if>							
						</xsl:for-each>
					 
						</strong>
						</font>
					</td-->
				</tr>

				<!--detraccion-->
            	<tr>
					<td>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='08'">
							<xsl:if test="substring-after(pe:Valor,'*')!=''">
								<xsl:call-template name="detraccion"/>
							</xsl:if>
							<xsl:if test="substring-after(pe1:Valor,'*')!=''">	
								<xsl:call-template name="detraccion"/>
							</xsl:if>
							<xsl:if test="substring-after(pe2:Valor,'*')!=''">	
								<xsl:call-template name="detraccion"/>
							</xsl:if>
						</xsl:if>
					</xsl:for-each>
					</td>
            	</tr>

			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="detraccion">
		<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tr>							
				<td valign="top" width="20%" align="center">
					<br/>
				</td>
	
				<td valign="baseline" width="60%" align="center">
					<table border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
						<tr>
               				<td valign="baseline" width="100%" align="center">
                				<font face="Arial, Helvetica, sans-serif" size="2">
                					<strong>
										<xsl:value-of select="substring-after(pe:Valor,'*')"/>
										<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
										<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
										<!--xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='08'">
												<font face="Arial, Helvetica, sans-serif" size="2">								
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</font>
											</xsl:if>
											
											<xsl:if test="pe1:Codigo='08'">
												<font face="Arial, Helvetica, sans-serif" size="2">								
													<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
												</font>
											</xsl:if>
							
											<xsl:if test="pe2:Codigo='08'">
												<font face="Arial, Helvetica, sans-serif" size="2">								
													<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
												</font>
											</xsl:if>
										</xsl:for-each-->
									</strong>
								</font>
               				</td>
						</tr>
					</table>
				</td>
               	<td valign="top" width="20%" align="center">
					<br/>
				</td>

			</tr>
		</table>
	</xsl:template>

   	<xsl:template name="bottom_hash">
    	<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
        	<tr>
               <td valign="baseline" width="55%" align="center">
                  <font face="Arial, Helvetica, sans-serif" size="0">
                     <strong>Valor Resumen : </strong>
                     <xsl:value-of select="//ds:DigestValue"/><br/>
                     <br/>Res. Nº 76 del 2000 - Verifique documento: <strong>www.sunat.gob.pe</strong>
                  </font>
               </td>
               <td valign="top" width="2%" align="center"/>
               <!-- NORMAL -->
               <td align="center" width="43%" valign="middle">
                  <table border="1" bordercolor="#000000" width="100%">
                     <tbody>
                        <tr>
                           <td align="center">
                              <table border="1" bordercolor="#000000" width="100%" cellspacing="0" cellpadding="1" >
                                 <tbody>
                                    <tr>
                                       <td>
                                          <table width="100%" cellpadding="0" cellspacing="6" align="right">
                                             <tr>
                                                <td align="justify" valign="top">
                                                   <font face="Arial, Helvetica, sans-serif" size="1">
                                                      <strong>NOMBRE</strong>
                                                   </font>
                                                </td>
                                                <td align="center" width="100%">
                                                   <font face="Arial, Helvetica, sans-serif" size="1">
                                                      <strong>___________________________________________</strong>
                                                   </font>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td align="left">
                                                   <font face="Arial, Helvetica, sans-serif" size="1">
                                                      <strong>R.U.C.</strong>
                                                   </font>
                                                </td>
                                                <td align="center">
                                                   <font face="Arial, Helvetica, sans-serif" size="1">
                                                      <strong>___________________________________________</strong>
                                                   </font>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td align="left">
                                                   <font face="Arial, Helvetica, sans-serif" size="1">
                                                      <strong>RECINTO</strong>
                                                   </font>
                                                </td>
                                                <td align="center">
                                                   <font face="Arial, Helvetica, sans-serif" size="1">
                                                      <strong>___________________________________________</strong>
                                                   </font>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td align="left">
                                                   <font face="Arial, Helvetica, sans-serif" size="1">
                                                      <strong></strong>
                                                   </font>
                                                </td>
                                                <td align="left">
                                                   <font face="Arial, Helvetica, sans-serif" size="1">
                                                      <strong></strong>
                                                   </font>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td align="left">
                                                   <font face="Arial, Helvetica, sans-serif" size="1">
                                                      <strong>FIRMA</strong>
                                                   </font>
                                                </td>
                                                <td align="center">
                                                   <font face="Arial, Helvetica, sans-serif" size="1">
                                                      <strong>___________________________________________</strong>
                                                   </font>
                                                </td>
                                             </tr>
                                          </table>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="justify" valign="top" colspan="0">
                                          <font face="Arial, Helvetica, sans-serif" size="1"> </font>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </td>
               <!-- FIN Normal -->
            </tr>
         </tbody>
      </table>
   </xsl:template>
</xsl:stylesheet>