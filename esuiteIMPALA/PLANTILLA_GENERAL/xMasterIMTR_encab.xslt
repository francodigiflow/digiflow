<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" 
				xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" 
				xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" 
				xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
				xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" 
				xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" 
				xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
				xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				exclude-result-prefixes="cac cbc ccts ds ext pe pe1 pe2 qdt sac udt xsi">
	
				<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>
				
	<!--##TRAFIGURA##-->
	<xsl:template name="Encabezado_T">
		<table cellSpacing="0" cellPadding="2" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="60%">
						<xsl:call-template name="EncabezadoPeru_T"/>
					</td>
					<td vAlign="top" width="40%">
						<xsl:call-template name="EncabezadoRecuadro_T"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru_T">
	
		<table cellSpacing="0" cellPadding="2" width="100%" border="0"><tbody>
			
					<tr>
					     <td align="left" width = "100%">
						   <div style="width:45%; text-align:center">
						  <!-- <img src="logo<img src="logo_trafigura.jpg" width="182" height="73"/>-->
						   <img src="data:image/*;base64,[logo_1]" width="182" height="73" />
						   </div>
						 </td> 
					</tr >						
					<tr><td align="left" width="100%">
						<table cellSpacing="0" cellPadding="2" width="45%" border="0">
						<tr><td align="center">
						<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<br/><label style="text-align:center; font-size:16px; font-weight:bold">TRAFIGURA PERU SAC</label>
						<br/>AV. SANTO TORIBIO NRO 173
						<br/>(EDIFICIO REAL 8 - PISO 4)
						<br/>SAN ISIDRO - LIMA - LIMA
						<br/>TELEFONO: (511) 412 0800</font>
						</td></tr>
						</table>
					    </td>
					</tr></tbody>
		</table>
	
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro_T">
		<table borderColor="#999999" cellSpacing="0" cellPadding="4" width="100%" height="150" border="1"><tbody>
			<tr><td vAlign="top" width="100%" height="150" align="center">
					<font color="#1D43A9" size="4" face="Arial, Helvetica, sans-serif">
					<strong>
						<br/><xsl:if test="//cbc:UBLVersionID='2.0'">
						R.U.C.&#160;N°&#160;<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
   						R.U.C.&#160;N°&#160;<xsl:value-of select="//cac:Signature/cac:SignatoryParty/cac:PartyIdentification/cbc:ID"/>
						</xsl:if>
						<br/><br/>
						<xsl:call-template name="tipodocu_T"/>
						<br/>
						<xsl:call-template name="NFolio_T"/>
					</strong>
					</font>
				</td>
				</tr></tbody>
		</table>
	</xsl:template>
	<!--##TRAFIGURA##-->

	<!--##IMPALA##-->
	<xsl:template name="Encabezado_I">
		<table cellSpacing="0" cellPadding="2" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="60%">
						<xsl:call-template name="EncabezadoPeru_I"/>
					</td>
					<td vAlign="top" width="40%">
						<xsl:call-template name="EncabezadoRecuadro_I"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru_I">
	
		<table cellSpacing="0" cellPadding="2" width="100%" border="0"><tbody>
			
					<tr><td align="left" width = "100%">
						   <div style="width:45%; text-align:center">
						  <!-- <img src="logoimpala.jpg" width="170" height="100"/> -->
						  <img src="data:image/*;base64,[logo_1]"  width="170" height="100" />
						   </div>
						 </td> 
					</tr >						
					<tr><td align="left" width="100%">
						<div style="width:45%; text-align:center">
						<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<br/><label style="font-size:16px; font-weight:bold">IMPALA TERMINALS PERU S.A.C</label>
						<br/>Av. Contralmirante Mora N° 472
						<br/>Prov. Const Del Callao - Callao01
						<br/>Teléfono: (51-1) 414-3300
						<br/>&#160;</font>
						</div>
					    </td>
					</tr></tbody>
		</table>
	
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro_I">
		<table borderColor="#000000" cellSpacing="0" cellPadding="2" width="100%" border="1"><tbody>
			<tr>
			<td vAlign="top" width="100%" align="center">
				<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
				<br/><br/>
				<xsl:if test="//cbc:UBLVersionID='2.0'">
				&#160;
				<strong>R.U.C. 
				<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>
				</strong>
				</xsl:if>
				<xsl:if test="//cbc:UBLVersionID='2.1'">
   			    &#160;
				<strong>R.U.C.<xsl:value-of select="//cac:Signature/cac:SignatoryParty/cac:PartyIdentification/cbc:ID"/></strong>
			</xsl:if></font>
				<br/>&#160;
				<br/>&#160;
				<xsl:call-template name="tipodocu"/>
				<br/>&#160;
				<xsl:call-template name="NFolio"/>
				<br/>&#160;
				<!--</strong>-->
				<!--</font>-->
				</td>
				</tr></tbody>
		</table>
	</xsl:template>

	<!--##IMPALA##-->

	<!--##URION##-->
	<xsl:template name="Encabezado_U">
		<table cellSpacing="0" cellPadding="2" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="60%">
						<xsl:call-template name="EncabezadoPeru_U"/>
					</td>
					<td vAlign="top" width="40%">
						<xsl:call-template name="EncabezadoRecuadro_U"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru_U">
	
		<table cellSpacing="0" cellPadding="2" width="100%" border="0"><tbody>
			
					<tr><td align="left" width = "100%">
						   <div style="width:45%; text-align:center">
						   <!--<img src="logo_urion.jpg" /> -->
							<img src="data:image/*;base64,[logo_1]"/>
						   </div>
						 </td> 
					</tr >						
					<tr><td align="left" width="100%">
						<table cellSpacing="0" cellPadding="2" width="45%" border="0">
						<tr><td align="center">
						<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<br/><label style="text-align:center; font-size:12px; font-weight:bold">URION DEL PERU SOCIEDAD ANONIMA CERRADA</label>
						<br/>AV. SANTO TORIBIO NRO 173
						<br/>URB. EL ROSARIO
						<br/>SAN ISIDRO - LIMA - LIMA
						<br/>TELEFONO: (511) 412 0800</font>
						</td></tr>
						</table>
					    </td>
					</tr></tbody>
		</table>
	
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro_U">
		<table borderColor="#999999" cellSpacing="0" cellPadding="4" width="100%" height="150" border="1"><tbody>
			<tr><td vAlign="top" width="100%" height="150" align="center">
					<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
					<strong>
						<br/>R.U.C.&#160;N°&#160;<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>
						<br/><br/>
						<xsl:call-template name="tipodocu"/>
						<br/>
						<xsl:call-template name="NFolio"/>
					</strong>
					</font>
				</td>
				</tr></tbody>
		</table>
	</xsl:template>
	<!--##URION##-->

