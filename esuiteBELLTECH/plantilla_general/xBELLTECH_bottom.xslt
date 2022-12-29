<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2">

	<xsl:template name="bottom_normal">
		<table border="1" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td valign="baseline" width="60%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0">
							<br/>/&gt;
							<strong>
								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
									<xsl:if test="pe:Codigo='08'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="pe:Valor"/>
										</font>
									</xsl:if>
									<xsl:if test="pe1:Codigo='08'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="pe1:Valor"/>
										</font>
									</xsl:if>
									<xsl:if test="pe2:Codigo='08'">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="pe2:Valor"/>
										</font>
									</xsl:if>
								</xsl:for-each>
							</strong>Operación sujeta al sistema de pago de obligación tributaria con el <br/>
							gobierno central Bco. de la Nación Cta. Cte Nro. 00-000-333069 <br/>
                      		PRODUCTOS DE ACERO CASSADO
					  Autorizado mediante resolución XXXX " - Verifique documento: <strong>www.sunat.gob.pe</strong></font>
					</td>
					<td valign="top" width="10%" align="center"/>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="bottom_hash">
			<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%" class="tipo2">
			<tbody>
				<tr >
					<td align="center" width="50%" valign="top">
						<font face="Arial, Helvetica, sans-serif" size="2">
						    Representación impresa - <xsl:call-template name="tipoDoc_Footer"/> Podrá ser consultada en:
							<br/>http://www.ecomprobantes.pe/BELLTECH
							<br/>Autorizado mediante resolución N° 0320050000388/SUNAT
						</font>
						<font face="Arial, Helvetica, sans-serif" size="3">
							<br/>
							<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
							<Strong><br/>Forma de Pago: </Strong> 
							<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
								Crédito		
							</xsl:if>
							<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Contado'">
								Contado		
							</xsl:if>
							<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
								<Strong><br/>Monto pendiente de pago: </Strong> 
								<xsl:call-template name="SimboloMoneda"/>
								<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
									<xsl:if test="cbc:PaymentMeansID ='Credito'">	
										<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
									</xsl:if>
								</xsl:for-each>
							</xsl:if>
							
							<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
								<xsl:call-template name="DatosCredito"/>
							</xsl:if>
							</xsl:if>
							
							<xsl:if test="/pe1:CreditNote/cac:DiscrepancyResponse/cbc:ResponseCode='13'">
									<Strong><br/>Forma de Pago: </Strong> 
									<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
										Crédito		
									</xsl:if>
									<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Contado'">
										Contado		
									</xsl:if>
									<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
										<Strong><br/>Monto pendiente de pago: </Strong> 
										<xsl:call-template name="SimboloMoneda"/>
										<xsl:for-each select="/pe1:CreditNote/cac:PaymentTerms">
											<xsl:if test="cbc:PaymentMeansID ='Credito'">	
												<xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									
									<xsl:if test="//cac:PaymentTerms/cbc:PaymentMeansID='Credito'">
										<xsl:call-template name="DatosCredito"/>
									</xsl:if>

							</xsl:if>
							<!-- <img width="100" height="100" align="center"> -->
								<!-- <xsl:attribute name="src"> -->
								<!-- <xsl:call-template name="timbre"/> -->
								<!-- </xsl:attribute> -->
							<!-- </img> -->
							
	
							</font>
					</td>
					<!-- <td align="center" width="50%" valign="middle"> -->
						
						    
							<!-- <img width="100" height="100" align="center">
								<xsl:attribute name="src">
								<xsl:call-template name="timbre"/>
								</xsl:attribute>
							</img> -->
					<!-- </td> -->
				</tr>
				<!--<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td>
						
					</td>
				</tr>-->
			</tbody>
		</table>
		<!--<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
		<br/>
			<tbody>
				<tr>
					<td valign="top" width="50%" align="CENTER">
						<font face="Arial, Helvetica, sans-serif" size="2">Representación impresa de la <xsl:call-template name="tipoDoc_Footer"/>
							<br/>Podrá ser consultada en: www.ecomprobantes.pe/belltech
							<br/>Autorizado mediante Resolución de Intendencia <br/> N° 0320050000388/SUNAT
							<br/>
							-->
							
							
							<!--<strong>Valor Resumen : </strong>
                     <xsl:value-of select="//ds:DigestValue"/><br/>-->
							
