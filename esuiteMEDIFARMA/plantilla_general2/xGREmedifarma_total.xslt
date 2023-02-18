<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:ds="http://www.w3.org/2000/09/xmldsig#" 
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				xmlns:pe="urn:sunat:names:specification:ubl:peru:schema:xsd:Retention-1"
				xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
				xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" 
				xmlns:ccts="urn:un:unece:uncefact:documentation:2" 
				xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
                xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="cac cbc ccts ds ext pe qdt sac udt xsi">
	<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes"/>

	<xsl:template name="Cuadros">

		<!-- CREACION DE VARIBLES PARA DISGREGAR LOS DATOS CONCATENADOS EN LA VARIABLE ADICIONAL 30 Y 32 -->
		<xsl:variable name="varPrecinto1" select="substring-before($varPrecinto,'*')"/>
		<xsl:variable name="varPrecinto2"  select="substring-before(substring-after($varPrecinto,'*'),'*')"/>
		<xsl:variable name="varPrecinto3"  select="substring-before(substring-after(substring-after($varPrecinto,'*'),'*'),'*')"/>
		<xsl:variable name="varTaraConte" select="substring-before($varOtrosDeSeccion,'*')"/>
		<xsl:variable name="varTaraCami"  select="substring-before(substring-after($varOtrosDeSeccion,'*'),'*')"/>
		<xsl:variable name="varNroCarre"  select="substring-before(substring-after(substring-after($varOtrosDeSeccion,'*'),'*'),'*')"/>
		<xsl:variable name="varAlmIng"    select="substring-before(substring-after(substring-after(substring-after($varOtrosDeSeccion,'*'),'*'),'*'),'*')"/>
		<xsl:variable name="varRucAlmIng" select="substring-before(substring-after(substring-after(substring-after(substring-after($varOtrosDeSeccion,'*'),'*'),'*'),'*'),'*')"/>
		<xsl:variable name="varAdic1"     select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after($varOtrosDeSeccion,'*'),'*'),'*'),'*'),'*'),'*')"/>
		<xsl:variable name="varAdic2"     select="substring-before(substring-after(substring-after(substring-after(substring-after(substring-after(substring-after($varOtrosDeSeccion,'*'),'*'),'*'),'*'),'*'),'*'),'*')"/>


	
	<xsl:if test="$varPrecinto != '' and $varOtrosDeSeccion != ''">
	
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
				<tr>
					<td>
                     
						<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
							<tr>
<!-- PRECINTO 1 -->				<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>PRECINTO 1</strong></font>
								</td>
<!-- PRECINTO 2 -->				<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>PRECINTO 2</strong></font>
								</td>
<!-- PRECINTO 3 -->				<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>PRECINTO 3</strong></font>
								</td>
<!-- CONTENEDOR -->				<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>CONTENEDOR</strong></font>
								</td>
<!-- TARA CONTENEDOR -->		<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>TARA CONTENEDOR</strong></font>
								</td>
<!-- TARA CAMION -->			<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>TARA CAMION</strong></font>
								</td>
<!-- NRO. CARRETA -->			<td width="10%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>NRO. CARRETA</strong></font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000">
							<tr>
								<td width="100%">

	            					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">

								<tr>
<!-- PRECINTO 1 -->			    	<td width="15%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$varPrecinto1" />
										</font>
									</td>
<!-- PRECINTO 2 -->				    <td width="15%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$varPrecinto2" />
										</font>
									</td>
<!-- PRECINTO 3 -->					<td width="15%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$varPrecinto3" />
										</font>
									</td>
<!-- CONTENEDOR -->					<td width="15%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$varContenedor"/>
										</font>
									</td>
<!-- TARA CONTENEDOR -->			<td width="15%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$varTaraConte"/>
										</font>
									</td>
<!-- TARA CAMION -->				<td width="15%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$varTaraCami"/>
										</font>
									</td>
<!-- NRO. CARRETA -->				<td width="10%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$varNroCarre"/>									
										</font>
									</td>                                
								</tr>
							
									</table>
								</td>
						</tr>
					</table>

				</td>
			</tr>
		</table>

		<table border="0" width="100%" cellpadding="0" cellspacing="2">
				<tr>
					<td>
                     
						<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
							<tr>
