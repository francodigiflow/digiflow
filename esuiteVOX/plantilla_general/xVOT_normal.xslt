<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi"> 
   
   	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
   	<xsl:decimal-format name="pen" decimal-separator="." grouping-separator="," NaN="0.00"/>

   	<xsl:variable name="numColBl">
     	<xsl:if test="/pe:Invoice!=''">
	    	<xsl:value-of select="25-count(/pe:Invoice/cac:InvoiceLine)"/>
      	</xsl:if>
      	<xsl:if test="/pe1:CreditNote!=''">
	    	<xsl:value-of select="25-count(/pe1:CreditNote/cac:CreditNoteLine)"/>
	  	</xsl:if>
      	<xsl:if test="/pe2:DebitNote!=''">
	    	<xsl:value-of select="25-count(/pe2:DebitNote/cac:DebitNoteLine)"/>
	  	</xsl:if>
   	</xsl:variable>
   	<xsl:include href="xVOT_encab.xslt"/>
   	<xsl:include href="xVOT_detalle.xslt"/>
   	<xsl:include href="xVOT_bottom.xslt"/>
   	<xsl:include href="xVOT_datos.xslt"/>
   	<xsl:include href="xVOT_total.xslt"/>
	<xsl:template match="/">
	<html xmlns:sbc="urn:oasis:names:specification:ubl:schema:xsd:SignatureBasicComponents-2" xmlns:sac="urn:oasis:names:specification:ubl:schema:xsd:SignatureAggregateComponents-2" xmlns:sig="urn:oasis:names:specification:ubl:schema:xsd:CommonSignatureComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ccts="urn:un:unece:uncefact:documentation:2"><head>
		<title>Comprobante Electrónico</title>
		</head>
		<body>
			<table cellSpacing="1" width="100%" border="0">
				<tbody>
					<tr>
						<td><xsl:call-template name="Encabezado"/></td>
					</tr>
					<tr>
						<td><xsl:call-template name="DatosReceptor"/></td>
					</tr>
					<xsl:if test="/pe1:CreditNote or /pe2:DebitNote">
						<tr>
	                		<td width="100%" align="left">
	                   			<font face="Arial, Helvetica, sans-serif" size="2"><strong> VALOR DE AJUSTE:</strong></font>
	                		</td>
	             		</tr>
					</xsl:if>
					<tr>
						<!--seleccion segÃºn tipo de documento-->
	<!-- Ubl 2.0-->
	<xsl:if test="/pe:Invoice/cbc:UBLVersionID!= '2.1' or  /pe1:CreditNote/cbc:UBLVersionID!= '2.1' or /pe2:DebitNote/cbc:UBLVersionID!= '2.1'">
						<xsl:choose>
							<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='1'">
								<td><xsl:call-template name="DetallesEncabezado1"/></td>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='6'">
								<td><xsl:call-template name="DetallesEncabezado1"/></td>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='A'">
								<td><xsl:call-template name="DetallesEncabezado2"/></td>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='0'">
								<td><xsl:call-template name="DetallesEncabezado2"/></td>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='4'">
								<td><xsl:call-template name="DetallesEncabezado2"/></td>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='7'">
								<td><xsl:call-template name="DetallesEncabezado2"/></td>
							</xsl:when>
						</xsl:choose>
</xsl:if>	
<!-- Ubl 2.1-->
<xsl:if test="/pe:Invoice/cbc:UBLVersionID= '2.1' or  /pe1:CreditNote/cbc:UBLVersionID= '2.1' or /pe2:DebitNote/cbc:UBLVersionID= '2.1'">
	<xsl:choose>
	<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">
							
								<td><xsl:call-template name="DetallesEncabezado1"/></td>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">
							
								<td><xsl:call-template name="DetallesEncabezado1"/></td>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">
								<td><xsl:call-template name="DetallesEncabezado1"/></td>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">
								<td><xsl:call-template name="DetallesEncabezado2"/></td>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">
								<td><xsl:call-template name="DetallesEncabezado2"/></td>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">
								<td><xsl:call-template name="DetallesEncabezado2"/></td>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">
								<td><xsl:call-template name="DetallesEncabezado2"/></td>
							</xsl:when>
						</xsl:choose>