<!--
						</font>
					</td>
					</tr>
					<tr>
					<td valign="top" width="50%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:call-template name="imp_timbre"/>
						</font>
					</td>
				</tr>
			</tbody>
		</table>-->
	</xsl:template>

	<xsl:template name="DatosCredito">
		<table width="90%" border="0" cellpadding="1" style="font-family :Arial,Helvetica,sans-serif;font-size:13px;color:#000000">
			
			<tr>
				<td>
				<!-- <tr><th></th></tr> -->
						<br/><table width="100%" border="1" cellSpacing="0" borderColor="#000000" cellPadding="2" style="font-family :Arial,Helvetica,sans-serif;font-size:12px">
							<tr bgcolor="#C0C0C0">
								<td width="30%" align="center" size="1">
										<strong>N° DE CUOTA</strong>
								</td>
								<td width="30%" align="center" size="1">
										<strong>MONTO</strong>
								</td>
								<td width="30%" align="center" size="1">
										<strong>FECHA VENCIMIENTO</strong>
								</td>
							</tr>
							<xsl:for-each select="/pe:Invoice/cac:PaymentTerms">
							<xsl:if test="cbc:PaymentMeansID !='Credito'">	
							<!-- <xsl:if test="cbc:PaymentMeansID !='022'"> -->
							<xsl:if test="cbc:ID!='Detraccion'">
							<tr>
									
									<td width= "7%" align="center">
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
										</font>							
									</td>
									<td width= "12%" align="center">
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<!--<xsl:value-of select="cbc:Amount"/>-->
											<xsl:call-template name="SimboloMoneda"/><xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width= "10%" align="center">
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<xsl:variable name="aa">
												<xsl:value-of select="substring-before(/pe:Invoice/cac:PaymentTerms/cbc:PaymentDueDate,'-')"/>
											</xsl:variable>
											<xsl:variable name="mmdd">
												<xsl:value-of select="substring-after(/pe:Invoice/cac:PaymentTerms/cbc:PaymentDueDate, '-')"/>
											</xsl:variable>
											<xsl:variable name="mm">
												<xsl:value-of select="substring-before($mmdd, '-')"/>
											</xsl:variable>
											<xsl:variable name="dd">
												<xsl:value-of select="substring-after($mmdd, '-')"/>
											</xsl:variable>
											<xsl:value-of select="concat($dd, '-', $mm, '-' , $aa)"/>
										<!-- <xsl:value-of select="cbc:PaymentDueDate"/> -->
										</font>
									</td>
							</tr>
							</xsl:if>
							</xsl:if>
							</xsl:for-each>
							
							<xsl:for-each select="/pe1:CreditNote/cac:PaymentTerms">
							<xsl:if test="cbc:PaymentMeansID !='Credito'">	
							<!-- <xsl:if test="cbc:PaymentMeansID !='022'"> -->
							<xsl:if test="cbc:ID!='Detraccion'">
							<tr>
									
									<td width= "7%" align="center">
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
										</font>							
									</td>
									<td width= "12%" align="center">
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<xsl:call-template name="SimboloMoneda"/><xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width= "10%" align="center">
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
										<xsl:variable name="aa">
												<xsl:value-of select="substring-before(/pe1:CreditNote/cac:PaymentTerms/cbc:PaymentDueDate,'-')"/>
											</xsl:variable>
											<xsl:variable name="mmdd">
												<xsl:value-of select="substring-after(/pe1:CreditNote/cac:PaymentTerms/cbc:PaymentDueDate, '-')"/>
											</xsl:variable>
											<xsl:variable name="mm">
												<xsl:value-of select="substring-before($mmdd, '-')"/>
											</xsl:variable>
											<xsl:variable name="dd">
												<xsl:value-of select="substring-after($mmdd, '-')"/>
											</xsl:variable>
											<xsl:value-of select="concat($dd, '-', $mm, '-' , $aa)"/>
										<!-- <xsl:value-of select="cbc:PaymentDueDate"/> -->
										</font>
									</td>
							</tr>
							</xsl:if>
							</xsl:if>
							</xsl:for-each>
													
							<xsl:for-each select="/pe2:DebitNote/cac:PaymentTerms">
							<xsl:if test="cbc:PaymentMeansID !='Credito'">
							<xsl:if test="cbc:PaymentMeansID !='022'">
							<tr>
									
									<td width= "7%" align="center">
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<xsl:value-of select="substring-after(cbc:PaymentMeansID,'Cuota00')"/>
										</font>							
									</td>
									<td width= "12%" align="center">
										<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
											<xsl:call-template name="SimboloMoneda"/><xsl:value-of select="format-number(cbc:Amount,'###,###,##0.00','pen')"/>
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
							</xsl:for-each>
							

						</table>
				</td>
			</tr>
		</table>

	</xsl:template>


						
	<xsl:template name="tipoDoc_Footer">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Factura Electrónica</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'">
				<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Boleta de Venta Electrónica</font>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="/pe1:CreditNote">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Nota de Crédito Electrónica</font>
				</xsl:if>
				<xsl:if test="/pe2:DebitNote">
					<font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Nota de Débito Electrónica</font>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!--<xsl:template name="imp_timbre">
		
		<table width="100%">
			<tr align="center">
				<td width="100%" align="center">
					
					<table width="100%" height="60">
						<tr align="center">
							<td valign="top" align="center" height="60">
								<font face="Arial" size="1">
									<img height="60">
										<xsl:attribute name="src">
											<xsl:call-template name="timbre"/>
										</xsl:attribute>
									</img>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>-->
	<!--
	<xsl:template name="timbre">
		<xsl:call-template name="nombreTed">
			<xsl:with-param name="text" select="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID"/>
			<xsl:with-param name="largo" select="'11'"/>
		</xsl:call-template>
		<xsl:value-of select="'-'"/>
		<xsl:value-of select="//cbc:InvoiceTypeCode"/>
		<xsl:if test="/pe1:CreditNote">
			<xsl:value-of select="'07'"/>
		</xsl:if>
        <xsl:if test="/pe2:DebitNote">
			<xsl:value-of select="'08'"/>
		</xsl:if>
		<xsl:value-of select="'-'"/>
		<xsl:value-of select="/pe:Invoice/cbc:ID"/>
		<xsl:value-of select="/pe1:CreditNote/cbc:ID"/>
		<xsl:value-of select="/pe2:DebitNote/cbc:ID"/>
		<xsl:value-of select="'.jpg'"/>
	</xsl:template>
	-->
	<!--<xsl:template name="timbre">


		<xsl:value-of select="pe:Invoice/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
		<xsl:value-of select="pe1:CreditNote/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:Documento/pe1:Nombre"/>
		<xsl:value-of select="pe2:DebitNote/ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:Documento/pe2:Nombre"/>
		<xsl:value-of select="'.jpg'"/>
	</xsl:template>-->

	<!--<xsl:template name="nombreTed">
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
	</xsl:template>-->

	<xsl:template name="timbre">
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:Documento/pe1:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:Documento/pe2:Nombre"/>
		<xsl:value-of select="'.jpg'"/>
	</xsl:template>

	<xsl:template name="SimboloMoneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$ </xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$ </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$ </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='EUR'">?</xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="nombreTed">
		<xsl:param name="text"/>
		<xsl:param name="largo" select="0"/>
		<xsl:variable name="largo_actual" select="string-length($text)"/>
		<xsl:choose>
			<xsl:when test="$largo_actual &gt;= $largo">
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
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->