<!-- ALMACEN INGRESO -->		<td width="40%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>ALMACEN INGRESO</strong></font>
								</td>
<!-- RUC ALMAC. INGRESO -->		<td width="20%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>RUC ALMACEN INGRESO</strong></font>
								</td>
<!-- ADICIONAL 1 -->			<td width="20%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>ADICIONAL 1</strong></font>
								</td>
<!-- ADICIONAL 2 -->			<td width="20%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>ADICIONAL 2</strong></font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000">
							<tr>
								<td width="100%">
	            					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">

								<tr>
<!-- ALMACEN INGRESO -->	    	<td width="40%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$varAlmIng" />
										</font>
									</td>
<!-- RUC ALMAC. INGRESO -->		    <td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$varRucAlmIng" />
										</font>
									</td>
<!-- ADICIONAL 1 -->				<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$varAdic1" />
										</font>
									</td>
<!-- ADICIONAL 2 -->				<td width="20%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$varAdic2"/>
										</font>
									</td>
								</tr>
							
									</table>
								</td>
						</tr>
					</table>

				</td>
			</tr>
		</table>


	</xsl:if>
	
	<table border="0" width="100%" cellpadding="0" cellspacing="2">
				<tr>
					<td>
                     
						<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
						
							<tr>
<!-- Nro. TRAMO -->				<td width="4%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>TMO.</strong></font>
								</td>
<!-- MODALIDAD -->				<td width="9%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>MOD.<BR/>TRASLADO</strong></font>
								</td>
<!-- FEC. INI. TRASL. -->		<td width="9%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>FEC. INI.<br/>TRASLADO</strong></font>
								</td>
<!-- R.U.C. -->					<td width="12%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>RUC</strong></font>
								</td>
<!-- EMP. TRANSPORTE -->		<td width="45%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>EMP. TRANSPORTE</strong></font>
								</td>
<!-- PLACA -->					<td width="6%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>PLACA</strong></font>
								</td>
<!-- MARCA -->					<td width="15%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>MARCA</strong></font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000">
							<tr>
								<td width="100%">
	            					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
					 				
								<xsl:for-each select="//cac:Shipment/cac:ShipmentStage">
									<!-- CONTADOR EN BUCLE -->
									<xsl:variable name="i" select="position()" />
								<tr>
<!-- NRO. -->				    	<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$i" />
										</font>
									</td>
<!-- MODALIDAD -->				    <td width="9%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:call-template name="tmpModalidadTraslado"/>
										</font>
									</td>
<!-- FEC. INI. TRASL. -->			<td width="9%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="cac:TransitPeriod/cbc:StartDate"/>
										</font>
									</td>
<!-- RUC EMP. TRANSP. -->			<td width="12%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<!--<xsl:value-of select="cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>-->
												<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="12"/>
		</xsl:call-template>
										</font>
									</td>
<!-- EMPR. TRANSP. -->				<td width="45%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:if test="//cbc:CustomizationID='2.0'">
												<!-- <xsl:value-of select="//cac:ShipmentStage/cac:CarrierParty/cac:PartyLegalEntity/cbc:RegistrationName"/> -->
													<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="13"/>
		</xsl:call-template>
											</xsl:if>
											<xsl:if test="//cbc:CustomizationID='1.0'">
												<xsl:value-of select="cac:CarrierParty/cac:PartyName/cbc:Name"/>
											</xsl:if>
										</font>
									</td>
<!-- PLACA -->						<td width="6%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
										<xsl:if test="//cbc:CustomizationID='2.0'">
	<!-- <xsl:value-of select="//cac:Shipment/cac:TransportHandlingUnit/cac:TransportEquipment/cbc:ID"/> -->
	<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="15"/>
		</xsl:call-template>
</xsl:if>
<xsl:if test="//cbc:CustomizationID='1.0'">
		<xsl:value-of select="cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>
</xsl:if>
										</font>
									</td>
