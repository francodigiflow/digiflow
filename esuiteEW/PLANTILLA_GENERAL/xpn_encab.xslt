<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Encabezado">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="middle" width="68%">
						<xsl:call-template name="EncabezadoPeru"/>
					</td>
					<td vAlign="top" width="32%">
						<xsl:call-template name="EncabezadoRecuadro"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru">
	<p>
		<table cellSpacing="2" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td width="40%" align="center">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td align="left">
									
         								<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20514020907'">
										<img src="logo_PN.jpg"/>
										</xsl:if>
         								
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20507884823'">
		 								<img src="logo_MS.jpg"/>
		 								</xsl:if>     

                                        <xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20515306243'">
										<img src="cew.jpg"/>
										</xsl:if>
         								
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20293217280'">
		 								<img src="gelan.jpg"/>
		 								</xsl:if> 										
     
	                                    <xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20527030421'">
		 								<img src="maderacre.jpg"/>
		 								</xsl:if> 
										
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20517985547'">
		 								<img src="tulcea.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20416026948'">
		 								<img src="panisteria.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20553255881'">
		 								<img src="logo_mediterraneo.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20507885391'">
		 								<img src="libreria.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20517985971'">
		 								<img src="tulcea.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20601510287'">
		 								<img src="logo_mediterraneo.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20429976929'">
		 								<img src="apch.png"/>
		 								</xsl:if>
                                        <xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20546627340'">
		 								<img src="gramas.jpg"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20102184620'">
		 								<img src="tulcea.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20101852629'">
		 								
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20556166120'">
		 								<img src="tulcea.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20537350700'">
		 								
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20600409019'">
		 								<img src="logo_pca.png"/>
		 								</xsl:if>	
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20563468646'">
		 								<img src="produsana.png"/>
		 								</xsl:if>										
										
<xsl:if test="//cbc:UBLVersionID='2.1'">
<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20514020907'">
										<img src="logo_PN.jpg"/>
										</xsl:if>
         								
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20507884823'">
		 								<img src="logo_MS.jpg"/>
		 								</xsl:if>     

                                        <xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20515306243'">
										<img src="cew.jpg"/>
										</xsl:if>
         								
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20293217280'">
		 								<img src="gelan.jpg"/>
		 								</xsl:if> 										
     
	                                    <xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20527030421'">
		 								<img src="maderacre.jpg"/>
		 								</xsl:if> 
										
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20517985547'">
		 								<img src="tulcea.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20416026948'">
		 								<img src="panisteria.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20553255881'">
		 								<img src="logo_mediterraneo.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20507885391'">
		 								<img src="libreria.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20517985971'">
		 								<img src="tulcea.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20601510287'">
		 								<img src="logo_mediterraneo.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20429976929'">
		 								<img src="apch.png"/>
		 								</xsl:if>
                                        <xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20546627340'">
		 								<img src="gramas.jpg"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20102184620'">
		 								<img src="tulcea.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20101852629'">
		 								
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20556166120'">
		 								<img src="tulcea.png"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20537350700'">
		 								
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20600409019'">
		 								<img src="logo_pca.png"/>
		 								</xsl:if>	
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20563468646'">
		 								<img src="produsana.png"/>
		 								</xsl:if>										
										</xsl:if>	

									</td>
								</tr>
								
							</tbody>
						</table>
					</td>
					<td valign="middle" width="60%" align="center">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td valign="middle" align="center">
										<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
											<strong>

												<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name"/>
											<!--<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20514020907'">
												<xsl:value-of select="//cac:PartyName/cbc:Name"/>
											</xsl:if>
         								
											<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20507884823'">
		 										<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 									</xsl:if>     

                                           <xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20515306243'">
										       <xsl:value-of select="//cac:PartyName/cbc:Name"/>
										</xsl:if>
         								
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20293217280'">
		 								       <xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if> 													
                                        <xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20527030421'">
		 								      <xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if> 	
										 <xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20517985547'">
		 								        	<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if> 	
										
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20416026948'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20553255881'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20507885391'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20517985971'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20601510287'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20429976929'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if>
                                        <xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20546627340'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20102184620'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20101852629'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20556166120'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20537350700'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20542849429'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if>		
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20600409019'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if>
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20563468646'">
		 								<xsl:value-of select="//cac:PartyName/cbc:Name"/>
		 								</xsl:if>-->
																			
											</strong>
										</font>
									</td>
								</tr>
								<tr>
									<td valign="middle" align="center">
									
											<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<br/>
											<xsl:value-of select="//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
													<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20514020907'">
													<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
												<br/>
												LA MOLINA-LIMA
												<br/>
												TELEFONO: 202-1111
												<br/>
													 <xsl:variable name="DatoAdicional01">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='01'">
											<xsl:value-of select="pe:Valor"/> 
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='01'">
											<xsl:value-of select="pe1:Valor"/> 
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='01'">
											<xsl:value-of select="pe2:Valor"/> 
									</xsl:if>
								</xsl:for-each>
							</xsl:variable>
