<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
	xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2">
	
<xsl:template name="Referencia">
	<xsl:if test="/pe1:CreditNote">
		<tr>
			<td width="40%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">DOCUMENTO(S) DE REFERENCIA :</font>
			</td>
		</tr>

		<tr>
			<td width="40%">
				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="40%">
					<tbody>
						<tr width="65%">
							<td width="20%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Tipo Documento</strong>
								</font>
							</td>
							<td width="20%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Correlativo</strong>
								</font>
							</td>
							<!--<td width="20%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Fecha Emisión</strong>
								</font>
							</td>-->
						</tr>
						<!--<xsl:variable name="i" select="1" />-->
<!--
						<xsl:for-each select="//cac:DespatchDocumentReference">
							<xsl:if test="cbc:DocumentTypeCode != '10'">
								<tr width="65%">
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
												<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA ELE.</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>-->
						<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
							<xsl:if test="cbc:DocumentTypeCode != '10'">
								<tr  width="65%" >
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
												<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="Dato09">
												<xsl:with-param name="var" select="position()" />
											</xsl:call-template>
										</font>
									</td>-->
								</tr>
							</xsl:if>
<!--
							<xsl:variable name="i" select="$i + 1" />-->
						</xsl:for-each>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>&#xA0;</tr>
		<tr>
			<td>
				<xsl:choose>
					<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
						<font size="1" face="Arial, Helvetica, sans-serif"/>
					</xsl:when>
					<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font size="1" face="Arial, Helvetica, sans-serif"></font></xsl:when>
					<xsl:otherwise>
					<xsl:if test="/pe1:CreditNote"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>
					<xsl:if test="/pe2:DebitNote"> <font size="1" face="Arial, Helvetica, sans-serif"><strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>      
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:if>

	<xsl:if test="/pe2:DebitNote">
		<xsl:if test="//cac:DiscrepancyResponse/cbc:ResponseCode !=3">
		<tr>
			<td width="65%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">DOCUMENTO(S) DE REFERENCIA :</font>
			</td>
		</tr>
		
		<tr>
			<td width="65%">
				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="65%">
					<tbody>
						<tr width="65%">
							<td width="25%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Tipo Documento</strong>
								</font>
							</td>
							<td width="20%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Correlativo</strong>
								</font>
							</td>
							<!--<td width="20%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Fecha Emisión</strong>
								</font>
							</td>-->
						</tr>
						<!--<xsl:variable name="i" select="1" />-->
<!--
						<xsl:for-each select="//cac:DespatchDocumentReference">
							<xsl:if test="cbc:DocumentTypeCode != '10'">
								<tr width="65%">
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
												<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA ELE.</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>-->
						<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
							<xsl:if test="cbc:DocumentTypeCode != '10'">
								<tr  width="65%" >
									<td width="25%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
												<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA DE VENTA</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
												<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!--<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="Dato09">
												<xsl:with-param name="var" select="position()" />
											</xsl:call-template>
										</font>
									</td>-->
								</tr>
							</xsl:if>