<!--##TRAFIGURA TRADING##-->
<xsl:template name="Encabezado_TT">
		<table cellSpacing="0" cellPadding="2" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="60%">
						<xsl:call-template name="EncabezadoPeru_TT"/>
					</td>
					<td vAlign="top" width="40%">
						<xsl:call-template name="EncabezadoRecuadro_TT"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru_TT">
	
		<table cellSpacing="0" cellPadding="2" width="100%" border="0"><tbody>
			
					<tr><td align="left" width = "100%">
						   <div style="width:45%; text-align:center">
						   <!--<img src="logo_trafigura.jpg" />-->
						   <img src="data:image/*;base64,[logo_1]"  />
						   </div>
						 </td> 
					</tr >						
					<tr><td align="left" width="100%">
						<table cellSpacing="0" cellPadding="2" width="45%" border="0">
						<tr><td align="center">
						<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<br/><label style="text-align:center; font-size:12px; font-weight:bold">
						TRAFIGURA TRADING S.A.C.</label>
						<br/>AV. SANTO TORIBIO NRO 173
						<br/>(EDIFICIO REAL 8 PISO 4)
						<br/>SAN ISIDRO - LIMA - LIMA
						<br/>TELEFONO: (511) 412 0800</font>
						</td></tr>
						</table>
					    </td>
					</tr></tbody>
		</table>
	
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro_TT">
		<table borderColor="#999999" cellSpacing="0" cellPadding="4" width="100%" height="150" border="1"><tbody>
			<tr><td vAlign="top" width="100%" height="150" align="center">
					<font color="#000000" size="4" face="Arial, Helvetica, sans-serif">
					<strong>
						<br/>R.U.C.&#160;N°&#160;<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>
						<br/><br/>
						<xsl:call-template name="tipodocu"/>
						<br/>
						<xsl:call-template name="NFolio"/>
					</strong>
					</font>
				</td>
				</tr></tbody>
		</table>
	</xsl:template>
	<!--##TRAFIGURA TRADING##-->