<!-- MARCA -->						<td width="15%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:if test="$varMARCATRAMO != ''">
												<xsl:call-template name="tmpMARCASTRAMO">
													<xsl:with-param name="parNroTramo" select="number($i)"/>
													<xsl:with-param name="parNomMarcas" select="$varMARCATRAMO"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$varMARCATRAMO = ''">
												<xsl:value-of select="' '" />
											</xsl:if>
											&#160;
										</font>
									</td>                                
								</tr>
								</xsl:for-each>
							
									</table>
								</td>
						</tr>
					</table>

				</td>
			</tr>
		</table>
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
				<tr>
					<td>
                     
						<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
							<tr>
<!-- Nro. TRAMO -->				<td width="4%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>TMO.</strong></font>
								</td>
<!-- DNI -->					<td width="12%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>DNI</strong></font>
								</td>
<!-- CONDUCTOR -->				<td width="60%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>CONDUCTOR</strong></font>
								</td>
<!-- LICENCIA -->				<td width="12%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>LICENCIA</strong></font>
								</td>	
<!-- CIMTC -->					<td width="12%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>CIMTC</strong></font>
								</td>	
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000">
							<tr>
								<td width="100%">
	            					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
					 				
								<xsl:for-each select="//cac:Shipment/cac:ShipmentStage">
									<!-- CONTADOR EN BUCLE -->
									<xsl:variable name="i" select="position()" />
								<tr>
<!-- NRO. -->				    	<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$i" />
										</font>
									</td>
<!-- DNI -->						<td width="12%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<!--<xsl:if test="$varDNIConductor != ''">
												<xsl:call-template name="tmpDNICONDUCTORES">
													<xsl:with-param name="parNroTramo" select="number($i)"/>
													<xsl:with-param name="parDniConductores" select="$varDNIConductor"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$varDNIConductor = ''">
												<xsl:value-of select="' '" />
											</xsl:if>-->

											<!-- <xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:DriverPerson/cbc:ID" /> -->
											<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="19"/>
		</xsl:call-template>
											&#160;
										</font>
									</td>
<!-- CONDUCTOR -->					<td width="60%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<!--<xsl:if test="$varNomConductor != ''">
												<xsl:call-template name="tmpNOMBRECONDUCTORES">
													<xsl:with-param name="parNroTramo" select="number($i)"/>
													<xsl:with-param name="parNomConductores" select="$varNomConductor"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$varNomConductor = ''">
												<xsl:value-of select="' '" />
											</xsl:if>-->
											<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="20"/>
		</xsl:call-template>
											&#160;
										</font>
									</td>
<!-- LICENCIA -->					<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
										<!--	<xsl:if test="$varLicencia != ''">
												<xsl:call-template name="tmpLICENCIAS">
													<xsl:with-param name="parNroTramo" select="number($i)"/>
													<xsl:with-param name="parLicencia" select="$varLicencia"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$varLicencia = ''">
												<xsl:value-of select="' '" />
											</xsl:if>-->
											<xsl:call-template name="TraeValorVariable">
			<xsl:with-param name="varNumVA"
			                select="21"/>
		</xsl:call-template>
											&#160;
										</font>
									</td>			
<!-- CIMTC -->						<td width="12%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:if test="$varCimtc != ''">
												<xsl:call-template name="tmpCIMTC">
													<xsl:with-param name="parNroTramo" select="number($i)"/>
													<xsl:with-param name="parCimtc" select="$varCimtc"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$varCimtc = ''">
												<xsl:value-of select="' '" />
											</xsl:if>
											&#160;
										</font>
									</td>								
								</tr>
								</xsl:for-each>
							
									</table>
								</td>
							</tr>

						</table>

					</td>
				
				</tr>
			</table>
		<!-- TRAMO: ORIGEN / DESTINO -->
		<table border="0" width="100%" cellpadding="0" cellspacing="2">
				<tr>
					<td>
						<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
							<tr>
<!-- Nro. TRAMO -->				<td width="4%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>TMO.</strong></font>
								</td>
<!-- ORIGEN -->					<td width="48%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>ORIGEN</strong></font>
								</td>
<!-- DESTINO -->				<td width="48%" align="center">
									<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>DESTNO</strong></font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000">
							<tr>
								<td width="100%">
	            					<table rules="cols" border="1" width="100%" bordercolor="#000000" cellpadding="4" cellspacing="0">
					 				
								<xsl:for-each select="//cac:Shipment/cac:ShipmentStage">
									<!-- CONTADOR EN BUCLE -->
									<xsl:variable name="i" select="position()" />
								<tr>