<!--or $DatoAdicional01 !='Gran Terminal Terrestre'-->
                                   <xsl:if test="substring($DatoAdicional01,1,1) != 'G'">
                                         				AV. TUPAC AMARU S/n
												<br/>
												INDEPENDENCIA-LIMA 				     							
								   </xsl:if>
							       <xsl:if test="substring($DatoAdicional01,1,1) = 'G'">
                                            <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='01'">
												<b><xsl:value-of select="pe:Valor"/></b>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='01'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='01'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>   	
										         <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='02'">
											<br/>
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='02'">
											<br/>
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='02'">
											<br/>
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>   									     															     							
                                   </xsl:if>						
												
											</xsl:if>
         								
											<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20507884823'">
		 											<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
<br/>
												LA MOLINA - LIMA - LIMA
												<br/>
												TELEFONO: 202-1111
												<br/>
												AV. LOS LIRIOS N° 301
												<br/>
											    SAN JUAN DE MIRAFLORES - LIMA - LIMA

										</xsl:if>     

                                           <xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20515306243'">
										      <xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
<br/>
												LA MOLINA-LIMA
												<br/>
												TELEFONO: 202-1111
												
										   </xsl:if>
         								
										  <xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20293217280'">
		 								       	<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
<br/>
												LA MOLINA-LIMA
																								
		 								</xsl:if> 													
                                        <xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20527030421'">
		 								        <xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
<br/>
												MADRE DE DIOS TAHUAMANU - IÑAPARI
												<br/>
												TELEFONO: 202-1111
												<br/>
		 								</xsl:if> 	
                                         <xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20517985547'">
		 								        <xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
												<br/>
												
		 								</xsl:if> 	
										
									<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20416026948'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20553255881'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20507885391'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20517985971'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20601510287'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20429976929'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if>
                                        <xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20546627340'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20102184620'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20101852629'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20556166120'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20537350700'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20542849429'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if>
										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20600409019'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if>										

										<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID='20563468646'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LIMA - LIMA - SANTIAGO DE SURCO
		 								</xsl:if>		

<!--UBL 2.1-->

	<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20514020907'">
													<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
												<br/>
												LA MOLINA-LIMA
												<br/>
												TELEFONO: 202-1111
												<br/>
													 <xsl:variable name="DatoAdicional01">
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='01'">
											<xsl:value-of select="pe:Valor"/> 
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
									<xsl:if test="pe1:Codigo='01'">
											<xsl:value-of select="pe1:Valor"/> 
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
									<xsl:if test="pe2:Codigo='01'">
											<xsl:value-of select="pe2:Valor"/> 
									</xsl:if>
								</xsl:for-each>
							</xsl:variable>
<!--or $DatoAdicional01 !='Gran Terminal Terrestre'-->
                                   <xsl:if test="substring($DatoAdicional01,1,1) != 'G'">
                                         				AV. TUPAC AMARU S/n
												<br/>
												INDEPENDENCIA-LIMA 				     							
								   </xsl:if>
							       <xsl:if test="substring($DatoAdicional01,1,1) = 'G'">
                                            <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='01'">
												<b><xsl:value-of select="pe:Valor"/></b>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='01'">
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='01'">
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>   	
										         <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
											<xsl:if test="pe:Codigo='02'">
											<br/>
												<xsl:value-of select="pe:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
											<xsl:if test="pe1:Codigo='02'">
											<br/>
												<xsl:value-of select="pe1:Valor"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
											<xsl:if test="pe2:Codigo='02'">
											<br/>
												<xsl:value-of select="pe2:Valor"/>
											</xsl:if>
										</xsl:for-each>   									     															     							
                                   </xsl:if>						
												
											</xsl:if>
         								
											<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20507884823'">
		 											<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
