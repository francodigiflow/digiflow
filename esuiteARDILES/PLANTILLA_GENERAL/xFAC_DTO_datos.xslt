<?xml version='1.0'?>
<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
   xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
   xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
   xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
   xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
   xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

   <xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

   <xsl:template name="DatosReceptor">
   <table border="1" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
      <tbody>
         <tr>
            <td vAlign="top" width="100%">
              	<table border="0" cellSpacing="2" borderColor="#000000" cellPadding="0" width="100%">
                  	<tbody>
						<tr>
	                    	<td width="14%"><font face="Arial, Helvetica, sans-serif" size="2"><strong>SEÑOR(ES)</strong></font></td>
	                  		<td width="1%" align="center"><font face="Arial, Helvetica, sans-serif" size="1">:</font></td>
	                  		<td width="27%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
								</font>
								<font face="Arial, Helvetica, sans-serif" size="1">			
									<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
								</font>
								<font face="Arial, Helvetica, sans-serif" size="1">			
									<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
								</font>
							</td>
							<td width="8%" align="center">&#160;</td>
							<td width="10%" align="center">&#160;</td>
							<td width="10%" align="center">&#160;</td>
							<td width="10%" align="center">&#160;</td>
							<td width="20%" align="center">&#160;</td>
                     	</tr>
					 	<tr>
	                        <td width="14%"><font face="Arial, Helvetica, sans-serif" size="2"><strong>DIRECCIÓN</strong></font></td>
	                  		<td width="1%" align="center"><font face="Arial, Helvetica, sans-serif" size="1">:</font></td>
							<td width="27%">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>&#160;
								</font>
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>&#160;
								</font>
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>&#160;
								</font>
							</td>
							<td width="8%" align="center">&#160;</td>
							<td width="10%" align="center"><font face="Arial, Helvetica, sans-serif" size="1"><b>COD.CLIENTE</b></font></td>
							<td width="10%" align="center"><font face="Arial, Helvetica, sans-serif" size="1"><b>PEDIDO</b></font></td>
							<td width="10%" align="center"><font face="Arial, Helvetica, sans-serif" size="1"><b>FECHA DE EMISION</b></font></td>
							<td width="20%" align="center"><font face="Arial, Helvetica, sans-serif" size="1"><b>CONDICIÓN DE PAGO</b></font></td>
                     	</tr>
                     	<tr>
                        	<td width="14%"><font face="Arial, Helvetica, sans-serif" size="2"><strong>R.U.C.</strong></font></td>
	                  		<td width="1%" align="center"><font face="Arial, Helvetica, sans-serif" size="2">:</font></td>
	                        <td width="27%"><font face="Arial, Helvetica, sans-serif" size="1"><xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/></font></td>
							<td width="8%" align="center">&#160;</td>
							<!-- Codigo Cliente -->
							<td width="10%" align="center">
								<!--font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
								</font-->	
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='02'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe:Valor"/>
										</font>
									</xsl:if>
								</xsl:for-each>
								
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='02'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe1:Valor"/>
										</font>
									</xsl:if>
								</xsl:for-each>

								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='02'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe2:Valor"/>
										</font>
									</xsl:if>
								</xsl:for-each>
							</td>
							<!-- Pedido -->
							<td width="10%" align="center">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='03'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>
									
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='03'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe1:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='03'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe2:Valor"/>
										</font>
									</xsl:if>
								</xsl:for-each>
							</td>
							<!-- Fecha -->
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
									</font>
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
									</font>
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
									</font>
							</td>
							<!-- Condicion de Pago -->
							<td width="20%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1"><b>VENCE:</b></font>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='04'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											&#160;<xsl:value-of select="pe:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>
									
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='04'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											&#160;<xsl:value-of select="pe1:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='04'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											&#160;<xsl:value-of select="pe2:Valor"/>
										</font>
									</xsl:if>
								</xsl:for-each>
							</td>
                        </tr>
                  	</tbody>
               	</table>
            </td>
         </tr>
	  </tbody>
   </table>
   <br/>
   <table border="1" cellspacing="0" borderColor="#000000" cellpadding="0" width="100%">
   		<tbody>
			  <tr>
	            <td vAlign="top" width="100%">
	              	<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
	                  	<tbody>
							<!-- Factura -->
							<xsl:variable name="val1_a">							
								<xsl:value-of select="substring-before(/pe:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:val1,'@')"/>
								<xsl:value-of select="substring-before(/pe1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:val1,'@')"/>
								<xsl:value-of select="substring-before(/pe2:DebitNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:val1,'@')"/>
							</xsl:variable>
							<xsl:variable name="resto_val1a">
								<xsl:value-of select="substring-after(/pe:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:val1,'@')"/>
								<xsl:value-of select="substring-after(/pe1:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:val1,'@')"/>
								<xsl:value-of select="substring-after(/pe2:DebitNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:val1,'@')"/>
							</xsl:variable>
							<xsl:variable name="val1_b">
								<xsl:value-of select="substring-before($resto_val1a,'@')"/>
							</xsl:variable>
							<xsl:variable name="resto_val1b">
								<xsl:value-of select="substring-after($resto_val1a,'@')"/>
							</xsl:variable>
						
							<tr>
		                    	<td width="50%"><font face="Arial, Helvetica, sans-serif" size="2"><strong>&#160;PUNTO DE LLEGADA :</strong></font></td>
		                  		<td width="10%" align="center">&#160;</td>
								<td width="10%" align="center">&#160;</td>
								<td width="30%" align="center">&#160;</td>
	                     	</tr>
						 	<tr>
		                        <td width="50%">
									
									<font face="Arial, Helvetica, sans-serif" size="1">
										&#160;<xsl:value-of select="$val1_a"/>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='01'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>
									
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='01'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe1:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='01'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe2:Valor"/>
										</font>
									</xsl:if>
								</xsl:for-each>
									</font>
								
								</td>
		                  		<td width="10%" align="center"><font face="Arial, Helvetica, sans-serif" size="1"><b>ALM.</b></font></td>
								<td width="10%" align="center"><font face="Arial, Helvetica, sans-serif" size="1"><b>DOC. INTERNO</b></font></td>
								<td width="30%" align="center"><font face="Arial, Helvetica, sans-serif" size="1"><b>AVISO ESPECIAL</b></font></td>
	                     	</tr>
	                     	<tr>
	                        	<td width="50%">
									
									<font face="Arial, Helvetica, sans-serif" size="1">
										&#160;<xsl:value-of select="$val1_b"/>
									</font>

								</td>
								<!-- ALM -->
								<td width="10%" align="center">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='05'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>
									
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='05'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe1:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='05'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe2:Valor"/>
										</font>
									</xsl:if>
								</xsl:for-each>
								</td>
								<!-- C. VTA. -->
								<td width="10%" align="center">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='09'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>
									
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='09'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe1:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='09'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe2:Valor"/>
										</font>
									</xsl:if>
								</xsl:for-each>
								</td>
								<!-- Aviso Especial -->
								<td width="30%" align="center">
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='06'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>
									
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='06'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe1:Valor"/>
										</font>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='06'">
										<font face="Arial, Helvetica, sans-serif" size="1">								
											<xsl:value-of select="pe2:Valor"/>
										</font>
									</xsl:if>
								</xsl:for-each>
								</td>
	                        </tr>
							<tr>
	                        	<td width="50%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										&#160;<xsl:value-of select="$resto_val1b"/>
									</font>
								</td>
		                  		<td width="10%" align="center">&#160;</td>
								<td width="10%" align="center">&#160;</td>
								<td width="30%" align="center">&#160;</td>
	                        </tr>
	                  	</tbody>
	               	</table>
	            </td>
	         </tr>
      	</tbody>
   </table>
</xsl:template>
</xsl:stylesheet>