<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">

	<xsl:template name="bottom_Simsa">
		<table borderColor="#000000" cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<!--<td vAlign="top" width="52%" align="center">
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
						<xsl:if test="pe:Codigo='17'">
								<xsl:variable name="varIncoterms" select="pe:Valor"/>
								<xsl:if test="$varIncoterms='1'">
									<xsl:call-template name="Incoterms"/>
								</xsl:if>
							</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='17'">
								<xsl:variable name="varIncoterms" select="pe1:Valor"/>
								<xsl:if test="$varIncoterms='1'">
									<xsl:call-template name="Incoterms"/>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
					<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='17'">
								<xsl:variable name="varIncoterms" select="pe2:Valor"/>
								<xsl:if test="$varIncoterms='1'">
									<xsl:call-template name="Incoterms"/>
								</xsl:if>
							</xsl:if>
						</xsl:for-each>
				</td>-->
					<!--<td vAlign="top" width="1%" align="center"/>-->
					<td vAlign="top" width="47%" align="center">
						<table borderColor="#000000" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td align="center">
										<xsl:call-template name="imp_timbre"/>
									</td>
								</tr>
								<tr>
									<td vAlign="baseline" width="50%" align="center">
										<font size="2" face="Arial, Helvetica, sans-serif">Representación impresa de la Factura Electrónica
											<br/>Podrá ser consultada en http://ecomprobantes.pe/TAYLOR/Formularios/frmInicio.aspx
											<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20109969452'">
											<br/>Autorizado mediante resolución: N° 018-005-0002469/SUNAT
											</xsl:if>
											<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20345286081'">
											<br/>Autorizado mediante resolución: N° 0340050005726/SUNAT
											</xsl:if>
											<br/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<!-- JDL : Pendiente Eliminar 
   <xsl:template name="bottom_hash">
      <table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
         <tbody>
            
			<tr>
               <td valign="baseline" width="50%" align="center">
                  <font face="Arial, Helvetica, sans-serif" size="2">
						Representación impresa de la Factura Electrónica
						<br/>
						Podrá ser consultada en http://www.ecomprobantes.pe/SIMSA
						<br/>
						<xsl:if test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20100025591'"> 
						Autorizado mediante resolución: N° XXXXXX
						</xsl:if>						              
                  </font>
               </td>
               <td valign="top" width="3%" align="center"/>
			   <td valign="top" width="47%" align="center">
			       <table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
				   		<tr>
         				<tbody>
			               <td align="center">
            			      	<xsl:call-template name="imp_timbre"/>
               				</td>
						</tbody>
						</tr>
					</table>
			   </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   -->

	<xsl:template name="imp_timbre">
		<table border="0" bordercolor="#000000" cellpadding="2" cellspacing="0" width="100%">
			<tr>
				<td width="40%" align="right">
					<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td valign="top" align="center">
								<font face="Arial" size="2">
									<!-- <img> -->
										<!-- <xsl:attribute name="src"> -->
											<!-- <xsl:call-template name="timbre"/> -->
										<!-- </xsl:attribute> -->
									<!-- </img> -->
									<img width="100" height="100" align="center" src="data:image/*;base64,[ted_1]" />
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
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

	<xsl:template name="DescripcionAdicional_BottomVolcan">
		<xsl:param name="resto"/>
		<xsl:variable name="adicional" select="substring-before($resto,'|')"/>
		<xsl:variable name="adicional1" select="substring-after($resto,':')"/>
		<tr>
			<td width="65%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="2">
					<b>
						<xsl:value-of select="substring-before($adicional,':')"/>
					</b>
				</font>
			</td>

			<td width="35%" align="left">
				<font face="Arial, Helvetica, sans-serif" size="2">

					<xsl:value-of select="substring-after($adicional,':')"/>
				</font>
			</td>
		</tr>
		<xsl:variable name="res" select="substring-after($adicional1,'|')"/>
		<xsl:if test="$res!=''">

			<xsl:call-template name="DescripcionAdicional_BottomVolcan">
				<xsl:with-param name="resto" select="$res"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<!-- INCOTERMS -->
	<xsl:template name="Incoterms">
		<table width="250px" border="1" bordercolor="#000000" cellpadding="3" cellspacing="0">

			<xsl:if test="//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount!=''">
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>TOTAL ITEMS</strong>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1002'">
									<xsl:value-of select="format-number(cbc:PayableAmount - //cac:LegalMonetaryTotal/cbc:ChargeTotalAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
			</xsl:if>

			<tr>
				<td width="20%" align="left">
					<font face="Arial, Helvetica, sans-serif" size="2">
						<strong>INCOTERMS</strong>
					</font>
				</td>
				<td align="right">
					<!-- INCOTERMS -->
					<font face="Arial, Helvetica, sans-serif" size="2">
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
							<xsl:if test="pe:Codigo='13'">
								<xsl:value-of select="pe:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
							<xsl:if test="pe1:Codigo='13'">
								<xsl:value-of select="pe1:Valor"/>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
							<xsl:if test="pe2:Codigo='13'">
								<xsl:value-of select="pe2:Valor"/>
							</xsl:if>
						</xsl:for-each>
					</font>
				</td>
				<tr>
					<td width="50%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>FREIGHT</strong>
						</font>
					</td>
					<td align="right">
						<!-- FREIGHT -->
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='14'">
									<xsl:value-of select="format-number(pe:Valor,'###,###,##0.00','pen')"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='14'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='14'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td width="20%" align="left">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>INSURANCE</strong>
						</font>
					</td>
					<td align="right">
						<!-- INSURANCE -->
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:DatoAdicional">
								<xsl:if test="pe:Codigo='15'">
									<xsl:value-of select="pe:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:DatoAdicional">
								<xsl:if test="pe1:Codigo='15'">
									<xsl:value-of select="pe1:Valor"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:DatoAdicional">
								<xsl:if test="pe2:Codigo='15'">
									<xsl:value-of select="pe2:Valor"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>TOTAL OTROS CARGOS</strong>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:value-of select="format-number(//cac:LegalMonetaryTotal/cbc:ChargeTotalAmount,'###,###,##0.00','pen')"/>
						</font>
					</td>
				</tr>
				<tr>
					<td>
						<font face="Arial, Helvetica, sans-serif" size="2">
							<strong>TOTAL INAFECTO</strong>
						</font>
					</td>
					<td align="right">
						<font face="Arial, Helvetica, sans-serif" size="2">
							<xsl:for-each select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
								<xsl:if test="cbc:ID='1002'">
									<xsl:value-of select="format-number(cbc:PayableAmount,'###,###,##0.00','pen')"/>
								</xsl:if>
							</xsl:for-each>
						</font>
					</td>
				</tr>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->