<!--##TRAFIGURA METALES BÁSICOS##-->
<xsl:template name="Encabezado_TM">
		<table cellSpacing="0" cellPadding="2" width="100%" border="0">
			<tbody>
				<tr width="100%">
					<td vAlign="top" width="60%">
						<xsl:call-template name="EncabezadoPeru_TM"/>
					</td>
					<td vAlign="top" width="40%">
						<xsl:call-template name="EncabezadoRecuadro_TM"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="EncabezadoPeru_TM">
	
		<table cellSpacing="0" cellPadding="2" width="100%" border="0"><tbody>
			
					<tr><td align="left" width = "100%">
						   <div style="width:45%; text-align:center">
						   <!--<img src="logo_trafigura.jpg" /> -->
						   <img src="data:image/*;base64,[logo_1]"/>
						   </div>
						 </td> 
					</tr >						
					<tr><td align="left" width="100%">
						<table cellSpacing="0" cellPadding="2" width="45%" border="0">
						<tr><td align="center">
						<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">
						<br/><label style="text-align:center; font-size:12px; font-weight:bold">
						TRAFIGURA METALES BÁSICOS S.A.C.</label>
						<br/>AV. SANTO TORIBIO NRO 173
						<br/>(TORRE REAL 8, PISO 4)
						<br/>SAN ISIDRO - LIMA - LIMA
						<br/>TELEFONO: (511) 412 0800</font>
						</td></tr>
						</table>
					    </td>
					</tr></tbody>
		</table>
	
	</xsl:template>

	<xsl:template name="EncabezadoRecuadro_TM">
		<table borderColor="#999999" cellSpacing="0" cellPadding="4" width="100%" height="150" border="1"><tbody>
			<tr><td vAlign="top" width="100%" height="150" align="center">
					<font color="#FE0404" size="4" face="Arial, Helvetica, sans-serif">
					<strong>
						<br/>
						<xsl:if test="//cbc:UBLVersionID='2.0'">
						R.U.C.&#160;N°&#160;<xsl:value-of select="format-number(//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID,'#########','pen')"/>
						</xsl:if>
						<xsl:if test="//cbc:UBLVersionID='2.1'">
   							R.U.C.&#160;N°&#160;<xsl:value-of select="//cac:Signature/cac:SignatoryParty/cac:PartyIdentification/cbc:ID"/>
			</xsl:if>
						<br/><br/>
						<xsl:call-template name="tipodocu_TM"/>
						<br/>
						<xsl:call-template name="NFolio_TM"/>
					</strong>
					</font>
				</td>
				</tr></tbody>
		</table>
	</xsl:template>
	<!--##TRAFIGURA METALES BASICOS##-->



	<xsl:template name="tipodocu_T">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#1D43A9" size="3" face="Arial, Helvetica, sans-serif">FACTURA ELECTRÓNICA</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#1D43A9" size="3" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRÓNICA</font></xsl:when>
			<xsl:otherwise>
         	<xsl:if test="/pe1:CreditNote"><font color="#1D43A9" size="3" face="Arial, Helvetica, sans-serif">NOTA DE CREDITO ELECTRÓNICA</font></xsl:if>
         	<xsl:if test="/pe2:DebitNote"><font color="#1D43A9" size="3" face="Arial, Helvetica, sans-serif">NOTA DE DEBITO ELECTRÓNICA</font></xsl:if>      
      		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="tipodocu">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="3" face="Arial, Helvetica, sans-serif"><b>FACTURA ELECTRÓNICA</b></font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="3" face="Arial, Helvetica, sans-serif"><b>BOLETA DE VENTA ELECTRÓNICA</b></font></xsl:when>
			<xsl:otherwise>
         	<xsl:if test="/pe1:CreditNote"><font color="#000000" size="3" face="Arial, Helvetica, sans-serif"><b>NOTA DE CREDITO ELECTRÓNICA</b></font></xsl:if>
         	<xsl:if test="/pe2:DebitNote"><font color="#000000" size="3" face="Arial, Helvetica, sans-serif"><b>NOTA DE DEBITO ELECTRÓNICA</b></font></xsl:if>      
      		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="tipodocu_TM">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#FE0404" size="3" face="Arial, Helvetica, sans-serif">FACTURA ELECTRÓNICA</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#FE0404" size="3" face="Arial, Helvetica, sans-serif">BOLETA DE VENTA ELECTRÓNICA</font></xsl:when>
			<xsl:otherwise>
         	<xsl:if test="/pe1:CreditNote"><font color="#FE0404" size="3" face="Arial, Helvetica, sans-serif">NOTA DE CREDITO ELECTRÓNICA</font></xsl:if>
         	<xsl:if test="/pe2:DebitNote"><font color="#FE0404" size="3" face="Arial, Helvetica, sans-serif">NOTA DE DEBITO ELECTRÓNICA</font></xsl:if>      
      		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="aviso">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='01'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Factura Electrónica</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode='03'"><font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Boleta de Venta Electrónica</font></xsl:when>
			<xsl:otherwise>
         	<xsl:if test="/pe1:CreditNote"><font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de Crédito Electrónica</font></xsl:if>
         	<xsl:if test="/pe2:DebitNote"><font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Nota de Débito Electrónica</font></xsl:if>      
      	</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="NFolio_T">
		<br/>
		
		<font color="#1D43A9" size="3" face="Arial, Helvetica, sans-serif">
		<xsl:if test="/pe:Invoice">
		<xsl:value-of select="substring-before(/pe:Invoice/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe:Invoice/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
		<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe1:CreditNote/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
		<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe2:DebitNote/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		</font>
		<br/>
	</xsl:template>