<!-- NRO. -->				    	<td width="4%" align="center">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<xsl:value-of select="$i" />
										</font>
									</td>
<!-- ORIGEN -->						<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											 <xsl:if test="//cbc:CustomizationID='2.0'">
	<xsl:value-of select="//cac:Delivery/cac:Despatch/cac:DespatchAddress/cac:AddressLine/cbc:Line"/>
</xsl:if>
<xsl:if test="//cbc:CustomizationID='1.0'">
	<xsl:value-of select="//cac:Shipment/cac:OriginAddress/cbc:StreetName"/>
</xsl:if>	&#160;
										</font>
									</td>                                
<!-- DESTINO -->					<td width="48%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="0.1">
											<!--<xsl:if test="$varDirDestino != ''">
												<xsl:call-template name="tmpDIRECCIONTRAMO">
													<xsl:with-param name="parNroTramo" select="number($i)"/>
													<xsl:with-param name="parDirecTramo" select="$varDirDestino"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$varDirDestino = ''">
												<xsl:value-of select="' '" />
											</xsl:if>-->
<xsl:if test="//cbc:CustomizationID='2.0'">
	<xsl:if test="//cac:Shipment/cbc:HandlingCode='09'">
 	<xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="27" /></xsl:call-template>
 </xsl:if>
<xsl:if test="//cac:Shipment/cbc:HandlingCode!='09'">
	<xsl:value-of select="//cac:Delivery/cac:DeliveryAddress/cac:AddressLine/cbc:Line"/>
 </xsl:if>
	
</xsl:if>
<xsl:if test="//cbc:CustomizationID='1.0'">
	 <xsl:value-of select="//cac:Shipment/cac:Delivery/cac:DeliveryAddress/cbc:StreetName"/>
</xsl:if>
											&#160;
										</font>
									</td>                                

								</tr>
								</xsl:for-each>
							
									</table>
								</td>
							</tr>

						</table>

					</td>
				</tr>
			</table>


		
	</xsl:template>
	<xsl:template name="CuadroPiePaginaNew">
<!-- <table border="1" width="100%" cellpadding="0" cellspacing="2"> -->
<table rules="all" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
				<tr>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Tramo 3</strong></font>
					</td>
					<td width="40%" align="left" colspan="4"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="10" /></xsl:call-template>
					</font>
					</td>
					
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Tramo 4</strong></font>
					</td>
					<td width="40%" align="left" colspan="4"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="11" /></xsl:call-template>
					</font>
					</td>
					
					<!--<td width="40%" align="left"><font face="Arial, Helvetica, sans-serif" size="0.1"></font></td>
					<td width="40%" align="left"><font face="Arial, Helvetica, sans-serif" size="0.1"></font></td>
					<td width="40%" align="left"><font face="Arial, Helvetica, sans-serif" size="0.1"></font></td>
					<td width="40%" align="left"><font face="Arial, Helvetica, sans-serif" size="0.1"></font></td>
					<td width="40%" align="left"><font face="Arial, Helvetica, sans-serif" size="0.1"></font></td>
					<td width="40%" align="left"><font face="Arial, Helvetica, sans-serif" size="0.1"></font></td>
					 colspan="2" -->
				</tr>
				<tr>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Almacén de ingreso</strong></font>
					</td>
					<td align="left" width="10%"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="08" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Ruc de almacén de ingreso</strong></font>
					</td>
					<td align="left" width="10%" ><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="09" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Número de precinto</strong></font>
					</td>
					<td align="left" width="10%"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="05" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Número de precinto AD</strong></font>
					</td>
					<td align="left"  width="10%"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="06" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Número de contenedor</strong></font>
					</td>
					<td align="left" width="10%"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="07" /></xsl:call-template>
					</font> </td>
				</tr>
			</table>

			
