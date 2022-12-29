<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
	<xsl:template name="tmpDetalle">
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
			<tr>
				<td>
					<table style="border: 1px solid black; border-collapse: collapse;" rules="groups" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
						<thead style="border: 1px solid black;">
							<tr>
								<th width="10%" align="center" style="border:solid 1px black">
									<font face="Arial, Helvetica, sans-serif" size="1">CÓDIGO</font>
								</th>
								<th width="5%" align="center" style="border:solid 1px black">

									<font face="Arial, Helvetica, sans-serif" size="1">CANTIDAD</font>
								</th>
								<th width="5%" align="center" style="border:solid 1px black">

									<font face="Arial, Helvetica, sans-serif" size="1">U.M.</font>
								</th>
								<th width="40%" align="center" style="border:solid 1px black">

									<font face="Arial, Helvetica, sans-serif" size="1">DESCRIPCIÓN</font>
								</th>
								<th width="10%" align="center" style="border:solid 1px black">
									<font face="Arial, Helvetica, sans-serif" size="1">PRECIO UNITARIO</font>
								</th>
								<th width="10%" align="center" style="border:solid 1px black">
									<font face="Arial, Helvetica, sans-serif" size="1">DESCUENTO POR ITEM</font>
								</th>
								<th width="10%" align="center" style="border:solid 1px black">
									<font face="Arial, Helvetica, sans-serif" size="1">VALOR DE VENTA</font>
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
								<xsl:variable name="Descuento">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:Amount">
										<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
									</xsl:if>
								</xsl:variable>
								<tr>
									<td width="10%" align="CENTER" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="5%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.00', 'pen')"/>

										</font>
									</td>
									<td width="5%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<td width="40%" align="left" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
											<xsl:variable name="posicion">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<!--Inicio Linea 1 -->
											<xsl:if test="$posicion!=''">
												<xsl:variable name="vline1">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1!=''">
													<br/>
													<xsl:value-of select="$vline1"/>
												</xsl:if>
												<xsl:if test="$vline2!=''">
													<br/>
													<xsl:value-of select="$vline2"/>
												</xsl:if>
												<xsl:if test="$vline3!=''">
													<br/>
													<xsl:value-of select="$vline3"/>
												</xsl:if>
												<xsl:if test="$vline4!=''">
													<br/>
													<xsl:value-of select="$vline4"/>
												</xsl:if>
												<xsl:if test="$vline5!=''">
													<br/>
													<xsl:value-of select="$vline5"/>
												</xsl:if>
												<xsl:if test="$vline6!=''">
													<br/>
													<xsl:value-of select="$vline6"/>
												</xsl:if>
												<xsl:if test="$vline7!=''">
													<br/>
													<xsl:value-of select="$vline7"/>
												</xsl:if>
												<xsl:if test="$vline8!=''">
													<br/>
													<xsl:value-of select="$vline8"/>
												</xsl:if>
												<xsl:if test="$vline9!=''">
													<br/>
													<xsl:value-of select="$vline9"/>
												</xsl:if>
												<xsl:if test="$vline10!=''">
													<br/>
													<xsl:value-of select="$vline10"/>
												</xsl:if>
											</xsl:if>
											<!--Fin Linea 1 -->

											<!--Inicio Linea 2 -->
											<xsl:variable name="posicion2">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="2"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion2!=''">
												<xsl:variable name="vline1_2">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2_2">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3_2">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4_2">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5_2">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6_2">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7_2">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8_2">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9_2">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10_2">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1_2!=''">
													<br/>
													<xsl:value-of select="$vline1_2"/>
												</xsl:if>
												<xsl:if test="$vline2_2!=''">
													<br/>
													<xsl:value-of select="$vline2_2"/>
												</xsl:if>
												<xsl:if test="$vline3_2!=''">
													<br/>
													<xsl:value-of select="$vline3_2"/>
												</xsl:if>
												<xsl:if test="$vline4_2!=''">
													<br/>
													<xsl:value-of select="$vline4_2"/>
												</xsl:if>
												<xsl:if test="$vline5_2!=''">
													<br/>
													<xsl:value-of select="$vline5_2"/>
												</xsl:if>
												<xsl:if test="$vline6_2!=''">
													<br/>
													<xsl:value-of select="$vline6_2"/>
												</xsl:if>
												<xsl:if test="$vline7_2!=''">
													<br/>
													<xsl:value-of select="$vline7_2"/>
												</xsl:if>
												<xsl:if test="$vline8_2!=''">
													<br/>
													<xsl:value-of select="$vline8_2"/>
												</xsl:if>
												<xsl:if test="$vline9_2!=''">
													<br/>
													<xsl:value-of select="$vline9_2"/>
												</xsl:if>
												<xsl:if test="$vline10_2!=''">
													<br/>
													<xsl:value-of select="$vline10_2"/>
												</xsl:if>
											</xsl:if>
											<!--Fin linea 2-->

											<!--Inicio Linea 3-->
											<xsl:variable name="posicion3">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="3"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion3!=''">
												<xsl:variable name="vline1_3">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2_3">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3_3">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4_3">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5_3">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6_3">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7_3">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8_3">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9_3">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10_3">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1_3!=''">
													<br/>
													<xsl:value-of select="$vline1_3"/>
												</xsl:if>
												<xsl:if test="$vline2_3!=''">
													<br/>
													<xsl:value-of select="$vline2_3"/>
												</xsl:if>
												<xsl:if test="$vline3_3!=''">
													<br/>
													<xsl:value-of select="$vline3_3"/>
												</xsl:if>
												<xsl:if test="$vline4_3!=''">
													<br/>
													<xsl:value-of select="$vline4_3"/>
												</xsl:if>
												<xsl:if test="$vline5_3!=''">
													<br/>
													<xsl:value-of select="$vline5_3"/>
												</xsl:if>
												<xsl:if test="$vline6_3!=''">
													<br/>
													<xsl:value-of select="$vline6_3"/>
												</xsl:if>
												<xsl:if test="$vline7_3!=''">
													<br/>
													<xsl:value-of select="$vline7_3"/>
												</xsl:if>
												<xsl:if test="$vline8_3!=''">
													<br/>
													<xsl:value-of select="$vline8_3"/>
												</xsl:if>
												<xsl:if test="$vline9_3!=''">
													<br/>
													<xsl:value-of select="$vline9_3"/>
												</xsl:if>
												<xsl:if test="$vline10_3!=''">
													<br/>
													<xsl:value-of select="$vline10_3"/>
												</xsl:if>
											</xsl:if>
											<!--Fin Linea 3-->

											<!--Inicio Linea 4-->
											<xsl:variable name="posicion4">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="4"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion4!=''">
												<xsl:variable name="vline1_4">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2_4">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3_4">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4_4">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5_4">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6_4">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7_4">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8_4">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9_4">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10_4">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1_4!=''">
													<br/>
													<xsl:value-of select="$vline1_4"/>
												</xsl:if>
												<xsl:if test="$vline2_4!=''">
													<br/>
													<xsl:value-of select="$vline2_4"/>
												</xsl:if>
												<xsl:if test="$vline3_4!=''">
													<br/>
													<xsl:value-of select="$vline3_4"/>
												</xsl:if>
												<xsl:if test="$vline4_4!=''">
													<br/>
													<xsl:value-of select="$vline4_4"/>
												</xsl:if>
												<xsl:if test="$vline5_4!=''">
													<br/>
													<xsl:value-of select="$vline5_4"/>
												</xsl:if>
												<xsl:if test="$vline6_4!=''">
													<br/>
													<xsl:value-of select="$vline6_4"/>
												</xsl:if>
												<xsl:if test="$vline7_4!=''">
													<br/>
													<xsl:value-of select="$vline7_4"/>
												</xsl:if>
												<xsl:if test="$vline8_4!=''">
													<br/>
													<xsl:value-of select="$vline8_4"/>
												</xsl:if>
												<xsl:if test="$vline9_4!=''">
													<br/>
													<xsl:value-of select="$vline9_4"/>
												</xsl:if>
												<xsl:if test="$vline10_4!=''">
													<br/>
													<xsl:value-of select="$vline10_4"/>
												</xsl:if>
											</xsl:if>
											<!--Fin linea 4-->

											<!--Inicio Linea 5-->
											<xsl:variable name="posicion5">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="5"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion5!=''">
												<xsl:variable name="vline1_5">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2_5">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3_5">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4_5">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5_5">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6_5">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7_5">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8_5">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9_5">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10_5">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1_5!=''">
													<br/>
													<xsl:value-of select="$vline1_5"/>
												</xsl:if>
												<xsl:if test="$vline2_5!=''">
													<br/>
													<xsl:value-of select="$vline2_5"/>
												</xsl:if>
												<xsl:if test="$vline3_5!=''">
													<br/>
													<xsl:value-of select="$vline3_5"/>
												</xsl:if>
												<xsl:if test="$vline4_5!=''">
													<br/>
													<xsl:value-of select="$vline4_5"/>
												</xsl:if>
												<xsl:if test="$vline5_5!=''">
													<br/>
													<xsl:value-of select="$vline5_5"/>
												</xsl:if>
												<xsl:if test="$vline6_5!=''">
													<br/>
													<xsl:value-of select="$vline6_5"/>
												</xsl:if>
												<xsl:if test="$vline7_5!=''">
													<br/>
													<xsl:value-of select="$vline7_5"/>
												</xsl:if>
												<xsl:if test="$vline8_5!=''">
													<br/>
													<xsl:value-of select="$vline8_5"/>
												</xsl:if>
												<xsl:if test="$vline9_5!=''">
													<br/>
													<xsl:value-of select="$vline9_5"/>
												</xsl:if>
												<xsl:if test="$vline10_5!=''">
													<br/>
													<xsl:value-of select="$vline10_5"/>
												</xsl:if>
											</xsl:if>
											<!--Fin linea 5-->



										</font>
									</td>
									<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number($Descuento,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
								</tr>
							</xsl:for-each>

							<xsl:for-each select="//pe:Invoice/cac:PrepaidPayment">
								<tr>
									<!-- CODIGO -->
									<td width="10%" align="CENTER" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									</td>
									<!--CANTIDAD-->
									<td width="5%" align="CENTER" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									</td>
									<!--UNIDAD-->
									<td width="5%" align="CENTER" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									</td>
									<!--DESCRIPCION-->
									<td width="40%" align="LEFT" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:ID"/>DCTO. POR ANTICIPO</font>

										<!--PRECIO UNIT.-->
										<td width="10%" align="CENTER" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										</td>
										<!--<td width="10%" align="CENTER" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
						<!<font face="Arial, Helvetica, sans-serif" size="1">
							<xsl:value-of select="format-number(cbc:PaidAmount,'###,###,##0.00','pen')"/>
						</font>-->
									</td>

									<!--DESCUENTO POR ITEM.-->
									<td width="10%" align="CENTER" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
									</td>

									<!--IMPORTE.-->
									<td width="10%" align="RIGHT" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:PaidAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
								</tr>
							</xsl:for-each>

							<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
								<xsl:variable name="DescuentoItem">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:Amount">
										<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
									</xsl:if>
								</xsl:variable>
								<tr>
									<td width="10%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="2">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:CreditedQuantity"/>
										</font>
									</td>
									<td width="6%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<td width="40%" align="left" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
											<xsl:variable name="posicion">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion!=''">
												<xsl:variable name="vline1">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1!=''">
													<br/>
													<xsl:value-of select="$vline1"/>
												</xsl:if>
												<xsl:if test="$vline2!=''">
													<br/>
													<xsl:value-of select="$vline2"/>
												</xsl:if>
												<xsl:if test="$vline3!=''">
													<br/>
													<xsl:value-of select="$vline3"/>
												</xsl:if>
												<xsl:if test="$vline4!=''">
													<br/>
													<xsl:value-of select="$vline4"/>
												</xsl:if>
												<xsl:if test="$vline5!=''">
													<br/>
													<xsl:value-of select="$vline5"/>
												</xsl:if>
												<xsl:if test="$vline6!=''">
													<br/>
													<xsl:value-of select="$vline6"/>
												</xsl:if>
												<xsl:if test="$vline7!=''">
													<br/>
													<xsl:value-of select="$vline7"/>
												</xsl:if>
												<xsl:if test="$vline8!=''">
													<br/>
													<xsl:value-of select="$vline8"/>
												</xsl:if>
												<xsl:if test="$vline9!=''">
													<br/>
													<xsl:value-of select="$vline9"/>
												</xsl:if>
												<xsl:if test="$vline10!=''">
													<br/>
													<xsl:value-of select="$vline10"/>
												</xsl:if>
											</xsl:if>

											<!--Linea 2 -->
											<xsl:variable name="posicion2">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="2"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion2!=''">
												<xsl:variable name="vline1_2">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2_2">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3_2">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4_2">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5_2">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6_2">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7_2">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8_2">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9_2">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10_2">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1_2!=''">
													<br/>
													<xsl:value-of select="$vline1_2"/>
												</xsl:if>
												<xsl:if test="$vline2_2!=''">
													<br/>
													<xsl:value-of select="$vline2_2"/>
												</xsl:if>
												<xsl:if test="$vline3_2!=''">
													<br/>
													<xsl:value-of select="$vline3_2"/>
												</xsl:if>
												<xsl:if test="$vline4_2!=''">
													<br/>
													<xsl:value-of select="$vline4_2"/>
												</xsl:if>
												<xsl:if test="$vline5_2!=''">
													<br/>
													<xsl:value-of select="$vline5_2"/>
												</xsl:if>
												<xsl:if test="$vline6_2!=''">
													<br/>
													<xsl:value-of select="$vline6_2"/>
												</xsl:if>
												<xsl:if test="$vline7_2!=''">
													<br/>
													<xsl:value-of select="$vline7_2"/>
												</xsl:if>
												<xsl:if test="$vline8_2!=''">
													<br/>
													<xsl:value-of select="$vline8_2"/>
												</xsl:if>
												<xsl:if test="$vline9_2!=''">
													<br/>
													<xsl:value-of select="$vline9_2"/>
												</xsl:if>
												<xsl:if test="$vline10_2!=''">
													<br/>
													<xsl:value-of select="$vline10_2"/>
												</xsl:if>
											</xsl:if>
											<!--Fin linea-->

											<!--Inicio Linea 3-->
											<xsl:variable name="posicion3">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="3"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion3!=''">
												<xsl:variable name="vline1_3">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2_3">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3_3">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4_3">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5_3">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6_3">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7_3">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8_3">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9_3">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10_3">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1_3!=''">
													<br/>
													<xsl:value-of select="$vline1_3"/>
												</xsl:if>
												<xsl:if test="$vline2_3!=''">
													<br/>
													<xsl:value-of select="$vline2_3"/>
												</xsl:if>
												<xsl:if test="$vline3_3!=''">
													<br/>
													<xsl:value-of select="$vline3_3"/>
												</xsl:if>
												<xsl:if test="$vline4_3!=''">
													<br/>
													<xsl:value-of select="$vline4_3"/>
												</xsl:if>
												<xsl:if test="$vline5_3!=''">
													<br/>
													<xsl:value-of select="$vline5_3"/>
												</xsl:if>
												<xsl:if test="$vline6_3!=''">
													<br/>
													<xsl:value-of select="$vline6_3"/>
												</xsl:if>
												<xsl:if test="$vline7_3!=''">
													<br/>
													<xsl:value-of select="$vline7_3"/>
												</xsl:if>
												<xsl:if test="$vline8_3!=''">
													<br/>
													<xsl:value-of select="$vline8_3"/>
												</xsl:if>
												<xsl:if test="$vline9_3!=''">
													<br/>
													<xsl:value-of select="$vline9_3"/>
												</xsl:if>
												<xsl:if test="$vline10_3!=''">
													<br/>
													<xsl:value-of select="$vline10_3"/>
												</xsl:if>
											</xsl:if>
											<!--Fin linea 3 -->

											<!--Inicio Linea 4-->
											<xsl:variable name="posicion4">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="4"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion4!=''">
												<xsl:variable name="vline1_4">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2_4">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3_4">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4_4">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5_4">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6_4">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7_4">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8_4">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9_4">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10_4">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1_4!=''">
													<br/>
													<xsl:value-of select="$vline1_4"/>
												</xsl:if>
												<xsl:if test="$vline2_4!=''">
													<br/>
													<xsl:value-of select="$vline2_4"/>
												</xsl:if>
												<xsl:if test="$vline3_4!=''">
													<br/>
													<xsl:value-of select="$vline3_4"/>
												</xsl:if>
												<xsl:if test="$vline4_4!=''">
													<br/>
													<xsl:value-of select="$vline4_4"/>
												</xsl:if>
												<xsl:if test="$vline5_4!=''">
													<br/>
													<xsl:value-of select="$vline5_4"/>
												</xsl:if>
												<xsl:if test="$vline6_4!=''">
													<br/>
													<xsl:value-of select="$vline6_4"/>
												</xsl:if>
												<xsl:if test="$vline7_4!=''">
													<br/>
													<xsl:value-of select="$vline7_4"/>
												</xsl:if>
												<xsl:if test="$vline8_4!=''">
													<br/>
													<xsl:value-of select="$vline8_4"/>
												</xsl:if>
												<xsl:if test="$vline9_4!=''">
													<br/>
													<xsl:value-of select="$vline9_4"/>
												</xsl:if>
												<xsl:if test="$vline10_4!=''">
													<br/>
													<xsl:value-of select="$vline10_4"/>
												</xsl:if>
											</xsl:if>
											<!--Fin linea 4-->

											<!--Inicio Linea 5-->
											<xsl:variable name="posicion5">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="5"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion5!=''">
												<xsl:variable name="vline1_5">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2_5">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3_5">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4_5">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5_5">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6_5">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7_5">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8_5">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9_5">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10_5">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1_5!=''">
													<br/>
													<xsl:value-of select="$vline1_5"/>
												</xsl:if>
												<xsl:if test="$vline2_5!=''">
													<br/>
													<xsl:value-of select="$vline2_5"/>
												</xsl:if>
												<xsl:if test="$vline3_5!=''">
													<br/>
													<xsl:value-of select="$vline3_5"/>
												</xsl:if>
												<xsl:if test="$vline4_5!=''">
													<br/>
													<xsl:value-of select="$vline4_5"/>
												</xsl:if>
												<xsl:if test="$vline5_5!=''">
													<br/>
													<xsl:value-of select="$vline5_5"/>
												</xsl:if>
												<xsl:if test="$vline6_5!=''">
													<br/>
													<xsl:value-of select="$vline6_5"/>
												</xsl:if>
												<xsl:if test="$vline7_5!=''">
													<br/>
													<xsl:value-of select="$vline7_5"/>
												</xsl:if>
												<xsl:if test="$vline8_5!=''">
													<br/>
													<xsl:value-of select="$vline8_5"/>
												</xsl:if>
												<xsl:if test="$vline9_5!=''">
													<br/>
													<xsl:value-of select="$vline9_5"/>
												</xsl:if>
												<xsl:if test="$vline10_5!=''">
													<br/>
													<xsl:value-of select="$vline10_5"/>
												</xsl:if>
											</xsl:if>
											<!--Fin linea 5-->
										</font>
									</td>
									<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number($DescuentoItem,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
								</tr>
							</xsl:for-each>

							<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
								<xsl:variable name="DescuentoItem">
									<xsl:value-of select="0"/>
									<xsl:if test="cac:AllowanceCharge/cbc:Amount">
										<xsl:value-of select="cac:AllowanceCharge/cbc:Amount"/>
									</xsl:if>
								</xsl:variable>

								<tr>
									<td width="10%" align="center" valign="top">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<td width="10%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cbc:DebitedQuantity"/>
										</font>
									</td>
									<td width="6%" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="unidad_medida"/>
										</font>
									</td>
									<td width="40%" align="left" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="cac:Item/cbc:Description"/>
											<!--Inicio Linea 1-->
											<xsl:variable name="posicion">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="1"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion!=''">
												<xsl:variable name="vline1">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1!=''">
													<br/>
													<xsl:value-of select="$vline1"/>
												</xsl:if>
												<xsl:if test="$vline2!=''">
													<br/>
													<xsl:value-of select="$vline2"/>
												</xsl:if>
												<xsl:if test="$vline3!=''">
													<br/>
													<xsl:value-of select="$vline3"/>
												</xsl:if>
												<xsl:if test="$vline4!=''">
													<br/>
													<xsl:value-of select="$vline4"/>
												</xsl:if>
												<xsl:if test="$vline5!=''">
													<br/>
													<xsl:value-of select="$vline5"/>
												</xsl:if>
												<xsl:if test="$vline6!=''">
													<br/>
													<xsl:value-of select="$vline6"/>
												</xsl:if>
												<xsl:if test="$vline7!=''">
													<br/>
													<xsl:value-of select="$vline7"/>
												</xsl:if>
												<xsl:if test="$vline8!=''">
													<br/>
													<xsl:value-of select="$vline8"/>
												</xsl:if>
												<xsl:if test="$vline9!=''">
													<br/>
													<xsl:value-of select="$vline9"/>
												</xsl:if>
												<xsl:if test="$vline10!=''">
													<br/>
													<xsl:value-of select="$vline10"/>
												</xsl:if>
											</xsl:if>
											<!--Fin Linea 1-->

											<!--Inicio Linea 2 -->
											<xsl:variable name="posicion2">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="2"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion2!=''">
												<xsl:variable name="vline1_2">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2_2">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3_2">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4_2">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5_2">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6_2">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7_2">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8_2">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9_2">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10_2">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion2"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1_2!=''">
													<br/>
													<xsl:value-of select="$vline1_2"/>
												</xsl:if>
												<xsl:if test="$vline2_2!=''">
													<br/>
													<xsl:value-of select="$vline2_2"/>
												</xsl:if>
												<xsl:if test="$vline3_2!=''">
													<br/>
													<xsl:value-of select="$vline3_2"/>
												</xsl:if>
												<xsl:if test="$vline4_2!=''">
													<br/>
													<xsl:value-of select="$vline4_2"/>
												</xsl:if>
												<xsl:if test="$vline5_2!=''">
													<br/>
													<xsl:value-of select="$vline5_2"/>
												</xsl:if>
												<xsl:if test="$vline6_2!=''">
													<br/>
													<xsl:value-of select="$vline6_2"/>
												</xsl:if>
												<xsl:if test="$vline7_2!=''">
													<br/>
													<xsl:value-of select="$vline7_2"/>
												</xsl:if>
												<xsl:if test="$vline8_2!=''">
													<br/>
													<xsl:value-of select="$vline8_2"/>
												</xsl:if>
												<xsl:if test="$vline9_2!=''">
													<br/>
													<xsl:value-of select="$vline9_2"/>
												</xsl:if>
												<xsl:if test="$vline10_2!=''">
													<br/>
													<xsl:value-of select="$vline10_2"/>
												</xsl:if>
											</xsl:if>
											<!--Fin linea 2-->

											<!--Inicio Linea 3-->
											<xsl:variable name="posicion3">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="3"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion3!=''">
												<xsl:variable name="vline1_3">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2_3">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3_3">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4_3">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5_3">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6_3">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7_3">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8_3">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9_3">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10_3">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion3"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1_3!=''">
													<br/>
													<xsl:value-of select="$vline1_3"/>
												</xsl:if>
												<xsl:if test="$vline2_3!=''">
													<br/>
													<xsl:value-of select="$vline2_3"/>
												</xsl:if>
												<xsl:if test="$vline3_3!=''">
													<br/>
													<xsl:value-of select="$vline3_3"/>
												</xsl:if>
												<xsl:if test="$vline4_3!=''">
													<br/>
													<xsl:value-of select="$vline4_3"/>
												</xsl:if>
												<xsl:if test="$vline5_3!=''">
													<br/>
													<xsl:value-of select="$vline5_3"/>
												</xsl:if>
												<xsl:if test="$vline6_3!=''">
													<br/>
													<xsl:value-of select="$vline6_3"/>
												</xsl:if>
												<xsl:if test="$vline7_3!=''">
													<br/>
													<xsl:value-of select="$vline7_3"/>
												</xsl:if>
												<xsl:if test="$vline8_3!=''">
													<br/>
													<xsl:value-of select="$vline8_3"/>
												</xsl:if>
												<xsl:if test="$vline9_3!=''">
													<br/>
													<xsl:value-of select="$vline9_3"/>
												</xsl:if>
												<xsl:if test="$vline10_3!=''">
													<br/>
													<xsl:value-of select="$vline10_3"/>
												</xsl:if>
											</xsl:if>
											<!--Fin Linea 3-->

											<!--Inicio Linea 4-->
											<xsl:variable name="posicion4">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="4"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion4!=''">
												<xsl:variable name="vline1_4">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2_4">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3_4">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4_4">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5_4">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6_4">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7_4">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8_4">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9_4">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10_4">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion4"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1_4!=''">
													<br/>
													<xsl:value-of select="$vline1_4"/>
												</xsl:if>
												<xsl:if test="$vline2_4!=''">
													<br/>
													<xsl:value-of select="$vline2_4"/>
												</xsl:if>
												<xsl:if test="$vline3_4!=''">
													<br/>
													<xsl:value-of select="$vline3_4"/>
												</xsl:if>
												<xsl:if test="$vline4_4!=''">
													<br/>
													<xsl:value-of select="$vline4_4"/>
												</xsl:if>
												<xsl:if test="$vline5_4!=''">
													<br/>
													<xsl:value-of select="$vline5_4"/>
												</xsl:if>
												<xsl:if test="$vline6_4!=''">
													<br/>
													<xsl:value-of select="$vline6_4"/>
												</xsl:if>
												<xsl:if test="$vline7_4!=''">
													<br/>
													<xsl:value-of select="$vline7_4"/>
												</xsl:if>
												<xsl:if test="$vline8_4!=''">
													<br/>
													<xsl:value-of select="$vline8_4"/>
												</xsl:if>
												<xsl:if test="$vline9_4!=''">
													<br/>
													<xsl:value-of select="$vline9_4"/>
												</xsl:if>
												<xsl:if test="$vline10_4!=''">
													<br/>
													<xsl:value-of select="$vline10_4"/>
												</xsl:if>
											</xsl:if>
											<!--Fin linea 4-->

											<!--Inicio Linea 5-->
											<xsl:variable name="posicion5">
												<xsl:call-template name="RetourneValAdItem">
													<xsl:with-param name="NumLinea" select="cbc:ID"/>
													<xsl:with-param name="NumAd" select="5"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:if test="$posicion5!=''">
												<xsl:variable name="vline1_5">
													<xsl:call-template name="descripcionline">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline2_5">
													<xsl:call-template name="descripcionline2">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline3_5">
													<xsl:call-template name="descripcionline3">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline4_5">
													<xsl:call-template name="descripcionline4">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline5_5">
													<xsl:call-template name="descripcionline5">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline6_5">
													<xsl:call-template name="descripcionline6">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline7_5">
													<xsl:call-template name="descripcionline7">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline8_5">
													<xsl:call-template name="descripcionline8">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline9_5">
													<xsl:call-template name="descripcionline9">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="vline10_5">
													<xsl:call-template name="descripcionline10">
														<xsl:with-param name="line" select="$posicion5"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:if test="$vline1_5!=''">
													<br/>
													<xsl:value-of select="$vline1_5"/>
												</xsl:if>
												<xsl:if test="$vline2_5!=''">
													<br/>
													<xsl:value-of select="$vline2_5"/>
												</xsl:if>
												<xsl:if test="$vline3_5!=''">
													<br/>
													<xsl:value-of select="$vline3_5"/>
												</xsl:if>
												<xsl:if test="$vline4_5!=''">
													<br/>
													<xsl:value-of select="$vline4_5"/>
												</xsl:if>
												<xsl:if test="$vline5_5!=''">
													<br/>
													<xsl:value-of select="$vline5_5"/>
												</xsl:if>
												<xsl:if test="$vline6_5!=''">
													<br/>
													<xsl:value-of select="$vline6_5"/>
												</xsl:if>
												<xsl:if test="$vline7_5!=''">
													<br/>
													<xsl:value-of select="$vline7_5"/>
												</xsl:if>
												<xsl:if test="$vline8_5!=''">
													<br/>
													<xsl:value-of select="$vline8_5"/>
												</xsl:if>
												<xsl:if test="$vline9_5!=''">
													<br/>
													<xsl:value-of select="$vline9_5"/>
												</xsl:if>
												<xsl:if test="$vline10_5!=''">
													<br/>
													<xsl:value-of select="$vline10_5"/>
												</xsl:if>
											</xsl:if>
											<!--Fin linea 5-->
										</font>
									</td>
									
									<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">

											<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
									<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number($DescuentoItem,'###,###,##0.00','pen')"/>
										</font>
									</td>

									<td width="10%" align="right" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>
										</font>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:call-template name="lineaBl">
								<xsl:with-param name="cont" select="$numColBl"/>
								<!-- <tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr> -->
							</xsl:call-template>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="lineaBl">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr>
				<td width="10" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;</font>
				</td>
				<td width="5%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;</font>
				</td>
				<td width="5%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;</font>
				</td>
				<td width="40" align="center" valign="top" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;</font>
				</td>
				<td width="10%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;</font>
				</td>
				<td width="10%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;</font>
				</td>
				<td width="10%" align="center" style="border:solid 1px black;border-top:none;border-bottom:none">
					<font face="Arial, Helvetica, sans-serif" size="2">&#xA0;</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont" select="$cont - 1"/>
			</xsl:call-template>
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
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='JR' or cbc:CreditedQuantity/@unitCode='JR' or cbc:DebitedQuantity/@unitCode='JR'">FC</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='SO' or cbc:CreditedQuantity/@unitCode='SO' or cbc:DebitedQuantity/@unitCode='SO'">SO</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='JE' or cbc:CreditedQuantity/@unitCode='JE' or cbc:DebitedQuantity/@unitCode='JE'">JER</xsl:when>
			<xsl:when test="cbc:InvoicedQuantity/@unitCode='PS' or cbc:CreditedQuantity/@unitCode='PS' or cbc:DebitedQuantity/@unitCode='PS'">POTE</xsl:when>
			<xsl:otherwise>UNI</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="RetourneValAdItem">
		<xsl:param name="NumLinea"/>
		<xsl:param name="NumAd"/>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:LineaDetalle">
			<xsl:if test="pe:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:LineaDetalle">
			<xsl:if test="pe1:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe1:Valor"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:LineaDetalle">
			<xsl:if test="pe2:Codigo = concat($NumLinea, $NumAd)">
				<xsl:value-of select="pe2:Valor"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="descripcionline">
		<xsl:param name="line"/>
		<xsl:value-of select="substring-before($line, '|')"/>
	</xsl:template>
	<xsl:template name="descripcionline2">
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:value-of select="substring-before($line2, '|')"/>
	</xsl:template>
	<xsl:template name="descripcionline3">
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:variable name="line3" select="substring-after($line2,'|')"/>
		<xsl:value-of select="substring-before($line3, '|')"/>
	</xsl:template>
	<xsl:template name="descripcionline4">
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:variable name="line3" select="substring-after($line2,'|')"/>
		<xsl:variable name="line4" select="substring-after($line3,'|')"/>
		<xsl:value-of select="substring-before($line4, '|')"/>
	</xsl:template>
	<xsl:template name="descripcionline5">
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:variable name="line3" select="substring-after($line2,'|')"/>
		<xsl:variable name="line4" select="substring-after($line3,'|')"/>
		<xsl:variable name="line5" select="substring-after($line4,'|')"/>
		<xsl:value-of select="substring-before($line5, '|')"/>
	</xsl:template>
	<xsl:template name="descripcionline6">
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:variable name="line3" select="substring-after($line2,'|')"/>
		<xsl:variable name="line4" select="substring-after($line3,'|')"/>
		<xsl:variable name="line5" select="substring-after($line4,'|')"/>
		<xsl:variable name="line6" select="substring-after($line5,'|')"/>
		<xsl:value-of select="substring-before($line6, '|')"/>
	</xsl:template>
	<xsl:template name="descripcionline7">
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:variable name="line3" select="substring-after($line2,'|')"/>
		<xsl:variable name="line4" select="substring-after($line3,'|')"/>
		<xsl:variable name="line5" select="substring-after($line4,'|')"/>
		<xsl:variable name="line6" select="substring-after($line5,'|')"/>
		<xsl:variable name="line7" select="substring-after($line6,'|')"/>
		<xsl:value-of select="substring-before($line7, '|')"/>
	</xsl:template>
	<xsl:template name="descripcionline8">
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:variable name="line3" select="substring-after($line2,'|')"/>
		<xsl:variable name="line4" select="substring-after($line3,'|')"/>
		<xsl:variable name="line5" select="substring-after($line4,'|')"/>
		<xsl:variable name="line6" select="substring-after($line5,'|')"/>
		<xsl:variable name="line7" select="substring-after($line6,'|')"/>
		<xsl:variable name="line8" select="substring-after($line7,'|')"/>
		<xsl:value-of select="substring-before($line8, '|')"/>
	</xsl:template>
	<xsl:template name="descripcionline9">
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:variable name="line3" select="substring-after($line2,'|')"/>
		<xsl:variable name="line4" select="substring-after($line3,'|')"/>
		<xsl:variable name="line5" select="substring-after($line4,'|')"/>
		<xsl:variable name="line6" select="substring-after($line5,'|')"/>
		<xsl:variable name="line7" select="substring-after($line6,'|')"/>
		<xsl:variable name="line8" select="substring-after($line7,'|')"/>
		<xsl:variable name="line9" select="substring-after($line8,'|')"/>
		<xsl:value-of select="substring-before($line9, '|')"/>
	</xsl:template>
	<xsl:template name="descripcionline10">
		<xsl:param name="line"/>
		<xsl:variable name="line2" select="substring-after($line,'|')"/>
		<xsl:variable name="line3" select="substring-after($line2,'|')"/>
		<xsl:variable name="line4" select="substring-after($line3,'|')"/>
		<xsl:variable name="line5" select="substring-after($line4,'|')"/>
		<xsl:variable name="line6" select="substring-after($line5,'|')"/>
		<xsl:variable name="line7" select="substring-after($line6,'|')"/>
		<xsl:variable name="line8" select="substring-after($line7,'|')"/>
		<xsl:variable name="line9" select="substring-after($line8,'|')"/>
		<xsl:variable name="line10" select="substring-after($line9,'|')"/>
		<xsl:value-of select="substring-before($line10, '|')"/>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="examples\GRUPOS DE FACTURAS\GRUPO 1 &#x2D; VTAS GRAVADAS CON IGV\01 F1 con 3 items\20520929658&#x2D;01&#x2D;FF11&#x2D;66000001.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->