</xsl:if>	
							<!--td>
							<xsl:call-template name="DetallesEncabezado2"/>	
						  	</td-->
					</tr>
					<tr><td>
					<!-- Marco externo-->
					<table border="2" cellspacing="0" cellpadding="2" width="100%" borderColor="#000000">
						<body>
						<tr>
						<td>
						<font face="Arial, Helvetica, sans-serif" size="2"><strong>INFORMACION ADICIONAL</strong></font>
						      
						<xsl:choose>
							<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='1' or //cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '1'">
							 <table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
											<body>
   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
												<xsl:if test="pe:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe:Valor"/>
												</xsl:variable>
													<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>
												</xsl:for-each>
 <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
												<xsl:if test="pe1:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:variable>
	<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>

												</xsl:for-each>
                                            <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
												<xsl:if test="pe2:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:variable>
													<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>
											
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
													<xsl:if test="pe:Codigo='04'">

														<xsl:variable name="Piezas">
															<xsl:value-of select="substring-before(pe:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto1">
															<xsl:value-of select="substring-after(pe:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="PesoNeto">
															<xsl:value-of select="substring-before($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto2">
															<xsl:value-of select="substring-after($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="Destino">
															<xsl:value-of select="substring-before($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto3">
															<xsl:value-of select="substring-after($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="PaisDestino">
															<xsl:value-of select="substring-before($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto4">
															<xsl:value-of select="substring-after($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="FOB">
															<xsl:value-of select="substring-before($resto4,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto5">
															<xsl:value-of select="substring-after($resto4,'*')"/>
														</xsl:variable>
														<xsl:variable name="flete">
															<xsl:value-of select="substring-before($resto5,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto6">
															<xsl:value-of select="substring-after($resto5,'*')"/>
														</xsl:variable>
														<xsl:variable name="seguro">
															<xsl:value-of select="substring-before($resto6,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto7">
															<xsl:value-of select="substring-after($resto6,'*')"/>
														</xsl:variable>
														<xsl:variable name="CondicionEntrega">
															<xsl:value-of select="substring-before($resto7,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto8">
															<xsl:value-of select="substring-after($resto7,'*')"/>
														</xsl:variable>
														<xsl:variable name="FechaEmbarque">
															<xsl:value-of select="substring-before($resto8,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto9">
															<xsl:value-of select="substring-after($resto8,'*')"/>
														</xsl:variable>
														<xsl:variable name="PartidaArancelaria">
															<xsl:value-of select="substring-before($resto9,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto10">
															<xsl:value-of select="substring-after($resto9,'*')"/>
														</xsl:variable>

														<!--pesoNeto-->
													<xsl:if test="$PesoNeto!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Neto/Net Weight</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															<xsl:value-of select="$PesoNeto"/>
															</font>
															</td>
														</tr>
													</xsl:if>
											</xsl:if>
											</xsl:for-each>

											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
													<xsl:if test="pe:Codigo='01'">
														<xsl:variable name="PesoBruto">
															<xsl:value-of select="substring-before(pe:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto1">
															<xsl:value-of select="substring-after(pe:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="Atados">
															<xsl:value-of select="substring-before($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto2">
															<xsl:value-of select="substring-after($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="Pedido">
															<xsl:value-of select="substring-before($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto3">
															<xsl:value-of select="substring-after($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="Cuota">
															<xsl:value-of select="substring-before($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto4">
															<xsl:value-of select="substring-after($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="Periodo">
															<xsl:value-of select="substring-before($resto4,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto5">
															<xsl:value-of select="substring-after($resto4,'*')"/>
														</xsl:variable>
														<!--Peso Bruto-->
													<xsl:if test="$PesoBruto!='-'">
															<tr>
																<td width="15%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
																</td>
																<td width="25%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Bruto/Gross Weight</strong></font>
																</td>
																<td width="60%">
																<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
																&#160;<xsl:value-of select="$PesoBruto"/>
																</font>
																</td>
															</tr>
													</xsl:if>
														<!--atados/bundles-->
													<xsl:if test="$Atados!='-'">
															<tr>
																<td width="15%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
																</td>
																<td width="25%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>
																	<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																		<xsl:if test="pe:Codigo='11'">					
																				<xsl:value-of select="pe:Valor"/>
																		</xsl:if>
																	</xsl:for-each>
																</strong></font>
																</td>
																<td width="60%">
																<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
																&#160;<xsl:value-of select="$Atados"/>
																</font>
																</td>
															</tr>
															<tr><td><strong>&#160;</strong></td></tr>
													</xsl:if>
														<!--Cuota / Quote-->
													<xsl:if test="$Cuota!='-'">
															<tr>
																<td width="15%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
																</td>
																<td width="25%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Cuota/Quote</strong></font>
																</td>
																<td width="60%">
																<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
																&#160;<xsl:value-of select="$Cuota"/>
																</font>
																</td>
															</tr>
													</xsl:if>
													<!--periodo-->
													<xsl:if test="$Periodo!='-'">
															<tr>
																<td width="15%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
																</td>
																<td width="25%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Periodo Cotización/Q.P.</strong></font>
																</td>
																<td width="60%">
																<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
																&#160;<xsl:value-of select="$Periodo"/>
																</font>
																</td>
															</tr>
															<tr><td><strong>&#160;</strong></td></tr>
													</xsl:if>
													<!--Pedido-->
													<xsl:if test="$Pedido!='-'">
															<tr>
																<td width="15%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
																</td>
																<td width="25%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Pedido/Order</strong></font>
																</td>
																<td width="60%">
																<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
																&#160;<xsl:value-of select="$Pedido"/>
																</font>
																</td>
															</tr>
													</xsl:if>
											</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
													<xsl:if test="pe:Codigo='05'">
														<xsl:variable name="formaPago">
															<xsl:value-of select="substring-before(pe:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto1">
															<xsl:value-of select="substring-after(pe:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="lugardespacho">
															<xsl:value-of select="substring-before($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto2">
															<xsl:value-of select="substring-after($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="Sap">
															<xsl:value-of select="substring-before($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto3">
															<xsl:value-of select="substring-after($resto2,'*')"/>
														</xsl:variable>

													<xsl:if test="$formaPago!='-'">
															<tr>
																<td width="15%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
																</td>
																<td width="25%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Forma de Pago/ Payment Terms</strong></font>
																</td>
																<td width="60%">
																<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
																&#160;<xsl:value-of select="$formaPago"/>
																</font>
																</td>
															</tr>
													</xsl:if>
													<xsl:if test="$lugardespacho!='-'">
															<tr>
																<td width="15%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
																</td>
																<td width="25%">
																<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Lugar de Despacho</strong></font>
																</td>
																<td width="60%">
																<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
																&#160;<xsl:value-of select="$lugardespacho"/>
																</font>
																</td>
															</tr>
															<tr><td><strong>&#160;</strong></td></tr>
													</xsl:if>
											</xsl:if>
											</xsl:for-each>						
							
											<!-- Valores NC y ND -->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
													<xsl:if test="pe1:Codigo='10'">

														<xsl:variable name="Quota">
															<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto1">
															<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="NOrden">
															<xsl:value-of select="substring-before($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto2">
															<xsl:value-of select="substring-after($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="OrdenVenta">
															<xsl:value-of select="substring-before($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto3">
															<xsl:value-of select="substring-after($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="PreciounitarioProvisional">
															<xsl:value-of select="substring-before($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto4">
															<xsl:value-of select="substring-after($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="Pesoprovisional">
															<xsl:value-of select="substring-before($resto4,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto5">
															<xsl:value-of select="substring-after($resto4,'*')"/>
														</xsl:variable>
														<xsl:variable name="FacturaProvisional">
															<xsl:value-of select="substring-before($resto5,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto6">
															<xsl:value-of select="substring-after($resto5,'*')"/>
														</xsl:variable>
														<xsl:variable name="PreciounitarioFinal">
															<xsl:value-of select="substring-before($resto6,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto7">
															<xsl:value-of select="substring-after($resto6,'*')"/>
														</xsl:variable>
														<xsl:variable name="Pesofinales">
															<xsl:value-of select="substring-before($resto7,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto8">
															<xsl:value-of select="substring-after($resto7,'*')"/>
														</xsl:variable>
														<xsl:variable name="FacturaFinal">
															<xsl:value-of select="substring-before($resto8,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto9">
															<xsl:value-of select="substring-after($resto8,'*')"/>
														</xsl:variable>
														<xsl:variable name="Diferencia">
															<xsl:value-of select="substring-before($resto9,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto10">
															<xsl:value-of select="substring-after($resto9,'*')"/>
														</xsl:variable>
														<xsl:variable name="Fechadereferecia">
															<xsl:value-of select="substring-before($resto10,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto11">
															<xsl:value-of select="substring-after($resto10,'*')"/>
														</xsl:variable>

													<xsl:if test="$Quota!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Quota</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Quota"/>
															</font>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="$NOrden!='-'">
														<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$NOrden"/>
													</font>
													</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
													</xsl:if>
													<xsl:if test="$OrdenVenta!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden de venta</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$OrdenVenta"/>
															</font>
															</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
													</xsl:if>
													<xsl:if test="$PreciounitarioProvisional!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Provisional</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$PreciounitarioProvisional"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$Pesoprovisional!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso provisional</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Pesoprovisional"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$FacturaProvisional!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Provisional</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$FacturaProvisional"/>
															</font>
															</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
													</xsl:if>
													<xsl:if test="$PreciounitarioFinal!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Final</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$PreciounitarioFinal"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$Pesofinales!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso finales</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Pesofinales"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$FacturaFinal!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Final</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$FacturaFinal"/>
															</font>
															</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
													</xsl:if>
													<xsl:if test="$Diferencia!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Diferencia</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Diferencia"/>
															</font>
															</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
													</xsl:if>


											</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
													<xsl:if test="pe2:Codigo='10'">

														<xsl:variable name="Quota">
															<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto1">
															<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="NOrden">
															<xsl:value-of select="substring-before($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto2">
															<xsl:value-of select="substring-after($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="OrdenVenta">
															<xsl:value-of select="substring-before($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto3">
															<xsl:value-of select="substring-after($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="PreciounitarioProvisional">
															<xsl:value-of select="substring-before($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto4">
															<xsl:value-of select="substring-after($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="Pesoprovisional">
															<xsl:value-of select="substring-before($resto4,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto5">
															<xsl:value-of select="substring-after($resto4,'*')"/>
														</xsl:variable>
														<xsl:variable name="FacturaProvisional">
															<xsl:value-of select="substring-before($resto5,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto6">
															<xsl:value-of select="substring-after($resto5,'*')"/>
														</xsl:variable>
														<xsl:variable name="PreciounitarioFinal">
															<xsl:value-of select="substring-before($resto6,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto7">
															<xsl:value-of select="substring-after($resto6,'*')"/>
														</xsl:variable>
														<xsl:variable name="Pesofinales">
															<xsl:value-of select="substring-before($resto7,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto8">
															<xsl:value-of select="substring-after($resto7,'*')"/>
														</xsl:variable>
														<xsl:variable name="FacturaFinal">
															<xsl:value-of select="substring-before($resto8,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto9">
															<xsl:value-of select="substring-after($resto8,'*')"/>
														</xsl:variable>
														<xsl:variable name="Diferencia">
															<xsl:value-of select="substring-before($resto9,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto10">
															<xsl:value-of select="substring-after($resto9,'*')"/>
														</xsl:variable>
														<xsl:variable name="Fechadereferecia">
															<xsl:value-of select="substring-before($resto10,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto11">
															<xsl:value-of select="substring-after($resto10,'*')"/>
														</xsl:variable>

													<xsl:if test="$Quota!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Quota</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Quota"/>
															</font>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="$NOrden!='-'">
														<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$NOrden"/>
													</font>
													</td>
													</tr>
													</xsl:if>
													<xsl:if test="$OrdenVenta!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden de venta</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$OrdenVenta"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$PreciounitarioProvisional!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Provisional</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$PreciounitarioProvisional"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$Pesoprovisional!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso provisional</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Pesoprovisional"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$FacturaProvisional!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Provisional</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$FacturaProvisional"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$PreciounitarioFinal!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Final</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$PreciounitarioFinal"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$Pesofinales!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso finales</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Pesofinales"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$FacturaFinal!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Final</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$FacturaFinal"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$Diferencia!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Diferencia</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Diferencia"/>
															</font>
															</td>
													</tr>
													</xsl:if>


											</xsl:if>
											</xsl:for-each>
										</body>
							</table>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='6' or //cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '6'">
								<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
									<body>
									   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
												<xsl:if test="pe:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe:Valor"/>
												</xsl:variable>
													<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>
												</xsl:for-each>
 <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
												<xsl:if test="pe1:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:variable>
	<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>

												</xsl:for-each>
                                            <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
												<xsl:if test="pe2:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:variable>
													<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>
											
											</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='04'">

												<xsl:variable name="Piezas">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="PesoNeto">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Destino">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PaisDestino">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="FOB">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="flete">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="seguro">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="CondicionEntrega">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FechaEmbarque">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="PartidaArancelaria">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>

												<!--pesoNeto-->
											<xsl:if test="$PesoNeto!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Neto/Net Weight</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PesoNeto"/>
													</font>
													</td>
												</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='01'">
												<xsl:variable name="PesoBruto">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="Atados">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pedido">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="Cuota">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="Periodo">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<!--Peso Bruto-->
											<xsl:if test="$PesoBruto!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Bruto/Gross Weight</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$PesoBruto"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												<!--atados/bundles-->
											<xsl:if test="$Atados!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>
															<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
																<xsl:if test="pe:Codigo='11'">					
																		<xsl:value-of select="pe:Valor"/>
																</xsl:if>
															</xsl:for-each>
														</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Atados"/>
														</font>
														</td>
													</tr>
											
											

