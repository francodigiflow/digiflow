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
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CÓDIGO</strong>
								</font>
							</td>
							<td width="64%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>UND</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="2">
									<strong>PESO</strong>
								</font>
							</td>
							<!-- <td width="8%" align="center"> -->
								<!-- <font face="Arial, Helvetica, sans-serif" size="1"> -->
									<!-- <strong>LOTE</strong> -->
								<!-- </font> -->
							<!-- </td> -->
							
							
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<!-- <xsl:if test="($numitems) &lt;'21'"> -->
						<xsl:for-each select="//cac:DespatchLine">
						<!--<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'14' ">-->
						<xsl:if test="$v_Contador = 1 and cbc:ID &gt; 0 and cbc:ID &lt;= 11">					
							<tr>
							   
								<td width="10%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<td width="64%" align="left" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="12%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:DeliveredQuantity"/>
									</font>
								</td>
								<td width="6%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:DeliveredQuantity/@unitCode"/>
									</font>
								</td>
								<td width="8%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
												<xsl:with-param name="NumAd" select="1"/>
											</xsl:call-template>
										</xsl:variable>

										<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 !='-' ">
										<xsl:value-of select="format-number($ValorAdicional1,'###,###,##0.000','pen')"/>
										</xsl:if>
									</font>
								</td>
								
								<!-- <td width="7%" align="center" class="td_detalle"> -->
								
										<!-- <xsl:variable name="ValorAdicional2"> -->
											<!-- <xsl:call-template name="RetourneValAdItem"> -->
												<!-- <xsl:with-param name="NumLinea" select="cbc:ID"/> -->
												<!-- <xsl:with-param name="NumAd" select="2"/> -->
											<!-- </xsl:call-template> -->
										<!-- </xsl:variable> -->

										<!-- <xsl:if test="$ValorAdicional2 != '' and $ValorAdicional2 !='-' "> -->
										<!-- <xsl:value-of select="format-number($ValorAdicional2,'###,###,##0.000','pen')"/> -->
										<!-- </xsl:if> -->
									
								<!-- </td> -->
							</tr>
						</xsl:if>
										
						
						<xsl:if test="$v_Contador=2 and cbc:ID &gt; 11 and cbc:ID &lt;= 51">
							<tr>
							    <td width="10%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<td width="64%" align="left" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="12%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:DeliveredQuantity"/>
									</font>
								</td>
								<td width="6%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:DeliveredQuantity/@unitCode"/>
									</font>
								</td>
								<td width="8%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
												<xsl:with-param name="NumAd" select="1"/>
											</xsl:call-template>
										</xsl:variable>

										<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 !='-' ">
											<xsl:value-of select="format-number($ValorAdicional1,'###,###,##0.000','pen')"/>
										</xsl:if>
									</font>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$v_Contador=3 and cbc:ID &gt; 51 and cbc:ID &lt;= 91">
							<tr>
							   <td width="10%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<td width="64%" align="left" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="12%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:DeliveredQuantity"/>
									</font>
								</td>
								<td width="6%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:DeliveredQuantity/@unitCode"/>
									</font>
								</td>
								<td width="8%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
												<xsl:with-param name="NumAd" select="1"/>
											</xsl:call-template>
										</xsl:variable>

										<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 !='-' ">
										<xsl:value-of select="format-number($ValorAdicional1,'###,###,##0.000','pen')"/>
										</xsl:if>
									</font>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$v_Contador=4 and cbc:ID &gt; 91 and cbc:ID &lt;= 131">
							<tr>
							   <td width="10%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<td width="64%" align="left" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="12%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:DeliveredQuantity"/>
									</font>
								</td>
								<td width="6%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:DeliveredQuantity/@unitCode"/>
									</font>
								</td>
								<td width="8%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
												<xsl:with-param name="NumAd" select="1"/>
											</xsl:call-template>
										</xsl:variable>

										<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 !='-' ">
										<xsl:value-of select="format-number($ValorAdicional1,'###,###,##0.000','pen')"/>
										</xsl:if>
									</font>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$v_Contador=5 and cbc:ID &gt; 131 and cbc:ID &lt;= 171">
							<tr>
							   <td width="10%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									</font>
								</td>
								<td width="64%" align="left" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cac:Item/cbc:Name"/>
									</font>
								</td>
								<td width="12%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:DeliveredQuantity"/>
									</font>
								</td>
								<td width="6%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:value-of select="cbc:DeliveredQuantity/@unitCode"/>
									</font>
								</td>
								<td width="8%" align="center" class="td_detalle">
									<font face="Arial, Helvetica, sans-serif" size="2">
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
												<xsl:with-param name="NumAd" select="1"/>
											</xsl:call-template>
										</xsl:variable>

										<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 !='-' ">
										<xsl:value-of select="format-number($ValorAdicional1,'###,###,##0.000','pen')"/>
										</xsl:if>
									</font>
								</td>
							</tr>
						</xsl:if>
						
						</xsl:for-each>

						<xsl:if test="$v_Contador = $v_CantidadTotalPagina">
						<xsl:if test="$v_Contador = 1">
						 <xsl:call-template name="lineaBl"> 
							 <xsl:with-param name="cont" select="15 - $numitems"/>							 
						 </xsl:call-template>
						 </xsl:if>
						 <xsl:if test="$v_Contador = 2">
						 <xsl:call-template name="lineaBl"> 
							 <xsl:with-param name="cont" select="50 - $numitems"/>							 
						 </xsl:call-template>
						 </xsl:if>
						 <xsl:if test="$v_Contador = 3">
						 <xsl:call-template name="lineaBl"> 
							 <xsl:with-param name="cont" select="90 - $numitems"/>							 
						 </xsl:call-template>
						 </xsl:if>
						 <xsl:if test="$v_Contador = 4">
						 <xsl:call-template name="lineaBl"> 
							 <xsl:with-param name="cont" select="130 - $numitems"/>							 
						 </xsl:call-template>
						 </xsl:if>
						 <xsl:if test="$v_Contador = 5">
						 <xsl:call-template name="lineaBl"> 
							 <xsl:with-param name="cont" select="170 - $numitems"/>							 
						 </xsl:call-template>
						 </xsl:if>

						 </xsl:if>
					<!--<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>-->
							<!--<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>-->
						<!--</xsl:call-template>-->

					
									<!--<xsl:if test="($numitems) &lt;'14'">-->
									<xsl:if test="$v_Contador = $v_CantidadTotalPagina">
							  <tr>
								<tr>
							<td width="10%" align="center"  style="border:solid 1px black;border-top:none;border-bottom:none">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							<td width="64%" align="center"  style="border:solid 1px black;border-top:none;border-bottom:none">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;<br/>	 <xsl:call-template name="Det_Glosa"/>
								<!--</font>-->
							</td>
							<td width="12%" align="center"  style="border:solid 1px black;border-top:none;border-bottom:none">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							<td width="6%" align="center"   style="border:solid 1px black;border-top:none;border-bottom:none">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							<td width="8%" align="center"  style="border:solid 1px black;border-top:none;border-bottom:none">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							
						</tr>
							</tr> 
						</xsl:if>
		</table>
				</td>
			</tr>
		</table>
	<!--</xsl:if>-->
		
	</xsl:template>

	<xsl:template name="DetallesEncabezado2">
	<xsl:if test="($numitems) &gt;'11'">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr bgcolor="#DCDCDC">
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CÓDIGO</strong>
								</font>
							</td>
							<td width="64%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UND</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PESO</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<!-- <xsl:if test="($numitems) &lt;'65'"> -->
							<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;'11' and cbc:ID &lt;'39' ">	
								<tr>
									<td width="10%" align="center" class="td_detalle">
									<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									<!--</font>-->
									</td>
									<td width="64%" align="left" class="td_detalle">
										<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
											<xsl:value-of select="cac:Item/cbc:Name"/>
										<!--</font>-->
									</td>
									<td width="12%" align="center" class="td_detalle">
										<!--<font face="Arial, Helvetica, sans-serif">-->
											<xsl:value-of select="cbc:DeliveredQuantity"/><!-- - <xsl:value-of select="cbc:ID"/>-->
										<!--</font>-->
									</td>
									<td width="6%" align="center" class="td_detalle">
										<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
											<xsl:value-of select="cbc:DeliveredQuantity/@unitCode"/>
											<!--<xsl:value-of select="$v_ItemPorPagina"/>-->
										<!--</font>-->
									</td>
									<td width="8%" align="center" class="td_detalle">
										<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
											<xsl:variable name="ValorAdicional1">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>

											<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 !='-' ">
											<xsl:value-of select="format-number($ValorAdicional1,'###,###,##0.000','pen')"/>
											</xsl:if>
										<!--</font> -->
									</td>
								</tr>
							</xsl:if>						
							</xsl:for-each>

 						 <xsl:call-template name="lineaBl"> 
							 <xsl:with-param name="cont" select="40 - ($numitems)"/>							 
						 </xsl:call-template>
							<!--<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColB2"/>-->
							<!--<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>-->
						<!--</xsl:call-template>-->
						
						
						
						<xsl:if test="($numitems) &lt;'39'">
							<tr>
								<td width="10%" align="center"  style="border:solid 1px black;border-top:none;border-bottom:none">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
								</td>
								<td width="64%" align="center"  style="border:solid 1px black;border-top:none;border-bottom:none">
									<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
										&#xA0;<br/>	 <xsl:call-template name="Det_Glosa"/>
									<!--</font>-->
								</td>
								<td width="12%" align="center"  style="border:solid 1px black;border-top:none;border-bottom:none">
									<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
										&#xA0;
									<!--</font>-->
								</td>
								<td width="6%" align="center"   style="border:solid 1px black;border-top:none;border-bottom:none">
									<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
										&#xA0;
									<!--</font>-->
								</td>
								<td width="8%" align="center"  style="border:solid 1px black;border-top:none;border-bottom:none">
									<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
										&#xA0;
									<!--</font>-->
								</td>
							</tr> 
						</xsl:if>

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
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						<tr>
							<td width="10%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CÓDIGO</strong>
								</font>
							</td>
							<td width="64%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							<td width="12%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>CANTIDAD</strong>
								</font>
							</td>
							<td width="6%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>UND</strong>
								</font>
							</td>
							<td width="8%" align="center">
								<font face="Arial, Helvetica, sans-serif" size="1">
									<strong>PESO</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
					
					
					<xsl:for-each select="//cac:DespatchLine">
					<xsl:if test="cbc:ID &gt;'38' and cbc:ID &lt;'100' ">	
							<tr>
							    <td width="10%" align="center" class="td_detalle">
									<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
									<!--</font>-->
								</td>
								<td width="64%" align="left" class="td_detalle">
									<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
										<xsl:value-of select="cac:Item/cbc:Name"/>
									<!--</font>-->
								</td>
								<td width="12%" align="center" class="td_detalle">
									<!--<font face="Arial, Helvetica, sans-serif">-->
										<xsl:value-of select="cbc:DeliveredQuantity"/><!-- - <xsl:value-of select="cbc:ID"/>-->
									<!--</font>-->
								</td>
								<td width="6%" align="center" class="td_detalle">
									<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
										<xsl:value-of select="cbc:DeliveredQuantity/@unitCode"/>
										<!--<xsl:value-of select="$v_ItemPorPagina"/>-->
									<!--</font>-->
								</td>
								<td width="8%" align="center" class="td_detalle">
									<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
										<xsl:variable name="ValorAdicional1">
											<xsl:call-template name="RetourneValAdItem">
												<xsl:with-param name="NumLinea" select="cbc:ID"/>
												<xsl:with-param name="NumAd" select="1"/>
											</xsl:call-template>
										</xsl:variable>

										<xsl:if test="$ValorAdicional1 != '' and $ValorAdicional1 !='-' ">
										<xsl:value-of select="format-number($ValorAdicional1,'###,###,##0.000','pen')"/>
										</xsl:if>
									<!--</font> -->
								</td>
							</tr>
					</xsl:if>
					</xsl:for-each>
				
						 <xsl:call-template name="lineaBl"> 
							 <xsl:with-param name="cont" select="157 - ($numitems)"/>							 
						 </xsl:call-template> 
						<tr>
							<td width="10%" align="center" class="td_detalle">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							<td width="64%" align="center" class="td_detalle">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							<td width="12%" align="center" class="td_detalle">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							<td width="6%" align="center" class="td_detalle">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							<td width="8%" align="center" class="td_detalle">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							
						</tr>
						
							<tr>
							
							
								<td colspan="7" valign="top" width="50%" height="90%">
									<div>
										<p>		
											<br/>	 <xsl:call-template name="Det_Glosa"/>
										</p>
									</div>
								</td>
							</tr> 
					</table>
				</td>
			</tr>
		</table>
	</xsl:if>
	</xsl:template>






	<xsl:template name="unidad_medida">
		<xsl:choose>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PL' or cbc:CreditedQuantity/@unitCode='PL' or cbc:DebitedQuantity/@unitCode='PL'">BAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D64' or cbc:CreditedQuantity/@unitCode='D64' or cbc:DebitedQuantity/@unitCode='D64'">BLK</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BG' or cbc:CreditedQuantity/@unitCode='BG' or cbc:DebitedQuantity/@unitCode='BG'">BOL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BO' or cbc:CreditedQuantity/@unitCode='BO' or cbc:DebitedQuantity/@unitCode='BO'">BOT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='BX' or cbc:CreditedQuantity/@unitCode='BX' or cbc:DebitedQuantity/@unitCode='BX'">CAJ</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CY' or cbc:CreditedQuantity/@unitCode='CY' or cbc:DebitedQuantity/@unitCode='CY'">CIL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CLT' or cbc:CreditedQuantity/@unitCode='CLT' or cbc:DebitedQuantity/@unitCode='CLT'">CL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CMT' or cbc:CreditedQuantity/@unitCode='CMT' or cbc:DebitedQuantity/@unitCode='CMT'">CM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='CJ' or cbc:CreditedQuantity/@unitCode='CJ' or cbc:DebitedQuantity/@unitCode='CJ'">CON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='DLT' or cbc:CreditedQuantity/@unitCode='DLT' or cbc:DebitedQuantity/@unitCode='DLT'">DL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GLL' or cbc:CreditedQuantity/@unitCode='GLL' or cbc:DebitedQuantity/@unitCode='GLL'">GAL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='GRM' or cbc:CreditedQuantity/@unitCode='GRM' or cbc:DebitedQuantity/@unitCode='GRM'">GR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='HUR' or cbc:CreditedQuantity/@unitCode='HUR' or cbc:DebitedQuantity/@unitCode='HUR'">HRA</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KT' or cbc:CreditedQuantity/@unitCode='KT' or cbc:DebitedQuantity/@unitCode='KT'">JGO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KGM' or cbc:CreditedQuantity/@unitCode='KGM' or cbc:DebitedQuantity/@unitCode='KGM'">KG</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='KWT' or cbc:CreditedQuantity/@unitCode='KWT' or cbc:DebitedQuantity/@unitCode='KWT'">KW</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LBR' or cbc:CreditedQuantity/@unitCode='LBR' or cbc:DebitedQuantity/@unitCode='LBR'">LB</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='LTR' or cbc:CreditedQuantity/@unitCode='LTR' or cbc:DebitedQuantity/@unitCode='LTR'">LT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTR' or cbc:CreditedQuantity/@unitCode='MTR' or cbc:DebitedQuantity/@unitCode='MTR'">M</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTK' or cbc:CreditedQuantity/@unitCode='MTK' or cbc:DebitedQuantity/@unitCode='MTK'">M2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MTQ' or cbc:CreditedQuantity/@unitCode='MTQ' or cbc:DebitedQuantity/@unitCode='MTQ'">M3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MIL' or cbc:CreditedQuantity/@unitCode='MIL' or cbc:DebitedQuantity/@unitCode='MIL'">MIL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='D61' or cbc:CreditedQuantity/@unitCode='D61' or cbc:DebitedQuantity/@unitCode='D61'">MIN</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MLT' or cbc:CreditedQuantity/@unitCode='MLT' or cbc:DebitedQuantity/@unitCode='MLT'">ML</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='MMT' or cbc:CreditedQuantity/@unitCode='MMT' or cbc:DebitedQuantity/@unitCode='MMT'">MM</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NPR' or cbc:CreditedQuantity/@unitCode='NPR' or cbc:DebitedQuantity/@unitCode='NPR'">PAR</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTK' or cbc:CreditedQuantity/@unitCode='FTK' or cbc:DebitedQuantity/@unitCode='FTK'">PI2</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='FTQ' or cbc:CreditedQuantity/@unitCode='FTQ' or cbc:DebitedQuantity/@unitCode='FTQ'">PI3</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PA' or cbc:CreditedQuantity/@unitCode='PA' or cbc:DebitedQuantity/@unitCode='PA'">PQT</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='INH' or cbc:CreditedQuantity/@unitCode='INH' or cbc:DebitedQuantity/@unitCode='INH'">PUL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NRL' or cbc:CreditedQuantity/@unitCode='NRL' or cbc:DebitedQuantity/@unitCode='NRL'">ROL</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='TNE' or cbc:CreditedQuantity/@unitCode='TNE' or cbc:DebitedQuantity/@unitCode='TNE'">TON</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='NIU' or cbc:CreditedQuantity/@unitCode='NIU' or cbc:DebitedQuantity/@unitCode='NIU'">UNI</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SA' or cbc:CreditedQuantity/@unitCode='SA' or cbc:DebitedQuantity/@unitCode='SA'">SAC</xsl:when>		
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

	<xsl:template name="Det_Glosa">
		<table border="0" width="100%" cellpadding="0" cellspacing="1">
			<tbody >
				<xsl:if test="$Adicional_TOTSACOS!=''">
				<tr>
				<td width="28%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
               
				</font>
				</td>
				<td width="12%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="1">TOTAL SACOS 
					</font>
				</td>
				<td width="50%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">:
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
				<xsl:if test="pe:Codigo='31'">
				<xsl:value-of select="pe:Valor"/>
				</xsl:if>
				</xsl:for-each>
				</font>
				</td>
				</tr>
				</xsl:if>
				<tr>				
				<xsl:if test="$Adicional_TOTPIEZAS!=''">
				<tr>
				<td width="28%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1"></font>
				</td>				
				<td width="12%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="1">TOTAL PIEZAS 
					</font>
				</td>
				<td width="50%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">:
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
				<xsl:if test="pe:Codigo='16'">
				<xsl:value-of select="pe:Valor"/>
				</xsl:if>
				</xsl:for-each>
				</font>
				</td>
				</tr>
				</xsl:if>
				<xsl:if test="$Adicional_TOTTROZAS!=''">
				<tr>
				<td width="28%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1"></font>
				</td>				
				<td width="12%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="1">TOTAL TROZAS 
					</font>
				</td>
				<td width="50%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">:
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
				<xsl:if test="pe:Codigo='36'">
				<xsl:value-of select="pe:Valor"/>
				</xsl:if>
				</xsl:for-each>
				</font>
				</td>
				</tr>
				</xsl:if>
				<xsl:if test="$Adicional_PAQUETES!=''">
				<tr>
				<td width="28%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1"></font>
				</td>
				<td width="12%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="1">PAQUETES
					</font>
				</td>
				<td width="50%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">:
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
				<xsl:if test="pe:Codigo='17'">
				<xsl:value-of select="pe:Valor"/>
				</xsl:if>
				</xsl:for-each>
				</font>
				</td>
				</tr>
				</xsl:if>
				<xsl:if test="$Adicional_PT!=''">
				<tr>
				<td width="28%" align="center">
				<font face="Arial, Helvetica, sans-serif" size="1">
               
				</font>
				</td>
				<td width="12%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="1">P.T
					</font>
				</td>
				<td width="50%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="1">:
				<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
				<xsl:if test="pe:Codigo='18'">
				<xsl:value-of select="pe:Valor"/>
				</xsl:if>
				</xsl:for-each>
				</font>
				</td>
				</tr>
				</xsl:if>
				
				</tr>
			</tbody>
		</table>
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
			<!--Como funciona-->
			<xsl:if test="pe:Linea = format-number($NumLinea,'00','pen')">
					<xsl:value-of select="pe:Valor"/>
			</xsl:if>
			<!--Como estaba-->
			<!--<xsl:if test="pe:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>-->
		</xsl:for-each>
	</xsl:template>

	<xsl:variable name="Adicional_TOTSACOS">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="31"/>
		</xsl:call-template>
	</xsl:variable>
	
	<xsl:variable name="Adicional_TOTTROZAS">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="36"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="Adicional_TOTPIEZAS">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="16"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="Adicional_PAQUETES">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="17"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="Adicional_PT">
		<xsl:call-template name="RetourneValAd">
			<xsl:with-param name="NumAd" select="18"/>
		</xsl:call-template>
	</xsl:variable>

	<!-- <xsl:variable name="Adicional_Referencia"> -->
		<!-- <xsl:call-template name="RetourneValAd"> -->
			<!-- <xsl:with-param name="NumAd" select="21"/> -->
		<!-- </xsl:call-template> -->
	<!-- </xsl:variable> -->

	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr>
							<td width="10%" align="center" class="td_detalle">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							<td width="64%" align="center" class="td_detalle">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							<td width="12%" align="center" class="td_detalle">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							<td width="6%" align="center" class="td_detalle">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							<td width="8%" align="center" class="td_detalle">
								<!--<font face="Arial, Helvetica, sans-serif" size="1">-->
									&#xA0;
								<!--</font>-->
							</td>
							<!-- <td width="7%" align="center" class="td_detalle"> -->
								
									<!-- &#xA0; -->
							<!-- </td> -->
			</tr>
			<!-- Mostrar detalle - Completando -->
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 2"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>


</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="..\20513081236_2018111209T00100000005.xml" srcSchemaRoot="DespatchAdvice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="DetallesEncabezado"></template><template name="RetourneValAdItem"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->