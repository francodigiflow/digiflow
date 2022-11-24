<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2">

	<xsl:template name="DatosCredito">
		<table width="100%" border="0" cellpadding="1" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
			<tr>
				<td>
				<strong>DATOS DE CUOTA: </strong>
				</td>				
			</tr>
			<tr>
				<td>
						<table width="50%" border="1" cellSpacing="0" borderColor="#000000" cellPadding="2" style="font-family :Arial,Helvetica,sans-serif;font-size:11px;color:#000000">
							<tr>
								<td width="15%" align="center" size="1">
										<strong>N° DE CUOTA</strong>
								</td>
								<td width="15%" align="center" size="1">
										<strong>MONTO</strong>
								</td>
								<td width="15%" align="center" size="1">
										<strong>FECHA VENCIMIENTO</strong>
								</td>
							</tr>
							<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
							<xsl:if test="cbc:ID !='Detraccion'">
								<xsl:if test="cbc:PaymentMeansID !='Credito'">	
									<xsl:if test="cbc:PaymentMeansID !='037'">
									<tr>
											
											<td width= "7%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
													<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
												</font>							
											</td>
											<td width= "12%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
													<!--<xsl:value-of select="cbc:Amount"/>-->
													<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
												</font>
											</td>
											<td width= "10%" align="center">
												<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
												<xsl:value-of select="cbc:PaymentDueDate"/>
												</font>
											</td>
									</tr>
									</xsl:if>
								</xsl:if>
							</xsl:if>
							</xsl:for-each>
							
							<xsl:for-each select="/pe1:CreditNote/cac:PaymentTerms">
							<xsl:if test="cbc:ID !='Detraccion'">
								<xsl:if test="cbc:PaymentMeansID !='Credito'">	
									<xsl:if test="cbc:PaymentMeansID !='037'">
										<tr>
												
												<td width= "7%" align="center">
													<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
														<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
													</font>							
												</td>
												<td width= "12%" align="center">
													<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
														<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
													</font>
												</td>
												<td width= "10%" align="center">
													<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
													<xsl:value-of select="cbc:PaymentDueDate"/>
													</font>
												</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:if>
							</xsl:for-each>
													
							<!-- <xsl:for-each select="/pe2:DebitNote/cac:PaymentTerms"> -->
							<!-- <xsl:if test="cbc:PaymentMeansID !='Credito'"> -->
							<!-- <xsl:if test="cbc:PaymentMeansID !='037'"> -->
							<!-- <tr> -->
									
									<!-- <td width= "7%" align="center"> -->
										<!-- <font color="#000000" size="1" face="Arial, Helvetica, sans-serif"> -->
											<!-- <xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/> -->
										<!-- </font>							 -->
									<!-- </td> -->
									<!-- <td width= "12%" align="center"> -->
										<!-- <font color="#000000" size="1" face="Arial, Helvetica, sans-serif"> -->
											<!-- <xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/> -->
										<!-- </font> -->
									<!-- </td> -->
									<!-- <td width= "10%" align="center"> -->
										<!-- <font color="#000000" size="1" face="Arial, Helvetica, sans-serif"> -->
										<!-- <xsl:value-of select="cbc:PaymentDueDate"/> -->
										<!-- </font> -->
									<!-- </td> -->
							<!-- </tr> -->
							<!-- </xsl:if> -->
							<!-- </xsl:if> -->
							<!-- </xsl:for-each> -->
							

						</table>
				</td>
			</tr>
		</table>

	</xsl:template>


	<xsl:template name="bottom_hash">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				
				<tr>
					
					<td width="30%" valign="top">
					<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
						<xsl:call-template name="DatosCredito"/>				
					</xsl:if>
					<xsl:if test="//cbc:InvoiceTypeCode/@listID = '1001'">
						<font face="Arial, Helvetica, sans-serif" size="1">
							<strong></strong>
						OPERACION SUJETA AL SISTEMA DE PAGOS DE OBLIGACIONES TRIBUTARIAS - NÚMERO DE CTA. EN EL BN: <xsl:value-of select="//cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID"/><br/>
					</font>
					</xsl:if>
					<xsl:if test="//cbc:InvoiceTypeCode/@listID != '1001'">
						<font face="Arial" size="1">
								<strong></strong>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
												<xsl:if test="pe:Codigo='21'">
													<xsl:value-of select="pe:Valor"/>
												</xsl:if>
											</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
												<xsl:if test="pe1:Codigo='21'">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:if>
											</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
												<xsl:if test="pe2:Codigo='21'">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:if>
											</xsl:for-each>
						</font>
					</xsl:if>
					</td>
					<td align="center"  width="35%" valign="top">
						<font face="Arial" size="1">
							<img height="100" width="100"><xsl:attribute name="src"><xsl:call-template name="timbre"/></xsl:attribute></img>
						<strong></strong> 
						</font>
					</td>
					<td  align="center"  width="35%" valign="top">
						<font face="Arial, Helvetica, sans-serif" size="1">Representación Impresa de la
							<xsl:choose>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">Factura Electrónica</xsl:when>
								<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">Boleta de Venta Electrónica</xsl:when>
								<xsl:otherwise>
									<xsl:if test="/pe1:CreditNote">Nota de Crédito Electrónica</xsl:if>
									<xsl:if test="/pe2:DebitNote">Nota de Dédito Electrónica</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
							<br/>Podrá ser consultado en: www.ardilesimport.com
							<br/>Autorizado mediante Resolución:N° 018-005-0002665
						</font>
					</td>
					
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template name="timbre">
		
		
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:Documento/pe1:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:Documento/pe2:Nombre"/>
		<xsl:value-of select="'.jpg'"/>
	</xsl:template>
	<xsl:template name="nombreTed">
		<xsl:param name="text"/>
		<xsl:param name="largo" select="0"/>
		<xsl:variable name="largo_actual" select="string-length($text)"/>
		
		<xsl:choose>
			<xsl:when test="$largo_actual >= $largo">
				<xsl:value-of select="$text"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="prefix" select="concat('0', $text)"/>
				<xsl:call-template name="nombreTed">
					<xsl:with-param name="text" select="$prefix"/>
					<xsl:with-param name="largo" select="$largo"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
