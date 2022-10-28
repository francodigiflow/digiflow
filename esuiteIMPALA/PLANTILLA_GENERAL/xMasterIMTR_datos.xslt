<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

<!--##TRAFIGURA##-->
	<xsl:template name="DatosCliente_T">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top">
						<xsl:call-template name="DatosReceptor_T"/>
					</td>
				</tr>
				
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template name="DatosReceptor_T">
		<table border="0" cellSpacing="0" cellPadding="2" width="100%"><tbody>
				<!--TABLA RECEPTOR 1-->
				<tr>
				  <td valign="top" width="100%">
						
						<table border="0" cellSpacing="0" cellPadding="2" width="100%" rules="none">
								<tbody>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b><xsl:call-template name="TipoDeDocumento"/></b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--DOCUMENTO DEL USUARIO O ADQUIRENTE -->
												<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>			
												<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>							
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>FECHA EMISIÓN:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--FECHA EMISION-->
												<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
												<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
												<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
											</font>
										</td>
									</tr>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>SEÑOR (ES):</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--NOMBRE O RAZON SOCIAL DEL USUARIO O ADQUIRENTE-->
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>TIPO MONEDA:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--TIPO MONEDA-->
												<xsl:call-template name="TipoDeMoneda"/>
											</font>
										</td>
									</tr>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>DIRECCIÓN:</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--DIRECCION-->
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
                                                <xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							                    <xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							                    <xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
									

										
											</font>
										</td>
										<td width="15%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">&#160;</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">&#160;</font>
										</td>
									</tr>
									
								</tbody>
						</table>
				</td></tr>

				<!--DATOS VAPOR-->
											<xsl:variable name="A">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="01"/>
												</xsl:call-template>
											</xsl:variable>

											<xsl:variable name="B">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="02"/>
												</xsl:call-template>
											</xsl:variable>


				<xsl:if test="($A!='' and $A!='-') or ($B!='' and $B!='-')">

				<tr><td>
							<table border="0" cellSpacing="0" cellPadding="2" width="100%" rules="none">
								<tbody>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>VAPOR:</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="DatosVapor">
														<xsl:with-param name="varVV" select="03"/>
												</xsl:call-template>
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>REFERENCIA:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">

												<xsl:call-template name="DatosVapor">
														<xsl:with-param name="varVV" select="01"/>
												</xsl:call-template>
												
											</font>
										</td>
									</tr>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>PRODUCTO:</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="01"/>
												</xsl:call-template>
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>B/L:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="DatosVapor">
														<xsl:with-param name="varVV" select="02"/>
												</xsl:call-template>
											</font>
										</td>
										
									</tr>
									<tr>
									<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b></b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												
											</font>
										</td>
                                        <td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>INCOTERM:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="21"/>
												</xsl:call-template>
											</font>
										</td>
									</tr>
								</tbody></table>
					</td></tr>
					</xsl:if>
							
					<!--DATOS PESOS-->
											<xsl:variable name="C">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="03"/>
												</xsl:call-template>
											</xsl:variable>
					<xsl:if test="$C!='' and $C!='-'">

					<tr><td>
								<table border="0" cellSpacing="0" cellPadding="2" width="100%" rules="none">
								<tbody>
									<tr>
										<td width="60%" colspan="2" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												
												<table border="0" cellspacing="0" cellpadding="3" width="50%" style="border:1px solid #999999;">
													<tr>
														<td colspan="3" align="center" style="border-bottom:1px solid #999999"><font face="Arial, Helvetica, sans-serif" size="1"><strong>PESOS</strong></font></td>
													</tr>
													<tr>
														<td align="left" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1"><strong>TMH:</strong></font></td>
														<td align="right" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1">
															&#160;
														</font></td>
														<td align="right"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="11"/>
															</xsl:call-template>
														</font></td>
													</tr>
													<tr>
														<td align="left" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1"><strong>HUMEDAD:</strong></font></td>
														<td align="right" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="12"/>
															</xsl:call-template>
														</font></td>
														<td align="right"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="13"/>
															</xsl:call-template>
														</font></td>
													</tr>
													<tr>
														<td align="left" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1"><strong>TMS:</strong></font></td>
														<td align="right" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1">
															&#160;
														</font></td>
														<td align="right"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="14"/>
															</xsl:call-template>
														</font></td>
													</tr>
													<tr>
														<td align="left" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1"><strong>MERMA:</strong></font></td>
														<td align="right" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="15"/>
															</xsl:call-template>
														</font></td>
														<td align="right"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="16"/>
															</xsl:call-template>
														</font></td>
													</tr>
													<tr>
														<td align="left" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1"><strong>TMNS:</strong></font></td>
														<td align="right" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1">
															&#160;
														</font></td>
														<td align="right"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="17"/>
															</xsl:call-template>
														</font></td>
													</tr>
												</table>
												
											</font>
										</td>
										
										<td width="15%" cellpadding="2" valign="top" align="left">&#160;</td>
										<td width="25%" cellpadding="2" valign="top" align="left">&#160;</td>
									</tr>
									
								</tbody>
							</table>


					</td>
					</tr>
					</xsl:if>
				
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="Dato_Notas_T">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="2" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="100%" height="30" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>MOTIVO/SUSTENTO:</b>&#160;
											<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