</xsl:template>
<xsl:template name="CuadroPiePagina">
<!-- <table border="1" width="100%" cellpadding="0" cellspacing="2"> -->
<table rules="all" border="1" width="100%" bordercolor="#000000" cellpadding="2" cellspacing="0">
				<tr>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Número de precinto</strong></font>
					</td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="5" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Ruc de almacén de Ingreso</strong></font>
					</td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="9" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Número de precinto AD</strong></font>
					</td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="6" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Número de contenedor</strong></font>
					</td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="7" /></xsl:call-template>
					</font> </td>
				</tr>
				<tr>
					<td width="12%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>Almacén de ingreso</strong></font>
					</td>
					<td align="left"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="8" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>TRAMO 3</strong></font>
					</td>
					<td align="left" colspan="2"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="10" /></xsl:call-template>
					</font> </td>
					<td width="10%">
						<font face="Arial, Helvetica, sans-serif" size="0.1"><strong>TRAMO 4</strong></font>
					</td>
					<td align="left" colspan="2"><font face="Arial, Helvetica, sans-serif" size="0.1">
					  <xsl:call-template name="TraeValorVariable"><xsl:with-param name="varNumVA" select="11" /></xsl:call-template>
					</font> </td>
				</tr>
			</table>

			
</xsl:template>


	<xsl:template name="CuadrosORIGINAL">
		<br/>
		<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000001">
			<tbody>
				<tr>
					<td width="35%">
						<table border="0" width="100%" cellpadding="0" cellspacing="0" >
							<tbody>
								<tr>
									 <td width="100%" align="left">
									
                         <table border="1" width="70%" cellpadding="0" cellspacing="0" bordercolor="#000000">
							<!--<tbody>-->
								<tr>
									<td width="100%" align="center" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<b>UNIDAD DE TRANSPORTE Y CONDUCTOR</b>
										</font>
									</td>
								</tr>
								<tr>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										TRANSPORTISTA: 
										</font>
									</td>
									<td width="60%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										DNI/RUC: 
										</font>
									</td>
									<td width="60%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="40%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										PLACA DEL VEHICULO: 
										</font>
									</td>
									<td width="60%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:TransportMeans/cac:RoadTransport/cbc:LicensePlateID"/>
										</font>
									</td>
								</tr>
							<!--</tbody>-->
						</table>

								</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="35%">
					</td>
					
					
					<td width="25%">
						<table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolor="#000000">
							<tbody>
								<tr>
									<td width="100%" align="center" colspan="2">
										<font face="Arial, Helvetica, sans-serif" size="2">
										<b>EMPRESA DE TRANSPORTES</b>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										RAZON SOCIAL: 
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyName/cbc:Name"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										RUC: 
										</font>
									</td>
									<td width="50%" align="left">
										<font face="Arial, Helvetica, sans-serif" size="1">
										<xsl:value-of select="//cac:Shipment/cac:ShipmentStage/cac:CarrierParty/cac:PartyIdentification/cbc:ID"/>
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


	<xsl:template name="Simbolo_Moneda">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='PEN'">S/.</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='USD'">$</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:DocumentCurrencyCode='EUR'">E</xsl:when>
			
			<xsl:otherwise>OTRA MONEDA</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="/">
		<html>
			<head></head>
			<body/>
		</html>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\Panasonic\Formato_PanasonicV1.1\20100165849&#x2D;01&#x2D;F301&#x2D;00000280.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="20254053822&#x2D;01&#x2D;FF11&#x2D;10331676.xml" srcSchemaRoot="Invoice" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template name="son&#x2D;pesos"><block path="table/td/font/xsl:for&#x2D;each" x="410" y="60"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if/=[0]" x="314" y="88"/><block path="table/td/font/xsl:for&#x2D;each/xsl:if" x="360" y="90"/><block path="table/td/font/xsl:for&#x2D;each[1]" x="300" y="30"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/=[0]" x="204" y="58"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if" x="250" y="60"/><block path="table/td/font/xsl:for&#x2D;each[1]/xsl:if/xsl:value&#x2D;of" x="320" y="90"/><block path="table/td/font/xsl:for&#x2D;each[2]" x="340" y="30"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/=[0]" x="84" y="58"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if" x="130" y="60"/><block path="table/td/font/xsl:for&#x2D;each[2]/xsl:if/xsl:value&#x2D;of" x="200" y="90"/></template><template name="Total"></template><template match="/"></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->