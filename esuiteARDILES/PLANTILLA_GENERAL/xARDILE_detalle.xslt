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

	<xsl:template name="DetallesEncabezado">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr bgcolor="silver">
							<td width="3%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>N°</strong>
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Artículo</strong>
								</font>
							</td>
							<td width="39%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Descripción</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Cantidad</strong>
								</font>
							</td>
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Unid.</strong>
								</font>
							</td>
							<!--<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>VALOR UNITARIO</strong>
								</font>
							</td>-->
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Prec. Unit.</strong>
								</font>	
							</td>
							<!--bruto-->
							
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Bruto</strong>
									</font>	
								</td>
									
							<!--dscto-->
							
								<td width="4%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<strong>Dcto.(%)</strong>
									</font>	
								</td>
									
							<!--total de descuento-->
							
							<td width="4%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Dcto. <xsl:call-template name="TipoDeMoneda_Total" /></strong>
								</font>	
							</td>
									
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Importe</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>Prec.Unit.</strong>
									<br/><strong>(Inc IGV)</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
						<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
							<xsl:variable name="Descuento">
								<xsl:value-of select="0"/>
								<xsl:if test="cac:AllowanceCharge/cbc:Amount">
									<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
								</xsl:if>
							</xsl:variable>
							<tr>
								<td width="3%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>-->
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td width="6%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<td width="39%">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cbc:Description"/>
											<!--ITERACION-->
											<xsl:if test="cbc:ID='1'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
										<xsl:if test="pe:Codigo='25'">
											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto5">
												<xsl:value-of select="substring-after($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea6">
												<xsl:value-of select="substring-before($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto6">
												<xsl:value-of select="substring-after($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea7">
												<xsl:value-of select="substring-before($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto7">
												<xsl:value-of select="substring-after($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea8">
												<xsl:value-of select="substring-before($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto8">
												<xsl:value-of select="substring-after($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea9">
												<xsl:value-of select="substring-before($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto9">
												<xsl:value-of select="substring-after($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea10">
												<xsl:value-of select="substring-before($resto9,'|')"/>
											</xsl:variable>
									
											<br/>
												<xsl:value-of select="$linea1"/>
							
										</xsl:if>

	
								</xsl:for-each>		
						
											</xsl:if> <!-- FIN JPG-->
											<!--JPG-->
											<xsl:if test="cbc:ID='2'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
										<xsl:if test="pe:Codigo='25'">
											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto5">
												<xsl:value-of select="substring-after($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea6">
												<xsl:value-of select="substring-before($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto6">
												<xsl:value-of select="substring-after($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea7">
												<xsl:value-of select="substring-before($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto7">
												<xsl:value-of select="substring-after($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea8">
												<xsl:value-of select="substring-before($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto8">
												<xsl:value-of select="substring-after($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea9">
												<xsl:value-of select="substring-before($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto9">
												<xsl:value-of select="substring-after($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea10">
												<xsl:value-of select="substring-before($resto9,'|')"/>
											</xsl:variable>
									
											<br/>
												<xsl:value-of select="$linea2"/>
							
										</xsl:if>

	
								</xsl:for-each>		
						
											</xsl:if> <!-- FIN JPG-->
											
											<xsl:if test="cbc:ID='3'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
										<xsl:if test="pe:Codigo='25'">
											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto5">
												<xsl:value-of select="substring-after($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea6">
												<xsl:value-of select="substring-before($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto6">
												<xsl:value-of select="substring-after($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea7">
												<xsl:value-of select="substring-before($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto7">
												<xsl:value-of select="substring-after($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea8">
												<xsl:value-of select="substring-before($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto8">
												<xsl:value-of select="substring-after($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea9">
												<xsl:value-of select="substring-before($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto9">
												<xsl:value-of select="substring-after($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea10">
												<xsl:value-of select="substring-before($resto9,'|')"/>
											</xsl:variable>
									
											<br/>
												<xsl:value-of select="$linea3"/>
							
										</xsl:if>

	
								</xsl:for-each>		
						
											</xsl:if> <!-- FIN JPG-->
											<xsl:if test="cbc:ID='4'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
										<xsl:if test="pe:Codigo='25'">
											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto5">
												<xsl:value-of select="substring-after($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea6">
												<xsl:value-of select="substring-before($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto6">
												<xsl:value-of select="substring-after($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea7">
												<xsl:value-of select="substring-before($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto7">
												<xsl:value-of select="substring-after($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea8">
												<xsl:value-of select="substring-before($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto8">
												<xsl:value-of select="substring-after($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea9">
												<xsl:value-of select="substring-before($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto9">
												<xsl:value-of select="substring-after($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea10">
												<xsl:value-of select="substring-before($resto9,'|')"/>
											</xsl:variable>
									
											<br/>
												<xsl:value-of select="$linea4"/>
							
										</xsl:if>

	
								</xsl:for-each>		
						
											</xsl:if> <!-- FIN JPG-->
											<xsl:if test="cbc:ID='5'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
										<xsl:if test="pe:Codigo='25'">
											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto5">
												<xsl:value-of select="substring-after($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea6">
												<xsl:value-of select="substring-before($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto6">
												<xsl:value-of select="substring-after($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea7">
												<xsl:value-of select="substring-before($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto7">
												<xsl:value-of select="substring-after($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea8">
												<xsl:value-of select="substring-before($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto8">
												<xsl:value-of select="substring-after($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea9">
												<xsl:value-of select="substring-before($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto9">
												<xsl:value-of select="substring-after($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea10">
												<xsl:value-of select="substring-before($resto9,'|')"/>
											</xsl:variable>
									
											<br/>
												<xsl:value-of select="$linea5"/>
							
										</xsl:if>

	
								</xsl:for-each>		
						
											</xsl:if> <!-- FIN JPG-->
											<xsl:if test="cbc:ID='6'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
										<xsl:if test="pe:Codigo='25'">
											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto5">
												<xsl:value-of select="substring-after($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea6">
												<xsl:value-of select="substring-before($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto6">
												<xsl:value-of select="substring-after($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea7">
												<xsl:value-of select="substring-before($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto7">
												<xsl:value-of select="substring-after($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea8">
												<xsl:value-of select="substring-before($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto8">
												<xsl:value-of select="substring-after($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea9">
												<xsl:value-of select="substring-before($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto9">
												<xsl:value-of select="substring-after($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea10">
												<xsl:value-of select="substring-before($resto9,'|')"/>
											</xsl:variable>
									
											<br/>
												<xsl:value-of select="$linea6"/>
							
										</xsl:if>

	
								</xsl:for-each>		
						
											</xsl:if> <!-- FIN JPG-->
											<xsl:if test="cbc:ID='7'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
										<xsl:if test="pe:Codigo='25'">
											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto5">
												<xsl:value-of select="substring-after($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea6">
												<xsl:value-of select="substring-before($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto6">
												<xsl:value-of select="substring-after($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea7">
												<xsl:value-of select="substring-before($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto7">
												<xsl:value-of select="substring-after($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea8">
												<xsl:value-of select="substring-before($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto8">
												<xsl:value-of select="substring-after($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea9">
												<xsl:value-of select="substring-before($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto9">
												<xsl:value-of select="substring-after($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea10">
												<xsl:value-of select="substring-before($resto9,'|')"/>
											</xsl:variable>
									
											<br/>
												<xsl:value-of select="$linea7"/>
							
										</xsl:if>

	
								</xsl:for-each>		
						
											</xsl:if> <!-- FIN JPG-->
											<xsl:if test="cbc:ID='8'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
										<xsl:if test="pe:Codigo='25'">
											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto5">
												<xsl:value-of select="substring-after($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea6">
												<xsl:value-of select="substring-before($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto6">
												<xsl:value-of select="substring-after($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea7">
												<xsl:value-of select="substring-before($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto7">
												<xsl:value-of select="substring-after($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea8">
												<xsl:value-of select="substring-before($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto8">
												<xsl:value-of select="substring-after($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea9">
												<xsl:value-of select="substring-before($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto9">
												<xsl:value-of select="substring-after($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea10">
												<xsl:value-of select="substring-before($resto9,'|')"/>
											</xsl:variable>
									
											<br/>
												<xsl:value-of select="$linea8"/>
							
										</xsl:if>

	
								</xsl:for-each>		
						
											</xsl:if> <!-- FIN JPG-->
											<xsl:if test="cbc:ID='9'">
											<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">	
										<xsl:if test="pe:Codigo='25'">
											<xsl:variable name="linea1">
												<xsl:value-of select="substring-before(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto1">
												<xsl:value-of select="substring-after(pe:Valor,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea2">
												<xsl:value-of select="substring-before($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto2">
												<xsl:value-of select="substring-after($resto1,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea3">
												<xsl:value-of select="substring-before($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto3">
												<xsl:value-of select="substring-after($resto2,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea4">
												<xsl:value-of select="substring-before($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto4">
												<xsl:value-of select="substring-after($resto3,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea5">
												<xsl:value-of select="substring-before($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto5">
												<xsl:value-of select="substring-after($resto4,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea6">
												<xsl:value-of select="substring-before($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto6">
												<xsl:value-of select="substring-after($resto5,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea7">
												<xsl:value-of select="substring-before($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto7">
												<xsl:value-of select="substring-after($resto6,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea8">
												<xsl:value-of select="substring-before($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto8">
												<xsl:value-of select="substring-after($resto7,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea9">
												<xsl:value-of select="substring-before($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="resto9">
												<xsl:value-of select="substring-after($resto8,'|')"/>
											</xsl:variable>
											<xsl:variable name="linea10">
												<xsl:value-of select="substring-before($resto9,'|')"/>
											</xsl:variable>
									
											<br/>
												<xsl:value-of select="$linea9"/>
							
										</xsl:if>

	
								</xsl:for-each>		
						
											</xsl:if> <!-- FIN JPG-->
											
											<!--FIN ITERACION DESCRIPCION-->
									</font>
								</td>
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:InvoicedQuantity,'########0.00', 'pen')"/>
									</font>
								</td>
								<td width="4%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount, '###,###,##0.00', 'pen')" />&#160; 
									</font>
								</td>
								
								<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:variable name="montobruto">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:BaseAmount">
										<xsl:value-of select="cac:AllowanceCharge/cbc:BaseAmount"/>
									</xsl:if>
								</xsl:variable>
								<xsl:value-of select="format-number($montobruto,'###,###,##0.00','pen')"/>
								
							
									</font>
								</td>
								<td width="4%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
									<xsl:variable name="descuento2">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
										<xsl:value-of select="cac:AllowanceCharge/cbc:MultiplierFactorNumeric"/>
									</xsl:if>
								</xsl:variable>
								<xsl:value-of select="format-number($descuento2*100,'###,###,##0.00','pen')"/>
									</font>
								</td>
								
								<!-- total descuento -->
								
								<td width ="4%" align="right">
											<font face="Arial, Helvetica, sans-serif" size="1">
		                     				<xsl:value-of select="format-number($Descuento,'###,###,##0.00','pen')"/>
		                               		 </font>
										</td>
										
								<!-- fin descuento-->
								<td width ="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
								<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">
											<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!= '0'">
												<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount!= '0.00'">
			                                  		<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00', 'pen')" />
			                                	</xsl:if>
											</xsl:if>
											<xsl:if test="//cac:LegalMonetaryTotal/cbc:PayableAmount = '0.00'">
		                                        <xsl:for-each select="cac:PricingReference/cac:AlternativeConditionPrice">
													<xsl:if test="cbc:PriceTypeCode = '02'">
		                                                <xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00', 'pen')" />
		                                            </xsl:if>
		                                        </xsl:for-each>
											</xsl:if>
		                        		</xsl:if>
										<xsl:if test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">
											<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount!= '0'">
												<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')" />
		                        			</xsl:if>
											<xsl:if test="//cac:TaxSubtotal/cbc:TaxAmount = '0'">
												<xsl:for-each select=" cac:PricingReference/cac:AlternativeConditionPrice">
		                                   			<xsl:if test=" cbc:PriceTypeCode= '02'">
		                                            	<xsl:value-of select="format-number(cbc:PriceAmount,'###,###,##0.00','pen')" />
		                                    		</xsl:if>
		                                		</xsl:for-each>
											</xsl:if>
										</xsl:if>
	                                </font>
									</td>
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
							<xsl:variable name="Descuento1">
								<xsl:value-of select="0"/>
								<xsl:if test="cac:AllowanceCharge/cbc:Amount">
									<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
								</xsl:if>
							</xsl:variable>
							<tr>
								<td width="3%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>-->
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td width="6%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<td width="35%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1"> 
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="cbc:CreditedQuantity"/>-->
										<xsl:value-of select="format-number(cbc:CreditedQuantity,'########0.00', 'pen')"/>
									</font>
								</td>
								<td width="4%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
								<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
									</font>
								</td>-->
								<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
								<!--precio unit-->
								<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')" />
									</font>
								</td>
							</tr>
						</xsl:for-each>

						<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
							<xsl:variable name="Descuento1">
								<xsl:value-of select="0"/>
								<xsl:if test="cac:AllowanceCharge/cbc:Amount">
									<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
								</xsl:if>
							</xsl:variable>

							<tr>
								<td width="3%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<!--<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>-->
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td width="6%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<td width="35%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="1"> 
										<xsl:value-of select="cac:Item/cbc:Description"/>
									</font>
								</td>
								<td width="8%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:DebitedQuantity,'########0.00', 'pen')"/>

									</font>
								</td>
								<td width="4%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
								<!--<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.0000','pen')"/>
									</font>
								</td>-->
								<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
								<td width="8%" align="right">
									<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
						</xsl:for-each>

						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
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
				<td width="3%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="6%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="39%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>

				<td width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>

				<td width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>

				<td width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>

				<td width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="lineaB2">
		<xsl:param name="cont"/>
		<xsl:if test="$cont>0">
			<tr>
				<td width="3%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="6%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="39%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
				<td width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="1"> </font>
				</td>
			</tr>
			<xsl:call-template name="lineaB2">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="unidad_medida">
		<xsl:if test="/pe:Invoice">
			<xsl:choose>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PL'">BAL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='D64'">BLK</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='BG'">BOL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='BO'">BOT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='BX'">CAJ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='CY'">CJA</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='CLT'">CL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='CMT'">MT2</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='CJ'">CON</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='DLT'">DL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL'">UGL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='KT'">EQP</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM'">KG</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='KWT'">KW</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR'">LB</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR'">LTS</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTR'">MT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK'">M2</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTQ'">M3</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='MIL'">MIL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='D61'">MIN</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='MLT'">ML</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='MMT'">MM</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PA'">PQT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='INH'">PUL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='NRL'">ROL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE'">TM</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='NIU'">UND</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='SA'">SAC</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PQ'">PAQ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='BLL'">BB6</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='BLD'">BBL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='GN'">GG6</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='D92'">BAN</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='DR'">BID</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PK'">BLT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='BB'">CJT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='CMQ'">CM3</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='CEN'">CTO</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='DPR'">D/P</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='DZN'">DOC</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='DS'">DSP</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='CS'">EST</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='JR'">FCO</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='WG'">GLN</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='GN'">GN</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='SET'">JGO</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='KIT'">KIT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='JR'">LAT</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='SW'">MDJ</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='57'">MLL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PR'">PAR</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PG'">PCH</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='QTR'">QTO</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='RO'">RLL</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='SCR'">SCR</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='TU'">TBO</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
			<xsl:choose>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='PL'">BAL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='D64'">BLK</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='BG'">BOL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='BO'">BOT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='BX'">CAJ</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='CY'">CJA</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='CLT'">CL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='CMT'">MT2</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='CJ'">CON</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='DLT'">DL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='GLL'">UGL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='KT'">EQP</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='KGM'">KG</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='KWT'">KW</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='LBR'">LB</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='LTR'">LTS</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='MTR'">MT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='MTK'">M2</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='MTQ'">M3</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='MIL'">MIL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='D61'">MIN</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='MLT'">ML</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='MMT'">MM</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='PA'">PQT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='INH'">PUL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='NRL'">ROL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='TNE'">TM</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='NIU'">UND</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='SA'">SAC</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='PQ'">PAQ</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='BLL'">BB6</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='BLD'">BBL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='GN'">GG6</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='D92'">BAN</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='DR'">BID</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='PK'">BLT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='BB'">CJT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='CMQ'">CM3</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='CEN'">CTO</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='DPR'">D/P</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='DZN'">DOC</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='DS'">DSP</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='CS'">EST</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='JR'">FCO</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='WG'">GLN</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='GN'">GN</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='SET'">JGO</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='KIT'">KIT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='JR'">LAT</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='SW'">MDJ</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='57'">MLL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='PR'">PAR</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='PG'">PCH</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='QTR'">QTO</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='RO'">RLL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='SCR'">SCR</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='TU'">TBO</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
			<xsl:choose>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='PL'">BAL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='PL'">BAL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='D64'">BLK</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='BG'">BOL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='BO'">BOT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='BX'">CAJ</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='CY'">CJA</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='CLT'">CL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='CMT'">MT2</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='CJ'">CON</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='DLT'">DL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='GLL'">UGL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='KT'">EQP</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='KGM'">KG</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='KWT'">KW</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='LBR'">LB</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='LTR'">LTS</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='MTR'">MT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='MTK'">M2</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='MTQ'">M3</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='MIL'">MIL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='D61'">MIN</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='MLT'">ML</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='MMT'">MM</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='PA'">PQT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='INH'">PUL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='NRL'">ROL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='TNE'">TM</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='NIU'">UND</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='SA'">SAC</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='PQ'">PAQ</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='BLL'">BB6</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='BLD'">BBL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='GN'">GG6</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='D92'">BAN</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='DR'">BID</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='PK'">BLT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='BB'">CJT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='CMQ'">CM3</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='CEN'">CTO</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='DPR'">D/P</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='DZN'">DOC</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='DS'">DSP</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='CS'">EST</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='JR'">FCO</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='WG'">GLN</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='GN'">GN</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='SET'">JGO</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='KIT'">KIT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='JR'">LAT</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='SW'">MDJ</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='57'">MLL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='PR'">PAR</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='PG'">PCH</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='QTR'">QTO</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='RO'">RLL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='SCR'">SCR</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='TU'">TBO</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!--<xsl:template name="TipoDeMoneda_Total">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/ </xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->

<xsl:template name="simbolo">
		<xsl:if test="/pe:Invoice">
			<xsl:choose>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='PL'">S/</xsl:when>
				<xsl:when test="cbc:InvoicedQuantity/@unitCode='D64'">$/</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
			<xsl:choose>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='PL'">BAL</xsl:when>
				<xsl:when test="cbc:CreditedQuantity/@unitCode='D64'">BLK</xsl:when>
				
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
			<xsl:choose>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='PL'">BAL</xsl:when>
				<xsl:when test="cbc:DebitedQuantity/@unitCode='D64'">BLK</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->