<xsl:template name="NFolio">
		<br/>
		
		<font color="#000000" size="3" face="Arial, Helvetica, sans-serif">
		
		<xsl:if test="/pe:Invoice"><b>
		<xsl:value-of select="substring-before(/pe:Invoice/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe:Invoice/cbc:ID,'-'),'00000000')"/></b>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
		<b>
		<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe1:CreditNote/cbc:ID,'-'),'00000000')"/></b>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
		<b>
		<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe2:DebitNote/cbc:ID,'-'),'00000000')"/></b>
		</xsl:if>
		</font>
		<br/>
	</xsl:template>

	<xsl:template name="NFolio_TM">
		<br/>
		
		<font color="#FE0404" size="3" face="Arial, Helvetica, sans-serif">
		<xsl:if test="/pe:Invoice">
		<xsl:value-of select="substring-before(/pe:Invoice/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe:Invoice/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<xsl:if test="/pe1:CreditNote">
		<xsl:value-of select="substring-before(/pe1:CreditNote/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe1:CreditNote/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		<xsl:if test="/pe2:DebitNote">
		<xsl:value-of select="substring-before(/pe2:DebitNote/cbc:ID,'-')"/>-
		<xsl:value-of select="format-number(substring-after(/pe2:DebitNote/cbc:ID,'-'),'00000000')"/>
		</xsl:if>
		</font>
		<br/>
	</xsl:template>
	
	<xsl:template match="/">
		<html><head></head>
			<body/>
		</html>
	</xsl:template>


	<!--</xsl:if>-->

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="..\20555286831_2015090901FF1100111247.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="bWarnings" value="true"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->