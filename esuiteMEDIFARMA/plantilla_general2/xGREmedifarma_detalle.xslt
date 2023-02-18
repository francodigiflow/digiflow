<?xml version='1.0' encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">
	<xsl:output method="html"
	            indent="yes"
	            encoding="ISO-8859-1"
	            omit-xml-declaration="yes"/>
	<xsl:template name="DetallesEncabezado">
		<table border="0"
		       width="100%"
		       cellpadding="0"
		       cellspacing="2">
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="4"
					       cellspacing="0">
						<tr>
							<!-- ITEM -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<!-- CODIGO -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<!-- CANT. -->
							<td width="8%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CANT.</strong>
								</font>
							</td>
							<!-- DESCRIP. -->
							<td width="48%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							<!-- U.M. -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>U.M.</strong>
								</font>
							</td>
							<!-- LOTE -->
							<td width="14%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>LOTE</strong>
								</font>
							</td>
							<!-- FECHA EXP. -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>FECHA<br/>EXPIRACIÓN</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="2"
					       cellspacing="0">
						<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'34'  ">
								<!-- CREACION DE VARIBLES PARA DISGREGAR LOS DATOS CONCATENADOS EN LA DESCRIPCION  -->
								<xsl:variable name="varDescrip"
								              select="substring-before(cac:Item/cbc:Name,'*')"/>
								<xsl:variable name="varUM"
								              select="substring-before(substring-after(cac:Item/cbc:Name,'*'),'*')"/>
								<xsl:variable name="varLote"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*'),'*')"/>
								<xsl:variable name="varDescrip20"
								              select="substring-before(cac:Item/cbc:Description,'*')"/>
								<xsl:variable name="varUM20"
								              select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
								<xsl:variable name="varLote20"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp20"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
								<tr>
									<!-- ITEM -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!-- CODIGO -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!-- CANT. -->
									<td width="8%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:DeliveredQuantity"/>
										</font>
									</td>
									<!-- DESCRIP. -->
									<td width="48%"
									    align="left">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varDescrip20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varDescrip"/>
											</xsl:if>
										</font>
									</td>
									<!-- U.M. -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varUM20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varUM"/>
											</xsl:if>
										</font>
									</td>
									<!-- LOTE -->
									<td width="14%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<!-- <xsl:value-of select="$varLote"/> -->
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="substring($varLote20,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote20,21,30)"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="substring($varLote,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote,21,30)"/>
											</xsl:if>
										</font>
									</td>
									<!-- FECHA EXP. -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varFecExp20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varFecExp"/>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont"
							                select="$numColBl"/>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="DetallesEncabezado2">
		<table border="0"
		       width="100%"
		       cellpadding="0"
		       cellspacing="2">
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="4"
					       cellspacing="0">
					<tr>
							<!-- ITEM -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<!-- CODIGO -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<!-- CANT. -->
							<td width="8%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CANT.</strong>
								</font>
							</td>
							<!-- DESCRIP. -->
							<td width="48%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							<!-- U.M. -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>U.M.</strong>
								</font>
							</td>
							<!-- LOTE -->
							<td width="14%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>LOTE</strong>
								</font>
							</td>
							<!-- FECHA EXP. -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>FECHA<br/>EXPIRACIÓN</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="2"
					       cellspacing="0">
						<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;'33' and cbc:ID &lt;'67'  ">
								<!-- CREACION DE VARIBLES PARA DISGREGAR LOS DATOS CONCATENADOS EN LA DESCRIPCION  -->
								<xsl:variable name="varDescrip"
								              select="substring-before(cac:Item/cbc:Name,'*')"/>
								<xsl:variable name="varUM"
								              select="substring-before(substring-after(cac:Item/cbc:Name,'*'),'*')"/>
								<xsl:variable name="varLote"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*'),'*')"/>
								<xsl:variable name="varDescrip20"
								              select="substring-before(cac:Item/cbc:Description,'*')"/>
								<xsl:variable name="varUM20"
								              select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
								<xsl:variable name="varLote20"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp20"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
							<tr>
									<!-- ITEM -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!-- CODIGO -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!-- CANT. -->
									<td width="8%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:DeliveredQuantity"/>
										</font>
									</td>
									<!-- DESCRIP. -->
									<td width="48%"
									    align="left">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varDescrip20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varDescrip"/>
											</xsl:if>
										</font>
									</td>
									<!-- U.M. -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varUM20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varUM"/>
											</xsl:if>
										</font>
									</td>
									<!-- LOTE -->
									<td width="14%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<!-- <xsl:value-of select="$varLote"/> -->
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="substring($varLote20,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote20,21,30)"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="substring($varLote,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote,21,30)"/>
											</xsl:if>
										</font>
									</td>
									<!-- FECHA EXP. -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varFecExp20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varFecExp"/>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont"
							                select="$numColBl"/>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="DetallesEncabezado3">
		<table border="0"
		       width="100%"
		       cellpadding="0"
		       cellspacing="2">
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="4"
					       cellspacing="0">
						<tr>
							<!-- ITEM -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<!-- CODIGO -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<!-- CANT. -->
							<td width="8%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CANT.</strong>
								</font>
							</td>
							<!-- DESCRIP. -->
							<td width="48%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							<!-- U.M. -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>U.M.</strong>
								</font>
							</td>
							<!-- LOTE -->
							<td width="14%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>LOTE</strong>
								</font>
							</td>
							<!-- FECHA EXP. -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>FECHA<br/>EXPIRACIÓN</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="2"
					       cellspacing="0">
						<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;'66' and cbc:ID &lt;'100'  ">
								<!-- CREACION DE VARIBLES PARA DISGREGAR LOS DATOS CONCATENADOS EN LA DESCRIPCION  -->
								<xsl:variable name="varDescrip"
								              select="substring-before(cac:Item/cbc:Name,'*')"/>
								<xsl:variable name="varUM"
								              select="substring-before(substring-after(cac:Item/cbc:Name,'*'),'*')"/>
								<xsl:variable name="varLote"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*'),'*')"/>
								<xsl:variable name="varDescrip20"
								              select="substring-before(cac:Item/cbc:Description,'*')"/>
								<xsl:variable name="varUM20"
								              select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
								<xsl:variable name="varLote20"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp20"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
							<tr>
									<!-- ITEM -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!-- CODIGO -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!-- CANT. -->
									<td width="8%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:DeliveredQuantity"/>
										</font>
									</td>
									<!-- DESCRIP. -->
									<td width="48%"
									    align="left">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varDescrip20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varDescrip"/>
											</xsl:if>
										</font>
									</td>
									<!-- U.M. -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varUM20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varUM"/>
											</xsl:if>
										</font>
									</td>
									<!-- LOTE -->
									<td width="14%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<!-- <xsl:value-of select="$varLote"/> -->
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="substring($varLote20,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote20,21,30)"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="substring($varLote,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote,21,30)"/>
											</xsl:if>
										</font>
									</td>
									<!-- FECHA EXP. -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varFecExp20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varFecExp"/>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont"
							                select="$numColBl"/>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="DetallesEncabezado4">
		<table border="0"
		       width="100%"
		       cellpadding="0"
		       cellspacing="2">
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="4"
					       cellspacing="0">
						<tr>
							<!-- ITEM -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<!-- CODIGO -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<!-- CANT. -->
							<td width="8%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CANT.</strong>
								</font>
							</td>
							<!-- DESCRIP. -->
							<td width="48%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							<!-- U.M. -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>U.M.</strong>
								</font>
							</td>
							<!-- LOTE -->
							<td width="14%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>LOTE</strong>
								</font>
							</td>
							<!-- FECHA EXP. -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>FECHA<br/>EXPIRACIÓN</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="2"
					       cellspacing="0">
						<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;'99' and cbc:ID &lt;'133'  ">
								<!-- CREACION DE VARIBLES PARA DISGREGAR LOS DATOS CONCATENADOS EN LA DESCRIPCION  -->
								<xsl:variable name="varDescrip"
								              select="substring-before(cac:Item/cbc:Name,'*')"/>
								<xsl:variable name="varUM"
								              select="substring-before(substring-after(cac:Item/cbc:Name,'*'),'*')"/>
								<xsl:variable name="varLote"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*'),'*')"/>
								<xsl:variable name="varDescrip20"
								              select="substring-before(cac:Item/cbc:Description,'*')"/>
								<xsl:variable name="varUM20"
								              select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
								<xsl:variable name="varLote20"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp20"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
							<tr>
									<!-- ITEM -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!-- CODIGO -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!-- CANT. -->
									<td width="8%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:DeliveredQuantity"/>
										</font>
									</td>
									<!-- DESCRIP. -->
									<td width="48%"
									    align="left">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varDescrip20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varDescrip"/>
											</xsl:if>
										</font>
									</td>
									<!-- U.M. -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varUM20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varUM"/>
											</xsl:if>
										</font>
									</td>
									<!-- LOTE -->
									<td width="14%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<!-- <xsl:value-of select="$varLote"/> -->
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="substring($varLote20,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote20,21,30)"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="substring($varLote,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote,21,30)"/>
											</xsl:if>
										</font>
									</td>
									<!-- FECHA EXP. -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varFecExp20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varFecExp"/>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont"
							                select="$numColBl"/>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="DetallesEncabezado5">
		<table border="0"
		       width="100%"
		       cellpadding="0"
		       cellspacing="2">
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="4"
					       cellspacing="0">
						<tr>
							<!-- ITEM -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<!-- CODIGO -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<!-- CANT. -->
							<td width="8%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CANT.</strong>
								</font>
							</td>
							<!-- DESCRIP. -->
							<td width="48%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							<!-- U.M. -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>U.M.</strong>
								</font>
							</td>
							<!-- LOTE -->
							<td width="14%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>LOTE</strong>
								</font>
							</td>
							<!-- FECHA EXP. -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>FECHA<br/>EXPIRACIÓN</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="2"
					       cellspacing="0">
						<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;'160' and cbc:ID &lt;'201'  ">
								<!-- CREACION DE VARIBLES PARA DISGREGAR LOS DATOS CONCATENADOS EN LA DESCRIPCION  -->
								<xsl:variable name="varDescrip"
								              select="substring-before(cac:Item/cbc:Name,'*')"/>
								<xsl:variable name="varUM"
								              select="substring-before(substring-after(cac:Item/cbc:Name,'*'),'*')"/>
								<xsl:variable name="varLote"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*'),'*')"/>
								<xsl:variable name="varDescrip20"
								              select="substring-before(cac:Item/cbc:Description,'*')"/>
								<xsl:variable name="varUM20"
								              select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
								<xsl:variable name="varLote20"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp20"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
							<tr>
									<!-- ITEM -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!-- CODIGO -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!-- CANT. -->
									<td width="8%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:DeliveredQuantity"/>
										</font>
									</td>
									<!-- DESCRIP. -->
									<td width="48%"
									    align="left">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varDescrip20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varDescrip"/>
											</xsl:if>
										</font>
									</td>
									<!-- U.M. -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varUM20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varUM"/>
											</xsl:if>
										</font>
									</td>
									<!-- LOTE -->
									<td width="14%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<!-- <xsl:value-of select="$varLote"/> -->
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="substring($varLote20,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote20,21,30)"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="substring($varLote,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote,21,30)"/>
											</xsl:if>
										</font>
									</td>
									<!-- FECHA EXP. -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varFecExp20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varFecExp"/>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont"
							                select="$numColBl"/>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="DetallesEncabezado6">
		<table border="0"
		       width="100%"
		       cellpadding="0"
		       cellspacing="2">
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="4"
					       cellspacing="0">
					<tr>
							<!-- ITEM -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<!-- CODIGO -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<!-- CANT. -->
							<td width="8%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CANT.</strong>
								</font>
							</td>
							<!-- DESCRIP. -->
							<td width="48%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							<!-- U.M. -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>U.M.</strong>
								</font>
							</td>
							<!-- LOTE -->
							<td width="14%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>LOTE</strong>
								</font>
							</td>
							<!-- FECHA EXP. -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>FECHA<br/>EXPIRACIÓN</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="2"
					       cellspacing="0">
						<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;'200' and cbc:ID &lt;'241'  ">
								<!-- CREACION DE VARIBLES PARA DISGREGAR LOS DATOS CONCATENADOS EN LA DESCRIPCION  -->
								<xsl:variable name="varDescrip"
								              select="substring-before(cac:Item/cbc:Name,'*')"/>
								<xsl:variable name="varUM"
								              select="substring-before(substring-after(cac:Item/cbc:Name,'*'),'*')"/>
								<xsl:variable name="varLote"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*'),'*')"/>
								<xsl:variable name="varDescrip20"
								              select="substring-before(cac:Item/cbc:Description,'*')"/>
								<xsl:variable name="varUM20"
								              select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
								<xsl:variable name="varLote20"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp20"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
							<tr>
									<!-- ITEM -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!-- CODIGO -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!-- CANT. -->
									<td width="8%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:DeliveredQuantity"/>
										</font>
									</td>
									<!-- DESCRIP. -->
									<td width="48%"
									    align="left">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varDescrip20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varDescrip"/>
											</xsl:if>
										</font>
									</td>
									<!-- U.M. -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varUM20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varUM"/>
											</xsl:if>
										</font>
									</td>
									<!-- LOTE -->
									<td width="14%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<!-- <xsl:value-of select="$varLote"/> -->
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="substring($varLote20,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote20,21,30)"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="substring($varLote,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote,21,30)"/>
											</xsl:if>
										</font>
									</td>
									<!-- FECHA EXP. -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varFecExp20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varFecExp"/>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont"
							                select="$numColBl"/>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="DetallesEncabezado7">
		<table border="0"
		       width="100%"
		       cellpadding="0"
		       cellspacing="2">
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="4"
					       cellspacing="0">
						<tr>
							<!-- ITEM -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<!-- CODIGO -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<!-- CANT. -->
							<td width="8%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CANT.</strong>
								</font>
							</td>
							<!-- DESCRIP. -->
							<td width="48%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							<!-- U.M. -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>U.M.</strong>
								</font>
							</td>
							<!-- LOTE -->
							<td width="14%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>LOTE</strong>
								</font>
							</td>
							<!-- FECHA EXP. -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>FECHA<br/>EXPIRACIÓN</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="2"
					       cellspacing="0">
						<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;'240' and cbc:ID &lt;'281'  ">
								<!-- CREACION DE VARIBLES PARA DISGREGAR LOS DATOS CONCATENADOS EN LA DESCRIPCION  -->
								<xsl:variable name="varDescrip"
								              select="substring-before(cac:Item/cbc:Name,'*')"/>
								<xsl:variable name="varUM"
								              select="substring-before(substring-after(cac:Item/cbc:Name,'*'),'*')"/>
								<xsl:variable name="varLote"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*'),'*')"/>
								<xsl:variable name="varDescrip20"
								              select="substring-before(cac:Item/cbc:Description,'*')"/>
								<xsl:variable name="varUM20"
								              select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
								<xsl:variable name="varLote20"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp20"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
							<tr>
									<!-- ITEM -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!-- CODIGO -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!-- CANT. -->
									<td width="8%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:DeliveredQuantity"/>
										</font>
									</td>
									<!-- DESCRIP. -->
									<td width="48%"
									    align="left">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varDescrip20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varDescrip"/>
											</xsl:if>
										</font>
									</td>
									<!-- U.M. -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varUM20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varUM"/>
											</xsl:if>
										</font>
									</td>
									<!-- LOTE -->
									<td width="14%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<!-- <xsl:value-of select="$varLote"/> -->
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="substring($varLote20,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote20,21,30)"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="substring($varLote,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote,21,30)"/>
											</xsl:if>
										</font>
									</td>
									<!-- FECHA EXP. -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varFecExp20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varFecExp"/>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont"
							                select="$numColBl"/>
						</xsl:call-template>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="DetallesEncabezado8">
		<table border="0"
		       width="100%"
		       cellpadding="0"
		       cellspacing="2">
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="4"
					       cellspacing="0">
						<tr>
							<!-- ITEM -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>ITEM</strong>
								</font>
							</td>
							<!-- CODIGO -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CODIGO</strong>
								</font>
							</td>
							<!-- CANT. -->
							<td width="8%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>CANT.</strong>
								</font>
							</td>
							<!-- DESCRIP. -->
							<td width="54%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>DESCRIPCIÓN </strong>
								</font>
							</td>
							<!-- U.M. -->
							<td width="5%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>U.M.</strong>
								</font>
							</td>
							<!-- LOTE -->
							<td width="8%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>LOTE</strong>
								</font>
							</td>
							<!-- FECHA EXP. -->
							<td width="10%"
							    align="center">
								<font face="Arial, Helvetica, sans-serif"
								      size="1">
									<strong>FECHA<br/>EXPIRACIÓN</strong>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table rules="cols"
					       border="1"
					       width="100%"
					       bordercolor="#000000"
					       cellpadding="2"
					       cellspacing="0">
						<xsl:for-each select="//cac:DespatchLine">
							<xsl:if test="cbc:ID &gt;'280' and cbc:ID &lt;'321'  ">
								<!-- CREACION DE VARIBLES PARA DISGREGAR LOS DATOS CONCATENADOS EN LA DESCRIPCION  -->
								<xsl:variable name="varDescrip"
								              select="substring-before(cac:Item/cbc:Name,'*')"/>
								<xsl:variable name="varUM"
								              select="substring-before(substring-after(cac:Item/cbc:Name,'*'),'*')"/>
								<xsl:variable name="varLote"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Name,'*'),'*'),'*'),'*')"/>
								<xsl:variable name="varDescrip20"
								              select="substring-before(cac:Item/cbc:Description,'*')"/>
								<xsl:variable name="varUM20"
								              select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
								<xsl:variable name="varLote20"
								              select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
								<xsl:variable name="varFecExp20"
								              select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
							<tr>
									<!-- ITEM -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:ID"/>
										</font>
									</td>
									<!-- CODIGO -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
										</font>
									</td>
									<!-- CANT. -->
									<td width="8%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:value-of select="cbc:DeliveredQuantity"/>
										</font>
									</td>
									<!-- DESCRIP. -->
									<td width="48%"
									    align="left">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varDescrip20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varDescrip"/>
											</xsl:if>
										</font>
									</td>
									<!-- U.M. -->
									<td width="5%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varUM20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varUM"/>
											</xsl:if>
										</font>
									</td>
									<!-- LOTE -->
									<td width="14%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<!-- <xsl:value-of select="$varLote"/> -->
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="substring($varLote20,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote20,21,30)"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="substring($varLote,1,20)"/>
												<br/>
												<xsl:value-of select="substring($varLote,21,30)"/>
											</xsl:if>
										</font>
									</td>
									<!-- FECHA EXP. -->
									<td width="10%"
									    align="center">
										<font face="Arial, Helvetica, sans-serif"
										      size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<xsl:value-of select="$varFecExp20"/>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="$varFecExp"/>
											</xsl:if>
										</font>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
						<!-- <xsl:call-template name="lineaBl">
							<xsl:with-param name="cont" select="$numColBl"/>
							<table>
								<tr>
									<td align="center" valign="top" width="15%">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:call-template name="total"/>
										</font>
									</td>
								</tr>
							</table>
						</xsl:call-template> -->
						<xsl:call-template name="lineaBl">
							<xsl:with-param name="cont"
							                select="$numColBl"/>
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
				<!-- ITEM -->
				<td width="5%"
				    align="center">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.1">&#xA0; 
					</font>
				</td>
				<!-- CODIGO -->
				<td width="10%"
				    align="center"
				    valign="top">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.1">&#xA0;
					</font>
				</td>
				<!-- CANT. -->
				<td width="8%"
				    align="center"
				    valign="top">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.1">&#xA0; 
					</font>
				</td>
				<!-- DESCRIP.-->
				<td width="48%"
				    align="center">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.1">&#xA0; 
					</font>
				</td>
				<!-- U.M. -->
				<td width="5%"
				    align="center"
				    valign="top">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.1">&#xA0; 
					</font>
				</td>
				<!-- LOTE -->
				<td width="14%"
				    align="center"
				    valign="top">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.1">&#xA0; 
					</font>
				</td>
				<!-- FEC.EXP.-->
				<td width="10%"
				    align="center"
				    valign="top">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.1">&#xA0;
					</font>
				</td>
			</tr>
			<xsl:call-template name="lineaBl">
				<xsl:with-param name="cont"
				                select="$cont - 1"/>
			</xsl:call-template>
		</xsl:if>
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
	<xsl:template name="tmpDocumentosReferencias">
		<table rules="cols"
		       border="1"
		       width="100%"
		       bordercolor="#000000"
		       cellpadding="4"
		       cellspacing="0">
			<tr>
				<td width="20%"
				    align="LEFT">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.1">
						<strong>DOCUMENTOS DE REFERENCIA:</strong>
					</font>
				</td>
				<td width="80%"
				    align="left"
				    colspan="3">
					<font face="Arial, Helvetica, sans-serif"
					      size="0.1">
						<xsl:value-of select="normalize-space(concat(concat(normalize-space($varDocRef1), ' '), $varDocRef2))"/>
					</font>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Ejemplo_retencion_final.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->