<!--			INICIO  -->


	<!--Barras / Slaps -->

								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">

											<xsl:if test="pe:Codigo='15'">	
											
													<xsl:if test="pe:Valor!='-'">	
																																	
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>



													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='15'">	
														
														<xsl:value-of select="substring-before(pe:Valor,'*')"/>

														</xsl:if>
													</xsl:for-each>

													</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:&#160;&#160;</strong>
													


													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='15'">		
																											
										 							<xsl:if test="pe:Valor!='-'">																								
																		<xsl:value-of select="substring-after(pe:Valor,'*')"/>																																							
																	</xsl:if>

																										
																										
														</xsl:if>
													</xsl:for-each>
													</font>
													</td>
											   </tr>																						
										</xsl:if>
											</xsl:if>

								</xsl:for-each>
											





<!--			FIN  -->



											</xsl:if>
											<tr><td><strong>&#160;</strong></td></tr>
											

											


											<!--Cuota / Quote-->
											<xsl:if test="$Cuota!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Cuota/Quote</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Cuota"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											<!--periodo-->
											<xsl:if test="$Periodo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Periodo Cotización/Q.P.</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Periodo"/>
														</font>
														</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Pedido-->
											<xsl:if test="$Pedido!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Pedido/Order</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Pedido"/>
														</font>
														</td>
													</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='05'">
												<xsl:variable name="formaPago">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="lugardespacho">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Sap">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>

											<xsl:if test="$formaPago!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Forma de Pago/ Payment Terms</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$formaPago"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											<xsl:if test="$lugardespacho!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Lugar de Despacho</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$lugardespacho"/>
														</font>
														</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>						
							




									<!-- Valores NC y ND -->
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
													<xsl:if test="pe1:Codigo='10'">

														<xsl:variable name="Quota">
															<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto1">
															<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="NOrden">
															<xsl:value-of select="substring-before($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto2">
															<xsl:value-of select="substring-after($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="OrdenVenta">
															<xsl:value-of select="substring-before($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto3">
															<xsl:value-of select="substring-after($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="PreciounitarioProvisional">
															<xsl:value-of select="substring-before($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto4">
															<xsl:value-of select="substring-after($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="Pesoprovisional">
															<xsl:value-of select="substring-before($resto4,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto5">
															<xsl:value-of select="substring-after($resto4,'*')"/>
														</xsl:variable>
														<xsl:variable name="FacturaProvisional">
															<xsl:value-of select="substring-before($resto5,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto6">
															<xsl:value-of select="substring-after($resto5,'*')"/>
														</xsl:variable>
														<xsl:variable name="PreciounitarioFinal">
															<xsl:value-of select="substring-before($resto6,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto7">
															<xsl:value-of select="substring-after($resto6,'*')"/>
														</xsl:variable>
														<xsl:variable name="Pesofinales">
															<xsl:value-of select="substring-before($resto7,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto8">
															<xsl:value-of select="substring-after($resto7,'*')"/>
														</xsl:variable>
														<xsl:variable name="FacturaFinal">
															<xsl:value-of select="substring-before($resto8,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto9">
															<xsl:value-of select="substring-after($resto8,'*')"/>
														</xsl:variable>
														<xsl:variable name="Diferencia">
															<xsl:value-of select="substring-before($resto9,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto10">
															<xsl:value-of select="substring-after($resto9,'*')"/>
														</xsl:variable>
														<xsl:variable name="Fechadereferecia">
															<xsl:value-of select="substring-before($resto10,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto11">
															<xsl:value-of select="substring-after($resto10,'*')"/>
														</xsl:variable>

													<xsl:if test="$Quota!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Quota</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Quota"/>
															</font>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="$NOrden!='-'">
														<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$NOrden"/>
													</font>
													</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
													</xsl:if>
													<xsl:if test="$OrdenVenta!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden de venta</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$OrdenVenta"/>
															</font>
															</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
													</xsl:if>
													<xsl:if test="$PreciounitarioProvisional!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Provisional</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$PreciounitarioProvisional"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$Pesoprovisional!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso provisional</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Pesoprovisional"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$FacturaProvisional!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Provisional</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$FacturaProvisional"/>
															</font>
															</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
													</xsl:if>
													<xsl:if test="$PreciounitarioFinal!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Final</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$PreciounitarioFinal"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$Pesofinales!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso finales</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Pesofinales"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$FacturaFinal!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Final</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$FacturaFinal"/>
															</font>
															</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
													</xsl:if>
													<xsl:if test="$Diferencia!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Diferencia</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Diferencia"/>
															</font>
															</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
													</xsl:if>


											</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
													<xsl:if test="pe2:Codigo='10'">

														<xsl:variable name="Quota">
															<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto1">
															<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
														</xsl:variable>
														<xsl:variable name="NOrden">
															<xsl:value-of select="substring-before($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto2">
															<xsl:value-of select="substring-after($resto1,'*')"/>
														</xsl:variable>
														<xsl:variable name="OrdenVenta">
															<xsl:value-of select="substring-before($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto3">
															<xsl:value-of select="substring-after($resto2,'*')"/>
														</xsl:variable>
														<xsl:variable name="PreciounitarioProvisional">
															<xsl:value-of select="substring-before($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto4">
															<xsl:value-of select="substring-after($resto3,'*')"/>
														</xsl:variable>
														<xsl:variable name="Pesoprovisional">
															<xsl:value-of select="substring-before($resto4,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto5">
															<xsl:value-of select="substring-after($resto4,'*')"/>
														</xsl:variable>
														<xsl:variable name="FacturaProvisional">
															<xsl:value-of select="substring-before($resto5,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto6">
															<xsl:value-of select="substring-after($resto5,'*')"/>
														</xsl:variable>
														<xsl:variable name="PreciounitarioFinal">
															<xsl:value-of select="substring-before($resto6,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto7">
															<xsl:value-of select="substring-after($resto6,'*')"/>
														</xsl:variable>
														<xsl:variable name="Pesofinales">
															<xsl:value-of select="substring-before($resto7,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto8">
															<xsl:value-of select="substring-after($resto7,'*')"/>
														</xsl:variable>
														<xsl:variable name="FacturaFinal">
															<xsl:value-of select="substring-before($resto8,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto9">
															<xsl:value-of select="substring-after($resto8,'*')"/>
														</xsl:variable>
														<xsl:variable name="Diferencia">
															<xsl:value-of select="substring-before($resto9,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto10">
															<xsl:value-of select="substring-after($resto9,'*')"/>
														</xsl:variable>
														<xsl:variable name="Fechadereferecia">
															<xsl:value-of select="substring-before($resto10,'*')"/>
														</xsl:variable>
														<xsl:variable name="resto11">
															<xsl:value-of select="substring-after($resto10,'*')"/>
														</xsl:variable>

													<xsl:if test="$Quota!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Quota</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Quota"/>
															</font>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="$NOrden!='-'">
														<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$NOrden"/>
													</font>
													</td>
													</tr>
													</xsl:if>
													<xsl:if test="$OrdenVenta!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden de venta</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$OrdenVenta"/>
															</font>
															</td>
														</tr>
														<tr>
															<td>
																<font face="Arial, Helvetica, sans-serif" size="2" >&#160;</font>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="$PreciounitarioProvisional!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Provisional</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$PreciounitarioProvisional"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$Pesoprovisional!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso provisional</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Pesoprovisional"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$FacturaProvisional!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Provisional</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$FacturaProvisional"/>
															</font>
															</td>
														</tr>
														<tr>
															<td>
																<font face="Arial, Helvetica, sans-serif" size="2" >&#160;</font>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="$PreciounitarioFinal!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Final</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$PreciounitarioFinal"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$Pesofinales!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso finales</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Pesofinales"/>
															</font>
															</td>
													</tr>
													</xsl:if>
													<xsl:if test="$FacturaFinal!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Final</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$FacturaFinal"/>
															</font>
															</td>
														</tr>
														<tr>
															<td>
																<font face="Arial, Helvetica, sans-serif" size="2">&#160;</font>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="$Diferencia!='-'">
														<tr>
															<td width="15%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
															</td>
															<td width="25%">
															<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Diferencia</strong></font>
															</td>
															<td width="60%">
															<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
															&#160;<xsl:value-of select="$Diferencia"/>
															</font>
															</td>
														</tr>
													</xsl:if>


											</xsl:if>
											</xsl:for-each>
								</body>
								</table>



							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='A'  or //cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'A'">
								<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
									<body>
									   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
												<xsl:if test="pe:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe:Valor"/>
												</xsl:variable>
													<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>
												</xsl:for-each>
 <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
												<xsl:if test="pe1:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:variable>
	<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>

												</xsl:for-each>
                                            <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
												<xsl:if test="pe2:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:variable>
													<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>
											
											</xsl:for-each>
									<!-- Valores Fact y Bol -->
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='04'">
												<xsl:variable name="Piezas">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="PesoNeto">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Destino">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PaisDestino">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="FOB">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="flete">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="seguro">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="CondicionEntrega">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FechaEmbarque">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="PartidaArancelaria">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
											<!--Piezas/pieces-->
											<xsl:if test="$Piezas!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='11'">					
																<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Piezas"/>
													</font>
													</td>
											   </tr>
											</xsl:if>
											<!--Peso Neto/Net Weight-->
											<xsl:if test="$PesoNeto!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Neto/Net Weight</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PesoNeto"/>
													</font>
													</td>
											</tr>
											</xsl:if>
									</xsl:if>

									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='01'">
												<xsl:variable name="PesoBruto">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="Atados">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pedido">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="Cuota">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="Periodo">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
											<!--Peso Bruto/Gross Weight-->
											<xsl:if test="$PesoBruto!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Bruto/Gross Weight</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$PesoBruto"/>
														</font>
														</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Pedido/Order-->
											<xsl:if test="$Pedido!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Pedido/Order</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Pedido"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											<!--Cuota/Quote-->
											<xsl:if test="$Cuota!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Cuota/Quote</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Cuota"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											<!--Periodo Cotización-->
											<xsl:if test="$Periodo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Periodo Cotización/Q.P.</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Periodo"/>
														</font>
														</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='02'">
												<xsl:variable name="condicion">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="Origen">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="PaisOrigen">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>

											<!--CondiciÃ³n de entrega-->
											<xsl:if test="$condicion!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Condicion de entrega</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$condicion"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											
											<!--Origen/Origin-->
											<xsl:if test="$Origen!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Origen/Origin</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Origen"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											
											<!--País Origen/Origin Country-->
											<xsl:if test="$PaisOrigen!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>País Origen/Origin Country</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$PaisOrigen"/>
														</font>
														</td>
													</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='04'">
												<xsl:variable name="Piezas">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="PesoNeto">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Destino">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PaisDestino">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="FOB">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="flete">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="seguro">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="CondicionEntrega">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FechaEmbarque">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="PartidaArancelaria">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
											<!--Destino-->
											<xsl:if test="$Destino!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Destino</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Destino"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--País Destino-->
											<xsl:if test="$PaisDestino!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>País Destino/Destiny Country</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PaisDestino"/>
													</font>
													</td>
											</tr>
												<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Valor FOB-->
											<xsl:if test="$FOB!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Valor FOB</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FOB"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Flete-->
											<xsl:if test="$flete!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Flete</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$flete"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Seguro-->
											<xsl:if test="$seguro!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Seguro</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$seguro"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--condicion de entrega-->
											<xsl:if test="$CondicionEntrega!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Valor 
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='02'">
													<xsl:variable name="condicion">
														<xsl:value-of select="substring-before(pe:Valor,'*')"/>
													</xsl:variable>
													<xsl:variable name="resto11">
														<xsl:value-of select="substring-after(pe:Valor,'*')"/>
													</xsl:variable>
													<xsl:variable name="Origen">
														<xsl:value-of select="substring-before($resto11,'*')"/>
													</xsl:variable>
													<xsl:variable name="resto12">
														<xsl:value-of select="substring-after($resto11,'*')"/>
													</xsl:variable>
													<xsl:variable name="PaisOrigen">
														<xsl:value-of select="substring-before($resto12,'*')"/>
													</xsl:variable>
													<xsl:variable name="resto13">
														<xsl:value-of select="substring-after($resto12,'*')"/>
													</xsl:variable>

												<!--CondiciÃ³n de entrega-->
												<xsl:if test="$condicion!='-'">
													&#160;<xsl:value-of select="$condicion"/>
												</xsl:if>
										</xsl:if>
														</xsl:for-each>
													</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$CondicionEntrega"/>
													</font>
													</td>
													<tr><td><strong>&#160;</strong></td></tr>
												</tr>
											</xsl:if>
											<!--Fecha de Embarque-->
											<xsl:if test="$FechaEmbarque!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Fecha Est. Emb./Estimated Saling Date</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FechaEmbarque"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Partida Arancelaria-->
											<xsl:if test="$PartidaArancelaria!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Partida Arancelaria</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PartidaArancelaria"/>
													</font>
													</td>
												</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='05'">
												<xsl:variable name="formaPago">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="lugardespacho">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Sap">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
											<!--Forma de Pago-->
											<xsl:if test="$formaPago!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Forma de Pago/ Payment Terms</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$formaPago"/>
														</font>
														</td>
													</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>						
							
									<!-- Valores NC y ND -->

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
											<xsl:if test="pe1:Codigo='10'">

												<xsl:variable name="Quota">
													<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="NOrden">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="OrdenVenta">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioProvisional">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesoprovisional">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaProvisional">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioFinal">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesofinales">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaFinal">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="Diferencia">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="Fechadereferecia">
													<xsl:value-of select="substring-before($resto10,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto11">
													<xsl:value-of select="substring-after($resto10,'*')"/>
												</xsl:variable>
											<!--Cuota-->
											<xsl:if test="$Quota!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Quota</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Quota"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Nro Orden-->
											<xsl:if test="$NOrden!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$NOrden"/>
													</font>
													</td>
												</tr>
												<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Nro Orden Vta-->
											<xsl:if test="$OrdenVenta!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N°Orden de venta</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$OrdenVenta"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio Unitario Provisional-->
											<xsl:if test="$PreciounitarioProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PreciounitarioProvisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso Provisional-->
											<xsl:if test="$Pesoprovisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Pesoprovisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura Provisional-->
											<xsl:if test="$FacturaProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FacturaProvisional"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio unitario Final-->
											<xsl:if test="$PreciounitarioFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PreciounitarioFinal"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso final-->
											<xsl:if test="$Pesofinales!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Pesofinales"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura final-->
											<xsl:if test="$FacturaFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FacturaFinal"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Diferencia-->
											<xsl:if test="$Diferencia!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Diferencia</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Diferencia"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
											<xsl:if test="pe2:Codigo='10'">

												<xsl:variable name="Quota">
													<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="NOrden">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="OrdenVenta">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioProvisional">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesoprovisional">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaProvisional">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioFinal">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesofinales">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaFinal">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="Diferencia">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="Fechadereferecia">
													<xsl:value-of select="substring-before($resto10,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto11">
													<xsl:value-of select="substring-after($resto10,'*')"/>
												</xsl:variable>
											<!--Cuota-->
											<xsl:if test="$Quota!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Quota</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Quota"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Nro Orden-->
											<xsl:if test="$NOrden!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$NOrden"/>
													</font>
													</td>
												</tr>
												<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Nro Orden Vta-->
											<xsl:if test="$OrdenVenta!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N°Orden de venta</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$OrdenVenta"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio Unitario Provisional-->
											<xsl:if test="$PreciounitarioProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PreciounitarioProvisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso Provisional-->
											<xsl:if test="$Pesoprovisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Pesoprovisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura Provisional-->
											<xsl:if test="$FacturaProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FacturaProvisional"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio unitario Final-->
											<xsl:if test="$PreciounitarioFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PreciounitarioFinal"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso final-->
											<xsl:if test="$Pesofinales!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Pesofinales"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura final-->
											<xsl:if test="$FacturaFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FacturaFinal"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Diferencia-->
											<xsl:if test="$Diferencia!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Diferencia</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Diferencia"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>
									
								</body>
								</table>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='0'  or //cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '0'">
								<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
									<body>
									   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
												<xsl:if test="pe:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe:Valor"/>
												</xsl:variable>
													<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>
												</xsl:for-each>
 <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
												<xsl:if test="pe1:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:variable>
	<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>

												</xsl:for-each>
                                            <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
												<xsl:if test="pe2:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:variable>
													<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>
											
											</xsl:for-each>
									<!-- Valores Fact y Bol -->
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='04'">
												<xsl:variable name="Piezas">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="PesoNeto">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Destino">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PaisDestino">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="FOB">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="flete">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="seguro">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="CondicionEntrega">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FechaEmbarque">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="PartidaArancelaria">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
											
											
											
											<!--Piezas/pieces-->
											<xsl:if test="$Piezas!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='11'">					
																<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Piezas"/>
													</font>
													</td>
											   </tr>



											</xsl:if>
											
											

	<!--Barras / Slaps -->

								<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">

											<xsl:if test="pe:Codigo='15'">	
											
													<xsl:if test="pe:Valor!='-'">	
											
																						
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>



													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='15'">	
														
														<xsl:value-of select="substring-before(pe:Valor,'*')"/>

														</xsl:if>
													</xsl:for-each>

													</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:   </strong>
													


													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='15'">	
														

															<xsl:variable name="restoBarras">
																<xsl:value-of select="substring-after(pe:Valor,'*')"/>
															</xsl:variable>
														
															<xsl:value-of select="substring-before($restoBarras,'*')"/>														

														</xsl:if>
													</xsl:for-each>



													</font>
													</td>
											   </tr>



																						
										</xsl:if>

											</xsl:if>

								</xsl:for-each>
											


											<!--Peso Neto/Net Weight-->
											<xsl:if test="$PesoNeto!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Neto/Net Weight</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PesoNeto"/>
													</font>
													</td>
											</tr>
											</xsl:if>
									</xsl:if>

									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='01'">
												<xsl:variable name="PesoBruto">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="Atados">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pedido">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="Cuota">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="Periodo">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
											<!--Peso Bruto/Gross Weight-->
											<xsl:if test="$PesoBruto!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Bruto/Gross Weight</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$PesoBruto"/>
														</font>
														</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Pedido/Order-->
											<xsl:if test="$Pedido!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Pedido/Order</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Pedido"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											<!--Cuota/Quote-->
											<xsl:if test="$Cuota!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Cuota/Quote</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Cuota"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											<!--Periodo Cotización-->
											<xsl:if test="$Periodo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Periodo Cotización/Q.P.</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Periodo"/>
														</font>
														</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='02'">
												<xsl:variable name="condicion">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="Origen">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="PaisOrigen">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>

											<!--CondiciÃ³n de entrega-->
											<xsl:if test="$condicion!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Condicion de entrega</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$condicion"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											
											<!--Origen/Origin-->
											<xsl:if test="$Origen!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Origen/Origin</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Origen"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											
											<!--País Origen/Origin Country-->
											<xsl:if test="$PaisOrigen!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>País Origen/Origin Country</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$PaisOrigen"/>
														</font>
														</td>
													</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='04'">
												<xsl:variable name="Piezas">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="PesoNeto">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Destino">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PaisDestino">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="FOB">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="flete">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="seguro">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="CondicionEntrega">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FechaEmbarque">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="PartidaArancelaria">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
											<!--Destino-->
											<xsl:if test="$Destino!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Destino</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Destino"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--País Destino-->
											<xsl:if test="$PaisDestino!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>País Destino/Destiny Country</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PaisDestino"/>
													</font>
													</td>
											</tr>
												<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Valor FOB-->
											<xsl:if test="$FOB!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Valor FOB</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FOB"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Flete-->
											<xsl:if test="$flete!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Flete</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$flete"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Seguro-->
											<xsl:if test="$seguro!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Seguro</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$seguro"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--condicion de entrega-->
											<xsl:if test="$CondicionEntrega!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Valor 
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='02'">
													<xsl:variable name="condicion">
														<xsl:value-of select="substring-before(pe:Valor,'*')"/>
													</xsl:variable>
													<xsl:variable name="resto11">
														<xsl:value-of select="substring-after(pe:Valor,'*')"/>
													</xsl:variable>
													<xsl:variable name="Origen">
														<xsl:value-of select="substring-before($resto11,'*')"/>
													</xsl:variable>
													<xsl:variable name="resto12">
														<xsl:value-of select="substring-after($resto11,'*')"/>
													</xsl:variable>
													<xsl:variable name="PaisOrigen">
														<xsl:value-of select="substring-before($resto12,'*')"/>
													</xsl:variable>
													<xsl:variable name="resto13">
														<xsl:value-of select="substring-after($resto12,'*')"/>
													</xsl:variable>

												<!--CondiciÃ³n de entrega-->
												<xsl:if test="$condicion!='-'">
													&#160;<xsl:value-of select="$condicion"/>
												</xsl:if>
										</xsl:if>
														</xsl:for-each>
													</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$CondicionEntrega"/>
													</font>
													</td>
													<tr><td><strong>&#160;</strong></td></tr>
												</tr>
											</xsl:if>
											<!--Fecha de Embarque-->
											<xsl:if test="$FechaEmbarque!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Fecha Est. Emb./Estimated Saling Date</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FechaEmbarque"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Partida Arancelaria-->
											<xsl:if test="$PartidaArancelaria!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Partida Arancelaria</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PartidaArancelaria"/>
													</font>
													</td>
												</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='05'">
												<xsl:variable name="formaPago">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="lugardespacho">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Sap">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
											<!--Forma de Pago-->
											<xsl:if test="$formaPago!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Forma de Pago/ Payment Terms</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														<xsl:value-of select="$formaPago"/>
														</font>
														</td>
													</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>						
							
									<!-- Valores NC y ND -->

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
											<xsl:if test="pe1:Codigo='10'">

												<xsl:variable name="Quota">
													<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="NOrden">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="OrdenVenta">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioProvisional">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesoprovisional">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaProvisional">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioFinal">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesofinales">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaFinal">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="Diferencia">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="Fechadereferecia">
													<xsl:value-of select="substring-before($resto10,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto11">
													<xsl:value-of select="substring-after($resto10,'*')"/>
												</xsl:variable>
											<!--Cuota-->
											<xsl:if test="$Quota!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Quota</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$Quota"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Nro Orden-->
											<xsl:if test="$NOrden!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >N° Orden</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$NOrden"/>
													</font>
													</td>
												</tr>
												<!--<tr><td><strong>&#160;</strong></td></tr>-->
											</xsl:if>
											<!--Nro Orden Vta-->
											<xsl:if test="$OrdenVenta!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >N° Orden de venta</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$OrdenVenta"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio Unitario Provisional-->
											<xsl:if test="$PreciounitarioProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Precio unitario Provisional</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$PreciounitarioProvisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso Provisional-->
											<xsl:if test="$Pesoprovisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Peso Provisional</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$Pesoprovisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura Provisional-->
											<xsl:if test="$FacturaProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Factura Provisional</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$FacturaProvisional"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio unitario Final-->
											<xsl:if test="$PreciounitarioFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Precio unitario Final</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$PreciounitarioFinal"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso final-->
											<xsl:if test="$Pesofinales!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Peso final</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$Pesofinales"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura final-->
											<xsl:if test="$FacturaFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Factura final</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$FacturaFinal"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Diferencia-->
											<xsl:if test="$Diferencia!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Diferencia</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$Diferencia"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
											<xsl:if test="pe2:Codigo='10'">

												<xsl:variable name="Quota">
													<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="NOrden">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="OrdenVenta">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioProvisional">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesoprovisional">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaProvisional">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioFinal">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesofinales">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaFinal">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="Diferencia">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="Fechadereferecia">
													<xsl:value-of select="substring-before($resto10,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto11">
													<xsl:value-of select="substring-after($resto10,'*')"/>
												</xsl:variable>
											<!--Cuota-->
											<xsl:if test="$Quota!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Quota</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$Quota"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Nro Orden-->
											<xsl:if test="$NOrden!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >N° Orden</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$NOrden"/>
													</font>
													</td>
												</tr>
												<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Nro Orden Vta-->
											<xsl:if test="$OrdenVenta!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >N° Orden de venta</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$OrdenVenta"/>
													</font>
													</td>
											</tr>
											<!--<tr><td><strong>&#160;</strong></td></tr>-->
											</xsl:if>
											<!--Precio Unitario Provisional-->
											<xsl:if test="$PreciounitarioProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Precio unitario Provisional</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$PreciounitarioProvisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso Provisional-->
											<xsl:if test="$Pesoprovisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Peso Provisional</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$Pesoprovisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura Provisional-->
											<xsl:if test="$FacturaProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Factura Provisional</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$FacturaProvisional"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio unitario Final-->
											<xsl:if test="$PreciounitarioFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Precio unitario Final</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$PreciounitarioFinal"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso final-->
											<xsl:if test="$Pesofinales!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Peso final</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$Pesofinales"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura final-->
											<xsl:if test="$FacturaFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Factura final</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$FacturaFinal"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Diferencia-->
											<xsl:if test="$Diferencia!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" >Diferencia</font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2">:
													&#160;<xsl:value-of select="$Diferencia"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>
								</body>
								</table>
							</xsl:when>
							
							<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='4'  or //cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '4'">
								<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
									<body>
									   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
												<xsl:if test="pe:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe:Valor"/>
												</xsl:variable>
													<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>
												</xsl:for-each>
 <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
												<xsl:if test="pe1:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:variable>
	<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>

												</xsl:for-each>
                                            <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
												<xsl:if test="pe2:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:variable>
													<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>
											
											</xsl:for-each>
									<!-- Valores Fact y Bol -->
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='04'">
												<xsl:variable name="Piezas">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="PesoNeto">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Destino">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PaisDestino">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="FOB">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="flete">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="seguro">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="CondicionEntrega">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FechaEmbarque">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="PartidaArancelaria">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
											<!--Piezas/pieces-->
											<xsl:if test="$Piezas!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='11'">					
																<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Piezas"/>
													</font>
													</td>
											   </tr>
											</xsl:if>
											<!--Peso Neto/Net Weight-->
											<xsl:if test="$PesoNeto!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Neto/Net Weight</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													<xsl:value-of select="$PesoNeto"/>
													</font>
													</td>
											</tr>
											</xsl:if>
									</xsl:if>

									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='01'">
												<xsl:variable name="PesoBruto">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="Atados">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pedido">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="Cuota">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="Periodo">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
											<!--Peso Bruto/Gross Weight-->
											<xsl:if test="$PesoBruto!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Bruto/Gross Weight</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$PesoBruto"/>
														</font>
														</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Pedido/Order-->
											<xsl:if test="$Pedido!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Pedido/Order</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Pedido"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											<!--Cuota/Quote-->
											<xsl:if test="$Cuota!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Cuota/Quote</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Cuota"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											<!--Periodo Cotización-->
											<xsl:if test="$Periodo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Periodo Cotización/Q.P.</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Periodo"/>
														</font>
														</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='02'">
												<xsl:variable name="condicion">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="Origen">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="PaisOrigen">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>

											<!--CondiciÃ³n de entrega-->
											<xsl:if test="$condicion!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Condicion de entrega</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$condicion"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											
											<!--Origen/Origin-->
											<xsl:if test="$Origen!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Origen/Origin</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Origen"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											
											<!--País Origen/Origin Country-->
											<xsl:if test="$PaisOrigen!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>País Origen/Origin Country</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$PaisOrigen"/>
														</font>
														</td>
													</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='04'">
												<xsl:variable name="Piezas">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="PesoNeto">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Destino">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PaisDestino">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="FOB">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="flete">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="seguro">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="CondicionEntrega">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FechaEmbarque">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="PartidaArancelaria">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
											<!--Destino-->
											<xsl:if test="$Destino!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Destino</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Destino"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--País Destino-->
											<xsl:if test="$PaisDestino!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>País Destino/Destiny Country</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PaisDestino"/>
													</font>
													</td>
											</tr>
												<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Valor FOB-->
											<xsl:if test="$FOB!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Valor FOB</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FOB"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Flete-->
											<xsl:if test="$flete!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Flete</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$flete"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Seguro-->
											<xsl:if test="$seguro!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Seguro</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$seguro"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--condicion de entrega-->
											<xsl:if test="$CondicionEntrega!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Valor 
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='02'">
													<xsl:variable name="condicion">
														<xsl:value-of select="substring-before(pe:Valor,'*')"/>
													</xsl:variable>
													<xsl:variable name="resto11">
														<xsl:value-of select="substring-after(pe:Valor,'*')"/>
													</xsl:variable>
													<xsl:variable name="Origen">
														<xsl:value-of select="substring-before($resto11,'*')"/>
													</xsl:variable>
													<xsl:variable name="resto12">
														<xsl:value-of select="substring-after($resto11,'*')"/>
													</xsl:variable>
													<xsl:variable name="PaisOrigen">
														<xsl:value-of select="substring-before($resto12,'*')"/>
													</xsl:variable>
													<xsl:variable name="resto13">
														<xsl:value-of select="substring-after($resto12,'*')"/>
													</xsl:variable>

												<!--CondiciÃ³n de entrega-->
												<xsl:if test="$condicion!='-'">
													&#160;<xsl:value-of select="$condicion"/>
												</xsl:if>
										</xsl:if>
														</xsl:for-each>
													</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$CondicionEntrega"/>
													</font>
													</td>
													<tr><td><strong>&#160;</strong></td></tr>
												</tr>
											</xsl:if>
											<!--Fecha de Embarque-->
											<xsl:if test="$FechaEmbarque!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Fecha Est. Emb./Estimated Saling Date</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FechaEmbarque"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Partida Arancelaria-->
											<xsl:if test="$PartidaArancelaria!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Partida Arancelaria</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PartidaArancelaria"/>
													</font>
													</td>
												</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='05'">
												<xsl:variable name="formaPago">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="lugardespacho">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Sap">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
											<!--Forma de Pago-->
											<xsl:if test="$formaPago!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Forma de Pago/ Payment Terms</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$formaPago"/>
														</font>
														</td>
													</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>						
							
									<!-- Valores NC y ND -->

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
											<xsl:if test="pe1:Codigo='10'">

												<xsl:variable name="Quota">
													<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="NOrden">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="OrdenVenta">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioProvisional">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesoprovisional">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaProvisional">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioFinal">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesofinales">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaFinal">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="Diferencia">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="Fechadereferecia">
													<xsl:value-of select="substring-before($resto10,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto11">
													<xsl:value-of select="substring-after($resto10,'*')"/>
												</xsl:variable>
											<!--Cuota-->
											<xsl:if test="$Quota!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Quota</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Quota"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Nro Orden-->
											<xsl:if test="$NOrden!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$NOrden"/>
													</font>
													</td>
												</tr>
												<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Nro Orden Vta-->
											<xsl:if test="$OrdenVenta!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N°Orden de venta</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$OrdenVenta"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio Unitario Provisional-->
											<xsl:if test="$PreciounitarioProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PreciounitarioProvisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso Provisional-->
											<xsl:if test="$Pesoprovisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Pesoprovisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura Provisional-->
											<xsl:if test="$FacturaProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FacturaProvisional"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio unitario Final-->
											<xsl:if test="$PreciounitarioFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PreciounitarioFinal"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso final-->
											<xsl:if test="$Pesofinales!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Pesofinales"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura final-->
											<xsl:if test="$FacturaFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FacturaFinal"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Diferencia-->
											<xsl:if test="$Diferencia!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Diferencia</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Diferencia"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
											<xsl:if test="pe2:Codigo='10'">

												<xsl:variable name="Quota">
													<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="NOrden">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="OrdenVenta">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioProvisional">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesoprovisional">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaProvisional">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioFinal">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesofinales">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaFinal">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="Diferencia">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="Fechadereferecia">
													<xsl:value-of select="substring-before($resto10,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto11">
													<xsl:value-of select="substring-after($resto10,'*')"/>
												</xsl:variable>
											<!--Cuota-->
											<xsl:if test="$Quota!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Quota</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Quota"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Nro Orden-->
											<xsl:if test="$NOrden!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$NOrden"/>
													</font>
													</td>
												</tr>
												<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Nro Orden Vta-->
											<xsl:if test="$OrdenVenta!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N°Orden de venta</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$OrdenVenta"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio Unitario Provisional-->
											<xsl:if test="$PreciounitarioProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PreciounitarioProvisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso Provisional-->
											<xsl:if test="$Pesoprovisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Pesoprovisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura Provisional-->
											<xsl:if test="$FacturaProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FacturaProvisional"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio unitario Final-->
											<xsl:if test="$PreciounitarioFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PreciounitarioFinal"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso final-->
											<xsl:if test="$Pesofinales!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Pesofinales"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura final-->
											<xsl:if test="$FacturaFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FacturaFinal"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Diferencia-->
											<xsl:if test="$Diferencia!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Diferencia</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Diferencia"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>
									
								</body>
								</table>
							</xsl:when>
							<xsl:when test="//cac:AccountingCustomerParty/cbc:AdditionalAccountID ='7'  or //cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = '7'">
								<table border="0" cellSpacing="0" borderColor="#000000" cellPadding="0" width="100%">
									<body>
									   <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
												<xsl:if test="pe:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe:Valor"/>
												</xsl:variable>
													<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>
												</xsl:for-each>
 <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
												<xsl:if test="pe1:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe1:Valor"/>
												</xsl:variable>
	<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>

												</xsl:for-each>
                                            <xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
												<xsl:if test="pe2:Codigo='17'">
												<xsl:variable name="motivo">
													<xsl:value-of select="pe2:Valor"/>
												</xsl:variable>
													<xsl:if test="$motivo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Motivo</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$motivo"/>
														</font>
														</td>
													</tr>
											</xsl:if>
												</xsl:if>
											
											</xsl:for-each>
									<!-- Valores Fact y Bol -->
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='04'">
												<xsl:variable name="Piezas">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="PesoNeto">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Destino">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PaisDestino">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="FOB">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="flete">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="seguro">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="CondicionEntrega">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FechaEmbarque">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="PartidaArancelaria">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
											<!--Piezas/pieces-->
											<xsl:if test="$Piezas!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>
													<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
														<xsl:if test="pe:Codigo='11'">					
																<xsl:value-of select="pe:Valor"/>
														</xsl:if>
													</xsl:for-each>
													</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Piezas"/>
													</font>
													</td>
											   </tr>
											</xsl:if>
											<!--Peso Neto/Net Weight-->
											<xsl:if test="$PesoNeto!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Neto/Net Weight</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PesoNeto"/>
													</font>
													</td>
											</tr>
											</xsl:if>
									</xsl:if>

									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='01'">
												<xsl:variable name="PesoBruto">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="Atados">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pedido">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="Cuota">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="Periodo">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
											<!--Peso Bruto/Gross Weight-->
											<xsl:if test="$PesoBruto!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Bruto/Gross Weight</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$PesoBruto"/>
														</font>
														</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Pedido/Order-->
											<xsl:if test="$Pedido!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Pedido/Order</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Pedido"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											<!--Cuota/Quote-->
											<xsl:if test="$Cuota!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Cuota/Quote</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Cuota"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											<!--Periodo Cotización-->
											<xsl:if test="$Periodo!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Periodo Cotización/Q.P.</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Periodo"/>
														</font>
														</td>
													</tr>
													<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='02'">
												<xsl:variable name="condicion">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="Origen">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="PaisOrigen">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>

											<!--CondiciÃ³n de entrega-->
											<xsl:if test="$condicion!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Condicion de entrega</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$condicion"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											
											<!--Origen/Origin-->
											<xsl:if test="$Origen!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Origen/Origin</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$Origen"/>
														</font>
														</td>
													</tr>
											</xsl:if>
											
											<!--País Origen/Origin Country-->
											<xsl:if test="$PaisOrigen!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>País Origen/Origin Country</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$PaisOrigen"/>
														</font>
														</td>
													</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='04'">
												<xsl:variable name="Piezas">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="PesoNeto">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Destino">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PaisDestino">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="FOB">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="flete">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="seguro">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="CondicionEntrega">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FechaEmbarque">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="PartidaArancelaria">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
											<!--Destino-->
											<xsl:if test="$Destino!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Destino</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Destino"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--País Destino-->
											<xsl:if test="$PaisDestino!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>País Destino/Destiny Country</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PaisDestino"/>
													</font>
													</td>
											</tr>
												<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Valor FOB-->
											<xsl:if test="$FOB!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Valor FOB</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FOB"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Flete-->
											<xsl:if test="$flete!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Flete</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$flete"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Seguro-->
											<xsl:if test="$seguro!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Seguro</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$seguro"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--condicion de entrega-->
											<xsl:if test="$CondicionEntrega!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Valor 
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
															<xsl:if test="pe:Codigo='02'">
													<xsl:variable name="condicion">
														<xsl:value-of select="substring-before(pe:Valor,'*')"/>
													</xsl:variable>
													<xsl:variable name="resto11">
														<xsl:value-of select="substring-after(pe:Valor,'*')"/>
													</xsl:variable>
													<xsl:variable name="Origen">
														<xsl:value-of select="substring-before($resto11,'*')"/>
													</xsl:variable>
													<xsl:variable name="resto12">
														<xsl:value-of select="substring-after($resto11,'*')"/>
													</xsl:variable>
													<xsl:variable name="PaisOrigen">
														<xsl:value-of select="substring-before($resto12,'*')"/>
													</xsl:variable>
													<xsl:variable name="resto13">
														<xsl:value-of select="substring-after($resto12,'*')"/>
													</xsl:variable>

												<!--CondiciÃ³n de entrega-->
												<xsl:if test="$condicion!='-'">
													&#160;<xsl:value-of select="$condicion"/>
												</xsl:if>
										</xsl:if>
														</xsl:for-each>
													</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$CondicionEntrega"/>
													</font>
													</td>
													<tr><td><strong>&#160;</strong></td></tr>
												</tr>
											</xsl:if>
											<!--Fecha de Embarque-->
											<xsl:if test="$FechaEmbarque!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Fecha Est. Emb./Estimated Saling Date</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FechaEmbarque"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Partida Arancelaria-->
											<xsl:if test="$PartidaArancelaria!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Partida Arancelaria</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PartidaArancelaria"/>
													</font>
													</td>
												</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
											<xsl:if test="pe:Codigo='05'">
												<xsl:variable name="formaPago">
													<xsl:value-of select="substring-before(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="lugardespacho">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="Sap">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
											<!--Forma de Pago-->
											<xsl:if test="$formaPago!='-'">
													<tr>
														<td width="15%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
														</td>
														<td width="25%">
														<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Forma de Pago/ Payment Terms</strong></font>
														</td>
														<td width="60%">
														<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
														&#160;<xsl:value-of select="$formaPago"/>
														</font>
														</td>
													</tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>						
							
									<!-- Valores NC y ND -->

									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
											<xsl:if test="pe1:Codigo='10'">

												<xsl:variable name="Quota">
													<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="NOrden">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="OrdenVenta">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioProvisional">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesoprovisional">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaProvisional">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioFinal">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesofinales">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaFinal">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="Diferencia">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="Fechadereferecia">
													<xsl:value-of select="substring-before($resto10,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto11">
													<xsl:value-of select="substring-after($resto10,'*')"/>
												</xsl:variable>
											<!--Cuota-->
											<xsl:if test="$Quota!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Quota</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Quota"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Nro Orden-->
											<xsl:if test="$NOrden!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$NOrden"/>
													</font>
													</td>
												</tr>
												<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Nro Orden Vta-->
											<xsl:if test="$OrdenVenta!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N°Orden de venta</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$OrdenVenta"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio Unitario Provisional-->
											<xsl:if test="$PreciounitarioProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PreciounitarioProvisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso Provisional-->
											<xsl:if test="$Pesoprovisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Pesoprovisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura Provisional-->
											<xsl:if test="$FacturaProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FacturaProvisional"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio unitario Final-->
											<xsl:if test="$PreciounitarioFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$PreciounitarioFinal"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso final-->
											<xsl:if test="$Pesofinales!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Pesofinales"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura final-->
											<xsl:if test="$FacturaFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FacturaFinal"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Diferencia-->
											<xsl:if test="$Diferencia!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Diferencia</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Diferencia"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
											<xsl:if test="pe2:Codigo='10'">

												<xsl:variable name="Quota">
													<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto1">
													<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
												</xsl:variable>
												<xsl:variable name="NOrden">
													<xsl:value-of select="substring-before($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto2">
													<xsl:value-of select="substring-after($resto1,'*')"/>
												</xsl:variable>
												<xsl:variable name="OrdenVenta">
													<xsl:value-of select="substring-before($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto3">
													<xsl:value-of select="substring-after($resto2,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioProvisional">
													<xsl:value-of select="substring-before($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto4">
													<xsl:value-of select="substring-after($resto3,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesoprovisional">
													<xsl:value-of select="substring-before($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto5">
													<xsl:value-of select="substring-after($resto4,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaProvisional">
													<xsl:value-of select="substring-before($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto6">
													<xsl:value-of select="substring-after($resto5,'*')"/>
												</xsl:variable>
												<xsl:variable name="PreciounitarioFinal">
													<xsl:value-of select="substring-before($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto7">
													<xsl:value-of select="substring-after($resto6,'*')"/>
												</xsl:variable>
												<xsl:variable name="Pesofinales">
													<xsl:value-of select="substring-before($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto8">
													<xsl:value-of select="substring-after($resto7,'*')"/>
												</xsl:variable>
												<xsl:variable name="FacturaFinal">
													<xsl:value-of select="substring-before($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto9">
													<xsl:value-of select="substring-after($resto8,'*')"/>
												</xsl:variable>
												<xsl:variable name="Diferencia">
													<xsl:value-of select="substring-before($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto10">
													<xsl:value-of select="substring-after($resto9,'*')"/>
												</xsl:variable>
												<xsl:variable name="Fechadereferecia">
													<xsl:value-of select="substring-before($resto10,'*')"/>
												</xsl:variable>
												<xsl:variable name="resto11">
													<xsl:value-of select="substring-after($resto10,'*')"/>
												</xsl:variable>
											<!--Cuota-->
											<xsl:if test="$Quota!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>&#160;</strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Quota</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$Quota"/>
													</font>
													</td>
												</tr>
											</xsl:if>
											<!--Nro Orden-->
											<xsl:if test="$NOrden!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N° Orden</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													<xsl:value-of select="$NOrden"/>
													</font>
													</td>
												</tr>
												<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Nro Orden Vta-->
											<xsl:if test="$OrdenVenta!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>N°Orden de venta</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													<xsl:value-of select="$OrdenVenta"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio Unitario Provisional-->
											<xsl:if test="$PreciounitarioProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													<xsl:value-of select="$PreciounitarioProvisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso Provisional-->
											<xsl:if test="$Pesoprovisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													<xsl:value-of select="$Pesoprovisional"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura Provisional-->
											<xsl:if test="$FacturaProvisional!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura Provisional</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													<xsl:value-of select="$FacturaProvisional"/>
													</font>
													</td>
											</tr>
											<tr><td><strong>&#160;</strong></td></tr>
											</xsl:if>
											<!--Precio unitario Final-->
											<xsl:if test="$PreciounitarioFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Precio unitario Final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													<xsl:value-of select="$PreciounitarioFinal"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Peso final-->
											<xsl:if test="$Pesofinales!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Peso final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													<xsl:value-of select="$Pesofinales"/>
													</font>
													</td>
											</tr>
											</xsl:if>
											<!--Factura final-->
											<xsl:if test="$FacturaFinal!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Factura final</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													&#160;<xsl:value-of select="$FacturaFinal"/>
													</font>
													</td>
											</tr>
											<tr><td><strong></strong></td></tr>
											</xsl:if>
											<!--Diferencia-->
											<xsl:if test="$Diferencia!='-'">
												<tr>
													<td width="15%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong></strong></font>
													</td>
													<td width="25%">
													<font face="Arial, Helvetica, sans-serif" size="2" ><strong>Diferencia</strong></font>
													</td>
													<td width="60%">
													<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
													<xsl:value-of select="$Diferencia"/>
													</font>
													</td>
											</tr>
											<tr><td><strong></strong></td></tr>
											</xsl:if>
									</xsl:if>
									</xsl:for-each>
									
								</body>
								</table>
							</xsl:when>
						</xsl:choose>
		            		
						</td>
						</tr>
						</body>
					</table>
					</td>
					</tr>
					<xsl:if test="//cac:LegalMonetaryTotal/cbc:PrepaidAmount!='0'">
					<tr>
						<td>
							<table border="2" cellspacing="0" cellpadding="2" width="100%" borderColor="#000000">
						<tbody>
						<tr>
						<td>
						<font face="Arial, Helvetica, sans-serif" size="2"><strong>DOCUMENTO(S) DE REFERENCIA</strong></font>
							<br/>
							<br/>
							<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="50%">
                              		<tbody>
                                 		<tr>
                                    		<td width="25%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="2">
                                          			<strong>Tipo de Documento</strong>
                                       			</font>
                                    		</td>
											<td width="25%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="2">
                                          			<strong>DescripciÃ³n</strong>
                                       			</font>
                                    		</td>
                                    		<td width="25%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="2">
                                          			<strong>Correlativo</strong>
                                       			</font>
                                    		</td>
											<td width="25%" align="center">
                                       			<font face="Arial, Helvetica, sans-serif" size="2">
                                          			<strong>Fecha</strong>
                                       			</font>
                                    		</td>
                              			</tr>
										
                                    	<xsl:variable name="i" select="1" />
										<xsl:for-each select="//cac:PrepaidPayment">
                                           			<tr>
														<td width="25%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="2">Â 
															<!--<xsl:for-each select="/pe:Invoice/cac:PrepaidPayment"> -->
	                                               				<xsl:choose>
	                                                  				<xsl:when test="cbc:ID/@schemeID='02'">FACTURA</xsl:when>
	                                                   				<xsl:when test="cbc:ID/@schemeID='03'">BOLETA</xsl:when>
	                                                   				<xsl:otherwise>Documento NN</xsl:otherwise>
	                                               				</xsl:choose>
																<!--</xsl:for-each>-->
	                                               			</font>
	                                           			</td>
	                                           			<td width="25%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="2">
	                                               				<!--<xsl:value-of select="cbc:ID"/>-->ANTICIPO RECIBIDO
	                                               			</font>
	                                           			</td>
														<td width="25%" align="center">
	                                              			<font face="Arial, Helvetica, sans-serif" size="2">
	                                               				<xsl:value-of select="cbc:ID"/>
	                                               			</font>
	                                           			</td>
														<td width="25%" align="center">
														<xsl:call-template name="Dato10">
												<xsl:with-param name="var" select="position()" />
											</xsl:call-template>
																
														</td>
													</tr>
													</xsl:for-each>
                                    		<!--</xsl:if>
                                    	</xsl:for-each>-->

                                    	<xsl:for-each select="//cac:BillingReference/cac:InvoiceDocumentReference">
                                    		<xsl:if test="cbc:DocumentTypeCode != '10'">
                                        		<tr>
                                           			<td width="30%" align="center">
                                              			<font face="Arial, Helvetica, sans-serif" size="2">                                                				<xsl:choose>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='01'">FACTURA</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='03'">BOLETA</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='07'">NOTA DE CREDITO</xsl:when>
		                                                    	<xsl:when test="cbc:DocumentTypeCode='08'">NOTA DE DEBITO</xsl:when>
		                                                    	<xsl:otherwise>Documento NN</xsl:otherwise>
		                                                 	</xsl:choose>
        		                                    	</font>
                		                			</td>
                                             		<td width="15%" align="center">
                                                		<font face="Arial, Helvetica, sans-serif" size="2">
                                                			<xsl:value-of select="cbc:ID"/>
                                                		</font>
                                             		</td>
                                          			<td align="center">
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">	
															<xsl:if test="pe1:Codigo='10'">

																<xsl:variable name="Quota">
																	<xsl:value-of select="substring-before(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe1:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="NOrden">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="OrdenVenta">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioProvisional">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesoprovisional">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaProvisional">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioFinal">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesofinales">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaFinal">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="Diferencia">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="Fechadereferecia">
																	<xsl:value-of select="substring-before($resto10,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto11">
																	<xsl:value-of select="substring-after($resto10,'*')"/>
																</xsl:variable>

																	<xsl:if test="$Fechadereferecia!='-'">
																			<font face="Arial, Helvetica, sans-serif" size="2">
																			<xsl:value-of select="$Fechadereferecia"/>
																			</font>
																	</xsl:if>
																</xsl:if>
																</xsl:for-each>
														<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">	
															<xsl:if test="pe2:Codigo='10'">

																<xsl:variable name="Quota">
																	<xsl:value-of select="substring-before(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto1">
																	<xsl:value-of select="substring-after(pe2:Valor,'*')"/>
																</xsl:variable>
																<xsl:variable name="NOrden">
																	<xsl:value-of select="substring-before($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto2">
																	<xsl:value-of select="substring-after($resto1,'*')"/>
																</xsl:variable>
																<xsl:variable name="OrdenVenta">
																	<xsl:value-of select="substring-before($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto3">
																	<xsl:value-of select="substring-after($resto2,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioProvisional">
																	<xsl:value-of select="substring-before($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto4">
																	<xsl:value-of select="substring-after($resto3,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesoprovisional">
																	<xsl:value-of select="substring-before($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto5">
																	<xsl:value-of select="substring-after($resto4,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaProvisional">
																	<xsl:value-of select="substring-before($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto6">
																	<xsl:value-of select="substring-after($resto5,'*')"/>
																</xsl:variable>
																<xsl:variable name="PreciounitarioFinal">
																	<xsl:value-of select="substring-before($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto7">
																	<xsl:value-of select="substring-after($resto6,'*')"/>
																</xsl:variable>
																<xsl:variable name="Pesofinales">
																	<xsl:value-of select="substring-before($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto8">
																	<xsl:value-of select="substring-after($resto7,'*')"/>
																</xsl:variable>
																<xsl:variable name="FacturaFinal">
																	<xsl:value-of select="substring-before($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto9">
																	<xsl:value-of select="substring-after($resto8,'*')"/>
																</xsl:variable>
																<xsl:variable name="Diferencia">
																	<xsl:value-of select="substring-before($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto10">
																	<xsl:value-of select="substring-after($resto9,'*')"/>
																</xsl:variable>
																<xsl:variable name="Fechadereferecia">
																	<xsl:value-of select="substring-before($resto10,'*')"/>
																</xsl:variable>
																<xsl:variable name="resto11">
																	<xsl:value-of select="substring-after($resto10,'*')"/>
																</xsl:variable>
																	<xsl:if test="$Fechadereferecia!='-'">
																			<font face="Arial, Helvetica, sans-serif" size="2"><strong>:</strong>
																			<xsl:value-of select="$Fechadereferecia"/>
																			</font>
																	</xsl:if>
																</xsl:if>
																</xsl:for-each>
													</td>
												</tr>
                                       		</xsl:if>
                                    	</xsl:for-each>
													
										
                              		</tbody>
                           			</table>
                        		
						</td>
						</tr>
						</tbody>
						</table>
						</td>
					</tr>
					</xsl:if>
					<tr>
						<td>
							<table cellSpacing="2" cellPadding="0" width="100%" align="center" border="0" heigth="100%">
								<tbody>
									<xsl:if test="/pe:Invoice">
									<tr>
										<td width="50%" align="left" colspan="2">	
										<xsl:call-template name="son-pesos"/>
										</td>
									</tr>
									</xsl:if>
									<tr>
														<td vAlign="top" width="68%" align="left">
															<xsl:call-template name="Referencia"/>
														</td>
														<td vAlign="top" width="32%">
															<xsl:call-template name="Total"/>
														</td>
													</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr width="100%">
						<td>
							<xsl:call-template name="bottom_hash"/>
						</td>
					</tr>
				</tbody>
			</table>
		</body>
	</html>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="fac274" userelativepaths="yes" externalpreview="yes" url="20261677955&#x2D;01&#x2D;FF01&#x2D;0013225.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="yes" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/xsl:call&#x2D;template" x="361" y="69"/><block path="html/body/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="401" y="69"/><block path="html/body/table/tbody/tr[2]/td/xsl:call&#x2D;template" x="321" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td/xsl:call&#x2D;template" x="241" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/xsl:call&#x2D;template" x="201" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td/xsl:call&#x2D;template" x="161" y="69"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if/=[0]" x="75" y="67"/><block path="html/body/table/tbody/tr[3]/td/table/tbody/tr[2]/td/xsl:if" x="121" y="69"/><block path="html/body/table/tbody/tr[4]/td/xsl:call&#x2D;template" x="281" y="69"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->