<xsl:template name="DatosVapor">
	<xsl:param name="varVV"/>

		<xsl:if test="$varVV='01'">

			<xsl:variable name="REFERENCIA_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="02"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:value-of select="substring-before($REFERENCIA_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='02'">

			<xsl:variable name="REFERENCIA_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="02"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="BL_aux">
			<xsl:value-of select="substring-after($REFERENCIA_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="substring-before($BL_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='03'">

			<xsl:variable name="REFERENCIA_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="02"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="BL_aux">
			<xsl:value-of select="substring-after($REFERENCIA_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="VAPOR_aux">
			<xsl:value-of select="substring-after($BL_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="$VAPOR_aux"/>

		</xsl:if>


		<xsl:if test="$varVV='11'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:value-of select="substring-before($TMH_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='12'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="HUM1_aux">
			<xsl:value-of select="substring-after($TMH_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="substring-before($HUM1_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='13'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="HUM1_aux">
			<xsl:value-of select="substring-after($TMH_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="HUM2_aux">
			<xsl:value-of select="substring-after($HUM1_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="substring-before($HUM2_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='14'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="HUM1_aux">
			<xsl:value-of select="substring-after($TMH_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="HUM2_aux">
			<xsl:value-of select="substring-after($HUM1_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="TMS_aux">
			<xsl:value-of select="substring-after($HUM2_aux,'*')"/>
			</xsl:variable>
			<xsl:value-of select="substring-before($TMS_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='15'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="HUM1_aux">
			<xsl:value-of select="substring-after($TMH_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="HUM2_aux">
			<xsl:value-of select="substring-after($HUM1_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="TMS_aux">
			<xsl:value-of select="substring-after($HUM2_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="MERMA1_aux">
			<xsl:value-of select="substring-after($TMS_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="substring-before($MERMA1_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='16'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="HUM1_aux">
			<xsl:value-of select="substring-after($TMH_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="HUM2_aux">
			<xsl:value-of select="substring-after($HUM1_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="TMS_aux">
			<xsl:value-of select="substring-after($HUM2_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="MERMA1_aux">
			<xsl:value-of select="substring-after($TMS_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="MERMA2_aux">
			<xsl:value-of select="substring-after($MERMA1_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="substring-before($MERMA2_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='17'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="HUM1_aux">
			<xsl:value-of select="substring-after($TMH_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="HUM2_aux">
			<xsl:value-of select="substring-after($HUM1_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="TMS_aux">
			<xsl:value-of select="substring-after($HUM2_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="MERMA1_aux">
			<xsl:value-of select="substring-after($TMS_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="MERMA2_aux">
			<xsl:value-of select="substring-after($MERMA1_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="TMNS_aux">
			<xsl:value-of select="substring-after($MERMA2_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="$TMNS_aux"/>

		</xsl:if>



</xsl:template>
<!--##TRAFIGURA##-->

<!--##IMPALA##-->
<xsl:template name="DatosCliente_I">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top">
						<xsl:call-template name="DatosReceptor_I"/>
					</td>
				</tr>
				<!--<tr width="100%">
					<td vAlign="top">&#160;</td>
				</tr>-->
				<tr width="100%">
					<td vAlign="top">
						<xsl:if test="/pe1:CreditNote">
							<xsl:call-template name="Dato_Notas_I"/>
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
							<xsl:call-template name="Dato_Notas_I"/>
						</xsl:if>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template name="DatosReceptor_I">
		<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" rules="none"><tbody>
				<!--TABLA RECEPTOR 1-->
				<tr>
				  <td valign="top" width="100%">
					<table border="1" cellspacing="0" cellpadding="0" width="100%" borderColor="#000000"><body>
						<tr><td><table border="0" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" rules="none">
								<tbody>
									<tr>
										<td width="10%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b><xsl:call-template name="TipoDeDocumento"/></b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--DOCUMENTO DEL USUARIO O ADQUIRENTE -->
												<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>	
												<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>							
											</font>
										</td>

										<td width="15%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>FECHA EMISION:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--FECHA EMISION-->
												<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
												<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
												<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
											</font>
										</td>
									</tr>
									<tr>
										<td width="10%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>SEÑOR(ES):</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--NOMBRE O RAZON SOCIAL DEL USUARIO O ADQUIRENTE-->
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											</font>
										</td>

										<td width="15%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>TIPO MONEDA:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--TIPO MONEDA-->
												<xsl:call-template name="TipoDeMoneda"/>
											</font>
										</td>
									</tr>
									<tr>
										<td width="10%">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>DIRECCION:</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--DIRECCION-->
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							                    <xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							                    <xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
									
											</font>
										</td>
										<td width="15%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">&#160;</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">&#160;</font>
										</td>
									</tr>
									
								</tbody>
							</table>
				       </td></tr></body>
					</table>
				</td>
				</tr>
				<!-- FIN TABLA RECEPTOR 1-->
				
				<!--TABLA RECEPTOR 2-->
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
					<xsl:if test="pe:Codigo='02'">	
						<xsl:if test="pe:Valor!='-'">

				<tr><td><font face="Arial, Helvetica, sans-serif" size="1">&#160;</font></td></tr>


				<tr>
					<td valign="top" width="100%">
						<table border="2" cellspacing="0" cellpadding="0" width="100%" borderColor="#000000" rules="none"><tbody><tr><td>
						  <table border="0" cellSpacing="0" borderColor="#000000" cellPadding="2" width="100%"><body> 
								<tr><td width="10%"><font face="Arial, Helvetica, sans-serif" size="1"><b>CONTRATO:</b></font></td>
									<td width="50%" cellpadding="2" valign="top" align="left"><font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='02'">	
													<xsl:if test="pe:Valor!='-'">
														<xsl:value-of select="substring-before(pe:Valor,'*')"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='02'">	
													<xsl:if test="pe1:Valor!='-'">
														<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='02'">	
													<xsl:if test="pe2:Valor!='-'">
														<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="15%" cellpadding="2" valign="top" align="left"><font face="Arial, Helvetica, sans-serif" size="1"><b>REFERENCIA:</b></font></td>
									<td width="25%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='02'">	
													<xsl:if test="pe:Valor!='-'">
														<xsl:value-of select="substring-before(substring-after(pe:Valor,'*'),'*')"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='02'">	
													<xsl:if test="pe1:Valor!='-'">
														<xsl:value-of select="substring-before(substring-after(pe1:Valor,'*'),'*')"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='02'">	
													<xsl:if test="pe2:Valor!='-'">
														<xsl:value-of select="substring-before(substring-after(pe2:Valor,'*'),'*')"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%"><font face="Arial, Helvetica, sans-serif" size="1"><b>PRODUCTO:</b></font></td>
									<td width="50%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='01'">	
													<xsl:if test="pe:Valor!='-'">
														<xsl:value-of select="pe:Valor"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='01'">	
													<xsl:if test="pe1:Valor!='-'">
														<xsl:value-of select="pe1:Valor"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='01'">	
													<xsl:if test="pe2:Valor!='-'">
														<xsl:value-of select="pe2:Valor"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="15%" cellpadding="2" valign="top" align="left"><font face="Arial, Helvetica, sans-serif" size="1"><b>B/L:</b></font></td>
									<td width="25%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='02'">	
													<xsl:if test="pe:Valor!='-'">
														<xsl:value-of select="substring-before(substring-after(substring-after(pe:Valor,'*'),'*'),'*')"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
										   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='02'">	
													<xsl:if test="pe1:Valor!='-'">
														<xsl:value-of select="substring-before(substring-after(substring-after(pe1:Valor,'*'),'*'),'*')"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='02'">	
													<xsl:if test="pe2:Valor!='-'">
														<xsl:value-of select="substring-before(substring-after(substring-after(pe2:Valor,'*'),'*'),'*')"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
										</font>
									</td>
								</tr>
								<tr>
									<td width="10%"><font face="Arial, Helvetica, sans-serif" size="1"><b>INCOTERM:</b></font></td>
									<td width="50%" cellpadding="2" valign="top" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='02'">	
													<xsl:if test="pe:Valor!='-'">
														<xsl:value-of select="substring-after(substring-after(substring-after(pe:Valor,'*'),'*'),'*')"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
										   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='02'">	
													<xsl:if test="pe1:Valor!='-'">
														<xsl:value-of select="substring-after(substring-after(substring-after(pe1:Valor,'*'),'*'),'*')"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='02'">	
													<xsl:if test="pe2:Valor!='-'">
														<xsl:value-of select="substring-after(substring-after(substring-after(pe2:Valor,'*'),'*'),'*')"/>
											 	</xsl:if>
											 </xsl:if>
											</xsl:for-each>
										</font>
									</td>
									<td width="15%" cellpadding="2" valign="top" align="left"><font face="Arial, Helvetica, sans-serif" size="1">&#160;</font></td>
									<td width="25%" cellpadding="2" valign="top" align="left"><font face="Arial, Helvetica, sans-serif" size="1">&#160;</font></td>
								</tr>
								</body></table></td></tr>
						  </tbody></table>
					</td>
				</tr>

						</xsl:if>
					</xsl:if>
				</xsl:for-each>
				<!--FIN TABLA RECEPTOR 2-->
				
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Dato_Notas_I">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="2" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="100%" height="30" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>MOTIVO/SUSTENTO:</b>&#160;
											<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<!--TIPO DE DOCUMENTO Y SERIE-CORRELATIVO-->
				<!--<tr>
					<td>
						<table border="1" width="100%" cellSpacing="0" cellPadding="1" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="100%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>TIPO DOCUMENTO:</b>&#160;
											<xsl:choose>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
								</tr>
								<tr>
									<td width="100%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>SERIE-CORRELATIVO:</b>&#160;
											<xsl:value-of select="//cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>-->
			</tbody>
		</table>
	</xsl:template>
<!--##IMPALA##-->

<!--##URION##-->
	<xsl:template name="DatosCliente_U">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top">
						<xsl:call-template name="DatosReceptor_U"/>
					</td>
				</tr>
				<!--<tr width="100%">
					<td vAlign="top">&#160;</td>
				</tr>-->
				<!--<tr width="100%">
					<td vAlign="top">
						<xsl:if test="/pe1:CreditNote">
							<xsl:call-template name="Dato_Notas_T"/>EN TRAFIGURA NO VA
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
							<xsl:call-template name="Dato_Notas_T"/>EN TRAFIGURA NO VA
						</xsl:if>
					</td>
				</tr>-->
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template name="DatosReceptor_U">
		<table border="0" cellSpacing="0" cellPadding="2" width="100%"><tbody>
				<!--TABLA RECEPTOR 1-->
				<tr>
				  <td valign="top" width="100%">
						
						<table border="0" cellSpacing="0" cellPadding="2" width="100%" rules="none">
								<tbody>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b><xsl:call-template name="TipoDeDocumento"/></b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--DOCUMENTO DEL USUARIO O ADQUIRENTE -->
												<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>	
												<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>											
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>FECHA EMISIÓN:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--FECHA EMISION-->
												<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
												<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
												<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
											</font>
										</td>
									</tr>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>SEÑOR (ES):</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--NOMBRE O RAZON SOCIAL DEL USUARIO O ADQUIRENTE-->
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>TIPO MONEDA:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--TIPO MONEDA-->
												<xsl:call-template name="TipoDeMoneda"/>
											</font>
										</td>
									</tr>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>DIRECCIÓN:</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--DIRECCION-->
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
                                                <xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							                    <xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							                    <xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>

										
											</font>
										</td>
										<td width="15%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">&#160;</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">&#160;</font>
										</td>
									</tr>
									
								</tbody>
						</table>
				</td></tr>

				
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="Dato_Notas_U">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="2" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="100%" height="30" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>MOTIVO/SUSTENTO:</b>&#160;
											<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

<!--##URION##-->

<!--##TRAFIGURA TRADING##-->
	<xsl:template name="DatosCliente_TT">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top">
						<xsl:call-template name="DatosReceptor_TT"/>
					</td>
				</tr>
				<!--<tr width="100%">
					<td vAlign="top">&#160;</td>
				</tr>-->
				<!--<tr width="100%">
					<td vAlign="top">
						<xsl:if test="/pe1:CreditNote">
							<xsl:call-template name="Dato_Notas_T"/>EN TRAFIGURA NO VA
						</xsl:if>
						<xsl:if test="/pe2:DebitNote">
							<xsl:call-template name="Dato_Notas_T"/>EN TRAFIGURA NO VA
						</xsl:if>
					</td>
				</tr>-->
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template name="DatosReceptor_TT">
		<table border="0" cellSpacing="0" cellPadding="2" width="100%"><tbody>
				<!--TABLA RECEPTOR 1-->
				<tr>
				  <td valign="top" width="100%">
						
						<table border="0" cellSpacing="0" cellPadding="2" width="100%" rules="none">
								<tbody>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b><xsl:call-template name="TipoDeDocumento"/></b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--DOCUMENTO DEL USUARIO O ADQUIRENTE -->
												<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>					
												<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>FECHA EMISIÓN:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--FECHA EMISION-->
												<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
												<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
												<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
											</font>
										</td>
									</tr>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>SEÑOR (ES):</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--NOMBRE O RAZON SOCIAL DEL USUARIO O ADQUIRENTE-->
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>TIPO MONEDA:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--TIPO MONEDA-->
												<xsl:call-template name="TipoDeMoneda"/>
											</font>
										</td>
									</tr>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>DIRECCIÓN:</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--DIRECCION-->
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
                                                <xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							                    <xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							                    <xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>

										
											</font>
										</td>
										<td width="15%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">&#160;</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">&#160;</font>
										</td>
									</tr>
									
								</tbody>
						</table>
				</td></tr>

				
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="Dato_Notas_TT">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="2" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="100%" height="30" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>MOTIVO/SUSTENTO:</b>&#160;
											<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

<!--TRAFIGURA TRADING-->


<!--##TRAFIGURA METALES BÁSICOS##-->
	<xsl:template name="DatosCliente_TM">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top">
						<xsl:call-template name="DatosReceptor_TM"/>
					</td>
				</tr>
				
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template name="DatosReceptor_TM">
		<table border="0" cellSpacing="0" cellPadding="2" width="100%"><tbody>
				<!--TABLA RECEPTOR 1-->
				<tr>
				  <td valign="top" width="100%">
						
						<table border="0" cellSpacing="0" cellPadding="2" width="100%" rules="none">
								<tbody>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b><xsl:call-template name="TipoDeDocumento"/></b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--DOCUMENTO DEL USUARIO O ADQUIRENTE -->
												<xsl:value-of select="//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID"/>			
												<xsl:value-of select="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>									
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>FECHA EMISIÓN:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--FECHA EMISION-->
												<xsl:value-of select="/pe:Invoice/cbc:IssueDate"/>
												<xsl:value-of select="/pe1:CreditNote/cbc:IssueDate"/>
												<xsl:value-of select="/pe2:DebitNote/cbc:IssueDate"/>
											</font>
										</td>
									</tr>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>SEÑOR (ES):</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--NOMBRE O RAZON SOCIAL DEL USUARIO O ADQUIRENTE-->
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>TIPO MONEDA:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--TIPO MONEDA-->
												<xsl:call-template name="TipoDeMoneda"/>
											</font>
										</td>
									</tr>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>DIRECCIÓN:</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<!--DIRECCION-->
												<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
												<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
												<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description"/>
                                                <xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							                    <xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
							                    <xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>

										<xsl:value-of select="/pe:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										<xsl:value-of select="/pe1:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
										<xsl:value-of select="/pe2:DebitNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line"/>
									

										
											</font>
										</td>
										<td width="15%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">&#160;</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">&#160;</font>
										</td>
									</tr>
									
								</tbody>
						</table>
				</td></tr>

				<!--DATOS VAPOR-->
											<xsl:variable name="A">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="01"/>
												</xsl:call-template>
											</xsl:variable>

											<xsl:variable name="B">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="02"/>
												</xsl:call-template>
											</xsl:variable>


				<xsl:if test="($A!='' and $A!='-') or ($B!='' and $B!='-')">

				<tr><td>
							<table border="0" cellSpacing="0" cellPadding="2" width="100%" rules="none">
								<tbody>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>VAPOR:</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="DatosVapor_TM">
														<xsl:with-param name="varVV" select="03"/>
												</xsl:call-template>
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>REFERENCIA:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">

												<xsl:call-template name="DatosVapor">
														<xsl:with-param name="varVV" select="01"/>
												</xsl:call-template>
												
											</font>
										</td>
									</tr>
									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>PRODUCTO:</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="01"/>
												</xsl:call-template>
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>FECHA DE ENTREGA:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="DatosVapor">
														<xsl:with-param name="varVV" select="02"/>
												</xsl:call-template>
											</font>
										</td>
									</tr>

									<tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>CONTRATO:</b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="21"/>
												</xsl:call-template>
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>INCOTERM:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="22"/>
												</xsl:call-template>
											</font>
										</td>
									</tr>
<tr>
<td></td>
<td></td>
<td><br/></td>
<td></td>
</tr>
                                    <tr>
										<td width="10%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b></b>
											</font>
										</td>
										<td width="50%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												
											</font>
										</td>

										<td width="15%" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<b>CONDICION DE PAGO:</b>
											</font>
										</td>
										<td width="25%" cellpadding="2" valign="top" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="23"/>
												</xsl:call-template>
											</font>
										</td>
									</tr>

									
									
								</tbody></table>
					</td></tr>
					</xsl:if>
							
					<!--DATOS PESOS-->
											<xsl:variable name="C">
												<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="03"/>
												</xsl:call-template>
											</xsl:variable>
					<xsl:if test="$C!='' and $C!='-'">

					<tr>
					<td >
								<table border="0" cellSpacing="0" cellPadding="2" width="100%" rules="none">
								<tbody>
									<tr>
										<td width="50%" colspan="2" align="left">
											<font face="Arial, Helvetica, sans-serif" size="1">
												
												<table border="0" cellspacing="0" cellpadding="3" width="50%" style="border:1px solid #999999;">
													<tr>
														<td colspan="3" align="center" style="border-bottom:1px solid #999999"><font face="Arial, Helvetica, sans-serif" size="1"><strong>PESOS</strong></font></td>
													</tr>
													<tr>
														<td align="left" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1"><strong>TMH:</strong></font></td>
														<td align="right" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1">
															&#160;
														</font></td>
														<td align="right"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="11"/>
															</xsl:call-template>
														</font></td>
													</tr>
													<tr>
														<td align="left" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1"><strong>HUMEDAD:</strong></font></td>
														<td align="right" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="12"/>
															</xsl:call-template>
														</font></td>
														<td align="right"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="13"/>
															</xsl:call-template>
														</font></td>
													</tr>
													<tr>
														<td align="left" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1"><strong>TMS:</strong></font></td>
														<td align="right" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1">
															&#160;
														</font></td>
														<td align="right"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="14"/>
															</xsl:call-template>
														</font></td>
													</tr>
													<tr>
														<td align="left" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1"><strong>MERMA:</strong></font></td>
														<td align="right" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="15"/>
															</xsl:call-template>
														</font></td>
														<td align="right"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="16"/>
															</xsl:call-template>
														</font></td>
													</tr>
													<tr>
														<td align="left" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1"><strong>TMNS:</strong></font></td>
														<td align="right" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif" size="1">
															&#160;
														</font></td>
														<td align="right"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="DatosVapor">
																	<xsl:with-param name="varVV" select="17"/>
															</xsl:call-template>
														</font></td>
													</tr>
												</table>
												
											</font>
										</td>
										
										<!--<td width="15%" cellpadding="2" valign="top" align="left">&#160;</td>
										<td width="25%" cellpadding="2" valign="top" align="left">&#160;</td>-->

								
										<td width="50%" align="right">
											<font face="Arial, Helvetica, sans-serif" size="1">
												
												<table border="0" cellspacing="0" cellpadding="3" width="50%" style="border:1px solid #999999;">
													<tr>
														<td colspan="3" align="center" style="border-bottom:1px solid #999999">
														<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>PRECIOS</strong>
														</font>
														</td>
													</tr>
													<tr>
														<td align="center" bgcolor="#CCCCCC">
														<font face="Arial, Helvetica, sans-serif" size="1">
														<strong>ZN LME SETT
														<br/> $/MT</strong>
														</font>
														</td>
														<td align="center" bgcolor="#CCCCCC">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<strong>AGL SPOT
														<br/> $/OZ</strong>
														</font></td>
														<td align="center" bgcolor="#CCCCCC">
														<font face="Arial, Helvetica, sans-serif" size="1">
															<strong>CU SPOT
														    <br/> $/OZ</strong>
														</font>
														</td>
													</tr>
													<tr>
														<td align="left" ><font face="Arial, Helvetica, sans-serif" size="1">
														</font><br/></td>
														<td align="right" ><font face="Arial, Helvetica, sans-serif" size="1">
															
														</font></td>
														<td align="right"><font face="Arial, Helvetica, sans-serif" size="1">
															
														</font></td>
													</tr>

													
													<tr>
														<td align="center"><font face="Arial, Helvetica, sans-serif" size="1">
														<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="24"/>
												</xsl:call-template>
														</font>
														</td>
														<td align="center"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="25"/>
												</xsl:call-template>
														</font>
														</td>
														<td align="center"><font face="Arial, Helvetica, sans-serif" size="1">
															<xsl:call-template name="TraeValorVariable">
													<xsl:with-param name="varNumVA" select="26"/>
												</xsl:call-template>
														</font>
														</td>
													</tr>
													
													<tr>
														<td align="left" ><font face="Arial, Helvetica, sans-serif" size="1"></font>
														<br/></td>
														<td align="right" ><font face="Arial, Helvetica, sans-serif" size="1">
															
														</font></td>
														<td align="right"><font face="Arial, Helvetica, sans-serif" size="1">
															
														</font></td>
													</tr>
												</table>
												
											</font>
										</td>
										
										<!--<td width="15%" cellpadding="2" valign="top" align="left">&#160;</td>
										<td width="25%" cellpadding="2" valign="top" align="left">&#160;</td>-->
									


					
									</tr>
									
								</tbody>
							</table>


					</td>
					
					
					
					
					</tr>
					</xsl:if>
				
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="Dato_Notas_TM">
		<table border="0" width="100%" cellspacing="0" cellPadding="2" borderColor="#000000">
			<tbody>
				<tr>
					<td valign="top" width="100%">
						<table border="2" width="100%" cellSpacing="0" cellPadding="2" bordercolor="#000000" rules="none">
							<tbody>
								<tr>
									<td width="100%" height="30" align="left" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<b>MOTIVO/SUSTENTO:</b>&#160;
											<xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

<xsl:template name="DatosVapor_TM">
	<xsl:param name="varVV"/>

		<xsl:if test="$varVV='01'">

			<xsl:variable name="REFERENCIA_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="02"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:value-of select="substring-before($REFERENCIA_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='02'">

			<xsl:variable name="REFERENCIA_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="02"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="BL_aux">
			<xsl:value-of select="substring-after($REFERENCIA_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="substring-before($BL_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='03'">

			<xsl:variable name="REFERENCIA_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="02"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="BL_aux">
			<xsl:value-of select="substring-after($REFERENCIA_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="VAPOR_aux">
			<xsl:value-of select="substring-after($BL_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="$VAPOR_aux"/>

		</xsl:if>


		<xsl:if test="$varVV='11'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:value-of select="substring-before($TMH_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='12'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="HUM1_aux">
			<xsl:value-of select="substring-after($TMH_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="substring-before($HUM1_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='13'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="HUM1_aux">
			<xsl:value-of select="substring-after($TMH_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="HUM2_aux">
			<xsl:value-of select="substring-after($HUM1_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="substring-before($HUM2_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='14'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="HUM1_aux">
			<xsl:value-of select="substring-after($TMH_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="HUM2_aux">
			<xsl:value-of select="substring-after($HUM1_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="TMS_aux">
			<xsl:value-of select="substring-after($HUM2_aux,'*')"/>
			</xsl:variable>
			<xsl:value-of select="substring-before($TMS_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='15'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="HUM1_aux">
			<xsl:value-of select="substring-after($TMH_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="HUM2_aux">
			<xsl:value-of select="substring-after($HUM1_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="TMS_aux">
			<xsl:value-of select="substring-after($HUM2_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="MERMA1_aux">
			<xsl:value-of select="substring-after($TMS_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="substring-before($MERMA1_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='16'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="HUM1_aux">
			<xsl:value-of select="substring-after($TMH_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="HUM2_aux">
			<xsl:value-of select="substring-after($HUM1_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="TMS_aux">
			<xsl:value-of select="substring-after($HUM2_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="MERMA1_aux">
			<xsl:value-of select="substring-after($TMS_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="MERMA2_aux">
			<xsl:value-of select="substring-after($MERMA1_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="substring-before($MERMA2_aux,'*')"/>

		</xsl:if>

		<xsl:if test="$varVV='17'">

			<xsl:variable name="TMH_aux">
				<xsl:call-template name="TraeValorVariable">
				<xsl:with-param name="varNumVA" select="03"/>
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="HUM1_aux">
			<xsl:value-of select="substring-after($TMH_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="HUM2_aux">
			<xsl:value-of select="substring-after($HUM1_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="TMS_aux">
			<xsl:value-of select="substring-after($HUM2_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="MERMA1_aux">
			<xsl:value-of select="substring-after($TMS_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="MERMA2_aux">
			<xsl:value-of select="substring-after($MERMA1_aux,'*')"/>
			</xsl:variable>

			<xsl:variable name="TMNS_aux">
			<xsl:value-of select="substring-after($MERMA2_aux,'*')"/>
			</xsl:variable>

			<xsl:value-of select="$TMNS_aux"/>

		</xsl:if>
</xsl:template>


<!--##TRAFIGURA METALES BÁSICOS##-->




	<xsl:template name="TraeValorVariable">
		<xsl:param name="varNumVA"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$varNumVA">
			 <xsl:if test="pe:Valor!='-'">
				<xsl:value-of select="pe:Valor"/>
				</xsl:if>
			</xsl:if>
			<!-- &#160; -->
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
			<xsl:if test="pe1:Codigo=$varNumVA">
			 <xsl:if test="pe1:Valor!='-'">
				<xsl:value-of select="pe1:Valor"/>
			 </xsl:if>
			</xsl:if>
			<!-- &#160; -->
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
			<xsl:if test="pe2:Codigo=$varNumVA">
			 <xsl:if test="pe2:Valor!='-'">
				<xsl:value-of select="pe2:Valor"/>
			 </xsl:if>
			</xsl:if>
			<!-- &#160; -->
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="TipoDeDocumento">
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='0' or //cac:AccountingCustomerParty/cbc:AdditionalAccountID='-'">NO DOMICILIADO:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='1'">DNI:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='4'">CARNET EXTR.:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='6'">R.U.C.:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='7'">PASAPORTE:</xsl:if>
		<xsl:if test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID='A'">CED. DIP. IDENT.:</xsl:if>
		
		
		<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">PASAPORTE:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">CED. DIP. IDENT.:</xsl:if>

								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">NO DOMICILIADO:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '-'">NO DOMICILIADO:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'D'">NO DOMICILIADO:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">DNI:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">CARNET EXTR.:</xsl:if>
								<xsl:if test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">R.U.C. :</xsl:if>
				
	</xsl:template>

	<xsl:template name="TipoDeMoneda">
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
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\..\Users\Usuario\Desktop\Felix TXT\xmls\20100049008-01-FF12-13131302.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->