<!--
							<xsl:variable name="i" select="$i + 1" />-->
						</xsl:for-each>
					</tbody>
				</table>
			</td>
		</tr>
		</xsl:if>
		<tr>&#xA0;</tr>
		<tr>
			<td>
				<xsl:choose>
					<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
						<font size="1" face="Arial, Helvetica, sans-serif"/>
					</xsl:when>
					<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font size="1" face="Arial, Helvetica, sans-serif"></font></xsl:when>
					<xsl:otherwise>
					<xsl:if test="/pe1:CreditNote"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>
					<xsl:if test="/pe2:DebitNote"> <font size="1" face="Arial, Helvetica, sans-serif"><strong>Sustento : <xsl:value-of select="//cac:DiscrepancyResponse/cbc:Description"/></strong></font></xsl:if>      
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:if>

	</xsl:template>
	<xsl:template name="bottom_hash">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode = '01' or /pe:Invoice/cbc:InvoiceTypeCode = '03'">
			<tr>
				<td>
				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%" rules="none"><tbody>
						<tr>
							<td width="100%">
							<font face="Arial, Helvetica, sans-serif" size="1">
							1. Favor emitir cheque no negociable a la orden de ACCEAUTO S.A.C. o depositar en las cuentas corrientes del banco de crédito 
							<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="09" /></xsl:call-template>	en soles ó
							<xsl:call-template name="RetourneValAd"><xsl:with-param name="NumAd" select="10" /></xsl:call-template>	 en dólares.<br/>
							2. No aceptamos pagos en efectivo y su pago sólo será considerando si se canjea por recibo de pago emitido por ACCEAUTO S.A.C. por un funcionario autorizado.<br/>
							3. La mercadería viaja por cuenta y riesgo del cliente.<br/>
							4. No aceptamos devoluciones pasadas 24 horas de recibida la mercadería.<br/>
							5. Se hace constar que la firma de una persona distinta al comprador implica que dicha persona está autorizada por el comprador para firmar, reconocer la deuda y obligar.<br/>
							6. La cancelación y/o abono en soles se hará al tipo de cambio venta del día de pago, según tabla publicada en SUNAT.<br/>
							Aceptación del cliente: Declaro que al recibir la mercadería, ya sea a través de esta factura, o por medio de guía de remisión 
							o acta de recepción, a mi entera satisfacción, me sujeto a las condiciones y plazos consignados en la forma de pago, aceptando pagar el caso de mora el máximo interés convencional y por 
							mora establecida por la ley. Renuncio domicilio y me someto a los Jueces competentes en la ciudad de Lima - Perú y al juicio ejecutivo o verbal sumario. Sin protesto.<br/>
							</font>
							</td>
						</tr></tbody>
					</table>	
				</td>	
			</tr>
			</xsl:if>
			<tr>
				<td>&#160;
				</td>
			</tr>
			<!--<tr>
				<td valign="baseline" width="55%" align="center">
					<img><xsl:attribute name="src"><xsl:call-template name="timbre"/></xsl:attribute></img>
				</td>
			</tr>-->
			<tr>
									<td align="center">
										<img src="bacceauto.jpg" />
									</td>
			</tr>
			<!--<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">
			<tr>
				<td valign="baseline" width="55%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="1">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='13'">
									<xsl:if test="pe:Valor !='-'">
										<xsl:value-of select="pe:Valor"/> 
									</xsl:if>
								</xsl:if>
						</xsl:for-each>
					</font>
				</td>
			</tr>
			</xsl:if>-->
		</table>
	</xsl:template>


	<!--Referencia de ANTICIPO-->
	<xsl:template name="anticipo">	 
		<!--<table border="0" cellpadding="0" cellspacing="0" width="50%">-->
		<table border="1" rules="all" width="50%" cellpadding="1" cellspacing="0" bordercolor="silver">
			<!--<tr>				
				<td width="50%">
				<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="50%">
					<tbody>-->
						<font face="Arial, Helvetica, sans-serif" size="2">
								<strong>Detalle de anticipo</strong>
						</font>
						
						<xsl:if test="//cbc:UBLVersionID='2.0'">
						<tr width="50%">
							<!--<td width="15%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Tipo Documento</strong>
								</font>
							</td>-->
							<td width="20%" align="center" bgcolor="silver">
								<font face="Arial, Helvetica, sans-serif" size="2">
									Número Documento
								</font>
							</td>
							<td width="15%" align="center" bgcolor="silver">
								<font face="Arial, Helvetica, sans-serif" size="2">
									Importe Anticipo
								</font>
							</td>
						</tr>

						<xsl:for-each select="//cac:PrepaidPayment">
								<tr width="50%">
									<!--<td width="15%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:choose>
												<xsl:when test="//cac:LegalMonetaryTotal/cbc:PrepaidAmount !=''">ANTICIPO</xsl:when>
												<xsl:otherwise>Documento NN</xsl:otherwise>
											</xsl:choose>
										</font>
									</td>-->
									<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<td width="15%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="cbc:PaidAmount"/>
										</font>
									</td>
								</tr>
						</xsl:for-each>
						</xsl:if>
						
						<xsl:if test="//cbc:UBLVersionID='2.1'">
							<tr width="50%">
								<td width="20%" align="center" bgcolor="silver">
									<font face="Arial, Helvetica, sans-serif" size="2">
										Número Documento
									</font>
								</td>
								<td width="15%" align="center" bgcolor="silver">
									<font face="Arial, Helvetica, sans-serif" size="2">
										Importe Anticipo
									</font>
								</td>
							</tr>
						
						<tr width="50%">
						<xsl:for-each select="//cac:AdditionalDocumentReference">
							<xsl:if test="cbc:DocumentTypeCode='02'">
								<td width="20%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
							</xsl:if>	
						</xsl:for-each>
						<xsl:for-each select="//cac:PrepaidPayment">
								<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:PaidAmount"/>
									</font>
								</td>
						</xsl:for-each>
						</tr>
						</xsl:if>
					<!--</tbody>
				</table>
			</td>
			</tr>-->
			
		</table>	  
	</xsl:template>
	<xsl:template name="Dato09">
		<xsl:param name="var" />

		<xsl:variable name="varvar">
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
				<xsl:if test="pe1:Codigo = '08'"><xsl:value-of select="pe1:Valor" /></xsl:if>
			</xsl:for-each>
			<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
				<xsl:if test="pe2:Codigo = '08'"><xsl:value-of select="pe2:Valor" /></xsl:if>
			</xsl:for-each>
		</xsl:variable>
	
		<xsl:variable name="linea1">
			<xsl:value-of select="substring-before($varvar, '|')" />
		</xsl:variable>
		<xsl:variable name="resto1">
			<xsl:value-of select="substring-after($varvar, '|')" />
		</xsl:variable>
		<xsl:variable name="linea2">
			<xsl:value-of select="substring-before($resto1, '|')" />
		</xsl:variable>
		<xsl:variable name="resto2">
			<xsl:value-of select="substring-after($resto1, '|')" />
		</xsl:variable>
		<xsl:variable name="linea3">
			<xsl:value-of select="substring-before($resto2, '|')" />
		</xsl:variable>
		<xsl:variable name="resto3">
			<xsl:value-of select="substring-after($resto2, '|')" />
		</xsl:variable>
		<xsl:variable name="linea4">
			<xsl:value-of select="substring-before($resto3, '|')" />
		</xsl:variable>
		<xsl:variable name="resto4">
			<xsl:value-of select="substring-after($resto3, '|')" />
		</xsl:variable>
		<xsl:variable name="linea5">
			<xsl:value-of select="substring-before($resto4, '|')" />
		</xsl:variable>
		<xsl:variable name="resto5">
			<xsl:value-of select="substring-after($resto4, '|')" />
		</xsl:variable>
		<xsl:variable name="linea6">
			<xsl:value-of select="substring-before($resto5, '|')" />
		</xsl:variable>
		<xsl:variable name="resto6">
			<xsl:value-of select="substring-after($resto5, '|')" />
		</xsl:variable>
		<xsl:variable name="linea7">
			<xsl:value-of select="substring-before($resto6, '|')" />
		</xsl:variable>
		<xsl:variable name="resto7">
			<xsl:value-of select="substring-after($resto6, '|')" />
		</xsl:variable>
		<xsl:variable name="linea8">
			<xsl:value-of select="substring-before($resto7, '|')" />
		</xsl:variable>
		<xsl:variable name="resto8">
			<xsl:value-of select="substring-after($resto7, '|')" />
		</xsl:variable>
		<xsl:variable name="linea9">
			<xsl:value-of select="substring-before($resto8, '|')" />
		</xsl:variable>
		<xsl:variable name="resto9">
			<xsl:value-of select="substring-after($resto8, '|')" />
		</xsl:variable>
		<xsl:variable name="linea10">
			<xsl:value-of select="substring-before($resto9, '|')" />
		</xsl:variable>
		<xsl:variable name="resto10">
			<xsl:value-of select="substring-after($resto9, '|')" />
		</xsl:variable>
		<xsl:variable name="linea11">
			<xsl:value-of select="substring-before($resto10, '|')" />
		</xsl:variable>
		<xsl:variable name="resto11">
			<xsl:value-of select="substring-after($resto10, '|')" />
		</xsl:variable>
		<xsl:variable name="linea12">
			<xsl:value-of select="substring-before($resto11, '|')" />
		</xsl:variable>
		<xsl:variable name="resto12">
			<xsl:value-of select="substring-after($resto11, '|')" />
		</xsl:variable>
		<xsl:variable name="linea13">
			<xsl:value-of select="substring-before($resto12, '|')" />
		</xsl:variable>
		<xsl:variable name="resto13">
			<xsl:value-of select="substring-after($resto12, '|')" />
		</xsl:variable>
		<xsl:variable name="linea14">
			<xsl:value-of select="substring-before($resto13, '|')" />
		</xsl:variable>
		<xsl:variable name="resto14">
			<xsl:value-of select="substring-after($resto13, '|')" />
		</xsl:variable>
		<xsl:variable name="linea15">
			<xsl:value-of select="substring-before($resto14, '|')" />
		</xsl:variable>
		<xsl:variable name="resto15">
			<xsl:value-of select="substring-after($resto14, '|')" />
		</xsl:variable>
		<xsl:variable name="linea16">
			<xsl:value-of select="substring-before($resto15, '|')" />
		</xsl:variable>
		<xsl:variable name="resto16">
			<xsl:value-of select="substring-after($resto15, '|')" />
		</xsl:variable>
		<xsl:variable name="linea17">
			<xsl:value-of select="substring-before($resto16, '|')" />
		</xsl:variable>
		<xsl:variable name="resto17">
			<xsl:value-of select="substring-after($resto16, '|')" />
		</xsl:variable>
		<xsl:variable name="linea18">
			<xsl:value-of select="substring-before($resto17, '|')" />
		</xsl:variable>
		<xsl:variable name="resto18">
			<xsl:value-of select="substring-after($resto17, '|')" />
		</xsl:variable>
		<xsl:variable name="linea19">
			<xsl:value-of select="substring-before($resto18, '|')" />
		</xsl:variable>
		<xsl:variable name="resto19">
			<xsl:value-of select="substring-after($resto18, '|')" />
		</xsl:variable>
		<xsl:variable name="linea20">
			<xsl:value-of select="substring-before($resto19, '|')" />
		</xsl:variable>
		<xsl:variable name="resto20">
			<xsl:value-of select="substring-after($resto19, '|')" />
		</xsl:variable>
		<xsl:variable name="linea21">
			<xsl:value-of select="substring-before($resto20, '|')" />
		</xsl:variable>
		<xsl:variable name="resto21">
			<xsl:value-of select="substring-after($resto20, '|')" />
		</xsl:variable>
		<xsl:variable name="linea22">
			<xsl:value-of select="substring-before($resto21, '|')" />
		</xsl:variable>
		<xsl:variable name="resto22">
			<xsl:value-of select="substring-after($resto21, '|')" />
		</xsl:variable>
		<xsl:variable name="linea23">
			<xsl:value-of select="substring-before($resto22, '|')" />
		</xsl:variable>
		<xsl:variable name="resto23">
			<xsl:value-of select="substring-after($resto22, '|')" />
		</xsl:variable>
		<xsl:variable name="linea24">
			<xsl:value-of select="substring-before($resto23, '|')" />
		</xsl:variable>
		<xsl:variable name="resto24">
			<xsl:value-of select="substring-after($resto23, '|')" />
		</xsl:variable>
		<xsl:variable name="linea25">
			<xsl:value-of select="substring-before($resto24, '|')" />
		</xsl:variable>
		<xsl:variable name="resto25">
			<xsl:value-of select="substring-after($resto24, '|')" />
		</xsl:variable>
		<xsl:variable name="linea26">
			<xsl:value-of select="substring-before($resto25, '|')" />
		</xsl:variable>
		<xsl:variable name="resto26">
			<xsl:value-of select="substring-after($resto25, '|')" />
		</xsl:variable>
		<xsl:variable name="linea27">
			<xsl:value-of select="substring-before($resto26, '|')" />
		</xsl:variable>
		<xsl:variable name="resto27">
			<xsl:value-of select="substring-after($resto26, '|')" />
		</xsl:variable>
		<xsl:variable name="linea28">
			<xsl:value-of select="substring-before($resto27, '|')" />
		</xsl:variable>
		<xsl:variable name="resto28">
			<xsl:value-of select="substring-after($resto27, '|')" />
		</xsl:variable>
		<xsl:variable name="linea29">
			<xsl:value-of select="substring-before($resto28, '|')" />
		</xsl:variable>
		<xsl:variable name="resto29">
			<xsl:value-of select="substring-after($resto28, '|')" />
		</xsl:variable>
		<xsl:variable name="linea30">
			<xsl:value-of select="substring-before($resto29, '|')" />
		</xsl:variable>
		<xsl:variable name="resto30">
			<xsl:value-of select="substring-after($resto29, '|')" />
		</xsl:variable>
	
		<xsl:choose>
			<xsl:when test="$var = '1'"><xsl:value-of select="$linea1" /></xsl:when>
			<xsl:when test="$var = '2'"><xsl:value-of select="$linea2" /></xsl:when>
			<xsl:when test="$var = '3'"><xsl:value-of select="$linea3" /></xsl:when>
			<xsl:when test="$var = '4'"><xsl:value-of select="$linea4" /></xsl:when>
			<xsl:when test="$var = '5'"><xsl:value-of select="$linea5" /></xsl:when>
			<xsl:when test="$var = '6'"><xsl:value-of select="$linea6" /></xsl:when>
			<xsl:when test="$var = '7'"><xsl:value-of select="$linea7" /></xsl:when>
			<xsl:when test="$var = '8'"><xsl:value-of select="$linea8" /></xsl:when>
			<xsl:when test="$var = '9'"><xsl:value-of select="$linea9" /></xsl:when>
			<xsl:when test="$var = '10'"><xsl:value-of select="$linea10" /></xsl:when>
			<xsl:when test="$var = '11'"><xsl:value-of select="$linea11" /></xsl:when>
			<xsl:when test="$var = '12'"><xsl:value-of select="$linea12" /></xsl:when>
			<xsl:when test="$var = '13'"><xsl:value-of select="$linea13" /></xsl:when>
			<xsl:when test="$var = '14'"><xsl:value-of select="$linea14" /></xsl:when>
			<xsl:when test="$var = '15'"><xsl:value-of select="$linea15" /></xsl:when>
			<xsl:when test="$var = '16'"><xsl:value-of select="$linea16" /></xsl:when>
			<xsl:when test="$var = '17'"><xsl:value-of select="$linea17" /></xsl:when>
			<xsl:when test="$var = '18'"><xsl:value-of select="$linea18" /></xsl:when>
			<xsl:when test="$var = '19'"><xsl:value-of select="$linea19" /></xsl:when>
			<xsl:when test="$var = '20'"><xsl:value-of select="$linea20" /></xsl:when>
			<xsl:when test="$var = '21'"><xsl:value-of select="$linea21" /></xsl:when>
			<xsl:when test="$var = '22'"><xsl:value-of select="$linea22" /></xsl:when>
			<xsl:when test="$var = '23'"><xsl:value-of select="$linea23" /></xsl:when>
			<xsl:when test="$var = '24'"><xsl:value-of select="$linea24" /></xsl:when>
			<xsl:when test="$var = '25'"><xsl:value-of select="$linea25" /></xsl:when>
			<xsl:when test="$var = '26'"><xsl:value-of select="$linea26" /></xsl:when>
			<xsl:when test="$var = '27'"><xsl:value-of select="$linea27" /></xsl:when>
			<xsl:when test="$var = '28'"><xsl:value-of select="$linea28" /></xsl:when>
			<xsl:when test="$var = '29'"><xsl:value-of select="$linea29" /></xsl:when>
			<xsl:when test="$var = '30'"><xsl:value-of select="$linea30" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--<xsl:template name="timbre">
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
	</xsl:template>-->
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
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->