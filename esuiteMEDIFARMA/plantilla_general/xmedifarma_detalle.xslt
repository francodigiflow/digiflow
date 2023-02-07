<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
                xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2">

	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>



	<xsl:template name="DetallesEncabezado1">
		<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
			<tr>
				<th width="3%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">ITEM</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CODIGO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CANT</font>
				</th>
				<th width="27%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DESCRIPCIÓN</font>
				</th>
				<th width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">UND</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">PRECIO<br/>VTA UNIT</font>
				</th>
				<th width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">LOTE</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>BRUTO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO1</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO2</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO3</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO4</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO5</font>
				</th>
				<th width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>VENTA</font>
				</th>
			</tr>

			<tr>
				<td colspan="14">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
					</table>
				</td>
			</tr>

			<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
			<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'31'  ">
				<tr>
					<!--ITEM-->
					<td width="3%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>
						</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) = 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>&#xA0;
							</xsl:if>
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) > 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.0000','pen')"/>&#xA0;
							</xsl:if>
						</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="27%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="8%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
				<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'31'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:CreditedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>


					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
			<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'31'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:DebitedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:call-template name="lineaB1">
				<xsl:with-param name="cont" select="$numColBl"/>
			</xsl:call-template>
		</table>
	</xsl:template>

	<xsl:template name="DetallesEncabezado2">
		<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
			<tr>
				<th width="3%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">ITEM</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CODIGO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CANT</font>
				</th>
				<th width="22%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DESCRIPCIÓN</font>
				</th>
				<th width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">UND</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">PRECIO<br/>VTA UNIT</font>
				</th>
				<th width="13%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">LOTE</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>BRUTO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO1</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO2</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO3</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO4</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO5</font>
				</th>
				<th width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>VENTA</font>
				</th>
			</tr>

			<tr>
				<td colspan="14">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
					</table>
				</td>
			</tr>

			<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
				<xsl:if test="cbc:ID &gt;'30' and cbc:ID &lt;'61'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>
						</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) = 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>&#xA0;
							</xsl:if>
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) > 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.0000','pen')"/>&#xA0;
							</xsl:if>
						</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="24%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
					<xsl:if test="cbc:ID &gt;'30' and cbc:ID &lt;'61'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:CreditedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>


					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
				<xsl:if test="cbc:ID &gt;'30' and cbc:ID &lt;'61'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:DebitedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:call-template name="lineaB1">
				<xsl:with-param name="cont" select="$numColBl"/>
			</xsl:call-template>
		</table>
	</xsl:template>

	<xsl:template name="DetallesEncabezado3">
		<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
			<tr>
				<th width="3%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">ITEM</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CODIGO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CANT</font>
				</th>
				<th width="22%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DESCRIPCIÓN</font>
				</th>
				<th width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">UND</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">PRECIO<br/>VTA UNIT</font>
				</th>
				<th width="13%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">LOTE</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>BRUTO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO1</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO2</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO3</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO4</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO5</font>
				</th>
				<th width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>VENTA</font>
				</th>
			</tr>

			<tr>
				<td colspan="14">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
					</table>
				</td>
			</tr>

			<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
			<xsl:if test="cbc:ID &gt;'60' and cbc:ID &lt;'91'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>
						</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) = 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>&#xA0;
							</xsl:if>
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) > 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.0000','pen')"/>&#xA0;
							</xsl:if>
						</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="24%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
					<xsl:if test="cbc:ID &gt;'60' and cbc:ID &lt;'91'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:CreditedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>


					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
			<xsl:if test="cbc:ID &gt;'60' and cbc:ID &lt;'91'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:DebitedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:call-template name="lineaB1">
				<xsl:with-param name="cont" select="$numColBl"/>
			</xsl:call-template>
		</table>
	</xsl:template>

	<xsl:template name="DetallesEncabezado4">
		<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
			<tr>
				<th width="3%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">ITEM</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CODIGO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CANT</font>
				</th>
				<th width="22%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DESCRIPCIÓN</font>
				</th>
				<th width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">UND</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">PRECIO<br/>VTA UNIT</font>
				</th>
				<th width="13%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">LOTE</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>BRUTO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO1</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO2</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO3</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO4</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO5</font>
				</th>
				<th width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>VENTA</font>
				</th>
			</tr>

			<tr>
				<td colspan="14">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
					</table>
				</td>
			</tr>

			<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
				<xsl:if test="cbc:ID &gt;'90' and cbc:ID &lt;'121'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>
						</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) = 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>&#xA0;
							</xsl:if>
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) > 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.0000','pen')"/>&#xA0;
							</xsl:if>
						</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="24%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
					<xsl:if test="cbc:ID &gt;'90' and cbc:ID &lt;'121'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:CreditedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>


					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
				<xsl:if test="cbc:ID &gt;'90' and cbc:ID &lt;'121'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:DebitedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:call-template name="lineaB1">
				<xsl:with-param name="cont" select="$numColBl"/>
			</xsl:call-template>
		</table>
	</xsl:template>

	<xsl:template name="DetallesEncabezado5">
		<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
			<tr>
				<th width="3%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">ITEM</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CODIGO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CANT</font>
				</th>
				<th width="22%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DESCRIPCIÓN</font>
				</th>
				<th width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">UND</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">PRECIO<br/>VTA UNIT</font>
				</th>
				<th width="13%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">LOTE</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>BRUTO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO1</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO2</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO3</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO4</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO5</font>
				</th>
				<th width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>VENTA</font>
				</th>
			</tr>

			<tr>
				<td colspan="14">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
					</table>
				</td>
			</tr>

			<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
			<xsl:if test="cbc:ID &gt;'120' and cbc:ID &lt;'151'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>
						</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) = 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>&#xA0;
							</xsl:if>
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) > 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.0000','pen')"/>&#xA0;
							</xsl:if>
						</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="24%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
				<xsl:if test="cbc:ID &gt;'120' and cbc:ID &lt;'151'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:CreditedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>


					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
			<xsl:if test="cbc:ID &gt;'120' and cbc:ID &lt;'151'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:DebitedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:call-template name="lineaB1">
				<xsl:with-param name="cont" select="$numColBl"/>
			</xsl:call-template>
		</table>
	</xsl:template>

	<xsl:template name="DetallesEncabezado6">
		<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
			<tr>
				<th width="3%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">ITEM</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CODIGO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CANT</font>
				</th>
				<th width="22%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DESCRIPCIÓN</font>
				</th>
				<th width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">UND</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">PRECIO<br/>VTA UNIT</font>
				</th>
				<th width="13%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">LOTE</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>BRUTO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO1</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO2</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO3</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO4</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO5</font>
				</th>
				<th width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>VENTA</font>
				</th>
			</tr>

			<tr>
				<td colspan="14">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
					</table>
				</td>
			</tr>

			<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
			<xsl:if test="cbc:ID &gt;'150' and cbc:ID &lt;'181'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>
						</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) = 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>&#xA0;
							</xsl:if>
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) > 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.0000','pen')"/>&#xA0;
							</xsl:if>
						</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="24%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
				<xsl:if test="cbc:ID &gt;'150' and cbc:ID &lt;'181'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:CreditedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>


					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
			<xsl:if test="cbc:ID &gt;'150' and cbc:ID &lt;'181'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:DebitedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:call-template name="lineaB1">
				<xsl:with-param name="cont" select="$numColBl"/>
			</xsl:call-template>
		</table>
	</xsl:template>

	<xsl:template name="DetallesEncabezado7">
	
		<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
			<tr>
				<th width="3%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">ITEM</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CODIGO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CANT</font>
				</th>
				<th width="22%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DESCRIPCIÓN</font>
				</th>
				<th width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">UND</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">PRECIO<br/>VTA UNIT</font>
				</th>
				<th width="13%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">LOTE</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>BRUTO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO1</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO2</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO3</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO4</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO5</font>
				</th>
				<th width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>VENTA</font>
				</th>
			</tr>

			<tr>
				<td colspan="14">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
					</table>
				</td>
			</tr>

			<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
			<xsl:if test="cbc:ID &gt;'180' and cbc:ID &lt;'211'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>
						</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) = 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>&#xA0;
							</xsl:if>
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) > 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.0000','pen')"/>&#xA0;
							</xsl:if>
						</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="24%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
				<xsl:if test="cbc:ID &gt;'180' and cbc:ID &lt;'211'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:CreditedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>


					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
			<xsl:if test="cbc:ID &gt;'180' and cbc:ID &lt;'211'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:DebitedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:call-template name="lineaB1">
				<xsl:with-param name="cont" select="$numColBl"/>
			</xsl:call-template>
		</table>
	</xsl:template>

	<xsl:template name="DetallesEncabezado8">
		<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
			<tr>
				<th width="3%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">ITEM</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CODIGO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CANT</font>
				</th>
				<th width="22%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DESCRIPCIÓN</font>
				</th>
				<th width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">UND</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">PRECIO<br/>VTA UNIT</font>
				</th>
				<th width="13%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">LOTE</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>BRUTO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO1</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO2</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO3</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO4</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO5</font>
				</th>
				<th width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>VENTA</font>
				</th>
			</tr>

			<tr>
				<td colspan="14">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
					</table>
				</td>
			</tr>

			<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
			<xsl:if test="cbc:ID &gt;'210' and cbc:ID &lt;'241'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>
						</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) = 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>&#xA0;
							</xsl:if>
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) > 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.0000','pen')"/>&#xA0;
							</xsl:if>
						</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="24%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
				<xsl:if test="cbc:ID &gt;'210' and cbc:ID &lt;'241'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:CreditedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>


					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
			<xsl:if test="cbc:ID &gt;'210' and cbc:ID &lt;'241'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:DebitedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:call-template name="lineaB1">
				<xsl:with-param name="cont" select="$numColBl"/>
			</xsl:call-template>
		</table>
	</xsl:template>





	<xsl:template name="DetallesEncabezado2_other">
		<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
			<tr>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">ITEM</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CODIGO</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CANT</font>
				</th>
				<th width="26%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DESCRIPCIÓN</font>
				</th>
				<th width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">UND</font>
				</th>
				<th width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">PRECIO<br/>VTA UNIT</font>
				</th>
				<th width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">LOTE</font>
				</th>
				<th width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>BRUTO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO1</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO2</font>
				</th>
				<th width="12%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>VENTA</font>
				</th>
			</tr>

			<tr>
				<td colspan="11">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
					</table>
				</td>
			</tr>

			<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
				<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'31'  ">
				<tr>
					<!-- ITEM -->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;
						</font>
					</td>
					<!-- CODIGO -->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!-- CANT -->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) = 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>&#xA0;
							</xsl:if>
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) > 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.0000','pen')"/>&#xA0;
							</xsl:if>
						</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					

					<!-- DESCRIPCION -->
					<!-- PARTIDA ARANCELARIA -->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip" />
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!-- UNID -->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed" />
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;
						</font>
					</td>
					<!-- LOTE -->					
					<td width="10%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;
						</font>
					</td>
					<!-- Valor Bruto -->					
					<td width="10%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- DCTO1 -->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- DCTO2 -->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- IMPORTE -->					
					<td width="12%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
				<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'31'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;
						</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:CreditedQuantity"/>&#xA0;
						</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;
						</font>
					</td>
					<!--LOTE-->					
					<td width="10%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;
						</font>
					</td>
					<!--Valor Bruto-->					
					<td width="10%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- DCTO1 -->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- DCTO2 -->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!--IMPORTE-->
					<td width="12%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
				<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'31'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;
						</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:DebitedQuantity"/>&#xA0;
						</font>
					</td>

			

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;
						</font>
					</td>
					<!--LOTE-->					
					<td width="10%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;
						</font>
					</td>
					<!--Valor Bruto-->					
					<td width="10%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- DCTO1 -->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- DCTO2 -->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!--IMPORTE-->
					<td width="12%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>


			<xsl:call-template name="lineaB4">
				<xsl:with-param name="cont" select="$numColBl"/>
			</xsl:call-template>
		</table>
	</xsl:template>
	
	<xsl:template name="DetallesEncabezado3_fact">
		<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
			<tr>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">ITEM</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CODIGO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CANT</font>
				</th>
				<th width="26%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DESCRIPCIÓN</font>
				</th>
				<th width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">UND</font>
				</th>
				<th width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">PRECIO<br/>VTA UNIT</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">LOTE</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">FECHA<br/>EXP</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>BRUTO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO1</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO2</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO3</font>
				</th>
				<!--<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO4</font>
				</th>-->
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO5</font>
				</th>
				<th width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>VENTA</font>
				</th>
			</tr>

			<tr>
				<td colspan="14">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
					</table>
				</td>
			</tr>

			<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
			<xsl:if test="cbc:ID &gt;'60' and cbc:ID &lt;'91'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>
						</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) = 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>&#xA0;
							</xsl:if>
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) > 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.0000','pen')"/>&#xA0;
							</xsl:if>
						</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					
					<!--FECHA EXPIRACIÓN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:if test="$FechExp!=''">
								<xsl:call-template name="FechaExpir">
									<xsl:with-param name="FechExp1" select="cbc:ID"/>
									<xsl:with-param name="FechExp2" select="$FechExp"/>
								</xsl:call-template>
							</xsl:if>
							<!--<xsl:if test="$FechExp = ''">
								<xsl:value-of select="format-number('0.00','###,###,##0.00', 'pen')" />
							</xsl:if>-->
							<!--<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>-->&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>

					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<!--<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>-->
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->					
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
			<xsl:if test="cbc:ID &gt;'60' and cbc:ID &lt;'91'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:CreditedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>


					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					
					<!--FECHA DE EXPIRACIÓN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<!--<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>-->&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<!--<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>-->
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
			<xsl:if test="cbc:ID &gt;'60' and cbc:ID &lt;'91'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:DebitedQuantity"/>&#xA0;</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;</font>
					</td>
					<!--LOTE-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;</font>
					</td>
					
					<!--FECHA DE EXPIRACIÓN-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<!--<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>-->&#xA0;</font>
					</td>
					<!--Valor Bruto-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--LAB-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--BONIF-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--ADIC-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varAdic,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--FINAN-->					
					<!--<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varFinan,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>-->
					<!--DESCUENTO 5-->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varDscto5,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
					<!--IMPORTE-->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:call-template name="lineaB1">
				<xsl:with-param name="cont" select="$numColBl"/>
			</xsl:call-template>
		</table>
	</xsl:template>

	<xsl:template name="DetallesEncabezado4_export_exone1">
		<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="1" cellspacing="0">
			<tr>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">ITEM</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CODIGO</font>
				</th>
				<th width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">CANT</font>
				</th>
				<th width="26%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DESCRIPCIÓN</font>
				</th>
				<th width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">UND</font>
				</th>
				<th width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">PRECIO<br/>VTA UNIT</font>
				</th>
				<th width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">LOTE</font>
				</th>
				<th width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>BRUTO</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO1</font>
				</th>
				<th width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">DCTO2</font>
				</th>
				<th width="12%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2">VALOR<br/>VENTA</font>
				</th>
			</tr>

			<tr>
				<td colspan="11">
					<table border="1" width="100%" bordercolor="#000000" cellpadding="0" cellspacing="0">
					</table>
				</td>
			</tr>

			<xsl:for-each select="/pe:Invoice/cac:InvoiceLine">
				<xsl:if test="cbc:ID &gt;'0' and cbc:ID &lt;'31'  ">
				<tr>
					<!-- ITEM -->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;
						</font>
					</td>
					<!-- CODIGO -->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!-- CANT -->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) = 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0','pen')"/>&#xA0;
							</xsl:if>
							<xsl:if test="string-length(substring-before(cbc:InvoicedQuantity,'.')) > 0">
								<xsl:value-of select="format-number(cbc:InvoicedQuantity,'###,###,##0.0000','pen')"/>&#xA0;
							</xsl:if>
						</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<!-- DESCRIPCION -->
					<!-- PARTIDA ARANCELARIA -->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip" />
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!-- UNID -->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed" />
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;
						</font>
					</td>
					<!-- LOTE -->					
					<td width="10%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;
						</font>
					</td>
					<!-- Valor Bruto -->					
					<td width="10%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- DCTO1 -->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- DCTO2 -->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- IMPORTE -->					
					<td width="12%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cbc:LineExtensionAmount,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe1:CreditNote/cac:CreditNoteLine">
				<xsl:if test="cbc:ID &gt;'90' and cbc:ID &lt;'121'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;
						</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:CreditedQuantity"/>&#xA0;
						</font>
					</td>

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;
						</font>
					</td>
					<!--LOTE-->					
					<td width="10%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;
						</font>
					</td>
					<!--Valor Bruto-->					
					<td width="10%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- DCTO1 -->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- DCTO2 -->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!--IMPORTE-->
					<td width="12%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="/pe2:DebitNote/cac:DebitNoteLine">
				<xsl:if test="cbc:ID &gt;'90' and cbc:ID &lt;'121'  ">
				<tr>
					<!--ITEM-->
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:ID"/>&#xA0;&#xA0;
						</font>
					</td>
					<!--CODIGO-->
					<td width="7%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
						</font>
					</td>
					<!--CANT-->
					<td width="7%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="cbc:DebitedQuantity"/>&#xA0;
						</font>
					</td>

			

					<xsl:variable name="varDescrip" select="substring-before(cac:Item/cbc:Description,'*')"/>
					<xsl:variable name="varValor_Partida" select="substring-before(substring-after(cac:Item/cbc:Description,'*'),'*')"/>
					<xsl:variable name="varLote" select="substring-before(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*')"/>
					<xsl:variable name="varVBruto" select="substring-before(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varLab" select="substring-before(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varBonif" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varAdic" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varFinan" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varDscto5" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varImporte" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>
					<xsl:variable name="varUndMed" select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after(cac:Item/cbc:Description,'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>

					<!--DESCRIPCION-->
					<!--PARTIDA ARANCELARIA-->
					<td width="26%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varDescrip"/>
						</font>
						<xsl:if test="$varValor_Partida!='-'">
							<br/>
							<font face="Arial, Helvetica, sans-serif" size="0.2">
								<xsl:value-of select="substring($varValor_Partida,1,4)"/>.
								<xsl:value-of select="substring($varValor_Partida,5,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,7,2)"/>.
								<xsl:value-of select="substring($varValor_Partida,9,2)"/>
							</font>
						</xsl:if>
					</td>
					<!--UNID-->
					<td width="4%" align="center">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varUndMed"/>
						</font>
					</td>
					<!-- PRECIO UNIT. LISTA -->
					<td width="9%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number(cac:Price/cbc:PriceAmount,'###,###,##0.0000','pen')"/>&#xA0;
						</font>
					</td>
					<!--LOTE-->					
					<td width="10%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="$varLote"/>&#xA0;
						</font>
					</td>
					<!--Valor Bruto-->					
					<td width="10%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varVBruto,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- DCTO1 -->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varLab,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!-- DCTO2 -->					
					<td width="5%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varBonif,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
					<!--IMPORTE-->
					<td width="12%" align="right">
						<font face="Arial, Helvetica, sans-serif" size="0.2">
							<xsl:value-of select="format-number($varImporte,'###,###,##0.00','pen')"/>&#xA0;
						</font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>


			<xsl:call-template name="lineaB4">
				<xsl:with-param name="cont" select="$numColBl"/>
			</xsl:call-template>
		</table>
	</xsl:template>

	<xsl:template name="lineaB1">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr height="10px">
				<td width="3%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="7%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="27%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="8%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
			</tr>
			<xsl:call-template name="lineaB1">
				<xsl:with-param name="cont" select="$cont - 2"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
<xsl:template name="lineaB4">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr height="10px">
				<td width="5%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="7%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="7%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="26%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="12%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				
			</tr>
			<xsl:call-template name="lineaB4">
				<xsl:with-param name="cont" select="$cont - 2"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
<xsl:template name="lineaB2">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr height="10px">
				<td width="5%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="7%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="7%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="26%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="10%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="12%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
			</tr>
			<xsl:call-template name="lineaB2">
				<xsl:with-param name="cont" select="$cont - 2"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="lineaB5">
		<xsl:param name="cont"/>
		<xsl:if test="$cont&gt;0">
			<tr height="10px">
				<td width="5%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="7%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="24%" align="center" valign="top">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="4%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="7%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="5%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
				<td width="9%" align="center">
					<font face="Arial, Helvetica, sans-serif" size="0.2"></font>
				</td>
			</tr>
			<xsl:call-template name="lineaB5">
				<xsl:with-param name="cont" select="$cont - 2"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\par" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->