<br/>
												LA MOLINA - LIMA - LIMA
												<br/>
												TELEFONO: 202-1111
												<br/>
												AV. LOS LIRIOS N° 301
												<br/>
											    SAN JUAN DE MIRAFLORES - LIMA - LIMA

										</xsl:if>     

                                           <xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20515306243'">
										      <xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
<br/>
												LA MOLINA-LIMA
												<br/>
												TELEFONO: 202-1111
												
										   </xsl:if>
         								
										  <xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20293217280'">
		 								       	<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
<br/>
												LA MOLINA-LIMA
																								
		 								</xsl:if> 													
                                        <xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20527030421'">
		 								        <xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
<br/>
												MADRE DE DIOS TAHUAMANU - IÑAPARI
												<br/>
												TELEFONO: 202-1111
												<br/>
		 								</xsl:if> 	
                                         <xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20517985547'">
		 								        <xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
												<br/>
												
		 								</xsl:if> 	
										
									<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20416026948'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20553255881'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20507885391'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20517985971'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20601510287'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20429976929'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if>
                                        <xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20546627340'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20102184620'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20101852629'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20556166120'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20537350700'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if> 
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20542849429'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if>
										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20600409019'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LA MOLINA-LIMA
		 								</xsl:if>										

										<xsl:if test="//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID='20563468646'">
		 								<xsl:value-of select="//cac:Party/cac:PostalAddress/cbc:StreetName"/>
                                             <br/>
												LIMA - LIMA - SANTIAGO DE SURCO
		 								</xsl:if>		
	

											</font>				
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>&#160; </td>
				</tr>
			</tbody>
		</table>
	</p>
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro">
	<table cellSpacing="0" cellPadding="0" width="100%" border="1">
		<tbody>
			<tr>
				<td>
					<table borderColor="#000000" cellSpacing="0" cellPadding="15" width="100%" border="1">
						<tbody>
							<tr>
								<td vAlign="top" width="100%" align="center">
									<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
										<strong>R.U.C.: 
										<xsl:if test="//cbc:UBLVersionID='2.0'">
											<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>
											</xsl:if>
										<xsl:if test="//cbc:UBLVersionID='2.1'">
														
										<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID,'#########','pen')"/>
											
										</xsl:if>
											<br/>
											<br/>
											<xsl:call-template name="tipodocu"/>
											<br/>
											<xsl:call-template name="NFolio"/>
										</strong>
										
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center">
					<font size="2" face="Arial, Helvetica, sans-serif"><!-- <strong>SUNAT- CENTRO LIMA</strong> --></font>
				</td>
			</tr>
		</tbody>
	</table>
	</xsl:template>

<xsl:template name="tipodocu">
	<xsl:choose>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
			<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">FACTURA ELECTRONICA</font>
		</xsl:when>
		<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRONICA</font></xsl:when>
		<xsl:otherwise>
         <xsl:if test="/pe1:CreditNote"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE CREDITO ELECTRONICA</font></xsl:if>
         <xsl:if test="/pe2:DebitNote"><font color="#000000" size="4" face="Arial, Helvetica, sans-serif">NOTA DE DEBITO ELECTRONICA</font></xsl:if>      
      </xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!--
<xsl:template name="NFolio">
	<br/>Nº 
	<xsl:value-of select="/pe:Invoice/cbc:ID"/>
	<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
	<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
	<br/>
</xsl:template>
-->
	<xsl:template name="NFolio">
		<br/>Nº 
		<xsl:if test="/pe:Invoice">
		<xsl:value-of select="substring-before(/pe:Invoice/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe:Invoice/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
		<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe1:CreditNote/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
		<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe2:DebitNote/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<br/>
	</xsl:template>



<xsl:template match="/">
	<html><head></head>
		<body/>
	</html>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="20254053822-01-FF11-10331676.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->