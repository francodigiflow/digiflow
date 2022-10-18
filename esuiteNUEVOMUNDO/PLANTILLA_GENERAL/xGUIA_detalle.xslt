<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:variable name="numitems">
		<xsl:value-of select="count(//cac:DespatchLine)"/>
	</xsl:variable>
	
	<xsl:template name="DetalleMultipagina">
		<xsl:param name="v_ItemPorPagina"/>
		<xsl:param name="v_Contador"/>
		<!-- nOR DE PAG -->

		<!--<xsl:call-template name="DetallesEncabezado">
			<xsl:with-param name="v_ItemPorPagina" select="$v_ItemPorPagina"/>
			<xsl:with-param name="v_Contador" select="$v_Contador"/>
		</xsl:call-template>-->


							
								<xsl:call-template name="DetallesEncabezado">
									<xsl:with-param name="v_ItemPorPagina" select="$v_ItemPorPagina1"/>
									<xsl:with-param name="v_Contador" select="$v_Contador"/>  <!--nRO DE PAG -->
								</xsl:call-template>
								

	</xsl:template>

	<xsl:template name="DetallesEncabezado">
		<xsl:param name="v_ItemPorPagina"/>
		<xsl:param name="v_Contador"/>
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr bgcolor="#DCDCDC">
				<td>
					<table width="100%" cellpadding="5" cellspacing="0" border="1" bordercolor="#FFFFFF" rules="cols" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
					<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">
						<tr bgcolor="#DCDCDC">
							<td width="8%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>N°</strong>
								</font>
							</td>
							<td width="12%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>ARTICULO</strong>
								</font>
							</td>
							<td width="42%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CALIDAD</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>PIEZAS</strong>
								</font>
							</td>
							<td width="8%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>UNID. MEDID.</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CANTIDAD</strong>
								</font>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
						<tr bgcolor="#DCDCDC">
							<td width="8%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>N°</strong>
								</font>
							</td>
							<td width="12%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>ARTICULO</strong>
								</font>
							</td>
							<td width="52%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>PIEZAS</strong>
								</font>
							</td>
							<td width="8%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>UNID. MEDID.</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CANTIDAD</strong>
								</font>
							</td>
						</tr>
					</xsl:if>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" cellpadding="4" cellspacing="0" border="1" bordercolor="#9BA0A6"  rules="cols" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
					<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">
						<!-- <xsl:if test="($numitems) &lt;'21'"> -->
						<xsl:for-each select="//cac:DespatchLine">
						<!--<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'14' ">-->
						<xsl:if test="$v_Contador = 1 and cbc:ID &gt; 0 and cbc:ID &lt;= 25">					
							<tr>
								<td valign="top" align="center" width="8%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td valign="top" align="center" width="12%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
							  <td valign="top" align="center" width="42%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<!-- <xsl:call-template name="RetourneValAdItem"> -->
											<!-- <xsl:with-param name="NumAd" select="01"/> -->
												<!-- <xsl:with-param name="NumLinea" select="cbc:ID"/> -->
										<!-- </xsl:call-template> -->
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
												<xsl:with-param name="NumAd" select="1"/>
											</xsl:call-template>
										</xsl:variable>

										<!-- <xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 !='-' "> -->
										<xsl:value-of select="$ValorAdicional1"/>
										<!-- </xsl:if> -->
										
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="2"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="8%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:DeliveredQuantity,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
						</xsl:if>
													
						<xsl:if test="$v_Contador=2 and cbc:ID &gt; 25 and cbc:ID &lt;= 60">
							<tr>
								<td valign="top" align="center" width="8%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td valign="top" align="center" width="12%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
							  <td valign="top" align="center" width="42%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="1"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="2"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="8%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:DeliveredQuantity,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$v_Contador=3 and cbc:ID &gt; 60 and cbc:ID &lt;= 95">
							<tr>
								<td valign="top" align="center" width="8%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td valign="top" align="center" width="12%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
							  <td valign="top" align="center" width="42%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="1"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="2"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="8%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:DeliveredQuantity,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
						</xsl:if>
						</xsl:for-each>
					</xsl:if>
					
					<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
						<!-- <xsl:if test="($numitems) &lt;'21'"> -->
						<xsl:for-each select="//cac:DespatchLine">
						<!--<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'14' ">-->
						<xsl:if test="$v_Contador = 1 and cbc:ID &gt; 0 and cbc:ID &lt;= 25">					
							<tr>
								<td valign="top" align="center" width="8%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td valign="top" align="center" width="12%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
							  <td valign="top" align="center" width="52%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="2"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="8%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:DeliveredQuantity,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
						</xsl:if>
										
						
						<xsl:if test="$v_Contador=2 and cbc:ID &gt; 25 and cbc:ID &lt;= 60">
							<tr>
								<td valign="top" align="center" width="8%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td valign="top" align="center" width="12%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
							  <td valign="top" align="center" width="52%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="2"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="8%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:DeliveredQuantity,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$v_Contador=3 and cbc:ID &gt; 60 and cbc:ID &lt;= 95">
							<tr>
								<td valign="top" align="center" width="8%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td valign="top" align="center" width="12%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
							  <td valign="top" align="center" width="52%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="2"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="8%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:DeliveredQuantity,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
						</xsl:if>
						</xsl:for-each>

					</xsl:if>
					
					</table>
				</td>
			</tr>
		</table>
	<!--</xsl:if>-->
		
	</xsl:template>
	

	<xsl:template name="DetallesEncabezado2">
	<xsl:if test="($numitems) &gt;'12'">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr bgcolor="#DCDCDC">
				<td>
					<table width="100%" cellpadding="5" cellspacing="0" border="0" bordercolor="#FFFFFF" rules="cols" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
					<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">
						<tr bgcolor="#DCDCDC">
							<td width="8%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>N°</strong>
								</font>
							</td>
							<td width="12%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>ARTICULO</strong>
								</font>
							</td>
							<td width="42%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CALIDAD</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>PIEZAS</strong>
								</font>
							</td>
							<td width="8%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>UNID. MEDID.</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CANTIDAD</strong>
								</font>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
						<tr bgcolor="#DCDCDC">
							<td width="8%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>N°</strong>
								</font>
							</td>
							<td width="12%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>ARTICULO</strong>
								</font>
							</td>
							<td width="52%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>PIEZAS</strong>
								</font>
							</td>
							<td width="8%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>UNID. MEDID.</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CANTIDAD</strong>
								</font>
							</td>
						</tr>
					</xsl:if>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" cellpadding="4" cellspacing="0" border="1" bordercolor="#9BA0A6"  rules="cols" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
						<!-- <xsl:if test="($numitems) &lt;'65'"> -->
						<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">
							<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;'25' and cbc:ID &lt;'60' ">	
							<tr>
								<td valign="top" align="center" width="8%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td valign="top" align="center" width="12%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
							  <td valign="top" align="center" width="42%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="1"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="2"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="8%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:DeliveredQuantity,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
						
							</xsl:if>						
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
							<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;'25' and cbc:ID &lt;'60' ">	
							<tr>
								<td valign="top" align="center" width="8%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td valign="top" align="center" width="12%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
							  <td valign="top" align="center" width="52%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="2"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="8%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:DeliveredQuantity,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
						
							</xsl:if>						
							</xsl:for-each>
						</xsl:if>
 						 <xsl:call-template name="lineaBl"> 
							 <xsl:with-param name="cont" select="40 - ($numitems)"/>							 
						 </xsl:call-template>						
					</table>
				</td>
			</tr>
		</table>
	</xsl:if>
	</xsl:template>

	<xsl:template name="DetallesEncabezado3">
	<xsl:if test="($numitems) &gt;'38'">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr bgcolor="#DCDCDC">
				<td>
					<table width="100%" cellpadding="5" cellspacing="0" border="0" bordercolor="#FFFFFF" rules="cols" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
					<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">
						<tr bgcolor="#DCDCDC">
							<td width="8%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>N°</strong>
								</font>
							</td>
							<td width="12%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>ARTICULO</strong>
								</font>
							</td>
							<td width="42%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CALIDAD</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>PIEZAS</strong>
								</font>
							</td>
							<td width="8%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>UNID. MEDID.</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CANTIDAD</strong>
								</font>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
						<tr bgcolor="#DCDCDC">
							<td width="8%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>N°</strong>
								</font>
							</td>
							<td width="12%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>ARTICULO</strong>
								</font>
							</td>
							<td width="52%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>DESCRIPCIÓN</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>PIEZAS</strong>
								</font>
							</td>
							<td width="8%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>UNID. MEDID.</strong>
								</font>
							</td>
							<td width="10%" align="center" style="color:BLACK">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CANTIDAD</strong>
								</font>
							</td>
						</tr>
					</xsl:if>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" cellpadding="4" cellspacing="0" border="1" bordercolor="#9BA0A6"  rules="cols" style="font-family :Arial,Helvetica,sans-serif;font-size:12px;color:#000000">
					<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">
					<xsl:for-each select="//cac:DespatchLine">
					<xsl:if test="cbc:ID &gt;'60' and cbc:ID &lt;'100' ">	
							<tr>
								<td valign="top" align="center" width="8%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td valign="top" align="center" width="10%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
							  <td valign="top" align="center" width="52%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="1"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="2"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="8%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:DeliveredQuantity,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
					</xsl:if>
					</xsl:for-each>
					</xsl:if>
					<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
					<xsl:for-each select="//cac:DespatchLine">
					<xsl:if test="cbc:ID &gt;'60' and cbc:ID &lt;'100' ">	
							<tr>
								<td valign="top" align="center" width="8%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:ID"/>
									</font>
								</td>
								<td valign="top" align="center" width="10%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
							  <td valign="top" align="center" width="62%">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="10%" align="left">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="RetourneValAdItem">
											<xsl:with-param name="NumAd" select="2"/>
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
										</xsl:call-template>
									</font>
								</td>
								<td width="8%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:call-template name="unidad_medida"/>
									</font>
								</td>
								<td width="10%" align="center" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="format-number(cbc:DeliveredQuantity,'###,###,##0.00','pen')"/>
									</font>
								</td>
							</tr>
						
					</xsl:if>
					</xsl:for-each>
					</xsl:if>
					</table>
				</td>
			</tr>
		</table>
	</xsl:if>
	</xsl:template>


	<xsl:template name="unidad_medida">
		<xsl:choose>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='PL'">BAL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='D64'">BLK</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='BG'">BOL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='BX'">CAJ</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='CY'">CIL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='CLT'">CL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='CMT'">CM</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='CJ'">CON</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='DLT'">DL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='GRM'">GR</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='HUR'">HRA</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='KT'">JGO</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='KWT'">KW</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='MIL'">MIL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='D61'">MIN</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='MMT'">MM</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='NPR'">PAR</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='FTK'">PI2</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='FTQ'">PI3</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='PA'">PQT</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='INH'">PUL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='NRL'">ROL</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='TNE'">TON</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:DeliveredQuantity/@unitCode='SA'">SAC</xsl:when>		
			<xsl:otherwise>UNI
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="TipoDeMoneda_Total">
		<xsl:choose>
			<xsl:when test="//sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/@currencyID='PEN'">S/</xsl:when>
			<xsl:when test="//sac:SUNATRetentionDocumentReference/cbc:TotalInvoiceAmount/@currencyID='USD'">USD</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe1:CreditNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='PEN'">S/</xsl:when>
			<xsl:when test="/pe2:DebitNote/cbc:DocumentCurrencyCode='USD'">USD</xsl:when>
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="RetourneValAd">
		<xsl:param name="NumAd"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
			<xsl:if test="pe:Codigo=$NumAd">
				<xsl:if test="pe:Valor!='-'">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="RetourneValAdItem">
		<xsl:param name="NumLinea"/>
		<xsl:param name="NumAd"/>

		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<!-- <xsl:if test="pe:Codigo = $NumAd"> -->
			<xsl:if test="pe:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

		
	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr>
				<td valign="top" align="center" width="100%">
							<font face="Arial, Helvetica, sans-serif" size="1">&#160;
							</font>
						</td>
				<!-- <td width="10%" align="center" style="color:BLACK"> -->
				<!-- </td> -->
				<!-- <td width="12%" align="center" style="color:BLACK"> -->
				<!-- </td> -->
				<!-- <td width="30%" align="center" style="color:BLACK"> -->
				<!-- </td> -->
				<!-- <td width="30%" align="center" style="color:BLACK"> -->
				<!-- </td> -->
				<!-- <td width="8%" align="center" style="color:BLACK"> -->
				<!-- </td> -->
				<!-- <td width="10%" align="center" style="color:BLACK"> -->
				<!-- </td> -->
			</tr>
			<!-- Mostrar detalle - Completando -->
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 2"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>


</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="..\20513081236_2018111209T00100000005.xml" srcSchemaRoot="DespatchAdvice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="DetallesEncabezado"></template><template name="RetourneValAdItem"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->